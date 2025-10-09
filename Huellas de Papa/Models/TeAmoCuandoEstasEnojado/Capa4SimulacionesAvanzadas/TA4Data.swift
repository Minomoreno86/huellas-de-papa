import Foundation

/// Datos de la Capa 4 - Simulaciones Avanzadas
/// Basado 100% en el libro "¡Te amo cuando estás enojado!" de Erin Winters
/// 5 simulaciones interactivas únicas del libro

extension TA4Scenario {
    static let allScenarios: [TA4Scenario] = [
        // SIMULACIÓN 1: Llanto sin Palabras
        crearLlantoSinPalabras(),
        
        // SIMULACIÓN 2: El Suspiro Molesto
        crearSuspiroMolesto(),
        
        // SIMULACIÓN 3: Esconderse en la Habitación
        crearEsconderseHabitacion(),
        
        // SIMULACIÓN 4: Agotamiento Mutuo
        crearAgotamientoMutuo(),
        
        // SIMULACIÓN 5: El Padre También Está Enfadado
        crearPadreEnfadado()
    ]
    
    // MARK: - SIMULACIÓN 1: Llanto sin Palabras
    private static func crearLlantoSinPalabras() -> TA4Scenario {
        let outcome1Id = UUID()
        let outcome2Id = UUID()
        let outcome3Id = UUID()
        
        return TA4Scenario(
            title: "Llanto sin Palabras",
            category: "Validación Emocional",
            trigger: "Tu hija de 4 años llega llorando de la escuela, pero no puede explicar qué le pasa",
            description: "Entras a casa y encuentras a tu hija llorando desconsoladamente. Intentas preguntarle qué pasó pero solo logra llorar más. No tiene las palabras para expresar lo que siente.",
            childEmotion: "Tristeza, frustración, abrumada",
            bookReference: "Te amo cuando lloras y no tienes las palabras para pedir lo que quieres",
            options: [
                TA4Option(
                    text: "\"Cálmate y dime qué pasó. No puedo ayudarte si no me dices.\"",
                    tone: "Exigente",
                    nextOutcomeId: outcome1Id,
                    unconditionalLoveAlignment: 20
                ),
                TA4Option(
                    text: "Me siento a su lado en silencio, ofrezco un abrazo y espero.",
                    tone: "Empático - Presencia",
                    nextOutcomeId: outcome2Id,
                    unconditionalLoveAlignment: 95
                ),
                TA4Option(
                    text: "\"No pasa nada, ya verás que se te olvida. Vamos a ver tele.\"",
                    tone: "Evasivo",
                    nextOutcomeId: outcome3Id,
                    unconditionalLoveAlignment: 30
                )
            ],
            outcomes: [
                TA4Outcome(
                    id: outcome1Id,
                    childReaction: "Llora aún más intensamente, se siente incomprendida y presionada. Cierra más su comunicación.",
                    emotionalImpact: "Siente que sus emociones no son válidas si no puede explicarlas perfectamente. Aumenta su angustia.",
                    longTermEffect: "Aprende que debe tener palabras perfectas para ser escuchada. Puede reprimir emociones futuras.",
                    parentReflection: "Exigir explicaciones inmediatas cuando un niño está desbordado aumenta su desregulación.",
                    bookWisdom: "El amor no requiere que el niño se exprese de manera perfecta o articulada",
                    score: 20
                ),
                TA4Outcome(
                    id: outcome2Id,
                    childReaction: "Después de unos minutos, su llanto disminuye. Se acurruca en tu abrazo y eventualmente susurra lo que le pasó.",
                    emotionalImpact: "Siente que puede tener emociones intensas sin necesidad de explicarlas de inmediato. Se siente segura y acompañada.",
                    longTermEffect: "Desarrolla confianza en que el amor está presente incluso cuando no puede expresarse verbalmente. Aprende a regular primero, luego comunicar.",
                    parentReflection: "La presencia silenciosa y amorosa es a veces el regalo más grande que podemos dar.",
                    bookWisdom: "Te amo cuando lloras y no tienes las palabras para pedir lo que quieres",
                    score: 95
                ),
                TA4Outcome(
                    id: outcome3Id,
                    childReaction: "Deja de llorar externamente pero se queda callada y ausente. Guarda sus emociones.",
                    emotionalImpact: "Siente que sus emociones no son importantes o dignas de atención. Aprende a minimizarlas.",
                    longTermEffect: "Puede desarrollar un patrón de evitar o negar emociones difíciles en lugar de procesarlas.",
                    parentReflection: "Distraer o minimizar las emociones les enseña que no son válidas.",
                    bookWisdom: "Todas las emociones merecen ser reconocidas, no ignoradas",
                    score: 30
                )
            ],
            insight: "El amor incondicional acepta todas las formas de expresión emocional, incluyendo el llanto sin palabras. La presencia paciente es más poderosa que las exigencias de explicación.",
            icon: "cloud.rain.fill",
            color: "blue",
            difficulty: 3
        )
    }
    
