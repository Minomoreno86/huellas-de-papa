import Foundation

/// Desarrollo cerebral por etapa de edad según el libro de Siegel
/// Qué esperar del cerebro según edad y cómo ajustar estrategias
struct CN6AgeStage: Codable, Identifiable {
    let id: UUID
    let ageRange: String                // "0-2 años", "3-5 años", etc.
    let stageName: String               // "Cerebro Sensoriomotor", etc.
    let brainDevelopment: String        // Qué está pasando en el cerebro
    let capabilities: [String]          // Qué PUEDE hacer a esta edad
    let limitations: [String]           // Qué NO puede hacer aún
    let strategiesRecommended: [Int]    // Qué estrategias enfatizar
    let realisticExpectations: String   // Expectativas ajustadas
    let parentalSupport: String         // Cómo apoyar este desarrollo
    let redFlags: String                // Señales de preocupación
    let icon: String
    let color: String
    
    init(ageRange: String, stageName: String, brainDevelopment: String, capabilities: [String], limitations: [String], strategiesRecommended: [Int], realisticExpectations: String, parentalSupport: String, redFlags: String, icon: String, color: String) {
        self.id = UUID()
        self.ageRange = ageRange
        self.stageName = stageName
        self.brainDevelopment = brainDevelopment
        self.capabilities = capabilities
        self.limitations = limitations
        self.strategiesRecommended = strategiesRecommended
        self.realisticExpectations = realisticExpectations
        self.parentalSupport = parentalSupport
        self.redFlags = redFlags
        self.icon = icon
        self.color = color
    }
}

