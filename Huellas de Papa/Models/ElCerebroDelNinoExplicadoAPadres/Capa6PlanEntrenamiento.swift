import Foundation

// MARK: - CAPA 6: PLAN DE ENTRENAMIENTO - Álvaro Bilbao
/// Estructura principal para la Capa 6 del módulo "El cerebro del niño explicado a los padres"
/// Plan de entrenamiento de 28 días para formar padres emocionalmente competentes

// MARK: - Modelo general del plan de entrenamiento
struct Capa6TrainingPlan: Codable, Identifiable {
    let id: UUID
    let title: String               // "Plan 28 Días Bilbao"
    let description: String         // Narrativa inspiracional inicial
    let phases: [Capa6Phase]        // 4 fases semanales
    let totalDays: Int
    let themeColor: String          // Hex principal según fase
    
    init(title: String, description: String, phases: [Capa6Phase], totalDays: Int, themeColor: String) {
        self.id = UUID()
        self.title = title
        self.description = description
        self.phases = phases
        self.totalDays = totalDays
        self.themeColor = themeColor
    }
}

// MARK: - Semana temática del plan
struct Capa6Phase: Codable, Identifiable {
    let id: UUID
    let title: String               // "Semana 1 – Conecta"
    let objectives: [Capa6Objective]
    let visualSymbol: String        // Ej. "🌱", "🌤️"
    let themeColor: String
    let description: String
    
    init(title: String, objectives: [Capa6Objective], visualSymbol: String, themeColor: String, description: String) {
        self.id = UUID()
        self.title = title
        self.objectives = objectives
        self.visualSymbol = visualSymbol
        self.themeColor = themeColor
        self.description = description
    }
}

// MARK: - Objetivo o día de entrenamiento
struct Capa6Objective: Codable, Identifiable {
    let id: UUID
    let dayNumber: Int
    let title: String               // "Escucha antes de hablar"
    let description: String         // Explicación clínica breve
    let activity: Capa6Activity
    let reflectionPrompt: String
    let rewardType: RewardType
    let completed: Bool
    let completionDate: Date?
    
    init(dayNumber: Int, title: String, description: String, activity: Capa6Activity, reflectionPrompt: String, rewardType: RewardType, completed: Bool = false, completionDate: Date? = nil) {
        self.id = UUID()
        self.dayNumber = dayNumber
        self.title = title
        self.description = description
        self.activity = activity
        self.reflectionPrompt = reflectionPrompt
        self.rewardType = rewardType
        self.completed = completed
        self.completionDate = completionDate
    }
}

// MARK: - Tipo de actividad práctica
struct Capa6Activity: Codable {
    let type: ActivityType          // .reflection, .breathing, .scenario, .game
    let durationMinutes: Int
    let instruction: String         // Guía paso a paso
    let relatedPrincipleId: UUID?    // vinculado a Capa2Principle
    let materials: [String]        // Materiales necesarios
    
    init(type: ActivityType, durationMinutes: Int, instruction: String, relatedPrincipleId: UUID? = nil, materials: [String] = []) {
        self.type = type
        self.durationMinutes = durationMinutes
        self.instruction = instruction
        self.relatedPrincipleId = relatedPrincipleId
        self.materials = materials
    }
}

// MARK: - Tipos de actividad
enum ActivityType: String, Codable, CaseIterable {
    case reflection = "reflection"
    case breathing = "breathing"
    case scenario = "scenario"
    case game = "game"
    case journaling = "journaling"
    case meditation = "meditation"
    
    var displayName: String {
        switch self {
        case .reflection: return "Reflexión"
        case .breathing: return "Respiración"
        case .scenario: return "Escenario"
        case .game: return "Juego"
        case .journaling: return "Diario"
        case .meditation: return "Meditación"
        }
    }
    
    var icon: String {
        switch self {
        case .reflection: return "brain.head.profile"
        case .breathing: return "lungs.fill"
        case .scenario: return "theatermasks.fill"
        case .game: return "gamecontroller.fill"
        case .journaling: return "book.fill"
        case .meditation: return "leaf.fill"
        }
    }
}

