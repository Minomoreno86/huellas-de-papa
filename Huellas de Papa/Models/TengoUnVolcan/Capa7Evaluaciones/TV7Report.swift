import Foundation

/// Reporte generado después de completar la autoevaluación
struct TV7Report: Identifiable {
    let id = UUID()
    let date: Date
    let overallScore: Double // 0-100
    let categoryScores: [String: Double]
    let strengths: [String]
    let areasToImprove: [String]
    let recommendations: [String]
    let relatedCapas: [String]
}

