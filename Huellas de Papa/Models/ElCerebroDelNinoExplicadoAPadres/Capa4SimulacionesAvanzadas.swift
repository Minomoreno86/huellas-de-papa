import Foundation

// MARK: - Capa 4: Modelos de simulación (sin mock data)

/// Representa una simulación completa de la Capa 4.
/// No incluye contenido narrativo embebido; la app cargará escenas/opciones/outcomes desde almacenamiento.
public struct Capa4Simulation: Identifiable, Codable {
    /// Identificador único y estable de la simulación
    public let id: String
    /// Título visible (p.ej., "Rabieta por pantalla")
    public let title: String
    /// Rango de edad objetivo en años (inclusive)
    public let ageRangeLower: Int
    public let ageRangeUpper: Int
    /// Dificultad pedagógica (1–5)
    public let difficulty: Int
    /// Duración estimada en minutos
    public let estimatedDurationMinutes: Int
    /// Descripción breve orientada al objetivo de aprendizaje
    public let summary: String
    /// Principio neuropsicológico principal (Capas 1–2)
    public let neuroBasis: String
    /// Contexto situacional base
    public let context: Capa4SimulationContext
    /// Escena inicial
    public let startSceneId: String
    /// Identificadores de escenas pertenecientes a la simulación
    public let sceneIds: [String]
}

/// Contexto situacional de la simulación (impacta tono y UI)
public struct Capa4SimulationContext: Codable {
    /// Lugar principal (p.ej., "Supermercado", "Dormitorio")
    public let place: String
    /// Momento del día (p.ej., "Mañana", "Tarde", "Noche")
    public let timeOfDay: String
    /// Estado del niño relevante (p.ej., ["cansado", "hambriento"]).
    public let childStates: [String]
    /// Nivel de estrés del adulto (1–5)
    public let parentStressLevel: Int
    /// Factores adicionales (p.ej., ["ruido", "prisa"]).
    public let additionalFactors: [String]
}

/// Nodo de historia: una escena con opciones disponibles
public struct Capa4Scene: Identifiable, Codable {
    /// Identificador estable de la escena
    public let id: String
    /// Texto que presenta la situación y detonante emocional
    public let prompt: String
    /// Opciones de respuesta del adulto
    public let options: [Capa4Option]
    /// Indica si la escena es terminal (no hay ramificación)
    public let isTerminal: Bool
}

/// Opción de respuesta del adulto
public struct Capa4Option: Identifiable, Codable {
    /// Identificador de la opción
    public let id: String
    /// Texto visible de la respuesta (incluye claves de Capa 3)
    public let text: String
    /// Impacto en métricas pedagógicas (puede ser negativo/positivo)
    public let deltaConnection: Int
    public let deltaRegulation: Int
    public let deltaLimit: Int
    /// Siguiente escena si existe; nil indica cierre por outcome
    public let nextSceneId: String?
    /// Feedback breve e inmediato tras seleccionar
    public let quickFeedback: String
    /// Explicación neuropsicológica del impacto
    public let neuroExplanation: String
    /// Referencia a herramienta Capa 3 o principio Capa 2
    public let toolReference: String
    /// Outcome final si no hay `nextSceneId`
    public let outcomeId: String?
}

/// Resultado final de una simulación o subtrayecto
public struct Capa4Outcome: Identifiable, Codable {
    /// Identificador del resultado
    public let id: String
    /// Umbrales mínimos requeridos para mapear a este resultado
    public let threshold: Capa4Threshold
    /// Resumen narrativo del desenlace
    public let summary: String
    /// Recomendación de transferencia al día a día
    public let transferTip: String
    /// Nivel de logro pedagógico
    public let successLevel: Capa4SuccessLevel
    /// Descripción del estado cerebral/psicológico alcanzado
    public let brainStateDescription: String
    /// IDs de herramientas de Capa 3 recomendadas para este resultado
    public let recommendedTools: [String]
    /// Guía específica para aplicar las herramientas recomendadas
    public let specificGuidance: String
}

/// Umbrales de decisión del resultado
public struct Capa4Threshold: Codable {
    public let connection: Int
    public let regulation: Int
    public let limit: Int
}

