import Foundation

/// Modelo que representa una frase o mantra calmante para el niño
/// "Palabras Mágicas" del Hada del Volcán
struct TV3Phrase: Codable, Identifiable {
    let id: UUID
    let text: String
    let situation: String
    let purpose: String
    let example: String
    let iconName: String
    
    /// Inicializador para crear una frase calmante
    init(text: String, situation: String, purpose: String, example: String, iconName: String) {
        self.id = UUID()
        self.text = text
        self.situation = situation
        self.purpose = purpose
        self.example = example
        self.iconName = iconName
    }
}

