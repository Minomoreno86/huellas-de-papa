import Foundation

/// Datos consolidados de la Capa 2: Principios del modelo "Tengo un Volcán"
/// Basado en el libro de Míriam Tirado
struct TV2Data {
    
    // MARK: - Principios Fundamentales del Modelo
    static let principles: [TV2Principle] = [
        TV2Principle(
            name: "Principio de las Tres Fases",
            description: "El volcán no explota de repente. Pasa por tres fases progresivas que nos dan oportunidades de intervención.",
            howItWorks: "Cada fase tiene señales específicas. La Chispa es el primer calor, el Burbujeo son las señales físicas intensificándose, y la Erupción es cuando la rabia domina. Reconocer la fase permite actuar antes de perder el control.",
            practicalExample: "Alba siente el primer calor en el estómago (Chispa). Si lo reconoce aquí, puede respirar y evitar la Erupción. Si no, pasará al Burbujeo (músculos tensos) y eventualmente a gritos y lágrimas.",
            iconName: "flame.fill",
            color: "orange"
        ),
        TV2Principle(
            name: "Principio de los Desencadenantes",
            description: "El volcán se enciende cuando se presionan ciertos 'botones'. Identificar qué botón se presionó ayuda a entender la rabia.",
            howItWorks: "Cada niño tiene botones sensibles: injusticia, frustración, no conseguir lo que quiere, o emociones escondidas (miedo, tristeza). Saber cuál se presionó permite responder adecuadamente.",
            practicalExample: "Luca grita porque no puede hacer el dibujo bien. Su botón de Frustración está presionado. Entenderlo permite ayudarle: 'Veo que estás frustrado porque quieres que salga perfecto'.",
            iconName: "circle.grid.cross.fill",
            color: "red"
        ),
        TV2Principle(
            name: "Principio de las Nubes de Humo",
            description: "Los pensamientos negativos alimentan el fuego del volcán. Cambiar estos pensamientos reduce la intensidad de la rabia.",
            howItWorks: "Los niños tienen pensamientos como 'siempre me lo estropea' o 'lo hace a propósito' que hacen crecer la rabia. Cazarlos y cambiarlos por 'nubes de aire fresco' (pensamientos realistas) calma el volcán.",
            practicalExample: "Alba piensa 'Martín es malo, siempre me molesta'. Cambiarlo por 'Esta vez Martín tropezó sin querer' hace que su volcán se enfríe.",
            iconName: "cloud.fill",
            color: "purple"
        ),
        TV2Principle(
            name: "Principio de Intervención Temprana",
            description: "Cuanto antes reconozcamos las señales del volcán, más fácil será gestionarlo. La prevención es más efectiva que la reacción.",
            howItWorks: "En la fase Chispa, una simple respiración puede calmar el volcán. En la Erupción, se necesitan estrategias más intensivas. Intervenir temprano ahorra sufrimiento.",
            practicalExample: "Si Alba respira cuando siente la primera chispa de calor, evita 20 minutos de llanto y gritos. Si espera hasta la Erupción, necesitará mucho más tiempo y ayuda para calmarse.",
            iconName: "clock.fill",
            color: "mint"
        ),
        TV2Principle(
            name: "Principio de Aceptación Emocional",
            description: "La rabia es válida y natural. No hay que suprimirla, sino aprender a expresarla de forma segura y constructiva.",
            howItWorks: "Validar la emoción ('Entiendo que estás muy enfadado') mientras se ponen límites al comportamiento ('Pero no puedes golpear'). La emoción es aceptable; las acciones destructivas no.",
            practicalExample: "Luca está furioso porque no puede ir al parque. Es válido. Decir 'Tienes derecho a estar enfadado, yo también me enfadaría' mientras se mantiene el límite 'Pero hoy no podemos ir'.",
            iconName: "heart.fill",
            color: "blue"
        )
    ]
    
