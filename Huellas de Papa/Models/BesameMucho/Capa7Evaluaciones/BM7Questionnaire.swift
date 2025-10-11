import Foundation
import SwiftUI

/// Modelo que representa un cuestionario completo de evaluación
/// Conjunto de preguntas sobre un área específica de crianza
struct BM7Questionnaire: Codable, Identifiable {
    let id: UUID
    let number: Int
    let title: String
    let description: String
    let questions: [BM7Question]
    let category: EvaluationCategory
    
    init(number: Int, title: String, description: String, questions: [BM7Question], category: EvaluationCategory) {
        self.id = UUID()
        self.number = number
        self.title = title
        self.description = description
        self.questions = questions
        self.category = category
    }
}

/// Categorías de evaluación
enum EvaluationCategory: String, Codable {
    case sleep = "Sueño"
    case feeding = "Lactancia"
    case contact = "Contacto"
    case limits = "Límites"
    case emotions = "Emociones"
    case externalPressure = "Presión Social"
    case general = "General"
    
    var icon: String {
        switch self {
        case .sleep: return "moon.stars.fill"
        case .feeding: return "heart.circle.fill"
        case .contact: return "hands.sparkles.fill"
        case .limits: return "shield.fill"
        case .emotions: return "face.smiling.fill"
        case .externalPressure: return "person.3.fill"
        case .general: return "checkmark.seal.fill"
        }
    }
    
    var color: String {
        switch self {
        case .sleep: return "indigo"
        case .feeding: return "pink"
        case .contact: return "blue"
        case .limits: return "orange"
        case .emotions: return "mint"
        case .externalPressure: return "red"
        case .general: return "purple"
        }
    }
}

