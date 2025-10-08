import Foundation

/// Modelo que representa un ejemplo de aplicación del modelo del volcán
/// Muestra escenarios reales de gestión de la rabia en niños
struct TV1Example: Codable, Identifiable {
    let id: UUID
    let scenario: String
    let childName: String
    let beforeManagement: String
    let afterManagement: String
    let clinicalInsight: String
    let volcanoPhase: VolcanoPhase
    
    enum VolcanoPhase: String, Codable {
        case chispa = "La Chispa Inicial"
        case burbujeo = "El Burbujeo"
        case erupcion = "La Gran Erupción"
    }
    
    /// Inicializador para crear un ejemplo clínico
    /// - Parameters:
    ///   - scenario: Descripción del escenario
    ///   - childName: Nombre del niño en el ejemplo
    ///   - beforeManagement: Reacción sin gestión del volcán
    ///   - afterManagement: Reacción aplicando herramientas
    ///   - clinicalInsight: Insight sobre el aprendizaje
    ///   - volcanoPhase: Fase del volcán en este ejemplo
    init(scenario: String, childName: String, beforeManagement: String, afterManagement: String, clinicalInsight: String, volcanoPhase: VolcanoPhase) {
        self.id = UUID()
        self.scenario = scenario
        self.childName = childName
        self.beforeManagement = beforeManagement
        self.afterManagement = afterManagement
        self.clinicalInsight = clinicalInsight
        self.volcanoPhase = volcanoPhase
    }
}

