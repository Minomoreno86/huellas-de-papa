import Foundation

/// Datos de la Capa 3 - Herramientas
/// Basado 100% en el libro "¡Te amo cuando estás enojado!" de Erin Winters
/// Herramientas prácticas para aplicar el amor incondicional

extension TA3Tool {
    static let allTools: [TA3Tool] = [
        // === HERRAMIENTAS DE VALIDACIÓN EMOCIONAL ===
        TA3Tool(
            name: "Frases de Validación Emocional",
            category: "Validación",
            objective: "Validar cada emoción del niño con amor incondicional",
            materials: [],
            steps: [
                "Observa la emoción que tu hijo está experimentando",
                "Nombra la emoción en voz alta: 'Veo que estás [emoción]'",
                "Usa la frase del libro: 'Te amo cuando estás [emoción]'",
                "Mantén contacto visual y tono calmado",
                "Permanece presente sin intentar cambiar la emoción"
            ],
            durationMinutes: 2,
            recommendedAge: "0-12 años",
            bookReference: "Te amo cuando estás enojado, triste, alegre, melancólico",
            reflectionCue: "Cada emoción validada fortalece el apego seguro y la confianza emocional",
            icon: "heart.text.square.fill",
            color: "pink"
        ),
        
        TA3Tool(
            name: "El Abrazo Incondicional",
            category: "Conexión",
            objective: "Usar el contacto físico para transmitir amor incondicional",
            materials: [],
            steps: [
                "Pregunta: '¿Te gustaría un abrazo?' (respetar si dice no)",
                "Si acepta, ofrece un abrazo cálido y sostenido",
                "Susurra: 'Te amo tal como eres'",
                "Mantén el abrazo 20-30 segundos",
                "Al finalizar, di: 'Estoy aquí para ti siempre'"
            ],
            durationMinutes: 3,
            recommendedAge: "0-12 años",
            bookReference: "Consuelo se encuentra en el abrazo y las palabras dulces antes de dormir",
            reflectionCue: "El contacto físico amoroso libera oxitocina y refuerza el vínculo emocional",
            icon: "figure.2.and.child.holdinghands",
            color: "pink"
        ),
        
        TA3Tool(
            name: "Conversaciones de Confianza",
            category: "Reflexión",
            objective: "Crear un espacio seguro para hablar de emociones",
            materials: ["Momento tranquilo", "Lugar cómodo"],
            steps: [
                "Busca un momento tranquilo del día",
                "Pregunta: '¿Cómo te has sentido hoy?'",
                "Escucha sin juzgar, validando cada emoción compartida",
                "Comparte tus propias emociones: 'Yo también tuve días difíciles'",
                "Termina con: 'Gracias por compartir conmigo. Te amo siempre'"
            ],
            durationMinutes: 10,
            recommendedAge: "3-12 años",
            bookReference: "Hablar de las emociones con alguien de confianza puede ayudar",
            reflectionCue: "La comunicación emocional fortalece la confianza y la inteligencia emocional",
            icon: "bubble.left.and.bubble.right.fill",
            color: "mint"
        ),
        
        TA3Tool(
            name: "El Ritual de las Palabras Dulces",
            category: "Conexión",
            objective: "Terminar cada día recordando el amor incondicional",
            materials: [],
            steps: [
                "Antes de dormir, siéntate junto a tu hijo",
                "Di: 'Hoy te amé cuando estabas [menciona emociones del día]'",
                "Pregunta: '¿Qué sintió tu corazón hoy?'",
                "Escucha con atención y valida",
                "Termina: 'Te amo ahora y para siempre. Los días difíciles terminan'"
            ],
            durationMinutes: 5,
            recommendedAge: "2-12 años",
            bookReference: "El consuelo se encuentra en el abrazo y las palabras dulces antes de dormir",
            reflectionCue: "Este ritual refuerza que el amor permanece constante sin importar el día",
            icon: "moon.stars.fill",
            color: "indigo"
        ),
        
        // === HERRAMIENTAS DE NORMALIZACIÓN ===
        TA3Tool(
            name: "Normalizar las Emociones Difíciles",
            category: "Normalización",
            objective: "Enseñar que tener emociones difíciles es parte de ser humano",
            materials: [],
            steps: [
                "Cuando tu hijo experimente una emoción difícil, di:",
                "'Todo el mundo tiene emociones. Es normal sentirse así'",
                "'Ser humano significa tener días buenos y malos'",
                "Comparte un momento en que tú sentiste algo similar",
                "Pregunta: '¿Qué necesitas ahora?'"
            ],
            durationMinutes: 5,
            recommendedAge: "3-12 años",
            bookReference: "Todo el mundo tiene emociones. Ser humano implica tener días buenos y malos",
            reflectionCue: "Normalizar las emociones reduce la vergüenza y fortalece la autocompasión",
            icon: "person.2.fill",
            color: "blue"
        ),
        
        TA3Tool(
            name: "Recordatorio de Permanencia",
            category: "Permanencia",
            objective: "Reforzar que el amor no cambia sin importar las circunstancias",
            materials: [],
            steps: [
                "En momentos difíciles, detente y haz contacto visual",
                "Di con claridad: 'Mi amor por ti nunca cambia'",
                "'Te amo ahora y para siempre'",
                "'Incluso cuando estoy cansado o enfadado, te amo'",
                "Pregunta: '¿Puedes sentir mi amor?'"
            ],
            durationMinutes: 2,
            recommendedAge: "2-12 años",
            bookReference: "Mi amor persiste ahora y para siempre, incluso cuando estoy cansada o me enfado",
            reflectionCue: "La permanencia del amor crea seguridad emocional y apego seguro",
            icon: "infinity.circle.fill",
            color: "pink"
        ),
        
        // === HERRAMIENTAS DE REFLEXIÓN ===
        TA3Tool(
            name: "Reflexión Guiada sobre Emociones",
            category: "Reflexión",
            objective: "Ayudar al niño a identificar y comprender sus emociones",
            materials: ["Papel y colores (opcional)"],
            steps: [
                "Pregunta: '¿Qué estás sintiendo ahora?'",
                "Si no sabe, ofrece opciones: '¿Estás enojado? ¿Triste? ¿Frustrado?'",
                "'A veces es difícil saber lo que estamos sintiendo y por qué'",
                "Pregunta: '¿Dónde sientes eso en tu cuerpo?'",
                "'Te amo cuando sientes [emoción identificada]'"
            ],
            durationMinutes: 5,
            recommendedAge: "4-12 años",
            bookReference: "En ocasiones es difícil saber lo que estamos sintiendo y por qué. Aprender sobre nuestras emociones es clave",
            reflectionCue: "La reflexión emocional desarrolla inteligencia emocional y autoconocimiento",
            icon: "brain.head.profile",
            color: "purple"
        ),
        
        TA3Tool(
            name: "El Día Bueno y el Día Malo",
            category: "Perspectiva",
            objective: "Enseñar que las emociones son temporales y los días cambian",
            materials: [],
            steps: [
                "En un momento difícil, di: 'Los días difíciles terminan'",
                "'Al igual que los días buenos también terminan'",
                "Pregunta: '¿Recuerdas algún día difícil que haya pasado?'",
                "Recuerda juntos cómo ese día terminó",
                "'Este día también terminará, y mi amor seguirá aquí'"
            ],
            durationMinutes: 5,
            recommendedAge: "4-12 años",
            bookReference: "Los días difíciles terminan, al igual que los buenos",
            reflectionCue: "Esta perspectiva temporal ayuda a desarrollar resiliencia emocional",
            icon: "calendar.circle.fill",
            color: "orange"
        )
    ]
}