/// Niveles de éxito pedagógico
public enum Capa4SuccessLevel: String, Codable, CaseIterable {
    case excellent
    case good
    case acceptable
    case needsImprovement
}

/// Feedback explicativo para reflexión posterior a la decisión
public struct Capa4Feedback: Identifiable, Codable {
    /// Identificador del feedback
    public let id: String
    /// Mensaje breve inmediato (UI: micro-mensaje con color)
    public let shortText: String
    /// Explicación ampliada con claves neuropsicológicas
    public let detailedExplanation: String
    /// Sugerencia de práctica futura
    public let practiceSuggestion: String
}

/// Métrica de progreso de una sesión (runtime)
public struct Capa4ProgressMetrics: Codable {
    /// Conexión: calidad del vínculo/validación emocional
    public var connectionScore: Int
    /// Regulación: grado de regulación emocional promovida
    public var regulationScore: Int
    /// Límite: claridad/consistencia del marco
    public var limitScore: Int
    /// Escena actual
    public var currentSceneId: String
    /// Trazabilidad de decisiones tomadas
    public var decisions: [Capa4Decision]
}

/// Registro de una decisión en una escena concreta
public struct Capa4Decision: Codable {
    public let sceneId: String
    public let optionId: String
    public let deltaConnection: Int
    public let deltaRegulation: Int
    public let deltaLimit: Int
    public let timestamp: Date
}

// MARK: - Datos reales de simulaciones (Framework Bilbao)

/// Datos pedagógicos reales para las simulaciones de Capa 4
/// Basados en principios neuropsicológicos y herramientas prácticas de Álvaro Bilbao
public struct Capa4SimulationData {
    
    // MARK: - Simulación 1: Rabieta por pantalla
    
    static let rabietaPantalla = Capa4Simulation(
        id: "rabieta_pantalla",
        title: "Rabieta por pantalla",
        ageRangeLower: 3,
        ageRangeUpper: 8,
        difficulty: 2,
        estimatedDurationMinutes: 8,
        summary: "Manejo de rabietas cuando el niño no quiere apagar la pantalla",
        neuroBasis: "Corteza prefrontal en desarrollo vs. sistema límbico activado",
        context: Capa4SimulationContext(
            place: "Salón de casa",
                    timeOfDay: "Tarde",
            childStates: ["entretenido", "resistiendo"],
            parentStressLevel: 3,
            additionalFactors: ["hora de cenar", "rutina nocturna"]
        ),
        startSceneId: "pantalla_inicial",
        sceneIds: ["pantalla_inicial", "pantalla_escalada", "pantalla_final"]
    )
    
    static let escenaPantallaInicial = Capa4Scene(
        id: "pantalla_inicial",
        prompt: "Es la hora de cenar y tu hijo de 5 años lleva 45 minutos viendo dibujos animados. Le dices que es momento de apagar la tablet. Él responde con un '¡No quiero!' y continúa mirando la pantalla. Su cuerpo se tensa y puedes ver que está preparándose para resistir.",
                        options: [
            Capa4Option(
                id: "pantalla_imponer",
                text: "Apago la tablet directamente sin más explicaciones",
                deltaConnection: -2,
                deltaRegulation: -1,
                deltaLimit: 1,
                nextSceneId: "pantalla_escalada",
                quickFeedback: "Puede generar resistencia emocional",
                neuroExplanation: "El corte prefrontal del niño no está preparado para transiciones bruscas. Su sistema límbico se activa ante la pérdida de control.",
                toolReference: "Pausa del adulto - Capa 3",
                outcomeId: nil
            ),
            Capa4Option(
                id: "pantalla_negociar",
                text: "Le ofrezco 5 minutos más si promete apagarla después",
                deltaConnection: 0,
                deltaRegulation: 1,
                deltaLimit: -1,
                nextSceneId: "pantalla_final",
                quickFeedback: "Negociación que puede funcionar",
                neuroExplanation: "La negociación activa la corteza prefrontal del niño, pero puede crear expectativas de negociación constante.",
                toolReference: "Límites claros - Capa 2",
                outcomeId: nil
            ),
            Capa4Option(
                id: "pantalla_conectar",
                text: "Me acerco, le toco el hombro suavemente y digo: 'Veo que te gusta mucho este programa'",
                deltaConnection: 3,
                deltaRegulation: 2,
                deltaLimit: 0,
                nextSceneId: "pantalla_final",
                quickFeedback: "Conexión emocional establecida",
                neuroExplanation: "La validación emocional activa el sistema de apego y prepara al cerebro para la transición. La oxitocina facilita la cooperación.",
                toolReference: "Conecta antes de corregir - Capa 3",
                outcomeId: nil
            ),
            Capa4Option(
                id: "pantalla_distraer",
                text: "Le digo que vamos a hacer algo más divertido después de cenar",
                deltaConnection: 1,
                deltaRegulation: 1,
                deltaLimit: -1,
                nextSceneId: "pantalla_final",
                quickFeedback: "Redirección positiva",
                neuroExplanation: "La anticipación positiva activa el sistema de recompensa, facilitando la transición sin conflicto.",
                toolReference: "Reencuadre positivo - Capa 3",
                outcomeId: nil
            )
        ],
        isTerminal: false
    )
    
