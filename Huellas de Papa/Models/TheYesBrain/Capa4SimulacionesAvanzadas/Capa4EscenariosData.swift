import Foundation

/// Datos de los escenarios de simulación organizados por categorías
struct Capa4EscenariosData {
    
    static let escenarios: [Capa4Scenario] = [
        // === ESCENARIOS DE BALANCE (Equilibrio) ===
        // Basados en el Capítulo 1 de The Yes Brain: "The Balanced Yes Brain"
        crearEscenarioVentanaTolerancia(),
        crearEscenarioRuedaConciencia(),
        crearEscenarioZonaVerde(),
        crearEscenarioRespirarAntesReaccionar(),
        
        // === ESCENARIOS DE RESILIENCIA ===
        // Basados en el Capítulo 2 de The Yes Brain: "The Resilient Yes Brain"
        crearEscenarioErrorOportunidad(),
        crearEscenarioFrustracionCrecimiento(),
        crearEscenarioControlVsCosasQueNoControl(),
        crearEscenarioPerderGanar(),
        
        // === ESCENARIOS DE INSIGHT ===
        // Basados en el Capítulo 3 de The Yes Brain: "The Insightful Yes Brain"
        crearEscenarioMindSight(),
        crearEscenarioIntegracionCerebroSuperiorInferior(),
        crearEscenarioSentirParaPensar(),
        crearEscenarioObservadorInterior(),
        
        // === ESCENARIOS DE EMPATÍA ===
        // Basados en el Capítulo 4 de The Yes Brain: "The Empathic Yes Brain"
        crearEscenarioNeuronasEspejo(),
        crearEscenarioVerDesdeOtraPerspectiva(),
        crearEscenarioCompartirVsCompetir(),
        crearEscenarioReparacionRelacional()
    ]
    
    // MARK: - ESCENARIOS DE BALANCE (Equilibrio)
    // Basados en "The Balanced Yes Brain" - Capítulo 1 del libro
    
    /// Escenario 1: La Ventana de Tolerancia (Window of Tolerance)
    /// Concepto del libro: Ayudar al niño a permanecer dentro de su ventana óptima de arousal
    private static func crearEscenarioVentanaTolerancia() -> Capa4Scenario {
        // OUTCOME 1: Respuesta No Brain - Salir de la ventana de tolerancia
        let outcomeNoBrain = YesBrainScenarioOutcome(
            childReaction: "Tu hija se tira al suelo llorando intensamente. Su cuerpo se pone rígido. Grita: '¡Te odio! ¡Eres la peor mamá/papá del mundo!' Otros compradores voltean a mirarte.",
            brainState: "Ha salido completamente de su ventana de tolerancia hacia la zona de hiperactivación. La amígdala ha secuestrado su cerebro pensante. Tu tono autoritario la sacó aún más de su zona verde.",
            visualCue: "red",
            narratorFeedback: "Has reaccionado desde el 'No Brain'. Según Siegel y Bryson, cuando los padres respondemos con firmeza sin conexión, empujamos al niño fuera de su ventana de tolerancia en lugar de ayudarlo a regresar a ella.",
            recommendation: "Concepto clave del libro: 'Connect first, redirect second'. Primero ayúdala a volver a su ventana de tolerancia con tu presencia calmada, luego puedes enseñar.",
            successLevel: 10,
            emotionalImpact: "Negativo"
        )
        
        // OUTCOME 2: Respuesta Yes Brain - Ayudar a permanecer en la ventana
        let outcomeYesBrain = YesBrainScenarioOutcome(
            childReaction: "Tu hija sigue llorando pero su intensidad disminuye. Se deja abrazar. Después de unos segundos dice entre sollozos: 'Es que... yo quería ese juguete...' Su respiración empieza a normalizarse.",
            brainState: "Tu calma y conexión están ayudándola a permanecer dentro de su ventana de tolerancia. La corteza prefrontal empieza a reconectarse. Tu presencia reguladora activa su sistema nervioso parasimpático.",
            visualCue: "green",
            narratorFeedback: "Excelente. Estás aplicando el principio central del Yes Brain: ayudar al niño a permanecer (o regresar) a su ventana de tolerancia. Como dice el libro: 'Un cerebro balanceado puede aprender, crecer y conectar.'",
            recommendation: "Ahora que está más calmada y dentro de su ventana, puedes enseñar: 'Entiendo que querías ese juguete. A veces no podemos tener todo lo que queremos, y eso puede sentirse muy difícil.'",
            successLevel: 95,
            emotionalImpact: "Positivo"
        )
        
        // OUTCOME 3: Respuesta intermedia - Distracción sin procesamiento
        let outcomeDistraccion = YesBrainScenarioOutcome(
            childReaction: "Tu hija deja de llorar temporalmente y se interesa en el carrito. Pero no ha procesado la emoción. Media hora después vuelve a pedir el juguete y llora nuevamente.",
            brainState: "La distracción funcionó temporalmente pero no ayudó a desarrollar habilidades de regulación. El cerebro no aprendió a manejar la frustración, solo se evitó.",
            visualCue: "yellow",
            narratorFeedback: "La distracción puede funcionar a corto plazo, pero el libro enfatiza que no enseña al niño a manejar emociones difíciles. No desarrolla el 'músculo' del balance emocional.",
            recommendation: "El Yes Brain busca enseñar, no solo evitar. Ayúdala a nombrar su emoción: 'Estás triste porque querías ese juguete' y luego ofrece estrategias de regulación.",
            successLevel: 35,
            emotionalImpact: "Neutral"
        )
        
        // Crear opciones
        let options = [
            YesBrainScenarioOption(
                text: "Le dices firmemente mientras sigues empujando el carrito: 'Ya te dije que no. Deja de llorar ahora mismo o nos vamos del supermercado.'",
                tone: "No Brain - Autoritario",
                nextOutcomeId: outcomeNoBrain.id,
                yesBrainAlignment: 10
            ),
            YesBrainScenarioOption(
                text: "Te arrodillas a su nivel, haces contacto visual suave y dices con voz calmada: 'Veo que estás muy triste. Querías ese juguete y es difícil escuchar un no. Ven, te abrazo.'",
                tone: "Yes Brain - Conexión primero",
                nextOutcomeId: outcomeYesBrain.id,
                yesBrainAlignment: 95
            ),
            YesBrainScenarioOption(
                text: "Rápidamente sacas tu teléfono y le muestras un video gracioso para que deje de llorar: 'Mira, mira este gatito tan chistoso.'",
                tone: "Distracción - Evitación",
                nextOutcomeId: outcomeDistraccion.id,
                yesBrainAlignment: 35
            )
        ]
        
        return Capa4Scenario(
            title: "La Ventana de Tolerancia",
            category: "Balance",
            trigger: "Tu hija de 5 años tiene un berrinche en la juguetería porque no le compras lo que quiere",
            description: "Están en la tienda de juguetes comprando un regalo para una fiesta. Tu hija ve un juguete que le encanta y te pide que se lo compres. Le explicas con calma que hoy solo están comprando el regalo para su amigo. Ella comienza a llorar intensamente, su cara se pone roja y empieza a gritar: '¡Pero yo lo quiero! ¡No es justo!'",
            options: options,
            outcomes: [outcomeNoBrain, outcomeYesBrain, outcomeDistraccion],
            insight: "CONCEPTO CLAVE DEL LIBRO: La 'Ventana de Tolerancia' es el estado óptimo donde el niño puede pensar, aprender y conectar. Cuando sale de esta ventana (hiperactivación o hipoactivación), el cerebro superior se desconecta. El trabajo del padre Yes Brain es ayudar al niño a PERMANECER o REGRESAR a esta ventana mediante co-regulación, no mediante control o distracción.",
            icon: "window.vertical.open",
            color: "blue",
            difficulty: 3
        )
    }
    
    /// Escenario 2: La Rueda de la Conciencia (Wheel of Awareness)
    /// Concepto del libro: Ayudar al niño a no quedar "atrapado" en una sola emoción
    private static func crearEscenarioRuedaConciencia() -> Capa4Scenario {
        // OUTCOME 1: Quedarse atrapado en la emoción (rim stuck)
        let outcomeAtrapado = YesBrainScenarioOutcome(
            childReaction: "Tu hijo sigue enojado, cada vez más intenso. Dice llorando: 'Siempre me regañas. Nunca hago nada bien. ¡Todo el día fue horrible!' Está completamente inundado por la emoción.",
            brainState: "Está 'atrapado en el borde de la rueda' (rim-locked). Solo puede ver la emoción negativa, no puede acceder al resto de su experiencia. Tu invalidación lo mantuvo atascado en ese punto de la rueda.",
            visualCue: "red",
            narratorFeedback: "Según el libro, cuando negamos las emociones del niño, lo mantenemos 'atrapado' en ese punto de la rueda. El cerebro No puede moverse entre diferentes estados y perspectivas.",
            recommendation: "CONCEPTO DEL LIBRO: Ayuda a tu hijo a 'mover la rueda' - reconoce la emoción actual, luego ayúdalo a ver que hay más en su experiencia: '¿Hubo algo bueno hoy?'",
            successLevel: 15,
            emotionalImpact: "Negativo"
        )
        
        // OUTCOME 2: Ayudar a mover la rueda de la conciencia
        let outcomeMoverRueda = YesBrainScenarioOutcome(
            childReaction: "Tu hijo suspira, se relaja un poco y dice: 'Bueno... el recreo estuvo bien. Jugué fútbol con mis amigos.' Su expresión facial se suaviza. Puede ver más allá del enojo inicial.",
            brainState: "Está aprendiendo a 'mover la rueda'. Tu validación le dio permiso de soltar la fijación en el enojo y acceder a otras partes de su experiencia. El cerebro Yes está activándose.",
            visualCue: "green",
            narratorFeedback: "¡Excelente! Estás aplicando la 'Rueda de la Conciencia' del Yes Brain. Como dice el libro: ayudar al niño a no quedar atrapado en un solo punto de la rueda, sino poder moverse entre diferentes experiencias y perspectivas.",
            recommendation: "Ahora puedes ayudarlo a procesar: 'Entonces hubo partes buenas y partes difíciles hoy. Cuéntame más sobre lo que te molestó del maestro.'",
            successLevel: 90,
            emotionalImpact: "Positivo"
        )
        
        // OUTCOME 3: Solucionar sin procesar
        let outcomeSolucionador = YesBrainScenarioOutcome(
            childReaction: "Tu hijo dice: 'No sé... tal vez.' Pero no procesó la emoción. Media hora después sigue irritable y sensible. El enojo no se fue, solo se reprimió.",
            brainState: "Saltaste directo a soluciones sin permitir que la emoción se procese. El cerebro necesita primero sentir, luego pensar. La rueda no pudo moverse naturalmente.",
            visualCue: "yellow",
            narratorFeedback: "El libro enfatiza: los niños necesitan primero sentirse comprendidos antes de poder pensar en soluciones. Saltaste el paso de validación.",
            recommendation: "PRINCIPIO DEL LIBRO: 'Name it to tame it'. Primero ayuda a nombrar y validar la emoción, luego el cerebro puede acceder a soluciones.",
            successLevel: 40,
            emotionalImpact: "Neutral"
        )
        
        let options = [
            YesBrainScenarioOption(
                text: "Le dices: 'No fue tan malo. Deja de exagerar. Todos tenemos días difíciles y no hacemos tanto drama.'",
                tone: "No Brain - Invalidación",
                nextOutcomeId: outcomeAtrapado.id,
                yesBrainAlignment: 15
            ),
            YesBrainScenarioOption(
                text: "Te sientas con él, lo abrazas y dices: 'Veo que estás muy enojado con tu maestro. Suena como que fue un día realmente difícil. Cuéntame qué pasó.'",
                tone: "Yes Brain - Validación de emoción",
                nextOutcomeId: outcomeMoverRueda.id,
                yesBrainAlignment: 90
            ),
            YesBrainScenarioOption(
                text: "Le dices: '¿Ya hablaste con tu maestro sobre esto? ¿Por qué no escribes cómo te sientes y se lo das mañana?'",
                tone: "Solucionador prematuro",
                nextOutcomeId: outcomeSolucionador.id,
                yesBrainAlignment: 40
            )
        ]
        
        return Capa4Scenario(
            title: "La Rueda de la Conciencia",
            category: "Balance",
            trigger: "Tu hijo de 8 años llega de la escuela muy enojado diciendo que 'todo el día fue horrible'",
            description: "Tu hijo entra por la puerta con cara de enojo. Avienta su mochila al suelo y dice con voz fuerte: 'Mi maestro me regañó enfrente de todos. ¡Todo el día fue horrible! ¡Odio la escuela!' Está completamente enfocado en esa emoción negativa, como si no existiera nada más en su día.",
            options: options,
            outcomes: [outcomeAtrapado, outcomeMoverRueda, outcomeSolucionador],
            insight: "CONCEPTO CLAVE DEL LIBRO: La 'Rueda de la Conciencia' (Wheel of Awareness) enseña que podemos quedar 'atrapados en el borde' (rim-locked) cuando una sola emoción o experiencia domina nuestra conciencia. El padre Yes Brain ayuda al niño a 'mover la rueda' - reconociendo la emoción actual mientras ayuda a ver que hay más en su experiencia. Esto desarrolla flexibilidad mental y balance emocional.",
            icon: "circle.hexagongrid.circle",
            color: "cyan",
            difficulty: 3
        )
    }
    
