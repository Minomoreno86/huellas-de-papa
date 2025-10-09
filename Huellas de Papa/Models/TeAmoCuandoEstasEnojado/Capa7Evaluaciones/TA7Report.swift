import Foundation

/// Reporte generado después de completar la autoevaluación
/// Incluye análisis personalizado basado en el libro
struct TA7Report: Identifiable {
    let id = UUID()
    let date: Date
    let overallScore: Double
    let categoryScores: [String: Double]
    let strengths: [String]
    let areasToImprove: [String]
    let recommendations: [String]
    let bookQuotes: [String]
    let nextSteps: [String]
    
    init(date: Date = Date(), overallScore: Double, categoryScores: [String: Double], strengths: [String], areasToImprove: [String], recommendations: [String], bookQuotes: [String], nextSteps: [String]) {
        self.date = date
        self.overallScore = overallScore
        self.categoryScores = categoryScores
        self.strengths = strengths
        self.areasToImprove = areasToImprove
        self.recommendations = recommendations
        self.bookQuotes = bookQuotes
        self.nextSteps = nextSteps
    }
}

