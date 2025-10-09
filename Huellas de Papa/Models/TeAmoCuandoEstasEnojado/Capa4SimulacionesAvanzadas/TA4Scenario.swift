import Foundation

/// Escenario interactivo de simulación basado en el libro
/// "¡Te amo cuando estás enojado!" de Erin Winters
struct TA4Scenario: Codable, Identifiable {
    let id: UUID
    let title: String
    let category: String
    let trigger: String
    let description: String
    let childEmotion: String
    let bookReference: String
    let options: [TA4Option]
    let outcomes: [TA4Outcome]
    let insight: String
    let icon: String
    let color: String
    let difficulty: Int
    
    /// Inicializador para crear un escenario de simulación
    /// - Parameters:
    ///   - title: Título del escenario
    ///   - category: Categoría (Validación, Espacio, Normalización, etc.)
    ///   - trigger: Evento que inicia la situación
    ///   - description: Narrativa inicial
    ///   - childEmotion: Emoción principal del niño
    ///   - bookReference: Referencia al libro
    ///   - options: Opciones de respuesta
    ///   - outcomes: Resultados posibles
    ///   - insight: Aprendizaje emocional
    ///   - icon: Ícono SF Symbol
    ///   - color: Color principal
    ///   - difficulty: Nivel de dificultad (1-5)
    init(title: String, category: String, trigger: String, description: String, childEmotion: String, bookReference: String, options: [TA4Option], outcomes: [TA4Outcome], insight: String, icon: String, color: String, difficulty: Int) {
        self.id = UUID()
        self.title = title
        self.category = category
        self.trigger = trigger
        self.description = description
        self.childEmotion = childEmotion
        self.bookReference = bookReference
        self.options = options
        self.outcomes = outcomes
        self.insight = insight
        self.icon = icon
        self.color = color
        self.difficulty = difficulty
    }
}

