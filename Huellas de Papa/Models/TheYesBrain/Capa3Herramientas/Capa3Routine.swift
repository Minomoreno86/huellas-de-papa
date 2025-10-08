import Foundation

/// Permite agrupar herramientas por rutina diaria
struct YesBrainRoutine: Codable, Identifiable {
    let id: UUID
    let title: String              // "Rutina de la mañana con cerebro Sí"
    let description: String
    let tools: [UUID]              // IDs de herramientas incluidas
    let durationMinutes: Int
    let category: String           // "Mañana", "Noche", "Transiciones", "Crisis"
    let icon: String              // Nombre del ícono SF Symbol
    let color: String             // Color principal
    
    init(title: String, description: String, tools: [UUID], durationMinutes: Int, category: String, icon: String, color: String) {
        self.id = UUID()
        self.title = title
        self.description = description
        self.tools = tools
        self.durationMinutes = durationMinutes
        self.category = category
        self.icon = icon
        self.color = color
    }
}
