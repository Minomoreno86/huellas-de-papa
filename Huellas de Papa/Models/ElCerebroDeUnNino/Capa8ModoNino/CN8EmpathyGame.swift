import Foundation

/// Juegos de empatía para que el padre practique perspectiva del niño
struct CN8EmpathyGame: Codable, Identifiable {
    let id: UUID
    let title: String
    let ageGroup: String
    let objective: String
    let setup: String
    let howToPlay: [String]
    let whatYoullLearn: String
    let duration: String
    let icon: String
    let color: String
    
    init(title: String, ageGroup: String, objective: String, setup: String, howToPlay: [String], whatYoullLearn: String, duration: String, icon: String, color: String) {
        self.id = UUID()
        self.title = title
        self.ageGroup = ageGroup
        self.objective = objective
        self.setup = setup
        self.howToPlay = howToPlay
        self.whatYoullLearn = whatYoullLearn
        self.duration = duration
        self.icon = icon
        self.color = color
    }
}

/// Juegos de empatía basados en conceptos del libro
let cn8EmpathyGames: [CN8EmpathyGame] = [
    CN8EmpathyGame(
        title: "Intercambio de Roles en Conflicto",
        ageGroup: "5-12 años",
        objective: "Experimentar el conflicto desde la perspectiva de tu hijo",
        setup: "Recrea un conflicto reciente que tuviste con tu hijo",
        howToPlay: [
            "Elige un conflicto específico de esta semana",
            "TÚ haces el papel de tu hijo (edad, altura, perspectiva)",
            "Tu hijo (o pareja) hace tu papel de padre",
            "Recreen el conflicto exacto",
            "Cuando 'papá/mamá' (actuado por otro) te hable, responde como tu hijo respondió",
            "Siente en tu cuerpo lo que tu hijo sintió",
            "Después, compartan: '¿Qué sentiste en el cuerpo de tu hijo?'"
        ],
        whatYoullLearn: "Sentirás visceralmente cómo tus palabras/tono impactan. Tal vez sientas miedo cuando 'papá' grita. O impotencia cuando no te escuchan. O vergüenza cuando te comparan. Este entendimiento corporal (no solo mental) cambiará profundamente cómo respondes.",
        duration: "15-20 minutos",
        icon: "arrow.triangle.swap",
        color: "blue"
    ),
    
    CN8EmpathyGame(
        title: "Un Día en Su Cerebro",
        ageGroup: "3-8 años",
        objective: "Seguir mentalmente un día completo desde la perspectiva cerebral de tu hijo",
        setup: "Elige un día típico de tu hijo",
        howToPlay: [
            "Escribe/imagina el día de tu hijo desde que despierta hasta que duerme",
            "Para CADA transición o demanda, pregunta: '¿Qué está pasando en su cerebro?'",
            "Despertar: cerebro saliendo de sueño, necesita tiempo para regular",
            "Vestirse: si es pequeño, cerebro superior no puede planificar eficientemente",
            "Escuela: 6 horas de control constante, cerebro superior agotándose",
            "Llegar a casa: cerebro necesita reconexión, no más demandas inmediatas",
            "Tarea: cerebro superior ya cansado, difícil concentrar",
            "Dormir: necesita ritual predecible para calmar amígdala",
            "Cuenta cuántas veces pediste control cerebral superior en un día"
        ],
        whatYoullLearn: "Te darás cuenta de cuánto ESFUERZO cerebral le pides a un cerebro inmaduro. Verás por qué llega 'irritable' de la escuela (cerebro agotado). Por qué la tarea es batalla (ya sin recursos de regulación). Tu empatía por su 'mal comportamiento' aumentará cuando veas cuánto pides de un cerebro en desarrollo.",
        duration: "20-30 minutos de reflexión",
        icon: "calendar.day.timeline.left",
        color: "teal"
    ),
    
    CN8EmpathyGame(
        title: "Comunicación Sin Palabras",
        ageGroup: "0-4 años",
        objective: "Experimentar cómo es depender de hemisferio derecho cuando el izquierdo no está disponible",
        setup: "Durante 30 minutos, NO puedes usar palabras para comunicar necesidades",
        howToPlay: [
            "Elige 30 minutos con tu pareja o amigo adulto",
            "TÚ no puedes hablar en absoluto - solo gestos, expresiones, sonidos no verbales",
            "La otra persona responde normalmente",
            "Intenta comunicar: 'Tengo sed', 'Estoy cansado', 'Necesito ayuda', 'Estoy frustrado'",
            "Observa: ¿Qué tan difícil es? ¿Te sientes comprendido? ¿Frustrado?",
            "Nota cuánto dependes de tono, expresión facial, lenguaje corporal",
            "¿Qué pasa cuando el otro no entiende o malinterpreta?"
        ],
        whatYoullLearn: "Sentirás la FRUSTRACIÓN de no poder usar palabras (hemisferio izquierdo). De depender completamente de comunicación no verbal (hemisferio derecho). De ser malinterpretado. De no tener las herramientas que tienes como adulto.",
        duration: "30 minutos",
        icon: "bubble.left.and.bubble.right.fill",
        color: "orange"
    ),
    
    CN8EmpathyGame(
        title: "Tareas con Cerebro Inferior Activado",
        ageGroup: "6-12 años",
        objective: "Experimentar qué pasa cuando intentas concentrarte mientras estás emocionalmente activado",
        setup: "Vas a intentar una tarea cognitiva mientras estás en estrés emocional",
        howToPlay: [
            "Pon una tarea que requiere concentración (sudoku, lectura compleja, etc.)",
            "ANTES de empezar, piensa en algo que te cause ansiedad/frustración real",
            "Mantén esa emoción activa mientras intentas la tarea",
            "Nota: ¿Puedes concentrarte? ¿Tu mente se distrae? ¿Es frustrante?",
            "Ahora intenta que alguien te diga '¡Concéntrate! ¡Ya te lo expliqué!'",
            "¿Ayuda que te presionen? ¿O te frustra más?",
            "Contrasta: haz la misma tarea cuando estás calmado"
        ],
        whatYoullLearn: "Sentirás que concentración cognitiva es IMPOSIBLE cuando cerebro inferior está activado. Que presión externa empeora, no ayuda. Que primero necesitas regulación emocional, LUEGO puedes pensar claramente.",
        duration: "15-20 minutos",
        icon: "brain.head.profile",
        color: "purple"
    )
]

