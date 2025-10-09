import Foundation
import SwiftData

/// Nivel de entrenamiento para el padre en amor incondicional
/// Sistema progresivo basado en el libro de Erin Winters
@Model
final class TA6Level {
    @Attribute(.unique) var id: UUID
    var levelNumber: Int
    var title: String
    var description: String
    var mission: String
    var dailyChallenge: String
    var reflectionQuestion: String
    var bookReference: String
    var estimatedDays: String
    var completed: Bool
    var completedAt: Date?
    var icon: String
    var color: String
    var nextLevelId: UUID?
    
    init(
        levelNumber: Int,
        title: String,
        description: String,
        mission: String,
        dailyChallenge: String,
        reflectionQuestion: String,
        bookReference: String,
        estimatedDays: String,
        completed: Bool = false,
        completedAt: Date? = nil,
        icon: String,
        color: String,
        nextLevelId: UUID? = nil
    ) {
        self.id = UUID()
        self.levelNumber = levelNumber
        self.title = title
        self.description = description
        self.mission = mission
        self.dailyChallenge = dailyChallenge
        self.reflectionQuestion = reflectionQuestion
        self.bookReference = bookReference
        self.estimatedDays = estimatedDays
        self.completed = completed
        self.completedAt = completedAt
        self.icon = icon
        self.color = color
        self.nextLevelId = nextLevelId
    }
}

