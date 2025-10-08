import Foundation

/// Representa una herramienta práctica del Yes Brain
struct YesBrainTool: Codable, Identifiable {
    let id: UUID
    let name: String               // "El semáforo interno", "Repara y reconecta"
    let category: String           // "Balance", "Resiliencia", "Insight", "Empatía"
    let objective: String          // Objetivo neuroemocional
    let materials: [String]        // Si se requiere algo físico
    let steps: [String]            // Guía paso a paso
    let durationMinutes: Int
    let principleLinked: UUID?     // Enlace con Capa 2
    let recommendedAge: String
    let reflectionCue: String      // Frase de cierre o de integración
    let icon: String              // Nombre del ícono SF Symbol
    let color: String             // Color principal
    
    init(name: String, category: String, objective: String, materials: [String], steps: [String], durationMinutes: Int, principleLinked: UUID? = nil, recommendedAge: String, reflectionCue: String, icon: String, color: String) {
        self.id = UUID()
        self.name = name
        self.category = category
        self.objective = objective
        self.materials = materials
        self.steps = steps
        self.durationMinutes = durationMinutes
        self.principleLinked = principleLinked
        self.recommendedAge = recommendedAge
        self.reflectionCue = reflectionCue
        self.icon = icon
        self.color = color
    }
}
