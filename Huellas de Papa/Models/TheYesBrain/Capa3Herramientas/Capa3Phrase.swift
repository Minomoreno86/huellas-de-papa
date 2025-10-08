import Foundation

/// Representa una frase de conexión o guion verbal asociado a una herramienta
struct YesBrainPhrase: Codable, Identifiable {
    let id: UUID
    let context: String            // "Cuando el niño se frustra…"
    let phrase: String             // "Veo que estás molesto; estoy contigo."
    let pillar: String             // Pilar asociado
    let icon: String              // Nombre del ícono SF Symbol
    let color: String             // Color principal
    
    init(context: String, phrase: String, pillar: String, icon: String, color: String) {
        self.id = UUID()
        self.context = context
        self.phrase = phrase
        self.pillar = pillar
        self.icon = icon
        self.color = color
    }
}
