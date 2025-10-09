import Foundation
import SwiftData

/// Respuesta del padre a una pregunta de evaluación
@Model
final class TA7Response {
    @Attribute(.unique) var id: UUID
    var questionId: UUID
    var answer: String
    var feedback: String
    var score: Int
    var timestamp: Date
    
    init(questionId: UUID, answer: String, feedback: String, score: Int, timestamp: Date = Date()) {
        self.id = UUID()
        self.questionId = questionId
        self.answer = answer
        self.feedback = feedback
        self.score = score
        self.timestamp = timestamp
    }
}