extension TA3Phrase {
    static let allPhrases: [TA3Phrase] = [
        TA3Phrase(
            emotion: "Enojado",
            phrase: "Te amo cuando estás enojado",
            whenToUse: "Cuando tu hijo muestra ira, frustración o hace berrinches",
            example: "Durante una rabieta: 'Te amo cuando estás enojado. Estoy aquí contigo.'",
            fromBook: true
        ),
        TA3Phrase(
            emotion: "Triste",
            phrase: "Te amo cuando estás triste",
            whenToUse: "Cuando tu hijo llora o muestra tristeza",
            example: "Al ver lágrimas: 'Te amo cuando estás triste. Puedes llorar todo lo que necesites.'",
            fromBook: true
        ),
        TA3Phrase(
            emotion: "Alegre",
            phrase: "Te amo en tu alegría",
            whenToUse: "Cuando tu hijo está feliz y emocionado",
            example: "En momentos de felicidad: 'Te amo en tu alegría. Me encanta verte feliz.'",
            fromBook: true
        ),
        TA3Phrase(
            emotion: "Melancólico",
            phrase: "Te amo en tu melancolía",
            whenToUse: "Cuando tu hijo está nostálgico o reflexivo",
            example: "En momentos de quietud: 'Te amo en tu melancolía. Está bien sentirse así.'",
            fromBook: true
        ),
        TA3Phrase(
            emotion: "Apasionado",
            phrase: "Te amo cuando estás apasionado",
            whenToUse: "Cuando tu hijo muestra entusiasmo intenso",
            example: "Con emoción fuerte: 'Te amo cuando estás apasionado. Tu energía es hermosa.'",
            fromBook: true
        ),
        TA3Phrase(
            emotion: "Tranquilo",
            phrase: "Te amo cuando estás tranquilo",
            whenToUse: "Cuando tu hijo está en calma",
            example: "En momentos de paz: 'Te amo cuando estás tranquilo. Esta calma es preciosa.'",
            fromBook: true
        ),
        TA3Phrase(
            emotion: "Frustrado",
            phrase: "Te amo cuando estás frustrado",
            whenToUse: "Cuando algo no sale como tu hijo esperaba",
            example: "Ante la frustración: 'Te amo cuando estás frustrado. Entiendo que es difícil.'",
            fromBook: true
        ),
        TA3Phrase(
            emotion: "Cansado",
            phrase: "Te amo cuando estás cansado",
            whenToUse: "Cuando tu hijo está agotado física o emocionalmente",
            example: "Con agotamiento: 'Te amo cuando estás cansado. Descansemos juntos.'",
            fromBook: true
        )
    ]
}

