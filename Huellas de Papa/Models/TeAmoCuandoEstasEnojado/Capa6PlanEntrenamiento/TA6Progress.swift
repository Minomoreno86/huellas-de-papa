import Foundation
import SwiftData

/// Progreso general del padre en el entrenamiento
@Model
final class TA6Progress {
    @Attribute(.unique) var id: UUID
    var currentLevel: Int
    var emotionsValidated: [String: Int] // Emoción: cantidad de veces validada
    var totalValidations: Int
    var daysActive: Int
    var lastActivityDate: Date?
    var badges: [UUID] // IDs de badges desbloqueados
    var personalNotes: String?
    
    init(
        currentLevel: Int = 1,
        emotionsValidated: [String: Int] = [:],
        totalValidations: Int = 0,
        daysActive: Int = 0,
        lastActivityDate: Date? = nil,
        badges: [UUID] = [],
        personalNotes: String? = nil
    ) {
        self.id = UUID()
        self.currentLevel = currentLevel
        self.emotionsValidated = emotionsValidated
        self.totalValidations = totalValidations
        self.daysActive = daysActive
        self.lastActivityDate = lastActivityDate
        self.badges = badges
        self.personalNotes = personalNotes
    }
    
    func recordValidation(emotion: String) {
        emotionsValidated[emotion, default: 0] += 1
        totalValidations += 1
        
        let calendar = Calendar.current
        if let lastDate = lastActivityDate {
            if !calendar.isDate(lastDate, inSameDayAs: Date()) {
                daysActive += 1
            }
        } else {
            daysActive = 1
        }
        lastActivityDate = Date()
    }
}

