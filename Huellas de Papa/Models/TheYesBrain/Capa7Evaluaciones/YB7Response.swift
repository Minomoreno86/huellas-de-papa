import Foundation
import SwiftData

/// Respuesta del usuario a una pregunta de evaluación
@Model
final class YB7Response {
    @Attribute(.unique) var id: UUID
    var questionId: UUID
    var answer: String
    var score: Double               // 0-100
    var completedAt: Date
    
    init(
        questionId: UUID,
        answer: String,
        score: Double,
        completedAt: Date = Date()
    ) {
        self.id = UUID()
        self.questionId = questionId
        self.answer = answer
        self.score = score
        self.completedAt = completedAt
    }
}

