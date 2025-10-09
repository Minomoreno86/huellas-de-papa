import Foundation

/// Respuesta del usuario a una pregunta
struct CN7Response: Codable, Identifiable {
    let id: UUID
    let questionId: UUID
    let answer: String
    let isCorrect: Bool?                // nil para auto-evaluaciones, true/false para preguntas con respuesta correcta
    let timestamp: Date
    
    init(questionId: UUID, answer: String, isCorrect: Bool? = nil) {
        self.id = UUID()
        self.questionId = questionId
        self.answer = answer
        self.isCorrect = isCorrect
        self.timestamp = Date()
    }
}

