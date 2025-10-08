import Foundation
import SwiftData

/// Resultado integrado por pilar del Yes Brain
@Model
final class YB7Result {
    @Attribute(.unique) var id: UUID
    var pillar: String              // "Balance", "Resiliencia", "Insight", "Empatía"
    var score: Double               // 0–100
    var level: String               // "Inicial", "Progresando", "Integrado"
    var feedback: String            // frase personalizada
    var icon: String                // SF Symbol
    var color: String               // color del pilar
    
    init(
        pillar: String,
        score: Double,
        level: String,
        feedback: String,
        icon: String,
        color: String
    ) {
        self.id = UUID()
        self.pillar = pillar
        self.score = score
        self.level = level
        self.feedback = feedback
        self.icon = icon
        self.color = color
    }
}

