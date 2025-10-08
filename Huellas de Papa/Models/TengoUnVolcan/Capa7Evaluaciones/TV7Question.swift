import Foundation
import SwiftData

/// Pregunta de autoevaluación para padres
/// Basada en los conceptos del libro de Míriam Tirado
@Model
final class TV7Question {
    @Attribute(.unique) var id: UUID
    var category: String // "Comprensión", "Aplicación", "Modelaje", "Co-regulación"
    var text: String
    var type: QuestionType
    var options: [String]?
    var weight: Double // 0.0-1.0
    var order: Int
    var relatedCapa: String // "Capa 1", "Capa 3", etc.
    
    enum QuestionType: String, Codable {
        case scale = "Escala 1-5"
        case yesNo = "Sí/No"
        case multipleChoice = "Opción Múltiple"
        case reflection = "Reflexión Abierta"
    }
    
    init(
        category: String,
        text: String,
        type: QuestionType,
        options: [String]? = nil,
        weight: Double = 1.0,
        order: Int,
        relatedCapa: String
    ) {
        self.id = UUID()
        self.category = category
        self.text = text
        self.type = type
        self.options = options
        self.weight = weight
        self.order = order
        self.relatedCapa = relatedCapa
    }
}

