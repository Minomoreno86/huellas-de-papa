import Foundation

/// Datos de las 20 ideas clave del libro The Yes Brain enfocadas en la crianza práctica
struct Capa2IdeasClaveData {
    
    static let ideasClave: [Capa2IdeaClave] = [
        // 1. LA VENTANA DE TOLERANCIA
        Capa2IdeaClave(
            titulo: "La Ventana de Tolerancia",
            subtitulo: "Regulación emocional en tiempo real",
            ideaCentral: "Cada persona tiene una ventana óptima de activación donde puede procesar información, tomar decisiones y relacionarse de manera efectiva. Fuera de esta ventana, el cerebro entra en estados de hiperactivación (lucha/huida) o hipoactivación (congelación).",
            consejosAplicacion: "Observa las señales tempranas de desregulación en tu hijo: cambios en la respiración, tensión muscular, evitación del contacto visual. Interviene ANTES de que se desborde, no después. Usa técnicas de co-regulación: respiración sincronizada, contacto físico suave, tono de voz calmado. Recuerda: tu calma regula su sistema nervioso.",
            ejemplosPracticos: [
                "Tu hijo de 3 años empieza a tensar los puños y respirar más rápido cuando le dices que es hora de bañarse",
                "Tu hija de 5 años se pone rígida y evita mirarte cuando le pides que guarde sus juguetes",
                "Tu hijo de 7 años empieza a hablar más rápido y moverse nerviosamente cuando le preguntas sobre la escuela"
            ],
            estrategiasPracticas: [
                "Respiración en 4 tiempos: inhalar 4, mantener 4, exhalar 4, pausa 4",
                "Técnica del abrazo de oso: abrazo firme pero suave durante 20 segundos",
                "Naming: 'Veo que estás sintiendo...' para activar la corteza prefrontal",
                "Técnica del iceberg: identificar la emoción visible y la necesidad oculta"
            ],
            fraseInspiradora: "La regulación emocional no se enseña, se co-regula",
            autor: "Daniel J. Siegel",
            nivelDificultad: 3,
            categoria: "Regulación",
            icono: "window.shade.open",
            color: "blue"
        ),
        
        // 2. NEUROPLASTICIDAD DIRIGIDA
        Capa2IdeaClave(
            titulo: "Neuroplasticidad Dirigida",
            subtitulo: "Cómo las experiencias moldean el cerebro en desarrollo",
            ideaCentral: "El cerebro de los niños es especialmente plástico y se desarrolla a través de las experiencias que viven. Cada interacción, cada momento de conexión, cada experiencia de regulación emocional fortalece las conexiones neuronales que forman la base del bienestar futuro.",
            consejosAplicacion: "Cada momento de conexión con tu hijo es una oportunidad de moldear su cerebro hacia el bienestar. Las experiencias repetidas de regulación emocional, conexión y seguridad crean patrones neuronales que duran toda la vida. Tu presencia calmada y consistente es el mejor regalo que puedes darle.",
            ejemplosPracticos: [
                "Cuando tu hijo llora y tú lo abrazas calmadamente, estás fortaleciendo sus circuitos de regulación emocional",
                "Cada vez que validas las emociones de tu hijo, estás construyendo su capacidad de autoconciencia",
                "Los momentos de juego y risa juntos crean conexiones neuronales que promueven la resiliencia"
            ],
            estrategiasPracticas: [
                "Dedica 10 minutos diarios de tiempo de calidad sin distracciones",
                "Practica la co-regulación: cuando tu hijo se desregula, mantén la calma y ayúdalo a volver al equilibrio",
                "Crea rituales de conexión: abrazos matutinos, cuentos antes de dormir, conversaciones durante la cena",
                "Celebra los pequeños logros y esfuerzos de tu hijo"
            ],
            fraseInspiradora: "Las experiencias que tienes con tu hijo literalmente moldean su cerebro",
            autor: "Daniel J. Siegel",
            nivelDificultad: 2,
            categoria: "Desarrollo",
            icono: "brain.head.profile",
            color: "green"
        ),
        
        // 3. INTEGRACIÓN CEREBRAL
        Capa2IdeaClave(
            titulo: "Integración Cerebral",
            subtitulo: "Conectando las diferentes partes del cerebro",
            ideaCentral: "El cerebro funciona mejor cuando sus diferentes partes trabajan juntas de manera coordinada. La integración cerebral permite que el niño tenga acceso a sus emociones, pensamientos y comportamientos de manera equilibrada y flexible.",
            consejosAplicacion: "Ayuda a tu hijo a conectar sus diferentes experiencias y emociones. Cuando está desregulado, ayúdalo a nombrar lo que siente y a entender por qué. Esto fortalece las conexiones entre las diferentes partes de su cerebro y promueve la integración.",
            ejemplosPracticos: [
                "Tu hijo está enojado porque no puede tener un juguete. En lugar de decir 'no llores', ayúdalo a nombrar su emoción: 'Veo que estás muy enojado porque no puedes tener ese juguete'",
                "Cuando tu hija tiene miedo de la oscuridad, ayúdala a conectar su emoción con una explicación: 'Es normal tener miedo de la oscuridad, pero estás segura aquí conmigo'",
                "Si tu hijo está triste por algo que pasó en la escuela, ayúdalo a conectar sus sentimientos con sus pensamientos: 'Parece que te sientes triste porque tu amigo no quiso jugar contigo'"
            ],
            estrategiasPracticas: [
                "Practica el 'naming' de emociones: 'Veo que estás sintiendo...'",
                "Ayuda a tu hijo a conectar sus emociones con sus necesidades: 'Cuando sientes enojo, es porque necesitas...'",
                "Usa historias y metáforas para explicar cómo funciona el cerebro",
                "Practica la respiración consciente juntos para conectar mente y cuerpo"
            ],
            fraseInspiradora: "Un cerebro integrado es un cerebro resiliente",
            autor: "Daniel J. Siegel",
            nivelDificultad: 4,
            categoria: "Integración",
            icono: "link",
            color: "purple"
        ),
        
        // 4. RESILIENCIA EMOCIONAL
        Capa2IdeaClave(
            titulo: "Resiliencia Emocional",
            subtitulo: "La capacidad de recuperarse y crecer ante las dificultades",
            ideaCentral: "La resiliencia no es la ausencia de dificultades, sino la capacidad de navegar a través de ellas y crecer como resultado. Los niños resilientes pueden enfrentar desafíos, aprender de los errores y mantener una perspectiva positiva ante la adversidad.",
            consejosAplicacion: "En lugar de proteger a tu hijo de todas las dificultades, ayúdalo a desarrollar las habilidades para enfrentarlas. Valida sus emociones, pero también enséñale que puede superar los desafíos. Los errores son oportunidades de aprendizaje, no fracasos.",
            ejemplosPracticos: [
                "Tu hijo no logra armar un rompecabezas y se frustra. En lugar de hacerlo por él, ayúdalo a respirar y a intentar de nuevo",
                "Tu hija se cae y se lastima la rodilla. Valida su dolor, pero también enséñale que puede levantarse y continuar",
                "Si tu hijo no logra hacer la tarea, ayúdalo a dividirla en pasos más pequeños y a celebrar cada pequeño progreso"
            ],
            estrategiasPracticas: [
                "Enseña a tu hijo a dividir los problemas grandes en pasos más pequeños",
                "Practica la respiración y la relajación cuando se sienta abrumado",
                "Celebra los esfuerzos, no solo los resultados",
                "Enséñale que los errores son parte del aprendizaje"
            ],
            fraseInspiradora: "La resiliencia se construye a través de la experiencia, no de la protección",
            autor: "Tina Payne Bryson",
            nivelDificultad: 3,
            categoria: "Resiliencia",
            icono: "arrow.clockwise.circle",
            color: "orange"
        ),
        
        // 5. EMPATÍA Y CONEXIÓN
        Capa2IdeaClave(
            titulo: "Empatía y Conexión",
            subtitulo: "La base de las relaciones saludables",
            ideaCentral: "La empatía es la capacidad de entender y compartir los sentimientos de otra persona. Es la base de las relaciones saludables y la conexión humana. Los niños empáticos pueden relacionarse mejor con otros y construir relaciones más significativas.",
            consejosAplicacion: "Modela la empatía en tus propias interacciones. Cuando tu hijo está triste, enojado o frustrado, demuéstrale que entiendes sus sentimientos. Enséñale a reconocer las emociones en otros y a responder con compasión y comprensión.",
            ejemplosPracticos: [
                "Tu hijo ve a otro niño llorando en el parque. Ayúdalo a reconocer que el otro niño está triste y a pensar en cómo puede ayudarlo",
                "Si tu hija está enojada con su hermano, ayúdala a entender que él también puede tener sentimientos y necesidades",
                "Cuando tu hijo está triste, demuéstrale que entiendes sus sentimientos: 'Veo que estás muy triste, y es normal sentirse así'"
            ],
            estrategiasPracticas: [
                "Practica el 'naming' de emociones en otros: 'Parece que tu amigo está triste'",
                "Enséñale a tu hijo a preguntar cómo se sienten los demás",
                "Modela la empatía en tus propias interacciones",
                "Usa cuentos y películas para hablar sobre las emociones de los personajes"
            ],
            fraseInspiradora: "La empatía es el puente que conecta los corazones",
            autor: "Daniel J. Siegel",
            nivelDificultad: 2,
            categoria: "Conexión",
            icono: "heart.circle",
            color: "pink"
        ),
        
        // 6. AUTOCONCIENCIA EMOCIONAL
        Capa2IdeaClave(
            titulo: "Autoconciencia Emocional",
            subtitulo: "Conocer y entender nuestras propias emociones",
            ideaCentral: "La autoconciencia emocional es la capacidad de reconocer, entender y nombrar nuestras propias emociones. Es el primer paso hacia la regulación emocional y la construcción de relaciones saludables. Los niños que son conscientes de sus emociones pueden manejarlas mejor.",
            consejosAplicacion: "Ayuda a tu hijo a desarrollar un vocabulario emocional rico. Enséñale a nombrar sus emociones y a entender qué las causa. Esto le dará las herramientas para manejar sus sentimientos de manera más efectiva.",
            ejemplosPracticos: [
                "Tu hijo está enojado porque no puede tener un juguete. Ayúdalo a nombrar su emoción: 'Veo que estás muy enojado porque no puedes tener ese juguete'",
                "Si tu hija está triste porque su amiga no quiso jugar con ella, ayúdala a entender que es normal sentirse triste cuando nos rechazan",
                "Cuando tu hijo está ansioso antes de un examen, ayúdalo a reconocer que la ansiedad es una emoción normal ante los desafíos"
            ],
            estrategiasPracticas: [
                "Usa un 'termómetro de emociones' para ayudar a tu hijo a identificar la intensidad de sus sentimientos",
                "Practica el 'naming' de emociones diariamente",
                "Enséñale a tu hijo a reconocer las señales físicas de sus emociones",
                "Crea un 'diario de emociones' donde pueda escribir sobre sus sentimientos"
            ],
            fraseInspiradora: "Conocer nuestras emociones es el primer paso hacia la sabiduría emocional",
            autor: "Daniel J. Siegel",
            nivelDificultad: 3,
            categoria: "Autoconciencia",
            icono: "eye.circle",
            color: "cyan"
        ),
        
        // 7. REGULACIÓN EMOCIONAL
        Capa2IdeaClave(
            titulo: "Regulación Emocional",
            subtitulo: "La capacidad de manejar nuestras emociones de manera saludable",
            ideaCentral: "La regulación emocional es la capacidad de manejar nuestras emociones de manera que nos permitan funcionar efectivamente en el mundo. No se trata de suprimir las emociones, sino de aprender a expresarlas de manera constructiva.",
            consejosAplicacion: "Enseña a tu hijo que todas las emociones son válidas, pero que algunas formas de expresarlas son más constructivas que otras. Ayúdalo a desarrollar estrategias para calmarse cuando está desregulado y a expresar sus emociones de manera saludable.",
            ejemplosPracticos: [
                "Tu hijo está enojado y quiere golpear. Enséñale a usar sus palabras en lugar de sus puños: 'Está bien estar enojado, pero no está bien golpear'",
                "Si tu hija está triste y quiere aislarse, ayúdala a encontrar formas constructivas de expresar su tristeza",
                "Cuando tu hijo está ansioso, enséñale técnicas de respiración para calmarse"
            ],
            estrategiasPracticas: [
                "Practica la respiración profunda cuando tu hijo esté desregulado",
                "Enséñale a tu hijo a usar sus palabras para expresar sus emociones",
                "Crea un 'rincón de calma' donde pueda ir cuando necesite regularse",
                "Modela la regulación emocional en tus propias interacciones"
            ],
            fraseInspiradora: "Las emociones son información, no son el problema",
            autor: "Tina Payne Bryson",
            nivelDificultad: 4,
            categoria: "Regulación",
            icono: "scalemass",
            color: "mint"
        ),
        
        // 8. CONEXIÓN SEGURA
        Capa2IdeaClave(
            titulo: "Conexión Segura",
            subtitulo: "La base de la confianza y el bienestar",
            ideaCentral: "Una conexión segura es la base de todas las relaciones saludables. Los niños que tienen conexiones seguras con sus cuidadores desarrollan una sensación de confianza en el mundo y en sí mismos. Esta confianza les permite explorar, aprender y crecer.",
            consejosAplicacion: "Construye una conexión segura con tu hijo siendo consistente, predecible y emocionalmente disponible. Responde a sus necesidades de manera sensible y apropiada. Esto le dará la base de confianza que necesita para desarrollarse plenamente.",
            ejemplosPracticos: [
                "Tu hijo llora cuando se despierta en la noche. Ve a consolarlo y abrázalo hasta que se calme",
                "Si tu hija está asustada por una pesadilla, tómate el tiempo para escucharla y consolarla",
                "Cuando tu hijo está triste porque su amigo se mudó, valida sus sentimientos y ayúdalo a procesar su pérdida"
            ],
            estrategiasPracticas: [
                "Responde consistentemente a las necesidades de tu hijo",
                "Practica la escucha activa cuando tu hijo te habla",
                "Crea rituales de conexión diarios",
                "Sé emocionalmente disponible para tu hijo"
            ],
            fraseInspiradora: "La conexión segura es el regalo más preciado que puedes dar a tu hijo",
            autor: "Daniel J. Siegel",
            nivelDificultad: 2,
            categoria: "Conexión",
            icono: "heart.fill",
            color: "red"
        ),
        
        // 9. MINDFULNESS INFANTIL
        Capa2IdeaClave(
            titulo: "Mindfulness Infantil",
            subtitulo: "Enseñar a los niños a estar presentes",
            ideaCentral: "El mindfulness es la práctica de estar presente en el momento actual, sin juzgar. Los niños que practican mindfulness desarrollan mejor atención, regulación emocional y bienestar general. Es una herramienta poderosa para la vida.",
            consejosAplicacion: "Introduce el mindfulness de manera natural y divertida. Usa ejercicios simples y apropiados para la edad. El objetivo no es que tu hijo se convierta en un meditador, sino que desarrolle la capacidad de estar presente y consciente.",
            ejemplosPracticos: [
                "Practica la 'respiración de la abeja' con tu hijo: inhala por la nariz y exhala haciendo el sonido de una abeja",
                "Haz un 'paseo de atención plena' donde observes juntos los sonidos, olores y texturas del entorno",
                "Practica la 'meditación de la comida' donde coman lentamente y presten atención a los sabores y texturas"
            ],
            estrategiasPracticas: [
                "Practica la respiración consciente juntos",
                "Haz ejercicios de atención plena durante las actividades cotidianas",
                "Usa cuentos y juegos para introducir conceptos de mindfulness",
                "Modela el mindfulness en tu propia vida"
            ],
            fraseInspiradora: "El presente es el único momento que tenemos",
            autor: "Daniel J. Siegel",
            nivelDificultad: 3,
            categoria: "Mindfulness",
            icono: "leaf",
            color: "green"
        ),
        
        // 10. COMUNICACIÓN EFECTIVA
        Capa2IdeaClave(
            titulo: "Comunicación Efectiva",
            subtitulo: "La base de las relaciones saludables",
            ideaCentral: "La comunicación efectiva es la base de todas las relaciones saludables. Los niños que aprenden a comunicarse de manera clara y respetuosa pueden expresar sus necesidades, resolver conflictos y construir relaciones más significativas.",
            consejosAplicacion: "Modela la comunicación efectiva en tus propias interacciones. Enséñale a tu hijo a expresar sus necesidades de manera clara y respetuosa. Practica la escucha activa y el respeto mutuo en vuestras conversaciones.",
            ejemplosPracticos: [
                "En lugar de decir 'no llores', di 'veo que estás triste, ¿puedes contarme qué te pasa?'",
                "Si tu hijo está enojado, ayúdalo a expresar su enojo de manera constructiva: 'Está bien estar enojado, pero necesito que me hables con respeto'",
                "Cuando tu hija tiene un problema, ayúdala a encontrar palabras para describir lo que siente"
            ],
            estrategiasPracticas: [
                "Practica la escucha activa cuando tu hijo te habla",
                "Enséñale a tu hijo a usar 'mensajes yo' en lugar de 'mensajes tú'",
                "Crea un ambiente donde tu hijo se sienta seguro para expresar sus sentimientos",
                "Modela la comunicación respetuosa en tus propias interacciones"
            ],
            fraseInspiradora: "La comunicación efectiva es la base de la conexión humana",
            autor: "Tina Payne Bryson",
            nivelDificultad: 3,
            categoria: "Comunicación",
            icono: "bubble.left.and.bubble.right",
            color: "blue"
        ),
        
        // 11. LÍMITES SANOS
        Capa2IdeaClave(
            titulo: "Límites Sanos",
            subtitulo: "Enseñar respeto y responsabilidad",
            ideaCentral: "Los límites sanos son esenciales para el desarrollo saludable. No se trata de controlar al niño, sino de enseñarle respeto, responsabilidad y autodisciplina. Los límites claros y consistentes dan seguridad y estructura.",
            consejosAplicacion: "Establece límites claros y consistentes, pero hazlo con amor y comprensión. Explica el por qué de los límites y ayuda a tu hijo a entender las consecuencias naturales de sus acciones. Los límites deben ser apropiados para la edad y el desarrollo del niño.",
            ejemplosPracticos: [
                "Si tu hijo no quiere comer, establece el límite: 'La comida se sirve a las 6 PM, si no comes ahora, tendrás que esperar hasta el desayuno'",
                "Cuando tu hija no quiere hacer la tarea, mantén el límite: 'La tarea debe estar hecha antes de jugar'",
                "Si tu hijo no quiere ir a la cama, establece el límite: 'A las 8 PM es hora de dormir, pero puedes leer un cuento antes'"
            ],
            estrategiasPracticas: [
                "Establece límites claros y consistentes",
                "Explica el por qué de los límites",
                "Sé firme pero amoroso al hacer cumplir los límites",
                "Ayuda a tu hijo a entender las consecuencias de sus acciones"
            ],
            fraseInspiradora: "Los límites sanos son una expresión de amor",
            autor: "Daniel J. Siegel",
            nivelDificultad: 4,
            categoria: "Límites",
            icono: "shield",
            color: "indigo"
        ),
        
        // 12. AUTONOMÍA Y INDEPENDENCIA
        Capa2IdeaClave(
            titulo: "Autonomía y Independencia",
            subtitulo: "Fomentar la confianza en sí mismo",
            ideaCentral: "La autonomía es la capacidad de tomar decisiones y actuar de manera independiente. Los niños que desarrollan autonomía tienen más confianza en sí mismos y son más capaces de enfrentar los desafíos de la vida. Es importante equilibrar la protección con la oportunidad de crecer.",
            consejosAplicacion: "Permite que tu hijo tome decisiones apropiadas para su edad y asuma responsabilidades. Esto le ayudará a desarrollar confianza en sí mismo y habilidades para la vida. No hagas por él lo que puede hacer por sí mismo.",
            ejemplosPracticos: [
                "Permite que tu hijo de 3 años elija su ropa (dentro de opciones apropiadas)",
                "Si tu hija de 5 años puede vestirse sola, déjala hacerlo, aunque tome más tiempo",
                "Cuando tu hijo de 7 años puede hacer su cama, enséñale cómo y déjalo hacerlo"
            ],
            estrategiasPracticas: [
                "Permite que tu hijo tome decisiones apropiadas para su edad",
                "Enséñale habilidades para la vida paso a paso",
                "Celebra sus logros y esfuerzos",
                "No hagas por él lo que puede hacer por sí mismo"
            ],
            fraseInspiradora: "La confianza en sí mismo se construye a través de la experiencia",
            autor: "Tina Payne Bryson",
            nivelDificultad: 3,
            categoria: "Autonomía",
            icono: "person.circle",
            color: "teal"
        ),
        
        // 13. RESOLUCIÓN DE CONFLICTOS
        Capa2IdeaClave(
            titulo: "Resolución de Conflictos",
            subtitulo: "Enseñar habilidades para la vida",
            ideaCentral: "Los conflictos son una parte natural de la vida. Los niños que aprenden a resolver conflictos de manera constructiva desarrollan habilidades importantes para las relaciones y la vida. No se trata de evitar los conflictos, sino de aprender a manejarlos de manera saludable.",
            consejosAplicacion: "Enseña a tu hijo a resolver conflictos de manera constructiva. Ayúdalo a entender las perspectivas de otros, a comunicar sus necesidades de manera respetuosa y a encontrar soluciones que funcionen para todos. Los conflictos son oportunidades de aprendizaje.",
            ejemplosPracticos: [
                "Si tu hijo y su hermana están peleando por un juguete, ayúdalos a encontrar una solución que funcione para ambos",
                "Cuando tu hijo tiene un conflicto con un amigo, ayúdalo a entender la perspectiva del otro y a encontrar una solución",
                "Si tu hija está enojada contigo, ayúdala a expresar sus sentimientos de manera respetuosa"
            ],
            estrategiasPracticas: [
                "Enséñale a tu hijo a escuchar la perspectiva de otros",
                "Ayúdalo a comunicar sus necesidades de manera respetuosa",
                "Practica la búsqueda de soluciones que funcionen para todos",
                "Modela la resolución constructiva de conflictos"
            ],
            fraseInspiradora: "Los conflictos son oportunidades de crecimiento",
            autor: "Daniel J. Siegel",
            nivelDificultad: 4,
            categoria: "Habilidades Sociales",
            icono: "handshake",
            color: "yellow"
        ),
        
        // 14. GRATITUD Y POSITIVIDAD
        Capa2IdeaClave(
            titulo: "Gratitud y Positividad",
            subtitulo: "Cultivar una perspectiva positiva de la vida",
            ideaCentral: "La gratitud y la positividad son habilidades que se pueden desarrollar. Los niños que practican la gratitud tienen mejor bienestar emocional, relaciones más saludables y mayor resiliencia. Es una herramienta poderosa para la vida.",
            consejosAplicacion: "Introduce la gratitud de manera natural en la vida diaria. Ayuda a tu hijo a reconocer las cosas buenas en su vida, por pequeñas que sean. Practica la gratitud juntos y modela una perspectiva positiva ante los desafíos.",
            ejemplosPracticos: [
                "Antes de dormir, pregunta a tu hijo por tres cosas por las que está agradecido hoy",
                "Si tu hija está triste, ayúdala a encontrar algo positivo en la situación",
                "Cuando tu hijo está frustrado, ayúdalo a ver el lado positivo del desafío"
            ],
            estrategiasPracticas: [
                "Practica la gratitud diariamente",
                "Ayuda a tu hijo a encontrar lo positivo en las situaciones difíciles",
                "Modela una perspectiva positiva ante los desafíos",
                "Celebra las pequeñas cosas buenas de la vida"
            ],
            fraseInspiradora: "La gratitud transforma lo que tenemos en suficiente",
            autor: "Tina Payne Bryson",
            nivelDificultad: 2,
            categoria: "Bienestar",
            icono: "sun.max",
            color: "orange"
        ),
        
        // 15. CREATIVIDAD Y JUEGO
        Capa2IdeaClave(
            titulo: "Creatividad y Juego",
            subtitulo: "El poder del juego en el desarrollo",
            ideaCentral: "El juego es la forma natural de aprender de los niños. A través del juego, los niños desarrollan creatividad, habilidades sociales, regulación emocional y resolución de problemas. Es esencial para el desarrollo saludable.",
            consejosAplicacion: "Permite que tu hijo juegue libremente y explore su creatividad. El juego no estructurado es especialmente importante. Únete al juego de tu hijo y permite que te guíe. El juego es trabajo serio para los niños.",
            ejemplosPracticos: [
                "Permite que tu hijo construya castillos con bloques sin instrucciones específicas",
                "Si tu hija quiere jugar a ser doctora, únete al juego y permite que te examine",
                "Cuando tu hijo quiere pintar, déjalo explorar los colores y texturas sin restricciones"
            ],
            estrategiasPracticas: [
                "Dedica tiempo diario al juego libre",
                "Únete al juego de tu hijo y permite que te guíe",
                "Proporciona materiales de juego abiertos y creativos",
                "Permite que tu hijo explore y experimente sin restricciones"
            ],
            fraseInspiradora: "El juego es el trabajo de la infancia",
            autor: "Daniel J. Siegel",
            nivelDificultad: 1,
            categoria: "Desarrollo",
            icono: "paintbrush",
            color: "pink"
        ),
        
        // 16. AUTOCUIDADO Y BIENESTAR
        Capa2IdeaClave(
            titulo: "Autocuidado y Bienestar",
            subtitulo: "Enseñar a los niños a cuidarse a sí mismos",
            ideaCentral: "El autocuidado es esencial para el bienestar físico y emocional. Los niños que aprenden a cuidarse a sí mismos desarrollan hábitos saludables que duran toda la vida. Es importante modelar el autocuidado y enseñar a los niños a escuchar sus necesidades.",
            consejosAplicacion: "Modela el autocuidado en tu propia vida y enseña a tu hijo a escuchar sus necesidades. Ayúdalo a desarrollar hábitos saludables de sueño, alimentación, ejercicio y relajación. El autocuidado no es egoísmo, es una necesidad.",
            ejemplosPracticos: [
                "Si tu hijo está cansado, ayúdalo a reconocer que necesita descansar",
                "Cuando tu hija está estresada, enséñale técnicas de relajación apropiadas para su edad",
                "Si tu hijo está hambriento, ayúdalo a reconocer sus señales de hambre y a comer de manera saludable"
            ],
            estrategiasPracticas: [
                "Modela el autocuidado en tu propia vida",
                "Enséñale a tu hijo a escuchar sus necesidades físicas y emocionales",
                "Ayúdalo a desarrollar hábitos saludables de sueño y alimentación",
                "Practica técnicas de relajación juntos"
            ],
            fraseInspiradora: "Cuidarse a sí mismo es el primer paso para cuidar a otros",
            autor: "Tina Payne Bryson",
            nivelDificultad: 3,
            categoria: "Bienestar",
            icono: "heart.fill",
            color: "red"
        ),
        
        // 17. DIVERSIDAD E INCLUSIÓN
        Capa2IdeaClave(
            titulo: "Diversidad e Inclusión",
            subtitulo: "Enseñar respeto y aprecio por las diferencias",
            ideaCentral: "La diversidad es una fortaleza, no una debilidad. Los niños que aprenden a apreciar y respetar las diferencias desarrollan empatía, comprensión y habilidades para vivir en un mundo diverso. Es importante enseñar estos valores desde temprana edad.",
            consejosAplicacion: "Enseña a tu hijo a apreciar y respetar las diferencias. Exponlo a diferentes culturas, tradiciones y perspectivas. Enséñale que todos los seres humanos tienen valor y dignidad, independientemente de sus diferencias.",
            ejemplosPracticos: [
                "Lee cuentos que representen diferentes culturas y tradiciones",
                "Si tu hijo hace comentarios sobre las diferencias, ayúdalo a entender que las diferencias son normales y valiosas",
                "Cuando tu hija ve a alguien con una discapacidad, ayúdala a entender que todos somos diferentes y eso está bien"
            ],
            estrategiasPracticas: [
                "Expón a tu hijo a diferentes culturas y tradiciones",
                "Enséñale a respetar y apreciar las diferencias",
                "Modela la inclusión en tus propias interacciones",
                "Ayúdalo a entender que todos los seres humanos tienen valor y dignidad"
            ],
            fraseInspiradora: "La diversidad es la fuerza que nos une",
            autor: "Daniel J. Siegel",
            nivelDificultad: 3,
            categoria: "Valores",
            icono: "person.3",
            color: "purple"
        ),
        
        // 18. PERSISTENCIA Y DETERMINACIÓN
        Capa2IdeaClave(
            titulo: "Persistencia y Determinación",
            subtitulo: "Enseñar a los niños a no rendirse",
            ideaCentral: "La persistencia es la capacidad de continuar trabajando hacia un objetivo a pesar de los obstáculos. Los niños que desarrollan persistencia son más capaces de alcanzar sus metas y enfrentar los desafíos de la vida. Es una habilidad que se puede desarrollar.",
            consejosAplicacion: "Enseña a tu hijo que el fracaso es parte del aprendizaje. Ayúdalo a ver los desafíos como oportunidades de crecimiento. Celebra sus esfuerzos, no solo sus resultados. La persistencia se desarrolla a través de la experiencia.",
            ejemplosPracticos: [
                "Si tu hijo no logra armar un rompecabezas, ayúdalo a ver que cada intento lo acerca más al éxito",
                "Cuando tu hija no logra hacer la tarea, ayúdala a dividirla en pasos más pequeños y a celebrar cada progreso",
                "Si tu hijo no logra hacer un deporte, ayúdalo a entender que la práctica hace la diferencia"
            ],
            estrategiasPracticas: [
                "Enseña a tu hijo que el fracaso es parte del aprendizaje",
                "Ayúdalo a ver los desafíos como oportunidades de crecimiento",
                "Celebra sus esfuerzos, no solo sus resultados",
                "Modela la persistencia en tu propia vida"
            ],
            fraseInspiradora: "La persistencia es la clave del éxito",
            autor: "Tina Payne Bryson",
            nivelDificultad: 4,
            categoria: "Habilidades de Vida",
            icono: "target",
            color: "blue"
        ),
        
        // 19. COMPASIÓN Y AMABILIDAD
        Capa2IdeaClave(
            titulo: "Compasión y Amabilidad",
            subtitulo: "Enseñar a los niños a ser amables con otros y consigo mismos",
            ideaCentral: "La compasión es la capacidad de entender y compartir el sufrimiento de otros, y la amabilidad es la expresión práctica de esa comprensión. Los niños que desarrollan compasión y amabilidad tienen relaciones más saludables y mayor bienestar emocional.",
            consejosAplicacion: "Modela la compasión y la amabilidad en tus propias interacciones. Enséñale a tu hijo a ser amable consigo mismo y con otros. Practica actos de amabilidad juntos y ayúdalo a entender el impacto positivo de sus acciones.",
            ejemplosPracticos: [
                "Si tu hijo ve a otro niño llorando, ayúdalo a pensar en cómo puede consolarlo",
                "Cuando tu hija está siendo dura consigo misma, ayúdala a ser más compasiva con sus propios errores",
                "Si tu hijo ve a alguien necesitando ayuda, ayúdalo a pensar en cómo puede ayudar"
            ],
            estrategiasPracticas: [
                "Modela la compasión y la amabilidad en tus propias interacciones",
                "Enséñale a tu hijo a ser amable consigo mismo y con otros",
                "Practica actos de amabilidad juntos",
                "Ayúdalo a entender el impacto positivo de sus acciones"
            ],
            fraseInspiradora: "La amabilidad es el lenguaje que los sordos pueden oír y los ciegos pueden ver",
            autor: "Daniel J. Siegel",
            nivelDificultad: 2,
            categoria: "Valores",
            icono: "heart.fill",
            color: "pink"
        ),
        
        // 20. SABIDURÍA EMOCIONAL
        Capa2IdeaClave(
            titulo: "Sabiduría Emocional",
            subtitulo: "La integración de todas las habilidades emocionales",
            ideaCentral: "La sabiduría emocional es la capacidad de entender, manejar y usar las emociones de manera efectiva. Es la integración de todas las habilidades emocionales: autoconciencia, regulación, empatía, comunicación y resolución de conflictos. Es la base del bienestar emocional.",
            consejosAplicacion: "Ayuda a tu hijo a desarrollar sabiduría emocional modelando estas habilidades en tus propias interacciones. Enséñale que las emociones son información valiosa que puede usar para tomar decisiones y construir relaciones. La sabiduría emocional se desarrolla a través de la experiencia y la práctica.",
            ejemplosPracticos: [
                "Si tu hijo está enojado, ayúdalo a entender que su enojo le está diciendo que algo no está bien",
                "Cuando tu hija está triste, ayúdala a entender que su tristeza es una respuesta normal a una pérdida",
                "Si tu hijo está ansioso, ayúdalo a entender que su ansiedad le está diciendo que necesita prepararse para un desafío"
            ],
            estrategiasPracticas: [
                "Modela la sabiduría emocional en tus propias interacciones",
                "Enséñale a tu hijo que las emociones son información valiosa",
                "Ayúdalo a usar sus emociones para tomar decisiones y construir relaciones",
                "Practica la integración de todas las habilidades emocionales"
            ],
            fraseInspiradora: "La sabiduría emocional es la base del bienestar y la conexión humana",
            autor: "Daniel J. Siegel",
            nivelDificultad: 5,
            categoria: "Integración",
            icono: "brain.head.profile",
            color: "purple"
        )
    ]
}