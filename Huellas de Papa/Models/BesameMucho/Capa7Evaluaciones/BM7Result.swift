import Foundation
import SwiftUI

/// Modelo que representa el resultado de un cuestionario
/// Incluye puntuación, nivel, áreas de mejora y recomendaciones
struct BM7Result: Codable, Identifiable {
    let id: UUID
    let score: Double
    let maxScore: Double
    let percentage: Double
    let level: AlignmentResult
    let areasOfImprovement: [String]
    let bookChapters: [String]
    let recommendedTrainings: [String]
    let actionPlan: [String]
    
    init(score: Double, maxScore: Double, areasOfImprovement: [String], bookChapters: [String], recommendedTrainings: [String], actionPlan: [String]) {
        self.id = UUID()
        self.score = score
        self.maxScore = maxScore
        self.percentage = (score / maxScore) * 100
        
        // Determinar nivel según porcentaje
        if percentage >= 85 {
            self.level = .mastery
        } else if percentage >= 65 {
            self.level = .goodPath
        } else if percentage >= 40 {
            self.level = .inProgress
        } else {
            self.level = .needsSupport
        }
        
        self.areasOfImprovement = areasOfImprovement
        self.bookChapters = bookChapters
        self.recommendedTrainings = recommendedTrainings
        self.actionPlan = actionPlan
    }
}

/// Nivel de alineación con el libro
enum AlignmentResult: String, Codable {
    case mastery = "Maestría"
    case goodPath = "Buen Camino"
    case inProgress = "En Proceso"
    case needsSupport = "Necesitas Apoyo"
    
    var color: String {
        switch self {
        case .mastery: return "mint"
        case .goodPath: return "green"
        case .inProgress: return "orange"
        case .needsSupport: return "red"
        }
    }
    
    var icon: String {
        switch self {
        case .mastery: return "star.fill"
        case .goodPath: return "checkmark.circle.fill"
        case .inProgress: return "arrow.clockwise.circle.fill"
        case .needsSupport: return "exclamationmark.triangle.fill"
        }
    }
    
    var message: String {
        switch self {
        case .mastery: return "¡Excelente! Estás totalmente alineado con Bésame Mucho"
        case .goodPath: return "Vas bien. Hay algunas áreas que puedes mejorar"
        case .inProgress: return "Estás en proceso. Revisa áreas de mejora"
        case .needsSupport: return "Necesitas apoyo. Considera entrenamientos recomendados"
        }
    }
}