extension TA3Activity {
    static let allActivities: [TA3Activity] = [
        TA3Activity(
            name: "Círculo de Amor Incondicional",
            type: "Ritual Familiar",
            description: "Momento diario para expresar amor a través de todas las emociones",
            objectives: [
                "Normalizar todas las emociones como válidas",
                "Fortalecer el vínculo familiar",
                "Practicar la expresión emocional segura"
            ],
            howToDo: [
                "Reunirse en familia una vez al día",
                "Cada persona comparte: 'Hoy me sentí...'",
                "Los demás responden: 'Te amamos cuando te sientes así'",
                "Terminan con un abrazo grupal"
            ],
            frequency: "Diaria (5-10 minutos)",
            bookBasis: "Basado en el amor incondicional del espectro emocional",
            icon: "person.3.fill"
        ),
        
        TA3Activity(
            name: "El Diario de Emociones",
            type: "Reflexión",
            description: "Registro de emociones y validación escrita",
            objectives: [
                "Desarrollar conciencia emocional",
                "Practicar la reflexión sobre emociones",
                "Crear un registro de validación"
            ],
            howToDo: [
                "Cada noche, escribir o dibujar las emociones del día",
                "El padre escribe: 'Te amé cuando sentiste [emoción]'",
                "Leer juntos el diario periódicamente",
                "Celebrar la diversidad emocional"
            ],
            frequency: "Diaria (5 minutos)",
            bookBasis: "Aprender sobre nuestras emociones es clave",
            icon: "book.pages.fill"
        ),
        
        TA3Activity(
            name: "El Juego de las Caras Emocionales",
            type: "Juego",
            description: "Reconocer y validar emociones a través del juego",
            objectives: [
                "Identificar emociones en uno mismo y otros",
                "Normalizar la expresión emocional",
                "Fortalecer la empatía"
            ],
            howToDo: [
                "Hacer caras que representen diferentes emociones",
                "El otro adivina la emoción",
                "Decir juntos: 'Te amo cuando te sientes así'",
                "Compartir cuándo sintieron esa emoción"
            ],
            frequency: "2-3 veces por semana (10 minutos)",
            bookBasis: "Todo el mundo tiene emociones",
            icon: "face.smiling.fill"
        ),
        
        TA3Activity(
            name: "Cápsula del Tiempo Emocional",
            type: "Proyecto",
            description: "Guardar recuerdos de días buenos y malos",
            objectives: [
                "Enseñar que los días pasan",
                "Crear perspectiva temporal",
                "Celebrar la permanencia del amor"
            ],
            howToDo: [
                "Crear una caja especial juntos",
                "En días difíciles, escribir una nota sobre el día",
                "Agregar también notas de días buenos",
                "Revisar la cápsula después de un tiempo",
                "Reflexionar: 'Todos esos días pasaron, mi amor siempre estuvo'"
            ],
            frequency: "Según necesidad",
            bookBasis: "Los días difíciles terminan, al igual que los buenos",
            icon: "archivebox.fill"
        )
    ]
}

