import Foundation

/// Datos de la Capa 7 - Evaluaciones
/// Auto-evaluación del padre con feedback inmediato del libro de Erin Winters

struct TA7QuestionData {
    
    // MARK: - Preguntas con Feedback Inmediato
    
    static func createQuestion1() -> TA7Question {
        let feedbacks: [String: TA7Feedback] = [
            "Siempre": TA7Feedback(
                message: "¡Excelente! Estás aplicando el amor incondicional del espectro emocional.",
                bookQuote: "Te amo cuando estás enojado, triste, alegre, melancólico",
                recommendation: "Continúa validando todas las emociones con autenticidad.",
                score: 100,
                type: .excellent
            ),
            "Casi siempre": TA7Feedback(
                message: "Muy bien. Estás en el camino correcto.",
                bookQuote: "Todo el mundo tiene emociones",
                recommendation: "Identifica qué emociones te cuesta más validar y practica con ellas.",
                score: 80,
                type: .good
            ),
            "A veces": TA7Feedback(
                message: "Hay espacio para crecer en la validación emocional.",
                bookQuote: "Aprender sobre nuestras emociones es clave",
                recommendation: "Practica usar las frases del libro diariamente: 'Te amo cuando estás [emoción]'",
                score: 50,
                type: .needsWork
            ),
            "Rara vez": TA7Feedback(
                message: "Esta es un área importante de mejora.",
                bookQuote: "Te amo cuando estás enojado",
                recommendation: "Comienza con el Nivel 1 del entrenamiento. Practica validar al menos una emoción al día.",
                score: 25,
                type: .critical
            )
        ]
        
        return TA7Question(
            category: "Validación del Espectro Emocional",
            text: "¿Con qué frecuencia validas TODAS las emociones de tu hijo (incluyendo enojo, tristeza, frustración)?",
            type: .multipleChoice,
            options: ["Siempre", "Casi siempre", "A veces", "Rara vez"],
            feedbacks: feedbacks,
            weight: 1.5,
            order: 1,
            bookReference: "Te amo cuando estás enojado, triste, alegre, melancólico"
        )
    }
    
    static func createQuestion2() -> TA7Question {
        let feedbacks: [String: TA7Feedback] = [
            "Siempre": TA7Feedback(
                message: "¡Extraordinario! Estás modelando permanencia del vínculo.",
                bookQuote: "Te amo incluso cuando yo estoy cansada o me enfado",
                recommendation: "Continúa siendo este modelo de amor incondicional incluso en tus momentos difíciles.",
                score: 100,
                type: .excellent
            ),
            "Casi siempre": TA7Feedback(
                message: "Muy bien. Estás trabajando en tu propia regulación.",
                bookQuote: "Mi amor persiste ahora y para siempre",
                recommendation: "En momentos de agotamiento, recuerda pausar antes de reaccionar.",
                score: 75,
                type: .good
            ),
            "A veces": TA7Feedback(
                message: "Este es uno de los desafíos más difíciles para los padres.",
                bookQuote: "Ser humano implica tener días buenos y malos",
                recommendation: "Practica el Nivel 2: Guardián de la Permanencia. Reconoce tus emociones Y mantén el amor visible.",
                score: 40,
                type: .needsWork
            ),
            "Rara vez": TA7Feedback(
                message: "Prioriza trabajar en tu propia regulación emocional.",
                bookQuote: "Te amo incluso cuando yo estoy cansada",
                recommendation: "Cuando sientas que vas a proyectar tu emoción: pausa, respira, y di 'Estoy [emoción] Y te amo'.",
                score: 20,
                type: .critical
            )
        ]
        
        return TA7Question(
            category: "Permanencia del Vínculo",
            text: "¿Mantienes el amor visible incluso cuando TÚ estás enfadado, cansado o frustrado?",
            type: .multipleChoice,
            options: ["Siempre", "Casi siempre", "A veces", "Rara vez"],
            feedbacks: feedbacks,
            weight: 2.0,
            order: 2,
            bookReference: "Te amo incluso cuando yo estoy cansada o me enfado"
        )
    }
    
    static func createQuestion3() -> TA7Question {
        let feedbacks: [String: TA7Feedback] = [
            "Siempre": TA7Feedback(
                message: "¡Perfecto! Respetas la autonomía emocional de tu hijo.",
                bookQuote: "Me encanta tu tiempo a solas",
                recommendation: "Continúa respetando su necesidad de espacio como una estrategia de regulación válida.",
                score: 100,
                type: .excellent
            ),
            "Casi siempre": TA7Feedback(
                message: "Bien. Estás aprendiendo a respetar sus límites.",
                bookQuote: "Te amo cuando te escondes en tu habitación",
                recommendation: "Reflexiona: ¿cuándo te cuesta más respetar su espacio? ¿Qué emociones surgen en ti?",
                score: 75,
                type: .good
            ),
            "A veces": TA7Feedback(
                message: "Respetar el espacio puede ser difícil, pero es crucial.",
                bookQuote: "Me encanta tu tiempo a solas",
                recommendation: "Practica el Nivel 3: Maestro del Espacio. La soledad no es rechazo.",
                score: 45,
                type: .needsWork
            ),
            "Rara vez": TA7Feedback(
                message: "Tu hijo necesita que respetes su necesidad de espacio.",
                bookQuote: "Te amo cuando necesitas estar solo",
                recommendation: "Cuando tu hijo busque espacio, di: 'Respeto tu necesidad. Estoy aquí cuando estés listo'.",
                score: 20,
                type: .critical
            )
        ]
        
        return TA7Question(
            category: "Respeto de la Autonomía",
            text: "¿Respetas cuando tu hijo necesita espacio o tiempo a solas sin sentirte rechazado?",
            type: .multipleChoice,
            options: ["Siempre", "Casi siempre", "A veces", "Rara vez"],
            feedbacks: feedbacks,
            weight: 1.5,
            order: 3,
            bookReference: "Me encanta tu tiempo a solas"
        )
    }
    
