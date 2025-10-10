import Foundation

/// Modelo que representa un ejemplo clínico/práctico de la Capa 1 de Bésame Mucho
/// Compara el enfoque autoritario vs. crianza con apego
struct BM1Example: Codable, Identifiable {
    let id: UUID
    let scenario: String
    let authoritarianApproach: String
    let attachmentApproach: String
    let clinicalInsight: String
    
    /// Inicializador para crear un ejemplo clínico
    /// - Parameters:
    ///   - scenario: Situación cotidiana con el niño
    ///   - authoritarianApproach: Respuesta desde crianza autoritaria
    ///   - attachmentApproach: Respuesta desde crianza con apego (Bésame Mucho)
    ///   - clinicalInsight: Explicación científica/biológica según Carlos González
    init(scenario: String, authoritarianApproach: String, attachmentApproach: String, clinicalInsight: String) {
        self.id = UUID()
        self.scenario = scenario
        self.authoritarianApproach = authoritarianApproach
        self.attachmentApproach = attachmentApproach
        self.clinicalInsight = clinicalInsight
    }
}

