import Foundation

/// Capítulo del cuento "Tengo un Volcán"
/// Basado en el libro de Míriam Tirado & Joan Turu
struct TV8StoryChapter: Codable, Identifiable {
    let id: UUID
    let chapterNumber: Int
    let title: String
    let narrative: String
    let illustration: String // Descripción de la ilustración o SF Symbol
    let emotion: String
    let learningPoint: String
    let interactiveQuestion: String? // Pregunta para el niño
    
    init(chapterNumber: Int, title: String, narrative: String, illustration: String, emotion: String, learningPoint: String, interactiveQuestion: String? = nil) {
        self.id = UUID()
        self.chapterNumber = chapterNumber
        self.title = title
        self.narrative = narrative
        self.illustration = illustration
        self.emotion = emotion
        self.learningPoint = learningPoint
        self.interactiveQuestion = interactiveQuestion
    }
}

