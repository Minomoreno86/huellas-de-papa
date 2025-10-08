import Foundation
import SwiftData

/// Gestor de crecimiento para el Círculo de Crecimiento
class C9GrowthManager {
    
    /// Registra un evento de crecimiento desde otras capas
    static func registerGrowth(
        fromLayer: String,
        refId: UUID? = nil,
        pillar: String? = nil,
        event: String,
        context: ModelContext
    ) {
        // 1. Crear enlace
        let link = C9Links(
            fromLayer: fromLayer,
            refId: refId,
            pillar: pillar,
            growthEvent: event
        )
        context.insert(link)
        
        // 2. Actualizar árbol
        let descriptor = FetchDescriptor<C9GrowthTree>()
        if let tree = try? context.fetch(descriptor).first {
            switch event {
            case "seed":
                tree.leaves += 1
            case "leaf":
                tree.leaves += 2
            case "blossom":
                tree.blossoms += 1
                tree.leaves += 5
            default:
                break
            }
            tree.lastEvent = event
            tree.lastUpdated = Date()
            
            // Evaluar nivel
            let totalGrowth = tree.leaves + (tree.blossoms * 10)
            tree.level = max(1, totalGrowth / 15)
        } else {
            // Crear árbol inicial
            let newTree = C9GrowthTree()
            newTree.leaves = event == "seed" ? 1 : (event == "leaf" ? 2 : 5)
            newTree.blossoms = event == "blossom" ? 1 : 0
            newTree.lastEvent = event
            newTree.lastUpdated = Date()
            context.insert(newTree)
        }
        
        // 3. Actualizar progreso
        let progressDescriptor = FetchDescriptor<C9Progress>()
        if let progress = try? context.fetch(progressDescriptor).first {
            progress.totalSessions += 1
            progress.lastUpdated = Date()
            
            // Actualizar pilar dominante
            if let pillar = pillar {
                updateDominantPillar(progress: progress, newPillar: pillar, context: context)
            }
        } else {
            // Crear progreso inicial
            let newProgress = C9Progress()
            newProgress.totalSessions = 1
            newProgress.lastUpdated = Date()
            newProgress.dominantPillar = pillar
            context.insert(newProgress)
        }
        
        // 4. Evaluar desbloqueo de badges
        evaluateBadgeUnlock(pillar: pillar, context: context)
        
        // 5. Persistir
        try? context.save()
    }
    
    /// Actualiza el pilar dominante basado en las últimas acciones
    private static func updateDominantPillar(
        progress: C9Progress,
        newPillar: String,
        context: ModelContext
    ) {
        // Obtener últimos 5 links
        var descriptor = FetchDescriptor<C9Links>(
            sortBy: [SortDescriptor(\.timestamp, order: .reverse)]
        )
        descriptor.fetchLimit = 5
        
        if let recentLinks = try? context.fetch(descriptor) {
            let pillarCounts = recentLinks.compactMap { $0.pillar }.reduce(into: [:]) { counts, pillar in
                counts[pillar, default: 0] += 1
            }
            
            if let dominant = pillarCounts.max(by: { $0.value < $1.value })?.key {
                progress.dominantPillar = dominant
            }
        }
    }
    
    /// Evalúa si se debe desbloquear un badge
    private static func evaluateBadgeUnlock(
        pillar: String?,
        context: ModelContext
    ) {
        guard let pillar = pillar else { return }
        
        // Contar eventos del pilar
        let descriptor = FetchDescriptor<C9Links>()
        if let links = try? context.fetch(descriptor) {
            let pillarCount = links.filter { $0.pillar == pillar }.count
            
            // Desbloquear badge cada 5 eventos del mismo pilar
            if pillarCount > 0 && pillarCount % 5 == 0 {
                unlockBadge(for: pillar, context: context)
            }
        }
    }
    
    /// Desbloquea un badge específico
    private static func unlockBadge(for pillar: String, context: ModelContext) {
        let badgeDescriptor = FetchDescriptor<C9Badge>()
        if let badges = try? context.fetch(badgeDescriptor) {
            // Buscar un badge no desbloqueado del pilar
            if let badge = badges.first(where: { $0.pillar == pillar && $0.unlockedAt == nil }) {
                badge.unlockedAt = Date()
                
                // Actualizar contador en progreso
                let progressDescriptor = FetchDescriptor<C9Progress>()
                if let progress = try? context.fetch(progressDescriptor).first {
                    progress.badgesUnlocked += 1
                }
            }
        }
    }
}

