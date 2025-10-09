import Foundation

/// Actividad práctica para hacer en casa basada en el libro
/// "¡Te amo cuando estás enojado!" de Erin Winters
struct TA5Activity: Codable, Identifiable {
    let id: UUID
    let title: String
    let fromBook: Bool
    let description: String
    let objective: String
    let materials: [String]
    let instructions: [String]
    let frequency: Frequency
    let durationMinutes: String
    let ageRange: String
    let bookReference: String
    let tips: [String]
    let iconName: String
    
    enum Frequency: String, Codable {
        case daily = "Diaria"
        case twiceWeek = "2-3 veces/semana"
        case weekly = "Semanal"
        case asNeeded = "Cuando sea necesario"
    }
    
    /// Inicializador para crear una actividad
    init(title: String, fromBook: Bool, description: String, objective: String, materials: [String], instructions: [String], frequency: Frequency, durationMinutes: String, ageRange: String, bookReference: String, tips: [String], iconName: String) {
        self.id = UUID()
        self.title = title
        self.fromBook = fromBook
        self.description = description
        self.objective = objective
        self.materials = materials
        self.instructions = instructions
        self.frequency = frequency
        self.durationMinutes = durationMinutes
        self.ageRange = ageRange
        self.bookReference = bookReference
        self.tips = tips
        self.iconName = iconName
    }
}

