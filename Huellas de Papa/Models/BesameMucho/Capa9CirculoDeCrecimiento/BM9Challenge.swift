import Foundation
import SwiftUI

/// Modelo que representa un desafío semanal
struct BM9Challenge: Codable, Identifiable {
    let id: UUID
    let number: Int
    let title: String
    let description: String
    let icon: String
    let color: String
    let duration: String
    let tasks: [ChallengeTask]
    let reward: Int // puntos
    var isActive: Bool
    var isCompleted: Bool
    var startDate: Date?
    var completedDate: Date?
    
    init(number: Int, title: String, description: String, icon: String, color: String, duration: String, tasks: [ChallengeTask], reward: Int, isActive: Bool = false, isCompleted: Bool = false) {
        self.id = UUID()
        self.number = number
        self.title = title
        self.description = description
        self.icon = icon
        self.color = color
        self.duration = duration
        self.tasks = tasks
        self.reward = reward
        self.isActive = isActive
        self.isCompleted = isCompleted
        self.startDate = nil
        self.completedDate = nil
    }
}

/// Tarea dentro de un desafío
struct ChallengeTask: Codable, Identifiable {
    let id: UUID
    let description: String
    var isCompleted: Bool
    
    init(description: String, isCompleted: Bool = false) {
        self.id = UUID()
        self.description = description
        self.isCompleted = isCompleted
    }
}

