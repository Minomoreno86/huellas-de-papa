import Foundation
import SwiftData

/// Logro/Insignia basado en dominio del modelo del volcán
@Model
final class TV9Badge {
    @Attribute(.unique) var id: UUID
    var title: String
    var badgeDescription: String // Cambiado de 'description' (palabra reservada en @Model)
    var requirement: String
    var unlocked: Bool
    var unlockedDate: Date?
    var iconName: String
    var color: String
    var relatedContent: String // A qué parte del libro se refiere
    
    init(
        title: String,
        badgeDescription: String,
        requirement: String,
        unlocked: Bool = false,
        unlockedDate: Date? = nil,
        iconName: String,
        color: String,
        relatedContent: String
    ) {
        self.id = UUID()
        self.title = title
        self.badgeDescription = badgeDescription
        self.requirement = requirement
        self.unlocked = unlocked
        self.unlockedDate = unlockedDate
        self.iconName = iconName
        self.color = color
        self.relatedContent = relatedContent
    }
}