// MARK: - Tipo de recompensa (dopamina ética)
enum RewardType: String, Codable, CaseIterable {
    case visualGrowth    // animación de planta o árbol
    case quoteUnlock     // frase inspiradora
    case soundChime      // sonido relajante breve
    case badgeEarned     // medalla desbloqueada
    case progressMilestone // hito de progreso
    
    var displayName: String {
        switch self {
        case .visualGrowth: return "Crecimiento Visual"
        case .quoteUnlock: return "Frase Inspiradora"
        case .soundChime: return "Sonido Relajante"
        case .badgeEarned: return "Medalla Desbloqueada"
        case .progressMilestone: return "Hito de Progreso"
        }
    }
    
    var icon: String {
        switch self {
        case .visualGrowth: return "leaf.fill"
        case .quoteUnlock: return "quote.bubble.fill"
        case .soundChime: return "speaker.wave.2.fill"
        case .badgeEarned: return "medal.fill"
        case .progressMilestone: return "flag.fill"
        }
    }
}

// MARK: - Estructura principal de la Capa 6
struct Capa6PlanEntrenamiento: Identifiable, Codable {
    let id: UUID
    let trainingPlan: Capa6TrainingPlan
    let currentDay: Int
    let currentPhase: Int
    let totalProgress: Double
    let startDate: Date?
    let lastActivityDate: Date?
    let streak: Int // días consecutivos
    let completedDays: [Int] // días completados
    
    init(trainingPlan: Capa6TrainingPlan, currentDay: Int = 1, currentPhase: Int = 1, totalProgress: Double = 0.0, startDate: Date? = nil, lastActivityDate: Date? = nil, streak: Int = 0, completedDays: [Int] = []) {
        self.id = UUID()
        self.trainingPlan = trainingPlan
        self.currentDay = currentDay
        self.currentPhase = currentPhase
        self.totalProgress = totalProgress
        self.startDate = startDate
        self.lastActivityDate = lastActivityDate
        self.streak = streak
        self.completedDays = completedDays
    }
    
    // MARK: - Contenido específico del módulo
    static func contenidoCerebroDelNino() -> Capa6PlanEntrenamiento {
        let trainingPlan = Capa6TrainingPlan(
            title: "Plan 28 Días Bilbao",
            description: """
            Forma padres emocionalmente competentes mediante micro-entrenamientos diarios que integran conocimiento, emoción y acción. Basado en "El cerebro del niño explicado a los padres" de Álvaro Bilbao, este plan de 28 días te guiará a través de 4 fases transformadoras diseñadas para fortalecer tu conexión emocional con tu hijo y desarrollar habilidades parentales basadas en neurociencia.
            """,
            phases: Capa6PlanEntrenamiento.crearFases(),
            totalDays: 28,
            themeColor: "#4A90E2"
        )
        
        return Capa6PlanEntrenamiento(trainingPlan: trainingPlan)
    }
    
    // MARK: - Crear las 4 fases del plan
    static func crearFases() -> [Capa6Phase] {
        return [
            // SEMANA 1 - CONECTA
            Capa6Phase(
                title: "Semana 1 – Conecta",
                objectives: Capa6PlanEntrenamiento.crearObjetivosSemana1(),
                visualSymbol: "🌱",
                themeColor: "#4A90E2",
                description: "Validar, observar y escuchar. Fortalecer la empatía y la calma parental."
            ),
            
            // SEMANA 2 - REGULA
            Capa6Phase(
                title: "Semana 2 – Regula",
                objectives: Capa6PlanEntrenamiento.crearObjetivosSemana2(),
                visualSymbol: "🌤️",
                themeColor: "#7ED321",
                description: "Controlar impulsos, nombrar emociones. Entrenar el sistema prefrontal en pausa y lenguaje."
            ),
            
            // SEMANA 3 - GUÍA
            Capa6Phase(
                title: "Semana 3 – Guía",
                objectives: Capa6PlanEntrenamiento.crearObjetivosSemana3(),
                visualSymbol: "🌳",
                themeColor: "#F5A623",
                description: "Establecer límites con afecto. Consolidar liderazgo tranquilo y límites claros."
            ),
            
            // SEMANA 4 - INTEGRA
            Capa6Phase(
                title: "Semana 4 – Integra",
                objectives: Capa6PlanEntrenamiento.crearObjetivosSemana4(),
                visualSymbol: "🌟",
                themeColor: "#BD10E0",
                description: "Crear hábitos familiares. Internalizar autocontrol y conexión duradera."
            )
        ]
    }
    
