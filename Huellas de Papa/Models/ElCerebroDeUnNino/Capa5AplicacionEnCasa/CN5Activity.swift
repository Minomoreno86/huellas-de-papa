import Foundation

/// Representa actividades prácticas para aplicar las estrategias en casa
struct CN5Activity: Codable, Identifiable {
    let id: UUID
    let title: String               // Nombre de la actividad
    let category: String            // Categoría de la actividad
    let description: String         // Descripción breve
    let strategyUsed: Int           // 1-12 estrategia aplicada
    let goal: String                // Objetivo específico
    let ageRange: String            // Edad recomendada
    let duration: String            // Duración estimada
    let frequency: String           // "Diaria", "Semanal", "Cuando sea necesario"
    let steps: [String]             // Pasos para realizar
    let materials: [String]         // Materiales necesarios
    let tips: [String]              // Tips de implementación
    let successIndicators: [String] // Señales de que está funcionando
    let icon: String
    let color: String
    
    init(title: String, category: String, description: String, strategyUsed: Int, goal: String, ageRange: String, duration: String, frequency: String, steps: [String], materials: [String], tips: [String], successIndicators: [String], icon: String, color: String) {
        self.id = UUID()
        self.title = title
        self.category = category
        self.description = description
        self.strategyUsed = strategyUsed
        self.goal = goal
        self.ageRange = ageRange
        self.duration = duration
        self.frequency = frequency
        self.steps = steps
        self.materials = materials
        self.tips = tips
        self.successIndicators = successIndicators
        self.icon = icon
        self.color = color
    }
}

