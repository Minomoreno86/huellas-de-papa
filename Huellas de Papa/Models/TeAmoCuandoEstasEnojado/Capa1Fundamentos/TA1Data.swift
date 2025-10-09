import Foundation

/// Datos de la Capa 1 - Fundamentos
/// Basado 100% en el libro "¡Te amo cuando estás enojado!" de Erin Winters
/// Fuente: Análisis del cuento sobre manejo de emociones y amor incondicional

extension TA1Pillar {
    static let allPillars: [TA1Pillar] = [
        TA1Pillar(
            name: "Amor Incondicional",
            definition: "Te amo en todas tus emociones, sin importar cómo te sientas",
            bookQuote: "Te amo cuando estás enojado, triste, alegre, melancólico",
            parentalExample: "Acepto todas tus emociones como válidas y dignas de amor"
        ),
        TA1Pillar(
            name: "Permanencia del Vínculo",
            definition: "Mi amor es constante, ahora y para siempre",
            bookQuote: "Mi amor persiste incluso en días difíciles, incluso cuando estoy cansado",
            parentalExample: "Estoy aquí para ti sin importar las circunstancias"
        ),
        TA1Pillar(
            name: "Humanidad Compartida",
            definition: "Reconozco que todos tenemos días buenos y malos",
            bookQuote: "Ser humano implica tener días buenos y malos",
            parentalExample: "Valido tus respuestas emocionales naturales como parte de ser humano"
        ),
        TA1Pillar(
            name: "Consuelo y Resolución",
            definition: "Los días difíciles terminan, el abrazo siempre está",
            bookQuote: "Los días difíciles terminan, al igual que los buenos",
            parentalExample: "Ofrezco palabras dulces y abrazos antes de dormir"
        )
    ]
}

extension TA1Section {
    static let allSections: [TA1Section] = [
        TA1Section(
            title: "La Condición Humana",
            subtitle: "Días Buenos y Días Malos",
            description: "El libro establece que ser un ser humano implica inherentemente tener días buenos y malos. Esta es una verdad universal que debemos aceptar tanto en nosotros como en nuestros hijos.",
            keyIdea: "Normaliza las emociones difíciles como parte natural de la vida"
        ),
        TA1Section(
            title: "Universalidad de la Emoción",
            subtitle: "Todo el Mundo Tiene Emociones",
            description: "Se reconoce que las emociones son universales y que todos las experimentamos. No hay emociones 'buenas' o 'malas', todas son válidas y merecen ser reconocidas.",
            keyIdea: "Todas las emociones son válidas y merecen ser nombradas"
        ),
        TA1Section(
            title: "Complejidad Emocional",
            subtitle: "Es Difícil Saber lo que Sentimos",
            description: "El libro reconoce que, en ocasiones, es difícil saber lo que estamos sintiendo y por qué. Esta complejidad es normal tanto para niños como para adultos.",
            keyIdea: "La educación emocional es clave para entender nuestros sentimientos"
        ),
        TA1Section(
            title: "Amor que Trasciende",
            subtitle: "El Amor a Través de Todo",
            description: "El amor incondicional se mantiene constante a pesar y a través de toda la gama de emociones y comportamientos difíciles que pueda manifestar el niño.",
            keyIdea: "Tu amor no depende del comportamiento de tu hijo"
        )
    ]
}

extension TA1Example {
    static let allExamples: [TA1Example] = [
        TA1Example(
            scenario: "Cuando hace berrinches",
            emotionalState: "Enojado, frustrado, desbordado",
            unconditionalResponse: "Te amo cuando estás enojado y haces berrinches",
            insight: "El amor persiste incluso cuando el comportamiento es difícil"
        ),
        TA1Example(
            scenario: "Cuando llora sin palabras",
            emotionalState: "Triste, sin capacidad de expresión verbal",
            unconditionalResponse: "Te amo cuando lloras y no tienes las palabras para pedir lo que quieres",
            insight: "El amor no requiere que el niño se exprese perfectamente"
        ),
        TA1Example(
            scenario: "Cuando se esconde en su habitación",
            emotionalState: "Necesita espacio, abrumado, melancólico",
            unconditionalResponse: "Te amo cuando te escondes en tu habitación, me encanta tu tiempo a solas",
            insight: "Respeto su necesidad de soledad como válida"
        ),
        TA1Example(
            scenario: "Ese suspiro molesto y pesado",
            emotionalState: "Fastidiado, cansado, irritado",
            unconditionalResponse: "Te amo incluso con ese suspiro molesto",
            insight: "Valido sus expresiones emocionales naturales, incluso las molestas"
        ),
        TA1Example(
            scenario: "Cuando ambos están derrotados",
            emotionalState: "Ambos cansados y sin energía",
            unconditionalResponse: "Te amo incluso cuando ambos estamos derrotados",
            insight: "El amor mutuo se sostiene en momentos de agotamiento compartido"
        ),
        TA1Example(
            scenario: "Cuando el padre también está enfadado",
            emotionalState: "El padre también experimenta emociones difíciles",
            unconditionalResponse: "Te amo incluso cuando yo estoy cansada o me enfado",
            insight: "Modelar que los adultos también tienen emociones y aun así aman"
        )
    ]
}

extension TA1Quote {
    static let allQuotes: [TA1Quote] = [
        TA1Quote(
            text: "Este libro es para cualquier persona, joven o viejo, que se siente frustrado al descubrir que es de hecho un ser humano teniendo días buenos y malos",
            context: "Reconocimiento de la humanidad compartida"
        ),
        TA1Quote(
            text: "Todo el mundo tiene emociones, y en ocasiones es difícil saber lo que estamos sintiendo y por qué",
            context: "Validación de la complejidad emocional"
        ),
        TA1Quote(
            text: "Aprender sobre nuestras emociones es clave",
            context: "Importancia de la educación emocional"
        ),
        TA1Quote(
            text: "Hablar de ellas con alguien de confianza puede ayudar",
            context: "Herramienta: comunicación con confianza"
        )
    ]
}

