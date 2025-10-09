import Foundation
import SwiftData

/// Progreso general en el módulo "Te Amo Cuando Estás Enojado"
@Model
final class TA9Progress {
    @Attribute(.unique) var id: UUID
    var startDate: Date
    var capasCompletadas: [Int]
    var badgesUnlocked: Int
    var totalBadges: Int
    var emotionsValidated: Int
    var storiesRead: Int
    var ritualsCompleted: Int
    var diasActivo: Int
    
    init(
        startDate: Date = Date(),
        capasCompletadas: [Int] = [],
        badgesUnlocked: Int = 0,
        totalBadges: Int = 12,
        emotionsValidated: Int = 0,
        storiesRead: Int = 0,
        ritualsCompleted: Int = 0,
        diasActivo: Int = 0
    ) {
        self.id = UUID()
        self.startDate = startDate
        self.capasCompletadas = capasCompletadas
        self.badgesUnlocked = badgesUnlocked
        self.totalBadges = totalBadges
        self.emotionsValidated = emotionsValidated
        self.storiesRead = storiesRead
        self.ritualsCompleted = ritualsCompleted
        self.diasActivo = diasActivo
    }
    
    var progressPercentage: Double {
        Double(capasCompletadas.count) / 9.0
    }
}

