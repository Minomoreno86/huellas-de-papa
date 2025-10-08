import Foundation
import SwiftData

/// Representa una misión semanal del círculo de crecimiento
@Model
final class C9Mission {
    @Attribute(.unique) var id: UUID
    var title: String
    var missionDescription: String
    var objectives: [String]    // 2-3 acciones breves
    var days: Int               // 7 por defecto
    var progress: Int           // 0..days (no mostrar números en UI)
    var pillar: String          // "Balance", "Resiliencia", "Insight", "Empatía"
    var active: Bool
    var icon: String            // SF Symbol
    var color: String
    
    init(
        title: String,
        missionDescription: String,
        objectives: [String],
        days: Int = 7,
        progress: Int = 0,
        pillar: String,
        active: Bool = false,
        icon: String,
        color: String
    ) {
        self.id = UUID()
        self.title = title
        self.missionDescription = missionDescription
        self.objectives = objectives
        self.days = days
        self.progress = progress
        self.pillar = pillar
        self.active = active
        self.icon = icon
        self.color = color
    }
}

