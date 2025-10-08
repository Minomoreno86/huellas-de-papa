import Foundation

/// Modelo que representa una sección teórica de la Capa 1
/// Contiene los bloques conceptuales del modelo del volcán
struct TV1Section: Codable, Identifiable {
    let id: UUID
    let title: String
    let subtitle: String
    let description: String
    let keyIdea: String
    
    /// Inicializador para crear una sección teórica
    /// - Parameters:
    ///   - title: Título principal de la sección
    ///   - subtitle: Subtítulo descriptivo
    ///   - description: Descripción del concepto
    ///   - keyIdea: Idea clave para aplicar
    init(title: String, subtitle: String, description: String, keyIdea: String) {
        self.id = UUID()
        self.title = title
        self.subtitle = subtitle
        self.description = description
        self.keyIdea = keyIdea
    }
}

