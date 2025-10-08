import Foundation

/// Modelo que representa una actividad práctica para entrenar herramientas
/// Basado en las actividades pedagógicas del libro
struct TV3Activity: Codable, Identifiable {
    let id: UUID
    let title: String
    let description: String
    let relatedTool: String // Nombre de la herramienta que practica
    let materials: [String]
    let instructions: [String]
    let durationMinutes: String
    let ageRange: String
    let learningObjective: String
    let tips: [String]
    let iconName: String
    
    /// Inicializador para crear una actividad
    init(title: String, description: String, relatedTool: String, materials: [String], instructions: [String], durationMinutes: String, ageRange: String, learningObjective: String, tips: [String], iconName: String) {
        self.id = UUID()
        self.title = title
        self.description = description
        self.relatedTool = relatedTool
        self.materials = materials
        self.instructions = instructions
        self.durationMinutes = durationMinutes
        self.ageRange = ageRange
        self.learningObjective = learningObjective
        self.tips = tips
        self.iconName = iconName
    }
}

