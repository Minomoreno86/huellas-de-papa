import Foundation

/// Contenido ESPECÍFICO del libro "El Cerebro del Niño" de Daniel Siegel
/// Estas son las "Refrigerator Sheets" y contenido textual del libro

// MARK: - Refrigerator Sheet
struct CN5RefrigeratorSheet: Codable, Identifiable {
    let id: UUID
    let chapterNumber: Int
    let title: String
    let subtitle: String
    let keyPoints: [String]
    let whatToDo: [String]
    let agesAndStages: String
    
    init(chapterNumber: Int, title: String, subtitle: String, keyPoints: [String], whatToDo: [String], agesAndStages: String) {
        self.id = UUID()
        self.chapterNumber = chapterNumber
        self.title = title
        self.subtitle = subtitle
        self.keyPoints = keyPoints
        self.whatToDo = whatToDo
        self.agesAndStages = agesAndStages
    }
}

/// Hojas de refrigerador del libro (contenido textual de Siegel)
let cn5RefrigeratorSheets: [CN5RefrigeratorSheet] = [
    CN5RefrigeratorSheet(
        chapterNumber: 1,
        title: "Integración Horizontal",
        subtitle: "Ayudar a los hemisferios izquierdo y derecho a trabajar juntos",
        keyPoints: [
            "El hemisferio izquierdo del cerebro maneja la lógica y el lenguaje. El derecho procesa emociones y comunicación no verbal.",
            "En niños pequeños, el hemisferio derecho está más desarrollado, por eso son tan emocionales.",
            "La integración horizontal ocurre cuando ambos hemisferios trabajan juntos, permitiendo al niño ser tanto lógico como emocional."
        ],
        whatToDo: [
            "CONECTA Y REDIRIGE: Cuando tu hijo está alterado, primero conecta con su hemisferio derecho (contacto físico, tono empático, validación emocional). Solo después redirige con hemisferio izquierdo (lógica, palabras, solución).",
            "NOMBRA PARA DOMINAR: Ayuda a tu hijo a contar la historia de lo que pasó. Esto activa el hemisferio izquierdo lógico para dar sentido al hemisferio derecho emocional. Poner palabras a emociones reduce su intensidad.",
            "Recuerda: el orden importa. Primero hemisferio derecho (emoción), luego hemisferio izquierdo (lógica)."
        ],
        agesAndStages: "Todos los niños se benefician, pero es especialmente importante con niños pequeños (0-6 años) que son dominados por hemisferio derecho."
    ),
    
    CN5RefrigeratorSheet(
        chapterNumber: 2,
        title: "Integración Vertical",
        subtitle: "Ayudar al cerebro superior e inferior a trabajar juntos",
        keyPoints: [
            "El cerebro inferior (tronco y límbico) controla funciones básicas y reacciones instintivas. Está completamente desarrollado al nacer.",
            "El cerebro superior (corteza) permite razonamiento, regulación, empatía y toma de decisiones. No madura hasta los 25 años.",
            "Cuando el cerebro inferior 'secuestra' (berrinche, pánico), el superior está offline. No puedes razonar en ese momento."
        ],
        whatToDo: [
            "INVOLUCRA, NO ENFUREZCAS: En lugar de órdenes que activan cerebro inferior reactivo, involucra el superior con preguntas y opciones. '¿Qué crees que deberías hacer?' '¿Opción A o B?'",
            "ÚSALO O PIÉRDELO: Ejercita el cerebro superior como un músculo. Da oportunidades de decisión, planificación, consideración de consecuencias. Mientras más lo use, más fuerte se vuelve.",
            "MUÉVELO O PIÉRDELO: El movimiento físico puede cambiar el estado mental. Cuando el cerebro inferior domina, el movimiento ayuda a resetear y que el superior vuelva online.",
            "Recuerda: primero calma el cerebro inferior, luego involucra el superior."
        ],
        agesAndStages: "El cerebro superior tarda 25 años en madurar. Ten expectativas realistas según la edad. Un niño de 3 años tiene menos control que uno de 10."
    ),
    
    CN5RefrigeratorSheet(
        chapterNumber: 3,
        title: "Memoria",
        subtitle: "Ayudar a crear memorias integradas y sentido de identidad",
        keyPoints: [
            "Hay dos tipos de memoria: implícita (sensaciones, emociones sin palabras) y explícita (recuerdos conscientes con palabras).",
            "Los niños pequeños tienen memoria implícita antes de desarrollar explícita (2-3 años). Experiencias tempranas se almacenan como sensaciones sin contexto.",
            "Memorias implícitas no procesadas pueden disparar emociones intensas sin que el niño entienda por qué."
        ],
        whatToDo: [
            "USA EL CONTROL REMOTO MENTAL: Cuando tu hijo está abrumado, usa metáfora de control remoto. PAUSA (cálmate), REBOBINA (¿qué pasó?), AVANCE RÁPIDO (¿qué harás diferente?). Da perspectiva temporal.",
            "RECUERDA RECORDAR: Habla sobre el pasado ('¿Recuerdas cuando...?') y el futuro ('¿Qué harás mañana?'). Esto fortalece el hipocampo (memoria) y construye sentido de identidad coherente.",
            "Para experiencias traumáticas: ayuda a contar la historia completa con principio, medio y FIN. Esto convierte memoria implícita (emoción suelta) en explícita (narrativa procesada)."
        ],
        agesAndStages: "La memoria explícita comienza alrededor de 2-3 años. Antes de eso, todo es implícito. Los niños pequeños pueden tener miedo sin saber por qué (memoria implícita activada)."
    )
]