    static let escenaPantallaEscalada = Capa4Scene(
        id: "pantalla_escalada",
        prompt: "Tu hijo ha comenzado a llorar y gritar. Se tira al suelo y patalea. '¡No quiero cenar! ¡Quiero seguir viendo!' Sus gritos se escuchan en toda la casa. Tienes que mantener la calma mientras él está completamente desregulado.",
                        options: [
            Capa4Option(
                id: "pantalla_ignorar",
                text: "Lo ignoro completamente hasta que se calme",
                deltaConnection: -3,
                deltaRegulation: 0,
                deltaLimit: 1,
                nextSceneId: nil,
                quickFeedback: "Ignorar puede aumentar la desregulación",
                neuroExplanation: "El niño en desregulación necesita conexión, no abandono. Su sistema nervioso requiere co-regulación.",
                toolReference: "Presencia calmante - Capa 3",
                outcomeId: "pantalla_outcome_ignorado"
            ),
            Capa4Option(
                id: "pantalla_amenazar",
                text: "Le digo que si no se calma, no habrá postre ni juego después",
                deltaConnection: -2,
                deltaRegulation: -1,
                deltaLimit: 2,
                nextSceneId: nil,
                quickFeedback: "Las amenazas aumentan la desregulación",
                neuroExplanation: "Las amenazas activan el sistema de lucha/huida, aumentando el cortisol y dificultando la regulación emocional.",
                toolReference: "Consecuencias naturales vs. castigos - Capa 2",
                outcomeId: "pantalla_outcome_amenaza"
            ),
            Capa4Option(
                id: "pantalla_nombrar",
                text: "Me agacho a su altura y digo: 'Veo que estás muy enfadado. Es difícil dejar algo que te gusta'",
                deltaConnection: 3,
                deltaRegulation: 2,
                deltaLimit: 1,
                nextSceneId: nil,
                quickFeedback: "Validación emocional efectiva",
                neuroExplanation: "Nombrar la emoción activa la corteza prefrontal y reduce la activación del sistema límbico. La empatía libera oxitocina.",
                toolReference: "Nombrar la emoción - Capa 3",
                outcomeId: "pantalla_outcome_exitoso"
            ),
            Capa4Option(
                id: "pantalla_abrazar",
                text: "Me siento cerca y le ofrezco un abrazo sin forzar",
                deltaConnection: 4,
                deltaRegulation: 3,
                deltaLimit: 0,
                nextSceneId: nil,
                quickFeedback: "Contacto físico regulador",
                neuroExplanation: "El contacto físico libera oxitocina y endorfinas, activando el sistema de calma y facilitando la co-regulación.",
                toolReference: "Co-regulación táctil - Capa 3",
                outcomeId: "pantalla_outcome_exitoso"
            )
        ],
        isTerminal: false
    )
    
    // MARK: - Simulación 2: Miedo nocturno
    
