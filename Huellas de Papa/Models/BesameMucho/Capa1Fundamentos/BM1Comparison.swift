import Foundation

/// Modelo que representa la comparación entre dos enfoques de crianza
/// Crianza Autoritaria vs. Crianza con Apego según Bésame Mucho
struct BM1Comparison: Codable, Identifiable {
    let id: UUID
    let aspect: String
    let authoritarianView: String
    let attachmentView: String
    
    /// Inicializador para crear una comparación de enfoques
    /// - Parameters:
    ///   - aspect: Aspecto de la crianza a comparar
    ///   - authoritarianView: Perspectiva autoritaria/tradicional
    ///   - attachmentView: Perspectiva de crianza con apego (Bésame Mucho)
    init(aspect: String, authoritarianView: String, attachmentView: String) {
        self.id = UUID()
        self.aspect = aspect
        self.authoritarianView = authoritarianView
        self.attachmentView = attachmentView
    }
}

