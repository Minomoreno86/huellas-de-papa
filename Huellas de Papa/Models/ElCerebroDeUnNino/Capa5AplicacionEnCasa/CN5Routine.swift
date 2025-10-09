import Foundation

/// Rutinas familiares que integran las estrategias del cerebro del niño
struct CN5Routine: Codable, Identifiable {
    let id: UUID
    let title: String
    let timeOfDay: String              // "Mañana", "Tarde", "Noche"
    let description: String
    let strategiesIntegrated: [Int]    // Qué estrategias se usan
    let steps: [String]
    let duration: String
    let brainBenefits: String          // Beneficios neurológicos
    let commonChallenges: [String]     // Desafíos comunes
    let solutions: [String]            // Soluciones a esos desafíos
    let icon: String
    let color: String
    
    init(title: String, timeOfDay: String, description: String, strategiesIntegrated: [Int], steps: [String], duration: String, brainBenefits: String, commonChallenges: [String], solutions: [String], icon: String, color: String) {
        self.id = UUID()
        self.title = title
        self.timeOfDay = timeOfDay
        self.description = description
        self.strategiesIntegrated = strategiesIntegrated
        self.steps = steps
        self.duration = duration
        self.brainBenefits = brainBenefits
        self.commonChallenges = commonChallenges
        self.solutions = solutions
        self.icon = icon
        self.color = color
    }
}