    // MARK: - Desencadenantes del Volcán (Los "Botones")
    static let triggers: [TV2Trigger] = [
        TV2Trigger(
            name: "Botón de Injusticia",
            description: "Se activa cuando el niño percibe una situación como injusta, sea real o percibida.",
            commonExamples: [
                "Sofía me quitó el juguete sin pedirlo",
                "Mi hermano puede quedarse despierto más tarde que yo",
                "El profesor me regañó pero yo no hice nada",
                "Todos pueden comer dulces menos yo"
            ],
            childPerspective: "El niño siente: '¡Esto no es justo! No me merezco esto. Los demás tienen más privilegios que yo.'",
            iconName: "scale.3d"
        ),
        TV2Trigger(
            name: "Botón de Frustración",
            description: "Se presiona cuando algo resulta difícil, no sale como se esperaba, o el niño no logra su objetivo.",
            commonExamples: [
                "No me sale el dibujo por mucho que lo intento",
                "No puedo atarme los zapatos solo",
                "La torre de bloques se cae una y otra vez",
                "No entiendo la tarea de matemáticas"
            ],
            childPerspective: "El niño piensa: 'No puedo hacerlo. Es demasiado difícil. Nunca voy a lograrlo. Me rindo.'",
            iconName: "exclamationmark.triangle.fill"
        ),
        TV2Trigger(
            name: "Botón de No Conseguir lo que Quiero",
            description: "Se enciende cuando se le dice 'No' a un deseo, o se le obliga a hacer algo que no quiere.",
            commonExamples: [
                "No me dejan ver más televisión",
                "Tengo que irme del parque cuando no quiero",
                "Me obligan a comer verduras",
                "No puedo comprar el juguete que vi en la tienda"
            ],
            childPerspective: "El niño siente: 'Quiero esto AHORA. ¿Por qué me dicen que no? No es importante lo que ellos digan, yo lo necesito.'",
            iconName: "hand.raised.slash.fill"
        ),
        TV2Trigger(
            name: "Botón de Emociones Enmascaradas",
            description: "El volcán se enciende para esconder emociones más vulnerables como tristeza, miedo, vergüenza o soledad.",
            commonExamples: [
                "Está triste porque su amigo no lo invitó a jugar, pero se enoja con otro niño",
                "Tiene miedo de la oscuridad pero grita 'No quiero dormir'",
                "Se siente solo pero empuja a su hermano",
                "Está avergonzado de no saber leer pero dice 'Los libros son aburridos'"
            ],
            childPerspective: "El niño no puede expresar: 'Me siento triste/asustado/solo'. En su lugar, la rabia protege esas emociones más difíciles de mostrar.",
            iconName: "theatermasks.fill"
        )
    ]
    
    // MARK: - Patrones de Pensamiento (Nubes de Humo)
    static let thoughtPatterns: [TV2ThoughtPattern] = [
        TV2ThoughtPattern(
            negativeThought: "Siempre me lo estropea todo",
            thoughtType: .generalization,
            whyItFeedsAnger: "La palabra 'siempre' generaliza un evento aislado a todos los momentos, aumentando la sensación de injusticia y victimización.",
            positiveAlternative: "Esta vez tropezó con mi torre, pero otras veces jugamos bien juntos",
            childExample: "Martín tiró mi torre → 'Martín SIEMPRE me lo estropea todo' (humo) vs 'Esta vez fue un accidente' (aire fresco)"
        ),
        TV2ThoughtPattern(
            negativeThought: "Lo hace a propósito",
            thoughtType: .intentionality,
            whyItFeedsAnger: "Atribuir mala intención cuando no la hay transforma un error en un ataque personal, multiplicando la rabia.",
            positiveAlternative: "Fue sin querer, no lo hizo para molestarme",
            childExample: "Mi hermana rompió mi dibujo → 'Lo hizo a PROPÓSITO para fastidiarme' (humo) vs 'No vio que estaba ahí' (aire fresco)"
        ),
        TV2ThoughtPattern(
            negativeThought: "Es malo / Es mala persona",
            thoughtType: .intentionality,
            whyItFeedsAnger: "Etiquetar a alguien como 'malo' cierra la puerta al perdón y la comprensión, manteniendo viva la rabia.",
            positiveAlternative: "Hizo algo que no me gustó, pero no es una mala persona",
            childExample: "Pedro me empujó → 'Pedro ES MALO' (humo) vs 'Pedro se portó mal en este momento, pero a veces es mi amigo' (aire fresco)"
        ),
        TV2ThoughtPattern(
            negativeThought: "Nunca podré hacer nada bien",
            thoughtType: .catastrophizing,
            whyItFeedsAnger: "La autocrítica extrema genera frustración consigo mismo que se puede proyectar como rabia hacia otros o las circunstancias.",
            positiveAlternative: "Esto es difícil ahora, pero puedo aprender con práctica",
            childExample: "Me equivoqué en el examen → 'NUNCA voy a aprender esto, soy tonto' (humo) vs 'Hoy me salió mal, mañana practicaré más' (aire fresco)"
        ),
        TV2ThoughtPattern(
            negativeThought: "Nadie me quiere",
            thoughtType: .catastrophizing,
            whyItFeedsAnger: "Sentir que nadie te quiere por un evento aislado genera dolor que se transforma en rabia defensiva.",
            positiveAlternative: "Hoy no me escogieron para jugar, pero tengo amigos que me quieren",
            childExample: "No me invitaron a la fiesta → 'NADIE me quiere, no tengo amigos' (humo) vs 'Esta vez no me invitaron, pero mamá, papá y mis amigos sí me quieren' (aire fresco)"
        ),
        TV2ThoughtPattern(
            negativeThought: "Todo me sale mal",
            thoughtType: .generalization,
            whyItFeedsAnger: "Generalizar un fracaso a 'todo' crea desesperanza que alimenta frustración y rabia.",
            positiveAlternative: "Esto no salió como quería, pero he logrado otras cosas",
            childExample: "Se cayó mi helado → 'TODO me sale mal, siempre me pasa lo mismo' (humo) vs 'Hoy tuve mala suerte, pero otras cosas sí me salieron bien' (aire fresco)"
        )
    ]
    
