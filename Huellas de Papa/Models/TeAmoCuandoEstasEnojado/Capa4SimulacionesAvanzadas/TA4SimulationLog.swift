import Foundation

/// Registro de una simulación completada
struct TA4SimulationLog: Codable, Identifiable {
    let id: UUID
    let scenarioId: UUID
    let date: Date
    let chosenOptionId: UUID
    let outcomeId: UUID
    let score: Int
    let timeSpent: Int
    
    init(scenarioId: UUID, chosenOptionId: UUID, outcomeId: UUID, score: Int, timeSpent: Int) {
        self.id = UUID()
        self.scenarioId = scenarioId
        self.date = Date()
        self.chosenOptionId = chosenOptionId
        self.outcomeId = outcomeId
        self.score = score
        self.timeSpent = timeSpent
    }
}

