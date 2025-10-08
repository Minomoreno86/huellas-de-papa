import Foundation

/// Datos consolidados de la Capa 5: Aplicación en Casa
/// Basado en el libro "Tengo un Volcán" de Míriam Tirado y su guía pedagógica
struct TV5Data {
    
    // MARK: - Rutinas Familiares Basadas en el Libro
    static let routines: [TV5Routine] = [
        TV5Routine(
            title: "La Hora del Hada - Práctica de Respiración",
            timeOfDay: .anytime,
            description: "Práctica diaria de la respiración que el Hada enseñó a Alba en el cuento: 'Huele la flor, apaga la vela'. Directamente de la actividad 'Soy el Hada del Volcán' de la guía pedagógica.",
            objective: "Entrenar el Botón de Pausa cuando están tranquilos, para que esté disponible cuando el volcán se encienda.",
            steps: [
                "1. Busca el Hada del Volcán (física o imaginaria) de tu hijo. Si no la tienen, pueden crearla juntos según la guía del libro",
                "2. Siéntense juntos en un lugar cómodo. Puede ser en círculo si es toda la familia",
                "3. Toma el Hada (o imagínala) y di: 'El Hada nos va a enseñar a respirar para calmar nuestros volcanes'",
                "4. INSPIRA: 'Vamos a oler una flor hermosa' - inhala profundo por la nariz (cuenta hasta 4)",
                "5. EXHALA: 'Ahora vamos a apagar una vela de cumpleaños' - sopla despacio por la boca (cuenta hasta 6)",
                "6. Repite 5 veces, todos juntos. Pon tu mano en la barriga de tu hijo para que sienta cómo se llena de aire",
                "7. Cierre: 'Así es como calmamos nuestros volcanes. Cuando sientas calor en tu barriga, usa lo que el Hada te enseñó'"
            ],
            durationMinutes: "5-10 minutos",
            toolsPracticed: ["El Botón de Pausa"],
            preventionFocus: ["Momentos de Calma"],
            tips: [
                "Según la guía: Hazlo EN CALMA primero, muchas veces, antes de esperar que funcione en crisis",
                "Si tu hijo tiene su Hada física (de la actividad del libro), úsenla. Si no, pueden imaginarla",
                "TÚ respira también. Los niños aprenden viéndote. Si tú respiras con calma, ellos copian"
            ],
            iconName: "sparkles"
        ),
        
        TV5Routine(
            title: "Regar el Jardín Interior - Las 6 Básicas Diarias",
            timeOfDay: .anytime,
            description: "Implementación diaria de las 6 necesidades básicas del libro que previenen el 80% de las erupciones volcánicas.",
            objective: "Crear las condiciones óptimas para que el volcán de tu hijo se encienda menos frecuentemente.",
            steps: [
                "1. SUEÑO: Establece hora de dormir consistente. 3-5 años: 10-13h, 6-12 años: 9-12h. Un niño cansado = volcán hipersensible",
                "2. ALIMENTACIÓN: Comidas regulares cada 3-4 horas. Ten colaciones saludables disponibles. Hambre = botón del volcán",
                "3. MOVIMIENTO: Mínimo 1 hora de juego activo al día. Corre, salta, trepa JUNTOS. Energía acumulada = volcán",
                "4. CONEXIÓN: 10-15 minutos diarios de tiempo de calidad 1-a-1. Sin pantallas. Juega lo que ÉL/ELLA elija. Tanque emocional lleno = menos volcanes",
                "5. CALMA: Momentos sin pantallas, sin prisa. Leer juntos, dibujar, simplemente estar. Sistema nervioso regulado = volcán tranquilo",
                "6. CONSISTENCIA: Reglas claras que cumples con amor. Inconsistencia = confusión = volcanes. Predictibilidad = seguridad"
            ],
            durationMinutes: "Todo el día (estilo de vida)",
            toolsPracticed: ["Regar mi Jardín Interior"],
            preventionFocus: ["Sueño", "Alimentación", "Movimiento", "Conexión Emocional", "Momentos de Calma", "Límites Consistentes"],
            tips: [
                "Según el libro: Estas 6 cosas NO son opcionales, son NECESIDADES",
                "El 80% de las erupciones se previenen cumpliendo estas 6 básicas",
                "Si tu hijo tiene volcanes frecuentes, revisa primero estas 6. Probablemente falta una"
            ],
            iconName: "leaf.fill"
        ),
        
        TV5Routine(
            title: "El Espacio del Hada en Casa",
            timeOfDay: .anytime,
            description: "Crear y mantener el espacio donde vive el Hada del Volcán en tu hogar, basado en la actividad 'Soy el Hada del Volcán' de la guía.",
            objective: "Tener un recordatorio visual de las herramientas, accesible para tu hijo cuando lo necesite.",
            steps: [
                "1. CREA EL HADA: Según la guía del libro, cada niño puede colorear y decorar su propia hada. Plastifícala y pégala en un palito",
                "2. DESIGNA SU HOGAR: Puede ser:\n   • Un volcán decorado (caja, recipiente)\n   • La mochila del niño\n   • Su mesita de noche\n   • Un lugar accesible donde pueda tomarla cuando la necesite",
                "3. PRACTICA SU USO: 'Cuando sientas que tu volcán se enciende, toma tu Hada y respira como ella te enseñó'",
                "4. RESPETA EL OBJETO: El Hada es importante. No es un juguete cualquiera. Es su herramienta de regulación",
                "5. RENUÉVALA si es necesario: Si se rompe o se pierde, hagan una nueva juntos"
            ],
            durationMinutes: "30 minutos (creación inicial) + uso diario",
            toolsPracticed: ["El Botón de Pausa"],
            preventionFocus: [],
            tips: [
                "De la guía: El Hada no es mágica por sí misma; es un recordatorio de la herramienta (respiración)",
                "Si es posible, que el niño la lleve a la escuela en su mochila",
                "Pueden crear Hadas para toda la familia. Mamá, papá y hermanos también tienen volcanes"
            ],
            iconName: "sparkles"
        ),
        
        TV5Routine(
            title: "El Mural Familiar del Volcán",
            timeOfDay: .anytime,
            description: "Adaptación para casa de la actividad 'El Mural de Nuestro Volcán' de la guía pedagógica. Un registro visual de los volcanes familiares.",
            objective: "Normalizar que TODOS tenemos volcanes, crear espacio de validación y aprender de las erupciones sin vergüenza.",
            steps: [
                "1. PREPARA EL MURAL: Papel grande en la pared (puede ser la puerta del refrigerador). Título: 'Los Volcanes de Nuestra Familia'",
                "2. CADA VEZ que alguien (niño O adulto) tenga una erupción, dibujen rápidamente qué pasó",
                "3. PEGA el dibujo en el mural con la fecha",
                "4. EN FAMILIA (fin de semana), revisen juntos: '¿Qué botones se presionaron esta semana? ¿Qué herramientas usamos? ¿Qué podemos mejorar?'",
                "5. NO es un 'muro de la vergüenza'. Es un espacio de aprendizaje. Celebra cuando alguien comparta su volcán"
            ],
            durationMinutes: "5 minutos cuando ocurre + 15 min revisión semanal",
            toolsPracticed: ["Identificar Botones", "Reconocer Señales", "Normalizar Emociones"],
            preventionFocus: [],
            tips: [
                "De la guía: No es castigo. Es validación. 'No eres el único que tiene volcanes'",
                "Los ADULTOS también ponen sus volcanes. Modela vulnerabilidad",
                "Usa el mural para enseñar empatía: 'A mamá le pasó lo mismo que a ti'"
            ],
            iconName: "photo.on.rectangle.angled"
        ),
        
        TV5Routine(
            title: "Juego de Hadas y Volcanes Familiar",
            timeOfDay: .anytime,
            description: "El juego de persecución de la guía pedagógica, adaptado para jugar en familia en casa o el parque.",
            objective: "Practicar la transformación de volcán activo a calma, de forma lúdica. Liberar energía física mientras se refuerza la respiración.",
            steps: [
                "1. DIVIDE: Algunos son Volcanes, otros son Hadas (pueden rotar)",
                "2. PERSECUCIÓN: Las Hadas persiguen a los Volcanes. Cuando un Hada atrapa a un Volcán, ese Volcán se transforma en Hada",
                "3. OBJETIVO: Que todos los Volcanes se conviertan en Hadas",
                "4. CIERRE CRUCIAL: Cuando todos sean Hadas, siéntense en el suelo y respiren juntos 'Huele la flor, apaga la vela' (5 veces)",
                "5. REFLEXIÓN: '¿Cómo se siente ser un Volcán activo? ¿Y un Hada en calma? Todos tenemos ambos dentro'"
            ],
            durationMinutes: "20 minutos",
            toolsPracticed: ["El Botón de Pausa", "Transformación Volcán-Calma"],
            preventionFocus: ["Movimiento"],
            tips: [
                "De la guía: La transición de movimiento a calma es CRUCIAL - no la saltes",
                "Si un niño no quiere correr, puede ser Hada desde el inicio",
                "El volcán no es malo, solo necesita transformarse en hada cuando está caliente"
            ],
            iconName: "figure.run"
        ),
        
        TV5Routine(
            title: "Protocolo de Erupción en Casa",
            timeOfDay: .crisis,
            description: "Secuencia clara de pasos cuando el volcán de tu hijo explota, basada en las herramientas del libro.",
            objective: "Tener un plan establecido para manejar erupciones sin improvisación reactiva.",
            steps: [
                "1. TÚ RESPIRA PRIMERO (3 veces profundo). No puedes ser Fuente de Calma si tú estás desbordado/a",
                "2. VALIDA sin ceder: 'Veo que tu volcán explotó. Está bien sentir rabia. Estoy aquí'",
                "3. OFRECE EL PARAGUAS MÁGICO: '¿Quieres ir a tu cuarto/jardín secreto? ¿O quieres que esté contigo?'",
                "4. SI VA SOLO: Respeta su tiempo. No toques la puerta preguntando '¿Ya estás mejor?' Espera a que salga",
                "5. SI QUIERE COMPAÑÍA: Acompaña en silencio. Respira cerca. Ofrece abrazo solo si lo acepta. Di: 'Puedes sentir todo esto. Estoy aquí'",
                "6. CUANDO BAJE LA INTENSIDAD: Reconoce: 'Tu volcán era grande. Lo manejaste' o 'Pediste ayuda, eso fue valiente'",
                "7. DESPUÉS (cuando esté completamente frío): Conversa sobre qué pasó, qué botón se presionó, qué herramientas pueden usar la próxima vez",
                "8. SI LASTIMÓ A ALGUIEN: Guía la reparación (Botón de la Disculpa + Botón de la Reparación)"
            ],
            durationMinutes: "Variable (5-30 minutos según el niño)",
            toolsPracticed: ["La Fuente de la Calma", "El Paraguas Mágico", "El Jardín Secreto", "Reparación"],
            preventionFocus: [],
            tips: [
                "NO enseñes durante la crisis. Primero regula, DESPUÉS enseña",
                "El tiempo de regulación varía. No apresures. Respetar su proceso construye confianza",
                "Si TÚ explotas también, reconócelo después: 'Mi volcán también se encendió. Ambos necesitamos practicar'"
            ],
            iconName: "exclamationmark.triangle.fill"
        )
    ]
    
