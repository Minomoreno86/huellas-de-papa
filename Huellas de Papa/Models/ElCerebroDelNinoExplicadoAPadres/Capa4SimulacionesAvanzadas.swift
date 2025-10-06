import Foundation

// MARK: - Modelos de Simulación Cerebral

struct BrainSim: Identifiable, Codable {
    let id: String
    let title: String
    let ageRange: ClosedRange<Int>
    let context: SimContext
    let nodes: [SimNode]
    let outcomes: [SimOutcome]
    let description: String
    let neuroScientificBasis: String
    let difficulty: Int // 1-5
    let estimatedDuration: Int // minutos
}

struct SimContext: Codable {
    let place: String
    let timeOfDay: String
    let childState: [String] // "cansado", "hambriento", "sobreestimulado"
    let parentStress: Int // 1-5
    let additionalFactors: [String] // "ruido", "prisa", "visitas"
}

struct SimNode: Identifiable, Codable {
    let id: String
    let prompt: String
    let options: [SimOption]
    let isStartNode: Bool
    let isEndNode: Bool
}

struct SimOption: Identifiable, Codable {
    let id: String
    let text: String
    let deltaCON: Int // -2 a +2
    let deltaREG: Int // -2 a +2
    let deltaLIM: Int // -2 a +2
    let nextNodeId: String?
    let feedback: String
    let neuroExplanation: String
    let chapterReference: String
}

struct SimOutcome: Identifiable, Codable {
    let id: String
    let threshold: Threshold
    let summary: String
    let transferTip: String
    let successLevel: SuccessLevel
    let brainStateDescription: String
}

struct Threshold: Codable {
    let con: Int
    let reg: Int
    let lim: Int
}

enum SuccessLevel: String, Codable, CaseIterable {
    case excellent = "excellent"
    case good = "good"
    case acceptable = "acceptable"
    case needsImprovement = "needs_improvement"
    
    var displayName: String {
        switch self {
        case .excellent: return "Excelente"
        case .good: return "Bueno"
        case .acceptable: return "Aceptable"
        case .needsImprovement: return "Necesita Mejora"
        }
    }
    
    var color: String {
        switch self {
        case .excellent: return "green"
        case .good: return "blue"
        case .acceptable: return "orange"
        case .needsImprovement: return "red"
        }
    }
}

// MARK: - Estado de Sesión de Simulación

struct SimSessionState: Codable {
    var currentCon: Int = 0
    var currentReg: Int = 0
    var currentLim: Int = 0
    var currentNodeId: String
    var completedNodes: [String] = []
    var totalScore: Double = 0.0
    var startTime: Date = Date()
    var difficulty: Int = 2
    var opcionSeleccionada: SimOption?
    
    var normalizedScore: Double {
        let score = 0.4 * Double(currentCon) + 0.35 * Double(currentReg) + 0.25 * Double(currentLim)
        return max(0, min(100, (score + 10) * 5))
    }
    
    var brainLevel: String {
        switch normalizedScore {
        case 80...100: return "Maestro Cerebral"
        case 60..<80: return "Regulador Experto"
        case 40..<60: return "Co-regulador"
        case 20..<40: return "Aprendiz"
        default: return "Principiante"
        }
    }
}

// MARK: - Resultado de Simulación

struct SimResult: Codable {
    let sessionId: String
    let brainSimId: String
    let finalScore: Double
    let outcome: SimOutcome
    let duration: TimeInterval
    let decisions: [SimDecision]
    let transferTip: String
    let completedAt: Date
}

struct SimDecision: Codable {
    let nodeId: String
    let optionId: String
    let con: Int
    let reg: Int
    let lim: Int
    let timestamp: Date
}

// MARK: - Contenido de Simulaciones

