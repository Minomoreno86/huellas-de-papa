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
    ),
    
    CN5RefrigeratorSheet(
        chapterNumber: 4,
        title: "Integración de Estados",
        subtitle: "Las emociones son temporales",
        keyPoints: [
            "Los estados mentales (alegría, tristeza, enojo) son temporales, no permanentes.",
            "Los niños a menudo sienten que una emoción durará para siempre ('Siempre estaré triste', 'Nunca me va bien').",
            "Enseñar que las emociones son como nubes que pasan desarrolla resiliencia emocional."
        ],
        whatToDo: [
            "DEJA QUE LAS NUBES DE EMOCIONES PASEN: Cuando tu hijo está en emoción intensa, usa la metáfora: 'Las emociones son como nubes en el cielo. Esta es una nube grande de tristeza ahora. Las nubes vienen y van.' Respiren juntos y observen cómo la emoción cambia.",
            "SIFT - Sensaciones, Imágenes, Sentimientos, Pensamientos: Ayuda a tu hijo a observar su mundo interior. '¿Qué sientes en tu cuerpo? ¿Qué imágenes ves en tu mente? ¿Qué emociones? ¿Qué pensamientos?' Esto desarrolla autoconocimiento y capacidad de observar emociones sin ser arrastrado.",
            "Enseña que los estados cambian: 'Hace 10 minutos estabas muy enojado. Ahora estás más calmado. ¿Ves? Las emociones cambian.'"
        ],
        agesAndStages: "Especialmente importante 4-12 años cuando los niños empiezan a tener emociones más complejas y pensamientos sobre sus emociones."
    ),
    
    CN5RefrigeratorSheet(
        chapterNumber: 5,
        title: "Integración Interpersonal",
        subtitle: "Conectar con otros desarrolla el cerebro social",
        keyPoints: [
            "Los humanos somos seres sociales. Nuestro cerebro está diseñado para conectar con otros.",
            "Las neuronas espejo nos permiten 'sentir' lo que otros sienten. Así se desarrolla empatía.",
            "Los niños aprenden habilidades sociales a través de relaciones, especialmente con los padres."
        ],
        whatToDo: [
            "EJERCITA LA VISIÓN DE LA MENTE (Mindsight): Ayuda a tu hijo a considerar perspectivas de otros. '¿Cómo crees que se sintió ella cuando...?' '¿Qué crees que estaba pensando?' Cada pregunta ejercita neuronas espejo y corteza prefrontal medial (empatía).",
            "INCREMENTA EL FACTOR DIVERSIÓN FAMILIAR: Prioriza tiempo de juego, risas y conexión. No es lujo, es necesidad cerebral. Las experiencias alegres compartidas liberan oxitocina y literalmente cablean el cerebro para conexión y seguridad.",
            "CONÉCTATE A TRAVÉS DEL CONFLICTO: Usa conflictos como oportunidades de enseñanza. Los desacuerdos enseñan resolución de problemas, reparación relacional, y resiliencia. No evites conflictos; úsalos para crecer."
        ],
        agesAndStages: "La empatía comienza alrededor de 4-5 años pero se desarrolla durante toda la infancia y adolescencia. Nunca es muy temprano o tarde para ejercitarla."
    ),
    
    CN5RefrigeratorSheet(
        chapterNumber: 6,
        title: "Estrategias Prácticas - Parte 1",
        subtitle: "Herramientas para momentos difíciles (Estrategias 1-6)",
        keyPoints: [
            "Cada estrategia está diseñada para situaciones específicas de la vida diaria.",
            "La práctica hace la integración. Usar estas estrategias repetidamente cambia circuitos cerebrales.",
            "No tienes que ser perfecto. Solo intencional."
        ],
        whatToDo: [
            "#1 CONECTA Y REDIRIGE: Primero emoción, luego lógica. En ese orden siempre.",
            "#2 NOMBRA PARA DOMINAR: Ayuda a contar la historia. Palabras reducen intensidad emocional.",
            "#3 INVOLUCRA, NO ENFUREZCAS: Opciones en vez de órdenes. Ejercita cerebro superior.",
            "#4 ÚSALO O PIÉRDELO: El cerebro superior es un músculo. Ejercítalo con decisiones.",
            "#5 MUÉVELO O PIÉRDELO: Movimiento cambia química cerebral. Baila, corre, salta.",
            "#6 USA EL CONTROL REMOTO: PAUSA (calma), REBOBINA (entiende), AVANCE RÁPIDO (perspectiva)."
        ],
        agesAndStages: "Estas 6 estrategias funcionan para todas las edades, ajustando complejidad según desarrollo del niño."
    ),
    
    CN5RefrigeratorSheet(
        chapterNumber: 7,
        title: "Estrategias Prácticas - Parte 2",
        subtitle: "Construyendo resiliencia y conexión (Estrategias 7-12)",
        keyPoints: [
            "Estas estrategias construyen habilidades a largo plazo: memoria, autoconocimiento, empatía.",
            "La repetición es clave. Una vez no es suficiente. La neuroplasticidad requiere práctica.",
            "Modela estas habilidades tú mismo. Los niños aprenden más de lo que haces que de lo que dices."
        ],
        whatToDo: [
            "#7 RECUERDA RECORDAR: Habla del pasado y futuro. Fortalece memoria autobiográfica.",
            "#8 LAS NUBES PASAN: Enseña que emociones son temporales. Observar sin ser arrastrado.",
            "#9 SIFT: Explora mundo interior (Sensaciones, Imágenes, Sentimientos, Pensamientos).",
            "#10 VISIÓN DE LA MENTE: '¿Cómo crees que se sintió?' Ejercita empatía constantemente.",
            "#11 FACTOR DIVERSIÓN: Prioriza tiempo de conexión alegre. No es opcional.",
            "#12 CONECTA EN CONFLICTO: Repara rupturas SIEMPRE. Los errores no rompen amor."
        ],
        agesAndStages: "Estrategias 7-12 especialmente poderosas con niños mayores (5+) que tienen más desarrollo cognitivo, pero se pueden adaptar para todas las edades."
    ),
    
    CN5RefrigeratorSheet(
        chapterNumber: 8,
        title: "Principios Generales de Integración",
        subtitle: "Recordatorios fundamentales para padres",
        keyPoints: [
            "Un cerebro integrado es la meta: donde todas las partes trabajan juntas en armonía.",
            "Tus respuestas diarias están literalmente moldeando el cerebro de tu hijo (neuroplasticidad).",
            "La integración es como un río: cuando ambas orillas trabajan juntas, fluye armoniosamente."
        ],
        whatToDo: [
            "PRIMERO REGULA TU PROPIO CEREBRO: No puedes calmar a tu hijo si tú estás desregulado. Respira, pausa, regula tu cerebro inferior antes de responder.",
            "CONECTA ANTES DE CORREGIR (siempre): Esta es la regla de oro. Validación emocional primero, redirección conductual después.",
            "TEN EXPECTATIVAS REALISTAS: El cerebro superior no madura hasta los 25 años. Tu hijo de 5 años NO puede regular como uno de 15. Ajusta expectativas según edad.",
            "USA CADA MOMENTO COMO OPORTUNIDAD: Cada interacción es oportunidad de fortalecer integración. No necesitas ser perfecto, solo intencional.",
            "REPARA SIEMPRE: Las rupturas son inevitables. La reparación es lo que construye apego seguro."
        ],
        agesAndStages: "Estos principios aplican a todas las edades, desde bebés hasta adultos. La integración cerebral es trabajo de toda la vida."
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
    ),
    
    CN5BookExample(
        title: "Tina y el sándwich cortado",
        pageReference: "Capítulo 1 - Integración Horizontal",
        situation: "Tina Bryson (co-autora) cuenta: Mi hijo de 3 años pidió un sándwich. Lo hice y lo corté en dos. Inmediatamente entró en berrinche total: '¡Lo cortaste! ¡No quería que lo cortaras! ¡Arréglalo!' Lloraba desconsoladamente. Su hemisferio derecho emocional estaba completamente dominando.",
        whatParentDid: "En lugar de decir 'No seas ridículo, es el mismo sándwich', me arrodillé. Con voz empática dije: 'Oh no, lo corté y tú no querías. Estás muy molesto.' Lo abracé. Esperé. Una vez más calmado (2-3 minutos), le mostré: 'Mira, podemos juntar las dos mitades así.' Él las juntó y comió feliz.",
        result: "El berrinche se resolvió rápidamente. No fue sobre el sándwich realmente; fue sobre sentirse escuchado y validado emocionalmente. Una vez que su hemisferio derecho se sintió conectado, su hemisferio izquierdo pudo procesar que el sándwich seguía siendo el mismo.",
        lessonFromBook: "CONECTA Y REDIRIGE en acción perfecta. El hemisferio derecho emocional necesita validación ANTES de que el hemisferio izquierdo lógico pueda funcionar. Los berrinches irracionales de niños pequeños son hemisferio derecho dominando. Primero conecta con la emoción (aunque parezca irracional), luego la lógica funcionará."
    ),
    
    CN5BookExample(
        title: "El niño que no podía dormir solo",
        pageReference: "Capítulo 2 - Integración Vertical",
        situation: "Brandon, 6 años, tenía terror de dormir solo. Sus padres habían intentado todo: sobornos, amenazas, razonar. Cada noche era batalla de 2 horas. El niño lloraba, suplicaba, entraba en pánico.",
        whatParentDid: "Los padres cambiaron enfoque: En lugar de razonar (cerebro superior) cuando estaba en pánico (cerebro inferior dominando), primero CALMARON el cerebro inferior. Respiraciones profundas juntos. Música calmante. Presencia física. Luego EJERCITARON cerebro superior: '¿Qué te ayudaría a sentirte más seguro?' Brandon eligió: luz nocturna, puerta semi-abierta, un peluche especial. Le dieron OPCIONES (involucra cerebro superior).",
        result: "En una semana, las batallas de 2 horas se redujeron a 15 minutos de rutina tranquila. Brandon desarrolló sensación de control (eligió sus herramientas de seguridad). Su cerebro superior se ejercitó en lugar de solo reaccionar con cerebro inferior.",
        lessonFromBook: "INVOLUCRA, NO ENFUREZCAS + ÚSALO O PIÉRDELO: No puedes razonar con cerebro inferior en pánico. Primero calma, luego involucra cerebro superior con opciones y decisiones. Esto no solo resuelve el problema inmediato, sino que ejercita autorregulación a largo plazo."
    ),
    
    CN5BookExample(
        title: "La tarea de matemáticas imposible",
        pageReference: "Capítulo 2 - Integración Vertical",
        situation: "Sophie, 9 años, estaba llorando sobre su tarea de matemáticas. 'No puedo hacerlo! Es muy difícil! Soy estúpida!' Su cerebro inferior (amígdala) estaba activado por la frustración. Su cerebro superior (corteza prefrontal) se había desconectado.",
        whatParentDid: "Su padre usó 'Muévelo o Piérdelo': 'Veo que estás muy frustrada. Vamos a saltar 20 veces juntos.' Saltaron. Sophie empezó a reír. Después: 'Ahora tu cerebro está más calmado. ¿Qué parte de la tarea es la más difícil?' Su cerebro superior volvió online y pudo pensar claramente.",
        result: "Después del movimiento, Sophie pudo concentrarse. Identificó exactamente qué parte no entendía. Su padre la guió SIN hacer la tarea por ella. Aprendió: cuando estoy atascada, mover mi cuerpo ayuda a mi mente.",
        lessonFromBook: "MUÉVELO O PIÉRDELO: El movimiento físico es una de las formas más rápidas de cambiar estado mental. Libera neurotransmisores (dopamina, serotonina) que calman la amígdala y permiten que el cerebro superior vuelva a estar online. No es distracción; es regulación neurológica."
    ),
    
    CN5BookExample(
        title: "La fiesta de cumpleaños abrumadora",
        pageReference: "Capítulo 4 - Estados Mentales",
        situation: "Jason, 7 años, fue a una fiesta de cumpleaños. Había 20 niños, música alta, muchos estímulos. A mitad de la fiesta, Jason estaba en un rincón llorando, abrumado sensorialmente. Su padre no entendía por qué 'no podía disfrutar como los otros niños'.",
        whatParentDid: "Su padre usó SIFT con él: '¿Qué sientes en tu cuerpo?' (Jason: 'Mi cabeza duele, mi panza está rara'). '¿Qué imágenes ves?' ('Muchos niños, mucho ruido'). '¿Qué sentimientos?' ('Asustado, cansado'). '¿Qué pensamientos?' ('Quiero ir a casa'). El padre validó: 'Tu cuerpo te está diciendo que necesitas un descanso. Eso está bien.' Salieron 15 minutos al jardín tranquilo.",
        result: "Al nombrar lo que sentía con SIFT, Jason entendió su propia experiencia interna. No estaba 'mal' por sentirse así; su cerebro solo necesitaba menos estímulo. Después del descanso, volvió a la fiesta 10 minutos más. Aprendió a escuchar las señales de su cuerpo.",
        lessonFromBook: "SIFT (Sensaciones, Imágenes, Sentimientos, Pensamientos): Enseñar a los niños a observar su mundo interior desarrolla autoconocimiento profundo. Jason aprendió que sus sensaciones corporales son información útil, no algo que ignorar. Esto es la base del mindfulness y la autorregulación."
    ),
    
    CN5BookExample(
        title: "El conflicto de los hermanos y el iPad",
        pageReference: "Capítulo 5 - Integración Interpersonal",
        situation: "Dos hermanos (8 y 6 años) peleaban constantemente por el iPad. Cada día terminaba en gritos, golpes, y ambos llorando. Los padres habían probado turnos, timer, castigos. Nada funcionaba a largo plazo.",
        whatParentDid: "Los padres cambiaron estrategia: En lugar de 'resolver' por ellos, les enseñaron resolución de conflictos. '¿Cómo crees que se siente tu hermano cuando le quitas el iPad?' (Ejercitar empatía). 'Ambos quieren el iPad. ¿Qué ideas tienen para que AMBOS estén contentos?' Facilitaron negociación, sin imponer solución.",
        result: "Los niños propusieron: turnos de 20 minutos con timer que ELLOS ponen. Si uno rompe la regla, pierde su turno del día siguiente. ELLOS crearon el sistema. Lo siguieron porque era SU solución. Los conflictos disminuyeron 80%. Aprendieron negociación, empatía, y consecuencias.",
        lessonFromBook: "EJERCITA VISIÓN DE LA MENTE + CONÉCTATE A TRAVÉS DEL CONFLICTO: Los conflictos son oportunidades de oro para enseñar habilidades sociales. No evites conflictos ni los resuelvas tú. Facilita que ELLOS ejerciten empatía, negociación y resolución de problemas. Esto desarrolla cerebro social profundamente."
    ),
    
    CN5BookExample(
        title: "El día que mamá perdió los estribos",
        pageReference: "Capítulo 5 - Reparación",
        situation: "Una madre cuenta: Tuve un día horrible en el trabajo. Llegué a casa y mi hija de 5 años había hecho un desastre pintando. Exploté. Grité cosas hirientes: '¡Siempre haces desastres! ¡Nunca piensas!' Mi hija se quedó petrificada, luego corrió llorando a su cuarto.",
        whatParentDid: "Después de calmarme (20 minutos), fui a su cuarto. Me arrodillé: 'Grité y dije cosas muy feas. Eso estuvo MAL. No fue tu culpa. Yo tuve un mal día y no manejé mis emociones bien. Lo siento muchísimo. ¿Me perdonas?' Mi hija llorando: '¿Todavía me amas?' 'SIEMPRE te amo, incluso cuando cometo errores horribles. Te amo pase lo que pase.' Nos abrazamos largo rato.",
        result: "La ruptura se reparó. Más importante: mi hija aprendió que los adultos cometen errores grandes Y pueden repararlos con vulnerabilidad. Que el amor es más fuerte que los errores. Que está segura incluso cuando fallo. Esto es apego seguro en acción.",
        lessonFromBook: "CONÉCTATE A TRAVÉS DEL CONFLICTO - Reparación: Siegel dice: 'Las rupturas son inevitables. Lo que importa es la reparación.' Reparación genuina con vulnerabilidad enseña: 1) Adultos se equivocan, 2) Relaciones se pueden reparar, 3) El amor es incondicional. Esta es una de las lecciones más poderosas que puedes dar."
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
    ),
    CN5ReflectionQuestion(
        question: "Cuando tu hijo comete un error o tiene un comportamiento difícil, ¿cuál es tu primer impulso: castigar, razonar, o conectar emocionalmente?",
        category: "Conecta y Redirige",
        purpose: "Identificar si tu reacción automática activa cerebro inferior o superior de tu hijo"
    ),
    CN5ReflectionQuestion(
        question: "¿Das a tu hijo suficientes oportunidades de tomar decisiones apropiadas para su edad? ¿O tomas la mayoría de decisiones por él?",
        category: "Ejercitar Cerebro Superior",
        purpose: "Evaluar si estás ejercitando o sobreprotegiendo el desarrollo de su corteza prefrontal"
    ),
    CN5ReflectionQuestion(
        question: "¿Cuándo fue la última vez que reparaste una ruptura relacional con tu hijo? ¿Qué pasó?",
        category: "Reparación",
        purpose: "Reflexionar sobre la importancia de reparar y si lo haces consistentemente"
    ),
    CN5ReflectionQuestion(
        question: "¿Tu familia tiene tiempo regular de pura diversión y conexión sin pantallas ni demandas? ¿Cuánto?",
        category: "Factor Diversión",
        purpose: "Evaluar si priorizas tiempo de conexión alegre (necesidad cerebral, no lujo)"
    ),
    CN5ReflectionQuestion(
        question: "¿Qué tan bien conoces los estados internos de tu hijo? ¿Puedes identificar cuando su cerebro superior vs. inferior está dominando?",
        category: "Observación Parental",
        purpose: "Desarrollar capacidad de 'leer' el estado cerebral de tu hijo para responder apropiadamente"
    ),
    CN5ReflectionQuestion(
        question: "¿Modelas las habilidades que quieres que tu hijo desarrolle (regulación emocional, reparación, empatía)?",
        category: "Modelaje Parental",
        purpose: "Recordar que los niños aprenden más de lo que HACES que de lo que dices"
    ),
    CN5ReflectionQuestion(
        question: "¿Tus expectativas sobre el comportamiento de tu hijo están ajustadas a su nivel de desarrollo cerebral real?",
        category: "Expectativas Realistas",
        purpose: "Evaluar si esperas que un cerebro inmaduro funcione como uno maduro"
    ),
    CN5ReflectionQuestion(
        question: "¿Usas el movimiento físico como herramienta de regulación para tu hijo Y para ti mismo?",
        category: "Regulación Física",
        purpose: "Reconocer el poder del movimiento para cambiar estados mentales"
    ),
    CN5ReflectionQuestion(
        question: "¿Ayudas a tu hijo a desarrollar empatía preguntando regularmente sobre perspectivas de otros?",
        category: "Desarrollo de Empatía",
        purpose: "Evaluar si ejercitas activamente las neuronas espejo y cerebro social de tu hijo"
    )
]

