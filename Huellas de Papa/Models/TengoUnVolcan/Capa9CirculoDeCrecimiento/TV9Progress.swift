import Foundation
import SwiftData

/// Progreso general en el módulo "Tengo un Volcán"
@Model
final class TV9Progress {
    @Attribute(.unique) var id: UUID
    var startDate: Date
    var capasCompletadas: [Int] // [1, 2, 3...] capas vistas
    var badgesUnlocked: Int
    var totalBadges: Int
    var volcanosRegistrados: Int
    var herramientasPracticadas: [String]
    var diasSeguimiento: Int
    
    init(
        startDate: Date = Date(),
        capasCompletadas: [Int] = [],
        badgesUnlocked: Int = 0,
        totalBadges: Int = 12,
        volcanosRegistrados: Int = 0,
        herramientasPracticadas: [String] = [],
        diasSeguimiento: Int = 0
    ) {
        self.id = UUID()
        self.startDate = startDate
        self.capasCompletadas = capasCompletadas
        self.badgesUnlocked = badgesUnlocked
        self.totalBadges = totalBadges
        self.volcanosRegistrados = volcanosRegistrados
        self.herramientasPracticadas = herramientasPracticadas
        self.diasSeguimiento = diasSeguimiento
    }
    
    var progressPercentage: Double {
        Double(capasCompletadas.count) / 8.0 // 8 capas de contenido (la 9 es resumen)
    }
}

