import Foundation

/// Modelo que representa un patrón de pensamiento que alimenta el volcán ("nubes de humo")
/// Basado en el libro de Míriam Tirado sobre reestructuración cognitiva
struct TV2ThoughtPattern: Codable, Identifiable {
    let id: UUID
    let negativeThought: String
    let thoughtType: ThoughtType
    let whyItFeedsAnger: String
    let positiveAlternative: String
    let childExample: String
    
    enum ThoughtType: String, Codable {
        case generalization = "Generalización"
        case intentionality = "Intencionalidad Negativa"
        case catastrophizing = "Catastrofización"
        case selfCriticism = "Autocrítica Excesiva"
    }
    
    /// Inicializador para crear un patrón de pensamiento
    /// - Parameters:
    ///   - negativeThought: La "nube de humo" (pensamiento negativo)
    ///   - thoughtType: Tipo de distorsión cognitiva
    ///   - whyItFeedsAnger: Por qué alimenta la rabia
    ///   - positiveAlternative: La "nube de aire fresco" (alternativa realista)
    ///   - childExample: Ejemplo con lenguaje infantil
    init(negativeThought: String, thoughtType: ThoughtType, whyItFeedsAnger: String, positiveAlternative: String, childExample: String) {
        self.id = UUID()
        self.negativeThought = negativeThought
        self.thoughtType = thoughtType
        self.whyItFeedsAnger = whyItFeedsAnger
        self.positiveAlternative = positiveAlternative
        self.childExample = childExample
    }
}