    // MARK: - ESCENARIOS DE RESILIENCIA
    // Basados en "The Resilient Yes Brain" - Capítulo 2 del libro
    
    /// Escenario 3: Los Errores son Oportunidades
    /// Concepto del libro: "Failing well" - enseñar que los errores son oportunidades de crecimiento
    private static func crearEscenarioErrorOportunidad() -> Capa4Scenario {
        // OUTCOME 1: Crear vergüenza ante el error (Shame approach)
        let outcomeVerguenza = YesBrainScenarioOutcome(
            childReaction: "Tu hija baja la cabeza, se pone roja y dice con voz temblorosa: 'Soy tonta. No sirvo para nada. Ya no voy a jugar fútbol nunca.' Se va a su cuarto llorando.",
            brainState: "El cerebro No se activó. La vergüenza bloqueó la capacidad de aprendizaje. En lugar de ver el error como oportunidad, lo ve como evidencia de su 'falta de valor'.",
            visualCue: "red",
            narratorFeedback: "Según el libro, cuando respondemos a los errores con crítica, enseñamos VERGÜENZA (shame) en lugar de RESPONSABILIDAD. El cerebro No Brain ve los errores como evidencia de incompetencia.",
            recommendation: "PRINCIPIO DEL LIBRO: 'Fail well' - los errores son el camino del aprendizaje. Ayúdala a ver: '¿Qué aprendiste? ¿Qué puedes hacer diferente la próxima vez?'",
            successLevel: 15,
            emotionalImpact: "Negativo"
        )
        
        // OUTCOME 2: Enseñar "Failing Well" (Yes Brain approach)
        let outcomeResiliencia = YesBrainScenarioOutcome(
            childReaction: "Tu hija suspira y dice: 'Sí... estuvo difícil. Pero es que vi al portero moverse y pensé que podía patear ahí.' Reflexiona un momento y añade: '¿Puedo practicar contigo más tiros a la portería?'",
            brainState: "El cerebro Yes está activo. Tu validación del esfuerzo + normalización del error activó la mentalidad de crecimiento. La corteza prefrontal puede ahora analizar, aprender y planear.",
            visualCue: "green",
            narratorFeedback: "¡Excelente! Aplicaste el concepto 'Failing Well' del libro. Como dicen Siegel y Bryson: 'Los errores no son fracasos, son oportunidades de crecimiento cuando el padre Yes Brain los reencuadra.'",
            recommendation: "Perfecto. Ahora pueden hablar de estrategias: '¿Qué podrías practicar para mejorar?' Estás construyendo el músculo de la resiliencia.",
            successLevel: 95,
            emotionalImpact: "Positivo"
        )
        
        // OUTCOME 3: Minimizar/Rescatar (evita el aprendizaje)
        let outcomeRescate = YesBrainScenarioOutcome(
            childReaction: "Tu hija sonríe aliviada: 'Sí, tienes razón. No fue mi culpa.' Pero no procesó su rol en el error. Cuando vuelva a fallar, culpará a factores externos nuevamente.",
            brainState: "El 'rescate' bloqueó el aprendizaje. No desarrolló la capacidad de autorreflexión ni responsabilidad. El cerebro aprendió a evitar el procesamiento del error.",
            visualCue: "yellow",
            narratorFeedback: "El libro advierte sobre el 'helicopter parenting' que rescata al niño del error. Esto impide desarrollar resiliencia. El Yes Brain acompaña, pero no rescata del aprendizaje.",
            recommendation: "CONCEPTO DEL LIBRO: Los niños necesitan 'luchar con las dificultades' para desarrollar resiliencia. Acompaña, valida, pero permite el procesamiento del error.",
            successLevel: 30,
            emotionalImpact: "Neutral"
        )
        
        let options = [
            YesBrainScenarioOption(
                text: "Le dices con tono de decepción: '¿Por qué fallaste ese tiro? Estuviste practicando toda la semana. Deberías haberlo metido.'",
                tone: "No Brain - Crítica/Vergüenza",
                nextOutcomeId: outcomeVerguenza.id,
                yesBrainAlignment: 15
            ),
            YesBrainScenarioOption(
                text: "Te sientas a su lado, le pasas el brazo por los hombros y dices: 'Veo que estás decepcionada. Fallaste ese tiro y tu equipo perdió. Es difícil. Cuéntame cómo te sientes.'",
                tone: "Yes Brain - Failing Well",
                nextOutcomeId: outcomeResiliencia.id,
                yesBrainAlignment: 95
            ),
            YesBrainScenarioOption(
                text: "Le dices rápidamente: 'No te preocupes, mi amor. No fue tu culpa. El portero estaba muy bien colocado. Además, el sol te estaba dando en los ojos.'",
                tone: "Rescatador - Evita responsabilidad",
                nextOutcomeId: outcomeRescate.id,
                yesBrainAlignment: 30
            )
        ]
        
        return Capa4Scenario(
            title: "Aprender a Fallar Bien",
            category: "Resiliencia",
            trigger: "Tu hija de 9 años falló un tiro de penal y su equipo perdió el partido de fútbol",
            description: "Es el último minuto del partido. El equipo de tu hija va empatado. Le dan un penal a favor. Ella es la que tira. Todos sus compañeros gritan '¡Tú puedes!' Tira... y falla. El portero ataja el balón. El partido termina en empate y su equipo queda fuera del torneo. Tu hija sale del campo con lágrimas en los ojos, sintiéndose responsable por la derrota del equipo.",
            options: options,
            outcomes: [outcomeVerguenza, outcomeResiliencia, outcomeRescate],
            insight: "CONCEPTO CENTRAL DEL LIBRO: 'Failing Well' es una de las habilidades más importantes del cerebro resiliente. Como dicen Siegel y Bryson: 'Los niños con Yes Brain ven los errores como oportunidades de aprendizaje, no como evidencia de incompetencia.' El padre Yes Brain ayuda al niño a procesar el error con autocompasión y curiosidad, no con vergüenza o rescate.",
            icon: "figure.soccer",
            color: "green",
            difficulty: 4
        )
    }
    
    /// Escenario 4: La Frustración como Combustible del Crecimiento
    /// Concepto del libro: Enseñar que la frustración es temporal y manejable
    private static func crearEscenarioFrustracionCrecimiento() -> Capa4Scenario {
        // OUTCOME 1: Resolver por el niño (Low road to frustration)
        let outcomeResolver = YesBrainScenarioOutcome(
            childReaction: "Tu hijo te da el rompecabezas aliviado: 'Gracias, papi/mami.' Tú lo armas rápidamente. Él observa pero no aprende. La próxima vez que enfrente algo difícil, volverá a pedirte que lo resuelvas.",
            brainState: "Has privado a su cerebro de la oportunidad de 'luchar productivamente'. El libro llama a esto 'low road to frustration' - evitar la incomodidad impide el crecimiento de la resiliencia.",
            visualCue: "red",
            narratorFeedback: "Según Siegel y Bryson, cuando resolvemos por el niño, enviamos el mensaje: 'No confío en que puedas hacerlo.' El cerebro No aprende a tolerar frustración.",
            recommendation: "PRINCIPIO DEL LIBRO: La frustración es el combustible del crecimiento. Siéntate a su lado, pero deja que él luche: 'Veamos juntos. ¿Por dónde podrías empezar?'",
            successLevel: 20,
            emotionalImpact: "Negativo"
        )
        
        // OUTCOME 2: Acompañar la frustración (Yes Brain resilience)
        let outcomeAcompana = YesBrainScenarioOutcome(
            childReaction: "Tu hijo respira profundo, mira el rompecabezas de nuevo y dice: 'Okay... déjame intentar otra vez.' Prueba diferentes piezas. Después de unos minutos logra encajar una y grita emocionado: '¡Mira, encontré una!'",
            brainState: "Has activado el cerebro resiliente. Tu mensaje ('Puedes hacerlo, yo estoy aquí') activó la corteza prefrontal para persistir. Está desarrollando tolerancia a la frustración.",
            visualCue: "green",
            narratorFeedback: "¡Perfecto! Aplicaste el principio Yes Brain de la resiliencia. Como dice el libro: 'Los niños necesitan luchar con desafíos apropiados para su edad, con un adulto cerca que crea en ellos.'",
            recommendation: "Excelente. Has balanceado apoyo con autonomía. Estás enseñando: 'La frustración es temporal. Puedo manejarla. Los adultos confían en mí.'",
            successLevel: 95,
            emotionalImpact: "Positivo"
        )
        
        // OUTCOME 3: Minimizar la frustración
        let outcomeMinimiza = YesBrainScenarioOutcome(
            childReaction: "Tu hijo dice: 'Okay...' y deja el rompecabezas. Se va a jugar con otra cosa. Parece tranquilo, pero no desarrolló perseverancia. La próxima vez que algo sea difícil, también lo dejará.",
            brainState: "Has enviado el mensaje: 'Cuando algo es difícil, déjalo y haz otra cosa fácil.' El cerebro no desarrolló la capacidad de tolerar frustración ni persistir.",
            visualCue: "yellow",
            narratorFeedback: "El libro advierte: minimizar la frustración ('no importa') impide que el niño desarrolle resiliencia. El Yes Brain dice: 'Sí importa, Y tú puedes manejarlo.'",
            recommendation: "CONCEPTO DEL LIBRO: La frustración apropiada + acompañamiento = crecimiento. No elimines el desafío, acompaña el proceso.",
            successLevel: 35,
            emotionalImpact: "Neutral"
        )
        
        let options = [
            YesBrainScenarioOption(
                text: "Le dices: 'Dámelo, yo lo armo. Ven, vamos a hacer otra cosa más fácil.'",
                tone: "No Brain - Resolver/Rescatar",
                nextOutcomeId: outcomeResolver.id,
                yesBrainAlignment: 20
            ),
            YesBrainScenarioOption(
                text: "Te sientas a su lado y dices: 'Veo que esto es difícil. La frustración se siente incómoda, ¿verdad? Pero tú puedes manejarlo. Yo estoy aquí si necesitas ayuda.'",
                tone: "Yes Brain - Acompañar frustración",
                nextOutcomeId: outcomeAcompana.id,
                yesBrainAlignment: 95
            ),
            YesBrainScenarioOption(
                text: "Le dices con tono alegre: 'Ay, no te frustres. Es solo un juego. No importa si no lo terminas. Vamos a jugar otra cosa.'",
                tone: "Minimizador - Evitar",
                nextOutcomeId: outcomeMinimiza.id,
                yesBrainAlignment: 35
            )
        ]
        
        return Capa4Scenario(
            title: "La Frustración como Combustible",
            category: "Resiliencia",
            trigger: "Tu hijo de 6 años está frustrado porque no puede armar un rompecabezas",
            description: "Tu hijo está en la mesa armando un rompecabezas de 100 piezas. Lleva 20 minutos intentando y está progresando bien. De repente no puede encontrar una pieza que necesita. Lo ves buscar, intentar diferentes piezas y ninguna encaja. Su frustración aumenta. Hace un sonido de molestia y dice: 'No puedo. Es muy difícil. Ayúdame.'",
            options: options,
            outcomes: [outcomeResolver, outcomeAcompana, outcomeMinimiza],
            insight: "CONCEPTO FUNDAMENTAL DEL LIBRO: El cerebro resiliente se construye mediante 'productive struggle' - lucha productiva. Como dicen Siegel y Bryson: 'La frustración apropiada para la edad, acompañada por un adulto que cree en el niño, es el gimnasio donde se fortalece la resiliencia.' Resolver por el niño o minimizar el desafío impide este crecimiento.",
            icon: "puzzlepiece.fill",
            color: "orange",
            difficulty: 2
        )
    }
    
