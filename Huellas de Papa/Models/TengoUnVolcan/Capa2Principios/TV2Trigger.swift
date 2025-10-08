import Foundation

/// Modelo que representa un desencadenante ("botón") que activa el volcán
/// Basado en el libro de Míriam Tirado
struct TV2Trigger: Codable, Identifiable {
    let id: UUID
    let name: String
    let description: String
    let commonExamples: [String]
    let childPerspective: String
    let iconName: String
    
    /// Inicializador para crear un desencadenante
    /// - Parameters:
    ///   - name: Nombre del botón/desencadenante
    ///   - description: Qué lo activa
    ///   - commonExamples: Ejemplos comunes de situaciones
    ///   - childPerspective: Cómo lo vive el niño
    ///   - iconName: Nombre del ícono SF Symbol
    init(name: String, description: String, commonExamples: [String], childPerspective: String, iconName: String) {
        self.id = UUID()
        self.name = name
        self.description = description
        self.commonExamples = commonExamples
        self.childPerspective = childPerspective
        self.iconName = iconName
    }
}

