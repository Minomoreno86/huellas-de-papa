import Foundation
import SwiftData

/// Enlace de evento de crecimiento desde otras capas
@Model
final class C9Links {
    @Attribute(.unique) var id: UUID
    var fromLayer: String       // "Capa6", "Capa8", etc.
    var refId: UUID?            // id de acción/día/actividad
    var pillar: String?
    var growthEvent: String     // "seed", "leaf", "blossom"
    var timestamp: Date
    
    init(
        fromLayer: String,
        refId: UUID? = nil,
        pillar: String? = nil,
        growthEvent: String,
        timestamp: Date = Date()
    ) {
        self.id = UUID()
        self.fromLayer = fromLayer
        self.refId = refId
        self.pillar = pillar
        self.growthEvent = growthEvent
        self.timestamp = timestamp
    }
}