    /// Escenario 3 Balance: La Zona Verde (Green Zone)
    /// Concepto del libro: Mantener al niño en la "zona verde" de calma y receptividad
    private static func crearEscenarioZonaVerde() -> Capa4Scenario {
        // OUTCOME 1: Empujar a la zona roja (Red zone reactivity)
        let outcomeZonaRoja = YesBrainScenarioOutcome(
            childReaction: "Tu hijo se pone más tenso. Sus puños se aprietan, su respiración se acelera. Grita: '¡Tú no entiendes nada!' y corre a su cuarto dando un portazo. Entró a la zona roja de reactividad.",
            brainState: "Lo empujaste de la zona amarilla (frustración) a la zona ROJA (reactividad total). Tu invalidación impidió que regresara a la zona verde. El cerebro reptiliano tomó control.",
            visualCue: "red",
            narratorFeedback: "CONCEPTO DEL LIBRO: Siegel y Bryson enseñan que hay tres 'zonas': verde (receptivo), amarilla (estrés manejable), roja (reactivo). Tu respuesta lo empujó a rojo en lugar de ayudarlo a regresar a verde.",
            recommendation: "Cuando veas señales de zona amarilla, interviene CON calma. Ofrece estrategias de regulación: 'Veo que estás frustrado. ¿Quieres respirar juntos?'",
            successLevel: 15,
            emotionalImpact: "Negativo"
        )
        
        // OUTCOME 2: Ayudar a regresar a zona verde (Yes Brain regulation)
        let outcomeZonaVerde = YesBrainScenarioOutcome(
            childReaction: "Tu hijo respira profundo como le enseñaste. Después de unos segundos, sus hombros se relajan. Dice más calmado: 'Está bien... voy a intentarlo otra vez. Pero me está costando mucho.'",
            brainState: "Regresó a la zona VERDE. Tu presencia calmada + recordatorio de estrategia activó su sistema de autorregulación. El cerebro superior volvió a conectarse.",
            visualCue: "green",
            narratorFeedback: "¡Excelente aplicación del Yes Brain! Como dice el libro: 'Los padres son los termostatos emocionales de sus hijos.' Tu calma lo ayudó a regularse y regresar a zona verde.",
            recommendation: "Perfecto. Ahora que está en zona verde, puede aprender: 'Veo que respiraste. ¿Te ayudó a calmarte? Esa es una herramienta que puedes usar siempre.'",
            successLevel: 90,
            emotionalImpact: "Positivo"
        )
        
        // OUTCOME 3: Quedarse en zona amarilla (Missed opportunity)
        let outcomeZonaAmarilla = YesBrainScenarioOutcome(
            childReaction: "Tu hijo suspira y dice: 'Sí, ayúdame.' Funciona, pero se quedó en zona amarilla de dependencia. No activó sus propias estrategias de regulación.",
            brainState: "Evitaste la zona roja, pero tampoco regresó a verde. Se quedó en zona amarilla de estrés. No practicó autorregulación, solo recibió ayuda externa.",
            visualCue: "yellow",
            narratorFeedback: "El libro enseña: ayudar está bien, PERO también necesitamos enseñar al niño a reconocer y usar sus propias herramientas de regulación.",
            recommendation: "Pregunta PRIMERO: '¿Qué puedes hacer para calmarte?' Dale oportunidad de intentar sus estrategias antes de rescatarlo.",
            successLevel: 45,
            emotionalImpact: "Neutral"
        )
        
        let options = [
            YesBrainScenarioOption(
                text: "Le dices con tono impaciente: 'Ya te dije cómo se hace. ¿Por qué no pones atención? Deja de frustrarte y hazlo.'",
                tone: "No Brain - Invalida emoción",
                nextOutcomeId: outcomeZonaRoja.id,
                yesBrainAlignment: 15
            ),
            YesBrainScenarioOption(
                text: "Te acercas con calma, te agachas a su nivel y dices suavemente: 'Veo que estás frustrado. Recuerda: puedes respirar profundo tres veces. ¿Lo intentamos juntos?'",
                tone: "Yes Brain - Zona verde",
                nextOutcomeId: outcomeZonaVerde.id,
                yesBrainAlignment: 90
            ),
            YesBrainScenarioOption(
                text: "Le dices: 'Ven, yo te ayudo. Déjame mostrarte cómo se hace.'",
                tone: "Rescatador - No enseña",
                nextOutcomeId: outcomeZonaAmarilla.id,
                yesBrainAlignment: 45
            )
        ]
        
        return Capa4Scenario(
            title: "Regresar a la Zona Verde",
            category: "Balance",
            trigger: "Tu hijo de 7 años está frustrado con su tarea de matemáticas y empieza a mostrar señales de desregulación",
            description: "Tu hijo está haciendo su tarea de matemáticas. Notas que su cuerpo empieza a tensarse: aprieta el lápiz con fuerza, frunce el ceño, su respiración se acelera. Dice con voz tensa: 'Esto es muy difícil. No entiendo nada.' Reconoces las señales: está saliendo de su zona verde hacia la zona amarilla de estrés.",
            options: options,
            outcomes: [outcomeZonaRoja, outcomeZonaVerde, outcomeZonaAmarilla],
            insight: "CONCEPTO DEL LIBRO: Siegel y Bryson describen tres zonas de activación: VERDE (receptivo, balanceado, puede aprender), AMARILLA (estresado, empieza a desregularse), ROJA (reactivo, cerebro superior desconectado). El padre Yes Brain reconoce las señales tempranas de zona amarilla e interviene ANTES de que llegue a roja, ofreciendo herramientas de co-regulación que ayudan al niño a regresar a verde.",
            icon: "traffic.light.fill",
            color: "green",
            difficulty: 2
        )
    }
    
    /// Escenario 4 Balance: Respirar Antes de Reaccionar (SIFT - Sensations, Images, Feelings, Thoughts)
    /// Concepto del libro: Usar SIFT para ayudar al niño a conectar con su experiencia interna
    private static func crearEscenarioRespirarAntesReaccionar() -> Capa4Scenario {
        // OUTCOME 1: Reacción inmediata sin pausa (No Brain reactivity)
        let outcomeReaccionInmediata = YesBrainScenarioOutcome(
            childReaction: "Tu hija te mira con miedo en los ojos. Se encoge y dice llorando: 'Perdón, perdón, no lo vuelvo a hacer.' Está asustada, no aprendiendo.",
            brainState: "Tu reactividad activó su respuesta de miedo. El cerebro entró en modo supervivencia. No hay aprendizaje, solo miedo al castigo. El cerebro No Brain en ambos.",
            visualCue: "red",
            narratorFeedback: "Según el libro: 'Cuando reaccionamos desde el No Brain, enseñamos reactividad.' Tu hija no aprendió sobre el vaso, aprendió a tener miedo de cometer errores.",
            recommendation: "PRÁCTICA DEL LIBRO: Cuando sientas el impulso de reaccionar, SIFT (Sensations, Images, Feelings, Thoughts) - nota lo que sientes ANTES de actuar. Esto activa tu Yes Brain.",
            successLevel: 10,
            emotionalImpact: "Negativo"
        )
        
        // OUTCOME 2: Pausar y respirar (Yes Brain mindfulness)
        let outcomePausaConsciente = YesBrainScenarioOutcome(
            childReaction: "Tu hija te mira nerviosa, pero ve que estás respirando. Después de unos segundos dices: 'Vi que se cayó el vaso. ¿Estás bien? ¿Hay vidrios?' Ella asiente aliviada y dice: 'Perdón, mamá/papá. Fue un accidente.'",
            brainState: "Tu PAUSA activó tu corteza prefrontal. Esto permitió que respondieras en lugar de reaccionar. Tu hija ve que los errores pueden manejarse con calma. Cerebro Yes Brain en acción.",
            visualCue: "green",
            narratorFeedback: "¡Excelente! Aplicaste la técnica SIFT del libro: pausar, sentir, luego responder. Como dicen Siegel y Bryson: 'Entre estímulo y respuesta hay un espacio. En ese espacio está nuestro poder.'",
            recommendation: "Perfecto. Ahora pueden limpiar juntos y usar esto como enseñanza: 'Los accidentes pasan. Lo importante es estar bien y limpiar con calma.'",
            successLevel: 95,
            emotionalImpact: "Positivo"
        )
        
        // OUTCOME 3: Contener reacción externamente pero no internamente
        let outcomeContencionSuperficial = YesBrainScenarioOutcome(
            childReaction: "Tu hija dice: 'Okay, lo siento.' Pero nota la tensión en tu cuerpo y voz. Limpia rápidamente, ansiosa. Funcionó externamente, pero creó ansiedad interna.",
            brainState: "Contuviste la reacción EXTERNA (no gritaste) pero tu cuerpo y energía comunicaron No Brain. Los niños leen el lenguaje corporal más que las palabras.",
            visualCue: "yellow",
            narratorFeedback: "El libro enfatiza: No se trata solo de NO gritar, sino de realmente ESTAR en Yes Brain internamente. Tu hija sintió tu tensión aunque no gritaras.",
            recommendation: "CONCEPTO DEL LIBRO: El Yes Brain es un estado interno, no solo una conducta externa. Respira hasta que realmente SIENTAS calma, no solo la aparentes.",
            successLevel: 40,
            emotionalImpact: "Neutral"
        )
        
        let options = [
            YesBrainScenarioOption(
                text: "Gritas inmediatamente: '¡¿Qué hiciste?! ¡Te dije que tuvieras cuidado! ¡Mira el desastre que hiciste!'",
                tone: "No Brain - Reactividad pura",
                nextOutcomeId: outcomeReaccionInmediata.id,
                yesBrainAlignment: 10
            ),
            YesBrainScenarioOption(
                text: "Sientes el impulso de gritar, pero PAUSAS. Cierras los ojos, respiras profundo 3 veces. Luego dices con calma: 'Veo que se cayó el vaso. ¿Estás bien?'",
                tone: "Yes Brain - SIFT y pausa",
                nextOutcomeId: outcomePausaConsciente.id,
                yesBrainAlignment: 95
            ),
            YesBrainScenarioOption(
                text: "Contienes el grito pero dices con voz tensa y cuerpo rígido: 'Está bien. No pasa nada. Solo... ve a traer la escoba, por favor.'",
                tone: "Contención superficial",
                nextOutcomeId: outcomeContencionSuperficial.id,
                yesBrainAlignment: 40
            )
        ]
        
        return Capa4Scenario(
            title: "Respirar Antes de Reaccionar",
            category: "Balance",
            trigger: "Tu hija de 6 años derrama accidentalmente un vaso de jugo en el piso de la cocina",
            description: "Acabas de limpiar toda la casa. Estás cansado. Tu hija está tomando jugo en la cocina y de repente escuchas un fuerte sonido de vidrio rompiéndose. El vaso se cayó y hay jugo por todo el piso que acabas de trapear. Sientes el impulso inmediato de gritar. Tu sistema nervioso se activa: el corazón late más rápido, sientes calor en el pecho, las palabras de regaño suben por tu garganta.",
            options: options,
            outcomes: [outcomeReaccionInmediata, outcomePausaConsciente, outcomeContencionSuperficial],
            insight: "CONCEPTO FUNDAMENTAL DEL LIBRO: SIFT (Sensations, Images, Feelings, Thoughts) es una práctica de mindfulness que ayuda a crear un ESPACIO entre el estímulo y la respuesta. Siegel y Bryson enseñan: 'Cuando pausamos antes de reaccionar, activamos nuestro cerebro superior y podemos elegir una respuesta Yes Brain en lugar de una reacción No Brain.' No se trata de suprimir la emoción, sino de sentirla, reconocerla y LUEGO elegir cómo responder.",
            icon: "wind",
            color: "mint",
            difficulty: 4
        )
    }
    