struct Capa4SimulacionesAvanzadas {
    static func contenidoCerebroDelNino() -> [BrainSim] {
        return [
            // Escena 1: Transición en Supermercado (2-5 años)
            BrainSim(
                id: "sim_transicion_supermercado",
                title: "Rabieta en el Supermercado",
                ageRange: 2...5,
                context: SimContext(
                    place: "Supermercado",
                    timeOfDay: "Tarde",
                    childState: ["cansado", "hambriento"],
                    parentStress: 3,
                    additionalFactors: ["ruido", "prisa"]
                ),
                nodes: [
                    SimNode(
                        id: "n1",
                        prompt: "Tu hijo de 3 años ve los dulces en la caja y grita: '¡Quiero chupetes!' Cuando le dices que no, empieza a llorar y patalear.",
                        options: [
                            SimOption(
                                id: "o1",
                                text: "\"¡Te dije que no! ¡Cállate ya!\"",
                                deltaCON: -2,
                                deltaREG: -2,
                                deltaLIM: 1,
                                nextNodeId: "n2",
                                feedback: "Reactividad: tu tono elevado activa más la amígdala del niño. Hay límite, pero sin conexión emocional.",
                                neuroExplanation: "El tono agresivo activa el sistema de amenaza del niño, aumentando cortisol y dificultando la autorregulación.",
                                chapterReference: "Capítulo 3: La amígdala y las emociones"
                            ),
                            SimOption(
                                id: "o2",
                                text: "\"No, no se compran dulces. Punto.\"",
                                deltaCON: 0,
                                deltaREG: 0,
                                deltaLIM: 2,
                                nextNodeId: "n2",
                                feedback: "Límite claro, pero falta co-regulación. El niño puede obedecer pero con tensión residual.",
                                neuroExplanation: "Sin validación emocional, el niño no aprende a autorregulares. El límite se cumple por miedo, no por comprensión.",
                                chapterReference: "Capítulo 4: Conexión antes que corrección"
                            ),
                            SimOption(
                                id: "o3",
                                text: "\"Veo que realmente quieres esos dulces. Es difícil cuando no podemos tener lo que queremos. Respiremos juntos... La regla es que compramos solo lo de la lista. ¿Te ayudo a elegir una fruta?\"",
                                deltaCON: 2,
                                deltaREG: 2,
                                deltaLIM: 2,
                                nextNodeId: "end_calm",
                                feedback: "¡Perfecto! Conexión→regulación→límite con alternativa. Integras hemisferios y reduces reactividad.",
                                neuroExplanation: "Validar la emoción activa la corteza prefrontal. La respiración conjunta regula el sistema nervioso. El límite claro con alternativa mantiene la estructura.",
                                chapterReference: "Capítulo 5: Técnicas de respiración y co-regulación"
                            ),
                            SimOption(
                                id: "o4",
                                text: "\"Bueno, solo uno si te calmas.\"",
                                deltaCON: 1,
                                deltaREG: 0,
                                deltaLIM: -2,
                                nextNodeId: "n2",
                                feedback: "Refuerzo intermitente: alivia la situación hoy, pero refuerza el comportamiento problemático para el futuro.",
                                neuroExplanation: "Ceder ante el berrinche enseña al niño que las rabietas funcionan, creando un patrón de comportamiento más fuerte.",
                                chapterReference: "Capítulo 6: Límites consistentes"
                            )
                        ],
                        isStartNode: true,
                        isEndNode: false
                    ),
                    SimNode(
                        id: "n2",
                        prompt: "Tu hijo arroja un producto al suelo y grita más fuerte. Otros clientes miran.",
                        options: [
                            SimOption(
                                id: "o2_1",
                                text: "\"¡Esto es inaceptable! Te vas castigado cuando lleguemos a casa.\"",
                                deltaCON: -1,
                                deltaREG: -1,
                                deltaLIM: 2,
                                nextNodeId: "end_tense",
                                feedback: "Límite claro, pero poca contención emocional. Queda tensión elevada y posible rebrote.",
                                neuroExplanation: "Las amenazas futuras no ayudan en el momento presente. El niño necesita regulación inmediata, no consecuencias posteriores.",
                                chapterReference: "Capítulo 7: Consecuencias inmediatas vs. futuras"
                            ),
                            SimOption(
                                id: "o2_2",
                                text: "\"No me gusta cuando se tiran cosas. Pongo esto aquí. Tu emoción es muy grande; respiremos juntos y seguimos con la regla de la lista.\"",
                                deltaCON: 2,
                                deltaREG: 2,
                                deltaLIM: 1,
                                nextNodeId: "end_calm",
                                feedback: "Excelente: nombras la conducta, proteges el vínculo y mantienes el marco. Co-regulación en acción.",
                                neuroExplanation: "Separar la conducta de la persona protege la autoestima. La co-regulación enseña al niño a calmarse con tu ayuda.",
                                chapterReference: "Capítulo 8: Separar conducta de persona"
                            )
                        ],
                        isStartNode: false,
                        isEndNode: false
                    )
                ],
                outcomes: [
                    SimOutcome(
                        id: "end_calm",
                        threshold: Threshold(con: 2, reg: 2, lim: 2),
                        summary: "Se calma en menos de 1 minuto y acepta la alternativa. Continúa la compra cooperativamente.",
                        transferTip: "Practica la frase 'Veo que...' + respiración 3 veces hoy en una situación real.",
                        successLevel: .excellent,
                        brainStateDescription: "Amígdala regulada, corteza prefrontal activa, conexión hemisférica establecida."
                    ),
                    SimOutcome(
                        id: "end_tense",
                        threshold: Threshold(con: -999, reg: -999, lim: -999),
                        summary: "Cumple el límite con tensión residual. Posible rebrote en situaciones similares.",
                        transferTip: "Prueba validar la emoción antes del límite la próxima vez: 'Veo tu frustración...'",
                        successLevel: .needsImprovement,
                        brainStateDescription: "Amígdala parcialmente regulada, sistema de amenaza activo, aprendizaje limitado."
                    )
                ],
                description: "Simulación de rabieta en supermercado para entrenar co-regulación y límites conectivos.",
                neuroScientificBasis: "Entrena la integración vertical (amígdala-corteza prefrontal) y horizontal (hemisferios) del cerebro del niño.",
                difficulty: 2,
                estimatedDuration: 3
            ),
            
            // Escena 2: Miedo Nocturno (4-6 años)
            BrainSim(
                id: "sim_miedo_nocturno",
                title: "Monstruos en la Noche",
                ageRange: 4...6,
                context: SimContext(
                    place: "Dormitorio",
                    timeOfDay: "Noche",
                    childState: ["cansado", "sobreestimulado"],
                    parentStress: 2,
                    additionalFactors: ["oscuridad"]
                ),
                nodes: [
                    SimNode(
                        id: "n1",
                        prompt: "Tu hijo de 4 años se despierta llorando: '¡Hay monstruos debajo de la cama! No quiero dormir aquí.'",
                        options: [
                            SimOption(
                                id: "o1",
                                text: "\"No hay monstruos, eso es tonto. Vuelve a dormir.\"",
                                deltaCON: -2,
                                deltaREG: -1,
                                deltaLIM: 1,
                                nextNodeId: "n2",
                                feedback: "Invalidación emocional: minimizas su miedo real, activando más su sistema de amenaza.",
                                neuroExplanation: "Los miedos son reales para el cerebro del niño. Invalidar activa la amígdala y dificulta el sueño.",
                                chapterReference: "Capítulo 2: Validación emocional"
                            ),
                            SimOption(
                                id: "o2",
                                text: "\"Los monstruos no existen. Te quedo aquí hasta que te duermas.\"",
                                deltaCON: 1,
                                deltaREG: 0,
                                deltaLIM: -1,
                                nextNodeId: "end_dependent",
                                feedback: "Conexión pero sin límite. Puede crear dependencia para dormir.",
                                neuroExplanation: "La presencia constante puede interferir con el desarrollo de la autorregulación del sueño.",
                                chapterReference: "Capítulo 9: Autonomía gradual"
                            ),
                            SimOption(
                                id: "o3",
                                text: "\"Veo que tienes mucho miedo. Tu cerebro está muy activo. Vamos a hacer la respiración del volcán juntos y luego revisamos que no hay monstruos.\"",
                                deltaCON: 2,
                                deltaREG: 2,
                                deltaLIM: 1,
                                nextNodeId: "end_calm",
                                feedback: "Perfecto: validas el miedo, ofreces co-regulación y mantienes límites. Enseñas autorregulación.",
                                neuroExplanation: "Validar + co-regulación + verificación lógica integra emociones y razón, calmando el sistema nervioso.",
                                chapterReference: "Capítulo 5: Técnicas de respiración"
                            )
                        ],
                        isStartNode: true,
                        isEndNode: false
                    ),
                    SimNode(
                        id: "n2",
                        prompt: "Tu hijo sigue llorando y dice: '¡Pero los veo! Están ahí abajo.'",
                        options: [
                            SimOption(
                                id: "o2_1",
                                text: "\"¡Basta! No hay monstruos. Duérmete ya.\"",
                                deltaCON: -2,
                                deltaREG: -2,
                                deltaLIM: 2,
                                nextNodeId: "end_tense",
                                feedback: "Frustración parental activa más el miedo del niño. Límite duro sin conexión.",
                                neuroExplanation: "La frustración del adulto se contagia al niño, aumentando su activación emocional.",
                                chapterReference: "Capítulo 4: Co-regulación parental"
                            ),
                            SimOption(
                                id: "o2_2",
                                text: "\"Tu miedo es muy real para ti. Vamos a revisar juntos y luego hacemos la respiración del volcán para calmar tu cerebro.\"",
                                deltaCON: 2,
                                deltaREG: 2,
                                deltaLIM: 1,
                                nextNodeId: "end_calm",
                                feedback: "Excelente manejo: respetas su realidad, ofreces verificación y co-regulación.",
                                neuroExplanation: "Respetar la realidad del niño + verificación + co-regulación integra sistemas emocionales y cognitivos.",
                                chapterReference: "Capítulo 3: Realidad emocional del niño"
                            )
                        ],
                        isStartNode: false,
                        isEndNode: false
                    )
                ],
                outcomes: [
                    SimOutcome(
                        id: "end_calm",
                        threshold: Threshold(con: 2, reg: 2, lim: 1),
                        summary: "Se calma con la respiración, acepta la verificación y se duerme en 10-15 minutos.",
                        transferTip: "Practica la respiración del volcán antes de dormir: 'Inhalamos como oliendo una flor, exhalamos como soplando una vela'.",
                        successLevel: .excellent,
                        brainStateDescription: "Sistema nervioso regulado, amígdala calmada, corteza prefrontal activa para el sueño."
                    ),
                    SimOutcome(
                        id: "end_tense",
                        threshold: Threshold(con: -999, reg: -999, lim: -999),
                        summary: "Sigue llorando, posible que no duerma bien. Tensión en la relación.",
                        transferTip: "En situaciones de miedo, primero valida: 'Tu miedo es real para ti' antes de ofrecer soluciones.",
                        successLevel: .needsImprovement,
                        brainStateDescription: "Sistema de amenaza activo, amígdala hiperactiva, dificultad para la autorregulación."
                    ),
                    SimOutcome(
                        id: "end_dependent",
                        threshold: Threshold(con: 1, reg: 0, lim: -1),
                        summary: "Se duerme con tu presencia, pero puede crear dependencia futura.",
                        transferTip: "Gradualmente reduce tu presencia: 'Te quedo 5 minutos, luego te reviso'.",
                        successLevel: .acceptable,
                        brainStateDescription: "Regulación dependiente, necesita apoyo externo para calmarse."
                    )
                ],
                description: "Simulación de miedo nocturno para entrenar validación emocional y co-regulación.",
                neuroScientificBasis: "Entrena la regulación del sistema nervioso autónomo y la integración emocional-cognitiva.",
                difficulty: 2,
                estimatedDuration: 4
            ),
            
            // Escena 3: Conflicto de Pantallas (9-12 años)
            BrainSim(
                id: "sim_tablet_conflicto",
                title: "Apagar la Tablet",
                ageRange: 9...12,
                context: SimContext(
                    place: "Sala",
                    timeOfDay: "Noche",
                    childState: ["cansado"],
                    parentStress: 3,
                    additionalFactors: ["hora_dormir"]
                ),
                nodes: [
                    SimNode(
                        id: "n1",
                        prompt: "Se cumple el tiempo acordado de 30 minutos. Apagas la tablet y tu hijo grita: '¡No! ¡Solo 5 minutos más!'",
                        options: [
                            SimOption(
                                id: "o1",
                                text: "\"¡Te dije que no! Dame eso ahora mismo.\"",
                                deltaCON: -2,
                                deltaREG: -2,
                                deltaLIM: 1,
                                nextNodeId: "n2",
                                feedback: "Reactividad: tu tono elevado activa más la amígdala del niño. Hay límite, pero sin conexión emocional.",
                                neuroExplanation: "El tono agresivo activa el sistema de amenaza, aumentando cortisol y dificultando la autorregulación.",
                                chapterReference: "Capítulo 3: La amígdala y las emociones"
                            ),
                            SimOption(
                                id: "o2",
                                text: "\"La regla es 30 minutos. Se acabó.\"",
                                deltaCON: 0,
                                deltaREG: 0,
                                deltaLIM: 2,
                                nextNodeId: "n2",
                                feedback: "Límite claro, pero falta co-regulación. El niño puede obedecer pero con tensión residual.",
                                neuroExplanation: "Sin validación emocional, el niño no aprende a autorregulares. El límite se cumple por imposición, no por comprensión.",
                                chapterReference: "Capítulo 4: Conexión antes que corrección"
                            ),
                            SimOption(
                                id: "o3",
                                text: "\"Veo que te enfada apagar ahora. Es difícil parar cuando estás entretenido. Respiremos 3 veces juntos... La regla es 30 minutos. ¿Prefieres leer o preparar algo para mañana?\"",
                                deltaCON: 2,
                                deltaREG: 2,
                                deltaLIM: 2,
                                nextNodeId: "end_calm",
                                feedback: "¡Perfecto! Conexión→regulación→límite con alternativa. Integras hemisferios y reduces reactividad.",
                                neuroExplanation: "Validar la emoción activa la corteza prefrontal. La respiración conjunta regula el sistema nervioso. El límite claro con alternativa mantiene la estructura.",
                                chapterReference: "Capítulo 5: Técnicas de respiración y co-regulación"
                            ),
                            SimOption(
                                id: "o4",
                                text: "\"Bueno, 5 minutos más si te calmas.\"",
                                deltaCON: 1,
                                deltaREG: 0,
                                deltaLIM: -2,
                                nextNodeId: "n2",
                                feedback: "Refuerzo intermitente: alivia la situación hoy, pero refuerza el comportamiento problemático para el futuro.",
                                neuroExplanation: "Ceder ante la presión enseña al niño que la insistencia funciona, creando un patrón de comportamiento más fuerte.",
                                chapterReference: "Capítulo 6: Límites consistentes"
                            )
                        ],
                        isStartNode: true,
                        isEndNode: false
                    ),
                    SimNode(
                        id: "n2",
                        prompt: "Tu hijo arroja el control al sofá y dice: '¡Eres injusto! Todos mis amigos pueden jugar más tiempo.'",
                        options: [
                            SimOption(
                                id: "o2_1",
                                text: "\"Esto es inaceptable. Castigado mañana sin pantallas.\"",
                                deltaCON: -1,
                                deltaREG: -1,
                                deltaLIM: 2,
                                nextNodeId: "end_tense",
                                feedback: "Límite claro, pero poca contención emocional. Queda tensión elevada y posible rebrote.",
                                neuroExplanation: "Las amenazas futuras no ayudan en el momento presente. El niño necesita regulación inmediata, no consecuencias posteriores.",
                                chapterReference: "Capítulo 7: Consecuencias inmediatas vs. futuras"
                            ),
                            SimOption(
                                id: "o2_2",
                                text: "\"No me gusta cuando vuelan cosas. Pongo el control aquí. Entiendo que te sientes injusto comparado con tus amigos. La regla en casa es 30 minutos. ¿Hablamos de cómo te sientes?\"",
                                deltaCON: 2,
                                deltaREG: 2,
                                deltaLIM: 1,
                                nextNodeId: "end_calm",
                                feedback: "Excelente: nombras la conducta, proteges el vínculo, validas la emoción y mantienes el marco. Co-regulación en acción.",
                                neuroExplanation: "Separar la conducta de la persona protege la autoestima. La co-regulación enseña al niño a calmarse con tu ayuda.",
                                chapterReference: "Capítulo 8: Separar conducta de persona"
                            )
                        ],
                        isStartNode: false,
                        isEndNode: false
                    )
                ],
                outcomes: [
                    SimOutcome(
                        id: "end_calm",
                        threshold: Threshold(con: 2, reg: 2, lim: 2),
                        summary: "Se calma en menos de 1 minuto y acepta la rutina de noche. Conversa sobre sus sentimientos.",
                        transferTip: "Practica la frase de validación + respiración 3 veces hoy: 'Veo que te sientes... respiremos juntos'.",
                        successLevel: .excellent,
                        brainStateDescription: "Amígdala regulada, corteza prefrontal activa, conexión hemisférica establecida, comunicación abierta."
                    ),
                    SimOutcome(
                        id: "end_tense",
                        threshold: Threshold(con: -999, reg: -999, lim: -999),
                        summary: "Cumple el límite con tensión residual. Posible rebrote en situaciones similares.",
                        transferTip: "Prueba validar la emoción antes del límite la próxima vez: 'Veo tu frustración...'",
                        successLevel: .needsImprovement,
                        brainStateDescription: "Amígdala parcialmente regulada, sistema de amenaza activo, aprendizaje limitado, comunicación cerrada."
                    )
                ],
                description: "Simulación de conflicto por pantallas para entrenar límites conectivos y comunicación emocional.",
                neuroScientificBasis: "Entrena la regulación emocional en preadolescentes y el establecimiento de límites respetuosos.",
                difficulty: 3,
                estimatedDuration: 4
            )
        ]
    }
}
