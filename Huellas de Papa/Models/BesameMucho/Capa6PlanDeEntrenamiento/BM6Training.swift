import Foundation

/// Modelo que representa un entrenamiento específico
/// Programa completo para entrenar un aspecto de la crianza con apego
struct BM6Training: Codable, Identifiable {
    let id: UUID
    let number: Int
    let title: String
    let whatYouTrain: String
    let duration: String
    let difficulty: TrainingDifficulty
    let modules: [TrainingModule]
    let practicalExercises: [String]
    let evaluation: [String]
    let bookResources: [String]
    let category: TrainingCategory
    
    init(number: Int, title: String, whatYouTrain: String, duration: String, difficulty: TrainingDifficulty, modules: [TrainingModule], practicalExercises: [String], evaluation: [String], bookResources: [String], category: TrainingCategory) {
        self.id = UUID()
        self.number = number
        self.title = title
        self.whatYouTrain = whatYouTrain
        self.duration = duration
        self.difficulty = difficulty
        self.modules = modules
        self.practicalExercises = practicalExercises
        self.evaluation = evaluation
        self.bookResources = bookResources
        self.category = category
    }
}

/// Módulo dentro de un entrenamiento
struct TrainingModule: Codable, Identifiable {
    let id: UUID
    let title: String
    let description: String
    
    init(title: String, description: String) {
        self.id = UUID()
        self.title = title
        self.description = description
    }
}

/// Categorías de entrenamientos
enum TrainingCategory: String, Codable {
    case sleep = "Sueño"
    case feeding = "Lactancia"
    case contact = "Contacto"
    case communication = "Comunicación"
    case limits = "Límites"
    case externalPressure = "Presión Social"
    
    var icon: String {
        switch self {
        case .sleep: return "moon.stars.fill"
        case .feeding: return "heart.circle.fill"
        case .contact: return "hands.sparkles.fill"
        case .communication: return "bubble.left.and.bubble.right.fill"
        case .limits: return "shield.fill"
        case .externalPressure: return "person.3.fill"
        }
    }
    
    var color: String {
        switch self {
        case .sleep: return "indigo"
        case .feeding: return "pink"
        case .contact: return "blue"
        case .communication: return "mint"
        case .limits: return "orange"
        case .externalPressure: return "red"
        }
    }
}

/// Nivel de dificultad del entrenamiento
enum TrainingDifficulty: String, Codable {
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
    
    var color: String {
        switch self {
        case .beginner: return "green"
        case .intermediate: return "orange"
        case .advanced: return "red"
        }
    }
}

