import Foundation

/// Capítulo del cuento "¡Te amo cuando estás enojado!"
/// Basado en el libro de Erin Winters
struct TA8StoryChapter: Codable, Identifiable {
    let id: UUID
    let chapterNumber: Int
    let title: String
    let narrative: String
    let illustration: String
    let emotion: String
    let lovePhrase: String
    let interactiveQuestion: String
    
    /// Inicializador para crear un capítulo del cuento
    init(chapterNumber: Int, title: String, narrative: String, illustration: String, emotion: String, lovePhrase: String, interactiveQuestion: String) {
        self.id = UUID()
        self.chapterNumber = chapterNumber
        self.title = title
        self.narrative = narrative
        self.illustration = illustration
        self.emotion = emotion
        self.lovePhrase = lovePhrase
        self.interactiveQuestion = interactiveQuestion
    }
}

