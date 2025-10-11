import Foundation
import SwiftUI

/// Modelo que representa un mini-juego interactivo
/// Juego simple para niños que refuerza conceptos del libro
struct BM8Game: Codable, Identifiable {
    let id: UUID
    let number: Int
    let title: String
    let icon: String
    let color: String
    let description: String
    let instructions: String
    let ageRange: String
    let category: GameCategory
    
    init(number: Int, title: String, icon: String, color: String, description: String, instructions: String, ageRange: String, category: GameCategory) {
        self.id = UUID()
        self.number = number
        self.title = title
        self.icon = icon
        self.color = color
        self.description = description
        self.instructions = instructions
        self.ageRange = ageRange
        self.category = category
    }
}

/// Categorías de juegos
enum GameCategory: String, Codable {
    case emotions = "Emociones"
    case attachment = "Apego"
    case relaxation = "Relajación"
    case recognition = "Reconocimiento"
    case creativity = "Creatividad"
    
    var icon: String {
        switch self {
        case .emotions: return "face.smiling.fill"
        case .attachment: return "heart.fill"
        case .relaxation: return "moon.stars.fill"
        case .recognition: return "eye.fill"
        case .creativity: return "paintbrush.fill"
        }
    }
}
