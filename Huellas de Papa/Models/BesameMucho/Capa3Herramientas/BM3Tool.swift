import Foundation

/// Modelo que representa una herramienta práctica de Bésame Mucho
/// Contiene instrucciones detalladas paso a paso para aplicar en la vida real
struct BM3Tool: Codable, Identifiable {
    let id: UUID
    let number: Int
    let title: String
    let whatItIs: String
    let whyItWorks: String
    let howToSteps: [String]
    let specificBenefits: [String]
    let mythsDebunked: [String]
    let whenToApply: String
    let category: ToolCategory
    
    /// Inicializador para crear una herramienta práctica
    init(number: Int, title: String, whatItIs: String, whyItWorks: String, howToSteps: [String], specificBenefits: [String], mythsDebunked: [String], whenToApply: String, category: ToolCategory) {
        self.id = UUID()
        self.number = number
        self.title = title
        self.whatItIs = whatItIs
        self.whyItWorks = whyItWorks
        self.howToSteps = howToSteps
        self.specificBenefits = specificBenefits
        self.mythsDebunked = mythsDebunked
        self.whenToApply = whenToApply
        self.category = category
    }
}

/// Categorías de herramientas
enum ToolCategory: String, Codable {
    case sleep = "Sueño"
    case feeding = "Alimentación"
    case contact = "Contacto"
    case communication = "Comunicación"
    case development = "Desarrollo"
    case limits = "Límites"
    
    var icon: String {
        switch self {
        case .sleep: return "moon.stars.fill"
        case .feeding: return "heart.circle.fill"
        case .contact: return "hands.sparkles.fill"
        case .communication: return "bubble.left.and.bubble.right.fill"
        case .development: return "figure.walk"
        case .limits: return "shield.fill"
        }
    }
    
    var color: String {
        switch self {
        case .sleep: return "indigo"
        case .feeding: return "pink"
        case .contact: return "blue"
        case .communication: return "mint"
        case .development: return "purple"
        case .limits: return "orange"
        }
    }
}

