import Foundation

/// Representa una semana de entrenamiento enfocada en UNA estrategia
struct CN6TrainingWeek: Codable, Identifiable {
    let id: UUID
    let weekNumber: Int                 // 1-12
    let strategyNumber: Int             // 1-12 estrategia del libro
    let strategyName: String
    let focus: String                   // En qué enfocarse esta semana
    let dailyChallenges: [String]       // 7 micro-retos (uno por día)
    let practiceScenarios: [String]     // Situaciones donde practicar
    let observationQuestions: [String]  // Qué observar
    let successIndicators: [String]     // Señales de que estás mejorando
    let commonMistakes: [String]        // Errores comunes a evitar
    let weeklyReflection: String        // Reflexión de fin de semana
    let icon: String
    let color: String
    
    init(weekNumber: Int, strategyNumber: Int, strategyName: String, focus: String, dailyChallenges: [String], practiceScenarios: [String], observationQuestions: [String], successIndicators: [String], commonMistakes: [String], weeklyReflection: String, icon: String, color: String) {
        self.id = UUID()
        self.weekNumber = weekNumber
        self.strategyNumber = strategyNumber
        self.strategyName = strategyName
        self.focus = focus
        self.dailyChallenges = dailyChallenges
        self.practiceScenarios = practiceScenarios
        self.observationQuestions = observationQuestions
        self.successIndicators = successIndicators
        self.commonMistakes = commonMistakes
        self.weeklyReflection = weeklyReflection
        self.icon = icon
        self.color = color
    }
}