    // MARK: - SIMULACIÓN 2: El Suspiro Molesto
    private static func crearSuspiroMolesto() -> TA4Scenario {
        let outcome1Id = UUID()
        let outcome2Id = UUID()
        let outcome3Id = UUID()
        
        return TA4Scenario(
            title: "El Suspiro Molesto",
            category: "Aceptación de Expresiones",
            trigger: "Tu hijo de 7 años suspira pesadamente cada vez que le pides algo",
            description: "Es hora de hacer la tarea. Le pides que la saque y suspira fuertemente, de forma molesta y pesada. Lo hace cada vez que le pides algo hoy.",
            childEmotion: "Fastidiado, cansado, irritado",
            bookReference: "Te amo incluso con ese suspiro molesto y pesado",
            options: [
                TA4Option(
                    text: "\"¡Ya estoy harta de esos suspiros! Si sigues suspirando, te quedas sin tablet.\"",
                    tone: "Crítico - Punitivo",
                    nextOutcomeId: outcome1Id,
                    unconditionalLoveAlignment: 15
                ),
                TA4Option(
                    text: "\"Veo que estás cansado. Te amo incluso con esos suspiros. ¿Qué necesitas?\"",
                    tone: "Empático - Validador",
                    nextOutcomeId: outcome2Id,
                    unconditionalLoveAlignment: 100
                ),
                TA4Option(
                    text: "Suspiro también pesadamente y no digo nada.",
                    tone: "Pasivo - Agresivo",
                    nextOutcomeId: outcome3Id,
                    unconditionalLoveAlignment: 25
                )
            ],
            outcomes: [
                TA4Outcome(
                    id: outcome1Id,
                    childReaction: "Deja de suspirar externamente pero su irritación aumenta. Se pone más rebelde y resistente.",
                    emotionalImpact: "Siente que sus expresiones naturales de molestia no son aceptables. Aprende a reprimir o esconder su fastidio.",
                    longTermEffect: "Puede desarrollar resentimiento guardado o aprender a expresar molestia de formas menos saludables.",
                    parentReflection: "Criticar cada expresión emocional crea un ambiente donde el niño debe esconder sus sentimientos.",
                    bookWisdom: "Todas las formas de expresión emocional merecen ser reconocidas, incluso las molestas",
                    score: 15
                ),
                TA4Outcome(
                    id: outcome2Id,
                    childReaction: "Suspira una vez más, pero esta vez hace contacto visual. 'Es que estoy cansado'. Se relaja un poco.",
                    emotionalImpact: "Siente que incluso sus expresiones molestas son aceptadas. Puede ser auténtico sin temor al rechazo.",
                    longTermEffect: "Desarrolla confianza en que puede expresar molestia de forma natural y seguir siendo amado. Aprende a comunicar necesidades.",
                    parentReflection: "Validar incluso las expresiones que nos molestan enseña aceptación incondicional.",
                    bookWisdom: "Te amo incluso con ese suspiro molesto y pesado",
                    score: 100
                ),
                TA4Outcome(
                    id: outcome3Id,
                    childReaction: "Se confunde con tu respuesta. Suspira más exageradamente como buscando reacción.",
                    emotionalImpact: "No recibe validación ni límites claros. La comunicación se vuelve confusa.",
                    longTermEffect: "Puede escalar comportamientos para obtener atención o claridad emocional.",
                    parentReflection: "La pasividad agresiva no enseña ni valida, solo confunde.",
                    bookWisdom: "La validación clara y amorosa es más efectiva que la mímica pasiva",
                    score: 25
                )
            ],
            insight: "El amor incondicional acepta todas las expresiones emocionales del niño, incluso aquellas que nos resultan molestas. Validar no significa permitir todo, sino reconocer la humanidad en cada expresión.",
            icon: "wind",
            color: "gray",
            difficulty: 2
        )
    }
    
