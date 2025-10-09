import Foundation

/// Escenario interactivo de simulación basado en El Cerebro del Niño
struct CN4Scenario: Codable, Identifiable {
    let id: UUID
    let title: String
    let category: String                // "Integración Horizontal", "Integración Vertical", etc.
    let ageGroup: String                // "2-4 años", "5-7 años", etc.
    let situation: String               // Descripción de la situación
    let childState: String              // Estado emocional/cerebral del niño
    let challenge: String               // El desafío específico
    let options: [CN4Option]            // 3-4 opciones de respuesta
    let outcomes: [CN4Outcome]          // Resultados correspondientes
    let teachingPoint: String           // Punto de enseñanza del libro
    let relatedStrategy: Int            // 1-12
    let difficulty: Int                 // 1-5
    let icon: String
    let color: String
    
    init(title: String, category: String, ageGroup: String, situation: String, childState: String, challenge: String, options: [CN4Option], outcomes: [CN4Outcome], teachingPoint: String, relatedStrategy: Int, difficulty: Int, icon: String, color: String) {
        self.id = UUID()
        self.title = title
        self.category = category
        self.ageGroup = ageGroup
        self.situation = situation
        self.childState = childState
        self.challenge = challenge
        self.options = options
        self.outcomes = outcomes
        self.teachingPoint = teachingPoint
        self.relatedStrategy = relatedStrategy
        self.difficulty = difficulty
        self.icon = icon
        self.color = color
    }
}

