import Foundation

/// Modelo que representa una actividad rápida para fortalecer el vínculo
/// Actividades de 15-30 minutos basadas en principios del libro
struct BM5Activity: Codable, Identifiable {
    let id: UUID
    let title: String
    let description: String
    let duration: String
    let steps: [String]
    let benefits: [String]
    let ageRange: String
    let category: SituationCategory
    
    init(title: String, description: String, duration: String, steps: [String], benefits: [String], ageRange: String, category: SituationCategory) {
        self.id = UUID()
        self.title = title
        self.description = description
        self.duration = duration
        self.steps = steps
        self.benefits = benefits
        self.ageRange = ageRange
        self.category = category
    }
}

