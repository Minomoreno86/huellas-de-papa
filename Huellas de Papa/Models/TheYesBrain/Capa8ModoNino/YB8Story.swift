import Foundation
import SwiftData

/// Cuento narrado desde la voz del niño
@Model
final class YB8Story {
    @Attribute(.unique) var id: UUID
    var title: String
    var emotion: String             // "Miedo", "Frustración", "Alegría", "Tristeza"
    var narrative: String           // texto del cuento
    var moral: String               // aprendizaje central
    var duration: Int               // segundos estimados
    var hasAudio: Bool
    var icon: String                // SF Symbol
    var color: String               // Color por emoción
    
    init(
        title: String,
        emotion: String,
        narrative: String,
        moral: String,
        duration: Int,
        hasAudio: Bool = false,
        icon: String,
        color: String
    ) {
        self.id = UUID()
        self.title = title
        self.emotion = emotion
        self.narrative = narrative
        self.moral = moral
        self.duration = duration
        self.hasAudio = hasAudio
        self.icon = icon
        self.color = color
    }
}

