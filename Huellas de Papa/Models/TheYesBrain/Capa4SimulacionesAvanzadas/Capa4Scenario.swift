import Foundation

/// Escenario interactivo de simulación emocional
struct Capa4Scenario: Codable, Identifiable {
    let id: UUID
    let title: String                   // "Rabieta en el supermercado"
    let category: String                // "Reactividad", "Estrés", "Vínculo", "Insight"
    let trigger: String                 // Evento que inicia la situación
    let description: String             // Narrativa inicial
    let options: [YesBrainScenarioOption]          // Respuestas posibles
    let outcomes: [YesBrainScenarioOutcome]        // Resultados simulados según elección
    let insight: String                 // Aprendizaje neuroemocional
    let pillarLinked: UUID?             // Vinculación con pilar de Capa 2
    let icon: String                    // Nombre del ícono SF Symbol
    let color: String                   // Color principal
    let difficulty: Int                 // 1-5 (nivel de desafío emocional)
    
    init(title: String, category: String, trigger: String, description: String, options: [YesBrainScenarioOption], outcomes: [YesBrainScenarioOutcome], insight: String, pillarLinked: UUID? = nil, icon: String, color: String, difficulty: Int) {
        self.id = UUID()
        self.title = title
        self.category = category
        self.trigger = trigger
        self.description = description
        self.options = options
        self.outcomes = outcomes
        self.insight = insight
        self.pillarLinked = pillarLinked
        self.icon = icon
        self.color = color
        self.difficulty = difficulty
    }
}

