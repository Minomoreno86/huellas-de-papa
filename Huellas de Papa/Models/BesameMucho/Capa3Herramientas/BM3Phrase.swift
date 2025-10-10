import Foundation

/// Modelo que representa una frase útil para situaciones específicas
/// Banco de frases extraídas del libro para usar con los hijos
struct BM3Phrase: Codable, Identifiable {
    let id: UUID
    let phrase: String
    let situation: PhraseCategory
    let context: String
    
    init(phrase: String, situation: PhraseCategory, context: String) {
        self.id = UUID()
        self.phrase = phrase
        self.situation = situation
        self.context = context
    }
}

/// Categorías de frases por situación
enum PhraseCategory: String, Codable, CaseIterable {
    case crying = "Ante el llanto"
    case tantrums = "Ante rabietas"
    case externalPressure = "Ante presión externa"
    case settingLimits = "Para poner límites"
    case emotionalValidation = "Validación emocional"
    
    var icon: String {
        switch self {
        case .crying: return "bubble.left.fill"
        case .tantrums: return "exclamationmark.bubble.fill"
        case .externalPressure: return "shield.fill"
        case .settingLimits: return "hand.raised.fill"
        case .emotionalValidation: return "heart.text.square.fill"
        }
    }
}

