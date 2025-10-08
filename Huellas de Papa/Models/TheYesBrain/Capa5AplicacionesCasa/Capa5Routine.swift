import Foundation

/// Representa una rutina familiar diaria aplicada al modelo Yes Brain
struct YesBrainRoutineCasa: Codable, Identifiable {
    let id: UUID
    let title: String                // "Mañanas con cerebro Sí"
    let context: String              // "Inicio del día", "Antes de dormir"...
    let description: String          // Explicación breve de propósito clínico
    let objective: String            // Objetivo neuroemocional
    let steps: [String]              // Secuencia paso a paso
    let durationMinutes: Int
    let pillarsInvolved: [String]    // ["Balance", "Resiliencia"]
    let materials: [String]?         // Opcional
    let reflectionCue: String        // Frase de cierre o anclaje emocional
    let icon: String                 // Nombre del ícono SF Symbol
    let color: String                // Color principal
    
    init(title: String, context: String, description: String, objective: String, steps: [String], durationMinutes: Int, pillarsInvolved: [String], materials: [String]? = nil, reflectionCue: String, icon: String, color: String) {
        self.id = UUID()
        self.title = title
        self.context = context
        self.description = description
        self.objective = objective
        self.steps = steps
        self.durationMinutes = durationMinutes
        self.pillarsInvolved = pillarsInvolved
        self.materials = materials
        self.reflectionCue = reflectionCue
        self.icon = icon
        self.color = color
    }
}

