import Foundation
import SwiftUI

/// Modelo que representa una actividad para hacer con niños
/// Actividad práctica basada en principios del libro
struct BM8Activity: Codable, Identifiable {
    let id: UUID
    let number: Int
    let title: String
    let icon: String
    let color: String
    let description: String
    let materials: [String]
    let steps: [ActivityStep]
    let ageRange: String
    let duration: String
    let category: ActivityCategory
    
    init(number: Int, title: String, icon: String, color: String, description: String, materials: [String], steps: [ActivityStep], ageRange: String, duration: String, category: ActivityCategory) {
        self.id = UUID()
        self.number = number
        self.title = title
        self.icon = icon
        self.color = color
        self.description = description
        self.materials = materials
        self.steps = steps
        self.ageRange = ageRange
        self.duration = duration
        self.category = category
    }
}

/// Paso de una actividad
struct ActivityStep: Codable, Identifiable {
    let id: UUID
    let stepNumber: Int
    let instruction: String
    let tip: String?
    
    init(stepNumber: Int, instruction: String, tip: String? = nil) {
        self.id = UUID()
        self.stepNumber = stepNumber
        self.instruction = instruction
        self.tip = tip
    }
}

/// Categorías de actividades
enum ActivityCategory: String, Codable {
    case crafts = "Manualidades"
    case games = "Juegos"
    case music = "Música"
    case stories = "Cuentos"
    case drawing = "Dibujo"
    case movement = "Movimiento"
    
    var icon: String {
        switch self {
        case .crafts: return "paintbrush.fill"
        case .games: return "gamecontroller.fill"
        case .music: return "music.note"
        case .stories: return "book.fill"
        case .drawing: return "pencil.tip.crop.circle.fill"
        case .movement: return "figure.walk"
        }
    }
}

