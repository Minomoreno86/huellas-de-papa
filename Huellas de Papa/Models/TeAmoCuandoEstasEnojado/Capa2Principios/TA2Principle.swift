import Foundation

/// Representa un principio central del amor incondicional
/// Basado en el libro "¡Te amo cuando estás enojado!" de Erin Winters
struct TA2Principle: Codable, Identifiable {
    let id: UUID
    let name: String
    let definition: String
    let bookQuote: String
    let parentApplication: String
    let emotionalImpact: String
    
    /// Inicializador para crear un principio
    /// - Parameters:
    ///   - name: Nombre del principio
    ///   - definition: Definición del concepto
    ///   - bookQuote: Cita del libro que lo sustenta
    ///   - parentApplication: Cómo aplicarlo como padre
    ///   - emotionalImpact: Impacto emocional en el niño
    init(name: String, definition: String, bookQuote: String, parentApplication: String, emotionalImpact: String) {
        self.id = UUID()
        self.name = name
        self.definition = definition
        self.bookQuote = bookQuote
        self.parentApplication = parentApplication
        self.emotionalImpact = emotionalImpact
    }
}

