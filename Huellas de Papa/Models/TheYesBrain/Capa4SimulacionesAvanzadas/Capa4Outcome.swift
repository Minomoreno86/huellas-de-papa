import Foundation

/// Consecuencia emocional simulada basada en la elección del usuario
struct YesBrainScenarioOutcome: Codable, Identifiable {
    let id: UUID
    let childReaction: String           // "El niño grita más fuerte."
    let brainState: String              // "Amígdala activa, desconexión."
    let visualCue: String               // "Rojo brillante", "Respiración lenta", etc.
    let narratorFeedback: String        // "Has reaccionado desde el No Brain."
    let recommendation: String          // "Prueba una frase de validación calmada"
    let successLevel: Int               // 0-100 (nivel de respuesta Yes Brain)
    let emotionalImpact: String         // "Negativo", "Neutral", "Positivo"
    
    init(childReaction: String, brainState: String, visualCue: String, narratorFeedback: String, recommendation: String, successLevel: Int, emotionalImpact: String) {
        self.id = UUID()
        self.childReaction = childReaction
        self.brainState = brainState
        self.visualCue = visualCue
        self.narratorFeedback = narratorFeedback
        self.recommendation = recommendation
        self.successLevel = successLevel
        self.emotionalImpact = emotionalImpact
    }
}