    // MARK: - Objetivos Semana 1 - Conecta
    static func crearObjetivosSemana1() -> [Capa6Objective] {
        return [
            Capa6Objective(
                dayNumber: 1,
                title: "Escucha antes de hablar",
                description: "Practica la escucha activa con tu hijo. Observa sus señales no verbales y responde con empatía antes de dar consejos.",
                activity: Capa6Activity(
                    type: .reflection,
                    durationMinutes: 5,
                    instruction: "Durante 5 minutos, escucha a tu hijo sin interrumpir. Observa su lenguaje corporal y responde solo con 'Entiendo' o 'Cuéntame más'.",
                    materials: ["Cronómetro", "Diario"]
                ),
                reflectionPrompt: "¿Qué notaste en el lenguaje corporal de tu hijo mientras escuchabas?",
                rewardType: .visualGrowth
            ),
            
            Capa6Objective(
                dayNumber: 2,
                title: "El poder de la mirada",
                description: "Conecta emocionalmente a través del contacto visual. La mirada transmite amor y seguridad.",
                activity: Capa6Activity(
                    type: .breathing,
                    durationMinutes: 3,
                    instruction: "Mira a los ojos de tu hijo durante 3 minutos mientras respiran juntos. Cuenta hasta 4 al inhalar y hasta 4 al exhalar.",
                    materials: ["Cronómetro"]
                ),
                reflectionPrompt: "¿Cómo se sintió la conexión a través de la mirada?",
                rewardType: .soundChime
            ),
            
            Capa6Objective(
                dayNumber: 3,
                title: "Validar emociones",
                description: "Reconoce y valida las emociones de tu hijo sin juzgar. Esto fortalece su autoestima y confianza.",
                activity: Capa6Activity(
                    type: .scenario,
                    durationMinutes: 10,
                    instruction: "Cuando tu hijo exprese una emoción, di: 'Veo que te sientes [emoción]. Es normal sentirse así.' Luego pregúntale qué necesita.",
                    materials: ["Diario de emociones"]
                ),
                reflectionPrompt: "¿Qué emociones observaste en tu hijo hoy?",
                rewardType: .quoteUnlock
            ),
            
            Capa6Objective(
                dayNumber: 4,
                title: "Presencia plena",
                description: "Está completamente presente con tu hijo. Sin distracciones, sin multitarea, solo tú y él.",
                activity: Capa6Activity(
                    type: .meditation,
                    durationMinutes: 15,
                    instruction: "Dedica 15 minutos a estar completamente presente con tu hijo. Sin teléfono, sin distracciones. Solo observa, escucha y conecta.",
                    materials: ["Espacio tranquilo"]
                ),
                reflectionPrompt: "¿Qué notaste cuando estuviste completamente presente?",
                rewardType: .visualGrowth
            ),
            
            Capa6Objective(
                dayNumber: 5,
                title: "El toque sanador",
                description: "Usa el contacto físico para transmitir calma y seguridad. Un abrazo puede regular el sistema nervioso.",
                activity: Capa6Activity(
                    type: .breathing,
                    durationMinutes: 5,
                    instruction: "Abraza a tu hijo durante 5 minutos mientras respiran juntos. Siente cómo sus cuerpos se sincronizan.",
                    materials: []
                ),
                reflectionPrompt: "¿Cómo cambió la energía después del abrazo?",
                rewardType: .soundChime
            ),
            
            Capa6Objective(
                dayNumber: 6,
                title: "Observar sin juzgar",
                description: "Observa el comportamiento de tu hijo sin interpretar o juzgar. Ve la situación tal como es.",
                activity: Capa6Activity(
                    type: .reflection,
                    durationMinutes: 10,
                    instruction: "Observa a tu hijo durante 10 minutos sin intervenir. Solo observa y anota lo que ves sin interpretar.",
                    materials: ["Diario de observación"]
                ),
                reflectionPrompt: "¿Qué patrones observaste en el comportamiento de tu hijo?",
                rewardType: .quoteUnlock
            ),
            
            Capa6Objective(
                dayNumber: 7,
                title: "Conexión diaria",
                description: "Establece un ritual de conexión diaria. Un momento sagrado entre tú y tu hijo.",
                activity: Capa6Activity(
                    type: .journaling,
                    durationMinutes: 20,
                    instruction: "Crea un ritual de conexión diaria con tu hijo. Puede ser al despertar, antes de dormir, o en cualquier momento especial.",
                    materials: ["Diario familiar"]
                ),
                reflectionPrompt: "¿Cómo se sintió establecer este ritual de conexión?",
                rewardType: .badgeEarned
            )
        ]
    }
    
