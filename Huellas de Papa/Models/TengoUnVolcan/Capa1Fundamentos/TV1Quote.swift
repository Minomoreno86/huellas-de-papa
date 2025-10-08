import Foundation

/// Modelo que representa una cita inspiradora del libro "Tengo un Volcán"
/// Proporciona frases motivacionales y recordatorios clave
struct TV1Quote: Codable, Identifiable {
    let id: UUID
    let text: String
    let author: String
    let context: String
    
    /// Inicializador para crear una cita inspiradora
    /// - Parameters:
    ///   - text: Texto de la cita
    ///   - author: Autor de la cita
    ///   - context: Contexto de aplicación
    init(text: String, author: String, context: String) {
        self.id = UUID()
        self.text = text
        self.author = author
        self.context = context
    }
}

