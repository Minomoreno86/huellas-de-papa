import Foundation

/// Modelo que representa un recordatorio visual
/// Frases del libro para recordar principios clave
struct BM5Reminder: Codable, Identifiable {
    let id: UUID
    let quote: String
    let context: String
    
    init(quote: String, context: String) {
        self.id = UUID()
        self.quote = quote
        self.context = context
    }
}

