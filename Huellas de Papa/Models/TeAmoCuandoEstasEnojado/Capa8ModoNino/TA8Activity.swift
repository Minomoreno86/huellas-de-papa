import Foundation

/// Actividad lúdica para niños basada en el libro
struct TA8Activity: Codable, Identifiable {
    let id: UUID
    let title: String
    let activityDescription: String
    let materials: [String]
    let steps: [String]
    let funFactor: Int // 1-5
    let ageRange: String
    let emotionFocus: String
    let iconName: String
    
    /// Inicializador para crear una actividad
    init(title: String, activityDescription: String, materials: [String], steps: [String], funFactor: Int, ageRange: String, emotionFocus: String, iconName: String) {
        self.id = UUID()
        self.title = title
        self.activityDescription = activityDescription
        self.materials = materials
        self.steps = steps
        self.funFactor = funFactor
        self.ageRange = ageRange
        self.emotionFocus = emotionFocus
        self.iconName = iconName
    }
}

