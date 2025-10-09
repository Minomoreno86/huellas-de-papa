import Foundation
import SwiftUI
import Combine

// MARK: - User Progress Manager
// Sistema centralizado de tracking y desbloqueo de logros
// Basado en "El cerebro del niño explicado a los padres" de Álvaro Bilbao

/// Singleton que gestiona todo el progreso del usuario a través de las capas
class UserProgressManager: ObservableObject {
    static let shared = UserProgressManager()
    
    // MARK: - Published Properties
    @Published var unlockedBadges: Set<String> = []
    @Published var actionCounts: [UserAction: Int] = [:]
    @Published var recentlyUnlockedBadge: Capa9Badge?
    @Published var showBadgeUnlockAnimation = false
    
    // MARK: - Constants
    private let userDefaultsKey = "UserProgressData"
    private let badgeCriteriaKey = "BadgeCriteria"
    
    // MARK: - Initialization
    private init() {
        loadProgress()
    }
    
    // MARK: - Action Recording
    
    /// Registra una acción del usuario y verifica si desbloquea badges
    func recordAction(_ action: UserAction) {
        // Incrementar contador de acción
        actionCounts[action, default: 0] += 1
        
        // Guardar progreso
        saveProgress()
        
        // Verificar desbloqueo de badges
        checkBadgeUnlocks()
        
        // Notificar para analytics (opcional)
        NotificationCenter.default.post(
            name: .userActionRecorded,
            object: action
        )
    }
    
    /// Registra múltiples acciones a la vez
    func recordActions(_ actions: [UserAction]) {
        actions.forEach { action in
            actionCounts[action, default: 0] += 1
        }
        saveProgress()
        checkBadgeUnlocks()
    }
    
    // MARK: - Badge Management
    
    /// Verifica todos los criterios y desbloquea badges si corresponde
    private func checkBadgeUnlocks() {
        let allCriteria = BadgeCriteria.allCriteria
        
        for (badgeId, criteria) in allCriteria {
            // Si ya está desbloqueado, skip
            if unlockedBadges.contains(badgeId) { continue }
            
            // Verificar si cumple el criterio
            if criteria.isMet(with: actionCounts) {
                unlockBadge(badgeId)
            }
        }
    }
    
    /// Desbloquea un badge y muestra animación
    private func unlockBadge(_ badgeId: String) {
        guard !unlockedBadges.contains(badgeId) else { return }
        
        unlockedBadges.insert(badgeId)
        
        // Buscar el badge en los predefinidos
        if let badge = Capa9CirculoDeCrecimiento.predefinedBadges.first(where: { $0.id.uuidString == badgeId }) {
            DispatchQueue.main.async {
                self.recentlyUnlockedBadge = badge
                self.showBadgeUnlockAnimation = true
                
                // Reproducir háptico de celebración
                let impactHeavy = UIImpactFeedbackGenerator(style: .heavy)
                impactHeavy.impactOccurred()
                
                // Auto-ocultar después de 3 segundos
                DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                    self.showBadgeUnlockAnimation = false
                }
            }
        }
        
        saveProgress()
    }
    
    /// Verifica si un badge está desbloqueado
    func isBadgeUnlocked(_ badgeId: String) -> Bool {
        return unlockedBadges.contains(badgeId)
    }
    
    /// Obtiene el progreso hacia un badge específico
    func progressTowards(_ badgeId: String) -> Double {
        guard let criteria = BadgeCriteria.allCriteria[badgeId] else { return 0 }
        return criteria.progress(with: actionCounts)
    }
    
    // MARK: - Statistics
    
    /// Obtiene el total de una acción específica
    func getActionCount(_ action: UserAction) -> Int {
        return actionCounts[action] ?? 0
    }
    
    /// Obtiene el total de badges desbloqueados
    var totalUnlockedBadges: Int {
        return unlockedBadges.count
    }
    
    /// Obtiene el progreso general (0.0 - 1.0)
    var overallProgress: Double {
        let totalBadges = Capa9CirculoDeCrecimiento.predefinedBadges.count
        guard totalBadges > 0 else { return 0 }
        return Double(unlockedBadges.count) / Double(totalBadges)
    }
    
    // MARK: - Persistence
    
    private func saveProgress() {
        let data = ProgressData(
            unlockedBadges: Array(unlockedBadges),
            actionCounts: actionCounts.mapKeys { $0.rawValue }
        )
        
        if let encoded = try? JSONEncoder().encode(data) {
            UserDefaults.standard.set(encoded, forKey: userDefaultsKey)
        }
    }
    
    private func loadProgress() {
        guard let data = UserDefaults.standard.data(forKey: userDefaultsKey),
              let decoded = try? JSONDecoder().decode(ProgressData.self, from: data) else {
            return
        }
        
        unlockedBadges = Set(decoded.unlockedBadges)
        actionCounts = decoded.actionCounts.compactMapKeys { UserAction(rawValue: $0) }
    }
    
    /// Resetea todo el progreso (solo para desarrollo/testing)
    func resetProgress() {
        unlockedBadges.removeAll()
        actionCounts.removeAll()
        saveProgress()
    }
}

// MARK: - User Actions (Acciones rastreables)

enum UserAction: String, Codable, Hashable {
    // Capa 3 - Herramientas
    case usedToolNameIt = "tool_name_it"
    case usedToolPausaadulto = "tool_pausa_adulto"
    case usedToolSemaforo = "tool_semaforo"
    case usedToolRitual = "tool_ritual"
    case completedTool = "completed_tool"
    