/// Escenarios interactivos basados en el libro
func createCN4Scenarios() -> [CN4Scenario] {
    var scenarios: [CN4Scenario] = []
    
    // ESCENARIO 1: Niño no quiere guardar juguetes
    let scenario1Options = [
        CN4Option(
            text: "\"¡Guarda tus juguetes AHORA o no hay postre!\"",
            strategyUsed: nil,
            brainApproach: "Orden directa + amenaza (activa cerebro inferior reactivo)",
            isRecommended: false
        ),
        CN4Option(
            text: "\"Veo que no quieres guardar. Entiendo, es aburrido. ¿Guardamos juntos los rojos primero o los azules?\"",
            strategyUsed: 1,
            brainApproach: "Conecta (validación) + Redirige (opciones)",
            isRecommended: true
        ),
        CN4Option(
            text: "\"Ok, déjalos ahí. No importa.\"",
            strategyUsed: nil,
            brainApproach: "Permisividad sin límites (no ejercita cerebro superior)",
            isRecommended: false
        ),
        CN4Option(
            text: "\"¿Qué crees que deberíamos hacer con los juguetes? ¿Qué pasa si los dejamos aquí?\"",
            strategyUsed: 4,
            brainApproach: "Involucra cerebro superior con preguntas",
            isRecommended: true
        )
    ]
    
    let scenario1Outcomes = [
        CN4Outcome(
            optionId: scenario1Options[0].id,
            immediateReaction: "Tu hijo se pone a llorar. Tira más juguetes. Grita \"¡No!\" Escalada de conflicto.",
            childBrainState: "Cerebro inferior activado (amígdala). Corteza prefrontal offline. Modo lucha/huida.",
            parentFeeling: "Frustrado, enojado. Sensación de pérdida de control.",
            longTermImpact: "Tu hijo aprende que las emociones intensas y el poder son la forma de resolver conflictos. No desarrolla autorregulación ni cooperación.",
            score: 2,
            feedback: "Las órdenes con amenazas activan el cerebro inferior reactivo. Daniel Siegel enseña: no puedes razonar con un cerebro inferior activado. Primero conecta, luego redirige."
        ),
        CN4Outcome(
            optionId: scenario1Options[1].id,
            immediateReaction: "Tu hijo te mira. Parece considerarlo. Dice \"Los azules\". Empiezan a guardar juntos.",
            childBrainState: "Hemisferio derecho calmado por validación. Hemisferio izquierdo activado por opciones. Cerebro superior online.",
            parentFeeling: "Calmado, conectado. Sensación de trabajo en equipo.",
            longTermImpact: "Tu hijo aprende que sus emociones son válidas Y que hay límites razonables. Desarrolla cooperación y habilidades de negociación. Fortalece vínculo contigo.",
            score: 10,
            feedback: "¡Excelente! Usaste 'Conecta y Redirige' perfectamente. La validación emocional calma el cerebro inferior, las opciones involucran el cerebro superior. Estrategia #1 del libro."
        ),
        CN4Outcome(
            optionId: scenario1Options[2].id,
            immediateReaction: "Tu hijo sigue jugando. Los juguetes quedan tirados. No hay consecuencias.",
            childBrainState: "Cerebro superior no ejercitado. No hay oportunidad de aprender autorregulación.",
            parentFeeling: "Resignado, incómodo. Sensación de no estar guiando.",
            longTermImpact: "Sin límites consistentes, el cerebro superior no se ejercita. Tu hijo no aprende que sus acciones tienen consecuencias. Puede desarrollar dificultades con autorregulación.",
            score: 3,
            feedback: "La permisividad sin límites no ayuda al desarrollo cerebral. Los niños necesitan estructura y límites razonables para ejercitar su cerebro superior (toma de decisiones, consideración de consecuencias)."
        ),
        CN4Outcome(
            optionId: scenario1Options[3].id,
            immediateReaction: "Tu hijo piensa. \"Mmm... alguien se puede tropezar\". \"Sí, es verdad. ¿Qué hacemos?\" \"Guardarlos\".",
            childBrainState: "Corteza prefrontal activada (razonamiento, consecuencias). Ejercitando cerebro superior.",
            parentFeeling: "Orgulloso, paciente. Sensación de enseñar, no controlar.",
            longTermImpact: "Tu hijo desarrolla pensamiento de consecuencias, toma de decisiones, y responsabilidad. Cada oportunidad así fortalece su cerebro superior.",
            score: 9,
            feedback: "¡Muy bien! Usaste 'Úsalo o Piérdelo' - ejercitaste su cerebro superior con preguntas. Esto fortalece la corteza prefrontal. Estrategia #4. Alternativa poderosa a órdenes."
        )
    ]
    
    scenarios.append(CN4Scenario(
        title: "No Quiere Guardar Juguetes",
        category: "Integración Vertical",
        ageGroup: "3-5 años",
        situation: "Es hora de guardar juguetes antes de cenar. Tu hijo de 4 años está jugando felizmente y no quiere parar.",
        childState: "Cerebro inferior (juego, diversión) dominando. Cerebro superior (planificación, transiciones) no activado.",
        challenge: "Lograr cooperación sin berrinche, ejercitando cerebro superior.",
        options: scenario1Options,
        outcomes: scenario1Outcomes,
        teachingPoint: "Conecta primero para calmar cerebro inferior. Luego involucra cerebro superior con opciones o preguntas. No puedes razonar con cerebro inferior activado.",
        relatedStrategy: 1,
        difficulty: 2,
        icon: "cube.fill",
        color: "blue"
    ))
    
    // ESCENARIO 2: Miedo nocturno
    let scenario2Options = [
        CN4Option(
            text: "\"No hay nada que temer. Eres un niño grande. Vuelve a dormir.\"",
            brainApproach: "Solo hemisferio izquierdo lógico (ignora hemisferio derecho emocional)",
            isRecommended: false
        ),
        CN4Option(
            text: "\"Veo que tienes miedo. Algo te asustó. Cuéntame qué viste.\"",
            strategyUsed: 2,
            brainApproach: "Conecta con hemisferio derecho, luego activa izquierdo con narrativa",
            isRecommended: true
        ),
        CN4Option(
            text: "\"Ok, puedes dormir en mi cama esta noche.\"",
            brainApproach: "Evita el miedo sin procesarlo",
            isRecommended: false
        )
    ]
    
    let scenario2Outcomes = [
        CN4Outcome(
            optionId: scenario2Options[0].id,
            immediateReaction: "Tu hija llora más fuerte. \"¡Pero tengo miedo!\" Se aferra a ti, más angustiada.",
            childBrainState: "Hemisferio derecho emocional intensificado. Se siente no escuchada. Amígdala más activada.",
            parentFeeling: "Frustrado. No funciona. Ella sigue asustada.",
            longTermImpact: "Tu hija aprende que sus emociones no son válidas. Puede empezar a reprimir o esconder miedos. No desarrolla habilidades de regulación emocional.",
            score: 2,
            feedback: "Ir directo a lógica ignora el hemisferio derecho emocional. Niños pequeños no pueden acceder a razón cuando están emocionalmente activados. Primero conecta con la emoción."
        ),
        CN4Outcome(
            optionId: scenario2Options[1].id,
            immediateReaction: "Tu hija empieza a contar: \"Vi una sombra grande...\" Mientras habla, su respiración se calma. Te abraza.",
            childBrainState: "Hemisferio derecho validado (conexión emocional). Hemisferio izquierdo activándose (palabras, narrativa). Integración.",
            parentFeeling: "Conectado, presente. Sensación de ayudar genuinamente.",
            longTermImpact: "Al nombrar el miedo con palabras, reduces su intensidad (Nombra para Dominar). Tu hija aprende que puede procesar emociones difíciles con tu ayuda. Fortalece vínculo seguro.",
            score: 10,
            feedback: "¡Perfecto! Usaste 'Nombra para Dominar'. Primero conectaste con su emoción (hemisferio derecho), luego la ayudaste a ponerlo en palabras (hemisferio izquierdo). Esto integra la experiencia y reduce su poder emocional. Estrategia #2."
        ),
        CN4Outcome(
            optionId: scenario2Options[2].id,
            immediateReaction: "Tu hija se calma y duerme contigo. Esta noche está bien.",
            childBrainState: "Amígdala calmada por tu presencia. Pero miedo no procesado.",
            parentFeeling: "Alivio inmediato. Pero preocupación sobre patrón.",
            longTermImpact: "El miedo no fue procesado, solo evitado. Puede volver cada noche. Tu hija no aprendió herramientas para manejar miedo. Dependencia sin desarrollo de regulación propia.",
            score: 4,
            feedback: "Co-sleeping ocasional está bien para conexión. Pero cuando es respuesta consistente a miedo, evita que el niño aprenda a procesar emociones. Mejor: procesar el miedo juntos, LUEGO decidir si duerme contigo o no."
        )
    ]
    
    scenarios.append(CN4Scenario(
        title: "Miedo Nocturno",
        category: "Integración Horizontal",
        ageGroup: "4-7 años",
        situation: "Son las 2 AM. Tu hija de 5 años entra a tu cuarto llorando. \"¡Tengo miedo! Hay algo en mi cuarto.\"",
        childState: "Hemisferio derecho emocional dominando. Amígdala activada (miedo). Hemisferio izquierdo lógico desconectado.",
        challenge: "Calmar su miedo Y ayudarla a procesar la experiencia para integración.",
        options: scenario2Options,
        outcomes: scenario2Outcomes,
        teachingPoint: "Los niños pequeños son dominados por hemisferio derecho emocional. Antes de lógica, conecta con emoción. Luego ayuda a 'nombrar para dominar': poner palabras reduce poder emocional.",
        relatedStrategy: 2,
        difficulty: 3,
        icon: "moon.stars.fill",
        color: "indigo"
    ))
    
    // ESCENARIO 3: Frustración con tarea escolar
    let scenario3Options = [
        CN4Option(
            text: "\"¡Ya te dije cómo hacerlo! ¡Pon atención!\"",
            brainApproach: "Frustración del padre activa cerebro inferior del niño",
            isRecommended: false
        ),
        CN4Option(
            text: "\"Veo que esto es muy difícil y te está frustrando. Hagamos 5 saltos de estrella y volvemos.\"",
            strategyUsed: 5,
            brainApproach: "Movimiento para resetear cerebro + validación emocional",
            isRecommended: true
        ),
        CN4Option(
            text: "\"No importa, yo lo hago por ti para que terminemos rápido.\"",
            brainApproach: "Evita ejercitar cerebro superior del niño",
            isRecommended: false
        ),
        CN4Option(
            text: "\"Respira conmigo. Ahora hagamos SIFT: ¿Qué sientes en tu cuerpo? ¿En tu pecho?\"",
            strategyUsed: 9,
            brainApproach: "Mindfulness + conciencia corporal para regulación",
            isRecommended: true
        )
    ]
    
    let scenario3Outcomes = [
        CN4Outcome(
            optionId: scenario3Options[0].id,
            immediateReaction: "Tu hijo empieza a llorar. Avienta el lápiz. \"¡No puedo! ¡Es muy difícil!\" Mayor frustración.",
            childBrainState: "Corteza prefrontal se desactiva más. Amígdala toma control. Modo defensa.",
            parentFeeling: "Más frustrado aún. Impotencia. Culpa por explotar.",
            longTermImpact: "Tu hijo asocia aprendizaje con amenaza y vergüenza. Puede desarrollar ansiedad académica. El vínculo se daña en momentos de desafío.",
            score: 1,
            feedback: "Cuando TÚ estás frustrado, tu cerebro inferior está activado. Esto contagia al niño. Siegel enseña: primero regula TU propio cerebro, luego ayudas al de tu hijo. No puedes co-regular si tú mismo estás desregulado."
        ),
        CN4Outcome(
            optionId: scenario3Options[1].id,
            immediateReaction: "Saltan juntos 5 veces. Tu hijo empieza a reír. Su cuerpo se relaja. \"Ok, lo intento otra vez.\"",
            childBrainState: "Movimiento libera dopamina y serotonina. Amígdala se calma. Corteza prefrontal vuelve online.",
            parentFeeling: "Más calmado también. Conexión restaurada. Sensación de equipo.",
            longTermImpact: "Tu hijo aprende herramienta de regulación: cuando estoy atascado, mover el cuerpo ayuda. Asocia desafíos con apoyo, no amenaza. Desarrolla resiliencia.",
            score: 10,
            feedback: "¡Excelente! Usaste 'Muévelo o Piérdelo' (#5). El movimiento es una de las formas más rápidas de cambiar estado cerebral. Validaste su emoción Y le diste herramienta concreta. Genial."
        ),
        CN4Outcome(
            optionId: scenario3Options[2].id,
            immediateReaction: "Tu hijo se alivia. Terminas la tarea por él. Todos contentos... por ahora.",
            childBrainState: "No hay ejercicio del cerebro superior. Oportunidad de aprendizaje perdida.",
            parentFeeling: "Alivio a corto plazo. Pero preocupación: ¿siempre haré yo su trabajo?",
            longTermImpact: "Tu hijo aprende: cuando algo es difícil, alguien más lo hará por mí. No desarrolla perseverancia, tolerancia a frustración, ni habilidades de resolución de problemas. Dependencia.",
            score: 3,
            feedback: "Rescatar constantemente no permite que el cerebro superior se ejercite. Los niños necesitan luchar (con apoyo) para desarrollar resiliencia. Mejor: divide la tarea en pasos más pequeños y guía sin hacer."
        ),
        CN4Outcome(
            optionId: scenario3Options[3].id,
            immediateReaction: "Tu hijo cierra los ojos. \"Mi pecho está apretado.\" Respira. \"Ahora está más suelto.\" Se calma.",
            childBrainState: "Ínsula anterior (conciencia corporal) activada. Corteza prefrontal medial (observación) online. Integración.",
            parentFeeling: "Presente, conectado. Orgullo de enseñar herramienta real.",
            longTermImpact: "SIFT se vuelve herramienta automática de regulación. Tu hijo desarrolla autoconocimiento profundo. Aprende a observar emociones sin ser arrastrado. Mindfulness.",
            score: 9,
            feedback: "¡Muy bien! SIFT (#9) es poderosa. Enseña a observar el mundo interior. Con práctica, se vuelve automática y tu hijo puede auto-regular. Esto es mindfulness aplicado."
        )
    ]
    
    scenarios.append(CN4Scenario(
        title: "Frustración con Tarea Escolar",
        category: "Regulación Emocional",
        ageGroup: "7-10 años",
        situation: "Tu hijo de 8 años tiene tarea de matemáticas. Lleva 20 minutos en el mismo problema. Está cada vez más frustrado, borrando agresivamente, suspirando fuerte.",
        childState: "Corteza prefrontal sobrecargada (demasiado esfuerzo cognitivo). Amígdala activándose (frustración). Cerebro superior empezando a desconectarse.",
        challenge: "Ayudarlo a regular sin rescatarlo. Enseñar herramientas de manejo de frustración.",
        options: scenario3Options,
        outcomes: scenario3Outcomes,
        teachingPoint: "El movimiento físico y el mindfulness son herramientas poderosas de regulación. Cuando el cerebro está atascado, cambiar el estado físico cambia el estado mental.",
        relatedStrategy: 5,
        difficulty: 3,
        icon: "pencil.and.outline",
        color: "orange"
    ))
    
    // ESCENARIO 4: Hermano mayor celoso de bebé
    let scenario4Options = [
        CN4Option(
            text: "\"¡Eres el hermano mayor! Tienes que ser responsable y ayudar.\"",
            brainApproach: "Expectativas sin validar emoción (ignora hemisferio derecho)",
            isRecommended: false
        ),
        CN4Option(
            text: "\"Veo que extrañas nuestro tiempo juntos. El bebé cambió todo, ¿verdad? Cuéntame cómo te sientes.\"",
            strategyUsed: 2,
            brainApproach: "Conecta con emoción + invita a nombrar sentimientos",
            isRecommended: true
        ),
        CN4Option(
            text: "\"¿Cómo crees que se siente el bebé cuando llora? Necesita que lo cuidemos.\"",
            strategyUsed: 10,
            brainApproach: "Ejercita empatía sin primero validar su propia emoción",
            isRecommended: false
        )
    ]
    
    let scenario4Outcomes = [
        CN4Outcome(
            optionId: scenario4Options[0].id,
            immediateReaction: "Tu hijo se pone más callado. Dice \"Sí, mamá\" pero se aleja con cara triste. Más tarde golpea \"accidentalmente\" al bebé.",
            childBrainState: "Emoción reprimida (hemisferio derecho bloqueado). Resentimiento acumulándose. Necesidad emocional no atendida.",
            parentFeeling: "Sensación de que 'entendió', pero algo no está bien. Preocupación.",
            longTermImpact: "Tu hijo aprende a reprimir emociones difíciles. Los celos no desaparecen, solo se esconden. Puede manifestarse en agresión pasiva o regresión. Vínculo contigo se debilita porque no se siente visto.",
            score: 2,
            feedback: "Saltar directo a 'deberías sentir X' ignora la emoción real. Los celos son normales y saludables. Primero valida lo que SIENTE, luego podrás guiar lo que HACE."
        ),
        CN4Outcome(
            optionId: scenario4Options[1].id,
            immediateReaction: "Tu hijo te mira. Sus ojos se llenan de lágrimas. \"Sí... ya no jugamos como antes.\" Te abraza fuerte. Llora un poco.",
            childBrainState: "Hemisferio derecho validado (emoción reconocida). Hemisferio izquierdo activándose (palabras). Sistema nervioso regulándose por tu presencia.",
            parentFeeling: "Conectado profundamente. Ternura. Alivio de entender qué pasaba.",
            longTermImpact: "Al nombrar sus celos, reduces su intensidad. Tu hijo aprende que TODAS las emociones son válidas, incluso las 'feas'. Se siente visto. Esto previene acting out agresivo. Vínculo fortalecido.",
            score: 10,
            feedback: "¡Perfecto! Usaste 'Nombra para Dominar' (#2). Los celos de hermanos son NORMALES. Al validarlos y darles palabras, reduces su poder. Ahora que se siente visto, PODRÁ desarrollar amor por el bebé."
        ),
        CN4Outcome(
            optionId: scenario4Options[2].id,
            immediateReaction: "Tu hijo dice \"No sé\" o \"Está bien, supongo.\" Parece confundido y todavía molesto.",
            childBrainState: "Intentas activar empatía (cerebro superior) cuando su propia emoción no está regulada. No funciona.",
            parentFeeling: "Frustración. La conversación no conectó. Algo falta.",
            longTermImpact: "No puedes enseñar empatía cuando el niño está en su propia necesidad emocional. Primero llena su tanque, LUEGO podrá pensar en otros. El orden importa.",
            score: 4,
            feedback: "La empatía es importante, pero el ORDEN importa. Primero conecta con SU emoción (llenar su tanque). Una vez regulado, ENTONCES puede considerar al otro. No al revés."
        )
    ]
    
    scenarios.append(CN4Scenario(
        title: "Celos del Hermano Mayor",
        category: "Integración Horizontal",
        ageGroup: "3-6 años",
        situation: "Nació tu segundo bebé hace 2 meses. Tu hijo de 4 años ha estado irritable, regresivo (quiere biberón), y hoy dijo '¿Por qué no devolvemos al bebé?'",
        childState: "Hemisferio derecho lleno de emociones difíciles: celos, tristeza, abandono. No tiene palabras para procesarlo (hemisferio izquierdo no integrado).",
        challenge: "Validar sus celos (que son normales) sin permitir agresión al bebé.",
        options: scenario4Options,
        outcomes: scenario4Outcomes,
        teachingPoint: "Los celos son emociones normales. Al nombrarlos y validarlos, reduces su intensidad. Intentar reprimir o negar emociones las hace más fuertes.",
        relatedStrategy: 2,
        difficulty: 4,
        icon: "person.2.fill",
        color: "pink"
    ))
    
    // ESCENARIO 5: Transición difícil (apagar videojuego)
    let scenario5Options = [
        CN4Option(
            text: "\"¡Ya son 30 minutos! ¡Apaga AHORA o no juegas mañana!\"",
            brainApproach: "Orden abrupta + amenaza (activa cerebro inferior)",
            isRecommended: false
        ),
        CN4Option(
            text: "\"En 5 minutos vamos a cenar. ¿Qué necesitas hacer para terminar bien tu juego?\"",
            strategyUsed: 3,
            brainApproach: "Aviso anticipado + involucra cerebro superior con pregunta",
            isRecommended: true
        ),
        CN4Option(
            text: "\"Ok, 10 minutos más. Pero es lo último, ¿eh?\" (Ya dijiste esto 3 veces)",
            brainApproach: "Límites inconsistentes (no ejercita autorregulación)",
            isRecommended: false
        ),
        CN4Option(
            text: "Apagas tú directamente la consola sin aviso.",
            brainApproach: "Control total sin preparar transición (corteza prefrontal no activada)",
            isRecommended: false
        )
    ]
    
    let scenario5Outcomes = [
        CN4Outcome(
            optionId: scenario5Options[0].id,
            immediateReaction: "Tu hijo explota. \"¡NO! ¡Estoy en medio de algo!\" Berrinche total. Grita, llora, tal vez avienta el control.",
            childBrainState: "Transición abrupta + amenaza = amígdala activada. Corteza prefrontal offline. Cerebro inferior en control total.",
            parentFeeling: "Enojado. Batalla de poder. Escalada de conflicto.",
            longTermImpact: "Cada transición se vuelve batalla. Tu hijo no aprende autorregulación porque su cerebro está constantemente reactivo. Asocia límites con amenaza, no con guía.",
            score: 2,
            feedback: "Transiciones abruptas son difíciles para el cerebro en desarrollo. La corteza prefrontal necesita PREPARACIÓN para cambiar de actividad. Avisos anticipados + opciones ayudan."
        ),
        CN4Outcome(
            optionId: scenario5Options[1].id,
            immediateReaction: "Tu hijo piensa. \"Mmm, terminar este nivel.\" Juega 4 minutos más, guarda, apaga. Llega a cenar de buen humor.",
            childBrainState: "Aviso anticipado permite a corteza prefrontal PLANIFICAR. Pregunta abierta la involucra. Sensación de autonomía. Cerebro superior ejercitado.",
            parentFeeling: "Sorpresa positiva. Cooperación lograda. Sensación de respeto mutuo.",
            longTermImpact: "Tu hijo aprende: las transiciones vienen con aviso. Puedo planificar. Tengo algo de control. Esto desarrolla autorregulación, planificación, y flexibilidad. Cooperación en lugar de conflicto.",
            score: 10,
            feedback: "¡Excelente! Usaste 'Involucra, No Enfurezcas' (#3). Los avisos anticipados + preguntas abiertas ejercitan corteza prefrontal. Tu hijo aprende a auto-regular transiciones. Estrategia poderosa."
        ),
        CN4Outcome(
            optionId: scenario5Options[2].id,
            immediateReaction: "Tu hijo sigue jugando. Sabe que cederás otra vez. En 10 minutos, vuelves a decir '¡Ahora sí!'",
            childBrainState: "No hay ejercicio de autorregulación. Aprende que límites no son reales. Cerebro superior no se ejercita.",
            parentFeeling: "Frustración creciente. Resentimiento. Pérdida de autoridad.",
            longTermImpact: "Sin límites consistentes, el cerebro superior no aprende autorregulación. Tu hijo puede desarrollar dificultades con auto-control, postergación de gratificación, y respeto a límites.",
            score: 2,
            feedback: "Los límites CONSISTENTES son necesarios para desarrollo cerebral. No por control, sino porque ejercitan la corteza prefrontal. Di lo que vas a hacer, haz lo que dijiste. Con aviso y empatía, pero firme."
        ),
        CN4Outcome(
            optionId: scenario5Options[3].id,
            immediateReaction: "Tu hijo grita sorprendido. \"¡¿QUÉ HICISTE?! ¡Estaba jugando!\" Furia total. Tal vez rompe algo.",
            childBrainState: "Shock + impotencia = amígdala en máximo. Sin aviso, cerebro inferior reacciona como amenaza. No hubo preparación.",
            parentFeeling: "Poder momentáneo pero culpa. Relación dañada.",
            longTermImpact: "Tu hijo aprende: no tengo control, las cosas pasan sin aviso, el mundo es impredecible. Esto genera ansiedad y daña confianza. Las transiciones necesitan PREPARACIÓN cerebral.",
            score: 1,
            feedback: "Aunque necesites límites, el CÓMO importa. El cerebro necesita preparación para transiciones. Avisos de 5-10 minutos permiten que corteza prefrontal procese el cambio. Sin aviso = trauma pequeño."
        )
    ]
    
    scenarios.append(CN4Scenario(
        title: "Transición: Apagar Videojuego",
        category: "Integración Vertical",
        ageGroup: "6-12 años",
        situation: "Tu hijo de 9 años lleva 30 minutos jugando videojuegos. Dijiste que era el límite. Es hora de cenar. Necesitas que apague.",
        childState: "Corteza prefrontal absorta en el juego (flujo). Cambiar de actividad requiere que esta área se 'resetee' y planifique transición.",
        challenge: "Lograr la transición sin berrinche, ejercitando su autorregulación.",
        options: scenario5Options,
        outcomes: scenario5Outcomes,
        teachingPoint: "Las transiciones son difíciles para el cerebro en desarrollo. Los avisos anticipados + opciones involucran el cerebro superior y facilitan cambios de actividad.",
        relatedStrategy: 3,
        difficulty: 3,
        icon: "gamecontroller.fill",
        color: "purple"
    ))
    
    // ESCENARIO 6: Memoria de evento traumático (médico)
    let scenario6Options = [
        CN4Option(
            text: "\"Ya pasó. No pienses más en ello. Mira, aquí está tu juguete favorito.\"",
            brainApproach: "Distracción sin procesar (memoria implícita no integrada)",
            isRecommended: false
        ),
        CN4Option(
            text: "\"Cuéntame TODO sobre el doctor. ¿Qué pasó primero? ¿Luego qué? ¿Y al final?\"",
            strategyUsed: 7,
            brainApproach: "Crear narrativa explícita para integrar memoria implícita",
            isRecommended: true
        ),
        CN4Option(
            text: "\"Usemos el control remoto mental. PAUSA: respiremos. REBOBINA: ¿qué pasó? AVANCE RÁPIDO: ya terminó, estás bien.\"",
            strategyUsed: 6,
            brainApproach: "Metáfora de control + perspectiva temporal",
            isRecommended: true
        )
    ]
    
    let scenario6Outcomes = [
        CN4Outcome(
            optionId: scenario6Options[0].id,
            immediateReaction: "Tu hija se distrae por un momento. Juega. Pero 2 horas después vuelve a preguntar sobre el doctor, ansiosa.",
            childBrainState: "Memoria implícita (sensaciones de dolor, miedo) sin procesar. Hipocampo no integró la experiencia. Emoción sigue suelta.",
            parentFeeling: "Frustración: '¿Por qué sigue hablando de esto?' No entiende que necesita procesarlo.",
            longTermImpact: "Memorias traumáticas no procesadas se quedan como memoria implícita: sensaciones corporales sin contexto que se disparan aleatoriamente. Puede desarrollar miedo a doctores, ansiedad generalizada.",
            score: 2,
            feedback: "Distracción no procesa trauma. La memoria implícita necesita convertirse en explícita (con palabras, secuencia, narrativa) para integrarse. Evitar hablar de ello lo hace más poderoso."
        ),
        CN4Outcome(
            optionId: scenario6Options[1].id,
            immediateReaction: "Tu hija empieza a contar. Al principio con voz temblorosa. A medida que cuenta, su voz se estabiliza. Al final: 'Y ya, me dieron una calcomanía.'",
            childBrainState: "Hipocampo empaquetando memoria implícita en narrativa explícita. Hemisferios integrándose (emoción + palabras). Corteza prefrontal dando contexto temporal: tiene principio, medio, FIN.",
            parentFeeling: "Presente, contenedor emocional. Orgullo de ayudarla a procesar.",
            longTermImpact: "Al contar la historia completa varias veces, la memoria se integra. El poder emocional disminuye. Tu hija aprende: puedo procesar experiencias difíciles con palabras. No desarrolla miedo crónico.",
            score: 10,
            feedback: "¡Perfecto! 'Recuerda Recordar' (#7). Convertir memoria implícita en narrativa explícita es CÓMO el cerebro procesa trauma. Cada vez que cuenta la historia, se integra más. Esto es terapéutico."
        ),
        CN4Outcome(
            optionId: scenario6Options[2].id,
            immediateReaction: "Tu hija sonríe un poco. \"Ok, PAUSA.\" Respiran. \"REBOBINA: el doctor me revisó.\" \"AVANCE RÁPIDO: Ya estoy en casa.\" Se calma.",
            childBrainState: "Metáfora visual activa hemisferio derecho (imágenes). Dar estructura temporal (antes-durante-después) activa corteza prefrontal. Sensación de control sobre la memoria.",
            parentFeeling: "Creatividad en acción. Conexión lúdica. Sensación de herramienta útil.",
            longTermImpact: "La metáfora del control remoto se vuelve herramienta que puede usar sola. Aprende que tiene control sobre sus pensamientos y memorias. Desarrolla resiliencia ante futuras experiencias difíciles.",
            score: 9,
            feedback: "¡Muy bien! 'Control Remoto Mental' (#6). Las metáforas visuales son poderosas con niños. Dar estructura temporal (pausa-rebobina-avance rápido) ayuda a integrar. Alternativa creativa y efectiva."
        )
    ]
    
    scenarios.append(CN4Scenario(
        title: "Memoria de Visita al Doctor",
        category: "Memoria e Identidad",
        ageGroup: "4-7 años",
        situation: "Tu hija de 5 años fue al doctor ayer. Le pusieron una vacuna (lloró mucho). Hoy no deja de hablar del doctor y parece ansiosa. '¿Me va a doler otra vez?'",
        childState: "Memoria implícita activada (dolor, miedo) sin narrativa explícita clara. Hipocampo necesita ayuda para empaquetar la experiencia con contexto temporal.",
        challenge: "Ayudarla a procesar la experiencia para que no se quede como trauma no integrado.",
        options: scenario6Options,
        outcomes: scenario6Outcomes,
        teachingPoint: "Memorias traumáticas necesitan convertirse en narrativa explícita para integrarse. Hablar de experiencias difíciles no las hace peor; las hace procesables.",
        relatedStrategy: 7,
        difficulty: 4,
        icon: "cross.case.fill",
        color: "teal"
    ))
    
    // ESCENARIO 7: Conflicto después de gritar
    let scenario7Options = [
        CN4Option(
            text: "Sigues con tu día como si nada. \"Ya pasó, olvidémoslo.\"",
            brainApproach: "Evita reparación (daña vínculo sin cerrar ciclo)",
            isRecommended: false
        ),
        CN4Option(
            text: "\"Perdón por gritar. No debí.\" (Sigues haciendo tu actividad sin más contacto)",
            brainApproach: "Disculpa sin conexión emocional real",
            isRecommended: false
        ),
        CN4Option(
            text: "Te arrodillas a su altura: 'Grité y eso te asustó. Lo siento mucho. ¿Qué necesitabas que no te di?' Abrazas. 'Te amo siempre, incluso cuando cometo errores.'",
            strategyUsed: 12,
            brainApproach: "Reparación relacional genuina con vulnerabilidad",
            isRecommended: true
        )
    ]
    
    let scenario7Outcomes = [
        CN4Outcome(
            optionId: scenario7Options[0].id,
            immediateReaction: "Tu hijo se queda callado el resto del día. Evita tu mirada. Se va a su cuarto.",
            childBrainState: "Ruptura en el vínculo sin reparar. Sistema nervioso sigue en alerta. Amígdala recuerda: papá/mamá puede ser amenaza.",
            parentFeeling: "Culpa persistente. Distancia emocional. Tensión en el ambiente.",
            longTermImpact: "Rupturas sin reparación acumulan. Tu hijo aprende: los errores rompen relaciones, las emociones fuertes son peligrosas, no puedo confiar completamente. Puede desarrollar inseguridad de apego.",
            score: 1,
            feedback: "Siegel enseña: las rupturas relacionales son normales. Lo que importa es la REPARACIÓN. Sin reparación, las rupturas acumulan y dañan el vínculo profundamente. Repara SIEMPRE."
        ),
        CN4Outcome(
            optionId: scenario7Options[1].id,
            immediateReaction: "Tu hijo asiente. \"Ok.\" Pero no hay verdadera reconexión. La tensión sigue.",
            childBrainState: "Palabras de disculpa (hemisferio izquierdo) sin conexión emocional (hemisferio derecho). No suficiente para reparar.",
            parentFeeling: "Hiciste lo 'correcto' pero no se siente resuelto.",
            longTermImpact: "Disculpas automáticas sin conexión real no reparan vínculos. Tu hijo aprende que 'perdón' es palabra vacía. La reparación genuina require vulnerabilidad y presencia.",
            score: 4,
            feedback: "Disculparse está bien, pero la reparación requiere MÁS: contacto visual, presencia física, vulnerabilidad emocional, reconexión. No solo palabras, sino experiencia relacional completa."
        ),
        CN4Outcome(
            optionId: scenario7Options[2].id,
            immediateReaction: "Tu hijo te mira. Sus ojos se llenan de lágrimas. \"Me asusté cuando gritaste.\" Lo abrazas. Lloran juntos un poco. Luego él sonríe. \"Te quiero, papá/mamá.\"",
            childBrainState: "Ruptura REPARADA. Sistema nervioso regulado por tu presencia vulnerable. Oxitocina liberada (hormona de conexión). Vínculo no solo restaurado sino FORTALECIDO.",
            parentFeeling: "Alivio profundo. Conexión restaurada. Humildad y amor.",
            longTermImpact: "Tu hijo aprende lecciones CRÍTICAS: Los adultos cometen errores Y pueden repararlos. Las relaciones pueden romperse Y arreglarse. Puedo confiar incluso después de momentos difíciles. Esto es SEGURIDAD DE APEGO.",
            score: 10,
            feedback: "¡Perfecto! 'Conéctate a Través del Conflicto' (#12). La reparación con vulnerabilidad es una de las enseñanzas más poderosas. Tu hijo aprende que el amor es más fuerte que los errores. Esto construye apego seguro."
        )
    ]
    
    scenarios.append(CN4Scenario(
        title: "Reparación Después de Gritar",
        category: "Reparación Relacional",
        ageGroup: "3-12 años",
        situation: "Esta mañana perdiste la paciencia. Le gritaste a tu hijo por algo pequeño (se derramó jugo). Él se asustó, se puso a llorar. Ahora, 2 horas después, ambos están calmados pero hay tensión en el aire.",
        childState: "Memoria de la ruptura relacional activa. Sistema nervioso todavía en alerta. Necesita señal de seguridad: el vínculo está bien.",
        challenge: "Reparar genuinamente la ruptura relacional. Modelar que los adultos cometen errores Y los reparan.",
        options: scenario7Options,
        outcomes: scenario7Outcomes,
        teachingPoint: "Las rupturas relacionales son inevitables. Lo que importa es la REPARACIÓN. Niños con reparaciones consistentes desarrollan apego seguro y resiliencia relacional.",
        relatedStrategy: 12,
        difficulty: 5,
        icon: "arrow.triangle.2.circlepath.circle.fill",
        color: "green"
    ))
    
    return scenarios
}

/// Generación de escenarios
let cn4Scenarios = createCN4Scenarios()

