import Foundation
import SwiftData

/// Respuesta del padre a una pregunta de evaluación
@Model
final class TV7Response {
    @Attribute(.unique) var id: UUID
    var questionId: UUID
    var answer: String // Puede ser "4" (escala), "Sí", texto libre, etc.
    var date: Date
    
    init(questionId: UUID, answer: String, date: Date = Date()) {
        self.id = UUID()
        self.questionId = questionId
        self.answer = answer
        self.date = date
    }
}