    static let miedoNocturno = Capa4Simulation(
        id: "miedo_nocturno",
        title: "Miedo nocturno",
        ageRangeLower: 4,
        ageRangeUpper: 9,
        difficulty: 3,
        estimatedDurationMinutes: 10,
        summary: "Manejo de miedos nocturnos y rituales de sueño",
        neuroBasis: "Sistema límbico activado en ausencia de luz diurna",
        context: Capa4SimulationContext(
                    place: "Dormitorio",
                    timeOfDay: "Noche",
            childStates: ["ansioso", "asustado"],
            parentStressLevel: 4,
            additionalFactors: ["oscuridad", "silencio", "rutina de sueño"]
        ),
        startSceneId: "miedo_inicial",
        sceneIds: ["miedo_inicial", "miedo_persistente", "miedo_final"]
    )
    
    static let escenaMiedoInicial = Capa4Scene(
        id: "miedo_inicial",
        prompt: "Son las 10 PM y tu hijo de 6 años llama desde su habitación. Cuando entras, está sentado en la cama con los ojos muy abiertos. 'Mamá, hay un monstruo debajo de la cama' dice con voz temblorosa. Sus manos agarran fuertemente la sábana.",
                        options: [
            Capa4Option(
                id: "miedo_racionalizar",
                text: "Le explico que los monstruos no existen y que es solo su imaginación",
                deltaConnection: -1,
                deltaRegulation: -1,
                deltaLimit: 0,
                nextSceneId: "miedo_persistente",
                quickFeedback: "La lógica no calma las emociones",
                neuroExplanation: "El miedo activa el sistema límbico, que no responde a argumentos racionales. La corteza prefrontal está desactivada.",
                toolReference: "Validación emocional vs. racionalización - Capa 2",
                outcomeId: nil
            ),
            Capa4Option(
                id: "miedo_verificar",
                text: "Reviso debajo de la cama con él para mostrarle que no hay nada",
                deltaConnection: 2,
                deltaRegulation: 1,
                deltaLimit: 0,
                nextSceneId: "miedo_final",
                quickFeedback: "Validación del miedo del niño",
                neuroExplanation: "Verificar juntos activa el sistema de apego y proporciona seguridad. El niño se siente protegido y escuchado.",
                toolReference: "Ritual de seguridad - Capa 3",
                outcomeId: nil
            ),
            Capa4Option(
                id: "miedo_ritual",
                text: "Le propongo crear un 'spray anti-monstruos' con agua y unas gotas de colonia",
                deltaConnection: 3,
                deltaRegulation: 3,
                deltaLimit: 0,
                nextSceneId: "miedo_final",
                quickFeedback: "Ritual de protección efectivo",
                neuroExplanation: "Los rituales proporcionan sensación de control y seguridad. Activan el sistema de calma y facilitan la transición al sueño.",
                toolReference: "Ritual de cierre del día - Capa 3",
                outcomeId: nil
            ),
            Capa4Option(
                id: "miedo_compania",
                text: "Le digo que me quedaré con él hasta que se duerma",
                deltaConnection: 2,
                deltaRegulation: 2,
                deltaLimit: -1,
                nextSceneId: "miedo_final",
                quickFeedback: "Presencia tranquilizadora",
                neuroExplanation: "La presencia del cuidador activa el sistema de apego y libera oxitocina, proporcionando seguridad emocional.",
                toolReference: "Presencia calmante - Capa 3",
                outcomeId: nil
            )
        ],
        isTerminal: false
    )
    
    // MARK: - Simulación 3: Deberes frustrantes
    
    static let deberesFrustrantes = Capa4Simulation(
        id: "deberes_frustrantes",
        title: "Deberes frustrantes",
        ageRangeLower: 6,
        ageRangeUpper: 12,
        difficulty: 3,
        estimatedDurationMinutes: 12,
        summary: "Manejo de frustración durante tareas escolares",
        neuroBasis: "Corteza prefrontal en desarrollo vs. demandas cognitivas",
        context: Capa4SimulationContext(
            place: "Mesa de estudio",
            timeOfDay: "Tarde",
            childStates: ["frustrado", "cansado"],
            parentStressLevel: 4,
            additionalFactors: ["tarea difícil", "presión de tiempo", "fatiga mental"]
        ),
        startSceneId: "deberes_inicial",
        sceneIds: ["deberes_inicial", "deberes_escalada", "deberes_final"]
    )
    
