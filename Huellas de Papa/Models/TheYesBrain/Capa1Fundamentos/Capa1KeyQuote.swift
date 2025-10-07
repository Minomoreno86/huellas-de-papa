import Foundation

/// Modelo que representa una cita o mantra clave del Yes Brain
/// Proporciona frases inspiradoras y recordatorios para los padres
struct Capa1KeyQuote: Codable, Identifiable {
    let id: UUID
    let text: String
    let attribution: String
    
    /// Inicializador para crear una cita clave
    /// - Parameters:
    ///   - text: Texto de la cita o mantra
    ///   - attribution: Autor y obra de donde proviene
    init(text: String, attribution: String) {
        self.id = UUID()
        self.text = text
        self.attribution = attribution
    }
}
