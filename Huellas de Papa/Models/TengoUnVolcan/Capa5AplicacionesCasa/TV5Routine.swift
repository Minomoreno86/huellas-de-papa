import Foundation

/// Rutina familiar basada en el libro "Tengo un Volcán"
/// Aplicaciones prácticas en casa de las herramientas
struct TV5Routine: Codable, Identifiable {
    let id: UUID
    let title: String
    let timeOfDay: TimeOfDay
    let description: String
    let objective: String
    let steps: [String]
    let durationMinutes: String
    let toolsPracticed: [String]
    let preventionFocus: [String] // De "Regar el Jardín Interior"
    let tips: [String]
    let iconName: String
    
    enum TimeOfDay: String, Codable {
        case morning = "Mañana"
        case afternoon = "Tarde"
        case evening = "Noche"
        case anytime = "Cualquier momento"
        case crisis = "Durante Crisis"
    }
    
    /// Inicializador para crear una rutina
    init(title: String, timeOfDay: TimeOfDay, description: String, objective: String, steps: [String], durationMinutes: String, toolsPracticed: [String], preventionFocus: [String], tips: [String], iconName: String) {
        self.id = UUID()
        self.title = title
        self.timeOfDay = timeOfDay
        self.description = description
        self.objective = objective
        self.steps = steps
        self.durationMinutes = durationMinutes
        self.toolsPracticed = toolsPracticed
        self.preventionFocus = preventionFocus
        self.tips = tips
        self.iconName = iconName
    }
}