    static let escenaDeberesInicial = Capa4Scene(
        id: "deberes_inicial",
        prompt: "Tu hijo de 8 años lleva 30 minutos intentando resolver un problema de matemáticas. Se frota los ojos, suspira constantemente y cada vez que intenta escribir algo, lo borra inmediatamente. 'No puedo hacerlo' dice con voz de frustración. Su lápiz está roto por la presión que ejerce al escribir.",
                        options: [
            Capa4Option(
                id: "deberes_presionar",
                text: "Le digo que debe concentrarse más y que otros niños de su edad ya lo han hecho",
                deltaConnection: -2,
                deltaRegulation: -2,
                deltaLimit: 1,
                nextSceneId: "deberes_escalada",
                quickFeedback: "La presión aumenta la frustración",
                neuroExplanation: "La comparación y presión activan el sistema de estrés, liberando cortisol que bloquea el aprendizaje y la memoria.",
                toolReference: "Presión vs. motivación - Capa 2",
                outcomeId: nil
            ),
            Capa4Option(
                id: "deberes_ayudar",
                text: "Me siento junto a él y le explico el problema paso a paso",
                deltaConnection: 2,
                deltaRegulation: 1,
                deltaLimit: -1,
                nextSceneId: "deberes_final",
                quickFeedback: "Apoyo directo y cercano",
                neuroExplanation: "La presencia del cuidador reduce el cortisol y activa el sistema de calma, facilitando el aprendizaje.",
                toolReference: "Conecta antes de corregir - Capa 3",
                outcomeId: nil
            ),
            Capa4Option(
                id: "deberes_pausa",
                text: "Le propongo hacer una pausa de 5 minutos para estirar y respirar",
                deltaConnection: 3,
                deltaRegulation: 3,
                deltaLimit: 0,
                nextSceneId: "deberes_final",
                quickFeedback: "Pausa reguladora efectiva",
                neuroExplanation: "Las pausas permiten que el cerebro se recupere del estrés cognitivo y restablezca la atención sostenida.",
                toolReference: "Pausa del adulto - Capa 3",
                outcomeId: nil
            ),
            Capa4Option(
                id: "deberes_empoderar",
                text: "Le digo: 'Veo que estás muy frustrado. Las matemáticas pueden ser difíciles. ¿Qué parte te parece más complicada?'",
                deltaConnection: 4,
                deltaRegulation: 2,
                deltaLimit: 1,
                nextSceneId: "deberes_final",
                quickFeedback: "Validación y empoderamiento",
                neuroExplanation: "La validación emocional reduce la activación del sistema límbico y facilita el acceso a la corteza prefrontal para el aprendizaje.",
                toolReference: "Empatía antes de enseñar - Capa 3",
                outcomeId: nil
            )
        ],
        isTerminal: false
    )
    
    // MARK: - Simulación 4: Mentira defensiva
    
    static let mentiraDefensiva = Capa4Simulation(
        id: "mentira_defensiva",
        title: "Mentira defensiva",
        ageRangeLower: 5,
        ageRangeUpper: 10,
        difficulty: 4,
        estimatedDurationMinutes: 10,
        summary: "Manejo de mentiras cuando el niño intenta evitar consecuencias",
        neuroBasis: "Corteza prefrontal vs. sistema de recompensa y evitación",
        context: Capa4SimulationContext(
            place: "Cocina",
            timeOfDay: "Tarde",
            childStates: ["nervioso", "evasivo"],
            parentStressLevel: 3,
            additionalFactors: ["evidencia clara", "temor al castigo", "culpa"]
        ),
        startSceneId: "mentira_inicial",
        sceneIds: ["mentira_inicial", "mentira_persistencia", "mentira_final"]
    )
    
