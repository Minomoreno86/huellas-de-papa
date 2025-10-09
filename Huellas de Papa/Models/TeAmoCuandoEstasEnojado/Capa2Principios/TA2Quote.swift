import Foundation

/// Cita del libro sobre los principios del amor incondicional
struct TA2Quote: Codable, Identifiable {
    let id: UUID
    let text: String
    let context: String
    let relatedPrinciple: String
    
    /// Inicializador para crear una cita
    /// - Parameters:
    ///   - text: Texto de la cita del libro
    ///   - context: Contexto de aplicación
    ///   - relatedPrinciple: Principio relacionado
    init(text: String, context: String, relatedPrinciple: String) {
        self.id = UUID()
        self.text = text
        self.context = context
        self.relatedPrinciple = relatedPrinciple
    }
}

