import Foundation

/// Modelo que representa una cita inspiradora de Capa 2
/// Frases clave sobre los principios del modelo del volcán
struct TV2Quote: Codable, Identifiable {
    let id: UUID
    let text: String
    let author: String
    let context: String
    
    /// Inicializador para crear una cita
    /// - Parameters:
    ///   - text: Texto de la cita
    ///   - author: Autor
    ///   - context: Contexto de aplicación
    init(text: String, author: String, context: String) {
        self.id = UUID()
        self.text = text
        self.author = author
        self.context = context
    }
}

