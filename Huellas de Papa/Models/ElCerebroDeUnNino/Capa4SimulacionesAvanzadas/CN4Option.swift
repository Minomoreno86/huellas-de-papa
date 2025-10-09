import Foundation

/// Opción de respuesta en una simulación
struct CN4Option: Codable, Identifiable {
    let id: UUID
    let text: String                    // Texto de la opción
    let strategyUsed: Int?              // 1-12, qué estrategia se está usando (opcional)
    let brainApproach: String           // "Conecta primero", "Involucra cerebro superior", etc.
    let isRecommended: Bool             // Si es la opción más alineada con el libro
    
    init(text: String, strategyUsed: Int? = nil, brainApproach: String, isRecommended: Bool) {
        self.id = UUID()
        self.text = text
        self.strategyUsed = strategyUsed
        self.brainApproach = brainApproach
        self.isRecommended = isRecommended
    }
}

