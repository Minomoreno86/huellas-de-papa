import Foundation

/// Datos de las herramientas prácticas del Yes Brain organizadas por pilares
struct Capa3HerramientasData {
    
    static let herramientas: [YesBrainTool] = [
        // === HERRAMIENTAS DE BALANCE ===
        YesBrainTool(
            name: "El Semáforo Interno",
            category: "Balance",
            objective: "Enseñar al niño a reconocer sus niveles de activación emocional y autorregularse",
            materials: ["Imagen de semáforo", "Colores verde, amarillo y rojo"],
            steps: [
                "Explica que el semáforo tiene 3 colores: verde (tranquilo), amarillo (alerta) y rojo (muy activado)",
                "Pregunta: '¿En qué color te sientes ahora?' y escucha su respuesta",
                "Si está en amarillo o rojo, respira juntos: 'Inhala por la nariz, exhala por la boca'",
                "Cuenta hasta 5 inhalando y hasta 5 exhalando",
                "Pregunta nuevamente: '¿En qué color te sientes ahora?'"
            ],
            durationMinutes: 3,
            recommendedAge: "3-12 años",
            reflectionCue: "Acabas de enseñarle a tu hijo a ser su propio regulador emocional",
            icon: "trafficlight",
            color: "green"
        ),
        
        YesBrainTool(
            name: "La Respiración del Oso",
            category: "Balance",
            objective: "Usar la respiración profunda para activar el sistema de calma y reducir el estrés",
            materials: [],
            steps: [
                "Siéntate o acuéstate cómodamente con tu hijo",
                "Coloca una mano en el pecho y otra en el abdomen",
                "Inhala lentamente por la nariz contando hasta 4",
                "Mantén la respiración contando hasta 4",
                "Exhala lentamente por la boca contando hasta 6",
                "Repite 3-5 veces juntos"
            ],
            durationMinutes: 5,
            recommendedAge: "4-12 años",
            reflectionCue: "La respiración consciente fortalece el vínculo y regula el sistema nervioso",
            icon: "lungs",
            color: "blue"
        ),
        
        YesBrainTool(
            name: "El Abrazo de Oso",
            category: "Balance",
            objective: "Usar el contacto físico para activar el sistema de calma y conexión",
            materials: [],
            steps: [
                "Pide permiso a tu hijo: '¿Te gustaría un abrazo de oso?'",
                "Envuelve a tu hijo con tus brazos de manera firme pero suave",
                "Mantén el abrazo durante 20-30 segundos",
                "Respira profundamente juntos durante el abrazo",
                "Al finalizar, di: 'Te amo y estoy aquí contigo'"
            ],
            durationMinutes: 2,
            recommendedAge: "2-12 años",
            reflectionCue: "El contacto físico amoroso libera oxitocina y fortalece la conexión",
            icon: "heart.fill",
            color: "pink"
        ),
        
        YesBrainTool(
            name: "La Pausa Consciente",
            category: "Balance",
            objective: "Crear un momento de pausa antes de reaccionar emocionalmente",
            materials: [],
            steps: [
                "Cuando sientas que tú o tu hijo están a punto de reaccionar intensamente",
                "Di en voz alta: 'Vamos a hacer una pausa consciente'",
                "Cuenta juntos: '1... 2... 3... 4... 5'",
                "Respira profundamente una vez",
                "Pregunta: '¿Qué necesitamos ahora?'"
            ],
            durationMinutes: 1,
            recommendedAge: "3-12 años",
            reflectionCue: "La pausa consciente previene reacciones impulsivas y promueve respuestas reflexivas",
            icon: "pause.circle",
            color: "cyan"
        ),
        
        // === HERRAMIENTAS DE RESILIENCIA ===
        YesBrainTool(
            name: "Repara y Reconecta",
            category: "Resiliencia",
            objective: "Enseñar que los errores son oportunidades de aprendizaje y reconexión",
            materials: [],
            steps: [
                "Cuando haya un conflicto o error, di: 'Los errores son cómo aprendemos'",
                "Pregunta: '¿Qué podemos aprender de esto?'",
                "Escucha las respuestas sin juzgar",
                "Haz una reparación juntos: '¿Cómo podemos arreglar esto?'",
                "Termina con: 'Te amo, incluso cuando cometemos errores'"
            ],
            durationMinutes: 5,
            recommendedAge: "4-12 años",
            reflectionCue: "La reparación fortalece la resiliencia y enseña que el amor es incondicional",
            icon: "arrow.clockwise",
            color: "orange"
        ),
        
        YesBrainTool(
            name: "El Reencuadre Positivo",
            category: "Resiliencia",
            objective: "Ayudar al niño a ver las situaciones desafiantes desde una perspectiva más positiva",
            materials: [],
            steps: [
                "Cuando tu hijo esté frustrado, di: 'Veo que esto es difícil'",
                "Pregunta: '¿Qué parte de esto es más difícil?'",
                "Ayúdalo a encontrar algo positivo: '¿Qué está funcionando bien?'",
                "Pregunta: '¿Cómo puedes usar esto para ser más fuerte?'",
                "Termina con: 'Eres más fuerte de lo que crees'"
            ],
            durationMinutes: 4,
            recommendedAge: "5-12 años",
            reflectionCue: "El reencuadre positivo fortalece la mentalidad de crecimiento",
            icon: "arrow.up.right.circle",
            color: "yellow"
        ),
        
        YesBrainTool(
            name: "Micro-Metas",
            category: "Resiliencia",
            objective: "Dividir tareas grandes en pasos pequeños para construir confianza",
            materials: ["Papel", "Lápices de colores"],
            steps: [
                "Identifica una tarea que parece abrumadora para tu hijo",
                "Dibuja o escribe 3-5 pasos pequeños para completarla",
                "Empieza con el primer paso y celébralo",
                "Continúa paso a paso, celebrando cada logro",
                "Al final, reflexiona: '¿Cómo se sintió hacerlo paso a paso?'"
            ],
            durationMinutes: 10,
            recommendedAge: "4-12 años",
            reflectionCue: "Las micro-metas enseñan que el éxito se construye paso a paso",
            icon: "target",
            color: "green"
        ),
        
        // === HERRAMIENTAS DE INSIGHT ===
        YesBrainTool(
            name: "El Espejo de Emociones",
            category: "Insight",
            objective: "Ayudar al niño a reconocer y nombrar sus emociones",
            materials: ["Espejo", "Imágenes de emociones"],
            steps: [
                "Sienta a tu hijo frente a un espejo",
                "Pregunta: '¿Qué emoción ves en tu cara ahora?'",
                "Si no sabe, ayúdalo: 'Veo que tienes...'",
                "Pregunta: '¿Dónde sientes esta emoción en tu cuerpo?'",
                "Termina con: 'Todas las emociones son válidas'"
            ],
            durationMinutes: 4,
            recommendedAge: "3-12 años",
            reflectionCue: "Nombrar emociones activa la corteza prefrontal y promueve la autoconciencia",
            icon: "eye",
            color: "purple"
        ),
        
        YesBrainTool(
            name: "Conversaciones Espejo",
            category: "Insight",
            objective: "Reflejar las emociones del niño para ayudarlo a sentirse comprendido",
            materials: [],
            steps: [
                "Cuando tu hijo exprese una emoción, repite lo que escuchas",
                "Di: 'Escucho que te sientes...'",
                "Pregunta: '¿Es correcto lo que estoy entendiendo?'",
                "Si es correcto, di: 'Gracias por compartir eso conmigo'",
                "Si no es correcto, di: 'Ayúdame a entender mejor'"
            ],
            durationMinutes: 3,
            recommendedAge: "3-12 años",
            reflectionCue: "Reflejar emociones valida la experiencia del niño y fortalece la conexión",
            icon: "bubble.left.and.bubble.right",
            color: "cyan"
        ),
        
        YesBrainTool(
            name: "El Diario de Emociones",
            category: "Insight",
            objective: "Crear un espacio seguro para que el niño explore y exprese sus emociones",
            materials: ["Cuaderno", "Lápices de colores", "Stickers"],
            steps: [
                "Crea un momento especial para el diario (antes de dormir funciona bien)",
                "Pregunta: '¿Cómo te sentiste hoy?'",
                "Ayúdalo a dibujar o escribir sobre sus emociones",
                "Pregunta: '¿Qué te ayudó a sentirte mejor?'",
                "Termina con: 'Gracias por compartir tu corazón conmigo'"
            ],
            durationMinutes: 8,
            recommendedAge: "5-12 años",
            reflectionCue: "El diario de emociones desarrolla la inteligencia emocional y la autoconciencia",
            icon: "book",
            color: "brown"
        ),
        
        // === HERRAMIENTAS DE EMPATÍA ===
        YesBrainTool(
            name: "Validación Emocional",
            category: "Empatía",
            objective: "Enseñar al niño a validar las emociones de otros",
            materials: [],
            steps: [
                "Cuando alguien exprese una emoción, di: 'Veo que [nombre] se siente...'",
                "Pregunta a tu hijo: '¿Cómo crees que se siente?'",
                "Ayúdalo a validar: 'Es normal sentirse así cuando...'",
                "Pregunta: '¿Cómo podríamos ayudarle?'",
                "Implementa la ayuda juntos"
            ],
            durationMinutes: 5,
            recommendedAge: "4-12 años",
            reflectionCue: "Validar emociones enseña compasión y fortalece las relaciones",
            icon: "heart.circle",
            color: "pink"
        ),
        
        YesBrainTool(
            name: "Historias en Primera Persona",
            category: "Empatía",
            objective: "Desarrollar la capacidad de ponerse en el lugar de otros",
            materials: ["Cuentos o historias"],
            steps: [
                "Lee una historia o cuento con tu hijo",
                "Pregunta: '¿Cómo crees que se siente [personaje]?'",
                "Pregunta: '¿Alguna vez te has sentido así?'",
                "Pregunta: '¿Qué harías si fueras [personaje]?'",
                "Termina con: 'Entender a otros nos ayuda a ser mejores amigos'"
            ],
            durationMinutes: 10,
            recommendedAge: "4-12 años",
            reflectionCue: "Las historias desarrollan la teoría de la mente y la empatía",
            icon: "book.closed",
            color: "indigo"
        ),
        
        YesBrainTool(
            name: "Escucha Activa",
            category: "Empatía",
            objective: "Enseñar al niño a escuchar realmente a otros",
            materials: [],
            steps: [
                "Cuando alguien hable, di: 'Vamos a practicar la escucha activa'",
                "Miren a la persona que habla",
                "No interrumpan, solo escuchen",
                "Cuando termine, repitan lo que escucharon",
                "Pregunten: '¿Es correcto lo que entendí?'"
            ],
            durationMinutes: 3,
            recommendedAge: "4-12 años",
            reflectionCue: "La escucha activa es el fundamento de la conexión humana",
            icon: "ear",
            color: "teal"
        ),
        
        YesBrainTool(
            name: "El Círculo de Empatía",
            category: "Empatía",
            objective: "Crear un espacio donde todos pueden expresar cómo se sienten",
            materials: ["Objeto para pasar (piedra, peluche)"],
            steps: [
                "Sienten a todos en un círculo",
                "Explica: 'Vamos a pasar este objeto y cada uno dirá cómo se siente'",
                "Empieza tú: 'Me siento... porque...'",
                "Pasa el objeto al siguiente",
                "Termina con: 'Gracias por compartir cómo se sienten'"
            ],
            durationMinutes: 8,
            recommendedAge: "4-12 años",
            reflectionCue: "El círculo de empatía fortalece la conexión familiar y la comprensión mutua",
            icon: "person.3",
            color: "red"
        )
    ]
    
