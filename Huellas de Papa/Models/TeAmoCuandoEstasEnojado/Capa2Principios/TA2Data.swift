import Foundation

/// Datos de la Capa 2 - Principios
/// Basado 100% en el libro "¡Te amo cuando estás enojado!" de Erin Winters
/// Fuente: Ideas clave sobre amor incondicional del espectro emocional

extension TA2Principle {
    static let allPrinciples: [TA2Principle] = [
        TA2Principle(
            name: "Amor Incondicional del Espectro Emocional",
            definition: "El amor abraza todas las emociones sin condiciones, sin importar si son percibidas como positivas o negativas",
            bookQuote: "Te amo cuando estás enojado, cuando estás triste, en tu alegría, en tu melancolía, cuando estás apasionado, o tranquilo",
            parentApplication: "Acepta y valida todas las emociones de tu hijo. No hay emociones 'malas', todas son válidas y merecen amor.",
            emotionalImpact: "El niño desarrolla seguridad emocional al saber que todas sus emociones son aceptadas"
        ),
        TA2Principle(
            name: "Permanencia del Vínculo",
            definition: "El amor es constante y trasciende las dificultades, los comportamientos difíciles y las circunstancias adversas",
            bookQuote: "Mi amor persiste ahora y para siempre, incluso en días difíciles, incluso cuando estoy cansada o me enfado",
            parentApplication: "Demuestra que tu amor no depende del comportamiento de tu hijo. Está presente siempre, en los buenos y malos momentos.",
            emotionalImpact: "El niño desarrolla apego seguro al comprender que el amor de sus padres es permanente"
        ),
        TA2Principle(
            name: "Reconocimiento de la Humanidad Compartida",
            definition: "Todos somos humanos y experimentamos días buenos y malos. Las respuestas emocionales naturales son válidas.",
            bookQuote: "Ser un ser humano implica inherentemente tener días buenos y malos. Todo el mundo tiene emociones.",
            parentApplication: "Normaliza las emociones difíciles como parte natural de ser humano, tanto para el niño como para ti mismo.",
            emotionalImpact: "El niño aprende que sus emociones son normales y parte de la experiencia humana"
        ),
        TA2Principle(
            name: "Co-regulación y Consuelo",
            definition: "Acompañar activamente al niño en su proceso emocional, ofreciendo presencia, comprensión y apoyo",
            bookQuote: "Aprender sobre nuestras emociones es clave. Hablar de ellas con alguien de confianza puede ayudar.",
            parentApplication: "Ofrece presencia física y emocional. Palabras dulces, abrazos y escucha activa antes y durante los momentos difíciles.",
            emotionalImpact: "El niño aprende a regular sus emociones a través de la relación de confianza con el adulto"
        )
    ]
}

extension TA2Scenario {
    static let allScenarios: [TA2Scenario] = [
        TA2Scenario(
            situation: "Berrinches y rabietas intensas",
            emotionalState: "Enojado, frustrado, desbordado emocionalmente",
            unconditionalResponse: "Te amo cuando estás enojado y haces berrinches",
            whatToAvoid: "Castigar, gritar o avergonzar al niño por su expresión emocional",
            whatToDo: "Mantener la calma, validar la emoción, ofrecer presencia física cercana",
            insight: "El amor permanece constante incluso cuando el comportamiento es difícil de manejar"
        ),
        TA2Scenario(
            situation: "Llanto sin capacidad de expresión verbal",
            emotionalState: "Triste, abrumado, sin palabras para comunicar",
            unconditionalResponse: "Te amo cuando lloras y no tienes las palabras para pedir lo que quieres",
            whatToAvoid: "Exigir que se calme o que explique qué le pasa inmediatamente",
            whatToDo: "Acompañar en silencio, ofrecer abrazo, esperar pacientemente",
            insight: "El amor no requiere que el niño se exprese de manera perfecta o articulada"
        ),
        TA2Scenario(
            situation: "Aislamiento emocional - necesita espacio",
            emotionalState: "Necesita soledad, abrumado, melancólico",
            unconditionalResponse: "Te amo cuando te escondes en tu habitación, me encanta tu tiempo a solas",
            whatToAvoid: "Forzar la interacción o interpretar su necesidad de espacio como rechazo",
            whatToDo: "Respetar su necesidad de soledad, estar disponible cuando esté listo",
            insight: "Validar su necesidad de espacio personal como una estrategia de regulación emocional válida"
        ),
        TA2Scenario(
            situation: "Expresiones molestas - suspiros, quejas",
            emotionalState: "Fastidiado, irritado, cansado",
            unconditionalResponse: "Te amo incluso con ese suspiro molesto y pesado",
            whatToAvoid: "Criticar o corregir cada pequeña expresión de malestar",
            whatToDo: "Aceptar sus expresiones emocionales naturales sin juicio",
            insight: "Todas las formas de expresión emocional merecen ser reconocidas, incluso las molestas"
        ),
        TA2Scenario(
            situation: "Agotamiento mutuo - ambos están cansados",
            emotionalState: "Ambos derrotados, sin energía emocional",
            unconditionalResponse: "Te amo incluso cuando ambos estamos derrotados",
            whatToAvoid: "Culpar al niño por el cansancio mutuo o exigir que mejore su comportamiento",
            whatToDo: "Reconocer el cansancio compartido, simplificar expectativas, ofrecer apoyo mutuo",
            insight: "El amor se sostiene incluso en momentos de agotamiento compartido"
        ),
        TA2Scenario(
            situation: "Cuando el padre también está enfadado",
            emotionalState: "El padre experimenta sus propias emociones difíciles",
            unconditionalResponse: "Te amo incluso cuando yo estoy cansada o me enfado",
            whatToAvoid: "Proyectar las propias emociones en el niño o exigir perfección propia",
            whatToDo: "Modelar que los adultos también tienen emociones y aún así pueden amar incondicionalmente",
            insight: "Mostrar humanidad compartida: los padres también sienten emociones difíciles y el amor persiste"
        )
    ]
}

