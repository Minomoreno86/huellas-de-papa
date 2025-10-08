import Foundation

/// Registro de una simulación completada
struct TV4SimulationLog: Codable, Identifiable {
    let id: UUID
    let scenarioId: UUID
    let scenarioTitle: String
    let dateCompleted: Date
    let optionChosen: String
    let responseType: TV4Option.ResponseType
    let rating: Int
    let reflection: String?
    
    /// Inicializador para crear un log
    init(scenarioId: UUID, scenarioTitle: String, dateCompleted: Date, optionChosen: String, responseType: TV4Option.ResponseType, rating: Int, reflection: String? = nil) {
        self.id = UUID()
        self.scenarioId = scenarioId
        self.scenarioTitle = scenarioTitle
        self.dateCompleted = dateCompleted
        self.optionChosen = optionChosen
        self.responseType = responseType
        self.rating = rating
        self.reflection = reflection
    }
}