/// Rutinas basadas en principios del libro
let cn5Routines: [CN5Routine] = [
    CN5Routine(
        title: "Rutina Matutina del Cerebro Integrado",
        timeOfDay: "Mañana",
        description: "Comenzar el día activando conexión e integración cerebral",
        strategiesIntegrated: [1, 3, 11], // Conecta y Redirige, Opciones, Diversión
        steps: [
            "6:30-6:45 AM: Despierta CON CONEXIÓN (abrazo, buenos días cálidos)",
            "6:45-7:00 AM: OPCIONES en rutina ('¿Primero baño o desayuno?')",
            "7:00-7:15 AM: Desayuno CON PRESENCIA (sin pantallas, conversación ligera)",
            "7:15-7:30 AM: Preparación con AUTONOMÍA ('¿Qué necesitas para tu mochila?')",
            "7:30-7:45 AM: Salida con CONEXIÓN POSITIVA ('¿Qué esperas de hoy?')"
        ],
        duration: "60-75 minutos",
        brainBenefits: "Rutinas predecibles calman el cerebro inferior (amígdala). Conexión matutina activa oxitocina. Opciones ejercitan corteza prefrontal. Tu hijo sale con sistema nervioso regulado, listo para aprender.",
        commonChallenges: [
            "\"No tenemos tiempo por las mañanas\"",
            "\"Mi hijo se resiste a TODO\"",
            "\"Yo también estoy estresado en la mañana\""
        ],
        solutions: [
            "Despierta 15 minutos antes. La inversión vale la pena para día completo mejor",
            "Más opciones + menos órdenes = menos resistencia. Prueba 1 semana",
            "Regula TU cerebro primero: 5 respiraciones profundas antes de despertar a tu hijo"
        ],
        icon: "sunrise.fill",
        color: "orange"
    ),
    
    CN5Routine(
        title: "Ritual de Reconexión Después de la Escuela",
        timeOfDay: "Tarde",
        description: "Transición suave de escuela a casa con reconexión emocional",
        strategiesIntegrated: [1, 5, 8], // Conecta y Redirige, Movimiento, Emociones Pasan
        steps: [
            "Cuando llega de escuela, NO preguntes inmediatamente '¿Cómo estuvo?'",
            "Primero RECONECTA físicamente: abrazo, 'Te extrañé', presencia",
            "Observa su estado: ¿llega de buen humor? ¿Agotado? ¿Irritable?",
            "Si está desregulado: 15 minutos de MOVIMIENTO antes de hablar (jugar afuera)",
            "Una vez regulado: AHORA pregunta sobre el día",
            "Si no quiere hablar, respeta. Ofrece: 'Cuando quieras, estoy aquí'",
            "Snack saludable + tiempo sin demandas (no tareas inmediatas)"
        ],
        duration: "20-30 minutos",
        brainBenefits: "Después de 6-8 horas de control y esfuerzo cognitivo, el cerebro del niño está agotado. Necesita RECONEXIÓN y REGULACIÓN antes de más demandas. Este tiempo restaura su sistema nervioso.",
        commonChallenges: [
            "\"Necesito que haga tarea de inmediato\"",
            "\"Llega de mal humor y contesta mal\"",
            "\"No cuenta nada de su día\""
        ],
        solutions: [
            "20 minutos de reconexión = tarea más rápida y con menos conflicto después",
            "Su cerebro inferior está activado (cansancio). Primero calma, luego habla",
            "Muchos niños no pueden verbalizar inmediatamente. Tiempo + presencia = conexión"
        ],
        icon: "figure.walk.arrival",
        color: "blue"
    ),
    
    CN5Routine(
        title: "Ritual de Dormir del Cerebro Calmado",
        timeOfDay: "Noche",
        description: "Rutina nocturna que integra conexión, procesamiento emocional y calma",
        strategiesIntegrated: [2, 7, 8, 12], // Nombra, Recuerda, Emociones, Reparación
        steps: [
            "19:30 - Aviso: 'En 30 minutos empieza rutina de dormir' (preparación mental)",
            "20:00 - Baño con PRESENCIA (sin prisa, conversación tranquila)",
            "20:15 - Tiempo en cama: PROCESAR el día",
            "  • '¿Qué fue lo mejor hoy?' (memoria positiva)",
            "  • '¿Qué fue difícil?' (procesar desafíos)",
            "  • Si hubo conflicto: REPARAR (estrategia #12)",
            "20:25 - Lectura juntos (conexión, calma)",
            "20:35 - '¿Qué esperas de mañana?' (memoria prospectiva)",
            "20:40 - Abrazo final: 'Te amo. Que descanses.' (oxitocina)",
            "20:45 - Luces apagadas, música suave (opcional)"
        ],
        duration: "45-60 minutos",
        brainBenefits: "Rutina predecible calma amígdala. Procesar el día integra memorias (hipocampo). Conexión física libera oxitocina. Cerebro entra a modo parasimpático (descanso). Mejor calidad de sueño = mejor consolidación de memoria.",
        commonChallenges: [
            "\"Mi hijo NO quiere dormir\"",
            "\"Las noches son batallas\"",
            "\"No tenemos tiempo para tanto ritual\""
        ],
        solutions: [
            "Resistencia al sueño a menudo es necesidad de conexión no satisfecha. 30 min de presencia = menos resistencia",
            "Batallas = cerebro inferior activado. Más conexión + rutina predecible = cerebro calmado",
            "Este tiempo NO es opcional. Es inversión en sueño, vínculo y desarrollo cerebral"
        ],
        icon: "bed.double.fill",
        color: "purple"
    ),
    
    CN5Routine(
        title: "Check-in Emocional de Fin de Semana",
        timeOfDay: "Fin de semana",
        description: "Reflexión familiar semanal sobre emociones, logros y desafíos",
        strategiesIntegrated: [2, 7, 9, 10], // Nombra, Recuerda, SIFT, Perspectivas
        steps: [
            "Sábado o domingo por la mañana, reúne a la familia",
            "Cada persona comparte:",
            "  • '¿Qué logré esta semana que me hace sentir orgulloso?'",
            "  • '¿Qué fue difícil? ¿Cómo lo manejé?'",
            "  • '¿Qué aprendí sobre mí mismo esta semana?' (SIFT)",
            "  • '¿Cómo puedo apoyar a alguien de la familia esta semana?' (empatía)",
            "TODOS comparten, incluyendo padres (modelas vulnerabilidad)",
            "Sin juzgar, sin corregir. Solo escuchar y validar",
            "Cierra con: '¿Qué queremos hacer juntos esta semana?' (planificación)"
        ],
        duration: "20-30 minutos",
        brainBenefits: "Reflexión semanal fortalece memoria autobiográfica (hipocampo). Nombrar logros y desafíos construye narrativa de identidad. SIFT desarrolla autoconocimiento. Preguntas de perspectiva ejercitan empatía. Planificar juntos involucra corteza prefrontal.",
        commonChallenges: [
            "\"Mis hijos no participan o dicen 'No sé'\"",
            "\"No tenemos tiempo los fines de semana\"",
            "\"Se vuelve negativo o quejas\""
        ],
        solutions: [
            "TÚ modela primero con vulnerabilidad real. Dará permiso a ellos",
            "Es 20 minutos. Menos tiempo que un episodio de TV. Prioriza",
            "Si se vuelve queja: redirige con 'Y ¿cómo lo manejaste?' (enfoque en afrontamiento)"
        ],
        icon: "calendar.badge.checkmark",
        color: "mint"
    )
]

