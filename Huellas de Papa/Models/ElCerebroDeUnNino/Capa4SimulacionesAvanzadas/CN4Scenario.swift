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
    
    return scenarios
}

/// Generación de escenarios
let cn4Scenarios = createCN4Scenarios()