    // MARK: - SIMULACIÓN 3: Esconderse en la Habitación
    private static func crearEsconderseHabitacion() -> TA4Scenario {
        let outcome1Id = UUID()
        let outcome2Id = UUID()
        let outcome3Id = UUID()
        
        return TA4Scenario(
            title: "Esconderse en la Habitación",
            category: "Respeto del Espacio",
            trigger: "Después de un conflicto, tu hijo se encierra en su habitación",
            description: "Tuvieron una discusión sobre las tareas. Tu hijo de 9 años se enoja, dice 'me dejas solo' y se encierra en su habitación. Han pasado 20 minutos.",
            childEmotion: "Necesita espacio, abrumado, melancólico",
            bookReference: "Te amo cuando te escondes en tu habitación, me encanta tu tiempo a solas",
            options: [
                TA4Option(
                    text: "Golpeo la puerta: \"¡Sal de ahí ahora! No puedes encerrarte cuando estamos hablando.\"",
                    tone: "Controlador - Invasivo",
                    nextOutcomeId: outcome1Id,
                    unconditionalLoveAlignment: 10
                ),
                TA4Option(
                    text: "Toco suavemente: \"Respeto que necesites espacio. Estoy aquí cuando estés listo. Te amo.\"",
                    tone: "Respetuoso - Disponible",
                    nextOutcomeId: outcome2Id,
                    unconditionalLoveAlignment: 95
                ),
                TA4Option(
                    text: "Me alejo molesto y no digo nada. Que venga cuando quiera.",
                    tone: "Distante - Resentido",
                    nextOutcomeId: outcome3Id,
                    unconditionalLoveAlignment: 30
                )
            ],
            outcomes: [
                TA4Outcome(
                    id: outcome1Id,
                    childReaction: "Grita desde adentro 'déjame solo' o llora más fuerte. Se siente invadido y no respetado.",
                    emotionalImpact: "Siente que su necesidad de espacio no es válida. Aprende que debe defenderse agresivamente para tener límites.",
                    longTermEffect: "Puede desarrollar dificultad para confiar en que sus límites serán respetados. Mayor resistencia a volver a conectar.",
                    parentReflection: "Forzar la interacción cuando el niño necesita espacio aumenta la desconexión.",
                    bookWisdom: "Respetar la necesidad de soledad es validar una estrategia de regulación emocional válida",
                    score: 10
                ),
                TA4Outcome(
                    id: outcome2Id,
                    childReaction: "Después de un rato, abre la puerta. 'Gracias por dejarme estar solo. Ya estoy mejor.'",
                    emotionalImpact: "Siente que su necesidad de espacio es respetada y válida. El amor está presente incluso en la distancia.",
                    longTermEffect: "Desarrolla confianza en que puede tomar tiempo solo para regular y el amor seguirá ahí. Aprende autorregulación saludable.",
                    parentReflection: "Respetar el espacio mientras mantenemos disponibilidad es amor incondicional en acción.",
                    bookWisdom: "Te amo cuando te escondes en tu habitación, me encanta tu tiempo a solas",
                    score: 95
                ),
                TA4Outcome(
                    id: outcome3Id,
                    childReaction: "Sale eventualmente pero se siente distante. No busca reconectar. Hay tensión en el aire.",
                    emotionalImpact: "Siente el resentimiento del padre. Confunde espacio respetado con abandono emocional.",
                    longTermEffect: "Puede asociar la necesidad de espacio con castigo emocional o pérdida de amor.",
                    parentReflection: "El espacio no debe venir con resentimiento. El amor debe estar presente siempre.",
                    bookWisdom: "El espacio respetado incluye disponibilidad amorosa, no distanciamiento resentido",
                    score: 30
                )
            ],
            insight: "Validar la necesidad de espacio personal del niño como una estrategia de regulación emocional válida. El amor incondicional respeta los límites mientras mantiene la disponibilidad emocional.",
            icon: "door.closed",
            color: "purple",
            difficulty: 4
        )
    }
    
