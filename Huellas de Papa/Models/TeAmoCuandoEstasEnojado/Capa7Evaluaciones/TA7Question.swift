import Foundation
import SwiftData

/// Pregunta de autoevaluación para el padre
/// Basada en el libro "¡Te amo cuando estás enojado!" de Erin Winters
@Model
final class TA7Question {
    @Attribute(.unique) var id: UUID
    var category: String
    var text: String
    var type: QuestionType
    var options: [String]?
    var feedbacks: [String: TA7Feedback] // Feedback por cada opción/respuesta
    var weight: Double
    var order: Int
    var bookReference: String
    
    enum QuestionType: String, Codable {
        case scale = "Escala 1-5"
        case yesNo = "Sí/No"
        case multipleChoice = "Opción Múltiple"
        case scenario = "Escenario con opciones"
    }
    
    init(
        category: String,
        text: String,
        type: QuestionType,
        options: [String]? = nil,
        feedbacks: [String: TA7Feedback] = [:],
        weight: Double = 1.0,
        order: Int,
        bookReference: String
    ) {
        self.id = UUID()
        self.category = category
        self.text = text
        self.type = type
        self.options = options
        self.feedbacks = feedbacks
        self.weight = weight
        self.order = order
        self.bookReference = bookReference
    }
}

