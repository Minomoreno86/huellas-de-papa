import Foundation

/// Modelo que representa una situación cotidiana con guía de aplicación práctica
/// Basado en casos reales del libro Bésame Mucho
struct BM5Situation: Codable, Identifiable {
    let id: UUID
    let number: Int
    let title: String
    let context: String
    let preparation: [String]
    let implementationSteps: [String]
    let commonObstacles: [Obstacle]
    let bookQuotes: [String]
    let ageRange: String
    let category: SituationCategory
    
    init(number: Int, title: String, context: String, preparation: [String], implementationSteps: [String], commonObstacles: [Obstacle], bookQuotes: [String], ageRange: String, category: SituationCategory) {
        self.id = UUID()
        self.number = number
        self.title = title
        self.context = context
        self.preparation = preparation
        self.implementationSteps = implementationSteps
        self.commonObstacles = commonObstacles
        self.bookQuotes = bookQuotes
        self.ageRange = ageRange
        self.category = category
    }
}

/// Obstáculo común con su solución
struct Obstacle: Codable, Identifiable {
    let id: UUID
    let obstacle: String
    let solution: String
    
    init(obstacle: String, solution: String) {
        self.id = UUID()
        self.obstacle = obstacle
        self.solution = solution
    }
}

/// Categorías de situaciones
enum SituationCategory: String, Codable {
    case sleep = "Sueño"
    case feeding = "Lactancia"
    case contact = "Contacto"
    case limits = "Límites"
    
    var icon: String {
        switch self {
        case .sleep: return "moon.stars.fill"
        case .feeding: return "heart.circle.fill"
        case .contact: return "hands.sparkles.fill"
        case .limits: return "shield.fill"
        }
    }
    
    var color: String {
        switch self {
        case .sleep: return "indigo"
        case .feeding: return "pink"
        case .contact: return "blue"
        case .limits: return "orange"
        }
    }
}

