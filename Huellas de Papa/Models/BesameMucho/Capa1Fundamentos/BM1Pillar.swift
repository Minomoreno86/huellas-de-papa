import Foundation

/// Modelo que representa uno de los cuatro pilares de la crianza con apego según Bésame Mucho
/// Contiene información sobre cada pilar fundamental de la crianza respetuosa
struct BM1Pillar: Codable, Identifiable {
    let id: UUID
    let name: String
    let definition: String
    let parentalExample: String
    let biologicalBasis: String
    
    /// Inicializador para crear un pilar de la crianza con apego
    /// - Parameters:
    ///   - name: Nombre del pilar (ej: "Contacto Físico", "Lactancia Prolongada", etc.)
    ///   - definition: Definición del concepto según Carlos González
    ///   - parentalExample: Ejemplo práctico para aplicar en casa
    ///   - biologicalBasis: Base biológica/evolutiva del comportamiento
    init(name: String, definition: String, parentalExample: String, biologicalBasis: String) {
        self.id = UUID()
        self.name = name
        self.definition = definition
        self.parentalExample = parentalExample
        self.biologicalBasis = biologicalBasis
    }
}

