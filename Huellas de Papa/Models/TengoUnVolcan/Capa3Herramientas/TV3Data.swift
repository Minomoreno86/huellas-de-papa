import Foundation

/// Datos consolidados de la Capa 3: Herramientas del modelo "Tengo un Volcán"
/// Basado en el libro de Míriam Tirado - La Caja de Herramientas
struct TV3Data {
    
    // MARK: - La Caja de Herramientas del Volcán
    static let tools: [TV3Tool] = [
        TV3Tool(
            name: "El Botón de Pausa",
            category: .breathing,
            objective: "Ayudar a tu hijo a reducir la activación del volcán mediante respiración consciente guiada",
            whenToUse: "Cuando notes que tu hijo está en la Chispa o el Burbujeo. Es la primera línea de intervención antes de la erupción.",
            howItWorks: "La respiración profunda activa el sistema nervioso parasimpático de tu hijo, calmando su cuerpo y dando tiempo a su cerebro pensante para tomar decisiones en lugar de reaccionar impulsivamente. Tu presencia y guía hacen que la técnica sea más efectiva.",
            steps: [
                "PASO 1: Conéctate con tu hijo. Agáchate a su altura, haz contacto visual y di con voz calmada: 'Veo que tu volcán se está calentando. Vamos a usar el Botón de Pausa juntos'",
                "PASO 2: GUÍA 'HUELE LA FLOR' - Dile: 'Vamos a oler una flor imaginaria. Inspira profundo por la nariz conmigo' (cuenta hasta 4 en voz alta). Hazlo TÚ también para modelar. 'Siente cómo tu barriga se llena de aire como un globo'",
                "PASO 3: GUÍA 'APAGA LA VELA' - 'Ahora vamos a apagar las velas de un pastel. Sopla despacio por la boca' (cuenta hasta 6 en voz alta). Hazlo junto con él/ella. 'Muy suave, para que no se apaguen todas de golpe'",
                "PASO 4: Repite 3-5 veces, respirando JUNTOS. Mantén contacto físico suave si tu hijo lo permite (mano en la espalda, tomar su mano)",
                "PASO 5: Ayúdale a notar los cambios: 'Mira, tus hombros están bajando. Tus manos se están aflojando. Tu volcán está enfriándose'. Celebra: 'Lo lograste, usaste tu herramienta'"
            ],
            materials: ["Tu presencia calmada y atenta"],
            durationMinutes: "1-2 minutos",
            recommendedPhase: [.chispa, .burbujeo],
            ageRange: "3-12 años",
            fairyTip: "Recuerda: TÚ eres el modelo. Si respiras con calma, tu hijo aprenderá que esta herramienta funciona. Practica cuando ambos estén tranquilos para que esté lista cuando la necesiten.",
            iconName: "wind",
            color: "mint"
        ),
        
        TV3Tool(
            name: "El Paraguas Mágico",
            category: .distance,
            objective: "Ayudar a tu hijo a crear distancia física de la situación conflictiva para que pueda calmarse",
            whenToUse: "Cuando el Burbujeo es muy fuerte y ves que tu hijo está a punto de explotar. También cuando otro niño está en erupción y necesitas proteger a tu hijo.",
            howItWorks: "Alejarse físicamente reduce los estímulos que alimentan el volcán de tu hijo. El cambio de ambiente da a su cerebro la oportunidad de regularse. La metáfora del paraguas le ayuda a entender que no está huyendo, sino protegiéndose.",
            steps: [
                "PASO 1: Valida y ofrece la herramienta: 'Veo que tu volcán está muy caliente. ¿Necesitas tu Paraguas Mágico para ir a un lugar tranquilo?'",
                "PASO 2: Ayúdale a identificar su lugar seguro: 'Podemos ir a tu habitación, al jardín, o a nuestro rincón de calma. ¿Dónde te gustaría ir?'. Si ya lo tienen establecido, recuérdaselo",
                "PASO 3: Acompáñale si lo necesita, o deja que vaya solo si ya sabe autorregularse. Di: 'Estaré aquí cuando estés listo/a para volver'",
                "PASO 4: Respeta su tiempo. Algunos niños necesitan 5 minutos, otros 20. No lo apresures ni lo castigues por necesitar espacio",
                "PASO 5: Cuando vuelva más calmado, reconoce su esfuerzo: 'Usaste tu Paraguas Mágico. Tu volcán está más frío ahora. Estoy orgulloso/a de que pidieras lo que necesitabas'"
            ],
            materials: ["Un espacio seguro designado en casa donde tu hijo pueda ir a calmarse (su habitación, un rincón con cojines, etc.)"],
            durationMinutes: "5-15 minutos",
            recommendedPhase: [.burbujeo, .erupcion],
            ageRange: "4-12 años",
            fairyTip: "Importante: Explícale a tu hijo que alejarse NO es un castigo ni 'tiempo fuera'. Es una herramienta de autocuidado. La diferencia está en tu tono y en que sea SU elección (cuando sea posible).",
            iconName: "umbrella.fill",
            color: "blue"
        ),
        
        TV3Tool(
            name: "El Jardín Secreto",
            category: .calm,
            objective: "Ayudar a tu hijo a identificar y usar sus actividades calmantes personales",
            whenToUse: "Después del Paraguas Mágico, o cuando tu hijo necesita bajar el calor residual del volcán.",
            howItWorks: "Cada niño tiene actividades que naturalmente lo calman. Tu rol es identificarlas junto con él/ella y facilitarlas cuando las necesite. Estas actividades activan el sistema de calma natural del niño.",
            steps: [
                "PASO 1: IDENTIFICA el Jardín Secreto de tu hijo ANTES de una crisis. Observa qué lo calma naturalmente: ¿Dibujar? ¿Leer? ¿Abrazar a la mascota? ¿Escuchar música? ¿Jugar con plastilina? Pregúntale: '¿Qué te hace sentir tranquilo/a y feliz?'",
                "PASO 2: Crea acceso fácil. Ten esos materiales disponibles en su espacio de calma (colores, libros, música, peluches, etc.)",
                "PASO 3: Cuando use su Paraguas Mágico, ofrécele su Jardín: 'Tienes tu plastilina/libros/música en tu cuarto. ¿Quieres usarlos para calmarte?'",
                "PASO 4: Respeta su tiempo en el jardín. No interrumpas ni preguntes '¿Ya estás mejor?' Deja que el proceso fluya",
                "PASO 5: Cuando salga más calmado, reconoce: 'Veo que tu Jardín Secreto te ayudó. Tu volcán está más frío'"
            ],
            materials: ["Los que tu hijo elija: libros, colores, música, peluches, plastilina, bloques, etc. Ten variedad disponible"],
            durationMinutes: "10-30 minutos",
            recommendedPhase: [.burbujeo, .erupcion, .postErupcion],
            ageRange: "3-12 años",
            fairyTip: "El Jardín Secreto NO es una distracción para olvidar la emoción. Es un espacio donde tu hijo puede ESTAR con su emoción mientras se autorregula. No le digas 'Deja de estar triste', di 'Está bien estar triste. Tu jardín te ayudará a sentirte mejor'.",
            iconName: "leaf.fill",
            color: "green"
        ),
        
        TV3Tool(
            name: "Las Palabras Mágicas",
            category: .communication,
            objective: "Enseñar a tu hijo a expresar sentimientos y necesidades de forma asertiva, sin gritos ni culpas",
            whenToUse: "Cuando el volcán de tu hijo ha bajado y puede hablar con calma. NO durante la erupción.",
            howItWorks: "La comunicación en primera persona ('Yo siento...') en lugar de acusaciones ('Tú eres...') enseña a tu hijo a expresar emociones sin atacar, abriendo el diálogo en vez del conflicto. TÚ modelas esta comunicación primero.",
            steps: [
                "PASO 1: MODELA primero. Cuando TÚ estés molesto/a, usa estas palabras frente a tu hijo: 'Yo me siento frustrado/a cuando...' Ellos aprenden viéndote",
                "PASO 2: ENSEÑA la fórmula cuando estén tranquilos: 'Cuando algo te moleste, puedes decir: Yo siento [emoción] cuando [situación]'. Practica con ejemplos juntos",
                "PASO 3: AYÚDALE a usarla en el momento. Si viene enojado diciendo 'Pedro es malo', pregunta: '¿Qué sentiste cuando Pedro hizo eso?' Ayúdale a reformular: 'Entonces puedes decirle: Yo me siento triste cuando me dejas fuera del juego'",
                "PASO 4: ACOMPAÑA la conversación. Ofrece ir con él/ella a hablar con la otra persona si lo necesita. Tu presencia da seguridad",
                "PASO 5: CELEBRA cuando lo use: 'Usaste tus Palabras Mágicas. Le dijiste cómo te sientes en lugar de gritar. Estoy orgulloso/a'"
            ],
            materials: ["Tu ejemplo y acompañamiento"],
            durationMinutes: "2-5 minutos",
            recommendedPhase: [.postErupcion],
            ageRange: "4-12 años",
            fairyTip: "Clave: Los niños aprenden comunicación asertiva VIÉNDOTE a ti usarla. Cuando te disculpes con tu pareja, con ellos, o con otros, usa 'Yo me siento...' en lugar de 'Tú siempre...' Son esponjas.",
            iconName: "text.bubble.fill",
            color: "purple"
        ),
        
        TV3Tool(
            name: "La Fuente de la Calma",
            category: .help,
            objective: "SER la fuente de calma para tu hijo cuando su volcán es demasiado grande para manejarlo solo",
            whenToUse: "Cuando el volcán de tu hijo está en Erupción y ves que está desbordado. También cuando pide ayuda explícitamente.",
            howItWorks: "TÚ eres su adulto de confianza, su fuente de calma. Tu presencia regulada ayuda a regular su sistema nervioso (co-regulación). Esto es especialmente importante en niños pequeños que aún no pueden autorregularse.",
            steps: [
                "PASO 1: REGÚLATE TÚ primero. Respira profundo 3 veces. No puedes calmar a tu hijo si tú estás desbordado/a. Si lo necesitas, pide ayuda a otro adulto",
                "PASO 2: OFRECE tu presencia: 'Veo que tu volcán es muy grande. Estoy aquí para ayudarte'. Agáchate a su altura",
                "PASO 3: PREGUNTA qué necesita (si puede hablar): '¿Necesitas un abrazo? ¿Quieres que respiremos juntos? ¿Necesitas espacio?' Respeta su respuesta",
                "PASO 4: ACOMPAÑA sin juzgar. Si llora, deja que llore. Si grita (sin lastimar), deja que grite. Di: 'Puedes sentir todo esto. Estoy aquí contigo'. NO digas 'Cálmate'",
                "PASO 5: Cuando baje la intensidad, reconoce: 'Tu volcán era muy grande. Pediste ayuda y eso fue muy valiente'"
            ],
            materials: ["Tu presencia calmada y tu amor incondicional"],
            durationMinutes: "5-20 minutos (el tiempo que tu hijo necesite)",
            recommendedPhase: [.erupcion],
            ageRange: "3-12 años",
            fairyTip: "Recuerda: Pedir ayuda es fortaleza, no debilidad. Pero para que tu hijo pida ayuda, debe saber que TÚ estarás ahí sin juzgarlo, sin castigarlo, solo acompañando. Construye esa confianza día a día.",
            iconName: "person.2.fill",
            color: "orange"
        ),
        
        TV3Tool(
            name: "Caza de Nubes",
            category: .cognitive,
            objective: "Ayudar a tu hijo a identificar y cambiar pensamientos que alimentan su volcán",
            whenToUse: "Cuando el volcán ha bajado y tu hijo puede pensar con claridad. También preventivamente para fortalecer su pensamiento realista.",
            howItWorks: "Los pensamientos negativos ('nubes de humo') intensifican emociones. Tu rol es ayudar a tu hijo a cuestionarlos y cambiarlos por pensamientos realistas ('aire fresco'). Esto es reestructuración cognitiva adaptada a niños.",
            steps: [
                "PASO 1: ESCUCHA las nubes de humo. Cuando tu hijo diga cosas como 'Siempre me pasa a mí', 'Lo hace a propósito', 'Soy malo en esto', 'Nadie me quiere' - son nubes de humo que alimentan su volcán",
                "PASO 2: CUESTIONA con gentileza: '¿De verdad SIEMPRE te pasa? ¿O esta vez sí pero otras no?' '¿Lo hizo a propósito o fue sin querer?' '¿Eres malo en esto o necesitas práctica?'",
                "PASO 3: AYÚDALE a encontrar la nube de aire fresco (pensamiento realista): 'Entonces, en lugar de pensar \"siempre\", podemos pensar \"esta vez sí, pero otras veces no\". ¿Te parece?'",
                "PASO 4: HAZLO lúdico. Pueden dibujar las nubes: las oscuras (humo) y las claras (aire fresco). Táchale las oscuras y celebra las claras",
                "PASO 5: REFUERZA cuando lo haga solo: Si tu hijo dice 'Pensé que lo hizo a propósito, pero creo que fue un accidente' - ¡CELEBRA! 'Cazaste una nube de humo tú solo/a'"
            ],
            materials: ["Papel y colores opcionales para dibujar nubes"],
            durationMinutes: "3-10 minutos",
            recommendedPhase: [.chispa, .burbujeo, .postErupcion],
            ageRange: "5-12 años",
            fairyTip: "Esta herramienta requiere práctica constante. Caza las nubes de humo en ti mismo/a primero. Si dices 'Siempre hace esto' frente a tu hijo, le enseñas ese patrón. Modela pensamiento realista.",
            iconName: "cloud.fill",
            color: "purple"
        ),
        
        TV3Tool(
            name: "El Botón de la Disculpa",
            category: .repair,
            objective: "Enseñar a tu hijo a pedir perdón de forma sincera y significativa",
            whenToUse: "Después de que el volcán explotó y tu hijo lastimó a alguien (física o emocionalmente).",
            howItWorks: "La disculpa sincera repara vínculos y enseña responsabilidad. Pero debe ser genuina, no forzada. Tu rol es guiar, no obligar.",
            steps: [
                "PASO 1: ESPERA a que el volcán esté frío. Nunca fuerces una disculpa en caliente. Di: 'Cuando estés más tranquilo/a, hablaremos sobre cómo arreglar esto'",
                "PASO 2: CONVERSA primero en privado: '¿Qué pasó? ¿Cómo crees que se sintió [la otra persona]? ¿Qué podrías hacer para arreglarlo?' Desarrolla empatía",
                "PASO 3: MODELA la disculpa: 'Podrías decir: Perdón por [acción]. Sé que te hice sentir [emoción] y no estuvo bien'. NO uses 'Pero tú...' en la disculpa",
                "PASO 4: ACOMPAÑA si lo necesita. Ofrece ir con él/ella a disculparse si tiene miedo o vergüenza",
                "PASO 5: RECONOCE la valentía: 'Disculparte fue difícil y lo hiciste. Eso muestra que te importa la otra persona y que puedes reconocer cuando te equivocas'"
            ],
            materials: ["Tu guía y paciencia"],
            durationMinutes: "1-3 minutos (la disculpa) + tiempo previo de conversación",
            recommendedPhase: [.postErupcion],
            ageRange: "4-12 años",
            fairyTip: "NUNCA digas 'Pídele perdón ahora mismo' como castigo. Eso genera disculpas vacías ('Perdón') sin aprendizaje. Una disculpa forzada no repara nada. Mejor: 'Cuando estés listo/a, piensa cómo puedes arreglar esto'.",
            iconName: "heart.fill",
            color: "red"
        ),
        
        TV3Tool(
            name: "El Botón de la Reparación",
            category: .repair,
            objective: "Ayudar a tu hijo a reparar el daño causado con acciones concretas",
            whenToUse: "Después de la disculpa, para demostrar con hechos el arrepentimiento.",
            howItWorks: "Las palabras sanan, las acciones construyen. La reparación enseña que los errores se pueden corregir y que nuestras acciones tienen impacto en otros.",
            steps: [
                "PASO 1: PREGUNTA juntos: '¿Qué podemos hacer para que [la persona] se sienta mejor?' Deja que tu hijo proponga ideas primero",
                "PASO 2: GUÍA opciones apropiadas según la edad y la situación:\n  • Rompió algo → ayudar a arreglarlo o reponerlo\n  • Gritó → hacer una carta bonita o dar un abrazo\n  • Pegó → invitar a jugar su juego favorito\n  • Dijo algo feo → escribir/dibujar algo lindo",
                "PASO 3: FACILITA la reparación. Si es una carta, provee materiales. Si es un abrazo, acompaña. Si es reponer algo, ve con él/ella a la tienda",
                "PASO 4: NO lo hagas por él/ella. Es SU reparación. Tú solo acompañas y facilitas",
                "PASO 5: CIERRA el ciclo: Después de reparar, di: 'Cometiste un error Y lo arreglaste. Eso es ser responsable. Estoy orgulloso/a'"
            ],
            materials: ["Depende de la reparación: papel, colores, tiempo juntos, dinero para reponer algo, etc."],
            durationMinutes: "5-30 minutos (según la acción)",
            recommendedPhase: [.postErupcion],
            ageRange: "4-12 años",
            fairyTip: "La reparación NO es castigo. No digas 'Como pegaste, TIENES que jugar con él'. Di: '¿Qué crees que haría sentir mejor a tu hermano después de lo que pasó?' Empodera, no impongas.",
            iconName: "hammer.fill",
            color: "orange"
        ),
        
        TV3Tool(
            name: "Regar mi Jardín Interior",
            category: .prevention,
            objective: "Cuidar el bienestar general de tu hijo para prevenir que su volcán se active tan frecuentemente",
            whenToUse: "Todos los días. Es prevención, no reacción. Un niño bien cuidado tiene un volcán más tranquilo.",
            howItWorks: "El autocuidado básico (sueño, alimentación, movimiento, afecto) regula el sistema nervioso. Un niño cansado, hambriento o emocionalmente desconectado tiene el volcán hipersensible. TÚ creas las condiciones para su bienestar.",
            steps: [
                "PASO 1: SUEÑO - Asegura horas suficientes según su edad (3-5 años: 10-13h, 6-12 años: 9-12h). Rutina de sueño consistente. Un niño cansado tiene volcán sensible",
                "PASO 2: ALIMENTACIÓN - Comidas regulares y nutritivas. El hambre es un gran botón del volcán. Colaciones saludables disponibles",
                "PASO 3: MOVIMIENTO - Mínimo 1 hora de juego activo al día. Corre, salta, trepa. La energía acumulada se convierte en volcán. Libérenla juntos",
                "PASO 4: CONEXIÓN EMOCIONAL - 10-15 minutos diarios de tiempo de calidad 1-a-1. Sin pantallas, sin distracciones. Juega lo que él/ella elija. Llena su tanque emocional",
                "PASO 5: LÍMITES CLAROS Y CONSISTENTES - Los niños necesitan saber qué esperar. La inconsistencia genera volcanes. Establece reglas claras y cúmplelas con amor",
                "PASO 6: MODELAJE - TÚ también riega tu jardín. Si tú estás desbordado/a, tu hijo lo absorbe. Cuídate para poder cuidarlo/a"
            ],
            materials: ["Rutinas familiares saludables establecidas"],
            durationMinutes: "Todo el día - es un estilo de vida",
            recommendedPhase: [.chispa, .burbujeo, .erupcion, .postErupcion],
            ageRange: "3-12 años",
            fairyTip: "Este es el pilar preventivo más importante. El 80% de las erupciones se pueden prevenir con estas 6 cosas básicas. No son opcionales, son necesidades. Prioriza: sueño, comida, movimiento, afecto, consistencia. El resto es secundario.",
            iconName: "sparkles",
            color: "yellow"
        )
    ]
    