    // MARK: - Objetivos Semana 2 - Regula
    static func crearObjetivosSemana2() -> [Capa6Objective] {
        return [
            Capa6Objective(
                dayNumber: 8,
                title: "Respiración de la tortuga",
                description: "Enseña a tu hijo a regular sus emociones a través de la respiración. La tortuga se retrae para calmarse.",
                activity: Capa6Activity(
                    type: .breathing,
                    durationMinutes: 5,
                    instruction: "Enséñale a tu hijo a respirar como una tortuga: inhalar 4 segundos, sostener 4, exhalar 4. Practica juntos.",
                    materials: ["Imagen de tortuga"]
                ),
                reflectionPrompt: "¿Cómo respondió tu hijo a la técnica de respiración?",
                rewardType: .visualGrowth
            ),
            
            Capa6Objective(
                dayNumber: 9,
                title: "Nombrar emociones",
                description: "Ayuda a tu hijo a identificar y nombrar sus emociones. Esto activa la corteza prefrontal.",
                activity: Capa6Activity(
                    type: .game,
                    durationMinutes: 15,
                    instruction: "Juega '¿Cómo me siento?' con tu hijo. Muestra diferentes expresiones faciales y pídele que nombre la emoción.",
                    materials: ["Tarjetas de emociones"]
                ),
                reflectionPrompt: "¿Qué emociones pudo identificar tu hijo?",
                rewardType: .soundChime
            ),
            
            Capa6Objective(
                dayNumber: 10,
                title: "La pausa prefrontal",
                description: "Practica la pausa antes de reaccionar. Esto fortalece el control ejecutivo.",
                activity: Capa6Activity(
                    type: .reflection,
                    durationMinutes: 10,
                    instruction: "Antes de reaccionar a una situación, cuenta hasta 5. Respira y luego responde con calma.",
                    materials: ["Cronómetro"]
                ),
                reflectionPrompt: "¿Qué notaste cuando hiciste la pausa antes de reaccionar?",
                rewardType: .quoteUnlock
            ),
            
            Capa6Objective(
                dayNumber: 11,
                title: "El termómetro emocional",
                description: "Crea un termómetro visual para que tu hijo identifique la intensidad de sus emociones.",
                activity: Capa6Activity(
                    type: .game,
                    durationMinutes: 20,
                    instruction: "Haz un termómetro de emociones con tu hijo. Del 1 al 10, ¿qué tan intensa es su emoción?",
                    materials: ["Papel", "Colores", "Regla"]
                ),
                reflectionPrompt: "¿Cómo usó tu hijo el termómetro emocional?",
                rewardType: .visualGrowth
            ),
            
            Capa6Objective(
                dayNumber: 12,
                title: "Técnica del semáforo",
                description: "Usa el semáforo para regular emociones: rojo (parar), amarillo (pensar), verde (actuar).",
                activity: Capa6Activity(
                    type: .scenario,
                    durationMinutes: 15,
                    instruction: "Practica la técnica del semáforo: Rojo (parar y respirar), Amarillo (pensar en opciones), Verde (actuar con calma).",
                    materials: ["Tarjetas de colores"]
                ),
                reflectionPrompt: "¿En qué situaciones usó tu hijo el semáforo?",
                rewardType: .soundChime
            ),
            
            Capa6Objective(
                dayNumber: 13,
                title: "Mindfulness familiar",
                description: "Practica mindfulness en familia. Esto fortalece la atención y la regulación emocional.",
                activity: Capa6Activity(
                    type: .meditation,
                    durationMinutes: 10,
                    instruction: "Haz una meditación de 10 minutos con tu hijo. Enfócate en la respiración y en los sonidos del ambiente.",
                    materials: ["Espacio tranquilo"]
                ),
                reflectionPrompt: "¿Cómo se sintió la práctica de mindfulness en familia?",
                rewardType: .quoteUnlock
            ),
            
            Capa6Objective(
                dayNumber: 14,
                title: "Regulación co-regulada",
                description: "Regula tus propias emociones para ayudar a tu hijo a regular las suyas. La calma es contagiosa.",
                activity: Capa6Activity(
                    type: .reflection,
                    durationMinutes: 15,
                    instruction: "Cuando tu hijo esté alterado, primero regula tu propia respiración y calma. Luego ayúdalo a regularse.",
                    materials: ["Diario de regulación"]
                ),
                reflectionPrompt: "¿Cómo afectó tu calma a la regulación de tu hijo?",
                rewardType: .badgeEarned
            )
        ]
    }
    
