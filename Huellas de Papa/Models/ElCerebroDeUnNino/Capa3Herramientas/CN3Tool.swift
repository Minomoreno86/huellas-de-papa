import Foundation

/// Representa una herramienta práctica del Cerebro del Niño
/// Aplicación concreta de las 12 estrategias de Daniel Siegel
struct CN3Tool: Codable, Identifiable {
    let id: UUID
    let name: String               // Nombre de la herramienta
    let strategyNumber: Int        // 1-12, qué estrategia aplica
    let strategyName: String       // Nombre de la estrategia
    let objective: String          // Objetivo neuroemocional
    let ageRange: String          // Edad recomendada
    let duration: String          // Tiempo estimado
    let materials: [String]        // Materiales necesarios
    let steps: [String]            // Pasos detallados
    let whenToUse: String         // Cuándo usar esta herramienta
    let brainImpact: String       // Qué pasa en el cerebro
    let tips: [String]            // Tips para padres
    let icon: String              // SF Symbol
    let color: String             // Color
    
    init(name: String, strategyNumber: Int, strategyName: String, objective: String, ageRange: String, duration: String, materials: [String], steps: [String], whenToUse: String, brainImpact: String, tips: [String], icon: String, color: String) {
        self.id = UUID()
        self.name = name
        self.strategyNumber = strategyNumber
        self.strategyName = strategyName
        self.objective = objective
        self.ageRange = ageRange
        self.duration = duration
        self.materials = materials
        self.steps = steps
        self.whenToUse = whenToUse
        self.brainImpact = brainImpact
        self.tips = tips
        self.icon = icon
        self.color = color
    }
}

