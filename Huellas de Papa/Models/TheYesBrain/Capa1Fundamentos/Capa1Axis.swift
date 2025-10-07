import Foundation

/// Modelo que representa los ejes neurobiológicos clave en el Yes Brain
/// Describe cómo diferentes áreas cerebrales influyen en la regulación emocional
struct Capa1Axis: Codable, Identifiable {
    let id: UUID
    let name: String
    let role: String
    let parentImpact: String
    
    /// Inicializador para crear un eje neurobiológico
    /// - Parameters:
    ///   - name: Nombre del eje (ej: "Amígdala", "Corteza prefrontal")
    ///   - role: Función específica en la regulación emocional
    ///   - parentImpact: Cómo influye el estado del adulto en este eje
    init(name: String, role: String, parentImpact: String) {
        self.id = UUID()
        self.name = name
        self.role = role
        self.parentImpact = parentImpact
    }
}
