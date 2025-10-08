import Foundation

/// Modelo que representa una cita inspiradora o mantra del Yes Brain
/// Proporciona frases motivacionales y recordatorios clave para los padres
struct Capa1Quote: Codable, Identifiable {
    let id: UUID
    let text: String
    let author: String
    
    /// Inicializador para crear una cita inspiradora
    /// - Parameters:
    ///   - text: Texto de la cita o mantra
    ///   - author: Autor de la cita
    init(text: String, author: String) {
        self.id = UUID()
        self.text = text
        self.author = author
    }
}