    /// Escenario 5 Resiliencia: Control vs. Cosas que No Puedo Controlar
    /// Concepto del libro: Enseñar a enfocarse en lo que SÍ pueden controlar
    private static func crearEscenarioControlVsCosasQueNoControl() -> Capa4Scenario {
        // OUTCOME 1: Fomentar la impotencia aprendida
        let outcomeImpotencia = YesBrainScenarioOutcome(
            childReaction: "Tu hijo se encoge de hombros con resignación: 'Sí, tienes razón. No hay nada que hacer. Siempre me va mal.' Se tira en el sofá sin energía.",
            brainState: "Has reforzado la 'impotencia aprendida' (learned helplessness). El cerebro aprendió: 'No tengo control sobre nada.' Esto es lo opuesto a la resiliencia.",
            visualCue: "gray",
            narratorFeedback: "ADVERTENCIA DEL LIBRO: Cuando validamos la victimización sin ayudar a encontrar agencia, enseñamos impotencia. El Yes Brain busca SIEMPRE el punto de control.",
            recommendation: "Reformula: 'Es cierto que la lluvia no la controlas. ¿Qué SÍ puedes controlar? ¿Tu esfuerzo? ¿Tu actitud? ¿Practicar antes del próximo partido?'",
            successLevel: 20,
            emotionalImpact: "Negativo"
        )
        
        // OUTCOME 2: Enfocarse en lo que SÍ controla (Yes Brain resilience)
        let outcomeControl = YesBrainScenarioOutcome(
            childReaction: "Tu hijo piensa un momento y dice: 'Mmm... no puedo controlar la lluvia. Pero SÍ puedo controlar cuánto practico y qué tan bien juego con lo que hay.' Se ve más animado: '¿Puedo practicar tiros con lluvia?'",
            brainState: "¡Cerebro Yes activado! Pasó de victimización a agencia. La corteza prefrontal identificó variables controlables. Esto es resiliencia: encontrar poder donde parece que no hay.",
            visualCue: "green",
            narratorFeedback: "¡Perfecto! Aplicaste el concepto del libro 'Control vs. No Control'. Siegel y Bryson enseñan: 'Los niños resilientes aprenden a enfocar su energía en lo que SÍ pueden cambiar.'",
            recommendation: "Excelente. Refuerza: 'Exacto. No controlas el clima, pero SÍ controlas tu esfuerzo y actitud. Eso es ser resiliente.'",
            successLevel: 95,
            emotionalImpact: "Positivo"
        )
        
        // OUTCOME 3: Soluciones superficiales sin procesamiento
        let outcomeSuperficial = YesBrainScenarioOutcome(
            childReaction: "Tu hijo dice: 'Sí, tienes razón.' Pero no internalizó el concepto. Sigue sintiéndose víctima de las circunstancias. La próxima vez que algo salga mal, volverá a culpar a factores externos.",
            brainState: "Aceptó tu consejo cognitivamente pero no lo integró emocionalmente. El cerebro No aprendió a identificar su propio poder y agencia.",
            visualCue: "yellow",
            narratorFeedback: "El libro enseña que dar consejos sin primero validar y luego co-descubrir no construye resiliencia real. Solo crea compliance.",
            recommendation: "Valida PRIMERO la emoción: 'Es frustrante cuando el clima arruina tus planes.' LUEGO invita a buscar juntos: '¿Qué crees que SÍ puedes controlar?'",
            successLevel: 40,
            emotionalImpact: "Neutral"
        )
        
        let options = [
            YesBrainScenarioOption(
                text: "Le dices: 'Sí, mala suerte. A veces las cosas no salen como queremos. Qué se le va a hacer.'",
                tone: "No Brain - Refuerza impotencia",
                nextOutcomeId: outcomeImpotencia.id,
                yesBrainAlignment: 20
            ),
            YesBrainScenarioOption(
                text: "Te sientas con él y dices: 'Es cierto, no puedes controlar la lluvia. Es frustrante. Ahora, hablemos de lo que SÍ puedes controlar. ¿Qué cosas dependen de ti?'",
                tone: "Yes Brain - Buscar control",
                nextOutcomeId: outcomeControl.id,
                yesBrainAlignment: 95
            ),
            YesBrainScenarioOption(
                text: "Le dices: 'Tienes que aprender a no dejar que cosas como el clima te afecten. Tienes que ser más fuerte mentalmente.'",
                tone: "Consejo sin validación",
                nextOutcomeId: outcomeSuperficial.id,
                yesBrainAlignment: 40
            )
        ]
        
        return Capa4Scenario(
            title: "Lo que Puedo y No Puedo Controlar",
            category: "Resiliencia",
            trigger: "Tu hijo de 10 años está frustrado porque llovió el día de su partido importante de fútbol",
            description: "Tu hijo tenía un partido muy importante hoy. Llevaba semanas preparándose. Pero amaneció lloviendo intensamente y cancelaron el partido. Tu hijo está en el sofá, mirando por la ventana la lluvia, con cara de total frustración. Dice: 'No es justo. Practiqué tanto y ahora todo se arruinó por la lluvia. Nunca me va bien.'",
            options: options,
            outcomes: [outcomeImpotencia, outcomeControl, outcomeSuperficial],
            insight: "CONCEPTO PODEROSO DEL LIBRO: Siegel y Bryson enseñan que la resiliencia viene de distinguir entre 'lo que puedo controlar' vs. 'lo que no puedo controlar'. El cerebro Yes Brain enfoca su energía en las variables controlables (esfuerzo, actitud, práctica) en lugar de quedar atrapado en lo incontrolable (clima, acciones de otros). Esto se llama 'locus de control interno' y es fundamental para la resiliencia.",
            icon: "hand.raised.fill",
            color: "teal",
            difficulty: 3
        )
    }
    
    /// Escenario 6 Resiliencia: Perder y Ganar con Gracia
    /// Concepto del libro: La frustración es parte del aprendizaje, no algo a evitar
    private static func crearEscenarioPerderGanar() -> Capa4Scenario {
        // OUTCOME 1: Evitar la frustración completamente (Overprotection)
        let outcomeEvitaFrustracion = YesBrainScenarioOutcome(
            childReaction: "Tu hijo dice: 'Está bien, gracias.' Pero cuando juegas con él, notas que no le gusta perder. Cuando pierde un juego de mesa, llora y dice que 'el juego es injusto'.",
            brainState: "Al protegerlo de la frustración pequeña (perder un juego), no desarrolló músculo emocional para manejar frustraciones mayores. El cerebro necesita PRACTICAR con desafíos pequeños.",
            visualCue: "red",
            narratorFeedback: "CONCEPTO DEL LIBRO: Siegel y Bryson advierten contra la 'sobreprotección emocional'. Los niños necesitan dosis apropiadas de frustración para desarrollar resiliencia. Evitarla completamente los deja frágiles.",
            recommendation: "El Yes Brain dice: 'Perder es parte del juego. Es incómodo Y es una oportunidad de practicar manejar la frustración.'",
            successLevel: 25,
            emotionalImpact: "Negativo"
        )
        
        // OUTCOME 2: Acompañar la frustración y enseñar (Yes Brain growth)
        let outcomeAprendePerder = YesBrainScenarioOutcome(
            childReaction: "Tu hijo suspira frustrado pero dice: 'Tienes razón... A veces gano, a veces pierdo.' Piensa un momento y añade: 'Pero me divertí jugando. ¿Podemos jugar otra vez?'",
            brainState: "¡Cerebro resiliente en construcción! Procesó la frustración SIN quedar atrapado en ella. Puede ver la experiencia más allá del resultado. Está desarrollando tolerancia emocional.",
            visualCue: "green",
            narratorFeedback: "¡Excelente! Aplicaste el Yes Brain a la competencia. El libro enseña: 'Perder con gracia' es una habilidad que se aprende cuando los padres validan la frustración Y normalizan el fracaso.",
            recommendation: "Perfecto. Refuerza: 'Veo que te frustra perder Y puedes manejarlo. Eso es crecer.' Estás enseñando resiliencia emocional real.",
            successLevel: 92,
            emotionalImpact: "Positivo"
        )
        
        // OUTCOME 3: Forzar positividad tóxica
        let outcomePositividadToxica = YesBrainScenarioOutcome(
            childReaction: "Tu hijo reprime su frustración y dice forzadamente: 'Sí, estoy feliz.' Pero su cuerpo está tenso. No procesó la emoción, solo la escondió. Eso genera vergüenza de sentir frustración.",
            brainState: "La 'positividad tóxica' bloqueó el procesamiento emocional. El cerebro aprendió: 'No está bien sentirse mal cuando pierdo.' Esto genera represión, no resiliencia.",
            visualCue: "yellow",
            narratorFeedback: "ADVERTENCIA DEL LIBRO: Forzar 'alegría' cuando el niño está frustrado invalida su experiencia. El Yes Brain valida TODAS las emociones, luego ayuda a procesarlas.",
            recommendation: "Es NORMAL sentirse frustrado al perder. Valida: 'Veo que te sientes mal. Está bien. Podemos sentirnos frustrados Y aun así jugar de nuevo.'",
            successLevel: 35,
            emotionalImpact: "Neutral"
        )
        
        let options = [
            YesBrainScenarioOption(
                text: "Le dices alegre: 'Ay no, mi amor. No te preocupes. ¿Sabes qué? Mejor jugamos a otra cosa donde tú siempre ganas. Ven, pongamos un rompecabezas.'",
                tone: "No Brain - Sobreprotección",
                nextOutcomeId: outcomeEvitaFrustracion.id,
                yesBrainAlignment: 25
            ),
            YesBrainScenarioOption(
                text: "Te sientas a su lado y dices: 'Veo que perdiste y eso se siente feo. Es normal sentirse frustrado cuando perdemos. A veces ganamos, a veces perdemos. Ambas cosas enseñan.'",
                tone: "Yes Brain - Validar + Normalizar",
                nextOutcomeId: outcomeAprendePerder.id,
                yesBrainAlignment: 92
            ),
            YesBrainScenarioOption(
                text: "Le dices con tono alegre: '¡No importa ganar o perder! Lo importante es divertirse. ¿Verdad que estás feliz de todos modos?'",
                tone: "Positividad tóxica",
                nextOutcomeId: outcomePositividadToxica.id,
                yesBrainAlignment: 35
            )
        ]
        
        return Capa4Scenario(
            title: "Perder con Gracia",
            category: "Resiliencia",
            trigger: "Tu hijo de 6 años acaba de perder un juego de mesa contra ti y está visiblemente frustrado",
            description: "Están jugando un juego de mesa familiar. Tu hijo de 6 años estaba ganando durante casi toda la partida. En los últimos turnos, la suerte cambia y tú ganas. Cuando pones tu ficha final, tu hijo ve el resultado. Su cara cambia: de emocionado a frustrado. Dice con voz quebrada: 'Pero... yo iba ganando... No es justo.' Sus ojos se llenan de lágrimas.",
            options: options,
            outcomes: [outcomeEvitaFrustracion, outcomeAprendePerder, outcomePositividadToxica],
            insight: "CONCEPTO DEL LIBRO: Siegel y Bryson explican que los niños necesitan 'dosis apropiadas de adversidad' para desarrollar resiliencia. Perder en un juego es una frustración SEGURA donde pueden practicar manejar la decepción. El padre Yes Brain valida la frustración (es real) Y enseña que es temporal y manejable. Evitar toda frustración crea fragilidad. Forzar positividad crea represión. El camino medio es: sentir, validar, aprender.",
            icon: "trophy.fill",
            color: "yellow",
            difficulty: 2
        )
    }
    
    // MARK: - ESCENARIOS DE INSIGHT (Introspección)
    // Basados en "The Insightful Yes Brain" - Capítulo 3 del libro
    
    /// Escenario 7 Insight: Mindsight - Ver el Mundo Interior
    /// Concepto del libro: Desarrollar la capacidad de observar los propios pensamientos y sentimientos
    private static func crearEscenarioMindSight() -> Capa4Scenario {
        // OUTCOME 1: Negar el mundo interior (External focus only)
        let outcomeNiegaInterior = YesBrainScenarioOutcome(
            childReaction: "Tu hija reprime las lágrimas y dice: 'Nada. Estoy bien.' Aprende que sus emociones no son válidas de explorar. Se desconecta de su mundo interior.",
            brainState: "Has bloqueado el desarrollo de 'mindsight' - la capacidad de ver hacia dentro. El cerebro aprende a ignorar señales internas. Esto es lo opuesto al insight.",
            visualCue: "gray",
            narratorFeedback: "CONCEPTO DEL LIBRO: 'Mindsight' es la capacidad de observar nuestro mundo interior. Cuando negamos o minimizamos las emociones del niño, les enseñamos a desconectarse de su experiencia interna.",
            recommendation: "El Yes Brain invita a la exploración interior: 'Veo que algo está pasando dentro de ti. ¿Quieres contarme qué estás sintiendo?'",
            successLevel: 15,
            emotionalImpact: "Negativo"
        )
        
        // OUTCOME 2: Desarrollar mindsight (Yes Brain introspection)
        let outcomeMindsight = YesBrainScenarioOutcome(
            childReaction: "Tu hija piensa un momento, toca su pecho y dice: 'Siento como mariposas aquí... y también un poco de presión. Creo que estoy nerviosa porque mañana tengo examen.'",
            brainState: "¡Mindsight en acción! Está aprendiendo a observar su experiencia interna: sensaciones corporales, emociones, pensamientos. El cerebro insightful se está desarrollando.",
            visualCue: "purple",
            narratorFeedback: "¡Excelente! Estás enseñando 'mindsight' - el concepto central del libro. Como dice Siegel: 'Ver el mundo interior es tan importante como ver el mundo exterior.'",
            recommendation: "Perfecto. Ahora pueden explorar: '¿Qué te ayudaría a sentirte mejor con el examen?' Estás enseñando autoconciencia.",
            successLevel: 95,
            emotionalImpact: "Positivo"
        )
        
        // OUTCOME 3: Intelectualizar sin sentir
        let outcomeIntelectualiza = YesBrainScenarioOutcome(
            childReaction: "Tu hija dice: 'Supongo que estoy estresada por el examen.' Pero lo dice mecánicamente, sin conectar con la emoción. Conoce la palabra pero no la siente.",
            brainState: "Está en la cabeza, no en el cuerpo. El insight real requiere conexión con la experiencia sentida (felt sense), no solo etiquetas cognitivas.",
            visualCue: "yellow",
            narratorFeedback: "El libro diferencia entre 'saber acerca de' vs. 'conocer directamente'. Tu hija etiquetó la emoción pero no la exploró. Mindsight requiere sentir, no solo pensar.",
            recommendation: "Invita a profundizar: '¿Dónde en tu cuerpo sientes eso? ¿Cómo se siente exactamente?' Conecta pensamiento con sensación.",
            successLevel: 45,
            emotionalImpact: "Neutral"
        )
        
        let options = [
            YesBrainScenarioOption(
                text: "Le dices mientras sigues cocinando: 'Si no hay nada malo, entonces sonríe. No pongas esa cara.'",
                tone: "No Brain - Niega interior",
                nextOutcomeId: outcomeNiegaInterior.id,
                yesBrainAlignment: 15
            ),
            YesBrainScenarioOption(
                text: "Dejas lo que estás haciendo, te sientas con ella y dices con curiosidad genuina: 'Noto que tu cara está triste. ¿Qué está pasando dentro de ti? ¿Puedes sentir qué emoción es?'",
                tone: "Yes Brain - Mindsight",
                nextOutcomeId: outcomeMindsight.id,
                yesBrainAlignment: 95
            ),
            YesBrainScenarioOption(
                text: "Le dices: 'Bueno, si no quieres hablar está bien. Pero debes tener alguna razón para estar así. ¿Estás estresada?'",
                tone: "Intelectualizar sin sentir",
                nextOutcomeId: outcomeIntelectualiza.id,
                yesBrainAlignment: 45
            )
        ]
        
        return Capa4Scenario(
            title: "Mindsight - Ver Hacia Dentro",
            category: "Insight",
            trigger: "Tu hija de 8 años está callada y con cara triste, pero dice que 'no pasa nada'",
            description: "Estás preparando la cena y notas que tu hija está sentada en la mesa con cara triste, mirando al vacío. Le preguntas: '¿Estás bien?' Ella responde automáticamente: 'Sí, estoy bien.' Pero su lenguaje corporal dice lo contrario: hombros caídos, mirada perdida, no ha tocado su merienda.",
            options: options,
            outcomes: [outcomeNiegaInterior, outcomeMindsight, outcomeIntelectualiza],
            insight: "CONCEPTO FUNDAMENTAL DEL LIBRO: 'Mindsight' es la capacidad de ver nuestro propio mundo interior - pensamientos, emociones, sensaciones. Siegel (creador del término) explica que desarrollar mindsight requiere que los padres INVITEN al niño a explorar su experiencia interna con curiosidad, no con juicio. Esto es la base del cerebro insightful: poder observar lo que sucede dentro para luego entenderlo y manejarlo.",
            icon: "eye.circle.fill",
            color: "purple",
            difficulty: 3
        )
    }
    
