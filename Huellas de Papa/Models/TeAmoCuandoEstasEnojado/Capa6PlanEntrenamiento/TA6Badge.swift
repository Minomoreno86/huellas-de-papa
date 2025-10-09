import Foundation

/// Insignia/Badge por logros específicos del entrenamiento
/// Basado en conceptos del libro de Erin Winters
struct TA6Badge: Codable, Identifiable {
    let id: UUID
    let name: String
    let description: String
    let requirement: String
    let bookQuote: String
    let icon: String
    let color: String
    var unlocked: Bool
    var unlockedAt: Date?
    
    init(name: String, description: String, requirement: String, bookQuote: String, icon: String, color: String, unlocked: Bool = false, unlockedAt: Date? = nil) {
        self.id = UUID()
        self.name = name
        self.description = description
        self.requirement = requirement
        self.bookQuote = bookQuote
        self.icon = icon
        self.color = color
        self.unlocked = unlocked
        self.unlockedAt = unlockedAt
    }
}