// MARK: - Book Examples
struct CN5BookExample: Codable, Identifiable {
    let id: UUID
    let title: String
    let pageReference: String           // "Capítulo 2, pág. 45"
    let situation: String
    let whatParentDid: String
    let result: String
    let lessonFromBook: String
    
    init(title: String, pageReference: String, situation: String, whatParentDid: String, result: String, lessonFromBook: String) {
        self.id = UUID()
        self.title = title
        self.pageReference = pageReference
        self.situation = situation
        self.whatParentDid = whatParentDid
        self.result = result
        self.lessonFromBook = lessonFromBook
    }
}

/// Ejemplos específicos que Daniel Siegel narra en el libro
let cn5BookExamples: [CN5BookExample] = [
    CN5BookExample(
        title: "El padre en el aeropuerto",
        pageReference: "Capítulo 1 - Integración Horizontal",
        situation: "Un padre en el aeropuerto cuyo hijo pequeño estaba teniendo un berrinche épico porque su padre no le dejó comprar un juguete. El niño gritaba, lloraba, se tiraba al piso. Todos miraban.",
        whatParentDid: "En lugar de gritar o amenazar, el padre se arrodilló, tomó a su hijo en brazos, y con voz muy calmada dijo: 'Sé que estás muy enojado. Querías ese juguete. Es muy difícil cuando no puedes tener algo que quieres.' Solo validación. Esperó. El niño se calmó en sus brazos. LUEGO habló sobre por qué no podían comprarlo.",
        result: "En 2-3 minutos, el berrinche terminó. El niño estaba calmado, conectado con su padre. Pudieron hablar racionalmente sobre la situación. Caminaron juntos tomados de la mano.",
        lessonFromBook: "CONECTA Y REDIRIGE: Primero conecta con el hemisferio derecho emocional (tono empático, contacto físico, validación). Solo cuando el niño está receptivo, redirige con hemisferio izquierdo (lógica, explicación). Esta secuencia calma el cerebro y permite integración."
    ),
    
    CN5BookExample(
        title: "La pesadilla de Marco",
        pageReference: "Capítulo 3 - Memoria",
        situation: "Marco, 5 años, empezó a tener terror nocturno después de ver una película de miedo. No podía dormir solo. Cada noche lloraba diciendo 'Tengo miedo' pero no podía explicar de qué.",
        whatParentDid: "Su madre le ayudó a contar la historia completa de la película: '¿Qué viste que te asustó? ¿Qué pasó primero? ¿Luego qué? ¿Y cómo terminó?' Dibujaron juntos la escena que más miedo le dio. Pusieron palabras a cada parte. Crearon un libro de 'La historia de la película de Marco' con principio, medio y fin claro.",
        result: "Después de contar la historia 3-4 veces en varios días, el miedo de Marco disminuyó dramáticamente. Pudo verbalizar: 'Era solo una película. Ya terminó.' Eventualmente volvió a dormir solo.",
        lessonFromBook: "NOMBRA PARA DOMINAR + RECUERDA RECORDAR: Las memorias aterradoras se almacenan como memoria implícita (sensaciones de miedo sin palabras). Al crear narrativa explícita con palabras y secuencia, el hipocampo puede 'empaquetar' la memoria. Esto reduce su poder emocional. El miedo se integra en lugar de controlar."
    ),
    
    CN5BookExample(
        title: "Katie y el control remoto de la mente",
        pageReference: "Capítulo 3 - Memoria",
        situation: "Katie, 7 años, estaba aterrorizada por una visita al dentista que tuvo hace semanas. Cada vez que pasaban cerca del consultorio dental en el carro, entraba en pánico. Lloraba, se ponía rígida, gritaba 'No quiero ir'.",
        whatParentDid: "Su padre usó la metáfora del control remoto: 'Katie, imagina que tienes un control remoto de tu mente. Presiona PAUSA. Ahora respira conmigo.' Respiraron. 'Ahora REBOBINA. ¿Qué pasó en el dentista?' Ella contó. 'AVANCE RÁPIDO. Ya pasó. Estás en el carro conmigo, segura. ¿Ves?' Le dio control sobre la memoria.",
        result: "Katie se calmó. La metáfora le dio sensación de control. Con práctica, ella misma empezó a usar 'pausa, rebobina, avance rápido' cuando se sentía abrumada por memorias. Desarrolló herramienta de regulación propia.",
        lessonFromBook: "USA EL CONTROL REMOTO MENTAL: Esta metáfora da al niño sensación de control sobre pensamientos y memorias. Le enseña que puede 'pausar' emociones intensas, 'rebobinar' para entender, 'avanzar rápido' para ver que pasará. Activa corteza prefrontal (control ejecutivo) sobre memoria."
    )
]

