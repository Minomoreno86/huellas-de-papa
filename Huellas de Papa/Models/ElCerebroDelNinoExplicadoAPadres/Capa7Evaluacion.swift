import Foundation
import SwiftUI

// MARK: - Modelos de Evaluación

struct EvalItem: Identifiable, Codable {
    enum ItemType: String, Codable, CaseIterable {
        case mcq = "mcq"
        case multi = "multi"
        case order = "order"
        case branch = "branch"
        case microReto = "microReto"
        case transfer = "transfer"
        case journaling = "journaling"
    }
    
    let id: String
    let moduleId: String
    let chapter: String
    let concept: String
    let ageRange: String // "2-5", "6-10", "11-14"
    let difficulty: Int // 1...5
    let type: ItemType
    let prompt: String
    let options: [String]?           // mcq/multi
    let correct: [Int]?              // índices correctos
    let branches: [BranchNode]?      // para simulaciones
    let explanation: String
    let chapterReference: String
}

struct BranchNode: Codable {
    let optionText: String
    let nextId: String?      // id del siguiente nodo/ítem
    let weight: Double       // impacto en H (0..1)
    let feedback: String
}

struct EvalSessionState: Codable {
    var difficulty = 2
    var streak = 0
    var fails = 0
    var lastConcept: String?
    var currentSession: Date = Date()
    var itemsCompleted: [String] = []
}

struct ModuleScore: Codable {
    var K: Double = 0.0      // Conocimiento
    var H: Double = 0.0      // Habilidad aplicada
    var C: Double = 0.0      // Consistencia
    var T: Double = 0.0      // Transferencia al hogar
    var updatedAt: Date = Date()
    
    var totalScore: Double {
        return 0.30 * K + 0.30 * H + 0.20 * C + 0.20 * T
    }
    
    var level: EvaluationLevel {
        switch totalScore {
        case 0..<50: return .novato
        case 50..<70: return .practico
        case 70..<85: return .guiador
        default: return .maestro
        }
    }
}

enum EvaluationLevel: String, Codable, CaseIterable {
    case novato = "Novato"
    case practico = "Práctico"
    case guiador = "Guiador"
    case maestro = "Maestro"
    
    var description: String {
        switch self {
        case .novato: return "Estás comenzando tu viaje de aprendizaje"
        case .practico: return "Ya tienes conocimientos sólidos"
        case .guiador: return "Eres un guía experto"
        case .maestro: return "Dominas completamente el tema"
        }
    }
    
    var color: Color {
        switch self {
        case .novato: return .orange
        case .practico: return .blue
        case .guiador: return .purple
        case .maestro: return .green
        }
    }
}

// MARK: - Sistema Adaptativo

class EvaluationAdaptiveSystem: ObservableObject {
    @Published var sessionState: EvalSessionState
    @Published var moduleScore: ModuleScore
    
    init() {
        self.sessionState = EvalSessionState()
        self.moduleScore = ModuleScore()
    }
    
    func nextItem(from bank: [EvalItem], targetConcept: String? = nil) -> EvalItem? {
        let concept = targetConcept ?? sessionState.lastConcept
        let pool = bank.filter { 
            $0.concept == concept && 
            $0.difficulty == sessionState.difficulty &&
            !sessionState.itemsCompleted.contains($0.id)
        }
        
        if let pick = pool.randomElement() { 
            return pick 
        }
        
        // Fallback por dificultad +/- 1
        let alt = bank.filter { 
            $0.concept == concept && 
            abs($0.difficulty - sessionState.difficulty) <= 1 &&
            !sessionState.itemsCompleted.contains($0.id)
        }
        
        return alt.randomElement() ?? bank.filter { 
            !sessionState.itemsCompleted.contains($0.id) 
        }.randomElement()
    }
    
