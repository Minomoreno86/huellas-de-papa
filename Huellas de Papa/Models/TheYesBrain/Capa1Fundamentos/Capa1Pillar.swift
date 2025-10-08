import Foundation

/// Modelo que representa uno de los cuatro pilares del Yes Brain
/// Contiene información detallada sobre cada pilar y su implementación práctica
struct Capa1Pillar: Codable, Identifiable {
    let id: UUID
    let name: String
    let definition: String
    let parentalExample: String
    let brainPathway: String
    
    /// Inicializador para crear un pilar del Yes Brain
    /// - Parameters:
    ///   - name: Nombre del pilar (ej: "Equilibrio", "Resiliencia", "Insight", "Empatía")
    ///   - definition: Definición del concepto
    ///   - parentalExample: Ejemplo práctico para aplicar en casa
    ///   - brainPathway: Descripción del circuito cerebral implicado
    init(name: String, definition: String, parentalExample: String, brainPathway: String) {
        self.id = UUID()
        self.name = name
        self.definition = definition
        self.parentalExample = parentalExample
        self.brainPathway = brainPathway
    }
}
