import Foundation
import SwiftData

/// Simulación sensorial del mundo infantil
@Model
final class YB8Simulation {
    @Attribute(.unique) var id: UUID
    var title: String
    var type: String                // "Ruido", "Tiempo", "Luz", "Incertidumbre"
    var simulationDescription: String
    var durationSeconds: Int
    var insight: String
    var icon: String                // SF Symbol
    var color: String               // Color principal
    
    init(
        title: String,
        type: String,
        simulationDescription: String,
        durationSeconds: Int,
        insight: String,
        icon: String,
        color: String
    ) {
        self.id = UUID()
        self.title = title
        self.type = type
        self.simulationDescription = simulationDescription
        self.durationSeconds = durationSeconds
        self.insight = insight
        self.icon = icon
        self.color = color
    }
}

