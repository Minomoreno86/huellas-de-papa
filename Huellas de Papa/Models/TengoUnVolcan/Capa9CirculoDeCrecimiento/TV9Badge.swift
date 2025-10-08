import Foundation
import SwiftData

/// Logro/Insignia basado en dominio del modelo del volcán
@Model
final class TV9Badge {
    @Attribute(.unique) var id: UUID
    var title: String
    var description: String
    var requirement: String
    var unlocked: Bool
    var unlockedDate: Date?
    var iconName: String
    var color: String
    var relatedContent: String // A qué parte del libro se refiere
    
    init(
        title: String,
        description: String,
        requirement: String,
        unlocked: Bool = false,
        unlockedDate: Date? = nil,
        iconName: String,
        color: String,
        relatedContent: String
    ) {
        self.id = UUID()
        self.title = title
        self.description = description
        self.requirement = requirement
        self.unlocked = unlocked
        self.unlockedDate = unlockedDate
        self.iconName = iconName
        self.color = color
        self.relatedContent = relatedContent
    }
}

