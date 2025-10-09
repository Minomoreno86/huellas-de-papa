import Foundation

/// Juego interactivo para niños basado en el libro
/// Actividades lúdicas para aprender sobre emociones
struct TA8Game: Codable, Identifiable {
    let id: UUID
    let title: String
    let gameDescription: String
    let objective: String
    let instructions: [String]
    let durationMinutes: Int
    let ageRange: String
    let emotionsPracticed: [String]
    let bookBasis: String
    let iconName: String
    let color: String
    
    /// Inicializador para crear un juego
    init(title: String, gameDescription: String, objective: String, instructions: [String], durationMinutes: Int, ageRange: String, emotionsPracticed: [String], bookBasis: String, iconName: String, color: String) {
        self.id = UUID()
        self.title = title
        self.gameDescription = gameDescription
        self.objective = objective
        self.instructions = instructions
        self.durationMinutes = durationMinutes
        self.ageRange = ageRange
        self.emotionsPracticed = emotionsPracticed
        self.bookBasis = bookBasis
        self.iconName = iconName
        self.color = color
    }
}

