import Foundation

/// Modelo que representa un ejemplo clínico de aplicación del Yes Brain
/// Muestra escenarios reales donde se puede aplicar el enfoque receptivo vs reactivo
struct Capa1ClinicalExample: Codable, Identifiable {
    let id: UUID
    let scenario: String
    let reactionNoBrain: String
    let reactionYesBrain: String
    let learning: String
    
    /// Inicializador para crear un ejemplo clínico
    /// - Parameters:
    ///   - scenario: Descripción del escenario familiar
    ///   - reactionNoBrain: Respuesta típica reactiva del adulto
    ///   - reactionYesBrain: Respuesta conectada y reguladora
    ///   - learning: Qué se aprende del caso para aplicar en casa
    init(scenario: String, reactionNoBrain: String, reactionYesBrain: String, learning: String) {
        self.id = UUID()
        self.scenario = scenario
        self.reactionNoBrain = reactionNoBrain
        self.reactionYesBrain = reactionYesBrain
        self.learning = learning
    }
}
