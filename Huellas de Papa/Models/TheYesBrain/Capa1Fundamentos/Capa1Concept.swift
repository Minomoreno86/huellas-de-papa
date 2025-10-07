import Foundation

/// Modelo que representa el concepto fundamental del Yes Brain
/// Explica qué es el estado receptivo, integrador y flexible vs el estado defensivo y reactivo
struct Capa1Concept: Codable, Identifiable {
    let id: UUID
    let title: String
    let description: String
    let keyInsight: String
    
    /// Inicializador para crear un concepto del Yes Brain
    /// - Parameters:
    ///   - title: Título del concepto
    ///   - description: Explicación neuropsicológica en lenguaje parental
    ///   - keyInsight: Síntesis accionable (mantra)
    init(title: String, description: String, keyInsight: String) {
        self.id = UUID()
        self.title = title
        self.description = description
        self.keyInsight = keyInsight
    }
}