/// Actividades basadas en El Cerebro del Niño
let cn5Activities: [CN5Activity] = [
    CN5Activity(
        title: "Ritual de Conexión Matutina",
        category: "Conexión Diaria",
        description: "Comenzar el día conectando emocionalmente antes de cualquier demanda",
        strategyUsed: 1,
        goal: "Practicar 'Conecta y Redirige' en la rutina más importante del día",
        ageRange: "2-12 años",
        duration: "5-10 minutos",
        frequency: "Diaria (cada mañana)",
        steps: [
            "Cuando tu hijo despierte, NO empieces con demandas (\"Vístete\", \"Apúrate\")",
            "Primero CONECTA: abrazo, \"Buenos días, mi amor\", \"¿Cómo dormiste?\"",
            "Observa su estado: ¿despertó de buen humor? ¿Irritable? ¿Ansioso?",
            "Si está de mal humor, conecta MÁS antes de pedir: \"Veo que amaneciste gruñón. ¿Qué necesitas?\"",
            "Solo DESPUÉS de conectar, redirige a la rutina: \"¿Qué te quieres poner hoy?\"",
            "Si hay resistencia, vuelve a conectar antes de insistir"
        ],
        materials: ["Ninguno - solo tu presencia"],
        tips: [
            "Los primeros 5 minutos del día establecen el tono emocional completo",
            "Si tu hijo despierta mal, NO es personal. Su cerebro necesita tiempo para regularse",
            "Tu calma matutina es contagiosa - regula tu propio estado primero",
            "Considera: ¿cómo te gustaría que te despertaran a TI?"
        ],
        successIndicators: [
            "Menos resistencia en la rutina matutina",
            "Tu hijo busca conexión contigo al despertar",
            "Transiciones más suaves durante la mañana",
            "Mejor humor general al salir de casa"
        ],
        icon: "sunrise.fill",
        color: "orange"
    ),
    
    CN5Activity(
        title: "Diario de Emociones Ilustrado",
        category: "Integración Emocional",
        description: "Crear un diario donde el niño dibuja y nombra sus experiencias emocionales del día",
        strategyUsed: 2,
        goal: "Practicar 'Nombra para Dominar' - integrar hemisferios con narrativa",
        ageRange: "4-12 años",
        duration: "10-15 minutos",
        frequency: "Diaria (antes de dormir) o 3-4 veces por semana",
        steps: [
            "Consigue un cuaderno especial que será 'su diario'",
            "Antes de dormir, invita: \"Vamos a dibujar algo que pasó hoy\"",
            "Pregunta: \"¿Qué quieres dibujar de hoy? ¿Algo bueno? ¿Algo difícil?\"",
            "Mientras dibuja, pregunta: \"Cuéntame qué pasó. ¿Qué pasó primero?\"",
            "Ayuda a NOMBRAR la emoción: \"¿Cómo te sentiste? ¿Triste? ¿Enojado? ¿Feliz?\"",
            "Escriban juntos una o dos oraciones sobre la experiencia",
            "Fecha cada entrada. Con tiempo, pueden releer el diario juntos"
        ],
        materials: [
            "Cuaderno o libreta",
            "Crayones, marcadores o lápices de colores",
            "Stickers (opcional)"
        ],
        tips: [
            "Para niños pequeños (4-6): más dibujo, menos palabras",
            "Para niños mayores (7+): pueden escribir ellos mismos",
            "NO corrijas sus percepciones. Su verdad subjetiva es válida",
            "Incluye emociones positivas y negativas - todas son importantes",
            "Esto NO es diario privado - lo hacen juntos para conexión"
        ],
        successIndicators: [
            "Tu hijo empieza a nombrar emociones espontáneamente durante el día",
            "Puede contar experiencias con más detalles y coherencia",
            "Menos rabietas inexplicables (ahora puede expresar con palabras)",
            "Mayor autoconocimiento emocional"
        ],
        icon: "book.closed.fill",
        color: "blue"
    ),
    
    CN5Activity(
        title: "Menú de Opciones en Rutinas",
        category: "Autonomía Guiada",
        description: "Transformar momentos de conflicto en oportunidades de decisión",
        strategyUsed: 3,
        goal: "Practicar 'Involucra, No Enfurezcas' en rutinas diarias",
        ageRange: "2-10 años",
        duration: "Integrado en rutina (sin tiempo extra)",
        frequency: "Diaria (en cada transición o rutina)",
        steps: [
            "Identifica 5 momentos diarios donde normalmente das órdenes",
            "Transforma cada orden en 2-3 opciones TODAS aceptables para ti",
            "Vestirse: \"¿Primero pantalón o camisa?\" en vez de \"Vístete ya\"",
            "Comida: \"¿Manzana o plátano?\" en vez de \"Come fruta\"",
            "Baño: \"¿Te bañas antes o después de cenar?\" en vez de \"A bañarte\"",
            "Tarea: \"¿Empezamos con mate o con lectura?\" en vez de \"Haz la tarea\"",
            "Dormir: \"¿2 cuentos o 3 canciones?\" en vez de \"A dormir\""
        ],
        materials: ["Ninguno - solo cambio de lenguaje"],
        tips: [
            "Las opciones deben ser REALES. No preguntes si no es negociable",
            "2-3 opciones máximo (más opciones abruma)",
            "Si elige algo fuera de opciones: \"Esas no son las opciones. Es A o B\"",
            "Esto NO es permisividad - los límites siguen, pero con autonomía",
            "Nota cómo disminuye la resistencia cuando hay opciones"
        ],
        successIndicators: [
            "Menos conflictos en rutinas básicas",
            "Tu hijo coopera más fácilmente",
            "Dice \"Yo elijo\" - sentido de autonomía",
            "Rutinas más fluidas y rápidas"
        ],
        icon: "checklist",
        color: "purple"
    ),
    
    CN5Activity(
        title: "Caja de Herramientas de Regulación",
        category: "Autorregulación",
        description: "Crear una caja física con herramientas que el niño puede usar cuando está desregulado",
        strategyUsed: 5,
        goal: "Enseñar 'Muévelo o Piérdelo' y otras estrategias de regulación",
        ageRange: "3-10 años",
        duration: "30 minutos para crear, usar cuando sea necesario",
        frequency: "Crear una vez, usar diariamente según necesidad",
        steps: [
            "Consigue una caja o canasta especial",
            "Juntos, llenen la caja con 'herramientas de calma':",
            "- Pelota antiestrés para apretar",
            "- Botella de calma (agua + glitter + glicerina)",
            "- Tarjetas con respiraciones (dibujadas juntos)",
            "- Música calmante en lista de reproducción",
            "- Imágenes de lugar favorito o personas queridas",
            "- Papel y crayones para dibujar emociones",
            "Decora la caja juntos. Es SU caja especial",
            "Enséñale: \"Cuando sientes emociones grandes, puedes usar tu caja\"",
            "Modela TÚ usando la caja cuando estés frustrado"
        ],
        materials: [
            "Caja o canasta",
            "Pelota antiestrés",
            "Botella transparente, agua, glitter, glicerina",
            "Tarjetas, marcadores",
            "Fotos o imágenes"
        ],
        tips: [
            "La caja NO es castigo ('Ve a usar tu caja'). Es herramienta de empoderamiento",
            "Actualiza contenido según sus necesidades",
            "Para niños con TDAH: incluye más opciones de movimiento",
            "Algunos niños prefieren rincón de calma en vez de caja móvil"
        ],
        successIndicators: [
            "Tu hijo usa la caja espontáneamente cuando está desregulado",
            "Dice \"Necesito mi caja\" en vez de solo tener berrinche",
            "Las emociones intensas duran menos tiempo",
            "Desarrolla autonomía en regulación"
        ],
        icon: "shippingbox.fill",
        color: "teal"
    ),
    
    CN5Activity(
        title: "Álbum de Logros y Desafíos",
        category: "Memoria Autobiográfica",
        description: "Documentar logros Y desafíos superados para construir narrativa de crecimiento",
        strategyUsed: 7,
        goal: "Practicar 'Recuerda Recordar' - fortalecer memoria e identidad",
        ageRange: "4-12 años",
        duration: "20-30 minutos",
        frequency: "Semanal o mensual",
        steps: [
            "Consigue un álbum de fotos o cuaderno grande",
            "Cada semana/mes, documenta: 1 logro Y 1 desafío superado",
            "LOGRO: '¿Qué lograste esta semana de lo que estás orgulloso?' Foto o dibujo",
            "DESAFÍO: '¿Qué fue difícil esta semana? ¿Cómo lo superaste?' Foto o dibujo",
            "Escriban juntos la historia completa de cada uno",
            "Incluye EMOCIONES: '¿Cómo te sentiste antes? ¿Y después?'",
            "Revisen álbum regularmente: 'Mira todo lo que has superado. ¿Recuerdas esto?'",
            "Señala crecimiento: 'Hace 3 meses esto era difícil. Ahora lo haces fácil.'"
        ],
        materials: [
            "Álbum de fotos o cuaderno",
            "Fotos o materiales para dibujar",
            "Pegamento, marcadores"
        ],
        tips: [
            "Balance entre logros y desafíos - ambos construyen identidad",
            "Los desafíos SUPERADOS son tan importantes como los logros",
            "Esto construye 'narrativa de resiliencia': soy alguien que enfrenta dificultades",
            "Revisar el álbum en momentos difíciles: 'Mira todo lo que has superado'"
        ],
        successIndicators: [
            "Tu hijo habla de sí mismo en términos de crecimiento ('Antes no podía, ahora sí')",
            "Mayor resiliencia ante nuevos desafíos",
            "Sentido de identidad más fuerte",
            "Más confianza en su capacidad de superar dificultades"
        ],
        icon: "photo.stack.fill",
        color: "mint"
    ),
    
    CN5Activity(
        title: "Práctica de SIFT Familiar",
        category: "Mindfulness",
        description: "Rutina diaria de chequeo interno usando SIFT en familia",
        strategyUsed: 9,
        goal: "Desarrollar autoconocimiento y mindfulness como hábito familiar",
        ageRange: "5-12 años",
        duration: "5-10 minutos",
        frequency: "Diaria (hora de cenar o antes de dormir)",
        steps: [
            "Durante la cena o antes de dormir, cada miembro de la familia comparte su SIFT del día",
            "Papá/Mamá empieza modelando: 'Hoy mi SIFT fue...'",
            "S - Sensaciones: '¿Qué sentí en mi cuerpo hoy?' (Ejemplo: tensión en hombros)",
            "I - Imágenes: '¿Qué imágenes o recuerdos tuve?' (Ejemplo: reunión estresante)",
            "F - Sentimientos: '¿Qué emociones?' (Ejemplo: ansiedad, luego alivio)",
            "T - Pensamientos: '¿Qué me decía mi mente?' (Ejemplo: 'Tengo mucho que hacer')",
            "Luego cada hijo comparte su SIFT a su nivel",
            "ESCUCHA sin juzgar. Solo observen juntos el mundo interior de cada uno"
        ],
        materials: ["Ninguno"],
        tips: [
            "NO todos tienen acceso a todas las áreas. Está bien decir 'No sé'",
            "Niños pequeños pueden necesitar ayuda: '¿Tu panza se sintió rara? ¿Tu corazón?'",
            "Esto NO es interrogatorio. Es exploración curiosa y amorosa",
            "TÚ modela primero - muestra vulnerabilidad con tus propias emociones",
            "Con práctica, SIFT se vuelve automático para autorregulación"
        ],
        successIndicators: [
            "Tu hijo habla espontáneamente sobre sus sensaciones corporales y emociones",
            "Puede identificar emociones con más precisión",
            "Pide hacer SIFT cuando está confundido o abrumado",
            "Toda la familia desarrolla mayor autoconocimiento"
        ],
        icon: "eye.fill",
        color: "purple"
    ),
    
    CN5Activity(
        title: "Baile de Regulación Familiar",
        category: "Regulación Activa",
        description: "Usar movimiento y música como herramienta familiar de cambio de estado",
        strategyUsed: 5,
        goal: "Hacer del movimiento una herramienta automática de regulación",
        ageRange: "2-12 años",
        duration: "5-15 minutos",
        frequency: "Diaria (preventiva) o cuando alguien está desregulado",
        steps: [
            "Crea una playlist familiar de 'canciones de regulación' (alegres, energéticas)",
            "PREVENTIVO: Bailen 10 minutos cada día (después de escuela/trabajo)",
            "REACTIVO: Cuando alguien está atascado emocionalmente: 'Dance party!'",
            "Todos participan - es actividad FAMILIAR",
            "Baila ridículamente - el objetivo es risas y movimiento",
            "Después de 5-10 minutos, nota el cambio: '¿Cómo se siente tu cuerpo ahora?'",
            "Enseña: 'Cuando estamos atascados, mover el cuerpo ayuda a la mente'"
        ],
        materials: [
            "Música (playlist en teléfono/tablet)",
            "Espacio para moverse"
        ],
        tips: [
            "Esto NO es ejercicio disciplinado. Es JUEGO con movimiento",
            "Participa con energía - tu entusiasmo es contagioso",
            "Para niños tímidos: empieza con movimientos pequeños",
            "Variaciones: saltar, yoga, caminar rápido, jugar a la pelota",
            "El movimiento es una de las formas MÁS RÁPIDAS de cambiar química cerebral"
        ],
        successIndicators: [
            "Tu hijo pide bailar cuando está frustrado o ansioso",
            "Toda la familia está más regulada emocionalmente",
            "Menos berrinches o más cortos en duración",
            "El movimiento se vuelve herramienta automática de regulación"
        ],
        icon: "figure.dance",
        color: "pink"
    ),
    
    CN5Activity(
        title: "Reparación Nocturna",
        category: "Reparación Relacional",
        description: "Ritual antes de dormir para reparar rupturas del día",
        strategyUsed: 12,
        goal: "Practicar 'Conéctate a Través del Conflicto' - nunca dormir con ruptura sin reparar",
        ageRange: "3-12 años",
        duration: "5-10 minutos",
        frequency: "Diaria (parte de rutina de dormir)",
        steps: [
            "Antes de dormir, pregunta: '¿Tuvimos algún momento difícil hoy?'",
            "Si hubo conflicto, RECONOCE tu parte: 'Yo levanté la voz y eso no estuvo bien'",
            "Invita a compartir: '¿Cómo te sentiste cuando...?'",
            "Valida: 'Tiene sentido que te sintieras [emoción]'",
            "Pregunta: '¿Qué puedo hacer diferente la próxima vez?'",
            "REPARA físicamente: abrazo, contacto visual, 'Te amo pase lo que pase'",
            "Cierra con algo positivo: '¿Qué fue lo mejor de hoy?'",
            "Si no hubo conflicto: solo '¿Qué fue lo mejor y lo más difícil de hoy?'"
        ],
        materials: ["Ninguno"],
        tips: [
            "NUNCA dejes que el día termine con ruptura sin reparar",
            "La reparación debe ser GENUINA, no ritual vacío",
            "Si tu hijo no quiere hablar, respeta: 'Ok, estoy aquí cuando quieras'",
            "Modela vulnerabilidad - admite tus errores sinceramente",
            "Esto enseña: los errores no rompen el amor"
        ],
        successIndicators: [
            "Tu hijo viene a reparar contigo espontáneamente después de conflictos",
            "Duerme mejor (no con tensión acumulada)",
            "Mayor seguridad de apego",
            "Aprende a reparar relaciones con hermanos/amigos también"
        ],
        icon: "moon.stars.fill",
        color: "indigo"
    ),
    
    CN5Activity(
        title: "Juego de Perspectivas",
        category: "Desarrollo de Empatía",
        description: "Practicar ver el mundo desde la perspectiva de otros en situaciones cotidianas",
        strategyUsed: 10,
        goal: "Ejercitar 'Visión de la Mente' - desarrollar empatía y teoría de la mente",
        ageRange: "4-12 años",
        duration: "5-10 minutos",
        frequency: "Diaria (durante comidas o antes de dormir)",
        steps: [
            "Durante la comida o tiempo juntos, haz preguntas de perspectiva",
            "Sobre el día: '¿Cómo crees que se sintió tu maestra hoy?'",
            "Sobre hermanos: '¿Por qué crees que tu hermano lloró esta mañana?'",
            "Sobre ti: '¿Cómo crees que ME sentí yo cuando...?'",
            "Leyendo libros: '¿Qué crees que está pensando este personaje?'",
            "Viendo películas: PAUSA y pregunta: '¿Cómo se siente? ¿Por qué?'",
            "Después de conflictos: '¿Cómo crees que se sintió [el otro]? Mira su cara.'",
            "Escucha sus respuestas sin corregir. Es su percepción."
        ],
        materials: [
            "Libros con personajes",
            "Situaciones cotidianas",
            "Películas/series apropiadas para edad"
        ],
        tips: [
            "Niños 4-6 años: aún están desarrollando teoría de la mente. Paciencia.",
            "Si dice 'No sé': 'Mira su cara. ¿Qué emoción ves? ¿Feliz? ¿Triste?'",
            "NO sermones. Preguntas genuinas y curiosas",
            "También pregunta sobre emociones positivas, no solo conflictos",
            "Cada pregunta de perspectiva ejercita neuronas espejo"
        ],
        successIndicators: [
            "Tu hijo empieza a considerar sentimientos de otros espontáneamente",
            "Dice cosas como '¿Crees que ella está triste?' sin que preguntes",
            "Menos conflictos porque considera al otro antes de actuar",
            "Desarrolla empatía genuina y profunda"
        ],
        icon: "person.2.fill",
        color: "green"
    ),
    
    CN5Activity(
        title: "Noche de Diversión Sagrada",
        category: "Conexión Familiar",
        description: "Tiempo semanal NO NEGOCIABLE de pura diversión y conexión familiar",
        strategyUsed: 11,
        goal: "Incrementar Factor Diversión - fortalecer vínculos y crear memorias positivas",
        ageRange: "0-18 años",
        duration: "60-120 minutos",
        frequency: "Semanal (mismo día y hora cada semana)",
        steps: [
            "CALENDARIO: elige un día/hora fijo cada semana. Márcalo en calendario familiar",
            "Hagan lista familiar de actividades que TODOS disfrutan",
            "Cada semana, roten quién elige (incluye a los niños)",
            "Ideas: juegos de mesa, cocinar pizza juntos, karaoke, manualidades, caminata, baile",
            "Durante este tiempo: CERO pantallas individuales, CERO tareas, CERO conversaciones serias",
            "Si surge conflicto, pausa y reconecta: el objetivo es DIVERSIÓN",
            "Toma fotos - agrégalas al álbum de memorias familiares",
            "Al final: '¿Qué fue lo más divertido?' - cierra con reflexión positiva"
        ],
        materials: [
            "Depende de actividad elegida",
            "Comida/snacks",
            "Actitud de presencia total"
        ],
        tips: [
            "Esto es TAN IMPORTANTE como comida o sueño para desarrollo cerebral",
            "Si surge 'no hay tiempo': pregúntate qué estás priorizando sobre vínculo familiar",
            "La diversión NO requiere dinero. A veces lo mejor es gratis",
            "TU presencia presente (sin teléfono) es el regalo más valioso",
            "Risas compartidas liberan oxitocina - cablea el cerebro para conexión"
        ],
        successIndicators: [
            "Todos esperan este tiempo con emoción",
            "Mayor cooperación familiar durante la semana",
            "Más risas en casa en general",
            "Vínculos más fuertes entre todos los miembros",
            "Los niños tienen memorias positivas específicas de familia"
        ],
        icon: "house.and.flag.fill",
        color: "yellow"
    )
]