    // MARK: - Actividades para Casa (Basadas en la Guía del Libro)
    static let activities: [TV5Activity] = [
        TV5Activity(
            title: "¿Dónde está mi volcán? (Actividad del libro)",
            fromBook: true,
            description: "Actividad original de la guía pedagógica, adaptada para hacer en casa. Identificar dónde tu hijo siente físicamente su volcán.",
            objective: "Que tu hijo conecte las sensaciones físicas ('calor en la barriga') con la emoción de la rabia. Primer paso de conciencia corporal.",
            materials: [
                "El cuento 'Tengo un Volcán' de Míriam Tirado",
                "Espacio cómodo para sentarse"
            ],
            instructions: [
                "1. Lee las primeras páginas del cuento donde se describe el volcán (entre el ombligo y las costillas)",
                "2. Pide a tu hijo que ponga sus manos en esa área de su cuerpo",
                "3. Pregunta: '¿Has sentido alguna vez algo aquí? ¿Como un calor? ¿Una sensación rara cuando estás enojado/a?'",
                "4. Comparte TÚ también: 'Yo también tengo un volcán aquí. Cuando me enojo, siento...'",
                "5. Valida: 'Ese es tu volcán. Es normal tenerlo. TODOS lo tenemos, niños y adultos'"
            ],
            frequency: .asNeeded,
            durationMinutes: "10-15 minutos",
            ageRange: "4+ años",
            relatedTool: "Conciencia Corporal (Pilar 2)",
            tips: [
                "De la guía: No presiones si tu hijo no ha sentido esto todavía",
                "Es un proceso de autoconocimiento, no una lección",
                "Valida si lo siente en otro lugar del cuerpo - cada volcán es diferente"
            ],
            iconName: "figure.stand"
        ),
        
        TV5Activity(
            title: "¡Cuando mi volcán se enciende! (Actividad del libro)",
            fromBook: true,
            description: "Teatralización de las manifestaciones físicas de la rabia. Actividad original de la guía pedagógica.",
            objective: "Reconocer y validar las expresiones físicas del volcán (gritar, saltar, llorar) como normales y universales.",
            materials: [
                "El cuento 'Tengo un Volcán'",
                "Espacio amplio (sala, jardín, parque)"
            ],
            instructions: [
                "1. Lee la parte del cuento donde el volcán de Alba echa fuego y ella grita, patalea",
                "2. Di: 'Ahora vamos a actuar cómo se siente cuando nuestro volcán echa fuego. TODOS al mismo tiempo'",
                "3. Deja que tu hijo (y tú también) griten, salten, hagan muecas, se muevan - todo lo que pasa en una erupción",
                "4. Hazlo TÚ también. Modela que es seguro expresar",
                "5. Después, siéntense y pregunta: '¿Te pasa esto a veces en la vida real? ¿Cuándo?'",
                "6. Escucha sin juzgar. Normaliza: 'A todos nos pasa. Yo también siento mi volcán a veces'"
            ],
            frequency: .weekly,
            durationMinutes: "15-20 minutos",
            ageRange: "4+ años",
            relatedTool: "Mapa Físico del Volcán",
            tips: [
                "De la guía: No coartes ninguna acción a menos que sea peligrosa",
                "Después de la actividad física, haz transición a calma con respiración",
                "Están aprendiendo a expresar, NO a reprimir"
            ],
            iconName: "tornado"
        ),
        
        TV5Activity(
            title: "El Check-in del Volcán Diario",
            fromBook: false,
            description: "Conversación diaria breve sobre cómo estuvo el volcán hoy. Basada en la filosofía del libro de validación y normalización.",
            objective: "Crear un espacio seguro donde tu hijo pueda compartir cuándo su volcán se encendió, sin miedo a juicio o castigo.",
            materials: [
                "Ninguno - solo tu atención"
            ],
            instructions: [
                "1. Momento: Después de la escuela o antes de dormir",
                "2. Pregunta casual: '¿Cómo estuvo tu volcán hoy? ¿Se encendió en algún momento?'",
                "3. Si dice que sí: 'Cuéntame. ¿Qué pasó? ¿Qué botón se presionó?'",
                "4. SOLO ESCUCHA. No juzgues ('No debiste enojarte'), no minimices ('No es para tanto'). Solo valida: 'Entiendo. Yo también me enojaría si...'",
                "5. Pregunta: '¿Usaste alguna herramienta? ¿El Hada? ¿Respiración? ¿Pediste ayuda?'",
                "6. Si usó herramientas: CELEBRA. Si no: 'La próxima vez podemos intentar...'",
                "7. Comparte TÚ también: 'Mi volcán también se encendió hoy cuando...' Modela vulnerabilidad"
            ],
            frequency: .daily,
            durationMinutes: "5-10 minutos",
            ageRange: "4+ años",
            relatedTool: "Todos - es revisión diaria",
            tips: [
                "No conviertas esto en interrogatorio. Que sea conversación natural",
                "Si tu hijo no quiere hablar, no fuerces. Di: 'Cuando quieras contarme, estaré aquí'",
                "Tu vulnerabilidad (compartir tus volcanes) invita a la suya"
            ],
            iconName: "bubble.left.and.bubble.right.fill"
        ),
        
        TV5Activity(
            title: "Dibujando Nubes Juntos",
            fromBook: false,
            description: "Práctica de Caza de Nubes de forma visual y lúdica, basada en la herramienta del libro.",
            objective: "Entrenar la reestructuración cognitiva (cambiar nubes de humo por aire fresco) de manera divertida.",
            materials: [
                "Papel",
                "Colores o marcadores",
                "Lápiz negro y colores claros"
            ],
            instructions: [
                "1. Cuando tu hijo exprese una nube de humo ('Siempre me pasa a mí', 'Lo hace a propósito'), di: 'Vamos a dibujar esa nube'",
                "2. Dibuja una nube oscura (con marcador negro). Escribe dentro el pensamiento negativo",
                "3. Pregunta: '¿Es verdad que SIEMPRE? ¿O esta vez sí pero otras no?'",
                "4. Juntos, dibujen una nube clara (con colores suaves). Escriben el pensamiento realista",
                "5. Táchale la nube oscura. Pongan una estrella en la nube clara",
                "6. Pueden hacer un álbum de 'Nubes Cazadas' para ver su progreso"
            ],
            frequency: .twiceWeek,
            durationMinutes: "10 minutos",
            ageRange: "5+ años (lectoescritura ayuda pero no es necesaria - pueden dibujar)",
            relatedTool: "Caza de Nubes",
            tips: [
                "Hazlo lúdico, no sermón",
                "Celebra cada nube cazada: 'Cambiaste una nube oscura por una clara. Tu volcán bajó'",
                "Guarda las nubes claras. Cuando vuelva la oscura, recuérdale: 'Ya cazamos esta nube. Mira, aquí está el aire fresco'"
            ],
            iconName: "cloud.fill"
        ),
        
        TV5Activity(
            title: "Práctica de Reparación",
            fromBook: false,
            description: "Implementar el Botón de la Disculpa y el Botón de la Reparación después de erupciones, según las herramientas del libro.",
            objective: "Enseñar que los errores se pueden reparar, que las relaciones se pueden sanar después de una erupción.",
            materials: [
                "Variables: papel para cartas, materiales para arreglar algo, tiempo juntos"
            ],
            instructions: [
                "1. ESPERA a que ambos (tú y tu hijo) estén completamente calmados. Nunca en caliente",
                "2. CONVERSA en privado: '¿Qué pasó? ¿Cómo crees que se sintió [la persona]?'",
                "3. GUÍA LA DISCULPA: 'Podrías decir: Perdón por [acción]. Sé que te hice sentir [emoción]'. Acompaña si tiene miedo",
                "4. PREGUNTA JUNTOS: '¿Qué podemos hacer para que se sienta mejor?' Deja que proponga primero",
                "5. FACILITA LA REPARACIÓN: Provee materiales, tiempo, transporte si es necesario. Pero NO lo hagas por él/ella",
                "6. CELEBRA: 'Cometiste un error Y lo arreglaste. Eso es valentía y responsabilidad'"
            ],
            frequency: .asNeeded,
            durationMinutes: "10-30 minutos",
            ageRange: "4+ años",
            relatedTool: "El Botón de la Disculpa + El Botón de la Reparación",
            tips: [
                "NUNCA fuerces disculpas. Las disculpas forzadas no enseñan nada",
                "La reparación NO es castigo. Es empoderamiento",
                "Si tu hijo no sabe qué hacer, ofrece opciones: '¿Una carta? ¿Un dibujo? ¿Jugar juntos?'"
            ],
            iconName: "heart.fill"
        )
    ]
    