    /// Escenario 8 Insight: Integración Cerebro Superior e Inferior
    /// Concepto del libro: Conectar pensamientos (upstairs) con emociones (downstairs)
    private static func crearEscenarioIntegracionCerebroSuperiorInferior() -> Capa4Scenario {
        // OUTCOME 1: Solo lógica sin emoción (Upstairs only)
        let outcomeSoloLogica = YesBrainScenarioOutcome(
            childReaction: "Tu hijo dice: 'Tienes razón. Es solo un perro. No debería tener miedo.' Pero su cuerpo sigue tenso, sus manos sudan. La lógica no calmó su miedo.",
            brainState: "El cerebro superior (lógica) intentó anular al cerebro inferior (emoción). Pero el miedo sigue ahí, solo ahora con vergüenza añadida por 'no debería sentirlo'.",
            visualCue: "red",
            narratorFeedback: "ERROR COMÚN: El libro enseña que no podemos usar solo lógica para calmar emociones. Necesitamos INTEGRACIÓN: reconocer la emoción (downstairs) Y luego pensarla (upstairs).",
            recommendation: "PRINCIPIO DEL LIBRO: 'Conecta y redirige' - primero valida la emoción del cerebro inferior, LUEGO activa el cerebro superior con lógica.",
            successLevel: 20,
            emotionalImpact: "Negativo"
        )
        
        // OUTCOME 2: Integrar emoción y pensamiento (Yes Brain integration)
        let outcomeIntegracion = YesBrainScenarioOutcome(
            childReaction: "Tu hijo respira más calmado. Dice: 'Sí, tengo miedo... Pero también veo que el perro está atado y el dueño está cerca. Puedo intentar caminar despacio.' Su cuerpo se relaja un poco.",
            brainState: "¡Integración cerebro superior-inferior! Reconoció la emoción (downstairs: miedo) Y usó pensamiento (upstairs: análisis de seguridad). Ambos cerebros trabajando juntos.",
            visualCue: "green",
            narratorFeedback: "¡Perfecto! Aplicaste la integración vertical del Yes Brain. Siegel explica: 'La salud mental viene de la integración, no de la supresión del cerebro inferior.'",
            recommendation: "Excelente. Refuerza ambos lados: 'Tienes miedo Y puedes pensar. Tu cerebro de arriba y de abajo están trabajando juntos. Eso es valentía.'",
            successLevel: 93,
            emotionalImpact: "Positivo"
        )
        
        // OUTCOME 3: Solo emoción sin pensamiento (Downstairs only)
        let outcomeSoloEmocion = YesBrainScenarioOutcome(
            childReaction: "Tu hijo se queda atrapado en el miedo. Dice llorando: 'Tengo mucho miedo, mucho miedo...' No puede moverse. La emoción lo inundó completamente.",
            brainState: "El cerebro inferior (emoción) dominó sin conexión con el superior (pensamiento). Necesita ayuda para activar el cerebro de arriba y analizar la situación.",
            visualCue: "yellow",
            narratorFeedback: "El libro enseña: validar la emoción está bien, pero también necesitamos ayudar a activar el cerebro superior para que pueda pensar, no solo sentir.",
            recommendation: "Después de validar, activa el upstairs: 'Veo tu miedo. Ahora miremos juntos: ¿Qué ves? ¿El perro está suelto o atado? ¿Está gruñendo o tranquilo?'",
            successLevel: 40,
            emotionalImpact: "Neutral"
        )
        
        let options = [
            YesBrainScenarioOption(
                text: "Le dices: 'No hay razón para tener miedo. Mira, el perro está atado. Es lógico que estés seguro. No seas miedoso.'",
                tone: "No Brain - Solo lógica",
                nextOutcomeId: outcomeSoloLogica.id,
                yesBrainAlignment: 20
            ),
            YesBrainScenarioOption(
                text: "Te agachas a su nivel y dices: 'Veo que tienes miedo. Tu cuerpo te está avisando que estés alerta. Eso es normal. Ahora, miremos juntos: ¿el perro está atado? ¿Se ve tranquilo? ¿Qué piensas?'",
                tone: "Yes Brain - Integración",
                nextOutcomeId: outcomeIntegracion.id,
                yesBrainAlignment: 93
            ),
            YesBrainScenarioOption(
                text: "Lo abrazas y dices: 'Siento que tienes mucho miedo, mi amor. Es okay tener miedo. Puedes sentir todo el miedo que necesites.'",
                tone: "Solo emoción - No activa upstairs",
                nextOutcomeId: outcomeSoloEmocion.id,
                yesBrainAlignment: 40
            )
        ]
        
        return Capa4Scenario(
            title: "Integrar Emoción y Pensamiento",
            category: "Insight",
            trigger: "Tu hijo de 5 años tiene miedo de pasar cerca de un perro grande en el parque",
            description: "Van caminando por el parque y ven un perro grande adelante. Está atado y con su dueño, tranquilo. Tu hijo se detiene inmediatamente, agarra tu mano con fuerza y dice: 'Tengo miedo. No quiero pasar por ahí. El perro me va a morder.' Su cuerpo está tenso, su respiración acelerada.",
            options: options,
            outcomes: [outcomeSoloLogica, outcomeIntegracion, outcomeSoloEmocion],
            insight: "CONCEPTO CENTRAL DEL LIBRO: La 'Integración Vertical' conecta el cerebro inferior (emociones, instintos, sensaciones) con el cerebro superior (lógica, planificación, pensamiento). Siegel y Bryson enseñan que la salud emocional NO es reprimir el downstairs con lógica NI quedarse atrapado en emociones sin pensamiento. Es INTEGRAR ambos: 'Siento miedo (downstairs) Y puedo analizar si es peligro real (upstairs)'. Esto es mindsight en acción.",
            icon: "brain.head.profile",
            color: "indigo",
            difficulty: 3
        )
    }
    
    /// Escenario 9 Insight: Sentir para Pensar (Feel to Think)
    /// Concepto del libro: Las emociones son información, no obstáculos
    private static func crearEscenarioSentirParaPensar() -> Capa4Scenario {
        // OUTCOME 1: Ignorar la emoción y forzar la acción
        let outcomeIgnoraEmocion = YesBrainScenarioOutcome(
            childReaction: "Tu hija entra a la fiesta con cuerpo rígido. Se queda pegada a la pared, no habla con nadie. Después de 10 minutos pide irse: 'Ya quiero irme a casa.' La fiesta fue estresante, no divertida.",
            brainState: "Ignoraste la señal emocional (nervios). El cerebro inferior estaba enviando información importante que no se procesó. Resultado: experiencia negativa que refuerza la ansiedad social.",
            visualCue: "red",
            narratorFeedback: "CONCEPTO DEL LIBRO: Las emociones son DATOS, no obstáculos. Cuando las ignoramos y forzamos acción, perdemos información valiosa que el cerebro está comunicando.",
            recommendation: "Escucha las emociones primero: '¿Qué te pone nerviosa? ¿Qué necesitarías para sentirte mejor?' Las emociones guían decisiones inteligentes.",
            successLevel: 20,
            emotionalImpact: "Negativo"
        )
        
        // OUTCOME 2: Usar la emoción como información (Yes Brain insight)
        let outcomeEmocionComoInfo = YesBrainScenarioOutcome(
            childReaction: "Tu hija piensa y dice: 'Me pone nerviosa no conocer a nadie. ¿Puedes entrar conmigo los primeros minutos y presentarme?' Después de eso, se relaja y empieza a jugar con otros niños.",
            brainState: "¡Insight en acción! Usó la emoción como INFORMACIÓN para identificar necesidad y crear estrategia. El cerebro Yes: siente → entiende → actúa inteligentemente.",
            visualCue: "green",
            narratorFeedback: "¡Excelente! Aplicaste 'sentir para pensar'. El libro enseña: las emociones son la sabiduría del cerebro inferior. Cuando las escuchamos, tomamos mejores decisiones.",
            recommendation: "Perfecto. Refuerza: 'Escuchaste tus nervios, entendiste qué necesitabas y pediste ayuda. Eso es usar tus emociones inteligentemente.'",
            successLevel: 90,
            emotionalImpact: "Positivo"
        )
        
        // OUTCOME 3: Quedarse atrapado en la emoción
        let outcomeAtrapado = YesBrainScenarioOutcome(
            childReaction: "Tu hija empieza a llorar: 'Tengo mucho miedo. No quiero ir. Por favor no me obligues.' Se queda paralizada en el miedo sin poder pensar.",
            brainState: "El cerebro inferior (emoción) inundó al superior (pensamiento). Necesita ayuda para integrar: sentir la emoción Y también pensar sobre ella.",
            visualCue: "yellow",
            narratorFeedback: "Validaste la emoción (bien) pero no ayudaste a activar el cerebro superior para procesarla. El Yes Brain busca integración, no solo validación.",
            recommendation: "Después de validar, ayuda a pensar: 'Entiendo tu miedo. ¿Qué te ayudaría a sentirte segura? ¿Quieres que entremos juntas?'",
            successLevel: 45,
            emotionalImpact: "Neutral"
        )
        
        let options = [
            YesBrainScenarioOption(
                text: "Le dices: 'No seas tonta. Vas a estar bien. Entra ya, te va a gustar. No hay razón para estar nerviosa.'",
                tone: "No Brain - Ignora emoción",
                nextOutcomeId: outcomeIgnoraEmocion.id,
                yesBrainAlignment: 20
            ),
            YesBrainScenarioOption(
                text: "Te arrodillas y dices: 'Veo que estás nerviosa. Tus emociones te están diciendo algo importante. ¿Qué te preocupa exactamente? Entendamos qué necesitas.'",
                tone: "Yes Brain - Emoción como info",
                nextOutcomeId: outcomeEmocionComoInfo.id,
                yesBrainAlignment: 90
            ),
            YesBrainScenarioOption(
                text: "La abrazas y dices: 'Está bien estar nerviosa, mi amor. Puedes sentir todo lo que necesites sentir. No tienes que ir si no quieres.'",
                tone: "Solo validación - No integra",
                nextOutcomeId: outcomeAtrapado.id,
                yesBrainAlignment: 45
            )
        ]
        
        return Capa4Scenario(
            title: "Sentir para Pensar",
            category: "Insight",
            trigger: "Tu hija de 7 años está nerviosa antes de entrar a una fiesta de cumpleaños",
            description: "Llegaron a la fiesta de cumpleaños de un compañero de clase. Tu hija conoce al cumpleañero pero no a los otros niños. Están en la puerta de la casa. Tu hija se detiene y dice: 'Mamá/papá, me siento raro en la panza. No sé si quiero entrar.'",
            options: options,
            outcomes: [outcomeIgnoraEmocion, outcomeEmocionComoInfo, outcomeAtrapado],
            insight: "CONCEPTO DEL LIBRO: Siegel y Bryson enseñan 'Feel to Think' - las emociones no son obstáculos para el pensamiento, son INFORMACIÓN esencial. El cerebro insightful aprende a: 1) Notar la emoción, 2) Nombrarla, 3) Entender qué está comunicando, 4) Usarla para tomar decisiones inteligentes. Cuando enseñamos a ignorar emociones, desconectamos una fuente vital de sabiduría. Cuando solo validamos sin integrar pensamiento, dejamos al niño atrapado en el sentir sin poder actuar.",
            icon: "heart.text.square.fill",
            color: "pink",
            difficulty: 2
        )
    }
    
