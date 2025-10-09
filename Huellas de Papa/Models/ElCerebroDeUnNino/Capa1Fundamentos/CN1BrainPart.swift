import Foundation

/// Modelo que representa las diferentes partes del cerebro y sus funciones
/// Basado en el modelo del cerebro de Daniel Siegel
struct CN1BrainPart: Codable, Identifiable {
    let id: UUID
    let name: String
    let description: String
    let functions: [String]
    let developmentInfo: String
    let color: String
    let icon: String
    
    init(name: String, description: String, functions: [String], developmentInfo: String, color: String, icon: String) {
        self.id = UUID()
        self.name = name
        self.description = description
        self.functions = functions
        self.developmentInfo = developmentInfo
        self.color = color
        self.icon = icon
    }
}

/// Partes del cerebro según el modelo de integración de Siegel
let cn1BrainParts: [CN1BrainPart] = [
    CN1BrainPart(
        name: "Hemisferio Izquierdo",
        description: "El lado lógico, lingüístico y literal del cerebro",
        functions: [
            "Pensamiento lógico y analítico",
            "Lenguaje y comunicación verbal",
            "Pensamiento lineal y secuencial",
            "Comprensión de causa y efecto",
            "Organización y categorización"
        ],
        developmentInfo: "Se desarrolla más tarde que el hemisferio derecho. En niños pequeños está menos activo.",
        color: "blue",
        icon: "list.bullet"
    ),
    CN1BrainPart(
        name: "Hemisferio Derecho",
        description: "El lado emocional, creativo e intuitivo",
        functions: [
            "Procesamiento de emociones",
            "Comunicación no verbal (tono, expresiones)",
            "Pensamiento holístico e intuitivo",
            "Creatividad e imaginación",
            "Lectura de señales sociales"
        ],
        developmentInfo: "Dominante en bebés y niños pequeños. Procesa experiencias de forma emocional y global.",
        color: "pink",
        icon: "heart.fill"
    ),
    CN1BrainPart(
        name: "Cerebro Superior (Corteza)",
        description: "El CEO del cerebro - pensamiento complejo",
        functions: [
            "Toma de decisiones y planificación",
            "Autorregulación y control de impulsos",
            "Empatía y perspectiva social",
            "Pensamiento flexible y adaptativo",
            "Consideración de consecuencias"
        ],
        developmentInfo: "No madura completamente hasta los 25 años. Necesita ejercitarse constantemente.",
        color: "purple",
        icon: "brain.head.profile"
    ),
    CN1BrainPart(
        name: "Cerebro Inferior (Límbico y Tronco)",
        description: "El cerebro primitivo - supervivencia y emociones básicas",
        functions: [
            "Reacciones instintivas (lucha, huida, parálisis)",
            "Funciones corporales básicas",
            "Emociones intensas e inmediatas",
            "Respuestas automáticas y hábitos",
            "Memoria implícita"
        ],
        developmentInfo: "Completamente desarrollado al nacer. Reacciona rápidamente ante amenazas percibidas.",
        color: "orange",
        icon: "flame.fill"
    )
]

