import Foundation
import SwiftUI

/// Modelo que representa una historia infantil sobre apego
/// Historia corta con ilustración y mensaje del libro adaptado para niños
struct BM8Story: Codable, Identifiable {
    let id: UUID
    let number: Int
    let title: String
    let icon: String
    let color: StoryColor
    let pages: [StoryPage]
    let moralLesson: String
    let ageRange: String
    
    init(number: Int, title: String, icon: String, color: StoryColor, pages: [StoryPage], moralLesson: String, ageRange: String) {
        self.id = UUID()
        self.number = number
        self.title = title
        self.icon = icon
        self.color = color
        self.pages = pages
        self.moralLesson = moralLesson
        self.ageRange = ageRange
    }
}

/// Página de una historia
struct StoryPage: Codable, Identifiable {
    let id: UUID
    let pageNumber: Int
    let text: String
    let illustration: String  // SF Symbol
    let backgroundColor: String
    
    init(pageNumber: Int, text: String, illustration: String, backgroundColor: String) {
        self.id = UUID()
        self.pageNumber = pageNumber
        self.text = text
        self.illustration = illustration
        self.backgroundColor = backgroundColor
    }
}

/// Colores de historia
enum StoryColor: String, Codable {
    case blue = "blue"
    case pink = "pink"
    case mint = "mint"
    case orange = "orange"
    case purple = "purple"
    case green = "green"
    case indigo = "indigo"
    case yellow = "yellow"
    
    var swiftUIColor: Color {
        switch self {
        case .blue: return .blue
        case .pink: return .pink
        case .mint: return .mint
        case .orange: return .orange
        case .purple: return .purple
        case .green: return .green
        case .indigo: return .indigo
        case .yellow: return .yellow
        }
    }
}