    // MARK: - Escenarios de Aplicación de Principios
    static let scenarios: [TV2Scenario] = [
        TV2Scenario(
            title: "La Torre que se Cayó",
            situation: "Luca estaba construyendo una torre de bloques muy alta. Cuando estaba a punto de terminar, su hermana pequeña tropezó y la tiró sin querer.",
            triggerIdentified: "Botón de Frustración (su esfuerzo se perdió) + Botón de Injusticia ('no es justo que ella la tire')",
            thoughtPatternIdentified: "Nube de Humo: 'Ella SIEMPRE me estropea las cosas' + 'Lo hizo a propósito'",
            volcanoPhase: "Burbujeo - manos en puños, cara roja, respiración acelerada",
            interventionApplied: "Papá reconoció la fase: 'Veo que tu volcán está empezando a burbujear'. Ayudó a Luca a cazar las nubes: '¿Crees que lo hizo a propósito o fue un accidente?' Respiraron juntos.",
            outcome: "Luca reconoció que fue un accidente. Su volcán bajó del Burbujeo a la Chispa. Pudo decirle a su hermana: 'Me molesta que tires mi torre, pero sé que no lo hiciste a propósito.'",
            lessonLearned: "Identificar el botón (frustración) y cambiar la nube de humo (de 'a propósito' a 'accidente') bajó la intensidad del volcán antes de la erupción."
        ),
        TV2Scenario(
            title: "No Más Pantallas",
            situation: "Alba estaba viendo su serie favorita cuando mamá le dijo: 'Se acabó el tiempo de pantalla, a apagar'. Alba quería seguir viendo 'solo un episodio más'.",
            triggerIdentified: "Botón de No Conseguir lo que Quiero",
            thoughtPatternIdentified: "Nube de Humo: 'Mamá es mala, nunca me deja hacer lo que quiero'",
            volcanoPhase: "Chispa Inicial - primer calor en el estómago, ganas de gritar 'NO'",
            interventionApplied: "Alba reconoció la Chispa a tiempo (había practicado). Le dijo a mamá: 'Siento que mi volcán se está encendiendo porque quiero ver más'. Mamá validó: 'Entiendo que quieras seguir, es difícil parar cuando está entretenido'.",
            outcome: "Alba usó el Botón de Pausa (respiración profunda) antes de que el volcán creciera. Aunque no le gustó apagar, lo hizo sin gritar. Mamá reconoció su esfuerzo: 'Veo que usaste tus herramientas, estoy orgullosa'.",
            lessonLearned: "Intervenir en la Chispa es mucho más fácil que esperar a la Erupción. Validar la emoción ('Entiendo') no significa ceder ('pero igual toca apagar')."
        ),
        TV2Scenario(
            title: "El Amigo que No Lo Invitó",
            situation: "Luca vio que su mejor amigo Diego estaba celebrando su cumpleaños con otros niños, pero no lo había invitado. Se sintió muy triste y solo.",
            triggerIdentified: "Botón de Emociones Enmascaradas - La tristeza y el dolor se esconden detrás de la rabia",
            thoughtPatternIdentified: "Nube de Humo: 'Diego es malo' + 'Nadie me quiere' + 'No tengo amigos'",
            volcanoPhase: "Erupción - llegó a casa gritando, cerró la puerta de un golpe, dijo 'Odio a Diego'",
            interventionApplied: "Papá no castigó la rabia. En cambio, buscó la emoción debajo: '¿Estás enojado... o también triste?' Luca lloró. Papá validó: 'Duele cuando alguien que quieres no te incluye'. Juntos cazaron las nubes: '¿Diego es malo o hizo algo que te dolió?' '¿NADIE te quiere o esta vez no te invitó?'",
            outcome: "Luca pudo nombrar: 'Estoy triste, no solo enojado'. Identificó que la rabia protegía el dolor. Al día siguiente habló con Diego: 'Me dolió que no me invitaras'. Diego explicó que solo podía invitar a 5 niños. Se reconciliaron.",
            lessonLearned: "A veces el volcán esconde emociones más vulnerables. Buscar qué hay debajo de la rabia (tristeza, miedo, soledad) permite sanar la verdadera herida."
        ),
        TV2Scenario(
            title: "El Examen Difícil",
            situation: "Alba estudió mucho para su examen de matemáticas, pero cuando lo recibió de vuelta, tenía muchos errores. Se sintió frustrada y tonta.",
            triggerIdentified: "Botón de Frustración (no logró su objetivo) + Autocrítica",
            thoughtPatternIdentified: "Nubes de Humo: 'Nunca podré aprender esto' + 'Soy tonta' + 'Todo me sale mal'",
            volcanoPhase: "Burbujeo - ceño fruncido, mandíbula tensa, ganas de romper el examen",
            interventionApplied: "Maestra reconoció las señales: 'Alba, veo que estás frustrada'. Alba asintió. La maestra ayudó a cazar nubes: '¿De verdad NUNCA podrás aprenderlo? ¿O necesitas más práctica?' '¿TODO te sale mal o solo este examen hoy?' Alba reflexionó.",
            outcome: "Alba cambió las nubes: 'No soy tonta, las matemáticas son difíciles para mí, pero puedo mejorar practicando'. La maestra le ofreció ayuda extra. Alba aceptó en lugar de rendirse.",
            lessonLearned: "Las nubes de autocrítica ('soy tonta', 'nunca podré') alimentan el volcán de frustración. Cambiarlas por pensamientos realistas ('es difícil, pero puedo aprender') abre la puerta a buscar soluciones."
        )
    ]
    
