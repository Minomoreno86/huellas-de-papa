import Foundation
import SwiftData

/// Resumen total de la evaluación
@Model
final class YB7Report {
    @Attribute(.unique) var id: UUID
    var overallScore: Double        // 0-100
    var dominantPillar: String      // Pilar más fuerte
    var recommendations: [String]   // Sugerencias de avance
    var generatedAt: Date
    var results: [YB7Result]        // Resultados por pilar
    
    init(
        overallScore: Double,
        dominantPillar: String,
        recommendations: [String],
        generatedAt: Date = Date(),
        results: [YB7Result]
    ) {
        self.id = UUID()
        self.overallScore = overallScore
        self.dominantPillar = dominantPillar
        self.recommendations = recommendations
        self.generatedAt = generatedAt
        self.results = results
    }
}

