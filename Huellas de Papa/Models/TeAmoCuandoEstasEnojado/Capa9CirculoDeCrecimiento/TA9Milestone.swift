import Foundation

/// Hito importante en el viaje del amor incondicional
struct TA9Milestone: Codable, Identifiable {
    let id: UUID
    let title: String
    let milestoneDescription: String
    let achieved: Bool
    let dateAchieved: Date?
    let celebration: String
    let iconName: String
    
    init(title: String, milestoneDescription: String, achieved: Bool = false, dateAchieved: Date? = nil, celebration: String, iconName: String) {
        self.id = UUID()
        self.title = title
        self.milestoneDescription = milestoneDescription
        self.achieved = achieved
        self.dateAchieved = dateAchieved
        self.celebration = celebration
        self.iconName = iconName
    }
}

