import Foundation

/// Citas motivacionales o científicas relevantes.
struct Capa2Quote: Codable, Identifiable {
    let id: UUID
    let text: String
    let author: String
    
    init(text: String, author: String) {
        self.id = UUID()
        self.text = text
        self.author = author
    }
}