    static let frases: [YesBrainPhrase] = [
        // Frases de Balance
        YesBrainPhrase(
            context: "Cuando el niño está muy activado",
            phrase: "Veo que estás muy activado. Vamos a respirar juntos para calmarnos.",
            pillar: "Balance",
            icon: "wind",
            color: "blue"
        ),
        
        YesBrainPhrase(
            context: "Antes de una situación estresante",
            phrase: "Vamos a hacer una pausa consciente antes de continuar.",
            pillar: "Balance",
            icon: "pause.circle",
            color: "cyan"
        ),
        
        YesBrainPhrase(
            context: "Cuando el niño necesita contención",
            phrase: "Estoy aquí contigo. Te amo y estás seguro.",
            pillar: "Balance",
            icon: "heart.fill",
            color: "pink"
        ),
        
        // Frases de Resiliencia
        YesBrainPhrase(
            context: "Después de un error o conflicto",
            phrase: "Los errores son cómo aprendemos. ¿Qué podemos aprender de esto?",
            pillar: "Resiliencia",
            icon: "arrow.clockwise",
            color: "orange"
        ),
        
        YesBrainPhrase(
            context: "Cuando el niño se siente frustrado",
            phrase: "Veo que esto es difícil. Eres más fuerte de lo que crees.",
            pillar: "Resiliencia",
            icon: "arrow.up.right.circle",
            color: "yellow"
        ),
        
        YesBrainPhrase(
            context: "Antes de una tarea difícil",
            phrase: "Vamos a dividir esto en pasos pequeños. ¡Tú puedes!",
            pillar: "Resiliencia",
            icon: "target",
            color: "green"
        ),
        
        // Frases de Insight
        YesBrainPhrase(
            context: "Cuando el niño expresa una emoción",
            phrase: "Escucho que te sientes... ¿Es correcto lo que estoy entendiendo?",
            pillar: "Insight",
            icon: "bubble.left.and.bubble.right",
            color: "cyan"
        ),
        
        YesBrainPhrase(
            context: "Para desarrollar autoconciencia",
            phrase: "¿Qué emoción ves en tu cara? ¿Dónde la sientes en tu cuerpo?",
            pillar: "Insight",
            icon: "eye",
            color: "purple"
        ),
        
        YesBrainPhrase(
            context: "Al final del día",
            phrase: "¿Cómo te sentiste hoy? Gracias por compartir tu corazón conmigo.",
            pillar: "Insight",
            icon: "book",
            color: "brown"
        ),
        
        // Frases de Empatía
        YesBrainPhrase(
            context: "Cuando alguien está triste",
            phrase: "Veo que [nombre] está triste. ¿Cómo podríamos ayudarle?",
            pillar: "Empatía",
            icon: "heart.circle",
            color: "pink"
        ),
        
        YesBrainPhrase(
            context: "Para desarrollar comprensión",
            phrase: "¿Cómo crees que se siente [persona]? ¿Alguna vez te has sentido así?",
            pillar: "Empatía",
            icon: "book.closed",
            color: "indigo"
        ),
        
        YesBrainPhrase(
            context: "Para practicar escucha activa",
            phrase: "Vamos a escuchar realmente. ¿Qué entendiste de lo que dijo [nombre]?",
            pillar: "Empatía",
            icon: "ear",
            color: "teal"
        )
    ]
    
    static let rutinas: [YesBrainRoutine] = [
        YesBrainRoutine(
            title: "Rutina de la Mañana con Cerebro Sí",
            description: "Comienza el día con conexión y regulación emocional",
            tools: [], // Se llenará con IDs de herramientas
            durationMinutes: 10,
            category: "Mañana",
            icon: "sun.max",
            color: "yellow"
        ),
        
        YesBrainRoutine(
            title: "Rutina de Transiciones",
            description: "Herramientas para manejar cambios de actividad de manera suave",
            tools: [],
            durationMinutes: 5,
            category: "Transiciones",
            icon: "arrow.right.arrow.left",
            color: "blue"
        ),
        
        YesBrainRoutine(
            title: "Rutina de Crisis",
            description: "Herramientas de emergencia para momentos de alta activación emocional",
            tools: [],
            durationMinutes: 3,
            category: "Crisis",
            icon: "exclamationmark.triangle",
            color: "red"
        ),
        
        YesBrainRoutine(
            title: "Rutina de Conexión Nocturna",
            description: "Termina el día con reflexión y conexión emocional",
            tools: [],
            durationMinutes: 8,
            category: "Noche",
            icon: "moon",
            color: "indigo"
        )
    ]
}
