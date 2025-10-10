import Foundation

/// Modelo que representa un error común a evitar según el libro
/// Errores típicos que critica Carlos González en Bésame Mucho
struct BM3CommonMistake: Codable, Identifiable {
    let id: UUID
    let mistake: String
    let whyItsWrong: String
    let correctAlternative: String
    
    init(mistake: String, whyItsWrong: String, correctAlternative: String) {
        self.id = UUID()
        self.mistake = mistake
        self.whyItsWrong = whyItsWrong
        self.correctAlternative = correctAlternative
    }
}

