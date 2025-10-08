import Foundation
import SwiftData

/// Representa el árbol de crecimiento visual
@Model
final class C9GrowthTree {
    @Attribute(.unique) var id: UUID
    var level: Int              // 1..N (interno)
    var leaves: Int             // hojas generadas
    var blossoms: Int           // flores (hitos mayores)
    var lastEvent: String?      // clave del último crecimiento
    var lastUpdated: Date?
    
    init(
        level: Int = 1,
        leaves: Int = 0,
        blossoms: Int = 0,
        lastEvent: String? = nil,
        lastUpdated: Date? = nil
    ) {
        self.id = UUID()
        self.level = level
        self.leaves = leaves
        self.blossoms = blossoms
        self.lastEvent = lastEvent
        self.lastUpdated = lastUpdated
    }
}

