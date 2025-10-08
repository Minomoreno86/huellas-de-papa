import Foundation

/// Ejemplos prácticos de aplicación cotidiana.
struct Capa2Scenario: Codable, Identifiable {
    let id: UUID
    let situation: String          // "Rabieta por la tablet"
    let whatNotToDo: String        // Conducta del adulto en modo No Brain.
    let whatToDo: String           // Conducta del adulto en modo Yes Brain.
    let brainEffect: String        // Explicación neuroemocional.
    
    init(situation: String, whatNotToDo: String, whatToDo: String, brainEffect: String) {
        self.id = UUID()
        self.situation = situation
        self.whatNotToDo = whatNotToDo
        self.whatToDo = whatToDo
        self.brainEffect = brainEffect
    }
}