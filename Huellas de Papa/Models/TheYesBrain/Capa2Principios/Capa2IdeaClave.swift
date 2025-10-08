import Foundation

/// Representa una idea clave del libro The Yes Brain enfocada en la crianza práctica
struct Capa2IdeaClave: Codable, Identifiable {
    let id: UUID
    let titulo: String                    // "La Ventana de Tolerancia"
    let subtitulo: String            // "Regulación emocional en tiempo real"
    let ideaCentral: String          // Descripción de la idea principal
    let consejosAplicacion: String   // Consejos prácticos para padres
    let ejemplosPracticos: [String]  // Ejemplos de situaciones cotidianas
    let estrategiasPracticas: [String] // Técnicas específicas para aplicar
    let fraseInspiradora: String    // Cita del libro o interpretada
    let autor: String               // Siegel, Bryson, etc.
    let nivelDificultad: Int         // 1-5
    let categoria: String           // "Regulación", "Conexión", etc.
    let icono: String               // Nombre del ícono SF Symbol
    let color: String               // Color principal
    
    init(titulo: String, subtitulo: String, ideaCentral: String, consejosAplicacion: String, ejemplosPracticos: [String], estrategiasPracticas: [String], fraseInspiradora: String, autor: String, nivelDificultad: Int, categoria: String, icono: String, color: String) {
        self.id = UUID()
        self.titulo = titulo
        self.subtitulo = subtitulo
        self.ideaCentral = ideaCentral
        self.consejosAplicacion = consejosAplicacion
        self.ejemplosPracticos = ejemplosPracticos
        self.estrategiasPracticas = estrategiasPracticas
        self.fraseInspiradora = fraseInspiradora
        self.autor = autor
        self.nivelDificultad = nivelDificultad
        self.categoria = categoria
        self.icono = icono
        self.color = color
    }
}
