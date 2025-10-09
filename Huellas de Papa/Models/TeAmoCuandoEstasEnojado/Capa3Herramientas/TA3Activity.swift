import Foundation

/// Representa una actividad de conexión emocional
/// Actividades para aplicar el amor incondicional en la práctica
struct TA3Activity: Codable, Identifiable {
    let id: UUID
    let name: String
    let type: String
    let description: String
    let objectives: [String]
    let howToDo: [String]
    let frequency: String
    let bookBasis: String
    let icon: String
    
    /// Inicializador para crear una actividad
    /// - Parameters:
    ///   - name: Nombre de la actividad
    ///   - type: Tipo de actividad (Ritual, Conversación, Juego, etc.)
    ///   - description: Descripción de la actividad
    ///   - objectives: Objetivos emocionales
    ///   - howToDo: Cómo realizar la actividad
    ///   - frequency: Frecuencia recomendada
    ///   - bookBasis: Base en el libro
    ///   - icon: Ícono SF Symbol
    init(name: String, type: String, description: String, objectives: [String], howToDo: [String], frequency: String, bookBasis: String, icon: String) {
        self.id = UUID()
        self.name = name
        self.type = type
        self.description = description
        self.objectives = objectives
        self.howToDo = howToDo
        self.frequency = frequency
        self.bookBasis = bookBasis
        self.icon = icon
    }
}

