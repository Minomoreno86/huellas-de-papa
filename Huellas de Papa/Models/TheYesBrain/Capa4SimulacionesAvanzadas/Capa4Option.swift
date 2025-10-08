import Foundation

/// Respuestas posibles del usuario en una simulación
struct YesBrainScenarioOption: Codable, Identifiable {
    let id: UUID
    let text: String                    // "Le digo que se calme ahora mismo"
    let tone: String                    // "Autoritario", "Empático", "Evasivo"
    let nextOutcomeId: UUID             // Enlace con resultado
    let yesBrainAlignment: Int          // 0-100 (qué tan alineado está con Yes Brain)
    
    init(text: String, tone: String, nextOutcomeId: UUID, yesBrainAlignment: Int) {
        self.id = UUID()
        self.text = text
        self.tone = tone
        self.nextOutcomeId = nextOutcomeId
        self.yesBrainAlignment = yesBrainAlignment
    }
}

