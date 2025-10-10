import Foundation

/// Modelo que representa una simulación interactiva completa
/// Situación compleja con múltiples decisiones y consecuencias según el libro
struct BM4Simulation: Codable, Identifiable {
    let id: UUID
    let number: Int
    let title: String
    let context: String
    let initialSituation: String
    let externalPressures: [String]
    let decisions: [BM4Decision]
    let category: SimulationCategory
    let difficulty: SimulationDifficulty
    
    init(number: Int, title: String, context: String, initialSituation: String, externalPressures: [String], decisions: [BM4Decision], category: SimulationCategory, difficulty: SimulationDifficulty) {
        self.id = UUID()
        self.number = number
        self.title = title
        self.context = context
        self.initialSituation = initialSituation
        self.externalPressures = externalPressures
        self.decisions = decisions
        self.category = category
        self.difficulty = difficulty
    }
}

/// Categorías de simulaciones
enum SimulationCategory: String, Codable {
    case sleep = "Sueño"
    case feeding = "Lactancia"
    case separation = "Separación"
    case discipline = "Disciplina"
    case development = "Desarrollo"
    case externalPressure = "Presión Social"
    
    var icon: String {
        switch self {
        case .sleep: return "moon.stars.fill"
        case .feeding: return "heart.circle.fill"
        case .separation: return "figure.2.and.child.holdinghands"
        case .discipline: return "shield.fill"
        case .development: return "figure.walk"
        case .externalPressure: return "person.3.fill"
        }
    }
    
    var color: String {
        switch self {
        case .sleep: return "indigo"
        case .feeding: return "pink"
        case .separation: return "blue"
        case .discipline: return "orange"
        case .development: return "purple"
        case .externalPressure: return "red"
        }
    }
}

/// Nivel de dificultad de la simulación
enum SimulationDifficulty: String, Codable {
    case beginner = "Principiante"
    case intermediate = "Intermedio"
    case advanced = "Avanzado"
    
    var stars: Int {
        switch self {
        case .beginner: return 1
        case .intermediate: return 2
        case .advanced: return 3
        }
    }
}

