import Foundation

/// Recordatorio preventivo basado en "Regar el Jardín Interior"
/// Las 6 necesidades básicas del libro de Míriam Tirado
struct TV5Reminder: Codable, Identifiable {
    let id: UUID
    let category: PreventionCategory
    let question: String
    let why: String
    let howToFix: String
    let iconName: String
    
    enum PreventionCategory: String, Codable {
        case sleep = "Sueño"
        case nutrition = "Alimentación"
        case movement = "Movimiento"
        case connection = "Conexión"
        case calm = "Momentos de Calma"
        case consistency = "Consistencia"
    }
    
    /// Inicializador para crear un recordatorio
    init(category: PreventionCategory, question: String, why: String, howToFix: String, iconName: String) {
        self.id = UUID()
        self.category = category
        self.question = question
        self.why = why
        self.howToFix = howToFix
        self.iconName = iconName
    }
}

