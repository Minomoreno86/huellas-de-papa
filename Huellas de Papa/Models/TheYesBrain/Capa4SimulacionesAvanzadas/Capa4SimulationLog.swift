import Foundation

/// Registro de progreso del usuario en simulaciones
struct Capa4SimulationLog: Codable, Identifiable {
    let id: UUID
    let scenarioId: UUID
    let chosenOptionId: UUID
    let successLevel: Int               // 0-100 (nivel de respuesta Yes Brain)
    let reflection: String              // Insight automático generado por la app
    let timestamp: Date                 // Momento de la simulación
    let attemptNumber: Int              // Número de intento en el mismo escenario
    
    init(scenarioId: UUID, chosenOptionId: UUID, successLevel: Int, reflection: String, attemptNumber: Int) {
        self.id = UUID()
        self.scenarioId = scenarioId
        self.chosenOptionId = chosenOptionId
        self.successLevel = successLevel
        self.reflection = reflection
        self.timestamp = Date()
        self.attemptNumber = attemptNumber
    }
}