    func registerMCQ(answer idx: Int, correct: Int, difficulty: Int) -> (deltaK: Double, deltaH: Double) {
        let ok = (idx == correct)
        sessionState.streak = ok ? (sessionState.streak + 1) : 0
        sessionState.fails = ok ? 0 : (sessionState.fails + 1)
        
        if sessionState.streak >= 2 { 
            sessionState.difficulty = min(sessionState.difficulty + 1, 5) 
        }
        if sessionState.fails >= 2 { 
            sessionState.difficulty = max(sessionState.difficulty - 1, 1) 
        }
        
        let dK = ok ? (10.0 * Double(difficulty)) : (-5.0)
        return (dK, 0.0)
    }
    
    func registerBranching(weight: Double) -> (deltaK: Double, deltaH: Double) {
        let dH = weight * 15.0
        return (0.0, dH)
    }
    
    func registerMicroReto() -> Double {
        return 5.0 // Puntos de consistencia
    }
    
    func registerTransfer(effectiveness: Int) -> Double {
        return Double(effectiveness) * 8.0 // Puntos de transferencia
    }
    
    func updateScores(deltaK: Double, deltaH: Double, deltaC: Double = 0, deltaT: Double = 0) {
        moduleScore.K = max(0, min(100, moduleScore.K + deltaK))
        moduleScore.H = max(0, min(100, moduleScore.H + deltaH))
        moduleScore.C = max(0, min(100, moduleScore.C + deltaC))
        moduleScore.T = max(0, min(100, moduleScore.T + deltaT))
        moduleScore.updatedAt = Date()
    }
}

// MARK: - Contenido del Módulo "El Cerebro del Niño"

struct Capa7Evaluacion: Codable {
    let id: UUID
    let titulo: String
    let descripcion: String
    let introduccion: String
    let objetivos: [String]
    let dimensiones: [DimensionEvaluacion]
    let items: [EvalItem]
    let progreso: Double
    
    init(titulo: String, descripcion: String, introduccion: String, objetivos: [String], dimensiones: [DimensionEvaluacion], items: [EvalItem], progreso: Double) {
        self.id = UUID()
        self.titulo = titulo
        self.descripcion = descripcion
        self.introduccion = introduccion
        self.objetivos = objetivos
        self.dimensiones = dimensiones
        self.items = items
        self.progreso = progreso
    }
    
    static func contenidoCerebroDelNino() -> Capa7Evaluacion {
        return Capa7Evaluacion(
            titulo: "Evaluación del Desarrollo Cerebral",
            descripcion: "Sistema adaptativo de evaluación en 4 dimensiones: Conocimiento, Habilidad, Consistencia y Transferencia",
            introduccion: """
            Esta evaluación te permitirá medir tu comprensión y aplicación práctica de los conceptos del desarrollo cerebral infantil. 
            
            El sistema se adapta a tu nivel y te proporciona retroalimentación inmediata basada en el libro "El Cerebro del Niño explicado a los padres".
            """,
            objetivos: [
                "Medir tu conocimiento teórico sobre neurodesarrollo",
                "Evaluar tu capacidad de aplicación práctica",
                "Fomentar la consistencia en el uso de técnicas",
                "Promover la transferencia efectiva al hogar"
            ],
            dimensiones: [
                DimensionEvaluacion(
                    nombre: "Conocimiento (K)",
                    descripcion: "Comprensión teórica de conceptos neurocientíficos",
                    peso: 0.30,
                    icono: "brain.head.profile",
                    color: "blue"
                ),
                DimensionEvaluacion(
                    nombre: "Habilidad (H)",
                    descripcion: "Capacidad de aplicar técnicas en situaciones reales",
                    peso: 0.30,
                    icono: "hand.raised.fill",
                    color: "green"
                ),
                DimensionEvaluacion(
                    nombre: "Consistencia (C)",
                    descripcion: "Uso regular y sostenido de las estrategias",
                    peso: 0.20,
                    icono: "calendar.badge.clock",
                    color: "orange"
                ),
                DimensionEvaluacion(
                    nombre: "Transferencia (T)",
                    descripcion: "Aplicación exitosa en el contexto familiar",
                    peso: 0.20,
                    icono: "house.fill",
                    color: "purple"
                )
            ],
            items: generarItemsEvaluacion(),
            progreso: 0.0
        )
    }
}

struct DimensionEvaluacion: Identifiable, Codable {
    let id: UUID
    let nombre: String
    let descripcion: String
    let peso: Double
    let icono: String
    let color: String
    
