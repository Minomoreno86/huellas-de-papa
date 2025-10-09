import Foundation

/// Representa un escenario de aplicación práctica del libro
/// Situaciones reales donde aplicar el amor incondicional
struct TA2Scenario: Codable, Identifiable {
    let id: UUID
    let situation: String
    let emotionalState: String
    let unconditionalResponse: String
    let whatToAvoid: String
    let whatToDo: String
    let insight: String
    
    /// Inicializador para crear un escenario
    /// - Parameters:
    ///   - situation: Descripción de la situación
    ///   - emotionalState: Estado emocional del niño
    ///   - unconditionalResponse: Respuesta de amor del libro
    ///   - whatToAvoid: Qué NO hacer (modo reactivo)
    ///   - whatToDo: Qué SÍ hacer (modo amor incondicional)
    ///   - insight: Insight sobre el impacto
    init(situation: String, emotionalState: String, unconditionalResponse: String, whatToAvoid: String, whatToDo: String, insight: String) {
        self.id = UUID()
        self.situation = situation
        self.emotionalState = emotionalState
        self.unconditionalResponse = unconditionalResponse
        self.whatToAvoid = whatToAvoid
        self.whatToDo = whatToDo
        self.insight = insight
    }
}

