import Foundation
import SwiftUI

/// Modelo que representa un logro/insignia desbloqueable
struct BM9Achievement: Codable, Identifiable {
    let id: UUID
    let number: Int
    let title: String
    let description: String
    let icon: String
    let color: AchievementColor
    let category: AchievementCategory
    let points: Int
    let requirement: String
    var isUnlocked: Bool
    var unlockedDate: Date?
    
    init(number: Int, title: String, description: String, icon: String, color: AchievementColor, category: AchievementCategory, points: Int, requirement: String, isUnlocked: Bool = false) {
        self.id = UUID()
        self.number = number
        self.title = title
        self.description = description
        self.icon = icon
        self.color = color
        self.category = category
        self.points = points
        self.requirement = requirement
        self.isUnlocked = isUnlocked
        self.unlockedDate = nil
    }
}

/// Colores de logros
enum AchievementColor: String, Codable {
    case gold = "gold"
    case silver = "silver"
    case bronze = "bronze"
    case blue = "blue"
    case mint = "mint"
    case purple = "purple"
    case pink = "pink"
    case orange = "orange"
    
    var swiftUIColor: Color {
        switch self {
        case .gold: return .yellow
        case .silver: return .gray
        case .bronze: return .orange
        case .blue: return .blue
        case .mint: return .mint
        case .purple: return .purple
        case .pink: return .pink
        case .orange: return .orange
        }
    }
}

/// Categorías de logros
enum AchievementCategory: String, Codable {
    case sleep = "Colecho"
    case feeding = "Lactancia"
    case noViolence = "Sin Violencia"
    case response = "Respuesta"
    case defense = "Defensa"
    case general = "General"
    
    var icon: String {
        switch self {
        case .sleep: return "moon.stars.fill"
        case .feeding: return "heart.circle.fill"
        case .noViolence: return "shield.fill"
        case .response: return "hand.raised.fill"
        case .defense: return "figure.stand"
        case .general: return "star.fill"
        }
    }
}

