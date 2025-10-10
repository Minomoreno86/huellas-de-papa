import Foundation

/// Modelo que representa una decisión posible dentro de una simulación
/// Cada decisión tiene consecuencias y nivel de alineación con Bésame Mucho
struct BM4Decision: Codable, Identifiable {
    let id: UUID
    let text: String
    let alignment: AlignmentLevel
    let shortTermImpact: String
    let longTermImpact: String
    let bookExplanation: String
    let suggestedAlternatives: [String]?
    
    init(text: String, alignment: AlignmentLevel, shortTermImpact: String, longTermImpact: String, bookExplanation: String, suggestedAlternatives: [String]? = nil) {
        self.id = UUID()
        self.text = text
        self.alignment = alignment
        self.shortTermImpact = shortTermImpact
        self.longTermImpact = longTermImpact
        self.bookExplanation = bookExplanation
        self.suggestedAlternatives = suggestedAlternatives
    }
}

/// Nivel de alineación con los principios de Bésame Mucho
enum AlignmentLevel: String, Codable {
    case high = "Alta"
    case medium = "Media"
    case low = "Baja"
    
    var color: String {
        switch self {
        case .high: return "mint"
        case .medium: return "orange"
        case .low: return "red"
        }
    }
    
    var icon: String {
        switch self {
        case .high: return "checkmark.seal.fill"
        case .medium: return "exclamationmark.triangle.fill"
        case .low: return "xmark.circle.fill"
        }
    }
    
    var description: String {
        switch self {
        case .high: return "Totalmente alineada con Bésame Mucho"
        case .medium: return "Aceptable, pero hay mejores opciones"
        case .low: return "Contraria a los principios del libro"
        }
    }
}

