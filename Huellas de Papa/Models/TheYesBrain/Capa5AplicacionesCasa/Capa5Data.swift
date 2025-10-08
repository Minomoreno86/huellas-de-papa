import Foundation

/// Datos de rutinas, recordatorios y actividades de la Capa 5
/// Basado en "The Yes Brain" de Daniel J. Siegel y Tina Payne Bryson
struct Capa5Data {
    
    // MARK: - Rutinas
    static let rutinas: [YesBrainRoutineCasa] = [
        
        // CONTEXTO 1: MAÑANAS CON CEREBRO SÍ
        YesBrainRoutineCasa(
            title: "Despertar con receptividad",
            context: "Mañanas",
            description: "Los primeros momentos del día establecen el tono neuroemocional. Un despertar receptivo activa la corteza prefrontal en modo exploración, no supervivencia.",
            objective: "Crear transición suave del sueño a la acción, activando curiosidad y motivación interna sin estrés.",
            steps: [
                "Antes de hablar, respira profundo y observa tu propio estado interno",
                "Acércate con voz suave: 'Buenos días, ¿cómo te sientes hoy?'",
                "Dale tiempo para despertar sin prisas ni órdenes inmediatas",
                "Ofrece una elección simple: '¿Prefieres desayunar antes o después de vestirte?'",
                "Conecta emocionalmente: abrazo breve, contacto visual, sonrisa genuina",
                "Valida cualquier emoción que aparezca: 'Veo que estás cansado, es normal'",
                "Nombra una intención positiva para el día: '¿Qué te gustaría que pasara hoy?'"
            ],
            durationMinutes: 10,
            pillarsInvolved: ["Balance", "Resiliencia"],
            materials: nil,
            reflectionCue: "Cada mañana es una oportunidad de entrenar el cerebro receptivo de tu hijo.",
            icon: "sunrise.fill",
            color: "orange"
        ),
        
        YesBrainRoutineCasa(
            title: "Ritual de preparación consciente",
            context: "Mañanas",
            description: "Según Siegel y Bryson, las rutinas predecibles crean seguridad neuronal. El cerebro Sí florece en ambientes estructurados pero flexibles.",
            objective: "Fortalecer autorregulación y sentido de competencia mediante rutina predecible con espacio para autonomía.",
            steps: [
                "Usa un tablero visual o lista ilustrada de la rutina matutina",
                "Permite que el niño elija el orden de algunas tareas",
                "Acompaña sin controlar: 'Veo que estás cepillándote los dientes, ¡genial!'",
                "Si hay resistencia, conecta antes de redirigir: 'Sé que es difícil, y también sé que puedes lograrlo'",
                "Celebra pequeños logros: 'Te vestiste solo, tu cerebro está creciendo'",
                "Evita amenazas o prisas reactivas: respira y mantén tu tono calmado",
                "Cierra con reconocimiento: 'Estamos listos juntos, gracias por tu esfuerzo'"
            ],
            durationMinutes: 15,
            pillarsInvolved: ["Balance", "Insight"],
            materials: ["Tablero visual de rutina", "Reloj o temporizador visual"],
            reflectionCue: "La estructura con flexibilidad crea cerebros resilientes y seguros.",
            icon: "checklist",
            color: "blue"
        ),
        
        // CONTEXTO 2: CONFLICTOS Y LÍMITES DIARIOS
        YesBrainRoutineCasa(
            title: "Conectar antes de corregir",
            context: "Conflictos",
            description: "El principio central del Yes Brain: la conexión emocional abre la corteza prefrontal del niño, permitiendo aprendizaje real.",
            objective: "Transformar reactividad en cooperación mediante regulación conjunta y validación emocional.",
            steps: [
                "Pausa: antes de reaccionar, respira profundo y regula tu propio sistema nervioso",
                "Acércate físicamente: ponte a su altura, contacto visual suave",
                "Valida la emoción primero: 'Veo que estás molesto/frustrado/enojado'",
                "Nombra lo que observas sin juicio: 'Tu cuerpo está tenso, tu voz es fuerte'",
                "Ofrece presencia: 'Estoy aquí contigo, no estás solo'",
                "Cuando se calme, explora juntos: '¿Qué necesitabas? ¿Cómo podemos resolverlo?'",
                "Enseña la habilidad faltante: 'La próxima vez puedes usar palabras en lugar de gritar'",
                "Cierra con reparación: 'Todos nos frustramos, lo importante es cómo volvemos a conectar'"
            ],
            durationMinutes: 8,
            pillarsInvolved: ["Empatía", "Balance"],
            materials: nil,
            reflectionCue: "La conexión siempre viene antes que la corrección. Tu calma enseña más que tus palabras.",
            icon: "heart.circle.fill",
            color: "pink"
        ),
        
        YesBrainRoutineCasa(
            title: "Establecer límites con empatía",
            context: "Conflictos",
            description: "Siegel y Bryson enfatizan: los límites firmes con tono empático construyen respeto sin miedo, autoridad sin autoritarismo.",
            objective: "Enseñar autorregulación mediante límites claros y validación emocional simultánea.",
            steps: [
                "Define el límite con claridad y calma: 'No puedes pegar, eso lastima'",
                "Valida el deseo o la emoción: 'Entiendo que estás enojado, es normal sentirse así'",
                "Ofrece alternativa: '¿Qué puedes hacer en lugar de pegar? Usa palabras, pide espacio'",
                "Mantén el límite con firmeza amorosa: repite sin levantar la voz",
                "Si persiste, ofrece tiempo de regulación: 'Vamos a respirar juntos'",
                "Reconoce el esfuerzo cuando coopere: 'Usaste palabras, eso es cerebro Sí'",
                "Reflexiona más tarde: '¿Qué aprendimos de esto? ¿Cómo te sentiste?'"
            ],
            durationMinutes: 10,
            pillarsInvolved: ["Balance", "Empatía"],
            materials: nil,
            reflectionCue: "Los límites con amor construyen cerebros seguros y resilientes.",
            icon: "shield.lefthalf.filled",
            color: "purple"
        ),
        
        // CONTEXTO 3: MOMENTOS DE DESCONEXIÓN EMOCIONAL
        YesBrainRoutineCasa(
            title: "Reparar después del conflicto",
            context: "Desconexión",
            description: "La reparación es neurobiológicamente esencial: reconstruye la conexión, enseña que los errores son oportunidades y fortalece la resiliencia.",
            objective: "Practicar reparación emocional como herramienta de integración cerebral y vínculo seguro.",
            steps: [
                "Espera a que ambos estén calmados (no repares en medio de la tormenta)",
                "Inicia con humildad: 'Reaccioné mal, lo siento. Me dejé llevar por mi enojo'",
                "Nombra tu emoción: 'Estaba frustrado y perdí mi calma'",
                "Pregunta cómo se sintió: '¿Cómo te sentiste cuando te grité?'",
                "Escucha sin defenderte: valida su experiencia",
                "Explica tu intención: 'Quería que me escucharas, pero lo hice mal'",
                "Propón un plan juntos: '¿Qué podemos hacer diferente la próxima vez?'",
                "Cierra con conexión física: abrazo, mano en el hombro, mirada afectuosa"
            ],
            durationMinutes: 7,
            pillarsInvolved: ["Empatía", "Resiliencia"],
            materials: nil,
            reflectionCue: "La reparación enseña que los errores no rompen el amor, lo fortalecen.",
            icon: "heart.text.square.fill",
            color: "green"
        ),
        
        YesBrainRoutineCasa(
            title: "Regulación conjunta en crisis",
            context: "Desconexión",
            description: "En momentos de desregulación extrema, el cerebro del niño necesita 'prestar' la calma del adulto para reorganizarse.",
            objective: "Coregular el sistema nervioso del niño mediante presencia calmada y técnicas de integración cerebral.",
            steps: [
                "Mantén tu propia regulación: respira lento, relaja hombros, suaviza tu rostro",
                "Ofrece presencia sin palabras: siéntate cerca, disponible pero sin invadir",
                "Usa tono prosódico suave: voz baja, ritmo lento, melodía calmada",
                "Ofrece opciones reguladoras: 'Respiro contigo' / 'Te abrazo' / 'Te doy espacio'",
                "Sincroniza tu respiración con la suya y poco a poco alenta el ritmo",
                "Cuando baje la intensidad, valida: 'Fue muy intenso, estoy orgulloso de ti'",
                "Explora juntos qué pasó: '¿Qué sentiste? ¿Qué necesitabas?'",
                "Cierra con esperanza: 'Cada vez te recuperas más rápido, tu cerebro está aprendiendo'"
            ],
            durationMinutes: 12,
            pillarsInvolved: ["Balance", "Empatía"],
            materials: nil,
            reflectionCue: "Tu calma es el andamio que sostiene su cerebro en construcción.",
            icon: "waveform.path.ecg.rectangle.fill",
            color: "teal"
        ),
        
        // CONTEXTO 4: REENCUENTROS FAMILIARES
        YesBrainRoutineCasa(
            title: "Ritual de reencuentro consciente",
            context: "Reencuentros",
            description: "Siegel y Bryson destacan: los reencuentros activan el sistema de apego. Un reencuentro cálido recarga el tanque emocional del niño.",
            objective: "Fortalecer vínculo seguro y sentido de pertenencia mediante conexión intencional en los reencuentros.",
            steps: [
                "Detén lo que estás haciendo cuando llegue: presencia plena",
                "Contacto visual genuino y sonrisa: 'Me alegra verte'",
                "Abrazo sin prisa: deja que él decida la duración",
                "Pregunta abierta con curiosidad real: '¿Cómo estuvo tu día?'",
                "Escucha activamente: asiente, refleja emociones, no interrumpas",
                "Valida su experiencia: 'Suena que fue emocionante/difícil/divertido'",
                "Comparte algo tuyo: 'Yo también extrañé estar contigo'",
                "Crea transición suave: '¿Qué te gustaría hacer ahora?'"
            ],
            durationMinutes: 5,
            pillarsInvolved: ["Empatía"],
            materials: nil,
            reflectionCue: "Cada reencuentro es una oportunidad de decir: 'Eres importante para mí'.",
            icon: "figure.wave.circle.fill",
            color: "yellow"
        ),
        
        YesBrainRoutineCasa(
            title: "Despedidas con seguridad",
            context: "Reencuentros",
            description: "Las despedidas predecibles y afectuosas activan oxitocina y reducen cortisol, construyendo seguridad emocional.",
            objective: "Crear ritual de despedida que fortalezca confianza y reduzca ansiedad de separación.",
            steps: [
                "Avisa con anticipación: 'En 5 minutos me voy a trabajar'",
                "Explica claramente: '¿A dónde voy? ¿Cuándo regreso?'",
                "Valida emoción si hay tristeza: 'Es normal extrañar, yo también te voy a extrañar'",
                "Crea ritual físico: abrazo especial, choque de manos, frase única",
                "Sé consistente: repite el mismo ritual cada vez",
                "No prolongues la despedida: seguridad con claridad",
                "Deja objeto de conexión si es necesario: foto, dibujo, prenda",
                "Al volver, reconecta primero antes de preguntar tareas"
            ],
            durationMinutes: 3,
            pillarsInvolved: ["Balance", "Empatía"],
            materials: ["Objeto de transición (opcional)"],
            reflectionCue: "La predictibilidad y el afecto convierten la separación en oportunidad de confianza.",
            icon: "hand.wave.fill",
            color: "indigo"
        ),
        
        // CONTEXTO 5: ANTES DE DORMIR
        YesBrainRoutineCasa(
            title: "Integración emocional nocturna",
            context: "Noche",
            description: "Según Siegel y Bryson, revisar las emociones del día integra hemisferios cerebrales y consolida memoria emocional positiva.",
            objective: "Integrar experiencias del día, fortalecer narrativa personal y preparar el cerebro para sueño reparador.",
            steps: [
                "Crea ambiente calmado: luz tenue, temperatura agradable, sin pantallas",
                "Pregunta abierta: '¿Qué fue lo mejor de tu día? ¿Qué fue difícil?'",
                "Escucha con presencia total: sin juzgar, sin corregir, solo acompañar",
                "Ayuda a nombrar emociones: '¿Cómo te sentiste cuando pasó eso?'",
                "Valida todas las emociones: 'Tiene sentido que te sintieras así'",
                "Ayuda a construir narrativa: 'Entonces primero pasó... luego... y al final...'",
                "Reconoce esfuerzos y logros: 'Hoy tu cerebro creció cuando...'",
                "Cierra con gratitud y conexión: 'Gracias por compartir tu día conmigo. Te amo'"
            ],
            durationMinutes: 10,
            pillarsInvolved: ["Insight", "Empatía"],
            materials: nil,
            reflectionCue: "La integración nocturna construye cerebros que entienden sus propias emociones.",
            icon: "moon.stars.fill",
            color: "purple"
        ),
        
        YesBrainRoutineCasa(
            title: "Rutina de calma progresiva",
            context: "Noche",
            description: "Las rutinas predecibles antes de dormir activan el sistema parasimpático, facilitando sueño seguro y reparador.",
            objective: "Preparar sistema nervioso para descanso mediante secuencia reguladora y vínculo afectivo.",
            steps: [
                "Inicia la rutina a la misma hora cada noche (predictibilidad)",
                "Baño o lavado con agua tibia: activa relajación fisiológica",
                "Pijama cómoda: permite que elija si es posible",
                "Cepillado de dientes con canción o juego breve",
                "Luz tenue, ambiente silencioso: señal neurológica de descanso",
                "Cuento corto o conversación tranquila: conecta sin estimular",
                "Respiraciones profundas juntos: 'Inhala paz, exhala el día'",
                "Frase de cierre afectuosa: 'Que descanses, mañana te espera un nuevo día'"
            ],
            durationMinutes: 20,
            pillarsInvolved: ["Balance"],
            materials: ["Libro de cuentos", "Luz nocturna suave"],
            reflectionCue: "El sueño seguro nace de rutinas predecibles llenas de amor.",
            icon: "bed.double.fill",
            color: "blue"
        )
    ]
    
