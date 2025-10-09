import Foundation

/// Representa una herramienta práctica del libro para aplicar el amor incondicional
/// Basado en "¡Te amo cuando estás enojado!" de Erin Winters
struct TA3Tool: Codable, Identifiable {
    let id: UUID
    let name: String
    let category: String
    let objective: String
    let materials: [String]
    let steps: [String]
    let durationMinutes: Int
    let recommendedAge: String
    let bookReference: String
    let reflectionCue: String
    let icon: String
    let color: String
    
    /// Inicializador para crear una herramienta práctica
    /// - Parameters:
    ///   - name: Nombre de la herramienta
    ///   - category: Categoría (Validación, Conexión, Reflexión, etc.)
    ///   - objective: Objetivo emocional
    ///   - materials: Materiales necesarios
    ///   - steps: Pasos para aplicar la herramienta
    ///   - durationMinutes: Duración estimada
    ///   - recommendedAge: Edad recomendada
    ///   - bookReference: Referencia al libro de Erin Winters
    ///   - reflectionCue: Frase de reflexión final
    ///   - icon: Nombre del ícono SF Symbol
    ///   - color: Color principal
    init(name: String, category: String, objective: String, materials: [String], steps: [String], durationMinutes: Int, recommendedAge: String, bookReference: String, reflectionCue: String, icon: String, color: String) {
        self.id = UUID()
        self.name = name
        self.category = category
        self.objective = objective
        self.materials = materials
        self.steps = steps
        self.durationMinutes = durationMinutes
        self.recommendedAge = recommendedAge
        self.bookReference = bookReference
        self.reflectionCue = reflectionCue
        self.icon = icon
        self.color = color
    }
}