extension TA2EmotionalState {
    static let allEmotions: [TA2EmotionalState] = [
        TA2EmotionalState(
            emotion: "Enojado",
            description: "Sentimiento de ira, frustración o molestia",
            validationPhrase: "Te amo cuando estás enojado",
            fromBook: true
        ),
        TA2EmotionalState(
            emotion: "Triste",
            description: "Sentimiento de pena, melancolía o abatimiento",
            validationPhrase: "Te amo cuando estás triste",
            fromBook: true
        ),
        TA2EmotionalState(
            emotion: "Alegre",
            description: "Sentimiento de felicidad, entusiasmo o júbilo",
            validationPhrase: "Te amo en tu alegría",
            fromBook: true
        ),
        TA2EmotionalState(
            emotion: "Melancólico",
            description: "Sentimiento de nostalgia o tristeza suave",
            validationPhrase: "Te amo en tu melancolía",
            fromBook: true
        ),
        TA2EmotionalState(
            emotion: "Apasionado",
            description: "Sentimiento de intensidad emocional positiva",
            validationPhrase: "Te amo cuando estás apasionado",
            fromBook: true
        ),
        TA2EmotionalState(
            emotion: "Tranquilo",
            description: "Estado de calma y serenidad",
            validationPhrase: "Te amo cuando estás tranquilo",
            fromBook: true
        ),
        TA2EmotionalState(
            emotion: "Frustrado",
            description: "Sentimiento de bloqueo o incapacidad",
            validationPhrase: "Te amo cuando te sientes frustrado",
            fromBook: true
        ),
        TA2EmotionalState(
            emotion: "Cansado",
            description: "Agotamiento físico o emocional",
            validationPhrase: "Te amo cuando estás cansado",
            fromBook: true
        )
    ]
}

extension TA2Quote {
    static let allQuotes: [TA2Quote] = [
        TA2Quote(
            text: "Te amo cuando estás enojado, cuando estás triste, en tu alegría, en tu melancolía",
            context: "Validación del espectro emocional completo",
            relatedPrinciple: "Amor Incondicional del Espectro Emocional"
        ),
        TA2Quote(
            text: "Los días difíciles terminan, al igual que los buenos",
            context: "Perspectiva de que todo pasa, incluyendo las emociones intensas",
            relatedPrinciple: "Co-regulación y Consuelo"
        ),
        TA2Quote(
            text: "Ser un ser humano implica inherentemente tener días buenos y malos",
            context: "Normalización de la experiencia emocional humana",
            relatedPrinciple: "Reconocimiento de la Humanidad Compartida"
        ),
        TA2Quote(
            text: "Mi amor persiste ahora y para siempre, incluso cuando estoy cansada o me enfado",
            context: "Permanencia del vínculo a pesar de las dificultades",
            relatedPrinciple: "Permanencia del Vínculo"
        )
    ]
}

