import Foundation

/// Modelo que representa una sección teórica de la Capa 1
/// Contiene los bloques teóricos clave del Cerebro del Niño
struct CN1Section: Codable, Identifiable {
    let id: UUID
    let title: String
    let subtitle: String
    let description: String
    let keyIdea: String
    let examples: [String]
    let practicalTips: [String]
    let icon: String
    let color: String
    
    /// Inicializador para crear una sección teórica
    /// - Parameters:
    ///   - title: Título principal de la sección
    ///   - subtitle: Subtítulo descriptivo
    ///   - description: Descripción detallada del concepto
    ///   - keyIdea: Idea clave accionable para los padres
    ///   - examples: Ejemplos prácticos del concepto
    ///   - practicalTips: Tips prácticos para aplicar
    ///   - icon: Icono SF Symbol
    ///   - color: Color asociado
    init(title: String, subtitle: String, description: String, keyIdea: String, examples: [String], practicalTips: [String], icon: String, color: String) {
        self.id = UUID()
        self.title = title
        self.subtitle = subtitle
        self.description = description
        self.keyIdea = keyIdea
        self.examples = examples
        self.practicalTips = practicalTips
        self.icon = icon
        self.color = color
    }
}

/// Datos de las secciones teóricas basadas en "El Cerebro del Niño" de Daniel J. Siegel
let cn1TheoreticalSections: [CN1Section] = [
    CN1Section(
        title: "Integración Cerebral",
        subtitle: "El cerebro como un todo integrado",
        description: "El cerebro del niño está en constante desarrollo y busca la integración entre sus diferentes partes: hemisferio izquierdo y derecho, cerebro superior e inferior. La integración permite que las diferentes áreas del cerebro trabajen juntas de forma coordinada, lo que resulta en un niño más equilibrado, resiliente y empático.",
        keyIdea: "Un cerebro integrado = Un niño equilibrado y emocionalmente saludable",
        examples: [
            "Tu hijo de 5 años tiene una rabieta porque su torre de bloques se cayó. Un cerebro no integrado solo siente la frustración (hemisferio derecho). Ayudarlo a integrar significa validar la emoción ('Veo que estás muy frustrado') y luego ayudarlo a entender qué pasó ('La torre era muy alta, ¿qué podemos hacer diferente?').",
            "Tu hija de 8 años está enojada con su hermano. Integración vertical significa que su cerebro superior (razonamiento) tome control del cerebro inferior (reacción). Pregunta: '¿Qué crees que sintió tu hermano?' para activar su corteza prefrontal.",
            "Después de un día difícil en la escuela, tu hijo no quiere hablar. La integración hemisférica ayuda: usa el hemisferio derecho (abrazo, presencia calmada) antes del izquierdo (conversación lógica sobre lo que pasó)."
        ],
        practicalTips: [
            "Conecta antes de corregir - usa el hemisferio derecho (tono calmado, contacto físico) antes de activar el izquierdo (lógica)",
            "Ayuda a contar la historia completa de una experiencia difícil con palabras y emociones",
            "Usa preguntas para involucrar el cerebro superior: '¿Qué crees que pasó?' '¿Qué podrías hacer diferente?'"
        ],
        icon: "brain.head.profile",
        color: "blue"
    ),
    CN1Section(
        title: "Conectar y Redirigir",
        subtitle: "La estrategia fundamental de crianza",
        description: "Antes de corregir o disciplinar, debemos conectar emocionalmente con nuestro hijo. Cuando el niño está alterado, su cerebro superior (lógico) está desconectado. Primero conectamos con empatía y validación emocional, luego redirigimos hacia el comportamiento apropiado cuando esté receptivo.",
        keyIdea: "Primero conecta emocionalmente, luego redirige el comportamiento",
        examples: [
            "Tu hijo de 3 años golpeó a su hermana. ANTES: 'No conectar' = '¡No se pega! ¡Vete a tu cuarto!' (activa más el cerebro inferior). DESPUÉS: 'Conectar' = Arrodíllate a su altura, tono calmado: 'Veo que estás muy enojado. Pegar duele. Cuando estés más calmado, hablaremos de otras formas de mostrar enojo.'",
            "Tu hija de 7 años tuvo un mal día y te grita 'Te odio!' ANTES: 'No conectar' = '¡No me hables así!' DESPUÉS: 'Conectar' = 'Veo que estás muy molesta. Algo difícil pasó hoy. Estoy aquí cuando quieras hablar.' Una vez calmada: 'Redirigir' = 'Entiendo que estás enojada, pero necesitamos hablar con respeto.'",
            "Tu hijo de 10 años no quiere hacer la tarea. ANTES: 'Redirigir sin conectar' = '¡Haz la tarea ahora!' DESPUÉS: 'Conectar primero' = '¿Qué pasa con la tarea? Parece que te cuesta trabajo.' Escucha. LUEGO: 'Redirigir' = 'Entiendo que es difícil. ¿Qué parte podemos hacer juntos primero?'"
        ],
        practicalTips: [
            "Arrodíllate o siéntate a su altura para conectar visualmente",
            "Usa un tono de voz calmado y validador, no autoritario",
            "Espera a que el niño esté receptivo (señales: hace contacto visual, respiración más calmada) antes de redirigir",
            "La conexión activa el sistema nervioso parasimpático (calma), permitiendo que el cerebro superior vuelva a conectarse"
        ],
        icon: "heart.circle.fill",
        color: "pink"
    ),
    CN1Section(
        title: "Hemisferio Izquierdo vs Derecho",
        subtitle: "Lógica y emoción trabajando juntas",
        description: "El hemisferio izquierdo es lógico, literal y lingüístico. El derecho es emocional, no verbal e intuitivo. Los niños pequeños son más dominados por el hemisferio derecho. Necesitamos ayudarles a integrar ambos hemisferios para procesar experiencias de forma completa y desarrollar resiliencia emocional.",
        keyIdea: "Ayuda a tu hijo a contar su historia para integrar ambos hemisferios",
        examples: [
            "Tu hijo de 4 años está llorando desconsoladamente porque su globo se explotó. Está 'inundado' por el hemisferio derecho emocional. PASO 1 (conectar con hemisferio derecho): Te arrodillas, lo abrazas, usas tono empático: 'Oh no, tu globo especial.' PASO 2 (activar hemisferio izquierdo): Una vez más calmado: '¿Qué pasó con el globo?' Ayúdalo a contar la historia con palabras.",
            "Tu hija de 6 años tuvo una pesadilla. HEMISFERIO DERECHO: Está asustada, memoria implícita activada, emociones intensas. INTEGRACIÓN: 'Cuéntame tu pesadilla' (activa hemisferio izquierdo - lenguaje). Dibujen juntos la pesadilla (hemisferio derecho - creatividad) y luego pongan palabras (izquierdo). Esto integra la experiencia y reduce su poder emocional.",
            "Tu hijo de 9 años está furioso porque perdió el partido de fútbol. SOLO HEMISFERIO DERECHO = ira descontrolada. SOLO HEMISFERIO IZQUIERDO = 'No es gran cosa, solo un juego' (minimiza emoción). INTEGRACIÓN: 'Veo que estás muy decepcionado' (valida hemisferio derecho) + '¿Qué crees que pasó en el juego?' (activa hemisferio izquierdo para procesar)."
        ],
        practicalTips: [
            "Con niños pequeños, conecta primero con el hemisferio derecho (tono, tacto, empatía no verbal)",
            "Ayuda a 'contar la historia' de experiencias difíciles para integrar ambos hemisferios",
            "Usa dibujos con niños pequeños para activar el hemisferio derecho, luego añade palabras",
            "No intentes razonar (hemisferio izquierdo) con un niño inundado emocionalmente (hemisferio derecho dominante)"
        ],
        icon: "rectangle.split.2x1.fill",
        color: "purple"
    ),
    CN1Section(
        title: "Cerebro Superior e Inferior",
        subtitle: "De las reacciones al razonamiento",
        description: "El cerebro inferior (primitivo) controla funciones básicas y reacciones instintivas. El cerebro superior (corteza) permite razonamiento, toma de decisiones y autorregulación. En niños, el cerebro superior está en desarrollo hasta los 25 años. Nuestro papel es ejercitarlo como un músculo.",
        keyIdea: "Ejercita el cerebro superior de tu hijo con preguntas y opciones",
        examples: [
            "Tu hijo de 5 años está en modo 'berrinche' (cerebro inferior activado: amígdala, instinto de supervivencia). INEFECTIVO: 'Cálmate ahora mismo!' (intenta activar cerebro superior que está desconectado). EFECTIVO: Primero, calma el cerebro inferior con presencia física, voz suave, respiración. LUEGO ejercita cerebro superior: '¿Qué necesitas cuando te sientes así?'",
            "Tu hija de 8 años quiere ver TV pero tiene tarea. CEREBRO INFERIOR: Quiero gratificación inmediata. EJERCITAR CEREBRO SUPERIOR: '¿Qué pasa si ves TV ahora? ¿Y qué pasa con la tarea? ¿Qué opciones tienes?' Estas preguntas activan la corteza prefrontal (planificación, consecuencias, toma de decisiones).",
            "Tu hijo de 3 años está a punto de golpear a su hermano (cerebro inferior activado). PREVENCIÓN: 'Veo que estás muy enojado. ¿Qué puedes hacer en lugar de pegar? ¿Usar palabras? ¿Pedir ayuda?' Le das opciones que ejercitan su cerebro superior incipiente en lugar de solo reaccionar."
        ],
        practicalTips: [
            "Usa 'Úsalo o piérdelo' - ejercita el cerebro superior con decisiones apropiadas para la edad",
            "Da opciones en lugar de órdenes: '¿Quieres bañarte ahora o en 5 minutos?' (activa cerebro superior)",
            "Pregunta '¿Qué crees que deberías hacer?' en lugar de solo decir qué hacer",
            "Recuerda: el cerebro superior no está completamente desarrollado hasta los 25 años - ten expectativas realistas",
            "Cuando el cerebro inferior está activado (berrinche, pánico), primero cálmalo antes de involucrar el superior"
        ],
        icon: "arrow.up.arrow.down.circle.fill",
        color: "orange"
    ),
    CN1Section(
        title: "Neuroplasticidad",
        subtitle: "El cerebro cambia con la experiencia",
        description: "El cerebro del niño es increíblemente plástico y moldeable. Las experiencias que proporcionamos literalmente moldean la estructura cerebral de nuestros hijos. Las interacciones repetidas crean circuitos neuronales que se vuelven patrones de comportamiento y rasgos de personalidad.",
        keyIdea: "Tus respuestas diarias están esculpiendo el cerebro de tu hijo",
        examples: [
            "NEUROPLASTICIDAD POSITIVA: Cada vez que respondes con calma a un berrinche de tu hijo de 4 años, estás fortaleciendo sus circuitos de regulación emocional. Si haces esto consistentemente, su cerebro literalmente desarrollará mejores conexiones entre la amígdala (emoción) y la corteza prefrontal (regulación).",
            "NEUROPLASTICIDAD NEGATIVA: Si constantemente gritas cuando tu hijo comete errores, su cerebro desarrolla circuitos de ansiedad y vergüenza. Las neuronas que se activan juntas, se conectan juntas. Tu hijo puede desarrollar un patrón de 'error = amenaza = evitación'.",
            "EJEMPLO POSITIVO: Tu hija de 7 años está aprendiendo a manejar frustración. Cada vez que la ayudas a 'nombrar para dominar' ('Estás muy frustrada'), estás ayudando a crear circuitos entre su hemisferio derecho emocional y su hemisferio izquierdo verbal. Con repetición, ella internalizará esta habilidad.",
            "EJERCITANDO EMPATÍA: Cada vez que preguntas '¿Cómo crees que se sintió tu hermano?', activas las neuronas espejo y la corteza prefrontal medial de tu hijo (áreas de empatía). Con práctica repetida, estos circuitos se fortalecen y la empatía se vuelve más natural."
        ],
        practicalTips: [
            "Recuerda: 'Las neuronas que se activan juntas, se conectan juntas' - las experiencias repetidas moldean el cerebro",
            "Tus respuestas diarias son el 'gimnasio' del cerebro de tu hijo",
            "La plasticidad cerebral significa que nunca es tarde para crear nuevos circuitos saludables",
            "Modela los comportamientos que quieres ver - tu hijo está observando y su cerebro está aprendiendo",
            "Celebra el esfuerzo, no solo el resultado - esto fortalece circuitos de perseverancia"
        ],
        icon: "arrow.triangle.branch",
        color: "green"
    )
]

