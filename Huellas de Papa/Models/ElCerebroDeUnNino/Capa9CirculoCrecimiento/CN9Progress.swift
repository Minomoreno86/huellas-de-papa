import Foundation

/// Sistema de progreso del círculo de crecimiento
struct CN9Progress: Codable {
    var badgesUnlocked: Set<UUID>       // IDs de medallas desbloqueadas
    var currentStageLevel: Int          // 1-5
    var totalPracticeHours: Double      // Horas acumuladas practicando
    var strategiesUsed: [Int: Int]      // [strategyNumber: timesUsed]
    var startDate: Date
    var lastActivityDate: Date
    
    init() {
        self.badgesUnlocked = []
        self.currentStageLevel = 1
        self.totalPracticeHours = 0.0
        self.strategiesUsed = [:]
        self.startDate = Date()
        self.lastActivityDate = Date()
    }
    
    mutating func unlockBadge(_ badgeId: UUID) {
        badgesUnlocked.insert(badgeId)
        updateStageLevel()
    }
    
    mutating func recordStrategyUse(_ strategyNumber: Int) {
        strategiesUsed[strategyNumber, default: 0] += 1
        lastActivityDate = Date()
    }
    
    mutating func addPracticeTime(_ hours: Double) {
        totalPracticeHours += hours
    }
    
    private mutating func updateStageLevel() {
        let count = badgesUnlocked.count
        if count >= 12 {
            currentStageLevel = 5
        } else if count >= 9 {
            currentStageLevel = 4
        } else if count >= 6 {
            currentStageLevel = 3
        } else if count >= 3 {
            currentStageLevel = 2
        } else {
            currentStageLevel = 1
        }
    }
    
    func progressPercentage() -> Double {
        return Double(badgesUnlocked.count) / 12.0 * 100
    }
}