    static func createQuestion4() -> TA7Question {
        let feedbacks: [String: TA7Feedback] = [
            "Todas las noches": TA7Feedback(
                message: "¡Extraordinario! El ritual nocturno es medicina emocional diaria.",
                bookQuote: "El consuelo se encuentra en las palabras dulces antes de dormir",
                recommendation: "Mantén esta hermosa consistencia. Es un regalo invaluable para tu hijo.",
                score: 100,
                type: .excellent
            ),
            "5-6 noches": TA7Feedback(
                message: "Muy bien. La consistencia está construyéndose.",
                bookQuote: "Los días difíciles terminan",
                recommendation: "Intenta incluir también los días más difíciles. Esas noches son las más importantes.",
                score: 80,
                type: .good
            ),
            "2-4 noches": TA7Feedback(
                message: "Hay oportunidad de fortalecer este ritual.",
                bookQuote: "Palabras dulces antes de dormir",
                recommendation: "Practica el Nivel 4: Sanador de Noches. Hazlo especialmente en días difíciles.",
                score: 50,
                type: .needsWork
            ),
            "0-1 noche": TA7Feedback(
                message: "El ritual nocturno es fundamental para reparar la conexión diaria.",
                bookQuote: "El consuelo se encuentra en el abrazo y las palabras dulces",
                recommendation: "Comienza esta semana: cada noche antes de dormir, repasa emociones del día y di 'Te amé cuando...'",
                score: 20,
                type: .critical
            )
        ]
        
        return TA7Question(
            category: "Rituales de Conexión",
            text: "¿Con qué frecuencia practicas el ritual de 'palabras dulces' antes de dormir?",
            type: .multipleChoice,
            options: ["Todas las noches", "5-6 noches", "2-4 noches", "0-1 noche"],
            feedbacks: feedbacks,
            weight: 1.8,
            order: 4,
            bookReference: "El consuelo se encuentra en el abrazo y las palabras dulces antes de dormir"
        )
    }
    
    static func createQuestion5() -> TA7Question {
        let feedbacks: [String: TA7Feedback] = [
            "Sí": TA7Feedback(
                message: "¡Excelente! Estás enseñando humanidad compartida.",
                bookQuote: "Ser humano implica tener días buenos y malos",
                recommendation: "Continúa mostrando que los adultos también tienen emociones. Esto normaliza su experiencia.",
                score: 100,
                type: .excellent
            ),
            "No": TA7Feedback(
                message: "Compartir tus emociones apropiadamente enseña humanidad compartida.",
                bookQuote: "Te amo cuando ambos estamos derrotados",
                recommendation: "Comparte: 'Yo también estoy cansado hoy' o 'Yo también me sentí frustrado'. Esto normaliza las emociones.",
                score: 30,
                type: .needsWork
            )
        ]
        
        return TA7Question(
            category: "Humanidad Compartida",
            text: "¿Compartes apropiadamente tus propias emociones con tu hijo, mostrando que tú también tienes días difíciles?",
            type: .yesNo,
            options: ["Sí", "No"],
            feedbacks: feedbacks,
            weight: 1.3,
            order: 5,
            bookReference: "Te amo cuando ambos estamos derrotados"
        )
    }
    
    static func createQuestion6() -> TA7Question {
        let feedbacks: [String: TA7Feedback] = [
            "Valido sin criticar": TA7Feedback(
                message: "¡Perfecto! Estás aceptando todas las expresiones emocionales.",
                bookQuote: "Te amo incluso con ese suspiro molesto y pesado",
                recommendation: "Continúa validando incluso lo que te molesta. Esto enseña aceptación total.",
                score: 100,
                type: .excellent
            ),
            "Lo noto pero no digo nada": TA7Feedback(
                message: "Notarlo es el primer paso, validarlo es el segundo.",
                bookQuote: "Te amo incluso con ese suspiro molesto",
                recommendation: "Prueba verbalizar: 'Veo que estás fastidiado, te amo cuando te sientes así'.",
                score: 60,
                type: .good
            ),
            "Critico o pido que pare": TA7Feedback(
                message: "Criticar las expresiones emocionales enseña que deben ocultarse.",
                bookQuote: "Todas las formas de expresión emocional merecen ser reconocidas",
                recommendation: "La próxima vez, di: 'Te amo incluso cuando suspiras/te quejas'. Valida la expresión.",
                score: 25,
                type: .critical
            )
        ]
        
        return TA7Question(
            category: "Validación del Espectro Emocional",
            text: "Cuando tu hijo suspira pesadamente, se queja o muestra fastidio, ¿cómo respondes?",
            type: .scenario,
            options: ["Valido sin criticar", "Lo noto pero no digo nada", "Critico o pido que pare"],
            feedbacks: feedbacks,
            weight: 1.4,
            order: 6,
            bookReference: "Te amo incluso con ese suspiro molesto y pesado"
        )
    }
    
    static let allQuestions = [
        createQuestion1(),
        createQuestion2(),
        createQuestion3(),
        createQuestion4(),
        createQuestion5(),
        createQuestion6()
    ]
}

