import Foundation
import SwiftData

/// Registro diario de cumplimiento de las 6 básicas (Regar el Jardín Interior)
/// Basado en la herramienta del libro
@Model
final class TV6DailyCheck {
    @Attribute(.unique) var id: UUID
    var date: Date
    var sleepCompliant: Bool // ¿Durmió suficiente?
    var nutritionCompliant: Bool // ¿Comió regularmente?
    var movementCompliant: Bool // ¿Jugó activamente?
    var connectionCompliant: Bool // ¿Tiempo de calidad 1-a-1?
    var calmCompliant: Bool // ¿Momentos de calma sin pantallas?
    var consistencyCompliant: Bool // ¿Límites consistentes?
    var volcanoesCount: Int // Cuántos volcanes ese día
    var notes: String?
    
    init(
        date: Date = Date(),
        sleepCompliant: Bool = false,
        nutritionCompliant: Bool = false,
        movementCompliant: Bool = false,
        connectionCompliant: Bool = false,
        calmCompliant: Bool = false,
        consistencyCompliant: Bool = false,
        volcanoesCount: Int = 0,
        notes: String? = nil
    ) {
        self.id = UUID()
        self.date = date
        self.sleepCompliant = sleepCompliant
        self.nutritionCompliant = nutritionCompliant
        self.movementCompliant = movementCompliant
        self.connectionCompliant = connectionCompliant
        self.calmCompliant = calmCompliant
        self.consistencyCompliant = consistencyCompliant
        self.volcanoesCount = volcanoesCount
        self.notes = notes
    }
    
    var totalCompliance: Int {
        var count = 0
        if sleepCompliant { count += 1 }
        if nutritionCompliant { count += 1 }
        if movementCompliant { count += 1 }
        if connectionCompliant { count += 1 }
        if calmCompliant { count += 1 }
        if consistencyCompliant { count += 1 }
        return count
    }
    
    var compliancePercentage: Double {
        Double(totalCompliance) / 6.0
    }
}

