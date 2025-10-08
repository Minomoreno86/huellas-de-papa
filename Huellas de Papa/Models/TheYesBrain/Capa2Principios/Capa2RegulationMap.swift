import Foundation

/// Representa señales de desbalance y estrategias de corrección.
struct Capa2RegulationMap: Codable, Identifiable {
    let id: UUID
    let principle: String          // "Balance", "Resiliencia"...
    let overActivation: String     // "Hiperreactivo, impulsivo..."
    let underActivation: String    // "Desconectado, pasivo..."
    let correctionStrategy: String // Qué hacer para volver al centro.
    
    init(principle: String, overActivation: String, underActivation: String, correctionStrategy: String) {
        self.id = UUID()
        self.principle = principle
        self.overActivation = overActivation
        self.underActivation = underActivation
        self.correctionStrategy = correctionStrategy
    }
}