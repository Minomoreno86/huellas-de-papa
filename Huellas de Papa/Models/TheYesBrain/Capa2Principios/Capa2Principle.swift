import Foundation

/// Representa un principio central del Yes Brain.
struct Capa2Principle: Codable, Identifiable {
    let id: UUID
    let name: String               // "Balance", "Resiliencia", etc.
    let definition: String         // Descripción clínica breve.
    let neuroBasis: String         // Base neurobiológica.
    let childExample: String       // Ejemplo clínico.
    let parentApplication: String  // Qué debe hacer el adulto.
    let quote: String              // Frase clave del libro o interpretada.
    
    init(name: String, definition: String, neuroBasis: String, childExample: String, parentApplication: String, quote: String) {
        self.id = UUID()
        self.name = name
        self.definition = definition
        self.neuroBasis = neuroBasis
        self.childExample = childExample
        self.parentApplication = parentApplication
        self.quote = quote
    }
}
