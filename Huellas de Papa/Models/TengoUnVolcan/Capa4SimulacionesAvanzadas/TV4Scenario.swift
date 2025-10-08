import Foundation

/// Escenario interactivo de simulación para practicar respuestas ante el volcán del hijo
/// Basado en el libro de Míriam Tirado
struct TV4Scenario: Codable, Identifiable {
    let id: UUID
    let title: String
    let childName: String
    let childAge: String
    let volcanoPhase: VolcanoPhase
    let trigger: String
    let situation: String
    let physicalSignals: [String]
    let thoughtPattern: String
    let options: [TV4Option]
    let insight: String
    let toolsRecommended: [String]
    let difficulty: Int // 1-5
    let iconName: String
    let color: String
    
    enum VolcanoPhase: String, Codable {
        case chispa = "Chispa Inicial"
        case burbujeo = "Burbujeo"
        case erupcion = "Erupción"
    }
    
    /// Inicializador para crear un escenario
    init(title: String, childName: String, childAge: String, volcanoPhase: VolcanoPhase, trigger: String, situation: String, physicalSignals: [String], thoughtPattern: String, options: [TV4Option], insight: String, toolsRecommended: [String], difficulty: Int, iconName: String, color: String) {
        self.id = UUID()
        self.title = title
        self.childName = childName
        self.childAge = childAge
        self.volcanoPhase = volcanoPhase
        self.trigger = trigger
        self.situation = situation
        self.physicalSignals = physicalSignals
        self.thoughtPattern = thoughtPattern
        self.options = options
        self.insight = insight
        self.toolsRecommended = toolsRecommended
        self.difficulty = difficulty
        self.iconName = iconName
        self.color = color
    }
}

