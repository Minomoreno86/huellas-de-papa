import Foundation

/// Modelo que representa una sección teórica de la Capa 1
/// Contiene los fundamentos conceptuales del libro de Erin Winters
struct TA1Section: Codable, Identifiable {
    let id: UUID
    let title: String
    let subtitle: String
    let description: String
    let keyIdea: String
    
    /// Inicializador para crear una sección teórica
    /// - Parameters:
    ///   - title: Título principal de la sección
    ///   - subtitle: Subtítulo descriptivo
    ///   - description: Descripción detallada del concepto
    ///   - keyIdea: Idea clave accionable para los padres
    init(title: String, subtitle: String, description: String, keyIdea: String) {
        self.id = UUID()
        self.title = title
        self.subtitle = subtitle
        self.description = description
        self.keyIdea = keyIdea
    }
}

