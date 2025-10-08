import Foundation

/// Modelo que representa una señal física del "mapa del volcán"
/// Basado en las manifestaciones corporales de la rabia descritas en el libro
struct TV1PhysicalSignal: Codable, Identifiable {
    let id: UUID
    let bodyPart: String
    let description: String
    let phase: VolcanoPhase
    let iconName: String
    
    enum VolcanoPhase: String, Codable {
        case chispa = "La Chispa Inicial"
        case burbujeo = "El Burbujeo"
        case erupcion = "La Gran Erupción"
    }
    
    /// Inicializador para crear una señal física
    /// - Parameters:
    ///   - bodyPart: Parte del cuerpo afectada
    ///   - description: Descripción de la sensación
    ///   - phase: Fase del volcán en la que aparece
    ///   - iconName: Nombre del ícono SF Symbol
    init(bodyPart: String, description: String, phase: VolcanoPhase, iconName: String) {
        self.id = UUID()
        self.bodyPart = bodyPart
        self.description = description
        self.phase = phase
        self.iconName = iconName
    }
}

