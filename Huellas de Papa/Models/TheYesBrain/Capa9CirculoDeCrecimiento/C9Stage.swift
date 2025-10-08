import Foundation
import SwiftData

/// Representa una etapa del círculo de crecimiento
@Model
final class C9Stage {
    @Attribute(.unique) var id: UUID
    var name: String            // "Conexión", "Regulación", "Integración", "Presencia"
    var threshold: Int          // hito simbólico interno (no visible)
    var colorTheme: String
    var mantra: String
    var order: Int
    
    init(
        name: String,
        threshold: Int,
        colorTheme: String,
        mantra: String,
        order: Int
    ) {
        self.id = UUID()
        self.name = name
        self.threshold = threshold
        self.colorTheme = colorTheme
        self.mantra = mantra
        self.order = order
    }
}

