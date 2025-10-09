import Foundation

/// Rutina familiar basada en el libro de Erin Winters
/// Aplicaciones prácticas del amor incondicional en casa
struct TA5Routine: Codable, Identifiable {
    let id: UUID
    let title: String
    let timeOfDay: TimeOfDay
    let description: String
    let objective: String
    let steps: [String]
    let durationMinutes: String
    let emotionsValidated: [String]
    let bookPhrases: [String]
    let tips: [String]
    let iconName: String
    
    enum TimeOfDay: String, Codable {
        case morning = "Mañana"
        case afternoon = "Tarde"
        case evening = "Noche"
        case reunion = "Reencuentro"
        case crisis = "Durante Crisis"
    }
    
    /// Inicializador para crear una rutina
    init(title: String, timeOfDay: TimeOfDay, description: String, objective: String, steps: [String], durationMinutes: String, emotionsValidated: [String], bookPhrases: [String], tips: [String], iconName: String) {
        self.id = UUID()
        self.title = title
        self.timeOfDay = timeOfDay
        self.description = description
        self.objective = objective
        self.steps = steps
        self.durationMinutes = durationMinutes
        self.emotionsValidated = emotionsValidated
        self.bookPhrases = bookPhrases
        self.tips = tips
        self.iconName = iconName
    }
}

