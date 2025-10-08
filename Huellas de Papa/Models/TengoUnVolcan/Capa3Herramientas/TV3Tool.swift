import Foundation

/// Modelo que representa una herramienta práctica de la "Caja de Herramientas del Volcán"
/// Basado en el libro de Míriam Tirado
struct TV3Tool: Codable, Identifiable {
    let id: UUID
    let name: String
    let category: ToolCategory
    let objective: String
    let whenToUse: String
    let howItWorks: String
    let steps: [String]
    let materials: [String]
    let durationMinutes: String
    let recommendedPhase: [VolcanoPhase]
    let ageRange: String
    let fairyTip: String // Consejo del Hada del Volcán
    let iconName: String
    let color: String
    
    enum ToolCategory: String, Codable {
        case breathing = "Respiración"
        case distance = "Distanciamiento"
        case calm = "Calma"
        case communication = "Comunicación"
        case help = "Buscar Ayuda"
        case repair = "Reparación"
        case cognitive = "Reestructuración Cognitiva"
        case prevention = "Prevención"
    }
    
    enum VolcanoPhase: String, Codable {
        case chispa = "Chispa"
        case burbujeo = "Burbujeo"
        case erupcion = "Erupción"
        case postErupcion = "Post-Erupción"
    }
    
    /// Inicializador para crear una herramienta
    init(name: String, category: ToolCategory, objective: String, whenToUse: String, howItWorks: String, steps: [String], materials: [String], durationMinutes: String, recommendedPhase: [VolcanoPhase], ageRange: String, fairyTip: String, iconName: String, color: String) {
        self.id = UUID()
        self.name = name
        self.category = category
        self.objective = objective
        self.whenToUse = whenToUse
        self.howItWorks = howItWorks
        self.steps = steps
        self.materials = materials
        self.durationMinutes = durationMinutes
        self.recommendedPhase = recommendedPhase
        self.ageRange = ageRange
        self.fairyTip = fairyTip
        self.iconName = iconName
        self.color = color
    }
}