    static let escenaMentiraInicial = Capa4Scene(
        id: "mentira_inicial",
        prompt: "Encuentras migas de galletas en el suelo de la cocina y el paquete abierto en la mesa. Tu hijo de 7 años está cerca, con restos de galletas en su camiseta. Cuando le preguntas quién comió las galletas que estaban guardadas para el postre, él mira hacia otro lado y dice: 'No fui yo, debe haber sido el gato'.",
        options: [
            Capa4Option(
                id: "mentira_confrontar",
                text: "Le muestro las evidencias y le digo que sé que está mintiendo",
                deltaConnection: -1,
                deltaRegulation: -1,
                deltaLimit: 2,
                nextSceneId: "mentira_persistencia",
                quickFeedback: "La confrontación puede aumentar la mentira",
                neuroExplanation: "La confrontación directa activa el sistema de defensa, aumentando la necesidad de protegerse con más mentiras.",
                toolReference: "Evitar confrontación directa - Capa 2",
                outcomeId: nil
            ),
            Capa4Option(
                id: "mentira_castigar",
                text: "Le digo que por mentir no habrá postre durante una semana",
                deltaConnection: -2,
                deltaRegulation: -2,
                deltaLimit: 3,
                nextSceneId: "mentira_persistencia",
                quickFeedback: "Los castigos por mentir aumentan la mentira",
                neuroExplanation: "Los castigos severos por mentir crean más miedo al castigo, incentivando mentiras más elaboradas para evitarlo.",
                toolReference: "Consecuencias vs. castigos - Capa 2",
                outcomeId: nil
            ),
            Capa4Option(
                id: "mentira_empatia",
                text: "Le digo: 'Entiendo que a veces es difícil decir la verdad cuando sabemos que hicimos algo incorrecto'",
                deltaConnection: 3,
                deltaRegulation: 2,
                deltaLimit: 1,
                nextSceneId: "mentira_final",
                quickFeedback: "Empatía que facilita la honestidad",
                neuroExplanation: "La empatía reduce la activación del sistema de defensa y facilita el acceso a la corteza prefrontal para la honestidad.",
                toolReference: "Empatía antes de enseñar - Capa 3",
                outcomeId: nil
            ),
            Capa4Option(
                id: "mentira_oportunidad",
                text: "Le doy una oportunidad: 'Puedo ver que las galletas están abiertas. ¿Te gustaría contarme qué pasó?'",
                deltaConnection: 2,
                deltaRegulation: 1,
                deltaLimit: 2,
                nextSceneId: "mentira_final",
                quickFeedback: "Oportunidad de redención",
                neuroExplanation: "Dar una oportunidad de explicar activa el sistema de recompensa por la honestidad, facilitando la confesión.",
                toolReference: "Oportunidades de reparación - Capa 3",
                outcomeId: nil
            )
        ],
        isTerminal: false
    )
    
    // MARK: - Simulación 5: Pelea entre hermanos
    
    static let peleaHermanos = Capa4Simulation(
        id: "pelea_hermanos",
        title: "Pelea entre hermanos",
        ageRangeLower: 4,
        ageRangeUpper: 12,
        difficulty: 4,
        estimatedDurationMinutes: 12,
        summary: "Manejo de conflictos entre hermanos y rivalidad",
        neuroBasis: "Sistema límbico activado vs. capacidad de regulación emocional",
        context: Capa4SimulationContext(
            place: "Salón de juegos",
            timeOfDay: "Tarde",
            childStates: ["enfadados", "competitivos"],
            parentStressLevel: 5,
            additionalFactors: ["juego compartido", "celos", "fatiga"]
        ),
        startSceneId: "pelea_inicial",
        sceneIds: ["pelea_inicial", "pelea_escalada", "pelea_final"]
    )
    
