import Foundation

/// Pregunta de evaluación sobre aplicación de las estrategias
struct CN7Question: Codable, Identifiable {
    let id: UUID
    let category: String                // "Integración Horizontal", "Vertical", etc.
    let strategyRelated: Int?           // 1-12 o nil si es concepto general
    let questionText: String
    let questionType: QuestionType
    let options: [String]?              // Para multiple choice
    let correctAnswer: String?          // Para verificar comprensión
    let explanation: String             // Explicación educativa
    let weight: Double                  // Importancia en score final
    
    enum QuestionType: String, Codable {
        case scale          // Escala 1-5
        case multipleChoice // Opción múltiple
        case selfReflection // Reflexión personal
        case scenario       // Caso práctico
    }
    
    init(category: String, strategyRelated: Int?, questionText: String, questionType: QuestionType, options: [String]? = nil, correctAnswer: String? = nil, explanation: String, weight: Double = 1.0) {
        self.id = UUID()
        self.category = category
        self.strategyRelated = strategyRelated
        self.questionText = questionText
        self.questionType = questionType
        self.options = options
        self.correctAnswer = correctAnswer
        self.explanation = explanation
        self.weight = weight
    }
}

/// Preguntas de evaluación basadas en el libro
let cn7Questions: [CN7Question] = [
    // COMPRENSIÓN DE CONCEPTOS
    CN7Question(
        category: "Conceptos Fundamentales",
        strategyRelated: nil,
        questionText: "¿Qué hemisferio cerebral domina en niños pequeños (0-5 años)?",
        questionType: .multipleChoice,
        options: [
            "Hemisferio izquierdo (lógico y lingüístico)",
            "Hemisferio derecho (emocional e intuitivo)",
            "Ambos por igual",
            "Depende del niño"
        ],
        correctAnswer: "Hemisferio derecho (emocional e intuitivo)",
        explanation: "El libro enseña que niños pequeños son dominados por el hemisferio DERECHO emocional. Por eso son tan emocionales e 'irracionales'. El hemisferio izquierdo lógico se desarrolla más tarde. Esta es la razón por la que 'Conecta y Redirige' requiere conectar con emoción (derecho) ANTES de apelar a lógica (izquierdo).",
        weight: 1.0
    ),
    
    CN7Question(
        category: "Conceptos Fundamentales",
        strategyRelated: nil,
        questionText: "¿A qué edad aproximada madura completamente la corteza prefrontal (cerebro superior)?",
        questionType: .multipleChoice,
        options: [
            "12 años",
            "18 años",
            "25 años",
            "30 años"
        ],
        correctAnswer: "25 años",
        explanation: "Siegel enfatiza que el cerebro superior (corteza prefrontal) no madura hasta alrededor de los 25 años. Esto significa que niños, adolescentes, e incluso jóvenes adultos NO tienen cerebro superior completamente desarrollado. Por eso necesitan mucho apoyo de regulación, no pueden siempre 'controlarse', y sus decisiones pueden ser impulsivas. Expectativas realistas importan.",
        weight: 1.0
    ),
    
    CN7Question(
        category: "Estrategia #1",
        strategyRelated: 1,
        questionText: "En 'Conecta y Redirige', ¿cuál es la secuencia CORRECTA?",
        questionType: .multipleChoice,
        options: [
            "Primero explica lógicamente, luego valida emoción",
            "Primero valida emoción, luego redirige con lógica",
            "Solo valida emoción, sin redirección",
            "Solo redirige comportamiento, sin validación"
        ],
        correctAnswer: "Primero valida emoción, luego redirige con lógica",
        explanation: "La secuencia es CRÍTICA: Primero CONECTA con hemisferio derecho emocional (validación, tono empático, contacto). Solo cuando el niño está receptivo, REDIRIGE con hemisferio izquierdo lógico. Invertir el orden no funciona porque no puedes razonar con cerebro emocional activado.",
        weight: 1.5
    ),
    
    CN7Question(
        category: "Estrategia #2",
        strategyRelated: 2,
        questionText: "¿Por qué 'Nombra para Dominar' reduce la intensidad emocional?",
        questionType: .multipleChoice,
        options: [
            "Distrae al niño de la emoción",
            "El hemisferio izquierdo ayuda al derecho a procesar",
            "Hace que el niño olvide qué pasó",
            "Le da algo que hacer con las manos"
        ],
        correctAnswer: "El hemisferio izquierdo ayuda al derecho a procesar",
        explanation: "Cuando ponemos PALABRAS (hemisferio izquierdo) a una EMOCIÓN (hemisferio derecho), estamos integrando ambos hemisferios. Esto reduce el poder emocional. Las emociones sin palabras son más intensas. Al nombrar, el cerebro puede procesar en lugar de solo sentir. No es distracción; es integración.",
        weight: 1.5
    ),
    
    // AUTO-EVALUACIÓN DE APLICACIÓN
    CN7Question(
        category: "Auto-Evaluación",
        strategyRelated: 1,
        questionText: "Cuando tu hijo tiene un berrinche, ¿cuál es tu PRIMERA reacción típica?",
        questionType: .multipleChoice,
        options: [
            "Intento razonar explicando por qué no debe llorar",
            "Me arrodillo, valido su emoción, espero que se calme",
            "Me frustro y levanto la voz",
            "Lo ignoro hasta que se calme solo"
        ],
        correctAnswer: "Me arrodillo, valido su emoción, espero que se calme",
        explanation: "La respuesta ideal según el libro es CONECTAR primero. Arrodillarse (altura del niño), validar emoción ('Veo que estás muy enojado'), y ESPERAR que el sistema nervioso se regule. Solo entonces puedes redirigir. Las otras opciones activan más el cerebro inferior o no enseñan regulación.",
        weight: 2.0
    ),
    
    CN7Question(
        category: "Auto-Evaluación",
        strategyRelated: 3,
        questionText: "¿Con qué frecuencia das OPCIONES en vez de ÓRDENES directas?",
        questionType: .scale,
        options: ["Nunca", "Raramente", "A veces", "Frecuentemente", "Siempre"],
        correctAnswer: nil,
        explanation: "Las opciones involucran el cerebro superior (decisión, autonomía). Las órdenes directas activan cerebro inferior reactivo. Mientras más practiques dar opciones reales (todas aceptables para ti), más ejercitas la corteza prefrontal de tu hijo. Meta: aumentar frecuencia gradualmente.",
        weight: 1.5
    ),
    
    CN7Question(
        category: "Auto-Evaluación",
        strategyRelated: 12,
        questionText: "Después de gritar o perder la paciencia con tu hijo, ¿reparas la ruptura relacional?",
        questionType: .scale,
        options: ["Nunca", "Raramente", "A veces", "Frecuentemente", "Siempre"],
        correctAnswer: nil,
        explanation: "Siegel dice: 'Las rupturas son inevitables. La reparación es lo que construye apego seguro.' Si respondiste 'Raramente' o 'Nunca', esta es un área crítica de crecimiento. Meta: reparar CADA ruptura. Tu hijo necesita saber que el amor es más fuerte que los errores.",
        weight: 2.0
    ),
    
    // ESCENARIOS PRÁCTICOS
    CN7Question(
        category: "Aplicación Práctica",
        strategyRelated: 5,
        questionText: "Tu hijo de 7 años lleva 30 minutos frustrado con tarea de matemáticas. Está borrando agresivamente y suspirando. ¿Qué haces?",
        questionType: .multipleChoice,
        options: [
            "\"¡Ya te lo expliqué! ¡Pon atención!\"",
            "\"Vamos a bailar 5 minutos y volvemos con mente fresca.\"",
            "\"No importa, yo lo hago por ti.\"",
            "\"Si no terminas, no hay videojuegos.\""
        ],
        correctAnswer: "\"Vamos a bailar 5 minutos y volvemos con mente fresca.\"",
        explanation: "Esta es estrategia #5: Muévelo o Piérdelo. Cuando el cerebro está atascado (corteza prefrontal sobrecargada), el movimiento físico cambia química cerebral. Libera dopamina y serotonina, calma amígdala, permite que cerebro superior vuelva online. Las otras opciones o agravan (gritar), no enseñan (rescatar), o amenazan (castigo).",
        weight: 2.0
    ),
    
    CN7Question(
        category: "Aplicación Práctica",
        strategyRelated: 2,
        questionText: "Tu hija de 5 años tuvo una pesadilla anoche. Esta mañana sigue asustada. ¿Qué es más efectivo según el libro?",
        questionType: .multipleChoice,
        options: [
            "\"Ya pasó, fue solo un sueño. Olvídalo.\"",
            "\"Cuéntame tu pesadilla con TODO detalle. Dibujémosla.\"",
            "\"Aquí está tu juguete favorito. ¿Quieres ver caricaturas?\"",
            "\"Eres una niña grande. No tengas miedo.\""
        ],
        correctAnswer: "\"Cuéntame tu pesadilla con TODO detalle. Dibujémosla.\"",
        explanation: "Esto es 'Nombra para Dominar' (#2). Las memorias aterradoras se almacenan como memoria IMPLÍCITA (emociones sin palabras). Al ayudarla a contar la historia completa con palabras (y dibujos), conviertes memoria implícita en explícita. Esto reduce su poder emocional. Distracción o minimización NO procesan la memoria.",
        weight: 2.0
    ),
    
    // MÁS PREGUNTAS DE COMPRENSIÓN
    CN7Question(
        category: "Conceptos Fundamentales",
        strategyRelated: nil,
        questionText: "¿Qué sucede cuando el cerebro INFERIOR está activado (berrinche, pánico)?",
        questionType: .multipleChoice,
        options: [
            "El cerebro superior funciona mejor porque está alerta",
            "El cerebro superior se desconecta temporalmente",
            "Ambas partes trabajan juntas más fuertemente",
            "Solo afecta las emociones, no el razonamiento"
        ],
        correctAnswer: "El cerebro superior se desconecta temporalmente",
        explanation: "Cuando la amígdala (cerebro inferior) se activa intensamente, literalmente 'secuestra' al cerebro. La corteza prefrontal (cerebro superior) se desconecta. Por eso NO puedes razonar con un niño en berrinche. Primero debes calmar el cerebro inferior, LUEGO el superior volverá online.",
        weight: 1.5
    ),
    
    CN7Question(
        category: "Conceptos Fundamentales",
        strategyRelated: nil,
        questionText: "¿Qué significa que el cerebro es 'plástico' (neuroplasticidad)?",
        questionType: .multipleChoice,
        options: [
            "Es flexible y puede estirarse",
            "Las experiencias moldean y cambian su estructura física",
            "Puede recuperarse de cualquier daño",
            "Es suave en niños y duro en adultos"
        ],
        correctAnswer: "Las experiencias moldean y cambian su estructura física",
        explanation: "Neuroplasticidad significa que las experiencias LITERALMENTE cambian la estructura física del cerebro. 'Las neuronas que se activan juntas, se conectan juntas.' Tus respuestas diarias están esculpiendo el cerebro de tu hijo. Esto da esperanza: nunca es tarde para crear nuevos circuitos saludables.",
        weight: 1.0
    ),
    
    // MÁS AUTO-EVALUACIÓN
    CN7Question(
        category: "Auto-Evaluación",
        strategyRelated: 5,
        questionText: "¿Usas el movimiento físico como herramienta de regulación para tu hijo?",
        questionType: .scale,
        options: ["Nunca", "Raramente", "A veces", "Frecuentemente", "Siempre"],
        correctAnswer: nil,
        explanation: "El movimiento es una de las formas MÁS RÁPIDAS de cambiar química cerebral (libera dopamina, serotonina, calma amígdala). Si respondiste 'Nunca' o 'Raramente', intenta incorporar 'Muévelo o Piérdelo' esta semana. Bailar 5 minutos puede cambiar completamente un día difícil.",
        weight: 1.5
    ),
    
    CN7Question(
        category: "Auto-Evaluación",
        strategyRelated: 11,
        questionText: "¿Cuántas horas por semana dedicas a tiempo de PURA diversión familiar (sin pantallas, sin tareas, solo conexión)?",
        questionType: .multipleChoice,
        options: [
            "Menos de 1 hora",
            "1-3 horas",
            "3-5 horas",
            "5-10 horas",
            "Más de 10 horas"
        ],
        correctAnswer: nil,
        explanation: "Siegel dice: 'Incrementa el Factor Diversión' no es lujo; es NECESIDAD cerebral. Las experiencias alegres compartidas liberan oxitocina y cablean el cerebro para conexión. Si respondiste menos de 3 horas, considera: esto es tan importante como comida o sueño para desarrollo cerebral.",
        weight: 2.0
    ),
    
    CN7Question(
        category: "Auto-Evaluación",
        strategyRelated: 9,
        questionText: "¿Ayudas a tu hijo a nombrar sus sensaciones CORPORALES (SIFT)?",
        questionType: .scale,
        options: ["Nunca", "Raramente", "A veces", "Frecuentemente", "Siempre"],
        correctAnswer: nil,
        explanation: "SIFT (Sensaciones, Imágenes, Sentimientos, Pensamientos) desarrolla conciencia corporal profunda. Muchos padres se enfocan en pensamientos pero olvidan el cuerpo. Preguntar '¿Qué siente tu panza? ¿Tu pecho?' activa ínsula (conciencia corporal) y es base del mindfulness.",
        weight: 1.5
    ),
    
    // MÁS ESCENARIOS PRÁCTICOS
    CN7Question(
        category: "Aplicación Práctica",
        strategyRelated: 6,
        questionText: "Tu hijo de 8 años está muy ansioso por un examen de mañana. Dice '¡Voy a reprobar!' ¿Qué estrategia del libro es más apropiada?",
        questionType: .multipleChoice,
        options: [
            "\"No digas eso. Vas a hacerlo bien.\" (Minimizar)",
            "\"¿Estudiaste? Entonces no hay problema.\" (Lógica)",
            "\"Usemos control remoto: AVANCE RÁPIDO. ¿Qué ves después del examen?\"",
            "\"Si repruebas, estudiarás más la próxima vez.\" (Consecuencia)"
        ],
        correctAnswer: "\"Usemos control remoto: AVANCE RÁPIDO. ¿Qué ves después del examen?\"",
        explanation: "Control Remoto Mental (#6) da perspectiva temporal. AVANCE RÁPIDO ayuda a ver más allá del momento presente de ansiedad. El niño puede ver que el examen tiene fin, que la vida continúa después. Esto activa corteza prefrontal (perspectiva) y reduce ansiedad. Minimizar o solo lógica no ayuda a procesar la emoción.",
        weight: 2.0
    ),
    
    CN7Question(
        category: "Aplicación Práctica",
        strategyRelated: 10,
        questionText: "Tus dos hijos (7 y 5 años) pelean por un juguete. Ambos gritando. ¿Cuál respuesta ejercita EMPATÍA según el libro?",
        questionType: .multipleChoice,
        options: [
            "\"¡Se acabó! Nadie juega con el juguete.\" (Castigo)",
            "\"Es del mayor porque lo vio primero.\" (Resolver tú)",
            "\"Mira la cara de tu hermano. ¿Cómo crees que se siente? ¿Qué pueden hacer para que ambos estén bien?\"",
            "\"Tienen 2 minutos para resolverlo o lo guardo.\" (Ultimátum)"
        ],
        correctAnswer: "\"Mira la cara de tu hermano. ¿Cómo crees que se siente? ¿Qué pueden hacer para que ambos estén bien?\"",
        explanation: "Ejercita la Visión de la Mente (#10). Preguntar '¿Cómo crees que se siente?' activa neuronas espejo (empatía). Facilitar que ELLOS encuentren solución ('¿Qué pueden hacer para que ambos...?') ejercita cerebro superior. Conflictos son oportunidades de oro para enseñar empatía y resolución de problemas.",
        weight: 2.0
    ),
    
    CN7Question(
        category: "Aplicación Práctica",
        strategyRelated: 4,
        questionText: "Según 'Úsalo o Piérdelo', ¿cuál NO es una buena forma de ejercitar el cerebro superior?",
        questionType: .multipleChoice,
        options: [
            "Dar opciones: '¿Quieres A o B?'",
            "Hacer todo por ellos para evitar errores",
            "Preguntas abiertas: '¿Qué crees que deberías hacer?'",
            "Dejar que experimenten consecuencias de sus decisiones"
        ],
        correctAnswer: "Hacer todo por ellos para evitar errores",
        explanation: "Hacer todo POR ellos no ejercita su cerebro superior. Es como querer que desarrollen músculo pero cargándolos siempre. El cerebro superior necesita PRÁCTICA: decidir, planificar, considerar consecuencias, resolver problemas. Permitir lucha apropiada (con apoyo) es CÓMO se fortalece.",
        weight: 2.0
    ),
    
    // REFLEXIÓN PROFUNDA
    CN7Question(
        category: "Reflexión Personal",
        strategyRelated: nil,
        questionText: "¿Cuál estrategia te cuesta MÁS trabajo aplicar consistentemente?",
        questionType: .selfReflection,
        options: nil,
        correctAnswer: nil,
        explanation: "La estrategia más difícil para ti probablemente refleja tu propia historia de desarrollo. Si 'Conecta y Redirige' es difícil, tal vez tus padres no conectaban contigo. Si reparación es difícil, tal vez nadie reparaba contigo. Tu historia afecta tu crianza. Identificarlo es el primer paso para crecer.",
        weight: 1.0
    ),
    
    CN7Question(
        category: "Reflexión Personal",
        strategyRelated: nil,
        questionText: "¿En qué momentos se activa TU propio cerebro inferior (pierdes la calma)?",
        questionType: .selfReflection,
        options: nil,
        correctAnswer: nil,
        explanation: "No puedes co-regular a tu hijo si TÚ estás desregulado. Conocer tus triggers (¿desobediencia? ¿llanto? ¿gritos? ¿desorden?) te permite anticipar y auto-regular ANTES de reaccionar. Tu propio trabajo de integración cerebral es tan importante como el de tu hijo.",
        weight: 1.5
    )
]


