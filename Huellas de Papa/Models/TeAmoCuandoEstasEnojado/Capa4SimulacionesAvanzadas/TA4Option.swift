import Foundation

/// Opción de respuesta del padre en una simulación
struct TA4Option: Codable, Identifiable {
    let id: UUID
    let text: String
    let tone: String
    let nextOutcomeId: UUID
    let unconditionalLoveAlignment: Int
    
    /// Inicializador para crear una opción
    /// - Parameters:
    ///   - text: Texto de la opción
    ///   - tone: Tono de la respuesta (Empático, Reactivo, Evasivo, etc.)
    ///   - nextOutcomeId: ID del resultado asociado
    ///   - unconditionalLoveAlignment: Alineación con amor incondicional (0-100)
    init(text: String, tone: String, nextOutcomeId: UUID, unconditionalLoveAlignment: Int) {
        self.id = UUID()
        self.text = text
        self.tone = tone
        self.nextOutcomeId = nextOutcomeId
        self.unconditionalLoveAlignment = unconditionalLoveAlignment
    }
}