    // MARK: - Actividades de Práctica
    static let activities: [TV3Activity] = [
        TV3Activity(
            title: "¿Dónde está nuestro volcán?",
            description: "Actividad para identificar físicamente dónde los niños sienten su volcán en el cuerpo",
            relatedTool: "El Botón de Pausa",
            materials: [
                "El cuento 'Tengo un Volcán'",
                "Espacio para sentarse en círculo"
            ],
            instructions: [
                "1. Lee las primeras páginas del cuento donde se describe dónde está el volcán (entre el ombligo y las costillas)",
                "2. Pide a los niños que se sienten en círculo y pongan sus manos en esa área",
                "3. Pregunta: '¿Habéis sentido alguna vez algo aquí? ¿Como un calor? ¿Una sensación rara?'",
                "4. Deja que compartan sus experiencias sin juzgar. Todas las respuestas son válidas",
                "5. Explica que ese es su volcán, y que es normal tenerlo. Todos lo tenemos"
            ],
            durationMinutes: "20 minutos",
            ageRange: "4+ años",
            learningObjective: "Que los niños identifiquen dónde en su cuerpo sienten las emociones fuertes, conectando sensaciones físicas con el volcán interno",
            tips: [
                "No presiones si un niño no ha sentido esto. Es un proceso de autoconocimiento",
                "Valida todas las experiencias. Algunos pueden sentirlo en otros lugares del cuerpo",
                "Recuerda: no es educación emocional abstracta, es conectar con sus propias sensaciones"
            ],
            iconName: "person.fill"
        ),
        
        TV3Activity(
            title: "¡Cuando el volcán se enciende!",
            description: "Teatralización de las manifestaciones físicas de la rabia para reconocerlas",
            relatedTool: "Mapa Físico del Volcán",
            materials: [
                "El cuento 'Tengo un Volcán'",
                "Espacio amplio para moverse"
            ],
            instructions: [
                "1. Lee la parte del cuento donde el volcán echa fuego y Alba grita, patalea, etc.",
                "2. Pide a todos los niños que, al mismo tiempo, actúen lo que les pasa cuando su volcán echa fuego",
                "3. Déjales gritar (en un espacio apropiado), saltar, correr, hacer muecas - todo lo que pasa en una erupción",
                "4. Después, sentaos y pregunta: '¿Os pasa esto a veces? ¿Cuándo?'",
                "5. Escucha sus historias sin juzgar. Normaliza la experiencia"
            ],
            durationMinutes: "30 minutos",
            ageRange: "4+ años",
            learningObjective: "Reconocer y validar las manifestaciones físicas de la rabia, entendiendo que son normales y universales",
            tips: [
                "No coartes ninguna acción a menos que sea peligrosa",
                "Después de la actividad física, haz una transición a calma con respiración",
                "Recuerda que están aprendiendo a expresar, no a reprimir"
            ],
            iconName: "tornado"
        ),
        
        TV3Activity(
            title: "Soy el Hada del Volcán",
            description: "Crear y personalizar el Hada del Volcán como compañera de regulación emocional",
            relatedTool: "El Botón de Pausa",
            materials: [
                "Plantilla del hada para colorear (una por niño)",
                "Colores, crayones, brillantina",
                "Palito de madera",
                "Plastificadora (opcional)",
                "Recipiente o 'volcán' decorado para guardar las hadas"
            ],
            instructions: [
                "1. Lee la parte del cuento donde aparece el hada y le enseña a Alba a respirar",
                "2. Da a cada niño una plantilla del hada y pide que la coloreen y decoren a su gusto",
                "3. Mientras pintan, explica: 'Esta hada es TU hada. Te va a acompañar y recordarte cómo calmar tu volcán'",
                "4. Plastifican y pegan en un palito para que sea fácil de sostener",
                "5. Practica juntos: 'Cuando tu volcán se encienda, tomas tu hada y respiras como ella te enseñó: huele la flor, apaga la vela'",
                "6. Establece dónde vivirá el hada (en un volcán decorado en el aula, en la mochila, etc.)"
            ],
            durationMinutes: "60 minutos (puede dividirse en dos sesiones)",
            ageRange: "5+ años",
            learningObjective: "Crear un objeto transicional que recuerde al niño usar la respiración cuando el volcán se activa, fomentando autonomía en la regulación",
            tips: [
                "Si es posible, que cada niño tenga su propia hada para llevarse a casa",
                "Practica la respiración EN CALMA primero, muchas veces, antes de esperar que funcione en crisis",
                "El hada no es mágica por sí misma; es un recordatorio de la herramienta (respiración)"
            ],
            iconName: "sparkles"
        ),
        
        TV3Activity(
            title: "El Mural de Nuestro Volcán",
            description: "Crear un registro visual de las veces que el volcán se enciende en clase",
            relatedTool: "Los Botones del Volcán",
            materials: [
                "Papel de embalar grande",
                "Folios",
                "Colores y marcadores",
                "Cinta adhesiva"
            ],
            instructions: [
                "1. Prepara un mural grande titulado 'Nuestro Volcán'",
                "2. Cada vez que un niño sienta que su volcán se encendió (durante las horas lectivas), dibuja rápidamente qué pasó",
                "3. Pega el dibujo en el mural",
                "4. En círculo, pregunta: '¿Alguien más ha sentido esto? ¿Qué botón se presionó?'",
                "5. El mural crece con el tiempo, mostrando que TODOS tenemos volcanes y TODOS se nos encienden a veces"
            ],
            durationMinutes: "10 minutos cada vez que ocurre + 40 min preparación inicial",
            ageRange: "5+ años",
            learningObjective: "Normalizar la rabia, crear sentido de comunidad ('no soy el único') e identificar desencadenantes comunes",
            tips: [
                "No es un 'muro de la vergüenza'. Es un espacio de validación y aprendizaje",
                "Celebra cuando los niños compartan, no castigues",
                "Usa el mural para enseñar empatía: 'A Pedro le pasó lo mismo que a ti'"
            ],
            iconName: "photo.on.rectangle"
        ),
        
        TV3Activity(
            title: "Hadas y Volcanes (Juego)",
            description: "Juego de persecución donde los volcanes se transforman en hadas",
            relatedTool: "El Botón de Pausa",
            materials: [
                "Espacio amplio para correr",
                "Ningún material adicional"
            ],
            instructions: [
                "1. Divide al grupo en dos: Volcanes y Hadas",
                "2. Las Hadas persiguen a los Volcanes",
                "3. Cuando un Hada atrapa a un Volcán, ese Volcán se transforma en Hada (se une al equipo de Hadas)",
                "4. El objetivo es que TODOS los Volcanes se conviertan en Hadas",
                "5. Cuando todos sean Hadas, sentaos en círculo y respirad juntos: 'Huele la flor, apaga la vela' (5 veces)",
                "6. Reflexión: '¿Cómo se siente ser un Volcán? ¿Y un Hada? Todos tenemos ambos dentro'"
            ],
            durationMinutes: "20 minutos",
            ageRange: "4+ años",
            learningObjective: "Liberar energía física mientras se refuerza la idea de transformación (de volcán activo a calma), finalizando con práctica de respiración",
            tips: [
                "La transición final de movimiento a calma es crucial - no la saltes",
                "Si un niño no quiere correr, puede ser Hada desde el inicio",
                "Enfatiza: el volcán no es malo, solo necesita transformarse en hada cuando está muy caliente"
            ],
            iconName: "figure.run"
        )
    ]
    
