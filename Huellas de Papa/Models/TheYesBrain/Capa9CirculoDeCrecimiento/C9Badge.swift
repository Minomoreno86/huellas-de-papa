import Foundation
import SwiftData

/// Representa una insignia emocional desbloqueada
@Model
final class C9Badge {
    @Attribute(.unique) var id: UUID
    var name: String            // "Pausa Serena", "Error que enseña"
    var meaning: String
    var symbol: String          // ícono o SF Symbol
    var unlockedAt: Date?
    var pillar: String          // Pilar asociado
    var color: String
    
    init(
        name: String,
        meaning: String,
        symbol: String,
        unlockedAt: Date? = nil,
        pillar: String,
        color: String
    ) {
        self.id = UUID()
        self.name = name
        self.meaning = meaning
        self.symbol = symbol
        self.unlockedAt = unlockedAt
        self.pillar = pillar
        self.color = color
    }
}