    // Capa 4 - Simulaciones
    case completedSimulationExcellent = "sim_excellent"
    case completedSimulationGood = "sim_good"
    case completedSimulationNeedsImprovement = "sim_needs_improvement"
    case usedConnectionInSimulation = "sim_connection"
    case usedRegulationInSimulation = "sim_regulation"
    
    // Capa 5 - Aplicación en Casa
    case completedRoutine = "routine_completed"
    case completedHabit = "habit_completed"
    case completedChallenge = "challenge_completed"
    case dailyReflection = "daily_reflection"
    
    // Capa 8 - Modo Niño
    case completedDailyConnection = "activity_daily_connection"
    case completedBrainEmotionGame = "activity_brain_emotion"
    case completedLanguageActivity = "activity_language"
    case completedRolePlay = "activity_roleplay"
    case completedGuidedStory = "activity_story"
    
    // Capa 9 - Misiones
    case completedWeeklyMission = "mission_completed"
    case consecutiveDaysPractice = "consecutive_days"
    
    // General
    case dailyLogin = "daily_login"
    case completedModule = "module_completed"
}

// MARK: - Badge Criteria (Criterios de desbloqueo)

struct BadgeCriteria {
    let requiredActions: [UserAction: Int]
    let anyOf: Bool // true = cumplir cualquiera, false = cumplir todos
    
    /// Verifica si el criterio está cumplido
    func isMet(with actionCounts: [UserAction: Int]) -> Bool {
        if anyOf {
            // Cumplir al menos uno
            return requiredActions.contains { action, required in
                (actionCounts[action] ?? 0) >= required
            }
        } else {
            // Cumplir todos
            return requiredActions.allSatisfy { action, required in
                (actionCounts[action] ?? 0) >= required
            }
        }
    }
    
    /// Calcula el progreso hacia el criterio (0.0 - 1.0)
    func progress(with actionCounts: [UserAction: Int]) -> Double {
        let progresses = requiredActions.map { action, required -> Double in
            let current = Double(actionCounts[action] ?? 0)
            let target = Double(required)
            return min(current / target, 1.0)
        }
        
        if anyOf {
            return progresses.max() ?? 0.0
        } else {
            return progresses.reduce(0, +) / Double(progresses.count)
        }
    }
    
    // MARK: - Definición de Criterios para cada Badge
    
    static let allCriteria: [String: BadgeCriteria] = [
        // 🎧 Escucha Activa
        "badge_escucha_activa": BadgeCriteria(
            requiredActions: [
                .usedToolNameIt: 5,
                .completedTool: 10
            ],
            anyOf: false
        ),
        
        // ⏸️ Pausa Serena
        "badge_pausa_serena": BadgeCriteria(
            requiredActions: [
                .usedToolPausaadulto: 10,
                .usedRegulationInSimulation: 5
            ],
            anyOf: false
        ),
        
        // ✅ Validación Emocional
        "badge_validacion": BadgeCriteria(
            requiredActions: [
                .usedToolNameIt: 15,
                .usedConnectionInSimulation: 10
            ],
            anyOf: false
        ),
        
        // ❤️ Conexión Profunda
        "badge_conexion_profunda": BadgeCriteria(
            requiredActions: [
                .completedDailyConnection: 20,
                .usedToolRitual: 10
            ],
            anyOf: false
        ),
        
        // 💡 Sabiduría Parental
        "badge_sabiduria": BadgeCriteria(
            requiredActions: [
                .completedWeeklyMission: 3,
                .completedSimulationExcellent: 5
            ],
            anyOf: false
        ),
        
        // 🌱 Presencia Consciente
        "badge_presencia": BadgeCriteria(
            requiredActions: [
                .consecutiveDaysPractice: 30,
                .dailyReflection: 30
            ],
            anyOf: false
        ),
        
        // 👥 Co-regulador
        "badge_coregulador": BadgeCriteria(
            requiredActions: [
                .completedSimulationExcellent: 10,
                .usedRegulationInSimulation: 15
            ],
            anyOf: false
        ),
        
        // 🛡️ Maestro de Límites
        "badge_maestro_limites": BadgeCriteria(
            requiredActions: [
                .completedTool: 20,
                .completedSimulationGood: 10
            ],
            anyOf: false
        )
    ]
}

// MARK: - Progress Data (para persistencia)

private struct ProgressData: Codable {
    let unlockedBadges: [String]
    let actionCounts: [String: Int]
}

// MARK: - Notification Names

extension Notification.Name {
    static let userActionRecorded = Notification.Name("userActionRecorded")
    static let badgeUnlocked = Notification.Name("badgeUnlocked")
}

// MARK: - Dictionary Extensions

extension Dictionary {
    func mapKeys<T: Hashable>(_ transform: (Key) -> T) -> [T: Value] {
        return Dictionary<T, Value>(uniqueKeysWithValues: map { (transform($0.key), $0.value) })
    }
    
    func compactMapKeys<T: Hashable>(_ transform: (Key) -> T?) -> [T: Value] {
        return Dictionary<T, Value>(uniqueKeysWithValues: compactMap { key, value in
            guard let newKey = transform(key) else { return nil }
            return (newKey, value)
        })
    }
}

