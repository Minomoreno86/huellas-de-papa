import Foundation

/// Modelo que representa un escenario de aplicación práctica
/// Muestra cómo aplicar los principios de Bésame Mucho en situaciones reales
struct BM2Scenario: Codable, Identifiable {
    let id: UUID
    let principleNumber: Int
    let situation: String
    let commonMistake: String
    let besameMuchoResponse: String
    let expectedOutcome: String
    
    /// Inicializador para crear un escenario práctico
    /// - Parameters:
    ///   - principleNumber: Número del principio al que corresponde (1-12)
    ///   - situation: Situación cotidiana que enfrentan los padres
    ///   - commonMistake: Respuesta común incorrecta según el libro
    ///   - besameMuchoResponse: Respuesta correcta según Carlos González
    ///   - expectedOutcome: Resultado esperado de aplicar el principio
    init(principleNumber: Int, situation: String, commonMistake: String, besameMuchoResponse: String, expectedOutcome: String) {
        self.id = UUID()
        self.principleNumber = principleNumber
        self.situation = situation
        self.commonMistake = commonMistake
        self.besameMuchoResponse = besameMuchoResponse
        self.expectedOutcome = expectedOutcome
    }
}

