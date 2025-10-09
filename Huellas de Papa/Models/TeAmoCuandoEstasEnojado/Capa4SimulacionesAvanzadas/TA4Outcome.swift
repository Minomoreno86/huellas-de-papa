import Foundation

/// Resultado de una elección en la simulación
struct TA4Outcome: Codable, Identifiable {
    let id: UUID
    let childReaction: String
    let emotionalImpact: String
    let longTermEffect: String
    let parentReflection: String
    let bookWisdom: String
    let score: Int
    
    /// Inicializador para crear un resultado
    /// - Parameters:
    ///   - id: UUID del resultado (para enlazar con opciones)
    ///   - childReaction: Reacción inmediata del niño
    ///   - emotionalImpact: Impacto emocional en el niño
    ///   - longTermEffect: Efecto a largo plazo
    ///   - parentReflection: Reflexión para el padre
    ///   - bookWisdom: Sabiduría del libro aplicable
    ///   - score: Puntuación de amor incondicional (0-100)
    init(id: UUID, childReaction: String, emotionalImpact: String, longTermEffect: String, parentReflection: String, bookWisdom: String, score: Int) {
        self.id = id
        self.childReaction = childReaction
        self.emotionalImpact = emotionalImpact
        self.longTermEffect = longTermEffect
        self.parentReflection = parentReflection
        self.bookWisdom = bookWisdom
        self.score = score
    }
}

