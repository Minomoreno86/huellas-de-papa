import Foundation

/// Tipos de evaluación disponibles
struct CN7Evaluation: Codable, Identifiable {
    let id: UUID
    let title: String
    let description: String
    let type: CN7Result.EvaluationType
    let questions: [CN7Question]
    let duration: String
    let icon: String
    let color: String
    
    init(title: String, description: String, type: CN7Result.EvaluationType, questions: [CN7Question], duration: String, icon: String, color: String) {
        self.id = UUID()
        self.title = title
        self.description = description
        self.type = type
        self.questions = questions
        self.duration = duration
        self.icon = icon
        self.color = color
    }
}

/// Evaluaciones disponibles
let cn7Evaluations: [CN7Evaluation] = [
    CN7Evaluation(
        title: "Evaluación de Comprensión",
        description: "Verifica tu entendimiento de los conceptos clave del libro",
        type: .comprehension,
        questions: cn7Questions.filter { $0.strategyRelated == nil || $0.questionType == .multipleChoice },
        duration: "10-15 minutos",
        icon: "book.fill",
        color: "blue"
    ),
    
    CN7Evaluation(
        title: "Auto-Evaluación de Aplicación",
        description: "Reflexiona honestamente sobre cómo aplicas las estrategias",
        type: .selfAssessment,
        questions: cn7Questions.filter { $0.questionType == .scale || $0.questionType == .selfReflection },
        duration: "15-20 minutos",
        icon: "person.crop.circle.badge.checkmark",
        color: "purple"
    ),
    
    CN7Evaluation(
        title: "Evaluación de Escenarios",
        description: "Aplica las estrategias a situaciones prácticas",
        type: .application,
        questions: cn7Questions.filter { $0.questionType == .scenario || ($0.strategyRelated != nil && $0.questionType == .multipleChoice) },
        duration: "20-25 minutos",
        icon: "theatermasks.fill",
        color: "green"
    )
]

