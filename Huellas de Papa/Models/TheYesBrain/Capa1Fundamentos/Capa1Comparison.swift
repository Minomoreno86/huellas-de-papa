import Foundation

/// Modelo que representa la comparación entre estados Yes Brain y No Brain
/// Muestra cómo diferentes aspectos se comportan en cada modo cerebral
struct Capa1Comparison: Codable, Identifiable {
    let id: UUID
    let axis: String
    let yesState: String
    let noState: String
    
    /// Inicializador para crear una comparación Yes/No Brain
    /// - Parameters:
    ///   - axis: Ámbito de comparación (ej: "Emoción", "Aprendizaje", "Comunicación")
    ///   - yesState: Descripción del estado Yes Brain (integrado, receptivo)
    ///   - noState: Descripción del estado No Brain (defensivo, reactivo)
    init(axis: String, yesState: String, noState: String) {
        self.id = UUID()
        self.axis = axis
        self.yesState = yesState
        self.noState = noState
    }
}