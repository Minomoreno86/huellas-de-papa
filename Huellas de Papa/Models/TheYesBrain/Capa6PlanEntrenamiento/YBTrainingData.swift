import Foundation

/// Datos del plan de entrenamiento de 28 días del Yes Brain
/// Basado en "The Yes Brain" de Daniel J. Siegel y Tina Payne Bryson
struct YBTrainingData {
    
    static func createTrainingDays() -> [YBTrainingDay] {
        return [
            // FASE 1: CALMA Y CONTROL (Balance) - Días 1-7
            YBTrainingDay(
                dayNumber: 1,
                phase: "Balance",
                theme: "Tu pausa enseña calma",
                challenge: "Practica la pausa reguladora antes de reaccionar",
                actionSteps: [
                    "Respira profundo 3 veces antes de hablar cuando sientas tensión",
                    "Di una sola frase calmada, sin subir el tono de voz",
                    "Sostén contacto visual suave sin palabras durante 5 segundos"
                ],
                reflection: "La pausa entre estímulo y respuesta es donde crece la sabiduría emocional.",
                rewardPhrase: "Elegiste presencia antes que reacción. Tu cerebro Sí está creciendo.",
                icon: "leaf.fill",
                color: "blue"
            ),
            
            YBTrainingDay(
                dayNumber: 2,
                phase: "Balance",
                theme: "El tono que regula",
                challenge: "Usa tu voz como herramienta de regulación emocional",
                actionSteps: [
                    "Habla más lento de lo habitual durante las interacciones con tu hijo",
                    "Baja el volumen de tu voz en momentos de tensión",
                    "Usa frases cortas y melodiosas: 'Te escucho', 'Estoy aquí'"
                ],
                reflection: "Tu tono de voz es el termostato emocional de tu hijo.",
                rewardPhrase: "Tu voz calmada activó el cerebro receptivo de tu familia.",
                icon: "waveform",
                color: "blue"
            ),
            
            YBTrainingDay(
                dayNumber: 3,
                phase: "Balance",
                theme: "Nombrar para calmar",
                challenge: "Ayuda a tu hijo a identificar y nombrar sus emociones",
                actionSteps: [
                    "Observa las señales físicas de tu hijo (puños, ceño, voz)",
                    "Nombra la emoción: 'Veo que estás frustrado/molesto/triste'",
                    "Valida sin resolver: 'Es normal sentirse así, estoy contigo'"
                ],
                reflection: "Nombrar una emoción reduce su intensidad en el cerebro.",
                rewardPhrase: "Ayudaste a tu hijo a integrar hemisferios con palabras.",
                icon: "text.bubble.fill",
                color: "blue"
            ),
            
            YBTrainingDay(
                dayNumber: 4,
                phase: "Balance",
                theme: "La respiración compartida",
                challenge: "Practica respiración consciente con tu hijo",
                actionSteps: [
                    "Siéntense juntos en un lugar tranquilo",
                    "Inhalen lento contando hasta 4, exhalen contando hasta 6",
                    "Repitan 5 veces, acompáñenlo con 'Dentro paz, fuera tensión'"
                ],
                reflection: "La co-regulación respiratoria sincroniza sistemas nerviosos.",
                rewardPhrase: "Enseñaste a tu hijo que la calma se puede practicar.",
                icon: "wind",
                color: "blue"
            ),
            
            YBTrainingDay(
                dayNumber: 5,
                phase: "Balance",
                theme: "Presencia sin pantallas",
                challenge: "Dedica 15 minutos de atención plena sin distracciones",
                actionSteps: [
                    "Guarda tu teléfono en otra habitación",
                    "Elige una actividad simple: leer, jugar, caminar",
                    "Mantén contacto visual y escucha activa durante toda la interacción"
                ],
                reflection: "La presencia plena es el regalo más poderoso para el cerebro en desarrollo.",
                rewardPhrase: "Hoy regalaste presencia pura. Eso construye cerebros seguros.",
                icon: "eye.fill",
                color: "blue"
            ),
            
            YBTrainingDay(
                dayNumber: 6,
                phase: "Balance",
                theme: "El poder del tacto",
                challenge: "Usa el contacto físico como regulador emocional",
                actionSteps: [
                    "Ofrece un abrazo de 20 segundos sin prisa",
                    "Coloca tu mano en su hombro con presión suave cuando esté alterado",
                    "Pregunta: '¿Necesitas un abrazo?' y respeta su respuesta"
                ],
                reflection: "El tacto afectuoso libera oxitocina y reduce cortisol.",
                rewardPhrase: "Tu contacto físico activó el sistema de calma de tu hijo.",
                icon: "hand.raised.fill",
                color: "blue"
            ),
            
            YBTrainingDay(
                dayNumber: 7,
                phase: "Balance",
                theme: "Cierre del día consciente",
                challenge: "Crea un ritual nocturno de regulación emocional",
                actionSteps: [
                    "Pregunta: '¿Qué fue lo mejor y lo más difícil de hoy?'",
                    "Escucha sin juzgar ni corregir, solo valida",
                    "Cierra con: 'Gracias por compartir tu día conmigo. Mañana será nuevo'"
                ],
                reflection: "Integrar el día antes de dormir consolida memoria emocional positiva.",
                rewardPhrase: "Completaste la primera fase. Tu capacidad de regulación está creciendo.",
                icon: "moon.stars.fill",
                color: "blue"
            ),
            
            // FASE 2: RECUPERAR Y AVANZAR (Resiliencia) - Días 8-14
            YBTrainingDay(
                dayNumber: 8,
                phase: "Resiliencia",
                theme: "El error entrena el cerebro",
                challenge: "Reencuadra el error como oportunidad de aprendizaje",
                actionSteps: [
                    "Cuando tu hijo se equivoque, di: 'Los errores ayudan a crecer'",
                    "Pregunta: '¿Qué aprendiste?' en lugar de '¿Por qué lo hiciste?'",
                    "Comparte un error propio del día y qué aprendiste"
                ],
                reflection: "El cerebro resiliente ve los errores como información, no como fracaso.",
                rewardPhrase: "Enseñaste que equivocarse es parte de aprender.",
                icon: "arrow.triangle.2.circlepath",
                color: "green"
            ),
            
            YBTrainingDay(
                dayNumber: 9,
                phase: "Resiliencia",
                theme: "Frustración como maestra",
                challenge: "Acompaña la frustración sin resolver inmediatamente",
                actionSteps: [
                    "Cuando tu hijo se frustre, valida: 'Es difícil, lo veo'",
                    "Resiste el impulso de resolver el problema por él",
                    "Pregunta: '¿Qué podrías intentar?' y permite que explore soluciones"
                ],
                reflection: "La tolerancia a la frustración se construye con acompañamiento, no con rescate.",
                rewardPhrase: "Permitiste que tu hijo desarrolle confianza en sí mismo.",
                icon: "figure.climbing",
                color: "green"
            ),
            
            YBTrainingDay(
                dayNumber: 10,
                phase: "Resiliencia",
                theme: "Reparar después de la ruptura",
                challenge: "Practica la reparación emocional tras un conflicto",
                actionSteps: [
                    "Espera a que ambos estén calmados",
                    "Inicia con humildad: 'Reaccioné mal, lo siento'",
                    "Propón juntos: '¿Qué podemos hacer diferente la próxima vez?'"
                ],
                reflection: "La reparación enseña que el amor es más fuerte que los errores.",
                rewardPhrase: "Modelaste que las relaciones se reparan, no se rompen.",
                icon: "heart.text.square.fill",
                color: "green"
            ),
            
            YBTrainingDay(
                dayNumber: 11,
                phase: "Resiliencia",
                theme: "El 'todavía' que motiva",
                challenge: "Usa el poder del 'todavía' para cultivar mentalidad de crecimiento",
                actionSteps: [
                    "Cuando diga 'No puedo', agrega: 'Todavía no puedes, pero estás aprendiendo'",
                    "Celebra el esfuerzo, no solo el resultado: 'Veo que lo intentaste'",
                    "Recuerda algo que antes no podía y ahora sí: '¿Recuerdas cuando...?'"
                ],
                reflection: "El 'todavía' abre puertas neuronales hacia la posibilidad.",
                rewardPhrase: "Plantaste semillas de confianza y perseverancia.",
                icon: "sparkles",
                color: "green"
            ),
            
            YBTrainingDay(
                dayNumber: 12,
                phase: "Resiliencia",
                theme: "Micro-metas alcanzables",
                challenge: "Divide tareas grandes en pasos pequeños y celebrables",
                actionSteps: [
                    "Identifica una tarea que abruma a tu hijo",
                    "Divídela en 3 pasos pequeños y concretos",
                    "Celebra cada paso completado: '¡Primer paso logrado!'"
                ],
                reflection: "Los cerebros resilientes avanzan paso a paso, no de golpe.",
                rewardPhrase: "Enseñaste que lo grande se construye con pequeños pasos.",
                icon: "figure.walk",
                color: "green"
            ),
            
            YBTrainingDay(
                dayNumber: 13,
                phase: "Resiliencia",
                theme: "Historias de superación",
                challenge: "Comparte historias familiares de resiliencia",
                actionSteps: [
                    "Cuenta una historia de cuando tú o un familiar superaron algo difícil",
                    "Enfatiza el proceso: 'Al principio fue duro, pero seguimos intentando'",
                    "Pregunta: '¿Qué situación difícil has superado tú?'"
                ],
                reflection: "Las narrativas de resiliencia construyen identidad resiliente.",
                rewardPhrase: "Fortaleciste la narrativa resiliente de tu familia.",
                icon: "book.fill",
                color: "green"
            ),
            
            YBTrainingDay(
                dayNumber: 14,
                phase: "Resiliencia",
                theme: "Cierre resiliente",
                challenge: "Reflexiona sobre tu propia resiliencia esta semana",
                actionSteps: [
                    "Escribe 3 momentos difíciles de esta semana",
                    "Identifica cómo los manejaste (aunque no haya sido perfecto)",
                    "Di en voz alta: 'Soy capaz de recuperarme y seguir adelante'"
                ],
                reflection: "Tu propia resiliencia es el modelo más poderoso para tu hijo.",
                rewardPhrase: "Completaste la fase de Resiliencia. Eres más fuerte de lo que creías.",
                icon: "mountain.2.fill",
                color: "green"
            ),
            
            // FASE 3: COMPRENDER DESDE DENTRO (Insight) - Días 15-21
            YBTrainingDay(
                dayNumber: 15,
                phase: "Insight",
                theme: "Ventana al mundo interior",
                challenge: "Ayuda a tu hijo a identificar sensaciones corporales",
                actionSteps: [
                    "Pregunta: '¿Dónde sientes esa emoción en tu cuerpo?'",
                    "Ayuda a nombrar: 'Mariposas en la panza', 'Puños apretados'",
                    "Valida: 'Tu cuerpo te está dando información importante'"
                ],
                reflection: "El insight comienza con la conciencia del propio cuerpo.",
                rewardPhrase: "Abriste la puerta al autoconocimiento de tu hijo.",
                icon: "figure.mind.and.body",
                color: "orange"
            ),
            
            YBTrainingDay(
                dayNumber: 16,
                phase: "Insight",
                theme: "El observador interno",
                challenge: "Enseña a observar pensamientos sin juzgarlos",
                actionSteps: [
                    "Cuando exprese un pensamiento negativo, di: 'Ese es un pensamiento, no eres tú'",
                    "Usa metáforas: 'Los pensamientos son como nubes que pasan'",
                    "Pregunta: '¿Qué otro pensamiento podrías tener sobre esto?'"
                ],
                reflection: "Observar los pensamientos sin identificarse con ellos es libertad emocional.",
                rewardPhrase: "Enseñaste que los pensamientos se pueden observar, no solo creer.",
                icon: "eye.circle.fill",
                color: "orange"
            ),
            
            YBTrainingDay(
                dayNumber: 17,
                phase: "Insight",
                theme: "El espejo empático",
                challenge: "Refleja las emociones de tu hijo para que se vea a sí mismo",
                actionSteps: [
                    "Observa su estado emocional sin juzgar",
                    "Refleja: 'Veo que estás muy emocionado/frustrado/preocupado'",
                    "Pregunta: '¿Es así como te sientes?' y ajusta según su respuesta"
                ],
                reflection: "El niño aprende a verse a sí mismo a través del espejo parental.",
                rewardPhrase: "Fuiste un espejo claro y amoroso para tu hijo.",
                icon: "person.circle.fill",
                color: "orange"
            ),
            
            YBTrainingDay(
                dayNumber: 18,
                phase: "Insight",
                theme: "Diario emocional compartido",
                challenge: "Creen juntos un momento de reflexión diaria",
                actionSteps: [
                    "Al final del día, tomen 5 minutos para dibujar o escribir",
                    "Pregunta: '¿Qué emoción fue la más fuerte hoy?'",
                    "Tú también compartes tu emoción del día"
                ],
                reflection: "Nombrar y registrar emociones fortalece la corteza prefrontal medial.",
                rewardPhrase: "Creaste un espacio sagrado de autoconocimiento.",
                icon: "book.pages.fill",
                color: "orange"
            ),
            
            YBTrainingDay(
                dayNumber: 19,
                phase: "Insight",
                theme: "Pausas de chequeo interno",
                challenge: "Enseña a hacer pausas para 'escanear' el estado interno",
                actionSteps: [
                    "En 3 momentos del día, pregunta: '¿Cómo te sientes en este momento?'",
                    "Ayuda a identificar: hambre, cansancio, emoción, energía",
                    "Valida cada respuesta sin cambiar nada, solo observar"
                ],
                reflection: "El chequeo interno frecuente construye autoconciencia sostenida.",
                rewardPhrase: "Enseñaste el hábito más importante: mirarse hacia dentro.",
                icon: "checkmark.circle.fill",
                color: "orange"
            ),
            
            YBTrainingDay(
                dayNumber: 20,
                phase: "Insight",
                theme: "Causas y consecuencias",
                challenge: "Ayuda a conectar acciones con resultados emocionales",
                actionSteps: [
                    "Después de un evento, pregunta: '¿Qué pasó primero? ¿Y después?'",
                    "Ayuda a construir la secuencia completa sin culpar",
                    "Pregunta: '¿Qué podrías hacer diferente si pasa de nuevo?'"
                ],
                reflection: "Entender la causalidad emocional es el inicio de la autorregulación.",
                rewardPhrase: "Fortaleciste la capacidad de reflexión de tu hijo.",
                icon: "arrow.right.circle.fill",
                color: "orange"
            ),
            
            YBTrainingDay(
                dayNumber: 21,
                phase: "Insight",
                theme: "Cierre introspectivo",
                challenge: "Reflexiona sobre tu propio mundo interior esta semana",
                actionSteps: [
                    "Escribe: '¿Qué emociones sentí más frecuentemente esta semana?'",
                    "Pregunta: '¿Qué me activó? ¿Qué necesitaba?'",
                    "Di en voz alta: 'Conocerme me permite ser mejor padre/madre'"
                ],
                reflection: "Tu propio insight es la base de la crianza consciente.",
                rewardPhrase: "Completaste la fase de Insight. Ahora te conoces mejor.",
                icon: "brain.head.profile",
                color: "orange"
            ),
            
            // FASE 4: CONECTAR CON EL OTRO (Empatía) - Días 22-28
            YBTrainingDay(
                dayNumber: 22,
                phase: "Empatía",
                theme: "Ver desde sus ojos",
                challenge: "Practica ponerte en los zapatos de tu hijo",
                actionSteps: [
                    "Cuando haya conflicto, pregúntate: '¿Cómo se ve esto desde su perspectiva?'",
                    "Di en voz alta: 'Imagino que te sientes...'",
                    "Valida su experiencia aunque no estés de acuerdo con su conducta"
                ],
                reflection: "La empatía no significa ceder, significa entender primero.",
                rewardPhrase: "Activaste tus neuronas espejo. Eso es conexión real.",
                icon: "eye.trianglebadge.exclamationmark.fill",
                color: "pink"
            ),
            
            YBTrainingDay(
                dayNumber: 23,
                phase: "Empatía",
                theme: "Escucha sin arreglar",
                challenge: "Practica escucha activa sin saltar a soluciones",
                actionSteps: [
                    "Cuando tu hijo comparta algo, solo escucha durante 2 minutos",
                    "Refleja lo que escuchaste: 'Entonces te sentiste...'",
                    "Pregunta: '¿Necesitas que te ayude o solo que te escuche?'"
                ],
                reflection: "Ser escuchado sin juicio es una de las necesidades humanas más profundas.",
                rewardPhrase: "Tu escucha profunda sanó y conectó.",
                icon: "ear.fill",
                color: "pink"
            ),
            
            YBTrainingDay(
                dayNumber: 24,
                phase: "Empatía",
                theme: "Validación antes que corrección",
                challenge: "Valida la emoción incluso cuando corrijas la conducta",
                actionSteps: [
                    "Separa emoción de conducta: 'Entiendo que estés enojado (válido), pegar no está permitido (límite)'",
                    "Nombra primero la emoción, luego enseña la conducta alternativa",
                    "Cierra con conexión: 'Te amo incluso cuando estoy estableciendo límites'"
                ],
                reflection: "Validar la emoción abre el cerebro receptivo; invalidarla lo cierra.",
                rewardPhrase: "Conectaste primero, corregiste después. Eso es cerebro Sí.",
                icon: "checkmark.seal.fill",
                color: "pink"
            ),
            
            YBTrainingDay(
                dayNumber: 25,
                phase: "Empatía",
                theme: "Gestos de amor específicos",
                challenge: "Expresa amor de formas tangibles y sorpresivas",
                actionSteps: [
                    "Deja una nota en su mochila: 'Eres valiente e importante'",
                    "Prepara su comida favorita sin ocasión especial",
                    "Di: 'Algo que me encanta de ti es...'"
                ],
                reflection: "El amor se construye en los pequeños gestos cotidianos.",
                rewardPhrase: "Depositaste amor en el tanque emocional de tu hijo.",
                icon: "heart.fill",
                color: "pink"
            ),
            
            YBTrainingDay(
                dayNumber: 26,
                phase: "Empatía",
                theme: "Perdón y reconexión",
                challenge: "Practica pedir perdón con humildad genuina",
                actionSteps: [
                    "Identifica algo en lo que fallaste esta semana",
                    "Acércate y di: 'Me equivoqué cuando... Lo siento'",
                    "Pregunta: '¿Cómo te hizo sentir? ¿Cómo puedo repararlo?'"
                ],
                reflection: "Pedir perdón enseña humildad, vulnerabilidad y reparación.",
                rewardPhrase: "Modelaste que los adultos también reparan. Eso es valentía.",
                icon: "arrow.uturn.backward.circle.fill",
                color: "pink"
            ),
            
            YBTrainingDay(
                dayNumber: 27,
                phase: "Empatía",
                theme: "Ritual de gratitud mutua",
                challenge: "Creen un momento de reconocimiento recíproco",
                actionSteps: [
                    "Siéntense frente a frente",
                    "Tú dices: 'Algo que agradezco de ti es...'",
                    "Tu hijo comparte algo que agradece de ti",
                    "Terminen con un abrazo de 20 segundos"
                ],
                reflection: "La gratitud mutua fortalece el vínculo y activa oxitocina.",
                rewardPhrase: "Creaste un momento sagrado de conexión profunda.",
                icon: "hands.sparkles.fill",
                color: "pink"
            ),
            
            YBTrainingDay(
                dayNumber: 28,
                phase: "Empatía",
                theme: "Cierre del viaje",
                challenge: "Reflexiona sobre tu transformación en estos 28 días",
                actionSteps: [
                    "Revisa los 27 días anteriores y nota qué cambió",
                    "Escribe: '¿Qué aprendí sobre mí? ¿Sobre mi hijo?'",
                    "Comparte con tu hijo: 'Estos 28 días me enseñaron que...'"
                ],
                reflection: "El cerebro Sí no es un destino, es una práctica diaria.",
                rewardPhrase: "Completaste el viaje de 28 días. Ahora eres un cultivador consciente del cerebro Sí. 🌳",
                icon: "trophy.fill",
                color: "pink"
            )
        ]
    }
}

