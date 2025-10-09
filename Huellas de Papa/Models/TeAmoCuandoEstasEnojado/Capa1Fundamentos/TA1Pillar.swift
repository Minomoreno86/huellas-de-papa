import Foundation

/// Modelo que representa uno de los cuatro pilares del amor incondicional
/// Basado en el libro "¡Te amo cuando estás enojado!" de Erin Winters
struct TA1Pillar: Codable, Identifiable {
    let id: UUID
    let name: String
    let definition: String
    let bookQuote: String
    let parentalExample: String
    
    /// Inicializador para crear un pilar del amor incondicional
    /// - Parameters:
    ///   - name: Nombre del pilar
    ///   - definition: Definición del concepto
    ///   - bookQuote: Cita relevante del libro
    ///   - parentalExample: Ejemplo práctico para aplicar en casa
    init(name: String, definition: String, bookQuote: String, parentalExample: String) {
        self.id = UUID()
        self.name = name
        self.definition = definition
        self.bookQuote = bookQuote
        self.parentalExample = parentalExample
    }
}

