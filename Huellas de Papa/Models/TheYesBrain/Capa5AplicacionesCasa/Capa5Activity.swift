import Foundation

/// Representa actividades conjuntas padre-hijo (tipo misión diaria)
struct YesBrainActivity: Codable, Identifiable {
    let id: UUID
    let title: String                // "Misión: desayuno tranquilo"
    let description: String
    let goal: String                 // Qué se entrena
    let steps: [String]
    let durationMinutes: Int
    let relatedRoutine: UUID?
    let icon: String                 // Nombre del ícono SF Symbol
    let color: String                // Color principal
    
    init(title: String, description: String, goal: String, steps: [String], durationMinutes: Int, relatedRoutine: UUID? = nil, icon: String, color: String) {
        self.id = UUID()
        self.title = title
        self.description = description
        self.goal = goal
        self.steps = steps
        self.durationMinutes = durationMinutes
        self.relatedRoutine = relatedRoutine
        self.icon = icon
        self.color = color
    }
}

