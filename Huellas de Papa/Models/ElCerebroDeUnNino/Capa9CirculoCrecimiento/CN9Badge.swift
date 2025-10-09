import Foundation

/// Medalla desbloqueada por dominar una estrategia
struct CN9Badge: Codable, Identifiable {
    let id: UUID
    let strategyNumber: Int             // 1-12
    let name: String
    let description: String
    let criteria: String                // Qué se necesita para desbloquear
    let meaning: String                 // Significado profundo
    let isUnlocked: Bool
    let unlockedAt: Date?
    let icon: String
    let color: String
    
    init(strategyNumber: Int, name: String, description: String, criteria: String, meaning: String, isUnlocked: Bool = false, unlockedAt: Date? = nil, icon: String, color: String) {
        self.id = UUID()
        self.strategyNumber = strategyNumber
        self.name = name
        self.description = description
        self.criteria = criteria
        self.meaning = meaning
        self.isUnlocked = isUnlocked
        self.unlockedAt = unlockedAt
        self.icon = icon
        self.color = color
    }
}

/// 12 Medallas - una por cada estrategia del libro
let cn9Badges: [CN9Badge] = [
    CN9Badge(
        strategyNumber: 1,
        name: "Maestro de la Conexión",
        description: "Dominas conectar antes de corregir",
        criteria: "Conecta emocionalmente antes de redirigir en 20 situaciones diferentes",
        meaning: "Has internalizado la regla de oro: hemisferio derecho primero, izquierdo después. Tu hijo siente que lo ves antes de corregirlo.",
        icon: "heart.circle.fill",
        color: "pink"
    ),
    
    CN9Badge(
        strategyNumber: 2,
        name: "Tejedor de Historias",
        description: "Ayudas a integrar experiencias con narrativa",
        criteria: "Ayuda a tu hijo a contar 15 historias completas de experiencias emocionales",
        meaning: "Sabes que nombrar domina. Has visto cómo poner palabras a emociones reduce su intensidad. Eres constructor de memoria integrada.",
        icon: "text.book.closed.fill",
        color: "blue"
    ),
    
    CN9Badge(
        strategyNumber: 3,
        name: "Arquitecto de Opciones",
        description: "Transformas órdenes en autonomía",
        criteria: "Ofrece opciones en lugar de órdenes en 25 situaciones",
        meaning: "Entendiste que opciones ejercitan cerebro superior. Ya no controlas; guías hacia autorregulación. Tu hijo desarrolla sentido de autonomía.",
        icon: "list.bullet.circle.fill",
        color: "purple"
    ),
    
    CN9Badge(
        strategyNumber: 4,
        name: "Entrenador del Cerebro",
        description: "Ejercitas el cerebro superior constantemente",
        criteria: "Da 30 oportunidades de decisión, planificación y resolución de problemas",
        meaning: "Ves cada momento como oportunidad de fortalecer corteza prefrontal. No das respuestas; das oportunidades de pensar. El cerebro de tu hijo se fortalece.",
        icon: "brain.head.profile",
        color: "indigo"
    ),
    
    CN9Badge(
        strategyNumber: 5,
        name: "Maestro del Movimiento",
        description: "Usas movimiento como regulación",
        criteria: "Usa movimiento físico para regulación en 20 situaciones",
        meaning: "Sabes que mover el cuerpo cambia la mente. Has visto la química cerebral cambiar con baile o saltos. Tu familia usa movimiento como herramienta.",
        icon: "figure.run.circle.fill",
        color: "green"
    ),
    
    CN9Badge(
        strategyNumber: 6,
        name: "Director de Tiempo",
        description: "Das perspectiva temporal",
        criteria: "Usa metáfora de control remoto en 15 situaciones diferentes",
        meaning: "Entiendes que dar perspectiva temporal (pausa-rebobina-avance rápido) ayuda a integrar experiencias. Tu hijo aprende que tiene control sobre su mente.",
        icon: "tv.circle.fill",
        color: "cyan"
    ),
    
    CN9Badge(
        strategyNumber: 7,
        name: "Guardián de Memorias",
        description: "Fortaleces memoria autobiográfica",
        criteria: "Practica 'Recuerda Recordar' en 20 conversaciones",
        meaning: "Construyes narrativa de vida de tu hijo hablando de pasado y futuro. Su identidad se fortalece: 'Esta es mi historia, así crezco.'",
        icon: "clock.arrow.circlepath",
        color: "teal"
    ),
    
    CN9Badge(
        strategyNumber: 8,
        name: "Observador de Nubes",
        description: "Enseñas que emociones son temporales",
        criteria: "Usa metáfora de nubes/olas en 15 emociones intensas",
        meaning: "Tu hijo aprende: las emociones vienen y van. 'Tengo tristeza' no 'SOY triste'. Esta desfusión cognitiva es base de resiliencia profunda.",
        icon: "cloud.fill",
        color: "cyan"
    ),
    
    CN9Badge(
        strategyNumber: 9,
        name: "Explorador Interior",
        description: "Practicas SIFT consistentemente",
        criteria: "Guía a tu hijo en SIFT (Sensaciones, Imágenes, Sentimientos, Pensamientos) 20 veces",
        meaning: "Tu hijo desarrolla autoconocimiento profundo. Puede observar su mundo interior con claridad. Base del mindfulness y autorregulación.",
        icon: "eye.circle.fill",
        color: "purple"
    ),
    
    CN9Badge(
        strategyNumber: 10,
        name: "Cultivador de Empatía",
        description: "Ejercitas visión de la mente",
        criteria: "Pregunta sobre perspectivas de otros en 30 situaciones",
        meaning: "Cada pregunta '¿Cómo crees que se sintió?' fortaleció neuronas espejo. Tu hijo desarrolla empatía genuina y profunda.",
        icon: "person.2.circle.fill",
        color: "pink"
    ),
    
    CN9Badge(
        strategyNumber: 11,
        name: "Creador de Alegría",
        description: "Priorizas diversión familiar",
        criteria: "Mantén 4+ horas semanales de diversión familiar por 8 semanas",
        meaning: "Entendiste que diversión no es lujo sino necesidad cerebral. Risas compartidas cablean cerebro para conexión. Tu familia tiene memorias alegres.",
        icon: "face.smiling.fill",
        color: "yellow"
    ),
    
    CN9Badge(
        strategyNumber: 12,
        name: "Sanador de Vínculos",
        description: "Reparas todas las rupturas",
        criteria: "Repara 25 rupturas relacionales con vulnerabilidad genuina",
        meaning: "Dominas la lección más poderosa: el amor es más fuerte que los errores. Tu hijo sabe que puede confiar incluso después de momentos difíciles. Apego seguro.",
        icon: "arrow.triangle.2.circlepath.circle.fill",
        color: "green"
    )
]

