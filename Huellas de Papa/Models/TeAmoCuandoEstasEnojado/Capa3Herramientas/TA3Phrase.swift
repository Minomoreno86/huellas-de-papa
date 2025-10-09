import Foundation

/// Representa una frase de validación emocional del libro
/// Frases específicas para cada estado emocional
struct TA3Phrase: Codable, Identifiable {
    let id: UUID
    let emotion: String
    let phrase: String
    let whenToUse: String
    let example: String
    let fromBook: Bool
    
    /// Inicializador para crear una frase de validación
    /// - Parameters:
    ///   - emotion: Emoción que se valida
    ///   - phrase: Frase de validación
    ///   - whenToUse: Cuándo usar esta frase
    ///   - example: Ejemplo de uso
    ///   - fromBook: Si está explícitamente en el libro
    init(emotion: String, phrase: String, whenToUse: String, example: String, fromBook: Bool = true) {
        self.id = UUID()
        self.emotion = emotion
        self.phrase = phrase
        self.whenToUse = whenToUse
        self.example = example
        self.fromBook = fromBook
    }
}

