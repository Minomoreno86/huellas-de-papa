import Foundation

/// Frases recordatorias para padres de las 12 estrategias
struct CN3Phrase: Codable, Identifiable {
    let id: UUID
    let text: String
    let strategyNumber: Int
    let context: String
    
    init(text: String, strategyNumber: Int, context: String) {
        self.id = UUID()
        self.text = text
        self.strategyNumber = strategyNumber
        self.context = context
    }
}

/// Frases motivacionales basadas en el libro
let cn3Phrases: [CN3Phrase] = [
    CN3Phrase(
        text: "Conecta primero, redirige después. En ese orden.",
        strategyNumber: 1,
        context: "Recordatorio antes de corregir comportamiento"
    ),
    CN3Phrase(
        text: "Nombra para dominar. Las palabras reducen el poder de la emoción.",
        strategyNumber: 2,
        context: "Cuando el niño está abrumado emocionalmente"
    ),
    CN3Phrase(
        text: "Las opciones involucran el cerebro superior. Las órdenes activan el inferior.",
        strategyNumber: 3,
        context: "En rutinas y transiciones difíciles"
    ),
    CN3Phrase(
        text: "El cerebro superior es un músculo. Ejercítalo o se debilita.",
        strategyNumber: 4,
        context: "Oportunidades de decisión y planificación"
    ),
    CN3Phrase(
        text: "Cuando el cuerpo se mueve, el cerebro se resetea.",
        strategyNumber: 5,
        context: "Niño atascado en emoción o inquieto"
    ),
    CN3Phrase(
        text: "Pausa, rebobina, avance rápido. Dale perspectiva a la experiencia.",
        strategyNumber: 6,
        context: "Niño abrumado por experiencia presente o pasada"
    ),
    CN3Phrase(
        text: "Recordar el pasado y planear el futuro construye identidad.",
        strategyNumber: 7,
        context: "Construyendo narrativa familiar"
    ),
    CN3Phrase(
        text: "Las emociones son como nubes. Vienen, pasan, se van.",
        strategyNumber: 8,
        context: "Enseñando que las emociones son temporales"
    ),
    CN3Phrase(
        text: "SIFT: Sensaciones, Imágenes, Sentimientos, Pensamientos. Observa tu mundo interior.",
        strategyNumber: 9,
        context: "Desarrollando autoconocimiento"
    ),
    CN3Phrase(
        text: "¿Cómo crees que se sintió el otro? Cada pregunta fortalece la empatía.",
        strategyNumber: 10,
        context: "Después de conflictos o leyendo libros"
    ),
    CN3Phrase(
        text: "La diversión familiar no es opcional. Es nutrición cerebral.",
        strategyNumber: 11,
        context: "Priorizando tiempo de conexión"
    ),
    CN3Phrase(
        text: "Los conflictos no rompen vínculos. La falta de reparación sí.",
        strategyNumber: 12,
        context: "Después de momentos difíciles"
    )
]