    // MARK: - SIMULACIÓN 4: Agotamiento Mutuo
    private static func crearAgotamientoMutuo() -> TA4Scenario {
        let outcome1Id = UUID()
        let outcome2Id = UUID()
        let outcome3Id = UUID()
        
        return TA4Scenario(
            title: "Agotamiento Mutuo",
            category: "Humanidad Compartida",
            trigger: "Ambos están exhaustos después de un día difícil",
            description: "Llegas del trabajo agotado. Tu hija de 6 años también tuvo un día difícil en la escuela. Ambos están cansados, irritables y sin paciencia. Ella pide ayuda con algo y tú no tienes energía.",
            childEmotion: "Ambos derrotados, sin energía emocional",
            bookReference: "Te amo incluso cuando ambos estamos derrotados",
            options: [
                TA4Option(
                    text: "\"No ahora, estoy muy cansado. Tú también estás imposible hoy.\"",
                    tone: "Culpabilizador",
                    nextOutcomeId: outcome1Id,
                    unconditionalLoveAlignment: 20
                ),
                TA4Option(
                    text: "\"Ambos estamos muy cansados hoy. Te amo incluso cuando estamos derrotados. ¿Qué tal si descansamos juntos un rato?\"",
                    tone: "Empático - Honesto",
                    nextOutcomeId: outcome2Id,
                    unconditionalLoveAlignment: 100
                ),
                TA4Option(
                    text: "Fuerzo una sonrisa y hago lo que pide, ocultando mi agotamiento.",
                    tone: "Auto-sacrificio No Auténtico",
                    nextOutcomeId: outcome3Id,
                    unconditionalLoveAlignment: 40
                )
            ],
            outcomes: [
                TA4Outcome(
                    id: outcome1Id,
                    childReaction: "Se siente culpable y rechazada. Llora o se retira. La conexión se rompe más.",
                    emotionalImpact: "Siente que es una carga. Aprende que cuando ambos están cansados, no hay amor disponible.",
                    longTermEffect: "Puede desarrollar culpa por tener necesidades. Aprende a no pedir ayuda cuando detecta cansancio en otros.",
                    parentReflection: "Culpar al niño por nuestro propio agotamiento daña el vínculo profundamente.",
                    bookWisdom: "El amor se sostiene incluso en momentos de agotamiento compartido, no se culpa",
                    score: 20
                ),
                TA4Outcome(
                    id: outcome2Id,
                    childReaction: "Suspira aliviada. 'Yo también estoy cansada, papá.' Se acurrucan juntos en el sofá.",
                    emotionalImpact: "Aprende que los adultos también se cansan y eso está bien. El amor está presente en el cansancio mutuo.",
                    longTermEffect: "Desarrolla compasión hacia sí misma y hacia otros. Aprende que ser humano incluye el agotamiento.",
                    parentReflection: "Reconocer nuestra humanidad compartida en los momentos difíciles es amor incondicional.",
                    bookWisdom: "Te amo incluso cuando ambos estamos derrotados",
                    score: 100
                ),
                TA4Outcome(
                    id: outcome3Id,
                    childReaction: "Nota tu tensión aunque sonrías. Se siente confundida entre tus palabras y tu energía.",
                    emotionalImpact: "Recibe mensajes mixtos. No aprende a validar su propio cansancio porque el tuyo está oculto.",
                    longTermEffect: "Puede aprender a ignorar sus propias necesidades y límites, modelando auto-sacrificio no saludable.",
                    parentReflection: "La autenticidad en el agotamiento enseña mejor que el auto-sacrificio forzado.",
                    bookWisdom: "Ser auténticos con nuestras limitaciones enseña autocompasión más que ocultarlas",
                    score: 40
                )
            ],
            insight: "El agotamiento mutuo es una oportunidad para modelar humanidad compartida. Reconocer que ambos tienen días difíciles enseña compasión y normaliza la experiencia humana completa.",
            icon: "battery.0",
            color: "orange",
            difficulty: 5
        )
    }
    