    // MARK: - Recordatorios de las 6 Básicas (Del libro: Regar mi Jardín Interior)
    static let reminders: [TV5Reminder] = [
        TV5Reminder(
            category: .sleep,
            question: "¿Tu hijo durmió las horas que necesita?",
            why: "El sueño regula el sistema nervioso. Un niño cansado tiene el volcán hipersensible. Según el libro, esta es la base #1 de prevención.",
            howToFix: "Establece rutina de sueño consistente. Hora fija de dormir. 3-5 años: 10-13h, 6-12 años: 9-12h. Apaga pantallas 1h antes.",
            iconName: "moon.stars.fill"
        ),
        TV5Reminder(
            category: .nutrition,
            question: "¿Tu hijo comió en las últimas 3 horas?",
            why: "El hambre es uno de los botones más poderosos del volcán. Según el libro, asegurar alimentación regular previene erupciones.",
            howToFix: "Comidas regulares cada 3-4 horas. Ten colaciones saludables siempre disponibles (fruta, frutos secos). Anticípate al hambre.",
            iconName: "fork.knife"
        ),
        TV5Reminder(
            category: .movement,
            question: "¿Tu hijo ha jugado activamente hoy?",
            why: "La energía física acumulada se convierte en volcán. El movimiento la libera. El libro enfatiza: mínimo 1 hora de juego activo diario.",
            howToFix: "Corre, salta, trepa JUNTOS. Parque, jardín, o sala. Juego físico antes de tareas que requieren quietud (tarea, cena). Libera energía primero.",
            iconName: "figure.run"
        ),
        TV5Reminder(
            category: .connection,
            question: "¿Tuvieron tiempo de conexión 1-a-1 hoy?",
            why: "Un tanque emocional vacío se manifiesta como volcán. Los niños necesitan atención exclusiva diaria. 10-15 minutos de TU atención completa llenan su tanque.",
            howToFix: "10-15 min sin pantallas, sin distracciones. Juega lo que ÉL/ELLA elija. No dirijas, solo acompaña. Contacto visual, escucha activa.",
            iconName: "heart.fill"
        ),
        TV5Reminder(
            category: .calm,
            question: "¿Tu hijo tuvo momentos de calma sin pantallas?",
            why: "El sistema nervioso necesita momentos de 'no hacer nada'. Pantallas constantes = sobreestimulación = volcán. El libro enfatiza: momentos de silencio y calma.",
            howToFix: "Leer juntos, dibujar, mirar por la ventana, simplemente estar. 15-20 min diarios sin estímulos digitales. Antes de dormir es ideal.",
            iconName: "leaf.fill"
        ),
        TV5Reminder(
            category: .consistency,
            question: "¿Fuiste consistente con los límites hoy?",
            why: "La inconsistencia genera confusión = volcanes. Según el libro: los niños necesitan saber qué esperar. Límites claros = seguridad = menos erupciones.",
            howToFix: "Establece 3-5 reglas familiares claras. Escríbelas. Cúmplelas CON AMOR pero sin excepciones. 'Siempre cenamos juntos', 'Pantallas solo después de tarea', etc.",
            iconName: "list.bullet.clipboard.fill"
        )
    ]
}

