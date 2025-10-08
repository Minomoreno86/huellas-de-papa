import Foundation
import SwiftData

/// Representa un día de entrenamiento del plan de 28 días del Yes Brain
@Model
final class YBTrainingDay {
    @Attribute(.unique) var id: UUID
    var dayNumber: Int
    var phase: String               // "Balance", "Resiliencia", "Insight", "Empatía"
    var theme: String               // "Calma antes que control", etc.
    var challenge: String           // Reto del día
    var actionSteps: [String]       // 3 pasos concretos
    var reflection: String          // 1 frase de insight
    var rewardPhrase: String        // "Hoy elegiste conexión."
    var completed: Bool
    var completedAt: Date?
    var icon: String                // Nombre del ícono SF Symbol
    var color: String               // Color principal de la fase
    
    init(
        dayNumber: Int,
        phase: String,
        theme: String,
        challenge: String,
        actionSteps: [String],
        reflection: String,
        rewardPhrase: String,
        completed: Bool = false,
        completedAt: Date? = nil,
        icon: String,
        color: String
    ) {
        self.id = UUID()
        self.dayNumber = dayNumber
        self.phase = phase
        self.theme = theme
        self.challenge = challenge
        self.actionSteps = actionSteps
        self.reflection = reflection
        self.rewardPhrase = rewardPhrase
        self.completed = completed
        self.completedAt = completedAt
        self.icon = icon
        self.color = color
    }
}

