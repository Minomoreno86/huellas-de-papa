import Foundation
import SwiftData

/// Desafío micro diario para el padre
/// Acciones específicas del libro para practicar
@Model
final class TA6Challenge {
    @Attribute(.unique) var id: UUID
    var date: Date
    var levelNumber: Int
    var challengeText: String
    var emotionToValidate: String
    var phraseToUse: String
    var completed: Bool
    var reflection: String?
    var authenticity: Int? // 1-5: qué tan auténtico se sintió
    
    init(
        date: Date = Date(),
        levelNumber: Int,
        challengeText: String,
        emotionToValidate: String,
        phraseToUse: String,
        completed: Bool = false,
        reflection: String? = nil,
        authenticity: Int? = nil
    ) {
        self.id = UUID()
        self.date = date
        self.levelNumber = levelNumber
        self.challengeText = challengeText
        self.emotionToValidate = emotionToValidate
        self.phraseToUse = phraseToUse
        self.completed = completed
        self.reflection = reflection
        self.authenticity = authenticity
    }
}