// MARK: - Reflection Questions
struct CN5ReflectionQuestion: Codable, Identifiable {
    let id: UUID
    let question: String
    let category: String
    let purpose: String
    
    init(question: String, category: String, purpose: String) {
        self.id = UUID()
        self.question = question
        self.category = category
        self.purpose = purpose
    }
}

/// Preguntas de reflexión que el libro propone para padres
let cn5ReflectionQuestions: [CN5ReflectionQuestion] = [
    CN5ReflectionQuestion(
        question: "¿Cómo reaccionas típicamente cuando tu hijo está emocionalmente desregulado? ¿Vas directo a lógica o primero conectas con su emoción?",
        category: "Conecta y Redirige",
        purpose: "Reflexionar sobre tu tendencia a usar hemisferio izquierdo (lógica) vs derecho (emoción) primero"
    ),
    CN5ReflectionQuestion(
        question: "Cuando tu hijo tiene un berrinche, ¿qué sientes en TU cuerpo? ¿Tu propio cerebro inferior se activa?",
        category: "Auto-regulación del Padre",
        purpose: "Tomar conciencia de tu propio estado cerebral antes de intentar co-regular a tu hijo"
    ),
    CN5ReflectionQuestion(
        question: "¿Das más órdenes directas o preguntas abiertas a tu hijo? ¿Cuál es el ratio?",
        category: "Involucrar Cerebro Superior",
        purpose: "Evaluar cuánto ejercitas vs. controlas el cerebro superior de tu hijo"
    ),
    CN5ReflectionQuestion(
        question: "Después de conflictos con tu hijo, ¿reparas la conexión o simplemente siguen con el día?",
        category: "Reparación Relacional",
        purpose: "Reflexionar sobre la importancia de reparar rupturas para apego seguro"
    ),
    CN5ReflectionQuestion(
        question: "¿Ayudas a tu hijo a contar historias de experiencias difíciles o tiendes a distraerlo y 'olvidarlo'?",
        category: "Procesamiento de Memoria",
        purpose: "Evaluar si facilitas integración de memorias o evitas procesamiento emocional"
    )
]

