import Foundation
import SwiftData

/// Representa el progreso del usuario en el plan de entrenamiento
@Model
final class YBProgress {
    var totalCompleted: Int
    var currentStreak: Int
    var lastDayCompleted: Int?
    var lastUpdated: Date?
    var longestStreak: Int          // Racha más larga alcanzada
    var startDate: Date?            // Fecha de inicio del plan
    
    init(
        totalCompleted: Int = 0,
        currentStreak: Int = 0,
        lastDayCompleted: Int? = nil,
        lastUpdated: Date? = nil,
        longestStreak: Int = 0,
        startDate: Date? = nil
    ) {
        self.totalCompleted = totalCompleted
        self.currentStreak = currentStreak
        self.lastDayCompleted = lastDayCompleted
        self.lastUpdated = lastUpdated
        self.longestStreak = longestStreak
        self.startDate = startDate
    }
}

