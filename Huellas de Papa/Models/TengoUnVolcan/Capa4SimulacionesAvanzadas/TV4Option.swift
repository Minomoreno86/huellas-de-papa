import Foundation

/// Opción de respuesta en una simulación
struct TV4Option: Codable, Identifiable {
    let id: UUID
    let text: String
    let responseType: ResponseType
    let outcome: TV4Outcome
    
    enum ResponseType: String, Codable {
        case effective = "Efectiva"
        case needsWork = "Necesita Mejorar"
        case counterproductive = "Contraproducente"
    }
    
    /// Inicializador para crear una opción
    init(text: String, responseType: ResponseType, outcome: TV4Outcome) {
        self.id = UUID()
        self.text = text
        self.responseType = responseType
        self.outcome = outcome
    }
}

