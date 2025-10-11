import Foundation
import SwiftUI

/// Modelo que representa una pregunta para conversación guiada
/// Pregunta para que padres conversen con sus hijos
struct BM8Question: Codable, Identifiable {
    let id: UUID
    let number: Int
    let question: String
    let icon: String
    let color: String
    let category: ConversationCategory
    let tips: [String]
    let ageRange: String
    
    init(number: Int, question: String, icon: String, color: String, category: ConversationCategory, tips: [String], ageRange: String) {
        self.id = UUID()
        self.number = number
        self.question = question
        self.icon = icon
        self.color = color
        self.category = category
        self.tips = tips
        self.ageRange = ageRange
    }
}

/// Categorías de conversación
enum ConversationCategory: String, Codable {
    case feelings = "Sentimientos"
    case safety = "Seguridad"
    case family = "Familia"
    case needs = "Necesidades"
    case fears = "Miedos"
    
    var icon: String {
        switch self {
        case .feelings: return "heart.circle.fill"
        case .safety: return "shield.fill"
        case .family: return "house.fill"
        case .needs: return "hand.raised.fill"
        case .fears: return "sparkles"
        }
    }
}

