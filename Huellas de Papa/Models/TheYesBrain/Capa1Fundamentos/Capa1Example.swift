import Foundation

/// Modelo que representa un ejemplo clínico con transición No→Sí Brain
/// Muestra escenarios reales de aplicación de los principios del Yes Brain
struct Capa1Example: Codable, Identifiable {
    let id: UUID
    let scenario: String
    let reactionNo: String
    let reactionYes: String
    let clinicalInsight: String
    
    /// Inicializador para crear un ejemplo clínico
    /// - Parameters:
    ///   - scenario: Descripción del escenario familiar
    ///   - reactionNo: Reacción típica del modo No Brain (reactivo)
    ///   - reactionYes: Reacción del modo Yes Brain (integrado)
    ///   - clinicalInsight: Insight clínico sobre lo que se aprende
    init(scenario: String, reactionNo: String, reactionYes: String, clinicalInsight: String) {
        self.id = UUID()
        self.scenario = scenario
        self.reactionNo = reactionNo
        self.reactionYes = reactionYes
        self.clinicalInsight = clinicalInsight
    }
}
