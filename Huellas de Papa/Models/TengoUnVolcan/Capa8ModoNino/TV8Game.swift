import Foundation

/// Juego interactivo para niños basado en las actividades del libro
struct TV8Game: Codable, Identifiable {
    let id: UUID
    let title: String
    let description: String
    let fromBookActivity: String // Referencia a la actividad de la guía
    let instructions: [String]
    let durationMinutes: Int
    let ageRange: String
    let toolPracticed: String
    let iconName: String
    let color: String
    
    init(title: String, description: String, fromBookActivity: String, instructions: [String], durationMinutes: Int, ageRange: String, toolPracticed: String, iconName: String, color: String) {
        self.id = UUID()
        self.title = title
        self.description = description
        self.fromBookActivity = fromBookActivity
        self.instructions = instructions
        self.durationMinutes = durationMinutes
        self.ageRange = ageRange
        self.toolPracticed = toolPracticed
        self.iconName = iconName
        self.color = color
    }
}

