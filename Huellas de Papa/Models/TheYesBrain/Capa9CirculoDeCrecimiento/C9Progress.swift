import Foundation
import SwiftData

/// Representa el progreso global del usuario en el círculo
@Model
final class C9Progress {
    @Attribute(.unique) var id: UUID
    var totalSessions: Int
    var currentCycle: Int
    var lastUpdated: Date?
    var dominantPillar: String?
    var badgesUnlocked: Int
    var currentStage: String    // Nombre del stage actual
    
    init(
        totalSessions: Int = 0,
        currentCycle: Int = 1,
        lastUpdated: Date? = nil,
        dominantPillar: String? = nil,
        badgesUnlocked: Int = 0,
        currentStage: String = "Conexión"
    ) {
        self.id = UUID()
        self.totalSessions = totalSessions
        self.currentCycle = currentCycle
        self.lastUpdated = lastUpdated
        self.dominantPillar = dominantPillar
        self.badgesUnlocked = badgesUnlocked
        self.currentStage = currentStage
    }
}