    // MARK: - Objetivos Semana 3 - Guía
    static func crearObjetivosSemana3() -> [Capa6Objective] {
        return [
            Capa6Objective(
                dayNumber: 15,
                title: "Límites con amor",
                description: "Establece límites claros y firmes, pero con amor. Los límites dan seguridad y estructura.",
                activity: Capa6Activity(
                    type: .scenario,
                    durationMinutes: 20,
                    instruction: "Practica establecer un límite con amor: 'Te amo, pero no puedes [acción]. Te ayudo a [alternativa positiva].'",
                    materials: ["Diario de límites"]
                ),
                reflectionPrompt: "¿Cómo respondió tu hijo a los límites establecidos con amor?",
                rewardType: .visualGrowth
            ),
            
            Capa6Objective(
                dayNumber: 16,
                title: "Consecuencias naturales",
                description: "Permite que tu hijo experimente las consecuencias naturales de sus acciones. Esto enseña responsabilidad.",
                activity: Capa6Activity(
                    type: .reflection,
                    durationMinutes: 15,
                    instruction: "Identifica una situación donde puedas permitir que tu hijo experimente las consecuencias naturales de sus acciones.",
                    materials: ["Diario de consecuencias"]
                ),
                reflectionPrompt: "¿Qué aprendió tu hijo de las consecuencias naturales?",
                rewardType: .soundChime
            ),
            
            Capa6Objective(
                dayNumber: 17,
                title: "El liderazgo tranquilo",
                description: "Mantén la calma mientras guías a tu hijo. El liderazgo tranquilo es más efectivo que la autoridad rígida.",
                activity: Capa6Activity(
                    type: .breathing,
                    durationMinutes: 10,
                    instruction: "Antes de dar una instrucción, respira profundamente. Luego da la instrucción con calma y firmeza.",
                    materials: ["Cronómetro"]
                ),
                reflectionPrompt: "¿Cómo cambió la respuesta de tu hijo con el liderazgo tranquilo?",
                rewardType: .quoteUnlock
            ),
            
            Capa6Objective(
                dayNumber: 18,
                title: "Opciones y elecciones",
                description: "Ofrece opciones limitadas a tu hijo. Esto le da sensación de control y reduce la resistencia.",
                activity: Capa6Activity(
                    type: .game,
                    durationMinutes: 15,
                    instruction: "En lugar de dar órdenes, ofrece opciones: '¿Prefieres hacer esto ahora o en 5 minutos?'",
                    materials: ["Cronómetro"]
                ),
                reflectionPrompt: "¿Cómo respondió tu hijo a tener opciones?",
                rewardType: .visualGrowth
            ),
            
            Capa6Objective(
                dayNumber: 19,
                title: "Rutinas y estructura",
                description: "Establece rutinas claras y predecibles. La estructura da seguridad y reduce la ansiedad.",
                activity: Capa6Activity(
                    type: .journaling,
                    durationMinutes: 25,
                    instruction: "Crea un horario visual con tu hijo. Incluye tiempos para actividades, comidas y descanso.",
                    materials: ["Papel", "Colores", "Imágenes"]
                ),
                reflectionPrompt: "¿Cómo se sintió tu hijo con la nueva estructura?",
                rewardType: .soundChime
            ),
            
            Capa6Objective(
                dayNumber: 20,
                title: "Refuerzo positivo",
                description: "Refuerza el comportamiento positivo específicamente. Esto fortalece las conexiones neuronales deseadas.",
                activity: Capa6Activity(
                    type: .reflection,
                    durationMinutes: 10,
                    instruction: "Observa y refuerza específicamente el comportamiento positivo de tu hijo: 'Me gusta cómo [comportamiento específico].'",
                    materials: ["Diario de refuerzos"]
                ),
                reflectionPrompt: "¿Qué comportamientos positivos observaste en tu hijo?",
                rewardType: .quoteUnlock
            ),
            
            Capa6Objective(
                dayNumber: 21,
                title: "Consistencia y coherencia",
                description: "Mantén consistencia en tus respuestas. La coherencia da seguridad y predecibilidad.",
                activity: Capa6Activity(
                    type: .reflection,
                    durationMinutes: 15,
                    instruction: "Revisa tus respuestas a situaciones similares. ¿Eres consistente? ¿Qué puedes mejorar?",
                    materials: ["Diario de consistencia"]
                ),
                reflectionPrompt: "¿Qué patrones notaste en tu consistencia como padre?",
                rewardType: .badgeEarned
            )
        ]
    }
    