/// Etapas de desarrollo cerebral según Siegel
let cn6AgeStages: [CN6AgeStage] = [
    CN6AgeStage(
        ageRange: "0-2 años",
        stageName: "Cerebro Sensoriomotor y Emocional",
        brainDevelopment: "El hemisferio DERECHO domina completamente. Tronco cerebral y sistema límbico (cerebro inferior) están desarrollados. Corteza prefrontal (cerebro superior) apenas comienza. Hipocampo (memoria explícita) no está online hasta 18-24 meses.",
        capabilities: [
            "Responder a tono de voz, contacto físico, expresiones faciales",
            "Sentir emociones intensas (miedo, alegría, frustración)",
            "Crear vínculos de apego basados en experiencias repetidas",
            "Memoria implícita (sensaciones corporales, emociones) sin palabras",
            "Regulación co-dependiente (necesita adulto para calmarse)"
        ],
        limitations: [
            "NO puede razonar o entender explicaciones lógicas complejas",
            "NO tiene memoria autobiográfica consciente antes de 2-3 años",
            "NO puede regular sus emociones independientemente",
            "NO entiende consecuencias a futuro o causa-efecto complejo",
            "NO puede 'portarse bien' porque no tiene corteza prefrontal desarrollada"
        ],
        strategiesRecommended: [1, 5, 11], // Conecta y Redirige, Movimiento, Diversión
        realisticExpectations: "Los bebés y niños pequeños NO están manipulando, siendo difíciles, o portándose mal. Su cerebro inferior domina. NECESITAN co-regulación constante. El llanto es comunicación, no manipulación. Tus respuestas empáticas están literalmente cableando su cerebro para seguridad.",
        parentalSupport: "TU CALMA es todo para un cerebro de 0-2 años. Tu presencia física, voz suave, contacto amoroso regulan su sistema nervioso. Estás construyendo las bases de integración cerebral futura. Responde a sus necesidades consistentemente - esto NO los 'malcría'; construye apego seguro.",
        redFlags: "Busca ayuda si: no responde a tu voz/contacto (6+ meses), no hace contacto visual (12+ meses), desarrollo motor muy retrasado, llanto inconsolable constante.",
        icon: "figure.child",
        color: "pink"
    ),
    
    CN6AgeStage(
        ageRange: "3-5 años",
        stageName: "Cerebro Preescolar - Hemisferio Derecho Dominante",
        brainDevelopment: "Hemisferio DERECHO sigue dominando (emocional, irracional, egocéntrico). Hemisferio izquierdo desarrollándose (palabras básicas). Corteza prefrontal muy inmadura (poca autorregulación). Hipocampo online (empiezan memorias conscientes). Amígdala MUY reactiva.",
        capabilities: [
            "Empezar a usar palabras para emociones (con ayuda)",
            "Memoria consciente de eventos (puede recordar lo que pasó ayer)",
            "Juego simbólico e imaginación rica",
            "Empatía muy básica emergiendo (pero aún muy egocéntrico)",
            "Seguir instrucciones simples de 2-3 pasos",
            "Control de esfínteres (cerebro inferior madurando)"
        ],
        limitations: [
            "NO puede razonar lógicamente en medio de emoción intensa",
            "NO tiene autorregulación emocional consistente",
            "NO puede considerar perspectivas complejas de otros (muy egocéntrico)",
            "NO entiende tiempo futuro más allá de 'mañana' o 'después'",
            "Berrinches IRRACIONALES porque hemisferio derecho domina",
            "NO puede compartir fácilmente (desarrollo moral muy inmaduro)"
        ],
        strategiesRecommended: [1, 2, 3, 5, 8], // Conecta, Nombra, Opciones, Movimiento, Nubes
        realisticExpectations: "Los preescolares NO están siendo difíciles a propósito. Su hemisferio derecho emocional domina al izquierdo lógico. Los berrinches sobre sándwich cortado, calcetín equivocado, o 'quiero a mamá no a papá' son NORMALES. No es lógico porque su cerebro no es lógico aún. Conecta con la emoción primero.",
        parentalSupport: "VALIDACIÓN CONSTANTE de emociones (incluso irracionales). Ayuda a poner PALABRAS a sentimientos ('Estás enojado', 'Eso te asustó'). Da opciones simples para ejercitar cerebro superior incipiente. Rutinas predecibles calman su cerebro. Tu paciencia con irracionalidad construye integración hemisférica.",
        redFlags: "Busca ayuda si: cero lenguaje a 3 años, agresión extrema incontrolable, cero interacción social, berrinches que duran horas diarias, regresión significativa en habilidades.",
        icon: "figure.play",
        color: "orange"
    ),
    
    CN6AgeStage(
        ageRange: "6-8 años",
        stageName: "Cerebro Escolar - Integración Emergiendo",
        brainDevelopment: "Hemisferio IZQUIERDO desarrollándose rápidamente (lógica, lectura, matemáticas). Hemisferio derecho sigue fuerte (emocional). Corteza prefrontal creciendo (mejor autorregulación pero inconsistente). Memoria autobiográfica sólida. Neuronas espejo activándose (empatía real emergiendo).",
        capabilities: [
            "Razonar lógicamente cuando está CALMADO",
            "Recordar experiencias y aprender de ellas",
            "Empatía real (puede considerar sentimientos de otros)",
            "Autorregulación en situaciones bajas en estrés",
            "Seguir reglas y entender consecuencias básicas",
            "Resolver problemas simples independientemente",
            "Expresar necesidades y emociones con palabras (mayormente)"
        ],
        limitations: [
            "TODAVÍA NO puede razonar cuando cerebro inferior está activado",
            "Autorregulación INCONSISTENTE (funciona a veces, falla otras)",
            "Control de impulsos limitado (cerebro superior inmaduro)",
            "Puede entender reglas pero no siempre puede seguirlas (brecha conocimiento-acción)",
            "Pensamiento todavía concreto (abstracto limitado)",
            "Planificación a largo plazo muy limitada"
        ],
        strategiesRecommended: [1, 2, 3, 4, 7, 9, 10], // Conecta, Nombra, Opciones, Úsalo, Recuerda, SIFT, Empatía
        realisticExpectations: "Los niños escolares pueden PARECER más maduros cognitivamente, pero su cerebro superior es MUY inmaduro aún. Pueden saber qué hacer y aún así no hacerlo (no es desafío; es cerebro en desarrollo). Necesitan MUCHO apoyo de regulación. No esperes consistencia que su cerebro no puede dar.",
        parentalSupport: "Ejercita su cerebro superior CONSTANTEMENTE con preguntas, opciones, oportunidades de decisión. Ayuda a procesar experiencias con narrativa. Enseña SIFT para autoconocimiento. Practica empatía con preguntas de perspectiva. Pero SIEMPRE conecta primero cuando hay emoción. Su cerebro superior sigue siendo frágil.",
        redFlags: "Busca ayuda si: agresión física constante incontrolable, ansiedad que interfiere con vida diaria, dificultades académicas severas, cero amistades/rechazo social extremo, mentiras compulsivas, conductas muy regresivas.",
        icon: "backpack.fill",
        color: "blue"
    ),
    
    CN6AgeStage(
        ageRange: "9-12 años",
        stageName: "Cerebro Pre-Adolescente - Desarrollo Acelerado",
        brainDevelopment: "Corteza prefrontal desarrollándose rápido pero AÚN muy inmadura. Amígdala MUY reactiva (pre-pubertad). Neuronas espejo fuertes (empatía compleja). Pensamiento abstracto emergiendo. Autoconsciencia aumentada (compara con otros). Hormonas empezando (emociones más intensas).",
        capabilities: [
            "Razonar de forma compleja cuando está regulado",
            "Planificar a mediano plazo (semanas, meses)",
            "Empatía sofisticada (puede considerar múltiples perspectivas)",
            "Autorregulación en situaciones normales",
            "Pensamiento abstracto básico (moralidad, justicia, futuro)",
            "Metacognición: pensar sobre su propio pensamiento",
            "Amistad compleja y navegación social"
        ],
        limitations: [
            "Control de impulsos TODAVÍA limitado (corteza prefrontal inmadura)",
            "Bajo estrés o emoción fuerte, cerebro inferior SIGUE dominando",
            "Autorregulación INCONSISTENTE (especialmente 10-12 con hormonas)",
            "Decisiones pueden ser impulsivas o basadas en emoción",
            "Susceptible a presión de pares (cerebro social muy activo)",
            "Puede tener razonamiento adulto a veces, niño otras (confuso para padres)"
        ],
        strategiesRecommended: [3, 4, 6, 7, 9, 10, 12], // Todas menos las más básicas
        realisticExpectations: "Pre-adolescentes son CONFUSOS: pueden razonar como adultos un momento y tener berrinche al siguiente. Esto es NORMAL. Su cerebro está en transición masiva. Hormonas añaden complejidad. Pueden SABER mejor pero no siempre HACER mejor. Sigue necesitando mucha guía y apoyo de regulación.",
        parentalSupport: "Trata como el adulto joven que está VOLVIÉNDOSE, no como el niño que FUE. Respeta su necesidad creciente de autonomía. Da más responsabilidad pero MANTÉN conexión. Usa todas las 12 estrategias flexiblemente. Conversaciones más complejas. Pero SIEMPRE conecta primero cuando hay emoción fuerte.",
        redFlags: "Busca ayuda si: depresión o ansiedad severa, conductas auto-lesivas, aislamiento social extremo, problemas académicos súbitos y severos, cambios de personalidad drásticos, consumo de sustancias.",
        icon: "figure.walk",
        color: "teal"
    ),
    
    CN6AgeStage(
        ageRange: "13-18 años",
        stageName: "Cerebro Adolescente - Remodelación Masiva",
        brainDevelopment: "REMODELACIÓN CEREBRAL MASIVA. Corteza prefrontal podándose y reorganizándose (temporalmente MENOS eficiente). Sistema límbico hipersensible (emociones intensas). Búsqueda de novedad y riesgo (dopamina). Cerebro social en máximo (opinión de pares muy importante).",
        capabilities: [
            "Pensamiento abstracto sofisticado",
            "Razonamiento moral complejo",
            "Planificación a largo plazo (cuando está motivado)",
            "Empatía profunda y perspectiva múltiple",
            "Autoconsciencia compleja (identidad en formación)",
            "Puede entender PERFECTAMENTE las 12 estrategias intelectualmente"
        ],
        limitations: [
            "Control de impulsos PEOR que a 10-12 años (corteza prefrontal reorganizándose)",
            "Toma de riesgos aumentada (búsqueda de novedad)",
            "Regulación emocional INCONSISTENTE (amígdala hipersensible)",
            "Puede saber perfectamente qué hacer y NO hacerlo (brecha enorme)",
            "Muy susceptible a influencia de pares (cerebro social dominante)",
            "Puede parecer 'regresivo' en regulación (no es regresión; es reorganización)"
        ],
        strategiesRecommended: [1, 4, 6, 9, 10, 12], // Conecta, Úsalo, Control Remoto, SIFT, Empatía, Reparación
        realisticExpectations: "Adolescentes NO son adultos con mal comportamiento. Su cerebro está en REMODELACIÓN MASIVA. La corteza prefrontal temporalmente es MENOS eficiente que a 10-11 años. Esto es BIOLOGÍA, no actitud. Necesitan MÁS apoyo de lo que parecen necesitar. El rechazo aparente esconde necesidad profunda de conexión.",
        parentalSupport: "MANTÉN CONEXIÓN a toda costa (aunque te rechacen superficialmente). Da autonomía creciente PERO mantén límites firmes con empatía. Trata como adulto joven que están volviéndose. Respeta su necesidad de privacidad y pares. Usa SIFT y empatía. Repara rupturas siempre. Sé el ancla estable mientras su cerebro está en tormenta.",
        redFlags: "Busca ayuda profesional si: depresión severa, pensamientos suicidas, autolesión, abuso de sustancias, trastornos alimentarios, conductas criminales, aislamiento total, cambios drásticos preocupantes.",
        icon: "figure.stand",
        color: "purple"
    ),
    
    CN6AgeStage(
        ageRange: "18-25 años",
        stageName: "Cerebro Joven Adulto - Maduración Final",
        brainDevelopment: "Corteza prefrontal FINALMENTE madurando completamente alrededor de 25 años. Integración de todas las partes del cerebro alcanzando madurez. Mielinización completándose (velocidad de procesamiento mejora). Identidad consolidándose.",
        capabilities: [
            "Control de impulsos maduro (generalmente)",
            "Planificación a largo plazo realista",
            "Toma de decisiones considerando consecuencias múltiples",
            "Autorregulación emocional consistente (la mayoría del tiempo)",
            "Empatía y perspectiva sofisticadas",
            "Identidad estable (saber quién es)"
        ],
        limitations: [
            "Aún puede haber momentos de impulsividad bajo estrés extremo",
            "Cerebro sigue siendo plástico (sigue aprendiendo y cambiando)",
            "Experiencias tempranas siguen influyendo (no desaparecen mágicamente a los 25)"
        ],
        strategiesRecommended: [4, 9, 10, 12], // A esta edad, son más para relaciones adulto-adulto
        realisticExpectations: "El cerebro NO madura completamente hasta 25 años aproximadamente. Jóvenes adultos (18-23) pueden PARECER adultos pero su cerebro aún está madurando. Ten paciencia con decisiones que no entiendes. La corteza prefrontal es la última área en madurar.",
        parentalSupport: "Tu rol cambia de 'regulador' a 'consultor'. Respeta su autonomía mientras ofreces perspectiva. Las 12 estrategias se vuelven herramientas para RELACIÓN ADULTA no crianza directiva. Mantén conexión, permite errores, apoya sin rescatar.",
        redFlags: "A esta edad, los retos son más de salud mental adulta: depresión, ansiedad, adicciones, relaciones tóxicas. El apoyo profesional es normal y saludable.",
        icon: "figure.walk.arrival",
        color: "mint"
    )
]