    static let escenaPeleaInicial = Capa4Scene(
        id: "pelea_inicial",
        prompt: "Tu hijo de 6 años y tu hija de 8 años están jugando con los bloques de construcción. De repente, tu hijo grita '¡Es mío!' y arrebata una pieza de las manos de su hermana. Ella responde empujándolo y diciendo '¡No es justo!'. Ambos están rojos de ira y parece que va a escalar.",
                        options: [
            Capa4Option(
                id: "pelea_culpar",
                text: "Le digo al mayor que debe compartir y ser más paciente con su hermano",
                deltaConnection: -2,
                deltaRegulation: -1,
                deltaLimit: 1,
                nextSceneId: "pelea_escalada",
                quickFeedback: "Culpar a uno aumenta la rivalidad",
                neuroExplanation: "Culpar a uno de los hermanos activa el sistema de injusticia percibida y aumenta la competencia entre ellos.",
                toolReference: "Evitar culpar - Capa 2",
                outcomeId: nil
            ),
            Capa4Option(
                id: "pelea_castigar",
                text: "Los castigo a ambos sin pantalla por una semana",
                deltaConnection: -3,
                deltaRegulation: -2,
                deltaLimit: 3,
                nextSceneId: "pelea_escalada",
                quickFeedback: "Los castigos aumentan la rivalidad",
                neuroExplanation: "Los castigos conjuntos crean una alianza contra el adulto y no resuelven el conflicto subyacente.",
                toolReference: "Consecuencias naturales vs. castigos - Capa 2",
                outcomeId: nil
            ),
            Capa4Option(
                id: "pelea_nombrar",
                text: "Les digo: 'Veo que ambos están muy enfadados. Es difícil cuando no podemos tener lo que queremos'",
                deltaConnection: 3,
                deltaRegulation: 2,
                deltaLimit: 1,
                nextSceneId: "pelea_final",
                quickFeedback: "Validación de ambas emociones",
                neuroExplanation: "Nombrar las emociones de ambos reduce la activación del sistema límbico y facilita la regulación conjunta.",
                toolReference: "Nombrar la emoción + reencuadre - Capa 3",
                outcomeId: nil
            ),
            Capa4Option(
                id: "pelea_reencuadrar",
                text: "Les propongo: 'Parece que ambos queréis lo mismo. ¿Qué podemos hacer para que ambos os sintáis contentos?'",
                deltaConnection: 2,
                deltaRegulation: 3,
                deltaLimit: 2,
                nextSceneId: "pelea_final",
                quickFeedback: "Reencuadre hacia solución conjunta",
                neuroExplanation: "El reencuadre activa la corteza prefrontal de ambos, facilitando el pensamiento colaborativo y la resolución de conflictos.",
                toolReference: "Reencuadre positivo - Capa 3",
                outcomeId: nil
            )
        ],
        isTerminal: false
    )
    
    // MARK: - Outcomes y resultados
    
    static let outcomes = [
        // Outcomes para rabieta pantalla
        Capa4Outcome(
            id: "pantalla_outcome_exitoso",
            threshold: Capa4Threshold(connection: 6, regulation: 4, limit: 1),
            summary: "Has logrado una transición suave manteniendo la conexión emocional y facilitando la regulación del niño.",
            transferTip: "En casa, usa la validación emocional antes de establecer límites. Di 'Veo que te gusta...' antes de 'Es hora de...'",
                        successLevel: .excellent,
            brainStateDescription: "El niño se siente comprendido y respetado, su sistema nervioso está regulado y listo para cooperar.",
            recommendedTools: ["name_it_to_tame_it", "ritual_conexion"],
            specificGuidance: "Para mantener este nivel de éxito, practica regularmente la herramienta 'Name it to tame it' para validar emociones antes de establecer límites. Usa 'El Ritual de Conexión' diariamente para fortalecer el vínculo y prevenir futuras crisis."
        ),
        
        Capa4Outcome(
            id: "pantalla_outcome_ignorado",
            threshold: Capa4Threshold(connection: -3, regulation: 0, limit: 1),
            summary: "El límite se mantuvo pero a costa de la conexión emocional. El niño puede sentirse abandonado en su desregulación.",
            transferTip: "Practica la presencia calmante: quédate cerca cuando el niño esté desregulado, aunque no interactúes directamente.",
            successLevel: .needsImprovement,
            brainStateDescription: "El niño puede desarrollar patrones de apego inseguro si se siente regularmente abandonado en momentos de angustia.",
            recommendedTools: ["ritual_conexion", "pausa_adulto"],
            specificGuidance: "Necesitas fortalecer la conexión emocional. Implementa 'El Ritual de Conexión' diariamente para reconstruir el vínculo. Practica 'La Pausa del Adulto' para mantener la calma y responder con empatía en lugar de retirarte emocionalmente."
        ),
        
        Capa4Outcome(
            id: "pantalla_outcome_amenaza",
            threshold: Capa4Threshold(connection: -2, regulation: -1, limit: 2),
            summary: "Las amenazas pueden funcionar a corto plazo pero dañan la relación y aumentan la desregulación emocional.",
            transferTip: "Reemplaza las amenazas con consecuencias naturales. En lugar de 'Si no... entonces...', usa 'Cuando... entonces...'",
                        successLevel: .needsImprovement,
            brainStateDescription: "Las amenazas activan el sistema de estrés, aumentando el cortisol y dificultando el aprendizaje y la regulación.",
            recommendedTools: ["pausa_adulto", "name_it_to_tame_it"],
            specificGuidance: "Es crucial que cambies este patrón. Practica 'La Pausa del Adulto' antes de responder con amenazas. Usa 'Name it to tame it' para conectar con las emociones del niño antes de establecer límites. Esto reducirá la necesidad de usar amenazas."
        )
    ]
    