    /// Escenario 10 Insight: La Voz Interior (Inner Narrator)
    /// Concepto del libro: Desarrollar un narrador interno compasivo
    private static func crearEscenarioVozInterior() -> Capa4Scenario {
        // OUTCOME 1: Instalar crítico interno (Inner critic)
        let outcomeCriticoInterno = YesBrainScenarioOutcome(
            childReaction: "Tu hijo baja la cabeza y murmura para sí mismo: 'Soy torpe. Siempre lo arruino todo.' Ha internalizado tu voz crítica como su propia voz interior.",
            brainState: "Has instalado un 'crítico interno' en su cerebro. Esa voz crítica se convertirá en su narrador interior. El libro advierte: los niños internalizan el tono con que les hablamos.",
            visualCue: "red",
            narratorFeedback: "ADVERTENCIA CRÍTICA DEL LIBRO: La voz con que hablamos a nuestros hijos se convierte en su voz interior. Estás programando un narrador crítico que lo acompañará por años.",
            recommendation: "Cambia tu voz externa: 'Veo que se cayó la leche. Los accidentes pasan. ¿Cómo podemos limpiarlo juntos?' Esto instala un narrador compasivo.",
            successLevel: 10,
            emotionalImpact: "Negativo"
        )
        
        // OUTCOME 2: Instalar narrador compasivo (Compassionate inner voice)
        let outcomeNarradorCompasivo = YesBrainScenarioOutcome(
            childReaction: "Tu hijo toma la toalla y empieza a limpiar. Mientras lo hace, lo escuchas murmurar: 'Los accidentes pasan. Puedo limpiarlo. Está bien.' Está usando un diálogo interno compasivo.",
            brainState: "¡Has instalado un narrador interior compasivo! Tu tono calmado se está convirtiendo en su propia voz interior. El cerebro insightful con autocompasión se está formando.",
            visualCue: "green",
            narratorFeedback: "¡Excelente! El libro enfatiza: 'La voz interior del niño es el eco de las voces de sus padres.' Estás instalando compasión, no crítica. Esto es Yes Brain fundamental.",
            recommendation: "Perfecto. Estás enseñando autorregulación compasiva. Esa voz interior lo acompañará toda la vida.",
            successLevel: 95,
            emotionalImpact: "Positivo"
        )
        
        // OUTCOME 3: Sin consecuencia ni aprendizaje
        let outcomeSinConsecuencia = YesBrainScenarioOutcome(
            childReaction: "Tu hijo dice: 'Okay' y sigue jugando. Tú limpias la leche. No hubo aprendizaje sobre responsabilidad ni desarrollo de voz interior.",
            brainState: "Evitaste instalar crítico interno (bien) pero tampoco enseñaste responsabilidad. La voz interior no se desarrolló - ni crítica ni compasiva.",
            visualCue: "yellow",
            narratorFeedback: "El libro enseña balance: no criticar Y tampoco rescatar completamente. El Yes Brain enseña responsabilidad con compasión.",
            recommendation: "Di: 'Veo que se cayó. No pasa nada, los accidentes ocurren. Ven, limpiemos juntos y hablemos de cómo cargar cosas con cuidado.'",
            successLevel: 40,
            emotionalImpact: "Neutral"
        )
        
        let options = [
            YesBrainScenarioOption(
                text: "Le dices con voz de frustración: '¡Otra vez! ¿Por qué eres tan descuidado? Siempre estás tirando cosas. ¿Cuántas veces te tengo que decir que tengas cuidado?'",
                tone: "No Brain - Instala crítico",
                nextOutcomeId: outcomeCriticoInterno.id,
                yesBrainAlignment: 10
            ),
            YesBrainScenarioOption(
                text: "Respiras hondo y dices con calma: 'Veo que se cayó la leche. Los accidentes pasan, mi amor. Está bien. Trae una toalla y limpiemos juntos.'",
                tone: "Yes Brain - Narrador compasivo",
                nextOutcomeId: outcomeNarradorCompasivo.id,
                yesBrainAlignment: 95
            ),
            YesBrainScenarioOption(
                text: "Dices rápido: 'No te preocupes, yo limpio. Ve a jugar.'",
                tone: "Evita enseñanza",
                nextOutcomeId: outcomeSinConsecuencia.id,
                yesBrainAlignment: 40
            )
        ]
        
        return Capa4Scenario(
            title: "La Voz Interior que Instalamos",
            category: "Insight",
            trigger: "Tu hijo de 4 años derrama leche en la mesa durante el desayuno",
            description: "Es la mañana. Tu hijo está desayunando cereal con leche. Estira el brazo para alcanzar un juguete y sin querer golpea el vaso de leche. El vaso se cae y la leche se derrama por toda la mesa. Tu hijo te mira asustado, esperando tu reacción.",
            options: options,
            outcomes: [outcomeCriticoInterno, outcomeNarradorCompasivo, outcomeSinConsecuencia],
            insight: "CONCEPTO PROFUNDO DEL LIBRO: Siegel y Bryson explican que el 'narrador interior' (inner narrator) del niño se forma a partir de las voces de sus padres. Si los padres son críticos, el niño desarrolla un crítico interno. Si los padres son compasivos, desarrolla autocompasión. Este narrador interior lo acompañará toda la vida, influyendo en su autoestima, toma de decisiones y salud mental. El padre Yes Brain instala conscientemente un narrador interior compasivo y alentador.",
            icon: "text.bubble.fill",
            color: "cyan",
            difficulty: 2
        )
    }
    
    /// Escenario 11 Insight: El Observador Interior (The Inner Observer)
    /// Concepto del libro: Desarrollar la capacidad de observarse a sí mismo sin juicio
    private static func crearEscenarioObservadorInterior() -> Capa4Scenario {
        // OUTCOME 1: Identificarse con la emoción (I AM the emotion)
        let outcomeIdentificacion = YesBrainScenarioOutcome(
            childReaction: "Tu hijo llora más fuerte y dice: 'Soy malo. Soy un niño malo que pega. Nadie me quiere.' Se identifica completamente con su acción. No puede ver más allá.",
            brainState: "No desarrolló el 'observador interior'. Está FUSIONADO con la emoción/conducta en lugar de poder observarla. 'Soy enojado' en lugar de 'Estoy sintiendo enojo'.",
            visualCue: "red",
            narratorFeedback: "CONCEPTO DEL LIBRO: Cuando el niño dice 'Soy malo', está FUSIONADO con la emoción. El Yes Brain enseña: 'TIENES enojo, no ERES el enojo.' Esta distinción es insight fundamental.",
            recommendation: "Reformula: 'No eres malo. Eres un niño bueno que HIZO algo que no estuvo bien. Hay diferencia. ¿Puedes sentir esa diferencia?'",
            successLevel: 15,
            emotionalImpact: "Negativo"
        )
        
        // OUTCOME 2: Desarrollar el observador (Yes Brain self-observation)
        let outcomeObservador = YesBrainScenarioOutcome(
            childReaction: "Tu hijo piensa y dice: 'Tengo mucho enojo dentro de mí... pero yo no SOY el enojo. Puedo sentirlo y dejarlo pasar.' Respira profundo. 'Pegué Y eso no estuvo bien. Puedo disculparme.'",
            brainState: "¡Observador interior activado! Puede verse a sí mismo desde afuera. 'Tengo enojo' (observador) vs 'Soy enojado' (fusión). Esto es mindsight avanzado - la base del insight.",
            visualCue: "purple",
            narratorFeedback: "¡Excelente! Desarrollaste el 'observador interior' del Yes Brain. Siegel enseña: poder observarnos sin fusionarnos con nuestros estados es liberador. 'Tengo pensamientos, no soy mis pensamientos.'",
            recommendation: "Perfecto. Estás enseñando la distinción más importante del insight: observar la experiencia interna sin ser absorbido por ella.",
            successLevel: 92,
            emotionalImpact: "Positivo"
        )
        
        // OUTCOME 3: Evitar la emoción completamente
        let outcomeEvita = YesBrainScenarioOutcome(
            childReaction: "Tu hijo reprime el llanto y dice: 'Está bien. No tengo enojo. Ya pasó.' Pero su cuerpo está tenso. Reprimió la emoción en lugar de observarla.",
            brainState: "La represión no es observación. El cerebro aprende a desconectarse de emociones en lugar de observarlas con curiosidad. Esto bloquea el desarrollo del insight.",
            visualCue: "yellow",
            narratorFeedback: "El libro diferencia: reprimir ≠ observar. El Yes Brain dice: 'Puedes TENER la emoción, observarla, sentirla Y no ser dominado por ella.'",
            recommendation: "Invita a observar sin juzgar: 'Noto que tu cuerpo está tenso. ¿Qué estás sintiendo? No tienes que hacer nada con ello, solo notarlo.'",
            successLevel: 35,
            emotionalImpact: "Neutral"
        )
        
        let options = [
            YesBrainScenarioOption(
                text: "Le dices con voz fuerte: '¿Por qué eres así? Eres un niño malo cuando pegas. Los niños buenos no pegan.'",
                tone: "No Brain - Fusión identidad",
                nextOutcomeId: outcomeIdentificacion.id,
                yesBrainAlignment: 15
            ),
            YesBrainScenarioOption(
                text: "Te sientas con él y dices: 'Noto que tienes mucho enojo dentro de ti. El enojo es algo que TIENES, no algo que ERES. ¿Puedes sentir el enojo sin ser el enojo?'",
                tone: "Yes Brain - Observador interno",
                nextOutcomeId: outcomeObservador.id,
                yesBrainAlignment: 92
            ),
            YesBrainScenarioOption(
                text: "Le dices: 'Ya no estés enojado. Cálmate. Olvídalo. Ya pasó.'",
                tone: "Represión - Evita observar",
                nextOutcomeId: outcomeEvita.id,
                yesBrainAlignment: 35
            )
        ]
        
        return Capa4Scenario(
            title: "El Observador Interior",
            category: "Insight",
            trigger: "Tu hijo de 6 años pegó a su hermano y ahora está llorando diciendo 'Soy malo'",
            description: "Tu hijo de 6 años y su hermano de 4 estaban jugando. Hubo un conflicto por un juguete y tu hijo mayor le pegó al menor. El pequeño llora. Separas a ambos. Tu hijo mayor también empieza a llorar y dice: 'Soy malo. Soy un niño malo. Los niños malos pegan.' Está completamente identificado con su conducta, no puede separar lo que HIZO de lo que ÉL ES.",
            options: options,
            outcomes: [outcomeIdentificacion, outcomeObservador, outcomeEvita],
            insight: "CONCEPTO AVANZADO DEL LIBRO: El 'observador interior' (inner observer) es la capacidad de observar nuestros pensamientos, emociones y conductas SIN fusionarnos con ellos. Siegel enseña la distinción: 'TENGO enojo' (observador) vs. 'SOY enojado' (fusión). Esta capacidad de observar sin fusión es la esencia del mindsight y permite: 1) No ser arrastrado por emociones intensas, 2) Cambiar conductas sin dañar la identidad, 3) Desarrollar flexibilidad mental. El padre Yes Brain enseña: 'Eres un niño bueno que hizo algo que no estuvo bien. No eres tu conducta.'",
            icon: "eye.trianglebadge.exclamationmark",
            color: "purple",
            difficulty: 4
        )
    }
    
    // MARK: - ESCENARIOS DE EMPATÍA
    // Basados en "The Empathic Yes Brain" - Capítulo 4 del libro
    