/// Plan de 12 semanas basado en las estrategias del libro
let cn6TrainingWeeks: [CN6TrainingWeek] = [
    CN6TrainingWeek(
        weekNumber: 1,
        strategyNumber: 1,
        strategyName: "Conecta y Redirige",
        focus: "Dominar la secuencia: Primero emoción (hemisferio derecho), luego lógica (hemisferio izquierdo)",
        dailyChallenges: [
            "Lunes: Observa 3 momentos donde normalmente corriges inmediatamente. Solo OBSERVA tu impulso.",
            "Martes: En 1 conflicto pequeño, PAUSA antes de hablar. Arrodíllate, haz contacto visual.",
            "Miércoles: Practica validar emoción ANTES de redirigir: 'Veo que estás [emoción]' + espera + redirección.",
            "Jueves: Cuando quieras gritar, respira 3 veces profundo ANTES de responder. Conecta primero.",
            "Viernes: Usa tono de voz empático y validador incluso cuando pones un límite.",
            "Sábado: Practica 'Conecta y Redirige' en 3 situaciones hoy.",
            "Domingo: Reflexión: ¿Cuándo fue más difícil conectar primero? ¿Qué te lo impidió?"
        ],
        practiceScenarios: [
            "Berrinche o llanto intenso",
            "Comportamiento difícil que requiere corrección",
            "Momento de frustración o enojo del niño",
            "Resistencia a seguir instrucciones",
            "Cualquier momento donde tu impulso es 'corregir ya'"
        ],
        observationQuestions: [
            "¿Notas diferencia en la respuesta de tu hijo cuando conectas primero?",
            "¿Cuál es tu mayor obstáculo para conectar antes de corregir?",
            "¿En qué momentos se activa TU cerebro inferior y saltas directo a corrección?"
        ],
        successIndicators: [
            "Tu hijo se calma más rápido cuando conectas primero",
            "Menos escaladas de conflicto",
            "Logras pausar antes de reaccionar automáticamente",
            "Tu hijo empieza a buscar conexión contigo en momentos difíciles"
        ],
        commonMistakes: [
            "Conectar con palabras pero sin tono empático (no funciona)",
            "Validar y luego inmediatamente decir 'PERO...' (invalida la validación)",
            "Esperar que el niño se calme sin tu presencia calmada",
            "Conectar solo cuando es 'conveniente' en lugar de siempre"
        ],
        weeklyReflection: "Esta semana aprendiste que la SECUENCIA importa. Hemisferio derecho primero, izquierdo después. Emoción antes que lógica. Tu cerebro puede querer saltar a la solución, pero el cerebro de tu hijo necesita conexión primero. ¿Qué cambió cuando lo hiciste en el orden correcto?",
        icon: "heart.circle.fill",
        color: "pink"
    ),
    
    CN6TrainingWeek(
        weekNumber: 2,
        strategyNumber: 2,
        strategyName: "Nombra para Dominar",
        focus: "Ayudar a tu hijo a poner PALABRAS a emociones y experiencias para integrar hemisferios",
        dailyChallenges: [
            "Lunes: Identifica 3 emociones de tu hijo hoy y nómbralas en voz alta: 'Veo que estás [emoción]'",
            "Martes: Cuando tu hijo está alterado, ayuda a contar qué pasó con preguntas: '¿Qué pasó primero?'",
            "Miércoles: Usa 'nombra para dominar' contigo mismo en voz alta (modela): 'Estoy frustrado porque...'",
            "Jueves: Ayuda a crear narrativa completa de un evento del día con principio, medio y fin.",
            "Viernes: Practica con evento difícil: '¿Qué sentiste cuando...?' Valida + ayuda a nombrar.",
            "Sábado: Haz un dibujo con tu hijo de algo emocional que pasó esta semana. Agreguen palabras.",
            "Domingo: Reflexión escrita: ¿Cómo cambió la intensidad de emociones cuando las nombraste?"
        ],
        practiceScenarios: [
            "Después de berrinche o llanto",
            "Experiencia emocionalmente intensa (miedo, frustración, tristeza)",
            "Conflicto con hermano o amigo",
            "Evento difícil que el niño sigue mencionando",
            "Cualquier emoción que parece 'atascada' o recurrente"
        ],
        observationQuestions: [
            "¿Notas que la emoción disminuye cuando le pones palabras?",
            "¿Tu hijo empieza a nombrar sus propias emociones espontáneamente?",
            "¿Cómo reacciona cuando lo ayudas a contar la historia vs. cuando lo distraes?"
        ],
        successIndicators: [
            "Tu hijo usa palabras de emoción más frecuentemente",
            "Puede contar experiencias con más coherencia narrativa",
            "Las emociones intensas se procesan más rápido",
            "Menos berrinches 'sin razón' (ahora puede expresar con palabras)"
        ],
        commonMistakes: [
            "Poner palabras sin primero conectar (orden equivocado)",
            "Decir 'No estés triste' después de nombrar (invalida)",
            "Corregir su versión de la historia (su percepción es válida)",
            "Forzar a hablar cuando no está listo (respeta su timing)"
        ],
        weeklyReflection: "Esta semana aprendiste el poder de las palabras. Nombrar una emoción reduce su intensidad. Crear narrativa de una experiencia la integra. El hemisferio izquierdo (palabras) ayuda al derecho (emoción) a procesar. ¿Qué cambió en tu hijo cuando le ayudaste a poner palabras a su mundo interno?",
        icon: "text.bubble.fill",
        color: "blue"
    ),
    
    CN6TrainingWeek(
        weekNumber: 3,
        strategyNumber: 3,
        strategyName: "Involucra, No Enfurezcas",
        focus: "Transformar órdenes en opciones para activar cerebro superior",
        dailyChallenges: [
            "Lunes: Cuenta cuántas ÓRDENES das hoy. Solo observa sin cambiar.",
            "Martes: Transforma 3 órdenes en opciones: '¿A o B?' en vez de 'Haz A'",
            "Miércoles: Antes de cada instrucción, pregunta: '¿Puedo hacer esto con opción?' Practica 5 veces.",
            "Jueves: Usa preguntas abiertas: '¿Qué crees que deberías hacer?' en vez de decir qué hacer.",
            "Viernes: Cuando tu hijo resista, ofrece 2 opciones TODAS aceptables para ti.",
            "Sábado: Día de SOLO opciones. Cero órdenes directas. ¿Qué observas?",
            "Domingo: Reflexión: ¿Cuándo fue más difícil dar opciones? ¿Por qué?"
        ],
        practiceScenarios: [
            "Rutinas diarias (vestirse, comer, bañarse)",
            "Transiciones (apagar TV, salir de casa, ir a dormir)",
            "Tareas y responsabilidades",
            "Conflictos pequeños",
            "Cualquier momento donde normalmente das orden directa"
        ],
        observationQuestions: [
            "¿Disminuye la resistencia cuando ofreces opciones?",
            "¿Tu hijo coopera más cuando siente autonomía?",
            "¿Qué pasa en TU cerebro cuando sueltas control y das opciones?"
        ],
        successIndicators: [
            "Menos batallas de poder",
            "Tu hijo dice 'Yo elijo' - sensación de autonomía",
            "Rutinas fluyen más suavemente",
            "Tu hijo empieza a proponer soluciones propias"
        ],
        commonMistakes: [
            "Ofrecer opciones que no son reales ('¿Quieres bañarte?' cuando no es opcional)",
            "Demasiadas opciones (más de 3 abruma)",
            "Enojarte si elige la opción que preferías que no eligiera",
            "Usar opciones como manipulación en vez de genuina autonomía"
        ],
        weeklyReflection: "Las órdenes activan cerebro inferior reactivo. Las opciones involucran cerebro superior (decisión, autonomía, consecuencias). Tu hijo no es más obediente; está desarrollando autorregulación y pensamiento ejecutivo. ¿Notaste cómo el CÓMO pides cambia la respuesta?",
        icon: "list.bullet.circle.fill",
        color: "purple"
    ),
    
    // SEMANAS 4-12 continuación
    CN6TrainingWeek(
        weekNumber: 4,
        strategyNumber: 4,
        strategyName: "Úsalo o Piérdelo",
        focus: "Ejercitar el cerebro superior como músculo con decisiones y responsabilidades",
        dailyChallenges: [
            "Lunes: Identifica 5 decisiones que normalmente tomas POR tu hijo. Lista.",
            "Martes: Devuelve 2 de esas decisiones a tu hijo (apropiadas para edad).",
            "Miércoles: Practica preguntas abiertas: '¿Qué crees que deberías hacer?' en 3 situaciones.",
            "Jueves: Cuando tu hijo tiene problema, resiste resolver. Pregunta: '¿Qué opciones tienes?'",
            "Viernes: Da responsabilidad nueva apropiada para edad. Observa cómo responde.",
            "Sábado: Permite que tome decisión importante (dentro de límites). Apoya resultado.",
            "Domingo: Reflexión: ¿Qué fue más difícil - dejar decidir o vivir con su decisión?"
        ],
        practiceScenarios: [
            "Qué ropa ponerse, qué comer (opciones saludables)",
            "Cómo organizar su tiempo de tarea",
            "Resolver conflictos con hermanos",
            "Planificar su cumpleaños o actividad especial",
            "Consecuencias de sus decisiones (aprender de errores)"
        ],
        observationQuestions: [
            "¿Notas que tu hijo toma mejores decisiones con práctica?",
            "¿Qué pasa cuando permites que experimente consecuencias de sus elecciones?",
            "¿Qué emociones surgen en TI cuando sueltas control?"
        ],
        successIndicators: [
            "Tu hijo propone soluciones a problemas sin que preguntes",
            "Toma responsabilidad de errores más fácilmente",
            "Dice 'Yo puedo decidir' - sensación de competencia",
            "Mejora en autorregulación y planificación"
        ],
        commonMistakes: [
            "Dar responsabilidades muy complejas para la edad (frustración)",
            "Rescatar inmediatamente cuando elige mal (no aprende)",
            "Criticar sus decisiones (desalienta)",
            "Dar autonomía inconsistentemente (confunde)"
        ],
        weeklyReflection: "El cerebro superior es como músculo: mientras más se usa, más fuerte. Cada decisión, cada problema que resuelve, cada consecuencia que navega fortalece su corteza prefrontal. NO estás siendo flojo; estás siendo intencional en su desarrollo. ¿Qué crecimiento viste?",
        icon: "brain.head.profile",
        color: "indigo"
    ),
    
    CN6TrainingWeek(
        weekNumber: 5,
        strategyNumber: 5,
        strategyName: "Muévelo o Piérdelo",
        focus: "Usar movimiento físico como herramienta principal de regulación",
        dailyChallenges: [
            "Lunes: Identifica 3 momentos donde tu hijo estuvo desregulado. ¿Probaste movimiento?",
            "Martes: ANTES de conversación difícil o tarea, 5 min de movimiento primero.",
            "Miércoles: Cuando veas frustración/enojo emergiendo, sugiere bailar/saltar ANTES de explotar.",
            "Jueves: Usa movimiento para TI MISMO cuando estés frustrado. Modela.",
            "Viernes: Crea 'menú de movimientos' con tu hijo: qué movimientos le ayudan más.",
            "Sábado: Día activo: 30+ min de movimiento familiar. Observa estado de todos después.",
            "Domingo: Reflexión: ¿Movimiento preventivo vs. reactivo? ¿Cuál funciona mejor?"
        ],
        practiceScenarios: [
            "Antes de tarea o actividad que requiere concentración",
            "En medio de frustración o atascamiento",
            "Transiciones difíciles",
            "Berrinches o ansiedad emergiendo",
            "Como parte de rutina diaria preventiva"
        ],
        observationQuestions: [
            "¿Qué movimientos funcionan mejor para tu hijo específicamente?",
            "¿Cuánto tiempo de movimiento se necesita para cambio visible?",
            "¿Tu hijo empieza a pedir movimiento cuando lo necesita?"
        ],
        successIndicators: [
            "Regulación emocional más rápida con movimiento",
            "Tu hijo dice 'Necesito moverme' cuando está desregulado",
            "Menos berrinches prolongados",
            "Familia más regulada en general con movimiento diario"
        ],
        commonMistakes: [
            "Usar movimiento como castigo ('Ve a correr') vs. regulación ('Vamos a mover juntos')",
            "Esperar hasta explosión completa (preventivo funciona mejor)",
            "No participar TÚ (tu hijo necesita tu presencia)",
            "Olvidar que movimiento es NEUROLOGÍA, no distracción"
        ],
        weeklyReflection: "El movimiento cambia química cerebral: libera dopamina, serotonina, reduce cortisol. Es una de las herramientas MÁS RÁPIDAS de regulación. Tu hijo está aprendiendo: cuando mi cuerpo se mueve, mi mente cambia. Esto es autorregulación física. ¿Observaste el poder del movimiento?",
        icon: "figure.run.circle.fill",
        color: "green"
    ),
    
    CN6TrainingWeek(
        weekNumber: 6,
        strategyNumber: 6,
        strategyName: "Control Remoto Mental",
        focus: "Usar metáforas de control remoto para dar perspectiva temporal y control",
        dailyChallenges: [
            "Lunes: Introduce la metáfora: '¿Conoces control remoto? Tu mente tiene uno también.'",
            "Martes: Practica PAUSA: 'Pausemos este momento. Respiremos.' en 2 situaciones.",
            "Miércoles: Usa REBOBINA para entender: '¿Qué pasó antes de esto? ¿Cómo empezó?'",
            "Jueves: Practica AVANCE RÁPIDO para perspectiva: '¿Qué pasará después? ¿Cómo terminará?'",
            "Viernes: Usa CÁMARA LENTA para detalles: 'Veamos esto despacio. ¿Qué sentiste exactamente?'",
            "Sábado: Control remoto para experiencia pasada difícil. REBOBINA completo.",
            "Domingo: Reflexión: ¿La metáfora le dio sensación de control? ¿Cómo?"
        ],
        practiceScenarios: [
            "Niño abrumado por emoción presente",
            "Memoria difícil que sigue afectando",
            "Ansiedad sobre evento futuro",
            "Atascado en pensamiento negativo",
            "Necesita perspectiva temporal"
        ],
        observationQuestions: [
            "¿Tu hijo conecta con metáforas visuales mejor que con palabras solas?",
            "¿La metáfora le da sensación de control sobre su mente?",
            "¿Empieza a usar la metáfora independientemente?"
        ],
        successIndicators: [
            "Tu hijo dice 'Voy a pausar' cuando está abrumado",
            "Puede dar perspectiva temporal a experiencias ('Tiene principio y fin')",
            "Menos atascado en emociones o pensamientos",
            "Mayor sensación de control sobre mundo interno"
        ],
        commonMistakes: [
            "Usar en medio de berrinche total (primero conecta, LUEGO control remoto)",
            "Hacer muy complejo (mantén simple para niños pequeños)",
            "No practicar en momentos calmados primero",
            "Usar como distracción ('No pienses en eso') vs. procesamiento"
        ],
        weeklyReflection: "Las metáforas visuales (control remoto) son procesadas por hemisferio derecho, haciéndolas más accesibles que solo palabras. Dan sensación de CONTROL sobre mente, que es empoderante para niños. ¿Tu hijo entendió que tiene control sobre sus pensamientos?",
        icon: "tv.circle.fill",
        color: "indigo"
    ),
    
    CN6TrainingWeek(
        weekNumber: 7,
        strategyNumber: 7,
        strategyName: "Recuerda Recordar",
        focus: "Fortalecer memoria autobiográfica hablando de pasado y futuro",
        dailyChallenges: [
            "Lunes: Durante cena, pregunta '¿Qué hicimos el fin de semana pasado? ¿Recuerdas?'",
            "Martes: Mira fotos juntos. '¿Recuerdas este día? ¿Qué pasó? ¿Cómo te sentiste?'",
            "Miércoles: Habla del futuro: '¿Qué quieres hacer mañana? ¿El próximo mes?'",
            "Jueves: Cuenta historia de cuando tu hijo era bebé. Construye narrativa de su vida.",
            "Viernes: Después de evento hoy, ayuda a recordar con detalles: '¿Qué pasó primero? ¿Luego?'",
            "Sábado: Crea 'libro de memorias' de algo importante que pasó esta semana.",
            "Domingo: Reflexión: ¿Tu hijo recuerda más detalles con tu ayuda? ¿Cómo lo narran?"
        ],
        practiceScenarios: [
            "Viendo fotos familiares",
            "Antes de dormir contando el día",
            "Planificando eventos futuros",
            "Después de experiencias significativas",
            "Procesando cambios o transiciones"
        ],
        observationQuestions: [
            "¿Tu hijo desarrolla mejor sentido de 'su historia'?",
            "¿Puede anticipar futuro con más claridad?",
            "¿Hablar del pasado ayuda a procesar experiencias difíciles?"
        ],
        successIndicators: [
            "Tu hijo cuenta historias con más detalles y coherencia",
            "Hace conexiones entre pasado-presente-futuro",
            "Dice 'Recuerdo cuando...' espontáneamente",
            "Puede planificar eventos futuros con más realismo"
        ],
        commonMistakes: [
            "Corregir sus memorias ('No, fue así'). Su percepción es válida.",
            "Solo hablar de eventos positivos (eventos difíciles también construyen identidad)",
            "No incluir EMOCIONES en narrativa (hemisferio derecho necesita estar)",
            "Hablar de pasado como interrogatorio vs. exploración curiosa"
        ],
        weeklyReflection: "El hipocampo (memoria) se fortalece recordando activamente. Hablar de pasado y futuro construye sentido de identidad: 'Esta es mi historia, así he crecido, así será mi futuro.' ¿Notaste cómo tu hijo entiende mejor quién es?",
        icon: "clock.arrow.circlepath",
        color: "teal"
    ),
    
    CN6TrainingWeek(
        weekNumber: 8,
        strategyNumber: 8,
        strategyName: "Deja que las Nubes Pasen",
        focus: "Enseñar que emociones son temporales, no permanentes",
        dailyChallenges: [
            "Lunes: Cuando tu hijo diga 'Siempre' o 'Nunca', señala: 'Es así AHORA. Cambiará.'",
            "Martes: Introduce metáfora de nubes: 'Emociones son como nubes. Vienen y van.'",
            "Miércoles: En emoción intensa, respiren y observen juntos: '¿La nube está cambiando?'",
            "Jueves: Después que emoción pase, señala: 'Hace 10 min estabas enojado. Ahora calmado. ¿Ves?'",
            "Viernes: Usa metáfora de olas también: 'Las emociones suben y bajan como olas.'",
            "Sábado: Practica observar emociones sin intentar cambiarlas inmediatamente.",
            "Domingo: Reflexión: ¿Qué emociones fueron las 'nubes' más difíciles esta semana?"
        ],
        practiceScenarios: [
            "Tristeza o decepción",
            "Enojo o frustración",
            "Miedo o ansiedad",
            "Cuando dice 'SIEMPRE estoy triste' o 'NUNCA me sale bien'",
            "Cualquier emoción que parezca permanente para el niño"
        ],
        observationQuestions: [
            "¿Tu hijo acepta que emociones son temporales?",
            "¿Puede observar emoción sin ser completamente arrastrado?",
            "¿La metáfora de nubes/olas resuena con él?"
        ],
        successIndicators: [
            "Tu hijo dice 'Esta nube pasará' cuando está en emoción difícil",
            "Menos catastrofización ('Siempre', 'Nunca')",
            "Puede tolerar emociones incómodas sabiendo que pasarán",
            "Mayor resiliencia emocional"
        ],
        commonMistakes: [
            "Minimizar: 'Es solo una nube pequeña' cuando para el niño es grande",
            "Apresurar: 'Ya debería pasar' (cada emoción tiene su timing)",
            "No validar primero: conecta ANTES de enseñar que pasará",
            "Usar solo en emociones negativas (también positivas pasan)"
        ],
        weeklyReflection: "Esta herramienta enseña 'desfusión cognitiva': observar emociones sin identificarse totalmente con ellas. 'Tengo tristeza' vs. 'SOY triste'. Esta distinción es profunda y construye resiliencia. ¿Observaste más aceptación de emociones difíciles?",
        icon: "cloud.fill",
        color: "cyan"
    ),
    
    CN6TrainingWeek(
        weekNumber: 9,
        strategyNumber: 9,
        strategyName: "SIFT",
        focus: "Desarrollar conciencia profunda del mundo interior",
        dailyChallenges: [
            "Lunes: Practica SIFT contigo mismo en voz alta (modela). Comparte con tu hijo.",
            "Martes: Introduce SIFT a tu hijo: 'Vamos a explorar qué pasa dentro de ti.'",
            "Miércoles: Practica S (Sensaciones): '¿Qué siente tu cuerpo? ¿Tu panza? ¿Tu pecho?'",
            "Jueves: Practica I (Imágenes): '¿Qué imágenes o recuerdos ves en tu mente?'",
            "Viernes: Practica F (Sentimientos): '¿Qué emociones? Nómbralas.'",
            "Sábado: Practica T (Pensamientos): '¿Qué pensamientos pasan? ¿Qué te dices?'",
            "Domingo: SIFT completo de la semana. Todos comparten."
        ],
        practiceScenarios: [
            "Cuando está confundido sobre qué siente",
            "Reaccionando sin saber por qué",
            "Antes de dormir (check-in del día)",
            "Como práctica de mindfulness diaria",
            "Cuando tú mismo estás desregulado (modela)"
        ],
        observationQuestions: [
            "¿A cuál área de SIFT tiene más/menos acceso tu hijo?",
            "¿Notas que nombrar lo interno lo calma?",
            "¿SIFT se vuelve más natural con práctica?"
        ],
        successIndicators: [
            "Tu hijo puede nombrar sensaciones corporales",
            "Mayor vocabulario emocional",
            "Dice 'Siento en mi pecho...' - conciencia corporal",
            "Puede observar pensamientos sin creerlos todos automáticamente"
        ],
        commonMistakes: [
            "Esperar acceso perfecto a todas áreas (algunos niños no sienten sensaciones fácilmente)",
            "Juzgar lo que comparte ('Eso no es para tanto')",
            "Apurar el proceso (SIFT requiere tiempo y presencia)",
            "Usar solo cuando hay problema (practica también en momentos neutrales)"
        ],
        weeklyReflection: "SIFT integra múltiples áreas cerebrales: ínsula (sensaciones), corteza visual (imágenes), amígdala (emociones), corteza prefrontal (pensamientos). Esta es la base del mindfulness y autoconocimiento profundo. ¿Qué descubrió tu hijo sobre su mundo interior?",
        icon: "eye.fill",
        color: "purple"
    ),
    
    CN6TrainingWeek(
        weekNumber: 10,
        strategyNumber: 10,
        strategyName: "Ejercita la Visión de la Mente",
        focus: "Desarrollar empatía y perspectiva social consistentemente",
        dailyChallenges: [
            "Lunes: Después de conflicto con hermano/amigo: '¿Cómo crees que se sintió?'",
            "Martes: Leyendo libro o viendo película: PAUSA. '¿Qué crees que siente este personaje?'",
            "Miércoles: Pregunta sobre TU perspectiva: '¿Cómo crees que ME sentí cuando...?'",
            "Jueves: Observa expresión facial de alguien. '¿Qué emoción ves? ¿Cómo lo sabes?'",
            "Viernes: En conflicto, antes de solución: 'Para que AMBOS estén bien, ¿qué necesitamos?'",
            "Sábado: Juego de rol: actúen perspectiva del otro en conflicto pasado.",
            "Domingo: Reflexión: ¿Consideró más a otros esta semana? ¿Ejemplos?"
        ],
        practiceScenarios: [
            "Después de conflictos con hermanos o amigos",
            "Leyendo libros (pregunta sobre personajes)",
            "Viendo películas o series",
            "Observando personas en público",
            "Tu propio modelaje (habla de perspectivas de otros)"
        ],
        observationQuestions: [
            "¿Tu hijo considera sentimientos de otros más frecuentemente?",
            "¿Puede identificar emociones en expresiones faciales?",
            "¿Actúa con más empatía genuina (no solo obligada)?"
        ],
        successIndicators: [
            "Dice '¿Crees que ella está triste?' sin que preguntes",
            "Considera al otro ANTES de actuar",
            "Menos conflictos porque anticipa impacto en otros",
            "Muestra empatía genuina y espontánea"
        ],
        commonMistakes: [
            "Forzar empatía cuando SU propio tanque emocional está vacío (orden: primero conecta con SU emoción)",
            "Usar como sermón ('Deberías pensar en otros') vs. pregunta genuina",
            "Expectativas muy altas para edad (niños 4-6 aún muy egocéntricos)",
            "Solo practicar en conflictos (también en momentos positivos)"
        ],
        weeklyReflection: "Cada pregunta de perspectiva ejercita neuronas espejo y corteza prefrontal medial. Empatía NO se enseña con sermones; se desarrolla con práctica de considerar perspectivas. ¿Notaste crecimiento en consideración de otros?",
        icon: "person.2.fill",
        color: "pink"
    ),
    
    CN6TrainingWeek(
        weekNumber: 11,
        strategyNumber: 11,
        strategyName: "Incrementa el Factor Diversión",
        focus: "Priorizar conexión alegre como necesidad cerebral, no lujo",
        dailyChallenges: [
            "Lunes: Pregunta a familia: '¿Qué actividades disfrutamos TODOS juntos?' Lista.",
            "Martes: Agenda en calendario tiempo SAGRADO de diversión familiar esta semana.",
            "Miércoles: 15 min de juego sin objetivo educativo. Solo DIVERSIÓN.",
            "Jueves: Baile familiar ridículo 10 min. Objetivo: RISAS.",
            "Viernes: Cocina algo juntos. Hagan desastre. Rían.",
            "Sábado: 60+ min de actividad familiar elegida por NIÑO. Cero pantallas individuales.",
            "Domingo: Reflexión: ¿Cómo está el ambiente familiar después de semana de diversión?"
        ],
        practiceScenarios: [
            "Tiempo después de escuela/trabajo",
            "Fines de semana",
            "Comidas familiares",
            "Antes de dormir",
            "Cualquier momento disponible"
        ],
        observationQuestions: [
            "¿Qué actividades generan MÁS risas genuinas?",
            "¿Cómo cambia la dinámica familiar con más diversión?",
            "¿Qué obstáculos impiden tiempo de diversión? ¿Son reales?"
        ],
        successIndicators: [
            "Más risas en casa en general",
            "Familia anticipa tiempo de diversión con emoción",
            "Mejor cooperación durante semana",
            "Vínculos más fuertes entre todos",
            "Niños tienen memorias positivas específicas de familia"
        ],
        commonMistakes: [
            "Esperar 'si hay tiempo' (NUNCA habrá tiempo; debes priorizarlo)",
            "Hacer actividades 'educativas' disfrazadas de diversión",
            "Estar presente físicamente pero mental en el teléfono",
            "Pensar que diversión requiere dinero o eventos grandes"
        ],
        weeklyReflection: "Risas y juego liberan oxitocina y literalmente cablean cerebro para conexión. NO es lujo; es tan importante como comida o sueño para desarrollo cerebral. Los niños que tienen mucha diversión familiar desarrollan mejor regulación y resiliencia. ¿Qué cambió en tu familia?",
        icon: "face.smiling.fill",
        color: "yellow"
    ),
    
    CN6TrainingWeek(
        weekNumber: 12,
        strategyNumber: 12,
        strategyName: "Conéctate a Través del Conflicto",
        focus: "Dominar reparación relacional - nunca dejar ruptura sin reparar",
        dailyChallenges: [
            "Lunes: Identifica 1 ruptura de fin de semana pasado sin reparar. Repárala hoy.",
            "Martes: Cuando cometas error con tu hijo hoy, repara en máximo 2 horas.",
            "Miércoles: Modela reparación perfecta: admite error + valida + pregunta + repara físicamente.",
            "Jueves: Ayuda a hermanos a reparar entre ellos. Facilita, no resuelvas.",
            "Viernes: Ritual nocturno: '¿Hubo momento difícil hoy?' Si sí, repara antes de dormir.",
            "Sábado: Practica REPARACIÓN PREVENTIVA: refuerza conexión aunque no hubo conflicto.",
            "Domingo: Reflexión: ¿Reparaste cada ruptura esta semana? ¿Qué fue diferente?"
        ],
        practiceScenarios: [
            "Después de gritar o perder paciencia",
            "Conflictos entre hermanos",
            "Cuando pusiste límite de forma dura",
            "Día difícil donde hubo tensión",
            "CUALQUIER momento de ruptura relacional"
        ],
        observationQuestions: [
            "¿Cómo responde tu hijo cuando reparas con vulnerabilidad?",
            "¿Qué pasa si NO reparas vs. cuando SÍ reparas?",
            "¿Tu hijo empieza a reparar contigo o con otros?"
        ],
        successIndicators: [
            "Tu hijo viene a reparar contigo después de conflictos",
            "Dice 'Perdón' con genuinidad (no automático)",
            "Puede admitir errores más fácilmente",
            "Sabe que amor es más fuerte que errores",
            "Apego más seguro y confianza profunda"
        ],
        commonMistakes: [
            "'Perdón' automático sin conexión real (no repara)",
            "Esperar que NIÑO repare primero (tú modela)",
            "No admitir tu parte en el conflicto (vulnerabilidad importa)",
            "Dejar que día termine con ruptura sin reparar (daña acumulativamente)"
        ],
        weeklyReflection: "Siegel dice: 'Las rupturas son inevitables. La reparación es lo que construye apego seguro.' Reparar enseña que el amor es más fuerte que los errores, que las relaciones pueden romperse Y arreglarse. Esta es una de las lecciones más poderosas. ¿Qué aprendió tu hijo sobre amor incondicional?",
        icon: "arrow.triangle.2.circlepath",
        color: "green"
    )
]


