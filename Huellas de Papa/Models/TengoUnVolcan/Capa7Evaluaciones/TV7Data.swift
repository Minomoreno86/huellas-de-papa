import Foundation

/// Datos de autoevaluación para padres
/// Basado en los conceptos del libro de Míriam Tirado
struct TV7Data {
    
    // MARK: - Preguntas de Autoevaluación
    
    struct EvaluationQuestion: Identifiable {
        let id = UUID()
        let category: String
        let text: String
        let scaleLabels: (low: String, high: String)?
        let relatedCapa: String
        let feedback: Feedback
        
        struct Feedback {
            let high: String // Retroalimentación para respuesta 4-5
            let medium: String // Para 3
            let low: String // Para 1-2
        }
    }
    
    static let evaluationQuestions: [EvaluationQuestion] = [
        // CATEGORÍA: COMPRENSIÓN DEL MODELO
        EvaluationQuestion(
            category: "Comprensión",
            text: "¿Puedo identificar en qué fase del volcán está mi hijo? (Chispa, Burbujeo, Erupción)",
            scaleLabels: (low: "Nunca", high: "Siempre"),
            relatedCapa: "Capa 1 > Las 3 Fases del Volcán",
            feedback: EvaluationQuestion.Feedback(
                high: "¡Excelente! Identificar la fase temprano permite intervención efectiva. Sigue usando tu observación.",
                medium: "Estás aprendiendo. Repasa las señales físicas de cada fase en Capa 1 para mejorar tu detección.",
                low: "Repasa Capa 1: Las 3 Fases y el Mapa Físico del Volcán. Practica observar las señales corporales de tu hijo."
            )
        ),
        
        EvaluationQuestion(
            category: "Comprensión",
            text: "¿Puedo identificar qué botón se presionó cuando el volcán de mi hijo se enciende?",
            scaleLabels: (low: "Rara vez", high: "Casi siempre"),
            relatedCapa: "Capa 2 > Los 4 Botones del Volcán",
            feedback: EvaluationQuestion.Feedback(
                high: "Perfecto. Identificar el botón permite responder con empatía ('Veo que te sientes frustrado') en lugar de con castigo.",
                medium: "Sigue practicando. Después de cada volcán, pregúntate: ¿Fue injusticia, frustración, no conseguir lo que quiere, o emoción enmascarada?",
                low: "Repasa Capa 2: Los 4 Botones. Identifica cuál es más frecuente en tu hijo para anticiparlo."
            )
        ),
        
        EvaluationQuestion(
            category: "Comprensión",
            text: "¿Reconozco las nubes de humo (pensamientos negativos) que alimentan el volcán de mi hijo?",
            scaleLabels: (low: "No las identifico", high: "Las identifico claramente"),
            relatedCapa: "Capa 2 > Nubes de Humo vs Aire Fresco",
            feedback: EvaluationQuestion.Feedback(
                high: "Genial. Escuchas cuando tu hijo dice 'Siempre', 'Nunca', 'Lo hace a propósito'. Ahora ayúdale a cazarlas.",
                medium: "Empieza a escuchar palabras clave: 'Siempre', 'Nunca', 'Nadie', 'Todo'. Son nubes de humo.",
                low: "Repasa Capa 2: Patrones de Pensamiento. Aprende a detectar generalizaciones y pensamientos distorsionados."
            )
        ),
        
        // CATEGORÍA: APLICACIÓN DE HERRAMIENTAS
        EvaluationQuestion(
            category: "Aplicación",
            text: "¿Uso el Botón de Pausa (respiración) con mi hijo cuando veo señales tempranas?",
            scaleLabels: (low: "Nunca", high: "Frecuentemente"),
            relatedCapa: "Capa 3 > El Botón de Pausa",
            feedback: EvaluationQuestion.Feedback(
                high: "¡Excelente! La intervención temprana previene erupciones. Sigue usando esta herramienta fundamental.",
                medium: "La estás usando a veces. Intenta usarla ANTES de que llegue a Erupción. En Chispa y Burbujeo es más efectiva.",
                low: "Repasa Capa 3: El Botón de Pausa. Practica cuando ambos estén tranquilos para que esté lista en crisis."
            )
        ),
        
        EvaluationQuestion(
            category: "Aplicación",
            text: "¿Ofrezco el Paraguas Mágico (espacio) cuando mi hijo está desbordado?",
            scaleLabels: (low: "No lo ofrezco", high: "Lo ofrezco consistentemente"),
            relatedCapa: "Capa 3 > El Paraguas Mágico",
            feedback: EvaluationQuestion.Feedback(
                high: "Perfecto. Respetar su necesidad de espacio es ser su fuente de calma. Sigue validando esta necesidad.",
                medium: "Ofrécelo más. Di: '¿Necesitas ir a tu cuarto/jardín secreto?' Dale permiso de alejarse sin sentir que es castigo.",
                low: "Repasa Capa 3: El Paraguas Mágico. Alejarse NO es huir, es autocuidado. Facilita un espacio seguro en casa."
            )
        ),
        
        EvaluationQuestion(
            category: "Aplicación",
            text: "¿Ayudo a mi hijo a cazar nubes de humo y cambiarlas por aire fresco?",
            scaleLabels: (low: "No lo hago", high: "Lo practico regularmente"),
            relatedCapa: "Capa 3 > Caza de Nubes",
            feedback: EvaluationQuestion.Feedback(
                high: "Genial. La reestructuración cognitiva cambia patrones de pensamiento a largo plazo. Sigue cuestionando con gentileza.",
                medium: "Practica más. Cuando oigas 'Siempre', 'Nunca', pregunta: '¿De verdad SIEMPRE?' Ayúdale a pensar con claridad.",
                low: "Repasa Capa 3: Caza de Nubes. Esta herramienta reduce la intensidad del volcán cambiando pensamientos distorsionados."
            )
        ),
        
        // CATEGORÍA: MODELAJE (TU PROPIA REGULACIÓN)
        EvaluationQuestion(
            category: "Modelaje",
            text: "¿ME REGULO YO PRIMERO antes de intentar calmar a mi hijo?",
            scaleLabels: (low: "Mi volcán también explota", high: "Respiro primero"),
            relatedCapa: "Capa 3 > La Fuente de la Calma",
            feedback: EvaluationQuestion.Feedback(
                high: "Crucial. Si tú estás regulado/a, puedes ser su fuente de calma. Tu regulación es el fundamento de la de tu hijo.",
                medium: "Estás intentando, pero a veces tu volcán también explota. Está bien. Reconócelo después y repara. Practica TU Botón de Pausa.",
                low: "Esta es la clave más importante: No puedes calmar si tú estás desbordado/a. Respira 3 veces ANTES de intervenir."
            )
        ),
        
        EvaluationQuestion(
            category: "Modelaje",
            text: "¿Uso 'Yo siento...' (Las Palabras Mágicas) en MI propia comunicación frente a mi hijo?",
            scaleLabels: (low: "Digo 'Tú siempre...'", high: "Digo 'Yo me siento...'"),
            relatedCapa: "Capa 3 > Las Palabras Mágicas",
            feedback: EvaluationQuestion.Feedback(
                high: "Perfecto. Los niños aprenden comunicación asertiva VIÉNDOTE. Tú eres el mejor maestro/a.",
                medium: "A veces lo haces. Cuando te enojes, antes de decir 'Tú siempre...', cámbialo por 'Yo me siento frustrado/a cuando...'",
                low: "Repasa Capa 3: Las Palabras Mágicas. Modela primero. No puedes enseñar lo que no practicas."
            )
        ),
        
        EvaluationQuestion(
            category: "Modelaje",
            text: "¿Me disculpo con mi hijo cuando MI volcán explota?",
            scaleLabels: (low: "No me disculpo", high: "Reconozco mi error"),
            relatedCapa: "Capa 3 > El Botón de la Disculpa",
            feedback: EvaluationQuestion.Feedback(
                high: "Esto es modelaje poderoso. Les enseñas que los adultos también cometen errores Y los reparan. Valentía.",
                medium: "Hazlo más. 'Perdón por gritarte. Mi volcán explotó. No estuvo bien'. Esta vulnerabilidad construye confianza.",
                low: "Los adultos también tienen volcanes. Reconócelo. Tus disculpas enseñan responsabilidad emocional."
            )
        ),
        
        // CATEGORÍA: CO-REGULACIÓN
        EvaluationQuestion(
            category: "Co-regulación",
            text: "¿Valido la emoción de mi hijo SIN validar el comportamiento destructivo?",
            scaleLabels: (low: "No distingo", high: "Separo claramente"),
            relatedCapa: "Capa 2 > Principio de Aceptación Emocional",
            feedback: EvaluationQuestion.Feedback(
                high: "Perfecto. 'Está bien que estés enojado/a. No está bien golpear'. Validas emoción, pones límite a acción.",
                medium: "Practica más: 'Entiendo que estés frustrado/a (validación) pero no puedes lanzar cosas (límite)'.",
                low: "Repasa: La rabia es VÁLIDA. El comportamiento destructivo NO. Separa ambos en tu respuesta."
            )
        ),
        
        EvaluationQuestion(
            category: "Co-regulación",
            text: "¿Espero a que mi hijo esté calmado ANTES de enseñar/explicar/razonar?",
            scaleLabels: (low: "Razono durante la crisis", high: "Espero a la calma"),
            relatedCapa: "Capa 5 > Protocolo de Erupción",
            feedback: EvaluationQuestion.Feedback(
                high: "Crucial. Durante erupción: ACOMPAÑA. Después: ENSEÑA. El orden correcto previene frustración mutua.",
                medium: "A veces intentas razonar en caliente. Recuerda: cerebro en erupción NO puede aprender. Primero regula, después educa.",
                low: "Regla de oro: NO enseñes durante la crisis. Primero calma (tuya y de tu hijo), LUEGO conversación. Repasa Protocolo de Erupción."
            )
        ),
        
        EvaluationQuestion(
            category: "Co-regulación",
            text: "¿Estoy presente física y emocionalmente cuando mi hijo tiene un volcán?",
            scaleLabels: (low: "Lo dejo solo/me voy", high: "Acompaño su emoción"),
            relatedCapa: "Capa 3 > La Fuente de la Calma",
            feedback: EvaluationQuestion.Feedback(
                high: "Eres su fuente de calma. Tu presencia regulada regula su sistema nervioso. Co-regulación efectiva.",
                medium: "A veces estás presente. Intenta siempre ofrecer: '¿Necesitas un abrazo? ¿Que esté contigo? ¿O espacio?' Respeta su respuesta.",
                low: "Los niños pequeños NO pueden autorregularse solos. Necesitan tu presencia. Repasa: La Fuente de la Calma."
            )
        ),
        
        // CATEGORÍA: PREVENCIÓN
        EvaluationQuestion(
            category: "Prevención",
            text: "¿Cumplo consistentemente las 6 básicas? (Sueño, comida, movimiento, conexión, calma, límites)",
            scaleLabels: (low: "Menos de 3/día", high: "Las 6 diarias"),
            relatedCapa: "Capa 3 > Regar mi Jardín Interior",
            feedback: EvaluationQuestion.Feedback(
                high: "Esto es el fundamento. El 80% de volcanes se previenen con las 6 básicas. Sigue priorizándolas.",
                medium: "Mejora esto. Las 6 básicas NO son opcionales, son NECESIDADES. Identifica cuál falta y priorízala.",
                low: "Esta es la causa raíz de volcanes frecuentes. ANTES de herramientas complejas, cumple las 6 básicas. Son lo más importante."
            )
        ),
        
        EvaluationQuestion(
            category: "Prevención",
            text: "¿Tengo tiempo de conexión 1-a-1 diario (10-15 min) con mi hijo?",
            scaleLabels: (low: "Rara vez", high: "Diariamente"),
            relatedCapa: "Capa 3 > Regar mi Jardín (Conexión)",
            feedback: EvaluationQuestion.Feedback(
                high: "Un tanque emocional lleno = menos volcanes. Este tiempo es inversión, no gasto. Sigue conectando.",
                medium: "Intenta ser más consistente. Aunque sea 10 min, que sean SIN pantallas, SIN distracciones. Calidad > cantidad.",
                low: "Tanque emocional vacío = volcanes frecuentes. Prioriza 10-15 min diarios de juego 1-a-1. Es prevención crítica."
            )
        ),
        
        EvaluationQuestion(
            category: "Prevención",
            text: "¿Soy consistente con los límites? (Digo lo que hago, hago lo que digo)",
            scaleLabels: (low: "Inconsistente", high: "Muy consistente"),
            relatedCapa: "Capa 3 > Regar mi Jardín (Consistencia)",
            feedback: EvaluationQuestion.Feedback(
                high: "La consistencia da seguridad. Los niños saben qué esperar. Esto previene muchos volcanes.",
                medium: "La inconsistencia confunde y genera volcanes. Si dices 'no', mantén el no. Si dices 'a las 8 dormimos', que sea a las 8.",
                low: "Establece 3-5 reglas claras, escríbelas, cúmplelas CON AMOR pero SIN excepciones. Predictibilidad = menos volcanes."
            )
        ),
        
        // CATEGORÍA: REPARACIÓN
        EvaluationQuestion(
            category: "Reparación",
            text: "¿Guío a mi hijo en reparaciones después de erupciones? (Disculpa + Acción concreta)",
            scaleLabels: (low: "Solo castigo", high: "Guío reparación"),
            relatedCapa: "Capa 3 > Botones de Disculpa y Reparación",
            feedback: EvaluationQuestion.Feedback(
                high: "La reparación construye responsabilidad. No castigas, empoderas. Tu hijo aprende que los errores se arreglan.",
                medium: "Recuerda: Disculpa sincera (no forzada) + Acción concreta = Reparación completa. Guía ambas partes.",
                low: "Repasa Capa 3: Reparación. Castigo NO enseña. Reparación SÍ. Cambia 'Estás castigado' por '¿Cómo arreglas esto?'"
            )
        ),
        
        // CATEGORÍA: REFLEXIÓN PERSONAL
        EvaluationQuestion(
            category: "Reflexión",
            text: "¿Cuido MI propio jardín interior? (Duermo, como bien, tengo tiempo para mí, me regulo)",
            scaleLabels: (low: "Estoy desbordado/a", high: "Me cuido bien"),
            relatedCapa: "Capa 3 > Regar mi Jardín (Modelaje)",
            feedback: EvaluationQuestion.Feedback(
                high: "Tu bienestar permite cuidar a tu hijo. Un padre regulado cría hijos regulados. Sigue cuidándote.",
                medium: "Si tú estás desbordado/a, tu hijo lo absorbe. Prioriza: dormir, comer, descansar. No es egoísmo, es necesidad.",
                low: "No puedes dar lo que no tienes. Riega TU jardín para poder regar el de tu hijo. Pide ayuda si la necesitas."
            )
        )
    ]
    