    // MARK: - Recordatorios
    static let recordatorios: [YesBrainReminder] = [
        // Mañanas
        YesBrainReminder(
            context: "Mañanas",
            phrase: "Tu calma matutina siembra paz en el día de tu hijo.",
            tone: "Motivacional",
            icon: "sunrise.fill",
            color: "orange"
        ),
        YesBrainReminder(
            context: "Mañanas",
            phrase: "Conecta antes de ordenar. El cerebro receptivo se abre con afecto.",
            tone: "Recordatorio breve",
            icon: "heart.fill",
            color: "pink"
        ),
        
        // Conflictos
        YesBrainReminder(
            context: "Conflictos",
            phrase: "Respira primero, luego responde. Tu regulación enseña autorregulación.",
            tone: "Empático",
            icon: "wind",
            color: "teal"
        ),
        YesBrainReminder(
            context: "Conflictos",
            phrase: "Los límites firmes con tono suave construyen respeto sin miedo.",
            tone: "Recordatorio breve",
            icon: "shield.fill",
            color: "purple"
        ),
        YesBrainReminder(
            context: "Conflictos",
            phrase: "Conectar no significa ceder. Significa validar antes de corregir.",
            tone: "Motivacional",
            icon: "hand.raised.fill",
            color: "blue"
        ),
        
        // Desconexión
        YesBrainReminder(
            context: "Desconexión",
            phrase: "La reparación enseña que el amor es más fuerte que los errores.",
            tone: "Empático",
            icon: "arrow.uturn.backward.circle.fill",
            color: "green"
        ),
        YesBrainReminder(
            context: "Desconexión",
            phrase: "Tu presencia calmada es el mejor regulador para su cerebro.",
            tone: "Motivacional",
            icon: "figure.mind.and.body",
            color: "mint"
        ),
        
        // Reencuentros
        YesBrainReminder(
            context: "Reencuentros",
            phrase: "Cada reencuentro recarga su tanque emocional. Hazlo memorable.",
            tone: "Motivacional",
            icon: "heart.circle.fill",
            color: "yellow"
        ),
        YesBrainReminder(
            context: "Reencuentros",
            phrase: "Las despedidas predecibles construyen cerebros seguros.",
            tone: "Recordatorio breve",
            icon: "hand.wave.fill",
            color: "indigo"
        ),
        
        // Noche
        YesBrainReminder(
            context: "Noche",
            phrase: "Integrar el día antes de dormir fortalece memoria emocional positiva.",
            tone: "Empático",
            icon: "moon.stars.fill",
            color: "purple"
        ),
        YesBrainReminder(
            context: "Noche",
            phrase: "La rutina nocturna es un ritual de amor que construye sueño seguro.",
            tone: "Motivacional",
            icon: "bed.double.fill",
            color: "blue"
        ),
        
        // Generales
        YesBrainReminder(
            context: "General",
            phrase: "Tu hogar es el primer gimnasio emocional de tu hijo.",
            tone: "Motivacional",
            icon: "house.fill",
            color: "green"
        ),
        YesBrainReminder(
            context: "General",
            phrase: "Cada interacción es una oportunidad de entrenar el cerebro Sí.",
            tone: "Recordatorio breve",
            icon: "brain.head.profile",
            color: "pink"
        )
    ]
    
