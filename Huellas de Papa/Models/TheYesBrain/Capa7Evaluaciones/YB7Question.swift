import Foundation
import SwiftData

/// Pregunta o ítem de evaluación del Yes Brain
@Model
final class YB7Question {
    @Attribute(.unique) var id: UUID
    var pillar: String              // "Balance", "Resiliencia", "Insight", "Empatía"
    var text: String
    var type: String                // "scale", "choice", "scenario"
    var options: [String]?
    var weight: Double              // influencia en el puntaje final (0.0-1.0)
    var order: Int                  // orden de presentación
    
    init(
        pillar: String,
        text: String,
        type: String,
        options: [String]? = nil,
        weight: Double = 1.0,
        order: Int
    ) {
        self.id = UUID()
        self.pillar = pillar
        self.text = text
        self.type = type
        self.options = options
        self.weight = weight
        self.order = order
    }
}

