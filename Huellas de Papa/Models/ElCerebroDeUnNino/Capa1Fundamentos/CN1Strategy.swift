import Foundation

/// Modelo que representa una de las 12 estrategias del libro
/// Cada estrategia es una herramienta práctica de crianza basada en neurociencia
struct CN1Strategy: Codable, Identifiable {
    let id: UUID
    let number: Int
    let title: String
    let shortDescription: String
    let fullDescription: String
    let brainFocus: String // Qué parte del cerebro trabaja
    let ageRange: String
    let icon: String
    
    init(number: Int, title: String, shortDescription: String, fullDescription: String, brainFocus: String, ageRange: String, icon: String) {
        self.id = UUID()
        self.number = number
        self.title = title
        self.shortDescription = shortDescription
        self.fullDescription = fullDescription
        self.brainFocus = brainFocus
        self.ageRange = ageRange
        self.icon = icon
    }
}

/// Las 12 estrategias revolucionarias del libro "El Cerebro del Niño"
let cn1Strategies: [CN1Strategy] = [
    CN1Strategy(
        number: 1,
        title: "Conecta y Redirige",
        shortDescription: "Conecta emocionalmente antes de corregir",
        fullDescription: "Cuando tu hijo está alterado, primero conecta con su hemisferio derecho emocional antes de apelar a su hemisferio izquierdo lógico. Arrodíllate a su altura, habla con voz calmada, valida sus emociones. Solo cuando esté receptivo, redirige hacia el comportamiento apropiado.",
        brainFocus: "Integración hemisferio izquierdo-derecho",
        ageRange: "0-18 años",
        icon: "heart.circle.fill"
    ),
    CN1Strategy(
        number: 2,
        title: "Nombra para Dominar",
        shortDescription: "Ayúdale a contar su historia",
        fullDescription: "Cuando un niño experimenta emociones intensas o eventos traumáticos, ayúdale a contar la historia completa usando palabras (hemisferio izquierdo) y emociones (hemisferio derecho). Esto integra la experiencia y reduce su poder emocional.",
        brainFocus: "Integración hemisferio izquierdo-derecho",
        ageRange: "3-18 años",
        icon: "text.bubble.fill"
    ),
    CN1Strategy(
        number: 3,
        title: "Involucra, No Enfurezcas",
        shortDescription: "Apela al cerebro superior",
        fullDescription: "En lugar de gritar órdenes que activan el cerebro inferior reactivo, involucra el cerebro superior con preguntas, opciones y negociación. '¿Qué crees que deberíamos hacer?' o '¿Quieres cepillarte los dientes antes o después del pijama?'",
        brainFocus: "Activación del cerebro superior",
        ageRange: "2-18 años",
        icon: "brain.head.profile"
    ),
    CN1Strategy(
        number: 4,
        title: "Úsalo o Piérdelo",
        shortDescription: "Ejercita el cerebro superior",
        fullDescription: "El cerebro superior (toma de decisiones, empatía, autorregulación) necesita ejercitarse. Proporciona oportunidades para practicar: decisiones apropiadas para su edad, resolver problemas, considerar consecuencias, pensar en los demás.",
        brainFocus: "Desarrollo del cerebro superior",
        ageRange: "3-18 años",
        icon: "dumbbell.fill"
    ),
    CN1Strategy(
        number: 5,
        title: "Muévelo o Piérdelo",
        shortDescription: "El movimiento cambia el estado mental",
        fullDescription: "Cuando el cerebro inferior ha secuestrado a tu hijo (berrinche, pánico), el movimiento físico puede cambiar su estado. Salta, baila, corre, haz ejercicio. El movimiento ayuda a resetear el cerebro y recuperar el control.",
        brainFocus: "Regulación cerebro inferior-superior",
        ageRange: "1-18 años",
        icon: "figure.run"
    ),
    CN1Strategy(
        number: 6,
        title: "Usa el Control Remoto Mental",
        shortDescription: "Pausa, rebobina y avanza rápido",
        fullDescription: "Cuando tu hijo está abrumado, usa metáforas de control remoto: Pausa (cálmate), Rebobina (revisa qué salió mal), Avance rápido (¿qué harías diferente la próxima vez?). Esto da perspectiva y control sobre experiencias difíciles.",
        brainFocus: "Integración y reflexión",
        ageRange: "4-18 años",
        icon: "playpause.fill"
    ),
    CN1Strategy(
        number: 7,
        title: "Recuerda Recordar",
        shortDescription: "Ejercita la memoria para integración",
        fullDescription: "Ayuda a tu hijo a recordar experiencias pasadas y hacer planes futuros. Esto fortalece la memoria y ayuda a crear un sentido coherente de identidad. 'Recuerdas cuando...' o 'La próxima vez que...'",
        brainFocus: "Memoria e integración temporal",
        ageRange: "3-18 años",
        icon: "clock.arrow.circlepath"
    ),
    CN1Strategy(
        number: 8,
        title: "Deja que las Nubes de las Emociones Pasen",
        shortDescription: "Las emociones son temporales",
        fullDescription: "Enseña a tu hijo que las emociones son como nubes: vienen y van. No son permanentes. Cuando está triste o enojado, recuérdale que esta emoción pasará. Valida el sentimiento pero ofrece perspectiva.",
        brainFocus: "Regulación emocional",
        ageRange: "3-18 años",
        icon: "cloud.fill"
    ),
    CN1Strategy(
        number: 9,
        title: "SIFT (Sensaciones, Imágenes, Sentimientos, Pensamientos)",
        shortDescription: "Conciencia de la experiencia interna",
        fullDescription: "Ayuda a tu hijo a tomar conciencia de su mundo interior preguntando sobre Sensaciones corporales, Imágenes mentales, Sentimientos emocionales y Pensamientos. Esto desarrolla autoconocimiento y regulación emocional.",
        brainFocus: "Conciencia interna y mindfulness",
        ageRange: "5-18 años",
        icon: "eye.fill"
    ),
    CN1Strategy(
        number: 10,
        title: "Ejercita la Visión de la Mente",
        shortDescription: "Desarrolla empatía y perspectiva",
        fullDescription: "Ayuda a tu hijo a considerar la perspectiva de otros. '¿Cómo crees que se sintió tu hermana cuando...?' Esto ejercita la empatía y el entendimiento social, habilidades clave del cerebro superior.",
        brainFocus: "Empatía y teoría de la mente",
        ageRange: "4-18 años",
        icon: "person.2.fill"
    ),
    CN1Strategy(
        number: 11,
        title: "Incrementa el Factor Diversión Familiar",
        shortDescription: "La conexión alegre fortalece el cerebro",
        fullDescription: "El tiempo de calidad, juego y risas en familia no solo crea recuerdos felices, sino que literalmente fortalece las conexiones neuronales relacionadas con la felicidad, seguridad y resiliencia. Prioriza la diversión.",
        brainFocus: "Conexión y neuroplasticidad positiva",
        ageRange: "0-18 años",
        icon: "face.smiling.fill"
    ),
    CN1Strategy(
        number: 12,
        title: "Conéctate a Través del Conflicto",
        shortDescription: "Los conflictos son oportunidades de conexión",
        fullDescription: "En lugar de evitar o escalar conflictos, úsalos como oportunidades para enseñar resolución de problemas, reparación relacional y resiliencia. Modela cómo manejar desacuerdos con respeto y empatía.",
        brainFocus: "Habilidades sociales y reparación",
        ageRange: "3-18 años",
        icon: "arrow.triangle.2.circlepath"
    )
]