    // MARK: - Citas Inspiradoras
    static let quotes: [TV2Quote] = [
        TV2Quote(
            text: "El volcán no explota de repente. Siempre avisa. Solo necesitamos aprender a escuchar.",
            author: "Míriam Tirado",
            context: "Las señales de las tres fases son oportunidades de intervención"
        ),
        TV2Quote(
            text: "Los pensamientos son como nubes: pueden ser oscuras y pesadas, o ligeras y transparentes. Podemos elegir cuáles queremos tener.",
            author: "Míriam Tirado",
            context: "Reestructuración cognitiva - cambiar nubes de humo por aire fresco"
        ),
        TV2Quote(
            text: "Entender qué botón se presionó nos ayuda a responder con empatía en lugar de con castigo.",
            author: "Míriam Tirado",
            context: "Identificar desencadenantes permite intervenciones más efectivas"
        ),
        TV2Quote(
            text: "Cuanto más temprano intervenimos, más fácil es. Una chispa se apaga con un soplido; una erupción necesita mucho más.",
            author: "Míriam Tirado",
            context: "Principio de intervención temprana"
        ),
        TV2Quote(
            text: "A veces la rabia es solo una máscara. Debajo puede haber tristeza, miedo o soledad pidiendo ser vistas.",
            author: "Míriam Tirado",
            context: "Botón de emociones enmascaradas"
        )
    ]
}

