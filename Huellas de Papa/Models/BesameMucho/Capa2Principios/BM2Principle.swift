import Foundation

/// Modelo que representa uno de los 12 principios fundamentales de Bésame Mucho
/// Contiene la explicación teórica y aplicación práctica de cada principio
struct BM2Principle: Codable, Identifiable {
    let id: UUID
    let number: Int
    let title: String
    let concept: String
    let explanation: String
    let practicalApplication: String
    let scientificBasis: String
    let block: PrincipleBlock
    
    /// Inicializador para crear un principio
    /// - Parameters:
    ///   - number: Número del principio (1-12)
    ///   - title: Título del principio según el libro
    ///   - concept: Concepto principal en una frase
    ///   - explanation: Explicación detallada del principio
    ///   - practicalApplication: Cómo aplicarlo en la vida real
    ///   - scientificBasis: Base científica/biológica del principio
    ///   - block: Bloque temático al que pertenece
    init(number: Int, title: String, concept: String, explanation: String, practicalApplication: String, scientificBasis: String, block: PrincipleBlock) {
        self.id = UUID()
        self.number = number
        self.title = title
        self.concept = concept
        self.explanation = explanation
        self.practicalApplication = practicalApplication
        self.scientificBasis = scientificBasis
        self.block = block
    }
}

/// Bloques temáticos que agrupan los principios
enum PrincipleBlock: String, Codable {
    case biologicalNeeds = "Necesidades Biológicas"
    case communicationResponse = "Comunicación y Respuesta"
    case developmentAutonomy = "Desarrollo y Autonomía"
    case respectfulParenting = "Crianza Respetuosa"
    
    var icon: String {
        switch self {
        case .biologicalNeeds: return "heart.circle.fill"
        case .communicationResponse: return "bubble.left.and.bubble.right.fill"
        case .developmentAutonomy: return "figure.walk"
        case .respectfulParenting: return "hands.sparkles.fill"
        }
    }
    
    var color: String {
        switch self {
        case .biologicalNeeds: return "blue"
        case .communicationResponse: return "mint"
        case .developmentAutonomy: return "purple"
        case .respectfulParenting: return "pink"
        }
    }
}