    /// Escenario 12 Empatía: Neuronas Espejo en Acción (Mirror Neurons)
    /// Concepto del libro: Los niños aprenden empatía observando empatía
    private static func crearEscenarioNeuronasEspejo() -> Capa4Scenario {
        // OUTCOME 1: Modelar falta de empatía
        let outcomeModelaNoBrain = YesBrainScenarioOutcome(
            childReaction: "Tu hijo mira a su hermano llorando, se encoge de hombros y dice: 'No es mi problema. Él se cayó solo.' Luego se va a jugar. No mostró empatía.",
            brainState: "Las neuronas espejo copiaron tu falta de empatía. Los niños aprenden empatía OBSERVANDO empatía. Modelaste 'no es mi problema', y él lo internalizó.",
            visualCue: "gray",
            narratorFeedback: "PRINCIPIO DEL LIBRO: Las neuronas espejo hacen que los niños 'capturen' nuestra actitud emocional. Si mostramos indiferencia, aprenden indiferencia.",
            recommendation: "Modela empatía: 'Veo que tu hermano se cayó y está llorando. Vamos juntos a ver si está bien. Cuando alguien se lastima, preguntamos si está bien.'",
            successLevel: 20,
            emotionalImpact: "Negativo"
        )
        
        // OUTCOME 2: Modelar empatía (Yes Brain mirroring)
        let outcomeModelaEmpatia = YesBrainScenarioOutcome(
            childReaction: "Tu hijo corre hacia su hermano y pregunta preocupado: '¿Estás bien? ¿Te dolió?' Imita tu tono cuidadoso. Ayuda a su hermano a levantarse con ternura.",
            brainState: "¡Neuronas espejo activadas para empatía! Tu hijo COPIÓ tu respuesta empática. El libro explica: la empatía se aprende más por imitación que por instrucción.",
            visualCue: "pink",
            narratorFeedback: "¡Excelente! Aplicaste el concepto de neuronas espejo del Yes Brain. Como dicen Siegel y Bryson: 'Los niños se convierten en lo que ven. Modela empatía y crecerá empatía.'",
            recommendation: "Perfecto. Refuerza: 'Vi cómo ayudaste a tu hermano. Eso es empatía. Te importó cómo se sentía. Eres un hermano amoroso.'",
            successLevel: 95,
            emotionalImpact: "Positivo"
        )
        
        // OUTCOME 3: Decir sin mostrar
        let outcomeDiceSinMostrar = YesBrainScenarioOutcome(
            childReaction: "Tu hijo dice mecánicamente: 'Okay, voy a preguntar.' Va con su hermano y dice sin emoción: '¿Estás bien?' No hay conexión emocional real, solo cumplimiento.",
            brainState: "Aprendió las PALABRAS de empatía pero no el SENTIMIENTO. El libro enseña: la empatía real viene de sentir con el otro, no solo de decir lo correcto.",
            visualCue: "yellow",
            narratorFeedback: "Las instrucciones sin modelaje crean comportamiento mecánico. El Yes Brain se transmite por resonancia emocional, no por órdenes.",
            recommendation: "Modela CON emoción: 'Ay, veo que se cayó. Me preocupa. Vamos juntos con voz cariñosa a ver cómo está.' El tono enseña.",
            successLevel: 40,
            emotionalImpact: "Neutral"
        )
        
        let options = [
            YesBrainScenarioOption(
                text: "Dices sin voltear: 'Seguro está bien. Los niños se caen todo el tiempo. Sigue comiendo tu desayuno.'",
                tone: "No Brain - Sin empatía",
                nextOutcomeId: outcomeModelaNoBrain.id,
                yesBrainAlignment: 20
            ),
            YesBrainScenarioOption(
                text: "Dejas tu café inmediatamente, vas hacia donde cayó el hermano y dices con voz preocupada: '¿Estás bien, mi amor? ¿Te lastimaste?' Tu hijo mayor te observa.",
                tone: "Yes Brain - Modela empatía",
                nextOutcomeId: outcomeModelaEmpatia.id,
                yesBrainAlignment: 95
            ),
            YesBrainScenarioOption(
                text: "Le dices a tu hijo mayor: 'Ve y pregúntale a tu hermano si está bien. Es importante preocuparse por los demás.'",
                tone: "Instruye sin modelar",
                nextOutcomeId: outcomeDiceSinMostrar.id,
                yesBrainAlignment: 40
            )
        ]
        
        return Capa4Scenario(
            title: "Neuronas Espejo - Modelar Empatía",
            category: "Empatía",
            trigger: "El hermano menor de tu hijo se cae y llora mientras desayunan",
            description: "Están desayunando en familia. Tu hijo mayor de 7 años está comiendo tranquilo. Su hermano menor de 4 años se levanta de la silla y tropieza, cayendo al suelo. El pequeño empieza a llorar. Tu hijo mayor te mira, esperando ver cómo reaccionas antes de hacer algo.",
            options: options,
            outcomes: [outcomeModelaNoBrain, outcomeModelaEmpatia, outcomeDiceSinMostrar],
            insight: "CONCEPTO NEUROBIOLÓGICO DEL LIBRO: Las 'neuronas espejo' hacen que los niños literalmente SIENTAN y COPIEN las emociones que observan en sus padres. Siegel y Bryson explican: 'No podemos enseñar empatía con palabras solamente. Los niños aprenden empatía VIENDO empatía en acción.' Cuando el padre responde con preocupación genuina ante el dolor de otros, las neuronas espejo del niño se activan y aprenden ese patrón. La empatía se transmite por resonancia emocional.",
            icon: "person.2.fill",
            color: "pink",
            difficulty: 2
        )
    }
    
    /// Escenario 13 Empatía: Ver Desde Otra Perspectiva (Theory of Mind)
    /// Concepto del libro: Desarrollar la capacidad de entender que otros piensan y sienten diferente
    private static func crearEscenarioVerDesdeOtraPerspectiva() -> Capa4Scenario {
        // OUTCOME 1: Solo su perspectiva (Egocentrism reinforced)
        let outcomeSoloPerspectiva = YesBrainScenarioOutcome(
            childReaction: "Tu hija dice: 'Pero yo quería ese juguete primero.' No puede ver la perspectiva de su amiga. Se queda atrapada en su propio punto de vista.",
            brainState: "El egocentrismo natural de la edad se reforzó. No se activó la 'teoría de la mente' - la capacidad de entender que otros tienen perspectivas diferentes.",
            visualCue: "red",
            narratorFeedback: "CONCEPTO DEL LIBRO: El Yes Brain desarrolla 'theory of mind' - entender que otros piensan y sienten diferente. Sin esta capacidad, la empatía no puede desarrollarse.",
            recommendation: "Invita a ver desde afuera: '¿Cómo crees que se siente tu amiga? Si ella estaba jugando primero y le quitaste el juguete, ¿qué crees que sintió?'",
            successLevel: 20,
            emotionalImpact: "Negativo"
        )
        
        // OUTCOME 2: Desarrollar perspectiva (Yes Brain empathy)
        let outcomeMultiplePerspectiva = YesBrainScenarioOutcome(
            childReaction: "Tu hija piensa y dice: 'Mmm... ella estaba jugando primero... entonces cuando yo lo tomé, ella se sintió... ¿triste? ¿Enojada?' Piensa más: 'Creo que si alguien me quita mi juguete, yo me siento mal.'",
            brainState: "¡Perspectiva múltiple activada! Puede salir de su propia experiencia y ponerse en el lugar de otro. El cerebro empático del Yes Brain está emergiendo.",
            visualCue: "green",
            narratorFeedback: "¡Perfecto! Desarrollaste 'theory of mind' - concepto central del cerebro empático. El libro enseña: ver desde múltiples perspectivas es la base de la empatía real.",
            recommendation: "Excelente. Ahora puede actuar: '¿Qué crees que podrías hacer para que tu amiga se sienta mejor?' Entendimiento → acción empática.",
            successLevel: 90,
            emotionalImpact: "Positivo"
        )
        
        // OUTCOME 3: Falsa empatía por presión
        let outcomeFalsaEmpatia = YesBrainScenarioOutcome(
            childReaction: "Tu hija dice rápido: 'Okay, le voy a pedir perdón.' Lo hace, pero sin entender realmente. Solo quiere terminar la conversación. No desarrolló insight empático.",
            brainState: "Compliance sin comprensión. Hizo lo correcto EXTERNAMENTE pero no desarrolló empatía INTERNA. El cerebro no procesó la perspectiva del otro.",
            visualCue: "yellow",
            narratorFeedback: "El libro advierte: forzar disculpas sin desarrollar comprensión crea comportamiento mecánico, no empatía real.",
            recommendation: "Antes de la acción, desarrolla comprensión: 'Piensa: ¿cómo crees que se sintió ella? Tómate tiempo para imaginarlo.'",
            successLevel: 35,
            emotionalImpact: "Neutral"
        )
        
        let options = [
            YesBrainScenarioOption(
                text: "Le dices: 'No me importa quién empezó. Tienes que compartir. Devuélvele el juguete ahora mismo y discúlpate.'",
                tone: "No Brain - Orden sin comprensión",
                nextOutcomeId: outcomeSoloPerspectiva.id,
                yesBrainAlignment: 20
            ),
            YesBrainScenarioOption(
                text: "Te sientas con ambas y dices: 'Veo que ambas quieren el juguete. [A tu hija] ¿Cómo crees que se sintió tu amiga cuando le quitaste el juguete? Cierra los ojos e imagina cómo se siente ella.'",
                tone: "Yes Brain - Múltiples perspectivas",
                nextOutcomeId: outcomeMultiplePerspectiva.id,
                yesBrainAlignment: 90
            ),
            YesBrainScenarioOption(
                text: "Le dices: 'Devuélvelo y dile que lo sientes. Eso es lo que hacen las niñas buenas.'",
                tone: "Presión - Falsa empatía",
                nextOutcomeId: outcomeFalsaEmpatia.id,
                yesBrainAlignment: 35
            )
        ]
        
        return Capa4Scenario(
            title: "Ver Desde Otra Perspectiva",
            category: "Empatía",
            trigger: "Tu hija de 5 años le quitó un juguete a su amiga durante una playdate",
            description: "Tu hija y su amiga están jugando en casa. La amiga estaba jugando con un juguete. Tu hija lo quiso y se lo quitó de las manos. La amiga empieza a llorar y dice: 'Yo lo tenía primero.' Tu hija responde: 'Pero yo lo quiero ahora.' La amiga llora más fuerte.",
            options: options,
            outcomes: [outcomeSoloPerspectiva, outcomeMultiplePerspectiva, outcomeFalsaEmpatia],
            insight: "CONCEPTO FUNDAMENTAL DEL LIBRO: La 'Theory of Mind' (teoría de la mente) es la capacidad de entender que otras personas tienen pensamientos, sentimientos y perspectivas DIFERENTES a las nuestras. Siegel y Bryson enseñan que esta es la BASE de la empatía. Sin poder ver desde otra perspectiva, no hay empatía real. El padre Yes Brain ayuda al niño a 'caminar en los zapatos de otro' mediante preguntas que invitan a la imaginación empática: '¿Cómo crees que se siente? ¿Qué estaría pensando? Si fueras tú, ¿cómo te sentirías?'",
            icon: "eye.square.fill",
            color: "teal",
            difficulty: 3
        )
    }
    
    /// Escenario 14 Empatía: Compartir vs. Competir (We not Me)
    /// Concepto del libro: Desarrollar mentalidad de "nosotros" en lugar de "yo"
    private static func crearEscenarioCompartirVsCompetir() -> Capa4Scenario {
        // OUTCOME 1: Reforzar competencia (Me-focused)
        let outcomeCompetencia = YesBrainScenarioOutcome(
            childReaction: "Tu hijo se emociona: 'Sí, yo soy mejor que ella.' Pero cuando juegan, compite agresivamente y se burla cuando gana. La relación se daña.",
            brainState: "Reforzaste mentalidad 'Yo vs. Ella' en lugar de 'Nosotros'. El cerebro aprendió que el éxito es mejor cuando otros fallan. Esto es opuesto a la empatía.",
            visualCue: "red",
            narratorFeedback: "ADVERTENCIA DEL LIBRO: La mentalidad competitiva constante bloquea la empatía. El Yes Brain cultiva 'We not Me' - alegría compartida en lugar de victoria sobre otros.",
            recommendation: "Reformula: 'Ambas son buenas jugando. ¿No es genial tener una amiga que también juega bien? Pueden mejorar juntas.'",
            successLevel: 15,
            emotionalImpact: "Negativo"
        )
        
        // OUTCOME 2: Cultivar mentalidad "nosotros" (Yes Brain we-ness)
        let outcomeNosotros = YesBrainScenarioOutcome(
            childReaction: "Tu hijo sonríe y dice: '¿En serio? ¡Qué bien que ambas somos buenas!' Cuando juegan, se ríen juntas, se apoyan y celebran los buenos tiros de ambas.",
            brainState: "¡Mentalidad 'We' activada! El cerebro Yes aprende que el éxito compartido es más satisfactorio que la victoria individual. Sistema de oxitocina y conexión activado.",
            visualCue: "pink",
            narratorFeedback: "¡Excelente! El libro enfatiza: cultivar 'we-ness' (nosotros) en lugar de 'me-ness' (yo) es fundamental para el cerebro empático. La alegría compartida activa más el cerebro que ganar solo.",
            recommendation: "Perfecto. Estás enseñando que las relaciones valen más que ganar. Esto es empatía profunda.",
            successLevel: 93,
            emotionalImpact: "Positivo"
        )
        
        // OUTCOME 3: Evitar la competencia completamente
        let outcomeEvitaCompetencia = YesBrainScenarioOutcome(
            childReaction: "Tu hijo dice: 'Ah okay.' Pero cuando juegan, deja ganar a su amiga por miedo a competir. No desarrolló balance entre competencia sana y empatía.",
            brainState: "Evitar TODA competencia no es Yes Brain. El libro enseña balance: puedes querer ganar Y ser empático. No son opuestos.",
            visualCue: "yellow",
            narratorFeedback: "El Yes Brain no elimina la competencia, la balancea con empatía. Puedes intentar tu mejor esfuerzo Y celebrar cuando el otro gana.",
            recommendation: "Enseña balance: 'Puedes querer ganar con todo tu corazón Y ser amable con tu amiga. Ambas cosas juntas.'",
            successLevel: 40,
            emotionalImpact: "Neutral"
        )
        
        let options = [
            YesBrainScenarioOption(
                text: "Le dices con orgullo: 'Claro que eres mejor que ella. Has practicado más. Es importante ser la mejor.'",
                tone: "No Brain - Solo competencia",
                nextOutcomeId: outcomeCompetencia.id,
                yesBrainAlignment: 15
            ),
            YesBrainScenarioOption(
                text: "Le dices: 'Ambas son muy buenas jugando. ¡Qué suerte tienes de tener una amiga que también ama el tenis! Pueden jugar y mejorar juntas.'",
                tone: "Yes Brain - We not Me",
                nextOutcomeId: outcomeNosotros.id,
                yesBrainAlignment: 93
            ),
            YesBrainScenarioOption(
                text: "Le dices: 'No se trata de quién es mejor. Solo diviértanse y no compitan.'",
                tone: "Evita competencia",
                nextOutcomeId: outcomeEvitaCompetencia.id,
                yesBrainAlignment: 40
            )
        ]
        
        return Capa4Scenario(
            title: "Nosotros, No Solo Yo",
            category: "Empatía",
            trigger: "Tu hijo de 8 años pregunta si es mejor que su amiga jugando tenis",
            description: "Tu hijo está aprendiendo tenis y tiene una amiga que también juega. Después de una práctica, tu hijo viene emocionado y pregunta: 'Mamá/papá, ¿yo soy mejor que Sofía jugando tenis? Ella falló varios tiros hoy y yo metí casi todos.'",
            options: options,
            outcomes: [outcomeCompetencia, outcomeNosotros, outcomeEvitaCompetencia],
            insight: "CONCEPTO DEL LIBRO: Siegel y Bryson enseñan 'We not Me' - cultivar una mentalidad de 'nosotros' en lugar de solo 'yo'. El cerebro empático encuentra alegría en el éxito compartido, no solo en superar a otros. Esto no significa eliminar la competencia sana, sino balancearla con conexión. El Yes Brain puede decir: 'Quiero ganar Y me importa mi amiga.' La investigación muestra que la conexión social activa más centros de recompensa cerebral que el logro individual.",
            icon: "person.2.circle.fill",
            color: "green",
            difficulty: 2
        )
    }
    
