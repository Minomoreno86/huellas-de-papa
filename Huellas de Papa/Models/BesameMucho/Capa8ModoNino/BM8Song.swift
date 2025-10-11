import Foundation
import SwiftUI

/// Modelo que representa una canción infantil
/// Canción con letra sobre temas del libro
struct BM8Song: Codable, Identifiable {
    let id: UUID
    let number: Int
    let title: String
    let icon: String
    let color: String
    let theme: String
    let lyrics: [String]  // Array de estrofas
    let melody: String
    let ageRange: String
    
    init(number: Int, title: String, icon: String, color: String, theme: String, lyrics: [String], melody: String, ageRange: String) {
        self.id = UUID()
        self.number = number
        self.title = title
        self.icon = icon
        self.color = color
        self.theme = theme
        self.lyrics = lyrics
        self.melody = melody
        self.ageRange = ageRange
    }
}

