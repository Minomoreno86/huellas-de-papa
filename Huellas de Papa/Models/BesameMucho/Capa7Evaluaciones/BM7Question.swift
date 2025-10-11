import Foundation
import SwiftUI

/// Modelo que representa una pregunta de evaluación
/// Pregunta con múltiples opciones y puntuación según alineación con el libro
struct BM7Question: Codable, Identifiable {
    let id: UUID
    let text: String
    let options: [QuestionOption]
    let category: String
    
    init(text: String, options: [QuestionOption], category: String) {
        self.id = UUID()
        self.text = text
        self.options = options
        self.category = category
    }
}

/// Opción de respuesta con puntuación
struct QuestionOption: Codable, Identifiable {
    let id: UUID
    let text: String
    let points: Double  // 0, 0.5, 1
    let feedback: String
    
    init(text: String, points: Double, feedback: String) {
        self.id = UUID()
        self.text = text
        self.points = points
        self.feedback = feedback
    }
}