    // MARK: - Frases Calmantes
    static let phrases: [TV3Phrase] = [
        TV3Phrase(
            text: "Respira. Huele la flor, apaga la vela.",
            situation: "Cuando sientes la Chispa o el Burbujeo",
            purpose: "Recordatorio de usar el Botón de Pausa antes de que el volcán explote",
            example: "Alba sintió calor en el estómago. Se dijo: 'Respira. Huele la flor, apaga la vela' y el calor bajó",
            iconName: "wind"
        ),
        TV3Phrase(
            text: "Mi volcán es parte de mí, pero yo no soy mi volcán.",
            situation: "Cuando te sientes culpable o avergonzado después de una erupción",
            purpose: "Separar identidad de emoción. La rabia es temporal, tú eres mucho más",
            example: "Luca gritó y se sintió mal. Su papá le dijo: 'Tu volcán explotó, pero tú eres Luca, y Luca es amable, divertido y está aprendiendo'",
            iconName: "heart.fill"
        ),
        TV3Phrase(
            text: "Está bien sentir rabia. No está bien lastimar.",
            situation: "Para establecer límites claros",
            purpose: "Validar la emoción mientras se ponen límites al comportamiento destructivo",
            example: "Alba quería golpear a su hermana. Mamá dijo: 'Está bien que estés enojada. No está bien golpear. Usemos tus herramientas'",
            iconName: "hand.raised.fill"
        ),
        TV3Phrase(
            text: "¿Qué necesito ahora mismo?",
            situation: "Cuando el Burbujeo está creciendo",
            purpose: "Fomentar autoconocimiento y pedir lo que se necesita antes de explotar",
            example: "Luca sintió que el volcán borboteaba. Se preguntó: '¿Qué necesito?' y se dio cuenta: 'Necesito un abrazo'",
            iconName: "questionmark.circle.fill"
        ),
        TV3Phrase(
            text: "Puedo pedir ayuda. Eso me hace valiente.",
            situation: "Cuando el volcán es demasiado grande",
            purpose: "Normalizar pedir ayuda como acto de fortaleza, no debilidad",
            example: "Alba sintió que iba a explotar. Buscó a su maestra y dijo: 'Necesito ayuda, mi volcán es muy grande'",
            iconName: "person.2.fill"
        ),
        TV3Phrase(
            text: "Voy a mi Jardín Secreto a calmarme.",
            situation: "Cuando necesitas usar el Paraguas Mágico",
            purpose: "Comunicar la necesidad de distancia de forma asertiva",
            example: "Luca le dijo a su mamá: 'Voy a mi habitación, mi Jardín Secreto, a calmarme. Vuelvo pronto'",
            iconName: "leaf.fill"
        ),
        TV3Phrase(
            text: "Cometí un error, pero puedo arreglarlo.",
            situation: "Después de una erupción donde lastimaste a alguien",
            purpose: "Fomentar responsabilidad y esperanza en la reparación",
            example: "Alba gritó cosas feas. Cuando se calmó, pensó: 'Cometí un error, pero puedo arreglarlo' y se disculpó",
            iconName: "arrow.uturn.backward"
        )
    ]
}

