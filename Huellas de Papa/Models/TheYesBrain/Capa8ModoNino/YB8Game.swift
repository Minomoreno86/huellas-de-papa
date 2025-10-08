import Foundation
import SwiftData

/// Juego de empatía compartido padre-hijo
@Model
final class YB8Game {
    @Attribute(.unique) var id: UUID
    var title: String
    var gameDescription: String
    var steps: [String]
    var emotionTrained: String      // emoción objetivo
    var durationMinutes: Int
    var icon: String                // SF Symbol
    var color: String               // Color principal
    
    init(
        title: String,
        gameDescription: String,
        steps: [String],
        emotionTrained: String,
        durationMinutes: Int,
        icon: String,
        color: String
    ) {
        self.id = UUID()
        self.title = title
        self.gameDescription = gameDescription
        self.steps = steps
        self.emotionTrained = emotionTrained
        self.durationMinutes = durationMinutes
        self.icon = icon
        self.color = color
    }
}

