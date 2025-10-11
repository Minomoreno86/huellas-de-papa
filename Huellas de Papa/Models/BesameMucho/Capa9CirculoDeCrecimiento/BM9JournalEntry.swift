import Foundation
import SwiftUI

/// Modelo que representa una entrada del diario de reflexión
struct BM9JournalEntry: Codable, Identifiable {
    let id: UUID
    let date: Date
    var victories: String
    var challenges: String
    var learnings: String
    var specialMoments: String
    
    init(date: Date, victories: String = "", challenges: String = "", learnings: String = "", specialMoments: String = "") {
        self.id = UUID()
        self.date = date
        self.victories = victories
        self.challenges = challenges
        self.learnings = learnings
        self.specialMoments = specialMoments
    }
}