    // MARK: - Datos completos para la app
    
    static let todasLasSimulaciones = [
        rabietaPantalla,
        miedoNocturno,
        deberesFrustrantes,
        mentiraDefensiva,
        peleaHermanos
    ]
    
    static let todasLasEscenas = [
        escenaPantallaInicial,
        escenaPantallaEscalada,
        escenaMiedoInicial,
        escenaDeberesInicial,
        escenaMentiraInicial,
        escenaPeleaInicial
    ]
    
    static let todosLosOutcomes = outcomes
    
    // MARK: - Métodos de acceso para la UI
    
    /// Obtiene una simulación por ID
    static func simulacion(por id: String) -> Capa4Simulation? {
        return todasLasSimulaciones.first { $0.id == id }
    }
    
    /// Obtiene una escena por ID
    static func escena(por id: String) -> Capa4Scene? {
        return todasLasEscenas.first { $0.id == id }
    }
    
    /// Obtiene un outcome por ID
    static func outcome(por id: String) -> Capa4Outcome? {
        return todosLosOutcomes.first { $0.id == id }
    }
    
    /// Obtiene simulaciones por rango de edad
    static func simulaciones(para edad: Int) -> [Capa4Simulation] {
        return todasLasSimulaciones.filter { 
            edad >= $0.ageRangeLower && edad <= $0.ageRangeUpper 
        }
    }
    
    /// Obtiene simulaciones por nivel de dificultad
    static func simulaciones(dificultad: Int) -> [Capa4Simulation] {
        return todasLasSimulaciones.filter { $0.difficulty == dificultad }
    }
    
    // MARK: - Mapeo de herramientas Capa 3
    
    /// Mapeo de IDs de herramientas a información básica para mostrar en Capa 4
    static let herramientasCapa3: [String: (nombre: String, icono: String, descripcion: String)] = [
        "name_it_to_tame_it": (
            nombre: "Name it to tame it",
            icono: "heart.text.square",
            descripcion: "Ayuda al niño a nombrar y regular sus emociones intensas"
        ),
        "respiracion_semaforo": (
            nombre: "Respiración del Semáforo",
            icono: "trafficlight",
            descripcion: "Técnica de respiración estructurada para regular emociones"
        ),
        "pausa_adulto": (
            nombre: "La Pausa del Adulto",
            icono: "pause.circle.fill",
            descripcion: "Enseña al adulto a regularse antes de responder"
        ),
        "ritual_conexion": (
            nombre: "El Ritual de Conexión",
            icono: "heart.circle.fill",
            descripcion: "Momento diario de conexión emocional profunda"
        )
    ]
    
    /// Obtiene información de una herramienta de Capa 3 por su ID
    static func herramientaCapa3(por id: String) -> (nombre: String, icono: String, descripcion: String)? {
        return herramientasCapa3[id]
    }
}