    // MARK: - Feedback General según Puntaje Total
    
    static func overallFeedback(score: Double) -> (message: String, recommendations: [String]) {
        switch score {
        case 90...100:
            return (
                message: "¡Excelente dominio del modelo del volcán! Estás aplicando las enseñanzas del libro de forma consistente y reflexiva. Tu hijo tiene un acompañante emocional muy capaz.",
                recommendations: [
                    "Continúa con tu práctica consistente",
                    "Comparte tus aprendizajes con otros padres",
                    "Sigue reflexionando y ajustando según tu hijo crece"
                ]
            )
            
        case 70...89:
            return (
                message: "Muy buen nivel de comprensión y aplicación. Tienes las bases sólidas del modelo. Hay áreas específicas donde puedes mejorar.",
                recommendations: [
                    "Revisa las categorías con puntaje más bajo",
                    "Practica las herramientas que menos usas",
                    "Sigue aprendiendo y aplicando consistentemente"
                ]
            )
            
        case 50...69:
            return (
                message: "Estás en proceso de aprendizaje. Comprendes el modelo pero la aplicación necesita más práctica y consistencia.",
                recommendations: [
                    "Repasa Capas 1 y 2 para reforzar comprensión",
                    "Escoge 2-3 herramientas y domínalas antes de usar todas",
                    "Prioriza las 6 básicas - son el fundamento",
                    "Sé paciente contigo mismo/a. Es un proceso"
                ]
            )
            
        default:
            return (
                message: "Estás comenzando este camino. El modelo del volcán requiere estudio y práctica. No te desanimes, cada padre empieza aquí.",
                recommendations: [
                    "Comienza repasando Capa 1: Fundamentos",
                    "Enfócate en UNA herramienta: El Botón de Pausa",
                    "Prioriza las 6 básicas ANTES que herramientas avanzadas",
                    "Cuida tu propio jardín interior primero",
                    "Pide ayuda si te sientes desbordado/a",
                    "Recuerda: el volcán de tu hijo no define tu valor como padre/madre"
                ]
            )
        }
    }
}

