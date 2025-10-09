import Foundation

/// Recordatorio diario basado en las enseñanzas del libro
struct TA5Reminder: Codable, Identifiable {
    let id: UUID
    let title: String
    let message: String
    let bookQuote: String
    let whenToUse: String
    let iconName: String
    
    /// Inicializador para crear un recordatorio
    init(title: String, message: String, bookQuote: String, whenToUse: String, iconName: String) {
        self.id = UUID()
        self.title = title
        self.message = message
        self.bookQuote = bookQuote
        self.whenToUse = whenToUse
        self.iconName = iconName
    }
}

