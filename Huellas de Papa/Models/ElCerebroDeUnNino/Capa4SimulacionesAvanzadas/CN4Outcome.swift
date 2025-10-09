import Foundation

/// Resultado de una opción elegida en la simulación
struct CN4Outcome: Codable, Identifiable {
    let id: UUID
    let optionId: UUID                  // Relacionado con CN4Option
    let immediateReaction: String       // Qué pasa inmediatamente
    let childBrainState: String         // Estado del cerebro del niño
    let parentFeeling: String           // Cómo se siente el padre
    let longTermImpact: String          // Impacto a largo plazo
    let score: Int                      // 1-10, qué tan efectivo
    let feedback: String                // Retroalimentación educativa
    
    init(optionId: UUID, immediateReaction: String, childBrainState: String, parentFeeling: String, longTermImpact: String, score: Int, feedback: String) {
        self.id = UUID()
        self.optionId = optionId
        self.immediateReaction = immediateReaction
        self.childBrainState = childBrainState
        self.parentFeeling = parentFeeling
        self.longTermImpact = longTermImpact
        self.score = score
        self.feedback = feedback
    }
}

