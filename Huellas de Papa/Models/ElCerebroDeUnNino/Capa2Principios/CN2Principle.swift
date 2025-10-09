import Foundation

/// Representa un principio central del Cerebro del Niño de Daniel Siegel
/// Agrupa estrategias relacionadas bajo un tema neuropsicológico
struct CN2Principle: Codable, Identifiable {
    let id: UUID
    let name: String               // Nombre del principio
    let subtitle: String           // Subtítulo descriptivo
    let definition: String         // Descripción clínica breve
    let neuroBasis: String         // Base neurobiológica
    let relatedStrategies: [Int]   // Números de estrategias relacionadas
    let keyInsight: String         // Insight clave
    let practicalApplication: String // Aplicación práctica
    let icon: String               // Icono SF Symbol
    let color: String              // Color asociado
    
    init(name: String, subtitle: String, definition: String, neuroBasis: String, relatedStrategies: [Int], keyInsight: String, practicalApplication: String, icon: String, color: String) {
        self.id = UUID()
        self.name = name
        self.subtitle = subtitle
        self.definition = definition
        self.neuroBasis = neuroBasis
        self.relatedStrategies = relatedStrategies
        self.keyInsight = keyInsight
        self.practicalApplication = practicalApplication
        self.icon = icon
        self.color = color
    }
}

/// Los 4 Principios fundamentales del libro "El Cerebro del Niño"
let cn2Principles: [CN2Principle] = [
    CN2Principle(
        name: "Integración Horizontal",
        subtitle: "Conectando hemisferios izquierdo y derecho",
        definition: "El cerebro tiene dos hemisferios que procesan información de manera diferente. El hemisferio izquierdo es lógico, lingüístico y literal. El derecho es emocional, no verbal y holístico. La integración horizontal permite que ambos trabajen juntos, resultando en un niño que puede ser tanto emocional como lógico.",
        neuroBasis: "El cuerpo calloso conecta los dos hemisferios. En niños pequeños, esta conexión aún está en desarrollo. Las experiencias que integran lógica y emoción fortalecen estas conexiones neuronales, permitiendo procesamiento más completo de experiencias.",
        relatedStrategies: [1, 2], // Conecta y Redirige, Nombra para Dominar
        keyInsight: "Los niños pequeños son dominados por el hemisferio derecho emocional. Antes de apelar a la lógica (izquierdo), primero conecta con la emoción (derecho).",
        practicalApplication: "Cuando tu hijo está alterado: 1) Conecta con hemisferio derecho (abrazo, tono empático, validación emocional). 2) Una vez calmado, ayuda a contar la historia con palabras (hemisferio izquierdo) para integrar la experiencia.",
        icon: "rectangle.split.2x1.fill",
        color: "blue"
    ),
    CN2Principle(
        name: "Integración Vertical",
        subtitle: "Del cerebro inferior reactivo al superior reflexivo",
        definition: "El cerebro tiene partes 'inferiores' primitivas (tronco cerebral y sistema límbico) que controlan funciones básicas y reacciones instintivas, y partes 'superiores' (corteza cerebral) que permiten razonamiento, regulación y toma de decisiones. La integración vertical ayuda al cerebro superior a regular al inferior.",
        neuroBasis: "El cerebro inferior está completamente desarrollado al nacer. El cerebro superior (especialmente la corteza prefrontal) no madura hasta los 25 años. Nuestro papel es 'ejercitar' el cerebro superior como un músculo, fortaleciendo las conexiones entre corteza y amígdala.",
        relatedStrategies: [3, 4, 5], // Involucra no Enfurezcas, Úsalo o Piérdelo, Muévelo o Piérdelo
        keyInsight: "No puedes razonar con un cerebro inferior activado. Primero calma la amígdala, luego involucra la corteza prefrontal.",
        practicalApplication: "En berrinches o pánico: 1) Calma el cerebro inferior (presencia física, voz suave, respiración). 2) Una vez regulado, ejercita el superior (preguntas, opciones, consideración de consecuencias). El movimiento físico puede ayudar a resetear.",
        icon: "arrow.up.arrow.down.circle.fill",
        color: "purple"
    ),
    CN2Principle(
        name: "Memoria e Identidad",
        subtitle: "Construyendo narrativa coherente del yo",
        definition: "La memoria tiene dos formas: implícita (sensaciones, emociones, sin palabras) y explícita (recuerdos conscientes con palabras). Los niños pequeños tienen memoria implícita antes de desarrollar la explícita. Ayudarles a crear narrativas explícitas de sus experiencias construye un sentido coherente de identidad.",
        neuroBasis: "El hipocampo (memoria explícita) no está completamente desarrollado hasta los 2-3 años. Las experiencias tempranas se almacenan como memoria implícita (sensaciones corporales, emociones) sin contexto. 'Recordar recordar' ayuda a integrar estas memorias y dar sentido al pasado, presente y futuro.",
        relatedStrategies: [6, 7], // Control Remoto Mental, Recuerda Recordar
        keyInsight: "Las memorias implícitas sin palabras pueden disparar emociones intensas sin que el niño entienda por qué. Ayudar a crear narrativas explícitas reduce el poder emocional de estas memorias.",
        practicalApplication: "Ayuda a tu hijo a 'contar la historia' de experiencias difíciles. Usa 'pausa, rebobina, avance rápido' para dar perspectiva. Pregunta sobre el pasado ('¿Recuerdas cuando...?') y el futuro ('¿Qué harás la próxima vez?') para fortalecer memoria autobiográfica.",
        icon: "memories",
        color: "mint"
    ),
    CN2Principle(
        name: "Mindfulness y Autoconocimiento",
        subtitle: "Observando el mundo interior",
        definition: "Mindfulness (conciencia plena) es la capacidad de observar nuestra experiencia interna sin ser arrastrados por ella. Esto incluye sensaciones corporales, emociones, pensamientos e imágenes mentales. Desarrollar esta capacidad desde la infancia construye autorregulación y empatía.",
        neuroBasis: "La corteza prefrontal medial y la ínsula anterior permiten 'visión de la mente' (mindsight): la capacidad de observar nuestros propios estados mentales y los de otros. Estas áreas se fortalecen con práctica de atención consciente y conversaciones sobre estados internos.",
        relatedStrategies: [8, 9, 10, 11, 12], // Nubes Emocionales, SIFT, Visión Mente, Diversión, Conflicto
        keyInsight: "Las emociones son temporales como nubes que pasan. Enseñar a los niños a observar sus estados internos sin ser arrastrados por ellos es la base de la regulación emocional.",
        practicalApplication: "Usa SIFT (Sensaciones, Imágenes, Sentimientos, Pensamientos) para ayudar a tu hijo a nombrar su mundo interior. Pregunta sobre perspectivas de otros para desarrollar empatía. Recuerda que las emociones son pasajeras. Prioriza diversión familiar y usa conflictos como oportunidades de enseñanza.",
        icon: "eye.circle.fill",
        color: "orange"
    )
]

