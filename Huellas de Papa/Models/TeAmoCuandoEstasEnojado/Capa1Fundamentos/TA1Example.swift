import Foundation

/// Modelo que representa un ejemplo clínico de amor incondicional
/// Muestra escenarios reales de aplicación del libro de Erin Winters
struct TA1Example: Codable, Identifiable {
    let id: UUID
    let scenario: String
    let emotionalState: String
    let unconditionalResponse: String
    let insight: String
    
    /// Inicializador para crear un ejemplo clínico
    /// - Parameters:
    ///   - scenario: Descripción del escenario familiar
    ///   - emotionalState: Estado emocional del niño en ese momento
    ///   - unconditionalResponse: Respuesta de amor incondicional del padre
    ///   - insight: Insight sobre el impacto emocional en el niño
    init(scenario: String, emotionalState: String, unconditionalResponse: String, insight: String) {
        self.id = UUID()
        self.scenario = scenario
        self.emotionalState = emotionalState
        self.unconditionalResponse = unconditionalResponse
        self.insight = insight
    }
}

