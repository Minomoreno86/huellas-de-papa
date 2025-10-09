import Foundation

/// Modelo que representa una cita del libro "¡Te amo cuando estás enojado!"
/// de Erin Winters
struct TA1Quote: Codable, Identifiable {
    let id: UUID
    let text: String
    let context: String
    
    /// Inicializador para crear una cita del libro
    /// - Parameters:
    ///   - text: Texto de la cita
    ///   - context: Contexto o aplicación de la cita
    init(text: String, context: String) {
        self.id = UUID()
        self.text = text
        self.context = context
    }
}

