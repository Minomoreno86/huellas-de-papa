import Foundation

/// Modelo que representa uno de los cuatro pilares del modelo "Tengo un Volcán"
/// Basado en el libro de Míriam Tirado sobre gestión emocional de la rabia
struct TV1Pillar: Codable, Identifiable {
    let id: UUID
    let name: String
    let definition: String
    let practicalApplication: String
    let iconName: String
    
    /// Inicializador para crear un pilar del modelo del volcán
    /// - Parameters:
    ///   - name: Nombre del pilar
    ///   - definition: Definición del concepto según el libro
    ///   - practicalApplication: Aplicación práctica para padres e hijos
    ///   - iconName: Nombre del ícono SF Symbol
    init(name: String, definition: String, practicalApplication: String, iconName: String) {
        self.id = UUID()
        self.name = name
        self.definition = definition
        self.practicalApplication = practicalApplication
        self.iconName = iconName
    }
}