    // MARK: - Objetivos Semana 4 - Integra
    static func crearObjetivosSemana4() -> [Capa6Objective] {
        return [
            Capa6Objective(
                dayNumber: 22,
                title: "Hábitos familiares",
                description: "Crea hábitos familiares que fortalezcan la conexión y el bienestar. Los hábitos se convierten en rutina.",
                activity: Capa6Activity(
                    type: .journaling,
                    durationMinutes: 30,
                    instruction: "Identifica 3 hábitos familiares que quieres establecer. Planifica cómo implementarlos gradualmente.",
                    materials: ["Diario familiar", "Calendario"]
                ),
                reflectionPrompt: "¿Qué hábitos familiares quieres establecer?",
                rewardType: .visualGrowth
            ),
            
            Capa6Objective(
                dayNumber: 23,
                title: "Autocontrol parental",
                description: "Desarrolla tu propio autocontrol. Tu regulación emocional es el modelo para tu hijo.",
                activity: Capa6Activity(
                    type: .meditation,
                    durationMinutes: 20,
                    instruction: "Practica meditación diaria para fortalecer tu autocontrol. Observa tus emociones sin juzgarlas.",
                    materials: ["Espacio tranquilo", "Cronómetro"]
                ),
                reflectionPrompt: "¿Cómo mejoró tu autocontrol con la práctica?",
                rewardType: .soundChime
            ),
            
            Capa6Objective(
                dayNumber: 24,
                title: "Conexión duradera",
                description: "Fortalece la conexión emocional con tu hijo. La conexión es la base de todo desarrollo.",
                activity: Capa6Activity(
                    type: .reflection,
                    durationMinutes: 25,
                    instruction: "Dedica tiempo de calidad exclusivo con tu hijo. Sin distracciones, solo conexión pura.",
                    materials: ["Diario de conexión"]
                ),
                reflectionPrompt: "¿Cómo se sintió la conexión profunda con tu hijo?",
                rewardType: .quoteUnlock
            ),
            
            Capa6Objective(
                dayNumber: 25,
                title: "Celebración del progreso",
                description: "Celebra los logros y el progreso. La celebración refuerza el comportamiento positivo.",
                activity: Capa6Activity(
                    type: .game,
                    durationMinutes: 20,
                    instruction: "Crea una celebración especial para reconocer el progreso de tu hijo. Puede ser un ritual, una actividad especial, o palabras de reconocimiento.",
                    materials: ["Materiales para celebración"]
                ),
                reflectionPrompt: "¿Cómo celebraste el progreso de tu hijo?",
                rewardType: .visualGrowth
            ),
            
            Capa6Objective(
                dayNumber: 26,
                title: "Reflexión y aprendizaje",
                description: "Reflexiona sobre lo aprendido en el plan. La reflexión consolida el aprendizaje.",
                activity: Capa6Activity(
                    type: .journaling,
                    durationMinutes: 30,
                    instruction: "Escribe una reflexión sobre tu experiencia en el plan. ¿Qué aprendiste? ¿Qué cambiarías? ¿Qué continuarás haciendo?",
                    materials: ["Diario de reflexión"]
                ),
                reflectionPrompt: "¿Qué ha sido lo más valioso de esta experiencia?",
                rewardType: .soundChime
            ),
            
            Capa6Objective(
                dayNumber: 27,
                title: "Integración de habilidades",
                description: "Integra todas las habilidades aprendidas en tu rutina diaria. La práctica hace la maestría.",
                activity: Capa6Activity(
                    type: .reflection,
                    durationMinutes: 20,
                    instruction: "Practica integrando las habilidades aprendidas en situaciones reales. Observa cómo se siente la integración.",
                    materials: ["Diario de integración"]
                ),
                reflectionPrompt: "¿Cómo se siente integrar estas habilidades en tu vida diaria?",
                rewardType: .quoteUnlock
            ),
            
            Capa6Objective(
                dayNumber: 28,
                title: "Compromiso continuo",
                description: "Renueva tu compromiso con el desarrollo emocional de tu hijo. El crecimiento es un proceso continuo.",
                activity: Capa6Activity(
                    type: .journaling,
                    durationMinutes: 35,
                    instruction: "Escribe tu compromiso continuo con el desarrollo emocional de tu hijo. ¿Qué continuarás haciendo? ¿Qué nuevos objetivos tienes?",
                    materials: ["Diario de compromiso"]
                ),
                reflectionPrompt: "¿Cuál es tu compromiso continuo con el desarrollo de tu hijo?",
                rewardType: .progressMilestone
            )
        ]
    }
}

// MARK: - Reflexión del Día
struct DayReflection: Codable, Identifiable {
    let id: UUID
    let dayNumber: Int
    let reflectionText: String
    let date: Date
    let moodRating: Int // 1-5
    let insights: [String]
    
    init(dayNumber: Int, reflectionText: String, moodRating: Int, insights: [String] = []) {
        self.id = UUID()
        self.dayNumber = dayNumber
        self.reflectionText = reflectionText
        self.date = Date()
        self.moodRating = moodRating
        self.insights = insights
    }
}

// MARK: - Recompensa Ganada
struct RewardEarned: Codable, Identifiable {
    let id: UUID
    let dayNumber: Int
    let rewardType: RewardType
    let date: Date
    let message: String
    
    init(dayNumber: Int, rewardType: RewardType, message: String) {
        self.id = UUID()
        self.dayNumber = dayNumber
        self.rewardType = rewardType
        self.date = Date()
        self.message = message
    }
}
