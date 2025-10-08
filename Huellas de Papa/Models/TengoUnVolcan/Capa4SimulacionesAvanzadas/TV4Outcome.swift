import Foundation

/// Resultado de una opción elegida en la simulación
struct TV4Outcome: Codable, Identifiable {
    let id: UUID
    let childReaction: String
    let volcanoEffect: VolcanoEffect
    let parentEmotion: String
    let longTermImpact: String
    let whyThisHappened: String
    let whatToDoNext: String
    let rating: Int // 1-5 estrellas
    
    enum VolcanoEffect: String, Codable {
        case decreased = "Volcán Disminuyó"
        case maintained = "Volcán Estable"
        case increased = "Volcán Aumentó"
        case exploded = "Volcán Explotó"
    }
    
    /// Inicializador para crear un resultado
    init(childReaction: String, volcanoEffect: VolcanoEffect, parentEmotion: String, longTermImpact: String, whyThisHappened: String, whatToDoNext: String, rating: Int) {
        self.id = UUID()
        self.childReaction = childReaction
        self.volcanoEffect = volcanoEffect
        self.parentEmotion = parentEmotion
        self.longTermImpact = longTermImpact
        self.whyThisHappened = whyThisHappened
        self.whatToDoNext = whatToDoNext
        self.rating = rating
    }
}

