import Foundation

/// Feedback inmediato basado en la respuesta del padre
/// Incluye sabiduría del libro de Erin Winters
struct TA7Feedback: Codable {
    let message: String
    let bookQuote: String
    let recommendation: String
    let score: Int // 0-100
    let type: FeedbackType
    
    enum FeedbackType: String, Codable {
        case excellent = "Excelente"
        case good = "Bien"
        case needsWork = "Área de mejora"
        case critical = "Requiere atención"
    }
    
    init(message: String, bookQuote: String, recommendation: String, score: Int, type: FeedbackType) {
        self.message = message
        self.bookQuote = bookQuote
        self.recommendation = recommendation
        self.score = score
        self.type = type
    }
}

