import Foundation
import SwiftData

/// Medalla/Logro del módulo completo
/// Basado en el libro de Erin Winters
@Model
final class TA9Badge {
    @Attribute(.unique) var id: UUID
    var title: String
    var badgeDescription: String
    var requirement: String
    var unlocked: Bool
    var unlockedDate: Date?
    var iconName: String
    var color: String
    var bookQuote: String
    
    init(
        title: String,
        badgeDescription: String,
        requirement: String,
        unlocked: Bool = false,
        unlockedDate: Date? = nil,
        iconName: String,
        color: String,
        bookQuote: String
    ) {
        self.id = UUID()
        self.title = title
        self.badgeDescription = badgeDescription
        self.requirement = requirement
        self.unlocked = unlocked
        self.unlockedDate = unlockedDate
        self.iconName = iconName
        self.color = color
        self.bookQuote = bookQuote
    }
}

