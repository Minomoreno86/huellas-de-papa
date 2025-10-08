import Foundation

/// Modelo que representa un escenario de aplicación de los principios
/// Muestra cómo identificar y manejar diferentes situaciones
struct TV2Scenario: Codable, Identifiable {
    let id: UUID
    let title: String
    let situation: String
    let triggerIdentified: String
    let thoughtPatternIdentified: String
    let volcanoPhase: String
    let interventionApplied: String
    let outcome: String
    let lessonLearned: String
    
    /// Inicializador para crear un escenario
    /// - Parameters:
    ///   - title: Título del escenario
    ///   - situation: Descripción de la situación
    ///   - triggerIdentified: Qué botón se presionó
    ///   - thoughtPatternIdentified: Qué nube de humo apareció
    ///   - volcanoPhase: En qué fase del volcán está
    ///   - interventionApplied: Qué se hizo para ayudar
    ///   - outcome: Resultado de la intervención
    ///   - lessonLearned: Lección aprendida
    init(title: String, situation: String, triggerIdentified: String, thoughtPatternIdentified: String, volcanoPhase: String, interventionApplied: String, outcome: String, lessonLearned: String) {
        self.id = UUID()
        self.title = title
        self.situation = situation
        self.triggerIdentified = triggerIdentified
        self.thoughtPatternIdentified = thoughtPatternIdentified
        self.volcanoPhase = volcanoPhase
        self.interventionApplied = interventionApplied
        self.outcome = outcome
        self.lessonLearned = lessonLearned
    }
}