    init(nombre: String, descripcion: String, peso: Double, icono: String, color: String) {
        self.id = UUID()
        self.nombre = nombre
        self.descripcion = descripcion
        self.peso = peso
        self.icono = icono
        self.color = color
    }
}

// MARK: - Generación de Items de Evaluación

func generarItemsEvaluacion() -> [EvalItem] {
    var items: [EvalItem] = []
    
    // Items de Conocimiento (K) - Situaciones Prácticas
    items.append(contentsOf: [
        EvalItem(
            id: "k1",
            moduleId: "cerebro-nino-explicado-padres",
            chapter: "Capítulo 1",
            concept: "rabietas",
            ageRange: "2-5",
            difficulty: 2,
            type: .mcq,
            prompt: "Tu hijo de 3 años tiene una rabieta porque no quiere irse del parque. ¿Qué debes hacer PRIMERO?",
            options: [
                "Gritarle que se calme",
                "Agacharte a su altura y respirar profundamente",
                "Ignorarlo hasta que se canse",
                "Prometerle un premio si se calma"
            ],
            correct: [1],
            branches: nil,
            explanation: "La co-regulación comienza con tu propia calma. Al respirar profundamente, le enseñas al niño a autorregularse.",
            chapterReference: "Capítulo 1: El cerebro emocional del niño"
        ),
        
        EvalItem(
            id: "k2",
            moduleId: "cerebro-nino-explicado-padres",
            chapter: "Capítulo 2",
            concept: "límites",
            ageRange: "6-10",
            difficulty: 3,
            type: .mcq,
            prompt: "Tu hijo de 7 años se niega a hacer la tarea. ¿Cuál es la mejor estrategia?",
            options: [
                "Castigarlo sin videojuegos",
                "Explicarle por qué es importante y ofrecer ayuda",
                "Hacer la tarea por él",
                "Dejarlo que no la haga"
            ],
            correct: [1],
            branches: nil,
            explanation: "Los límites deben establecerse con conexión emocional. Explicar el 'por qué' ayuda al cerebro a entender la importancia.",
            chapterReference: "Capítulo 2: Límites con amor"
        ),
        
        EvalItem(
            id: "k3",
            moduleId: "cerebro-nino-explicado-padres",
            chapter: "Capítulo 3",
            concept: "validación",
            ageRange: "2-5",
            difficulty: 2,
            type: .multi,
            prompt: "Tu hijo está llorando porque se cayó. ¿Qué frases son VALIDADORAS? (Selecciona todas las correctas)",
            options: [
                "No es nada, no llores",
                "Veo que te duele mucho",
                "Los niños grandes no lloran",
                "Entiendo que te asustaste"
            ],
            correct: [1, 3],
            branches: nil,
            explanation: "Validar las emociones significa reconocer lo que siente el niño sin minimizar su experiencia.",
            chapterReference: "Capítulo 3: Validación emocional"
        ),
        
        EvalItem(
            id: "k4",
            moduleId: "cerebro-nino-explicado-padres",
            chapter: "Capítulo 4",
            concept: "rutinas",
            ageRange: "2-5",
            difficulty: 2,
            type: .mcq,
            prompt: "¿Por qué son importantes las rutinas para el cerebro del niño?",
            options: [
                "Porque les da estructura y seguridad",
                "Porque así aprenden más rápido",
                "Porque los padres se sienten mejor",
                "Porque es más fácil para los adultos"
            ],
            correct: [0],
            branches: nil,
            explanation: "Las rutinas crean predictibilidad, lo que reduce la ansiedad y permite al cerebro enfocarse en el aprendizaje.",
            chapterReference: "Capítulo 4: El poder de las rutinas"
        ),
        
        EvalItem(
            id: "k5",
            moduleId: "cerebro-nino-explicado-padres",
            chapter: "Capítulo 5",
            concept: "sueño",
            ageRange: "2-5",
            difficulty: 3,
            type: .mcq,
            prompt: "Tu hijo no quiere irse a dormir. ¿Cuál es la mejor estrategia?",
            options: [
                "Obligarlo a acostarse inmediatamente",
                "Crear una rutina relajante antes de dormir",
                "Dejarlo que se duerma cuando quiera",
                "Amenazarlo con castigos"
            ],
            correct: [1],
            branches: nil,
            explanation: "Una rutina de sueño relajante ayuda al cerebro a prepararse para el descanso y reduce la resistencia.",
            chapterReference: "Capítulo 5: El sueño y el desarrollo cerebral"
        )
    ])
    
    // Items de Habilidad (H) - Simulaciones Ramificadas Completas
    items.append(contentsOf: [
        EvalItem(
            id: "h1",
            moduleId: "cerebro-nino-explicado-padres",
            chapter: "Capítulo 4",
            concept: "co_regulacion",
            ageRange: "2-5",
            difficulty: 3,
            type: .branch,
            prompt: "Tu hijo de 3 años tiene una rabieta en el supermercado porque no le compras un dulce. ¿Qué haces?",
            options: nil,
            correct: nil,
            branches: [
                BranchNode(
                    optionText: "Le dices que se calme o se va a quedar sin postre",
                    nextId: "h1_feedback1",
                    weight: 0.2,
                    feedback: "Las amenazas aumentan la activación emocional. Recuerda: conexión antes que corrección."
                ),
                BranchNode(
                    optionText: "Te agachas a su altura, respiras y dices 'Veo que realmente querías ese dulce'",
                    nextId: "h1_feedback2",
                    weight: 0.9,
                    feedback: "¡Perfecto! Validaste su emoción y te autorregulaste. Esto enseña al niño a calmarse."
                ),
                BranchNode(
                    optionText: "Le compras el dulce para que se calme",
                    nextId: "h1_feedback3",
                    weight: 0.3,
                    feedback: "Aunque funciona a corto plazo, no enseña autorregulación. Es mejor la co-regulación."
                ),
                BranchNode(
                    optionText: "Lo sacas del supermercado inmediatamente",
                    nextId: "h1_feedback4",
                    weight: 0.6,
                    feedback: "Bueno para evitar la sobreestimulación, pero primero intenta la co-regulación."
                )
            ],
            explanation: "La co-regulación es fundamental para el desarrollo del cerebro emocional del niño.",
            chapterReference: "Capítulo 4: Conexión antes que corrección"
        ),
        
        EvalItem(
            id: "h2",
            moduleId: "cerebro-nino-explicado-padres",
            chapter: "Capítulo 6",
            concept: "límites_amorosos",
            ageRange: "6-10",
            difficulty: 4,
            type: .branch,
            prompt: "Tu hijo de 8 años se niega a apagar la tablet después de 2 horas. ¿Cómo manejas esta situación?",
            options: nil,
            correct: nil,
            branches: [
                BranchNode(
                    optionText: "Le quitas la tablet inmediatamente y la escondes",
                    nextId: "h2_feedback1",
                    weight: 0.4,
                    feedback: "Aunque establece el límite, puede crear resistencia. Es mejor darle opciones."
                ),
                BranchNode(
                    optionText: "Le dices 'Entiendo que es difícil parar algo divertido. Tienes 5 minutos más, luego la guardamos juntos'",
                    nextId: "h2_feedback2",
                    weight: 0.9,
                    feedback: "¡Excelente! Validaste su emoción, estableciste el límite y ofreciste colaboración."
                ),
                BranchNode(
                    optionText: "Le permites seguir jugando porque ya es tarde",
                    nextId: "h2_feedback3",
                    weight: 0.2,
                    feedback: "Los límites inconsistentes confunden al cerebro del niño. La consistencia es clave."
                ),
                BranchNode(
                    optionText: "Le gritas que apague la tablet ahora mismo",
                    nextId: "h2_feedback4",
                    weight: 0.3,
                    feedback: "El miedo no enseña autorregulación. Los límites con amor son más efectivos."
                )
            ],
            explanation: "Los límites con amor enseñan autorregulación sin dañar la conexión emocional.",
            chapterReference: "Capítulo 6: Límites que conectan"
        ),
        
        EvalItem(
            id: "h3",
            moduleId: "cerebro-nino-explicado-padres",
            chapter: "Capítulo 7",
            concept: "conflictos_hermanos",
            ageRange: "6-10",
            difficulty: 4,
            type: .branch,
            prompt: "Tus hijos de 6 y 8 años están peleando por un juguete. ¿Cómo intervienes?",
            options: nil,
            correct: nil,
            branches: [
                BranchNode(
                    optionText: "Le das el juguete al mayor porque es más responsable",
                    nextId: "h3_feedback1",
                    weight: 0.3,
                    feedback: "Esto puede crear resentimiento. Es mejor enseñarles a resolver juntos."
                ),
                BranchNode(
                    optionText: "Les dices 'Veo que ambos quieren el juguete. ¿Cómo podemos solucionarlo juntos?'",
                    nextId: "h3_feedback2",
                    weight: 0.9,
                    feedback: "¡Perfecto! Validaste ambas emociones y los involucraste en la solución."
                ),
                BranchNode(
                    optionText: "Les quitas el juguete a ambos",
                    nextId: "h3_feedback3",
                    weight: 0.4,
                    feedback: "Esto evita el conflicto pero no enseña resolución de problemas."
                ),
                BranchNode(
                    optionText: "Los dejas que se peleen hasta que se cansen",
                    nextId: "h3_feedback4",
                    weight: 0.2,
                    feedback: "Los conflictos no resueltos pueden escalar. La mediación es importante."
                )
            ],
            explanation: "Enseñar resolución de conflictos desarrolla habilidades sociales importantes.",
            chapterReference: "Capítulo 7: Hermanos y conflictos"
        )
    ])
    
    // Items de Consistencia (C) - Micro-Retos Prácticos Completos
    items.append(contentsOf: [
        EvalItem(
            id: "c1",
            moduleId: "cerebro-nino-explicado-padres",
            chapter: "Capítulo 5",
            concept: "respiración_volcán",
            ageRange: "2-5",
            difficulty: 1,
            type: .microReto,
            prompt: "Hoy practica la respiración del volcán con tu hijo: 'Inhalamos como si oliéramos una flor, exhalamos como si sopláramos una vela'",
            options: nil,
            correct: nil,
            branches: nil,
            explanation: "La respiración consciente fortalece las conexiones neuronales de autorregulación.",
            chapterReference: "Capítulo 5: Técnicas de respiración"
        ),
        
        EvalItem(
            id: "c2",
            moduleId: "cerebro-nino-explicado-padres",
            chapter: "Capítulo 6",
            concept: "validación_diaria",
            ageRange: "2-5",
            difficulty: 2,
            type: .microReto,
            prompt: "Hoy valida las emociones de tu hijo usando frases como 'Veo que te sientes...' al menos 3 veces",
            options: nil,
            correct: nil,
            branches: nil,
            explanation: "La validación emocional regular fortalece la conexión y el desarrollo emocional.",
            chapterReference: "Capítulo 6: Validación emocional"
        ),
        
        EvalItem(
            id: "c3",
            moduleId: "cerebro-nino-explicado-padres",
            chapter: "Capítulo 4",
            concept: "rutina_mañana",
            ageRange: "6-10",
            difficulty: 2,
            type: .microReto,
            prompt: "Hoy crea una rutina matutina con tu hijo: despertar, desayunar, prepararse, salir. Hazlo juntos paso a paso.",
            options: nil,
            correct: nil,
            branches: nil,
            explanation: "Las rutinas predecibles reducen el estrés y permiten al cerebro enfocarse en el aprendizaje.",
            chapterReference: "Capítulo 4: El poder de las rutinas"
        ),
        
        EvalItem(
            id: "c4",
            moduleId: "cerebro-nino-explicado-padres",
            chapter: "Capítulo 7",
            concept: "tiempo_calidad",
            ageRange: "2-5",
            difficulty: 1,
            type: .microReto,
            prompt: "Hoy dedica 15 minutos de tiempo exclusivo con tu hijo: juega, lee o simplemente conversa sin distracciones.",
            options: nil,
            correct: nil,
            branches: nil,
            explanation: "El tiempo de calidad fortalece la conexión emocional y el vínculo padre-hijo.",
            chapterReference: "Capítulo 7: Conexión emocional"
        ),
        
        EvalItem(
            id: "c5",
            moduleId: "cerebro-nino-explicado-padres",
            chapter: "Capítulo 8",
            concept: "límites_consistentes",
            ageRange: "6-10",
            difficulty: 3,
            type: .microReto,
            prompt: "Hoy mantén un límite que hayas establecido, aunque tu hijo proteste. Recuerda: límites con amor.",
            options: nil,
            correct: nil,
            branches: nil,
            explanation: "La consistencia en los límites enseña al cerebro a autorregularse y respetar las reglas.",
            chapterReference: "Capítulo 8: Límites consistentes"
        )
    ])
    
    // Items de Transferencia (T) - Transfer Test Completos
    items.append(contentsOf: [
        EvalItem(
            id: "t1",
            moduleId: "cerebro-nino-explicado-padres",
            chapter: "Capítulo 7",
            concept: "rabieta_hogar",
            ageRange: "2-5",
            difficulty: 3,
            type: .transfer,
            prompt: "¿Hubo alguna rabieta o berrinche con tu hijo hoy? ¿Qué técnica aplicaste y qué tan efectiva fue?",
            options: nil,
            correct: nil,
            branches: nil,
            explanation: "La transferencia al hogar es la prueba real de la efectividad de las estrategias aprendidas.",
            chapterReference: "Capítulo 7: Aplicación en casa"
        ),
        
        EvalItem(
            id: "t2",
            moduleId: "cerebro-nino-explicado-padres",
            chapter: "Capítulo 6",
            concept: "límites_aplicados",
            ageRange: "6-10",
            difficulty: 4,
            type: .transfer,
            prompt: "¿Tuviste que establecer algún límite hoy? ¿Cómo lo manejaste y qué resultado obtuviste?",
            options: nil,
            correct: nil,
            branches: nil,
            explanation: "Los límites con amor en situaciones reales desarrollan la autorregulación del niño.",
            chapterReference: "Capítulo 6: Límites en la práctica"
        ),
        
        EvalItem(
            id: "t3",
            moduleId: "cerebro-nino-explicado-padres",
            chapter: "Capítulo 5",
            concept: "técnicas_estrés",
            ageRange: "2-5",
            difficulty: 3,
            type: .transfer,
            prompt: "¿Tu hijo se sintió estresado o ansioso hoy? ¿Qué técnica de calma usaste y funcionó?",
            options: nil,
            correct: nil,
            branches: nil,
            explanation: "Las técnicas de autorregulación en momentos de estrés real son fundamentales para el desarrollo.",
            chapterReference: "Capítulo 5: Manejo del estrés"
        ),
        
        EvalItem(
            id: "t4",
            moduleId: "cerebro-nino-explicado-padres",
            chapter: "Capítulo 4",
            concept: "rutina_implementada",
            ageRange: "6-10",
            difficulty: 2,
            type: .transfer,
            prompt: "¿Lograste seguir alguna rutina establecida hoy? ¿Cómo se sintió tu hijo con la predictibilidad?",
            options: nil,
            correct: nil,
            branches: nil,
            explanation: "Las rutinas en la vida real crean seguridad y reducen la ansiedad del niño.",
            chapterReference: "Capítulo 4: Rutinas en acción"
        ),
        
        EvalItem(
            id: "t5",
            moduleId: "cerebro-nino-explicado-padres",
            chapter: "Capítulo 8",
            concept: "conflicto_resuelto",
            ageRange: "6-10",
            difficulty: 4,
            type: .transfer,
            prompt: "¿Hubo algún conflicto entre hermanos o con otros niños hoy? ¿Cómo lo manejaste y qué aprendieron?",
            options: nil,
            correct: nil,
            branches: nil,
            explanation: "Resolver conflictos reales enseña habilidades sociales importantes para toda la vida.",
            chapterReference: "Capítulo 8: Resolución de conflictos"
        )
    ])
    
    return items
}
