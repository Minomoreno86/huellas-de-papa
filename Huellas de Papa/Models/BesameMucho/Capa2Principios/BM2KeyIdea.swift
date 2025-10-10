import Foundation

/// Modelo que representa una idea clave o frase destacada del libro
/// Ideas memorables que resumen los principios de crianza con apego
struct BM2KeyIdea: Codable, Identifiable {
    let id: UUID
    let quote: String
    let context: String
    
    /// Inicializador para crear una idea clave
    /// - Parameters:
    ///   - quote: Frase textual o idea memorable del libro
    ///   - context: Contexto o explicación breve de la idea
    init(quote: String, context: String) {
        self.id = UUID()
        self.quote = quote
        self.context = context
    }
}