    /// Escenario 15 Empatía: La Reparación Relacional (Relational Repair)
    /// Concepto del libro: Enseñar que las relaciones se reparan, no se rompen para siempre
    private static func crearEscenarioReparacionRelacional() -> Capa4Scenario {
        // OUTCOME 1: Evitar la reparación (Avoidance)
        let outcomeEvitaReparacion = YesBrainScenarioOutcome(
            childReaction: "Tu hijo dice: 'Okay...' Pero no habla con su amigo. Al día siguiente en la escuela, evita a su amigo. La relación se enfría. No aprendió a reparar.",
            brainState: "La evitación impidió el aprendizaje de 'reparación relacional'. El cerebro No aprendió que las relaciones pueden repararse. Esto genera ansiedad social a largo plazo.",
            visualCue: "gray",
            narratorFeedback: "CONCEPTO DEL LIBRO: Las rupturas relacionales son NORMALES y REPARABLES. Cuando evitamos la reparación, enseñamos que las relaciones se rompen para siempre.",
            recommendation: "El Yes Brain enseña: 'Las peleas pasan. Lo importante es repararlas. ¿Qué podrías decirle a tu amigo mañana?'",
            successLevel: 25,
            emotionalImpact: "Negativo"
        )
        
        // OUTCOME 2: Enseñar reparación (Yes Brain relational repair)
        let outcomeReparacion = YesBrainScenarioOutcome(
            childReaction: "Tu hijo piensa y dice: 'Podría decirle: perdón por enojarme. ¿Quieres que juguemos mañana?' Al día siguiente lo hace. Su amigo sonríe y dicen: 'Está bien. Yo también me enojé. Sigamos siendo amigos.'",
            brainState: "¡Reparación relacional exitosa! El cerebro aprendió que: 1) Las relaciones se rompen temporalmente, 2) Pueden repararse con sinceridad, 3) La reparación fortalece el vínculo. Esto es empatía aplicada.",
            visualCue: "pink",
            narratorFeedback: "¡Excelente! Aplicaste 'relational repair' del Yes Brain. Como dice el libro: 'La reparación enseña que las relaciones son resilientes. Los conflictos son oportunidades de profundizar la conexión.'",
            recommendation: "Perfecto. Has enseñado una de las habilidades sociales más importantes: cómo reparar rupturas relacionales.",
            successLevel: 95,
            emotionalImpact: "Positivo"
        )
        
        // OUTCOME 3: Forzar disculpa sin procesamiento
        let outcomeDisculpaForzada = YesBrainScenarioOutcome(
            childReaction: "Tu hijo va con su amigo y dice mecánicamente: 'Perdón.' Su amigo dice: 'Okay.' Pero no hubo comprensión real. La relación no se reparó profundamente.",
            brainState: "Disculpa sin insight. El cerebro hizo el movimiento social correcto pero no procesó el impacto relacional ni desarrolló empatía genuina.",
            visualCue: "yellow",
            narratorFeedback: "El libro enseña: las disculpas forzadas sin comprensión son vacías. El Yes Brain busca que el niño ENTIENDA el impacto antes de disculparse.",
            recommendation: "Primero procesa: '¿Cómo crees que se sintió? ¿Qué cambió en su relación?' LUEGO: '¿Qué te gustaría decirle?'",
            successLevel: 40,
            emotionalImpact: "Neutral"
        )
        
        let options = [
            YesBrainScenarioOption(
                text: "Le dices: 'Bueno, si se enojó es su problema. Tú no hiciste nada tan malo. Ya se le pasará.'",
                tone: "No Brain - Evita responsabilidad",
                nextOutcomeId: outcomeEvitaReparacion.id,
                yesBrainAlignment: 25
            ),
            YesBrainScenarioOption(
                text: "Te sientas con él y dices: 'Veo que tuvieron una pelea. Las peleas pasan y pueden arreglarse. ¿Qué crees que sintió tu amigo? ¿Cómo podrían reparar su amistad?'",
                tone: "Yes Brain - Enseña reparación",
                nextOutcomeId: outcomeReparacion.id,
                yesBrainAlignment: 95
            ),
            YesBrainScenarioOption(
                text: "Le dices: 'Mañana vas y le dices que lo sientes. Eso es lo correcto. Las personas buenas piden perdón.'",
                tone: "Fuerza disculpa sin insight",
                nextOutcomeId: outcomeDisculpaForzada.id,
                yesBrainAlignment: 40
            )
        ]
        
        return Capa4Scenario(
            title: "Reparar las Relaciones",
            category: "Empatía",
            trigger: "Tu hijo de 7 años tuvo una pelea con su mejor amigo en la escuela",
            description: "Tu hijo llega de la escuela y te cuenta: 'Hoy me peleé con mi mejor amigo. Yo quería jugar fútbol y él quería jugar tag. Nos enojamos y le grité que era aburrido. Él me gritó que yo era egoísta. Ahora ya no me habla.' Se ve triste pero también confundido sobre qué hacer.",
            options: options,
            outcomes: [outcomeEvitaReparacion, outcomeReparacion, outcomeDisculpaForzada],
            insight: "CONCEPTO RELACIONAL DEL LIBRO: 'Relational Repair' (reparación relacional) es fundamental para el cerebro empático. Siegel y Bryson enseñan: 'Las rupturas relacionales son inevitables y NORMALES. Lo importante es enseñar a repararlas.' La reparación requiere: 1) Reconocer el impacto en el otro, 2) Sentir genuina empatía, 3) Comunicar la reparación, 4) Cambiar la conducta. Esto enseña que las relaciones son resilientes y que los conflictos pueden profundizar la conexión si se manejan bien.",
            icon: "heart.circle.fill",
            color: "pink",
            difficulty: 3
        )
    }
    
    /// Escenario 16 Empatía: Sentir CON el Otro (Feel WITH not FOR)
    /// Concepto del libro: Empatía real es sentir CON, no solo sentir POR
    private static func crearEscenarioSentirConElOtro() -> Capa4Scenario {
        // OUTCOME 1: Lástima en lugar de empatía (Pity not empathy)
        let outcomeLastima = YesBrainScenarioOutcome(
            childReaction: "Tu hijo mira a la niña desde lejos con cara de lástima. Dice: 'Pobrecita.' Pero no se acerca. No hay conexión real, solo observación distante.",
            brainState: "Desarrollaste LÁSTIMA (pity), no EMPATÍA. La lástima separa ('ella es menos'), la empatía conecta ('puedo entender su dolor'). El cerebro empático no se activó.",
            visualCue: "gray",
            narratorFeedback: "DISTINCIÓN DEL LIBRO: Lástima = 'sentir POR' desde arriba. Empatía = 'sentir CON' desde el mismo nivel. Una separa, la otra conecta.",
            recommendation: "Modela empatía: 'Veo que está triste. Vamos a preguntarle si está bien. Puedes sentir cómo se siente porque tú también te has sentido triste.'",
            successLevel: 25,
            emotionalImpact: "Negativo"
        )
        
        // OUTCOME 2: Empatía genuina (Yes Brain connection)
        let outcomeEmpatiaReal = YesBrainScenarioOutcome(
            childReaction: "Tu hijo se acerca a la niña, se sienta a su lado y dice suavemente: '¿Estás bien? Veo que estás triste. Yo también me pongo triste a veces.' La niña lo mira y deja de llorar un poco.",
            brainState: "¡Empatía real! Sentir CON, no POR. Las neuronas espejo activadas. Sistema de oxitocina y conexión social en acción. El cerebro Yes Brain empático funcionando.",
            visualCue: "pink",
            narratorFeedback: "¡Perfecto! Enseñaste empatía REAL. El libro dice: 'Sentir CON alguien requiere ponernos a su nivel, reconocer nuestra propia experiencia similar y conectar genuinamente.'",
            recommendation: "Excelente. Refuerza: 'Vi cómo te acercaste y conectaste con ella. Sentiste CON ella, no solo POR ella. Eso es empatía verdadera.'",
            successLevel: 97,
            emotionalImpact: "Positivo"
        )
        
        // OUTCOME 3: Sobreidentificación
        let outcomeSobreidentifica = YesBrainScenarioOutcome(
            childReaction: "Tu hijo se sienta con la niña y también empieza a llorar intensamente. Se queda atrapado en la emoción de ella y no puede ayudar. Ambos están llorando.",
            brainState: "Sobreidentificación emocional. Se fusionó con el dolor de ella en lugar de sentir CON ella mientras mantiene su propio balance. Perdió sus límites emocionales.",
            visualCue: "yellow",
            narratorFeedback: "El libro diferencia: empatía requiere sentir con el otro MIENTRAS mantienes tu propio equilibrio. No es fusionarse, es conectar.",
            recommendation: "Enseña límites empáticos: 'Puedes entender su tristeza Y mantener tu calma para ayudarla. Siente con ella sin perderte en su emoción.'",
            successLevel: 35,
            emotionalImpact: "Neutral"
        )
        
        let options = [
            YesBrainScenarioOption(
                text: "Le dices: 'Pobrecita, se ve muy triste. Pero no te involucres, mi amor. No es tu problema.'",
                tone: "No Brain - Lástima/Separación",
                nextOutcomeId: outcomeLastima.id,
                yesBrainAlignment: 25
            ),
            YesBrainScenarioOption(
                text: "Te acercas con tu hijo y dices: 'Veo que esa niña está llorando. ¿Cómo crees que se siente? Tú también te has sentido triste. ¿Quieres preguntarle si está bien?'",
                tone: "Yes Brain - Sentir CON",
                nextOutcomeId: outcomeEmpatiaReal.id,
                yesBrainAlignment: 97
            ),
            YesBrainScenarioOption(
                text: "Le dices: 'Ve y abrázala. Siente lo que ella siente. Ponte en su lugar completamente.'",
                tone: "Sobreidentificación sin límites",
                nextOutcomeId: outcomeSobreidentifica.id,
                yesBrainAlignment: 35
            )
        ]
        
        return Capa4Scenario(
            title: "Sentir CON, No Solo POR",
            category: "Empatía",
            trigger: "Tu hijo de 6 años ve a una niña llorando sola en el parque",
            description: "Están en el parque jugando. Tu hijo ve a una niña que está sentada sola en una banca, llorando. Los otros niños pasan corriendo pero nadie se acerca. Tu hijo la ve y te pregunta: '¿Por qué está llorando?' Se ve confundido sobre qué hacer.",
            options: options,
            outcomes: [outcomeLastima, outcomeEmpatiaReal, outcomeSobreidentifica],
            insight: "DISTINCIÓN CRUCIAL DEL LIBRO: Siegel y Bryson diferencian entre LÁSTIMA (pity) y EMPATÍA (empathy). Lástima = 'pobrecito' desde una posición superior, genera separación. Empatía = conectar desde el mismo nivel humano, reconociendo: 'Yo también he sentido eso.' La empatía requiere: 1) Resonar emocionalmente (sentir CON), 2) Mantener límites (no fusionarse), 3) Ofrecer conexión. El cerebro empático dice: 'Veo tu dolor, lo reconozco porque es humano, me conmueve Y mantengo mi balance para poder ayudarte.'",
            icon: "hands.and.sparkles.fill",
            color: "purple",
            difficulty: 4
        )
    }
}
