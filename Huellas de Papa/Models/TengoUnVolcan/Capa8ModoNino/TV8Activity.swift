import Foundation

/// Actividad creativa para niños basada en el libro
struct TV8Activity: Codable, Identifiable {
    let id: UUID
    let title: String
    let description: String
    let materials: [String]
    let steps: [String]
    let ageRange: String
    let iconName: String
    
    init(title: String, description: String, materials: [String], steps: [String], ageRange: String, iconName: String) {
        self.id = UUID()
        self.title = title
        self.description = description
        self.materials = materials
        self.steps = steps
        self.ageRange = ageRange
        self.iconName = iconName
    }
}