    // MARK: - SIMULACIÓN 5: El Padre También Está Enfadado
    private static func crearPadreEnfadado() -> TA4Scenario {
        let outcome1Id = UUID()
        let outcome2Id = UUID()
        let outcome3Id = UUID()
        
        return TA4Scenario(
            title: "El Padre También Está Enfadado",
            category: "Modelar Regulación",
            trigger: "Tú también estás irritado y molesto, no solo tu hijo",
            description: "Tuviste un día terrible. Tu hijo de 8 años derrama jugo en el sofá nuevo. Sientes la ira subir en tu pecho. Estás muy enfadado.",
            childEmotion: "El padre experimenta sus propias emociones difíciles",
            bookReference: "Te amo incluso cuando yo estoy cansada o me enfado",
            options: [
                TA4Option(
                    text: "Exploto: \"¡SIEMPRE estás haciendo desastres! ¡Ya estoy harto!\"",
                    tone: "Desregulado - Proyectando",
                    nextOutcomeId: outcome1Id,
                    unconditionalLoveAlignment: 10
                ),
                TA4Option(
                    text: "\"Estoy muy enfadado ahora. Necesito un momento para calmarme. Luego limpiamos juntos. Te amo.\"",
                    tone: "Auténtico - Regulador",
                    nextOutcomeId: outcome2Id,
                    unconditionalLoveAlignment: 95
                ),
                TA4Option(
                    text: "Me trago la ira y limpio en silencio con cara de enojo, sin decir nada.",
                    tone: "Pasivo - Agresivo",
                    nextOutcomeId: outcome3Id,
                    unconditionalLoveAlignment: 25
                )
            ],
            outcomes: [
                TA4Outcome(
                    id: outcome1Id,
                    childReaction: "Se asusta y llora. Siente terror y confusión. Asocia errores con pérdida de amor.",
                    emotionalImpact: "Siente que cuando comete errores, puede perder el amor de sus padres. Desarrolla miedo al error.",
                    longTermEffect: "Puede desarrollar ansiedad perfeccionista o miedo intenso a cometer errores. El amor se siente condicional.",
                    parentReflection: "Proyectar nuestra desregulación en el niño daña profundamente su seguridad emocional.",
                    bookWisdom: "Incluso en nuestro enfado, el amor debe permanecer visible y constante",
                    score: 10
                ),
                TA4Outcome(
                    id: outcome2Id,
                    childReaction: "Asiente nervioso pero aliviado. Ve que papá se aleja a respirar, luego regresa más calmado.",
                    emotionalImpact: "Aprende que los adultos también se enojan Y pueden regularse. El amor está presente incluso en el enfado del padre.",
                    longTermEffect: "Desarrolla modelo de regulación emocional. Aprende que puede sentir emociones intensas y aún así actuar con amor.",
                    parentReflection: "Modelar regulación en tiempo real es una de las lecciones más valiosas que podemos dar.",
                    bookWisdom: "Te amo incluso cuando yo estoy cansada o me enfado. Mostrar humanidad compartida: los padres también sienten emociones difíciles",
                    score: 95
                ),
                TA4Outcome(
                    id: outcome3Id,
                    childReaction: "Siente la tensión y el resentimiento. Se siente culpable pero confundido porque no hay comunicación.",
                    emotionalImpact: "Recibe el mensaje de que está mal a través del lenguaje no verbal, pero sin validación ni claridad.",
                    longTermEffect: "Puede volverse hipervigilante a las señales no verbales de enfado y desarrollar ansiedad social.",
                    parentReflection: "El silencio resentido es más confuso y dañino que la comunicación clara de emociones.",
                    bookWisdom: "La autenticidad emocional clara y amorosa enseña mejor que el resentimiento silencioso",
                    score: 25
                )
            ],
            insight: "Los padres también tenemos emociones difíciles. Modelar cómo regularnos mientras mantenemos el amor incondicional es una de las lecciones más poderosas. El amor permanece constante incluso en nuestro propio enfado.",
            icon: "flame.fill",
            color: "red",
            difficulty: 5
        )
    }
}

