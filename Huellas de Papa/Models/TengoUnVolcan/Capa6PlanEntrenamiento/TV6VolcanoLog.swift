import Foundation
import SwiftData

/// Registro de un volcán individual del hijo
/// Basado en las categorías del libro de Míriam Tirado
@Model
final class TV6VolcanoLog {
    @Attribute(.unique) var id: UUID
    var date: Date
    var childName: String
    var volcanoPhase: String // "Chispa", "Burbujeo", "Erupción"
    var triggerButton: String // "Injusticia", "Frustración", "No conseguir lo que quiero", "Emociones enmascaradas"
    var physicalSignals: [String] // Del mapa del volcán
    var thoughtPattern: String? // Qué nube de humo apareció
    var toolUsed: String? // Qué herramienta se usó
    var toolEffective: Bool? // ¿Funcionó?
    var context: String // Dónde ocurrió (casa, escuela, parque, etc.)
    var notes: String?
    
    init(
        date: Date = Date(),
        childName: String,
        volcanoPhase: String,
        triggerButton: String,
        physicalSignals: [String] = [],
        thoughtPattern: String? = nil,
        toolUsed: String? = nil,
        toolEffective: Bool? = nil,
        context: String,
        notes: String? = nil
    ) {
        self.id = UUID()
        self.date = date
        self.childName = childName
        self.volcanoPhase = volcanoPhase
        self.triggerButton = triggerButton
        self.physicalSignals = physicalSignals
        self.thoughtPattern = thoughtPattern
        self.toolUsed = toolUsed
        self.toolEffective = toolEffective
        self.context = context
        self.notes = notes
    }
}

