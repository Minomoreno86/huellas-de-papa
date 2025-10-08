import Foundation

/// Modelo que representa un principio fundamental del modelo "Tengo un Volcán"
/// Basado en el libro de Míriam Tirado
struct TV2Principle: Codable, Identifiable {
    let id: UUID
    let name: String
    let description: String
    let howItWorks: String
    let practicalExample: String
    let iconName: String
    let color: String
    
    /// Inicializador para crear un principio
    /// - Parameters:
    ///   - name: Nombre del principio
    ///   - description: Descripción del concepto
    ///   - howItWorks: Cómo funciona este principio
    ///   - practicalExample: Ejemplo práctico de aplicación
    ///   - iconName: Nombre del ícono SF Symbol
    ///   - color: Color asociado (blue, mint, orange, red, purple)
    init(name: String, description: String, howItWorks: String, practicalExample: String, iconName: String, color: String) {
        self.id = UUID()
        self.name = name
        self.description = description
        self.howItWorks = howItWorks
        self.practicalExample = practicalExample
        self.iconName = iconName
        self.color = color
    }
}

