import Foundation

/// Representa pequeños recordatorios o frases de uso doméstico
struct YesBrainReminder: Codable, Identifiable {
    let id: UUID
    let context: String              // "Durante comidas", "Antes de dormir"
    let phrase: String               // "Tu calma enseña más que tus palabras."
    let tone: String                 // "Motivacional", "Empático", "Recordatorio breve"
    let icon: String                 // Nombre del ícono SF Symbol
    let color: String                // Color principal
    
    init(context: String, phrase: String, tone: String, icon: String, color: String) {
        self.id = UUID()
        self.context = context
        self.phrase = phrase
        self.tone = tone
        self.icon = icon
        self.color = color
    }
}

