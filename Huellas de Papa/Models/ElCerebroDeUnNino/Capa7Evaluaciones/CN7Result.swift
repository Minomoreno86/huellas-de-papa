import Foundation

/// Resultado de una evaluación completa
struct CN7Result: Codable, Identifiable {
    let id: UUID
    let evaluationType: EvaluationType
    let totalQuestions: Int
    let correctAnswers: Int
    let scorePercentage: Double
    let areasStrong: [String]           // Áreas donde el padre está fuerte
    let areasToImprove: [String]        // Áreas que necesita practicar
    let recommendations: [String]       // Recomendaciones específicas
    let completedAt: Date
    
    enum EvaluationType: String, Codable {
        case comprehension = "Comprensión del Libro"
        case application = "Aplicación Práctica"
        case selfAssessment = "Auto-Evaluación"
    }
    
    init(evaluationType: EvaluationType, totalQuestions: Int, correctAnswers: Int, areasStrong: [String], areasToImprove: [String], recommendations: [String]) {
        self.id = UUID()
        self.evaluationType = evaluationType
        self.totalQuestions = totalQuestions
        self.correctAnswers = correctAnswers
        self.scorePercentage = Double(correctAnswers) / Double(totalQuestions) * 100
        self.areasStrong = areasStrong
        self.areasToImprove = areasToImprove
        self.recommendations = recommendations
        self.completedAt = Date()
    }
}

