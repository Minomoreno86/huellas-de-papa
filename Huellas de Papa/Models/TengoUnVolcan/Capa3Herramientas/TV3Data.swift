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
            objective: "Reconocer cuándo el volcán es demasiado grande para manejarlo solo y buscar ayuda de un adulto",
            whenToUse: "Cuando el volcán está en Erupción y sientes que no puedes controlarlo, o cuando ya probaste otras herramientas y no funcionaron.",
            howItWorks: "Pedir ayuda no es debilidad, es valentía y sabiduría. Los adultos de confianza son 'fuentes de calma' que pueden ayudarnos cuando nuestro volcán es demasiado grande.",
            steps: [
                "PASO 1: Reconoce que necesitas ayuda. Di para ti: 'Mi volcán es muy grande, necesito ayuda'",
                "PASO 2: Busca a tu adulto de confianza (mamá, papá, maestro/a, abuelo/a) y dile: 'Necesito ayuda, mi volcán está explotando'",
                "PASO 3: Si no puedes hablar porque estás llorando o muy enojado/a, toca su brazo o busca su abrazo",
                "PASO 4: Deja que te ayude: puede respirar contigo, abrazarte, llevarte a un lugar tranquilo, o simplemente estar contigo",
                "PASO 5: Cuando te sientas mejor, agradece su ayuda: 'Gracias por ayudarme con mi volcán'"
            ],
            materials: ["Un adulto de confianza disponible"],
            durationMinutes: "5-20 minutos (según lo que necesites)",
            recommendedPhase: [.erupcion],
            ageRange: "3-12 años",
            fairyTip: "El Hada dice: 'Pedir ayuda es de valientes. Los adultos que te quieren están ahí para ser tu fuente de calma cuando tu volcán es demasiado grande.'",
            iconName: "person.2.fill",
            color: "orange"
        ),
        
        TV3Tool(
            name: "Caza de Nubes",
            category: .cognitive,
            objective: "Identificar y cambiar pensamientos que alimentan el volcán ('nubes de humo') por pensamientos realistas ('aire fresco')",
            whenToUse: "Cuando el volcán ha bajado y puedes pensar con claridad. También de forma preventiva para fortalecer tu pensamiento.",
            howItWorks: "Los pensamientos negativos son como nubes de humo que hacen crecer el fuego. Cazarlos y cambiarlos enfría el volcán antes de que explote.",
            steps: [
                "PASO 1: Caza la nube de humo. Pregúntate: '¿Qué estoy pensando que me hace sentir más rabia?'\n  Ejemplos de nubes: 'Siempre me lo estropea', 'Lo hace a propósito', 'Nunca me sale bien'",
                "PASO 2: Examina la nube. Pregúntate:\n  • '¿Es verdad que SIEMPRE pasa?'\n  • '¿Realmente lo hizo a propósito o fue un accidente?'\n  • '¿NUNCA me sale o solo hoy no salió?'",
                "PASO 3: Cambia la nube de humo por una nube de aire fresco (un pensamiento más realista):\n  • 'Siempre...' → 'Esta vez sí, pero otras no'\n  • 'A propósito' → 'Fue un accidente'\n  • 'Nunca...' → 'Hoy no, pero puedo aprender'",
                "PASO 4: Repite la nube de aire fresco varias veces",
                "PASO 5: Nota cómo tu volcán baja de intensidad con el nuevo pensamiento"
            ],
            materials: ["Papel y lápiz opcional para dibujar las nubes"],
            durationMinutes: "3-10 minutos",
            recommendedPhase: [.chispa, .burbujeo, .postErupcion],
            ageRange: "5-12 años",
            fairyTip: "El Hada dice: 'Tus pensamientos tienen poder. Las nubes oscuras hacen crecer tu volcán; las nubes de aire fresco lo enfrían. Tú eliges qué nubes quieres tener.'",
            iconName: "cloud.fill",
            color: "purple"
        ),
        
        TV3Tool(
            name: "El Botón de la Disculpa",
            category: .repair,
            objective: "Pedir perdón de forma sincera después de una erupción que lastimó a alguien",
            whenToUse: "Después de que el volcán explotó y hiciste o dijiste algo que lastimó a otra persona.",
            howItWorks: "Disculparse repara el daño emocional causado y restaura la relación. Es el primer paso de la reparación.",
            steps: [
                "PASO 1: Espera a que tu volcán esté completamente frío. No te disculpes cuando aún estás enojado/a",
                "PASO 2: Acércate a la persona con calma",
                "PASO 3: Mira a los ojos y di con sinceridad: 'Perdón por [lo que hiciste]. Mi volcán explotó y no estuvo bien'\n  Ejemplos:\n  • 'Perdón por gritarte. Mi volcán explotó y no estuvo bien'\n  • 'Perdón por empujarte. Estaba muy enojado/a pero no debí hacerlo'",
                "PASO 4: No des excusas. No digas 'Pero tú...'. La disculpa es solo sobre lo que tú hiciste",
                "PASO 5: Escucha lo que la otra persona siente. Puede que aún esté dolida"
            ],
            materials: ["Ninguno - solo valentía y honestidad"],
            durationMinutes: "1-3 minutos",
            recommendedPhase: [.postErupcion],
            ageRange: "4-12 años",
            fairyTip: "El Hada dice: 'Disculparse no te hace pequeño/a, te hace grande. Muestra que sabes cuando cometiste un error y quieres arreglarlo.'",
            iconName: "heart.fill",
            color: "red"
        ),
        
        TV3Tool(
            name: "El Botón de la Reparación",
            category: .repair,
            objective: "Realizar una acción concreta para mejorar la situación después de una erupción",
            whenToUse: "Después de disculparte, para demostrar con acciones que quieres reparar el daño.",
            howItWorks: "Las disculpas son palabras; la reparación son acciones. Juntas restauran la confianza y fortalecen la relación.",
            steps: [
                "PASO 1: Después de disculparte, pregunta: '¿Qué puedo hacer para arreglarlo?'",
                "PASO 2: Ofrece acciones concretas según lo que pasó:\n  • Si rompiste algo: ayudar a arreglarlo o reemplazarlo\n  • Si gritaste: dar un abrazo, decir algo bonito\n  • Si empujaste: invitar a jugar tu juego favorito\n  • Si dijiste algo hiriente: escribir una carta amable",
                "PASO 3: Realiza la acción que prometiste, sin peros ni quejas",
                "PASO 4: Pregunta: '¿Estás mejor ahora? ¿Necesitas algo más de mí?'",
                "PASO 5: Aprende de la experiencia para que la próxima vez tu volcán no llegue a explotar así"
            ],
            materials: ["Depende de lo que necesites reparar: papel, colores, abrazo, tiempo juntos, etc."],
            durationMinutes: "5-30 minutos (según la acción)",
            recommendedPhase: [.postErupcion],
            ageRange: "4-12 años",
            fairyTip: "El Hada dice: 'Las palabras sanan, pero las acciones construyen puentes. La reparación muestra que tu perdón es verdadero.'",
            iconName: "hammer.fill",
            color: "orange"
        ),
        
        TV3Tool(
            name: "Regar mi Jardín Interior",
            category: .prevention,
            objective: "Cuidar el bienestar general para que el volcán se encienda menos frecuentemente y con menos intensidad",
            whenToUse: "Todos los días, como práctica preventiva. No esperes a que el volcán se encienda.",
            howItWorks: "Un jardín bien cuidado crece fuerte y sano. Un niño bien cuidado tiene un volcán más tranquilo. El autocuidado reduce la frecuencia e intensidad de las erupciones.",
            steps: [
                "PASO 1: DORMIR BIEN - Asegúrate de dormir las horas que necesitas. Un niño cansado tiene un volcán más sensible",
                "PASO 2: COMER SANO - Come alimentos nutritivos. El hambre es un botón que enciende volcanes",
                "PASO 3: JUGAR Y MOVER EL CUERPO - Corre, salta, juega al aire libre. El movimiento libera la energía acumulada",
                "PASO 4: REÍR Y DISFRUTAR - Busca momentos de alegría cada día. La risa es agua fresca para tu jardín",
                "PASO 5: MOMENTOS DE CALMA - Ten ratos tranquilos, sin pantallas, donde puedas simplemente estar",
                "PASO 6: SENTIRTE QUERIDO/A - Abraza, di 'te quiero', pasa tiempo de calidad con tu familia"
            ],
            materials: ["Rutinas saludables establecidas por la familia"],
            durationMinutes: "Todo el día - es un estilo de vida",
            recommendedPhase: [.chispa, .burbujeo, .erupcion, .postErupcion],
            ageRange: "3-12 años",
            fairyTip: "El Hada dice: 'Cuidar tu jardín interior no es egoísta, es necesario. Cuando tú estás bien, tu volcán está tranquilo y todos están mejor.'",
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