/// Herramientas prácticas basadas en las 12 estrategias del libro
let cn3Tools: [CN3Tool] = [
    CN3Tool(
        name: "El Abrazo Primero",
        strategyNumber: 1,
        strategyName: "Conecta y Redirige",
        objective: "Practicar conectar emocionalmente antes de corregir comportamiento",
        ageRange: "2-12 años",
        duration: "2-5 minutos",
        materials: ["Ninguno"],
        steps: [
            "Cuando tu hijo tiene un comportamiento difícil, PAUSA antes de reaccionar",
            "Arrodíllate o siéntate a su altura para estar cara a cara",
            "Observa su expresión facial y lenguaje corporal (¿qué emoción ves?)",
            "Ofrece contacto físico apropiado: abrazo, mano en el hombro, o simplemente proximidad",
            "Usa voz calmada y validadora: 'Veo que estás [emoción]. Algo difícil pasó.'",
            "Espera señales de que está receptivo: respiración más calmada, hace contacto visual, su cuerpo se relaja",
            "SOLO AHORA redirige: 'Entiendo que estás enojado. Y también necesitamos [límite]. ¿Qué opciones tenemos?'",
            "Si no está receptivo, repite pasos 4-6 hasta que su sistema nervioso se calme"
        ],
        whenToUse: "En cualquier momento de comportamiento difícil, berrinche, o conflicto. Especialmente cuando tu primera reacción es gritar o castigar.",
        brainImpact: "Tu presencia calmada activa el sistema nervioso parasimpático de tu hijo (calma). Esto permite que su hemisferio derecho emocional se regule. Solo cuando está calmado, su hemisferio izquierdo lógico puede procesar. Conectar primero = cerebro receptivo.",
        tips: [
            "Recuerda: NO puedes redirigir un cerebro inferior activado. Conecta primero.",
            "Tu calma es contagiosa. Respira profundo antes de acercarte.",
            "Si tu hijo rechaza el contacto físico, respeta. Proximidad y voz calmada también conectan.",
            "La secuencia importa: Derecho → Izquierdo. Emoción → Lógica. Conectar → Redirigir."
        ],
        icon: "heart.circle.fill",
        color: "pink"
    ),
    
    CN3Tool(
        name: "El Libro de Historias Difíciles",
        strategyNumber: 2,
        strategyName: "Nombra para Dominar",
        objective: "Ayudar al niño a integrar experiencias difíciles contando la historia completa",
        ageRange: "3-12 años",
        duration: "10-20 minutos",
        materials: ["Papel", "Crayones o marcadores", "Opcional: Fotos relacionadas con el evento"],
        steps: [
            "Elige un momento calmado (no inmediatamente después del evento difícil)",
            "Invita a tu hijo: 'Vamos a hacer un libro sobre lo que pasó [evento difícil]'",
            "Pregunta: '¿Qué pasó primero?' Escribe o dibuja la primera página",
            "Continúa: '¿Y luego qué pasó?' Segunda página",
            "Incluye las EMOCIONES: '¿Cómo te sentiste cuando...?' Dibuja la cara con esa emoción",
            "Continúa hasta el FINAL de la historia: '¿Y cómo terminó? ¿Cómo te sientes ahora?'",
            "Lean el libro juntos. Señala: 'Tenía principio, medio y FIN. Ya pasó.'",
            "Ofrece releer el libro cuando el niño quiera o cuando la emoción resurja"
        ],
        whenToUse: "Después de cualquier experiencia emocionalmente intensa: pesadilla, accidente, pérdida, cambio grande, conflicto, miedo. Especialmente cuando el niño sigue pensando o hablando del evento.",
        brainImpact: "Las experiencias traumáticas o muy emocionales a menudo se almacenan como memoria implícita (emociones y sensaciones sin palabras). Al crear una narrativa explícita (con palabras y secuencia), el hemisferio izquierdo ayuda al derecho a procesar. Esto integra la memoria y reduce su poder emocional.",
        tips: [
            "Para niños pequeños (3-5 años), usa más dibujos y menos palabras.",
            "NO minimices las emociones. Si dice 'estaba aterrado', valida esa emoción.",
            "El objetivo no es cambiar la historia, sino darle estructura narrativa.",
            "Releer el libro múltiples veces fortalece la integración de la memoria."
        ],
        icon: "book.fill",
        color: "blue"
    ),
    
    CN3Tool(
        name: "El Menú de Opciones",
        strategyNumber: 3,
        strategyName: "Involucra, No Enfurezcas",
        objective: "Activar el cerebro superior dando opciones en lugar de órdenes",
        ageRange: "2-12 años",
        duration: "1-3 minutos",
        materials: ["Ninguno"],
        steps: [
            "Cuando necesites que tu hijo haga algo, PAUSA antes de dar una orden",
            "En lugar de: '¡Vístete ahora!' di: '¿Quieres vestirte antes o después de desayunar?'",
            "En lugar de: '¡Apaga la TV!' di: '¿Quieres apagarla tú o quieres que yo te ayude?'",
            "En lugar de: '¡Recoge tus juguetes!' di: '¿Qué guardamos primero, los bloques o los carritos?'",
            "Ofrece 2-3 opciones donde TODAS sean aceptables para ti",
            "Si el niño elige algo fuera de las opciones: 'Esa no es una de las opciones. Te di [opción A] o [opción B].'",
            "Para niños mayores (8+): '¿Qué crees que deberías hacer?' (todavía más autonomía)"
        ],
        whenToUse: "En rutinas diarias (vestirse, comer, bañarse, tareas), transiciones difíciles, cualquier momento donde normalmente darías una orden directa.",
        brainImpact: "Las órdenes directas activan el cerebro inferior reactivo ('lucha o huida'). Las opciones involucran el cerebro superior: corteza prefrontal para decisión, consideración de consecuencias, sensación de control. Cerebro superior activado = menos resistencia, más cooperación.",
        tips: [
            "Las opciones deben ser reales. No digas '¿Quieres bañarte?' si no es opcional.",
            "Para niños de 2-4 años: máximo 2 opciones simples.",
            "Si el niño no puede decidir: 'Veo que es difícil. Voy a elegir por ti esta vez: [opción A].'",
            "Esto no es permisividad. Los límites siguen, pero con autonomía dentro de ellos."
        ],
        icon: "list.bullet.circle.fill",
        color: "purple"
    ),
    
    CN3Tool(
        name: "Gimnasio del Cerebro Superior",
        strategyNumber: 4,
        strategyName: "Úsalo o Piérdelo",
        objective: "Ejercitar el cerebro superior con actividades de decisión, planificación y regulación",
        ageRange: "3-12 años",
        duration: "Integrar en rutina diaria",
        materials: ["Situaciones cotidianas"],
        steps: [
            "Identifica oportunidades diarias para ejercitar el cerebro superior",
            "Decisiones: '¿Qué quieres de lunch?' '¿A cuál amigo invitamos?'",
            "Planificación: '¿Cómo te vas a preparar para el examen?' '¿Qué necesitas para tu proyecto?'",
            "Consecuencias: '¿Qué crees que pasará si...?' '¿Qué opciones tienes?'",
            "Regulación: '¿Cómo puedes calmarte cuando te enojas?' '¿Qué necesitas?'",
            "Empatía: '¿Cómo crees que se sintió ella?' '¿Qué harías tú?'",
            "Reflexión: '¿Qué salió bien hoy?' '¿Qué harías diferente?'",
            "Celebra el ESFUERZO de pensar, no solo el resultado"
        ],
        whenToUse: "Integrar en conversaciones diarias. Cada vez que hay una decisión, problema, conflicto, o reflexión, es una oportunidad de ejercitar.",
        brainImpact: "El cerebro superior (corteza prefrontal) no madura hasta los 25 años. Es como un músculo: se fortalece con uso. Cada oportunidad de decisión, planificación, consideración de consecuencias, o regulación fortalece las conexiones neuronales del cerebro superior.",
        tips: [
            "Ajusta complejidad a la edad: 3 años = decisiones simples, 10 años = planificación compleja.",
            "NO des todas las respuestas. Deja que su cerebro trabaje.",
            "Si se frustra: 'Es difícil, ¿verdad? Tu cerebro está creciendo.'",
            "El objetivo no es perfección, sino práctica."
        ],
        icon: "brain.head.profile",
        color: "orange"
    ),
    
    CN3Tool(
        name: "Bailar para Regular",
        strategyNumber: 5,
        strategyName: "Muévelo o Piérdelo",
        objective: "Usar movimiento físico para cambiar el estado emocional y resetear el cerebro",
        ageRange: "2-12 años",
        duration: "5-15 minutos",
        materials: ["Espacio para moverse", "Opcional: música"],
        steps: [
            "Cuando tu hijo está atascado en emoción negativa (enojo, ansiedad, frustración), sugiere movimiento",
            "'Veo que estás muy [emoción]. Vamos a mover el cuerpo.'",
            "Opciones: bailar, saltar, correr, hacer yoga, jugar a la pelota, caminar afuera",
            "Participa CON tu hijo. No lo mandes solo.",
            "Movimiento vigoroso: 5-10 minutos",
            "Observa cambio en expresión facial, respiración, postura",
            "Una vez regulado: 'Ahora tu cuerpo está más calmado. ¿Quieres hablar sobre lo que pasó?'",
            "Si dice no, respeta. El movimiento ya ayudó a regular."
        ],
        whenToUse: "Cuando cerebro inferior está activado: berrinches, ansiedad, inquietud, exceso de energía, dificultad para concentrarse, antes de conversaciones difíciles.",
        brainImpact: "El movimiento físico libera neurotransmisores (dopamina, serotonina) que calman la amígdala. Cambia química cerebral. Permite que el cerebro superior vuelva a estar online. Es una de las formas más rápidas de regular el sistema nervioso.",
        tips: [
            "No es castigo ('Ve a correr 10 vueltas'). Es regulación ('Vamos a mover juntos').",
            "Para niños con TDAH o alta energía: movimiento preventivo diario.",
            "Movimiento antes de tarea o conversación difícil = cerebro más receptivo.",
            "Tu hijo aprende: 'Cuando me siento así, mover mi cuerpo ayuda.'"
        ],
        icon: "figure.run",
        color: "green"
    ),
    
    CN3Tool(
        name: "Control Remoto de la Mente",
        strategyNumber: 6,
        strategyName: "Usa el Control Remoto Mental",
        objective: "Usar metáforas de control remoto para dar perspectiva sobre experiencias",
        ageRange: "4-12 años",
        duration: "5-10 minutos",
        materials: ["Ninguno (o un control remoto real como prop)"],
        steps: [
            "Cuando tu hijo está atascado en una experiencia difícil, introduce la metáfora",
            "'Imagina que tienes un control remoto para tu mente. ¿Qué botones tiene?'",
            "PAUSA: '¿Podemos pausar este momento? Respiremos juntos.' (Calma)",
            "REBOBINA: '¿Qué pasó antes de esto? ¿Cómo empezó?' (Entender secuencia)",
            "AVANCE RÁPIDO: '¿Qué pasará después? ¿Cómo terminará esto?' (Perspectiva temporal)",
            "CÁMARA LENTA: 'Veamos esto más despacio. ¿Qué sentiste exactamente?' (Detalles)",
            "Para experiencias pasadas: 'Rebobinemos a [evento]. ¿Qué harías diferente?'",
            "Para ansiedad sobre futuro: 'Avancemos rápido. ¿Qué ves? ¿Qué es lo peor? ¿Lo mejor?'"
        ],
        whenToUse: "Cuando el niño está abrumado por emoción, atascado en un pensamiento negativo, o ansioso sobre el futuro. También para procesar experiencias pasadas.",
        brainImpact: "Esta herramienta activa corteza prefrontal (cerebro superior) dando sensación de control sobre la mente. Las metáforas visuales (control remoto) son procesadas por hemisferio derecho, haciéndolas más accesibles que solo palabras. Crea distancia entre el niño y la emoción.",
        tips: [
            "Para niños pequeños (4-6): usa un control remoto real y hazlo más concreto.",
            "No uses esto EN MEDIO de berrinche. Primero conecta, LUEGO usa el control.",
            "La clave es dar perspectiva: las experiencias tienen principio, medio, FIN.",
            "Practica en momentos calmados para que esté disponible en momentos difíciles."
        ],
        icon: "tv.and.mediabox",
        color: "indigo"
    ),
    
    CN3Tool(
        name: "Álbum de Memorias Familiares",
        strategyNumber: 7,
        strategyName: "Recuerda Recordar",
        objective: "Fortalecer memoria autobiográfica y sentido de identidad",
        ageRange: "3-12 años",
        duration: "15-30 minutos (actividad semanal)",
        materials: ["Fotos familiares", "Álbum o cuaderno", "Materiales para decorar"],
        steps: [
            "Elige un momento relajado en familia (fin de semana)",
            "Seleccionen fotos de eventos pasados (vacaciones, cumpleaños, días cotidianos)",
            "Para cada foto, haz preguntas: '¿Qué estábamos haciendo? ¿Cómo te sentiste ese día? ¿Qué recuerdas?'",
            "Ayuda a tu hijo a crear la NARRATIVA completa: '¿Qué pasó antes? ¿Y después?'",
            "Pega la foto y escriban juntos la historia",
            "También habla del futuro: '¿Qué quieres hacer el próximo año? ¿Cómo te imaginas?'",
            "Revisen el álbum regularmente: 'Mira cómo has crecido. ¿Recuerdas esto?'"
        ],
        whenToUse: "Como actividad regular (semanal o mensual) para construir memoria autobiográfica. También útil después de eventos grandes (mudanzas, cambio de escuela, nacimiento de hermano).",
        brainImpact: "El hipocampo (memoria autobiográfica) se fortalece recordando activamente. Crear narrativas del pasado y planear el futuro integra memoria y construye sentido coherente de identidad: 'Esta soy yo, este es mi pasado, este será mi futuro.'",
        tips: [
            "Incluye emociones, no solo eventos: '¿Cómo te sentiste?'",
            "No corrijas sus recuerdos. La percepción subjetiva importa.",
            "Para niños con trauma o experiencias difíciles: incluye también memorias positivas.",
            "Esto enseña: tu vida es una historia continua con pasado, presente y futuro."
        ],
        icon: "photo.on.rectangle.angled",
        color: "teal"
    ),
    
    CN3Tool(
        name: "Observatorio de Emociones",
        strategyNumber: 8,
        strategyName: "Deja que las Nubes Pasen",
        objective: "Enseñar que las emociones son temporales como nubes que pasan",
        ageRange: "4-12 años",
        duration: "3-5 minutos",
        materials: ["Ninguno (o dibujos de nubes)"],
        steps: [
            "Cuando tu hijo está en emoción intensa, introduce la metáfora",
            "'Las emociones son como nubes en el cielo. Vienen, pasan, y se van.'",
            "'Ahora hay una nube grande de [tristeza/enojo]. Está aquí ahora.'",
            "'Vamos a observarla juntos. ¿De qué color es esta nube? ¿Qué tan grande?'",
            "'Las nubes no se quedan para siempre. Vamos a respirar y ver cómo se mueve.'",
            "Respiren juntos 5-10 respiraciones profundas",
            "'¿La nube sigue igual de grande? ¿O está empezando a moverse?'",
            "Cuando la emoción disminuya: 'Mira, la nube pasó. Vino y se fue. Así son las emociones.'"
        ],
        whenToUse: "En medio de emociones intensas (tristeza, enojo, frustración, miedo). Especialmente útil cuando el niño dice 'siempre' o 'nunca' ('Siempre estoy triste', 'Nunca me va bien').",
        brainImpact: "Esta herramienta enseña 'desfusión cognitiva': la capacidad de observar pensamientos y emociones sin identificarse completamente con ellos. Activa corteza prefrontal medial (autoobservación). El niño aprende: 'Tengo emociones, pero no SOY mis emociones.'",
        tips: [
            "Usa esta metáfora repetidamente para que se internalice.",
            "También puedes usar: 'Las emociones son como olas del mar - suben y bajan.'",
            "NO minimices: 'Sí, es una nube grande ahora. Y también pasará.'",
            "A largo plazo, esta herramienta desarrolla resiliencia emocional profunda."
        ],
        icon: "cloud.fill",
        color: "cyan"
    ),
    
    CN3Tool(
        name: "Práctica de SIFT",
        strategyNumber: 9,
        strategyName: "SIFT",
        objective: "Desarrollar conciencia del mundo interior (Sensaciones, Imágenes, Sentimientos, Pensamientos)",
        ageRange: "5-12 años",
        duration: "5-10 minutos",
        materials: ["Papel y lápiz (opcional)"],
        steps: [
            "Cuando tu hijo está emocionalmente activado o confundido, invita a hacer SIFT",
            "'Vamos a explorar qué está pasando dentro de ti. Usaremos SIFT.'",
            "S - Sensaciones: '¿Qué sientes en tu CUERPO? ¿Tu estómago? ¿Tu pecho? ¿Tus manos?'",
            "I - Imágenes: '¿Qué IMÁGENES o recuerdos ves en tu mente?'",
            "F - Sentimientos: '¿Qué EMOCIONES tienes? (triste, enojado, asustado, feliz)'",
            "T - Pensamientos: '¿Qué PENSAMIENTOS pasan por tu cabeza? ¿Qué te estás diciendo?'",
            "Escucha sin juzgar. Solo observen juntos.",
            "Para niños mayores: pueden escribir o dibujar cada elemento"
        ],
        whenToUse: "Cuando el niño está confundido sobre sus emociones, reaccionando sin saber por qué, o necesita desarrollar autoconocimiento. También útil como práctica diaria de mindfulness.",
        brainImpact: "SIFT activa múltiples áreas: ínsula (conciencia corporal), corteza visual (imágenes), amígdala (emociones), corteza prefrontal (pensamientos). Integra estas áreas y desarrolla 'visión de la mente' (mindsight): la capacidad de observar el mundo interior con claridad.",
        tips: [
            "No todos los niños tienen acceso a todas las áreas. Algunos no notan sensaciones corporales. Está bien.",
            "El objetivo es OBSERVAR, no cambiar. Solo nombrar lo que está ahí.",
            "Practica SIFT contigo mismo primero. Modela en voz alta: 'Yo siento...'",
            "Con práctica, esta herramienta se vuelve automática y desarrolla autorregulación profunda."
        ],
        icon: "eye.circle.fill",
        color: "purple"
    ),
    
    CN3Tool(
        name: "Juego de Perspectivas",
        strategyNumber: 10,
        strategyName: "Ejercita la Visión de la Mente",
        objective: "Desarrollar empatía considerando la perspectiva de otros",
        ageRange: "4-12 años",
        duration: "5-10 minutos",
        materials: ["Situaciones cotidianas o libros con personajes"],
        steps: [
            "Después de un conflicto o leyendo un libro, pregunta sobre perspectivas",
            "'¿Cómo crees que se sintió [la otra persona] cuando...?'",
            "'Mira su cara. ¿Qué emoción ves?'",
            "'¿Por qué crees que hizo/dijo eso? ¿Qué estaba pensando?'",
            "'Si tú fueras [la otra persona], ¿qué sentirías?'",
            "'¿Qué necesitaba [la otra persona]? ¿Qué quería?'",
            "Para conflictos: '¿Cómo podemos arreglar esto para que ambos estén bien?'",
            "También pregunta sobre TU perspectiva: '¿Cómo crees que me sentí yo cuando...?'"
        ],
        whenToUse: "Después de conflictos con hermanos o amigos, leyendo libros, viendo películas, o en conversaciones diarias. Cualquier momento es oportunidad de ejercitar empatía.",
        brainImpact: "Preguntas sobre perspectivas ajenas activan neuronas espejo y corteza prefrontal medial (áreas de empatía y teoría de la mente). 'Visión de la mente' (mindsight) se desarrolla con práctica: la capacidad de entender que otros tienen pensamientos, sentimientos y perspectivas diferentes.",
        tips: [
            "Niños pequeños (4-6) aún están desarrollando esta capacidad. Ten expectativas realistas.",
            "No sermones. Pregunta genuinamente y escucha su respuesta.",
            "Si dice 'No sé', ofrece posibilidades: '¿Crees que estaba triste? ¿Enojado?'",
            "Esto no es solo para conflictos. También practica con experiencias positivas."
        ],
        icon: "person.2.circle.fill",
        color: "pink"
    ),
    
    CN3Tool(
        name: "Ritual de Diversión Familiar",
        strategyNumber: 11,
        strategyName: "Incrementa el Factor Diversión",
        objective: "Priorizar tiempo de conexión alegre que fortalece el cerebro",
        ageRange: "0-18 años",
        duration: "15-60 minutos diarios o semanales",
        materials: ["Depende de la actividad elegida"],
        steps: [
            "En familia, hagan una lista de actividades que TODOS disfrutan",
            "Ideas: juegos de mesa, cocinar juntos, bailar, caminar, contar chistes, proyectos creativos",
            "CALENDARIO: agenden tiempo NO NEGOCIABLE de diversión familiar",
            "Durante este tiempo: CERO pantallas, CERO tareas, CERO conversaciones serias",
            "El objetivo es RISAS, JUEGO, CONEXIÓN",
            "Roten quién elige la actividad cada semana",
            "Observen: después de tiempo de diversión, ¿cómo está el ambiente familiar?",
            "Hagan de esto una PRIORIDAD, no algo 'si hay tiempo'"
        ],
        whenToUse: "Como rutina regular (diaria o semanal). Especialmente importante en épocas de estrés, cambios, o cuando notas que la familia está desconectada.",
        brainImpact: "Risas y juego liberan oxitocina (hormona de conexión) y fortalecen vínculos. Las experiencias alegres compartidas crean memoria positiva que literalmente cablean el cerebro para seguridad y conexión. Niños con mucha diversión familiar desarrollan mejor regulación emocional y resiliencia.",
        tips: [
            "Si tu familia está muy desconectada, empieza con 15 minutos diarios.",
            "La diversión no requiere dinero. A veces lo más simple es lo mejor.",
            "TU presencia presente es el regalo. Guarda el teléfono.",
            "Esto no es negociable. Es tan importante como comida o sueño para desarrollo cerebral."
        ],
        icon: "face.smiling.fill",
        color: "yellow"
    ),
    
    CN3Tool(
        name: "Reparación Después de Conflicto",
        strategyNumber: 12,
        strategyName: "Conéctate a Través del Conflicto",
        objective: "Usar conflictos como oportunidades de enseñanza y reparación relacional",
        ageRange: "3-18 años",
        duration: "10-20 minutos",
        materials: ["Ninguno"],
        steps: [
            "Después de un conflicto (tuyo con tu hijo, o entre hermanos), una vez que todos están calmados",
            "'Tuvimos un momento difícil. Vamos a reparar nuestra conexión.'",
            "RECONOCE tu parte: 'Yo levanté la voz y eso te asustó. Lo siento.'",
            "Valida la emoción del otro: 'Veo que estabas muy [emoción].'",
            "Pregunta: '¿Qué necesitabas en ese momento que no recibiste?'",
            "Reflexión: '¿Qué podemos hacer diferente la próxima vez?'",
            "REPARA: abrazo, 'te amo', reconexión física",
            "Para conflictos entre hermanos: facilita este proceso entre ellos",
            "Cierra con: 'Los conflictos pasan. Lo importante es cómo los reparamos.'"
        ],
        whenToUse: "Después de CUALQUIER conflicto significativo. No dejes que el día termine sin reparar. También modela cuando TÚ cometes errores.",
        brainImpact: "La reparación enseña que: 1) Los errores son normales, 2) Las relaciones pueden repararse, 3) Los conflictos no rompen el vínculo. Esto desarrolla seguridad de apego y resiliencia relacional. El niño aprende: 'Puedo cometer errores y seguir siendo amado.'",
        tips: [
            "La reparación debe ser GENUINA. No es solo decir 'perdón' automático.",
            "Si tu hijo se resiste, respeta. Puedes decir: 'Cuando estés listo, me gustaría reparar.'",
            "Modela vulnerabilidad. Si te equivocaste, admítelo sinceramente.",
            "La capacidad de reparar relaciones es una de las habilidades más importantes para la vida."
        ],
        icon: "arrow.triangle.2.circlepath.circle.fill",
        color: "green"
    )
]