    // MARK: - Actividades
    static let actividades: [YesBrainActivity] = [
        YesBrainActivity(
            title: "Misión: Desayuno tranquilo",
            description: "Convertir el desayuno en momento de conexión y regulación compartida.",
            goal: "Entrenar Balance y Empatía mediante presencia consciente en la comida.",
            steps: [
                "Siéntate con tu hijo, sin teléfono ni distracciones",
                "Haz contacto visual y pregunta: '¿Cómo te sientes hoy?'",
                "Come despacio, modela masticación consciente",
                "Comparte algo de tu día: '¿Sabes qué voy a hacer hoy?'",
                "Escucha con interés genuino cuando él comparta",
                "Termina con gratitud: 'Gracias por desayunar conmigo'"
            ],
            durationMinutes: 15,
            relatedRoutine: nil,
            icon: "cup.and.saucer.fill",
            color: "orange"
        ),
        
        YesBrainActivity(
            title: "Juego de las emociones",
            description: "Actividad lúdica para desarrollar vocabulario emocional y reconocimiento de estados internos.",
            goal: "Fortalecer Insight mediante identificación y nombrado de emociones.",
            steps: [
                "Dibuja caras con diferentes emociones en papeles",
                "Túrnense para elegir una y actuar esa emoción",
                "El otro debe adivinar qué emoción es",
                "Compartan situaciones donde han sentido esa emoción",
                "Validen que todas las emociones son normales",
                "Cierra preguntando: '¿Cuál emoción sentiste más esta semana?'"
            ],
            durationMinutes: 10,
            relatedRoutine: nil,
            icon: "face.smiling.fill",
            color: "yellow"
        ),
        
        YesBrainActivity(
            title: "Respiración del globo",
            description: "Técnica de respiración consciente adaptada para niños, basada en principios de regulación del Yes Brain.",
            goal: "Entrenar Balance mediante autorregulación respiratoria.",
            steps: [
                "Siéntense cómodamente frente a frente",
                "Imaginen que tienen un globo en la barriga",
                "Inhala por la nariz: el globo se infla",
                "Exhala por la boca lentamente: el globo se desinfla",
                "Repite 5 veces, sincronizados",
                "Pregunta: '¿Cómo se siente tu cuerpo ahora?'"
            ],
            durationMinutes: 5,
            relatedRoutine: nil,
            icon: "lungs.fill",
            color: "teal"
        ),
        
        YesBrainActivity(
            title: "Diario de gratitud familiar",
            description: "Ritual de reconocimiento mutuo que fortalece vínculo y activa sistema de recompensa cerebral.",
            goal: "Fortalecer Empatía y Resiliencia mediante reconocimiento de aspectos positivos.",
            steps: [
                "Cada miembro comparte una cosa por la que está agradecido del día",
                "Escuchen sin interrumpir",
                "Validen cada gratitud: 'Qué lindo que notaste eso'",
                "Escriban o dibujen la gratitud en un cuaderno compartido",
                "Terminen con abrazo o gesto afectuoso",
                "Hagan esto al menos 3 veces por semana"
            ],
            durationMinutes: 7,
            relatedRoutine: nil,
            icon: "book.fill",
            color: "green"
        ),
        
        YesBrainActivity(
            title: "Termómetro emocional",
            description: "Herramienta visual para ayudar al niño a identificar intensidad de emociones y necesidades de regulación.",
            goal: "Desarrollar Insight mediante monitoreo consciente de estados emocionales.",
            steps: [
                "Dibuja un termómetro con colores: verde (calma), amarillo (alerta), rojo (explosión)",
                "Pregunta varias veces al día: '¿En qué color estás?'",
                "Si está en amarillo o rojo, pregunta: '¿Qué necesitas para volver al verde?'",
                "Ofrece opciones: respirar, abrazar, beber agua, espacio",
                "Modela tú también: 'Yo estoy en amarillo, voy a respirar'",
                "Celebra cuando regrese al verde: 'Tu cerebro se reguló solo'"
            ],
            durationMinutes: 3,
            relatedRoutine: nil,
            icon: "thermometer.medium",
            color: "red"
        ),
        
        YesBrainActivity(
            title: "Cápsula del tiempo emocional",
            description: "Actividad para integrar experiencias significativas y fortalecer narrativa personal.",
            goal: "Entrenar Insight y Resiliencia mediante construcción de memoria autobiográfica.",
            steps: [
                "Elijan un momento especial de la semana",
                "Dibujen, escriban o guarden un objeto que lo represente",
                "Hablen sobre: ¿Qué pasó? ¿Cómo te sentiste? ¿Qué aprendiste?",
                "Guarden todo en una caja especial",
                "Revisen la caja cada mes y recuerden juntos",
                "Reflexionen sobre cómo han crecido"
            ],
            durationMinutes: 15,
            relatedRoutine: nil,
            icon: "box.fill",
            color: "purple"
        )
    ]
}

