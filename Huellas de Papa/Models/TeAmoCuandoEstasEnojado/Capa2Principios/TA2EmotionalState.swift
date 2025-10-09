import Foundation

/// Representa un estado emocional válido del niño
/// Todas las emociones son aceptadas y amadas incondicionalmente
struct TA2EmotionalState: Codable, Identifiable {
    let id: UUID
    let emotion: String
    let description: String
    let validationPhrase: String
    let fromBook: Bool
    
    /// Inicializador para crear un estado emocional
    /// - Parameters:
    ///   - emotion: Nombre de la emoción
    ///   - description: Descripción de cómo se manifiesta
    ///   - validationPhrase: Frase de validación del libro
    ///   - fromBook: Si está explícitamente mencionado en el libro
    init(emotion: String, description: String, validationPhrase: String, fromBook: Bool = true) {
        self.id = UUID()
        self.emotion = emotion
        self.description = description
        self.validationPhrase = validationPhrase
        self.fromBook = fromBook
    }
}

