import Foundation

/// Datos de la Capa 5 - Aplicación en Casa
/// Basado en el libro "¡Te amo cuando estás enojado!" de Erin Winters
/// Actividades y rutinas prácticas para aplicar el amor incondicional

extension TA5Activity {
    static let allActivities: [TA5Activity] = [
        // ACTIVIDAD 1: Ritual Matutino
        TA5Activity(
            title: "Ritual Matutino de Amor Incondicional",
            fromBook: true,
            description: "Comenzar cada día recordando que el amor es constante sin importar las emociones que vengan",
            objective: "Establecer desde la mañana que todas las emociones del día serán válidas y amadas",
            materials: [],
            instructions: [
                "Al despertar a tu hijo, antes de cualquier tarea, siéntate a su lado",
                "Haz contacto visual y di: 'Buenos días, te amo'",
                "Pregunta: '¿Cómo te sientes al despertar?'",
                "Sin importar la respuesta, valida: 'Te amo cuando te sientes así'",
                "Si está alegre: 'Te amo en tu alegría'",
                "Si está cansado o malhumorado: 'Te amo cuando estás cansado'",
                "Termina con: 'Hoy te amaré en cada emoción que sientas'"
            ],
            frequency: .daily,
            durationMinutes: "3-5 minutos",
            ageRange: "0-12 años",
            bookReference: "Te amo cuando estás [cualquier emoción]",
            tips: [
                "Hazlo antes de hablar de tareas o responsabilidades",
                "Mantén contacto físico suave (mano en el hombro, abrazo)",
                "Tu tono de voz es más importante que las palabras exactas",
                "Sé auténtico en tu amor, el niño detecta la falsedad"
            ],
            iconName: "sun.max.fill"
        ),
        
        // ACTIVIDAD 2: El Espejo de Emociones
        TA5Activity(
            title: "El Espejo de Emociones",
            fromBook: false,
            description: "Actividad creativa para practicar y validar todas las expresiones faciales de las emociones",
            objective: "Normalizar todas las emociones al practicarlas físicamente frente al espejo con amor",
            materials: ["Espejo grande", "Opcional: cámara para fotos"],
            instructions: [
                "Párate frente al espejo con tu hijo",
                "Di: 'Vamos a practicar todas las emociones que podemos sentir'",
                "Empiecen con alegría: hagan caras felices y di: 'Te amo cuando estás alegre'",
                "Continúa con enojo: hagan caras de enojo y di: 'Te amo cuando estás enojado'",
                "Sigue con tristeza, sorpresa, cansancio, frustración, melancolía",
                "Después de cada emoción, repite la frase del libro",
                "Toma fotos si quieren y creen un 'álbum de emociones válidas'",
                "Al terminar: 'Todas estas emociones son parte de ser humano, y te amo en todas'"
            ],
            frequency: .twiceWeek,
            durationMinutes: "10-15 minutos",
            ageRange: "3-10 años",
            bookReference: "Te amo cuando estás enojado, triste, alegre, melancólico",
            tips: [
                "Hazlo divertido, no serio",
                "Tú también practica las emociones, muestra vulnerabilidad",
                "Celebra cada expresión emocional que practiquen",
                "Si el niño se resiste a alguna emoción, respétalo y valida eso también"
            ],
            iconName: "face.smiling.fill"
        ),
        
        // ACTIVIDAD 3: La Canción del Amor Incondicional
        TA5Activity(
            title: "La Canción del Amor Incondicional",
            fromBook: false,
            description: "Crear canciones personalizadas usando las frases del libro adaptadas a tu familia",
            objective: "Hacer memorable el amor incondicional a través de la música y repetición",
            materials: ["Opcional: instrumento musical simple"],
            instructions: [
                "Elige una melodía simple que ambos conozcan (puede ser infantil)",
                "Usa las frases del libro como letra: 'Te amo cuando estás enojado'",
                "Creen versos para diferentes emociones",
                "Ejemplo: 'Te amo cuando estás triste, te amo cuando estás alegre, te amo siempre, siempre, siempre'",
                "Cántenla juntos varias veces",
                "Inventen gestos o movimientos para cada emoción",
                "Usen la canción en momentos difíciles como recordatorio"
            ],
            frequency: .twiceWeek,
            durationMinutes: "10-20 minutos",
            ageRange: "2-8 años",
            bookReference: "Basado en las frases de validación del libro",
            tips: [
                "No importa si desafinan, lo importante es el mensaje",
                "Pueden grabarla para escucharla después",
                "Actualicen la canción con emociones nuevas que surjan",
                "Cántenla en el auto, antes de dormir, o cuando sea necesario"
            ],
            iconName: "music.note"
        ),
        
        // ACTIVIDAD 4: Juego de Validación de Emociones
        TA5Activity(
            title: "Juego de Validación de Emociones",
            fromBook: true,
            description: "Juego interactivo para practicar las frases de validación del libro en contexto lúdico",
            objective: "Automatizar las respuestas de amor incondicional a través del juego",
            materials: ["Tarjetas con emociones (opcional)"],
            instructions: [
                "Explica: 'Vamos a jugar a validar emociones'",
                "Uno dice una emoción (ej: 'estoy enojado') o la actúa",
                "El otro responde con la frase del libro: 'Te amo cuando estás enojado'",
                "Intercambien roles",
                "Incluyan emociones del libro: enojado, triste, alegre, melancólico, cansado, frustrado",
                "Agreguen escenarios: 'Me caí y me duele' → 'Te amo cuando te duele'",
                "Hagan versiones tontas o exageradas para reír juntos",
                "Terminen con: 'En este juego y en la vida real, te amo en todas tus emociones'"
            ],
            frequency: .twiceWeek,
            durationMinutes: "15-20 minutos",
            ageRange: "3-10 años",
            bookReference: "Frases de validación emocional del libro",
            tips: [
                "Deja que el niño también te valide a ti",
                "Celebra cuando el niño usa las frases espontáneamente",
                "No fuerces si no quiere jugar ese día (valida esa emoción también)",
                "El objetivo es que las frases se vuelvan naturales"
            ],
            iconName: "gamecontroller.fill"
        ),
        
        // ACTIVIDAD 5: Momento de Consuelo Nocturno
        TA5Activity(
            title: "Momento de Consuelo Nocturno",
            fromBook: true,
            description: "Ritual antes de dormir basado en las 'palabras dulces' del libro",
            objective: "Terminar cada día recordando que el amor estuvo presente en todas las emociones",
            materials: [],
            instructions: [
                "Antes de apagar la luz, siéntate junto a tu hijo",
                "Di: 'Hoy fue un día con muchas emociones'",
                "Repasa el día: 'Te amé cuando estuviste [menciona emociones del día]'",
                "Si hubo conflicto: 'Te amé incluso cuando ambos estábamos cansados'",
                "Pregunta: '¿Qué sintió tu corazón hoy?'",
                "Escucha sin juzgar",
                "Termina: 'Los días difíciles terminan. Mañana será un nuevo día. Te amo ahora y para siempre'",
                "Abrazo o contacto físico de despedida"
            ],
            frequency: .daily,
            durationMinutes: "5-10 minutos",
            ageRange: "2-12 años",
            bookReference: "El consuelo se encuentra en el abrazo y las palabras dulces antes de dormir. Los días difíciles terminan.",
            tips: [
                "Hazlo incluso (especialmente) si tuvieron un día difícil",
                "Tu presencia tranquila es más importante que palabras perfectas",
                "Permite que haya silencios, no llenes todo con palabras",
                "Este es el momento de reparación diaria del vínculo"
            ],
            iconName: "moon.stars.fill"
        )
    ]
}

extension TA5Routine {
    static let allRoutines: [TA5Routine] = [
        // RUTINA 1: Matutina
        TA5Routine(
            title: "Rutina Matutina de Validación",
            timeOfDay: .morning,
            description: "Comenzar el día estableciendo que el amor está presente sin importar qué emociones surjan",
            objective: "Crear un ancla emocional matutina de amor incondicional",
            steps: [
                "Despertar con suavidad, sin prisa",
                "Primer contacto: visual y físico (abrazo o mano en el hombro)",
                "Saludo: 'Buenos días, te amo'",
                "Validación matutina: 'Te amo como te sientas al despertar'",
                "Pregunta abierta: '¿Cómo amaneciste hoy?'",
                "Valida la respuesta sin intentar cambiarla",
                "Recordatorio: 'Hoy te amaré en cada emoción'"
            ],
            durationMinutes: "5 minutos",
            emotionsValidated: ["Cansancio", "Malhumor", "Alegría", "Somnolencia"],
            bookPhrases: [
                "Te amo cuando estás cansado",
                "Te amo cuando te sientes así",
                "Ahora y para siempre"
            ],
            tips: [
                "Hazlo antes de hablar de responsabilidades del día",
                "Tu energía tranquila establece el tono del día",
                "Si el niño no quiere hablar, respeta el silencio y valídalo"
            ],
            iconName: "sunrise.fill"
        ),
        
        // RUTINA 2: De Reencuentro
        TA5Routine(
            title: "Rutina de Reencuentro",
            timeOfDay: .reunion,
            description: "Reconectar emocionalmente al volver a encontrarse después de la escuela o trabajo",
            objective: "Restablecer la conexión emocional validando cómo se sintió el día de cada uno",
            steps: [
                "Al llegar a casa, pausa todo por 5 minutos",
                "Saludo con contacto físico (abrazo, choque de manos, lo que prefiera)",
                "Pregunta: '¿Cómo fue tu día? ¿Qué emociones tuviste?'",
                "Escucha activamente cada emoción que mencione",
                "Valida cada una: 'Te amo cuando te sentiste así'",
                "Comparte tus propias emociones del día (humanidad compartida)",
                "Cierre: 'Ahora estamos juntos de nuevo'"
            ],
            durationMinutes: "5-10 minutos",
            emotionsValidated: ["Frustración", "Cansancio", "Alegría", "Tristeza", "Aburrimiento"],
            bookPhrases: [
                "Te amo cuando estás [emoción del día]",
                "Ser humano implica tener días buenos y malos",
                "Estoy aquí contigo"
            ],
            tips: [
                "No interrogues, invita a compartir",
                "Si no quiere hablar, ofrece estar disponible sin presionar",
                "Guarda tu celular durante este momento",
                "Comparte tus emociones también, modela vulnerabilidad"
            ],
            iconName: "house.fill"
        ),
        
        // RUTINA 3: Nocturna
        TA5Routine(
            title: "Rutina Nocturna de Palabras Dulces",
            timeOfDay: .evening,
            description: "Ritual de cierre del día con validación emocional completa",
            objective: "Terminar el día reafirmando el amor incondicional presente en todas las emociones vividas",
            steps: [
                "30 minutos antes de dormir, iniciar rutina de calma",
                "En la cama, sentarse juntos con luz tenue",
                "Repaso emocional: 'Hoy te amé cuando estuviste...'",
                "Mencionar específicamente emociones del día",
                "Incluir las difíciles: 'Te amé cuando estuviste enojado en...'",
                "Pregunta: '¿Qué sintió tu corazón hoy?'",
                "Escucha completa sin juzgar",
                "Cierre: 'Los días difíciles terminan. Te amo ahora y para siempre'",
                "Abrazo de despedida, beso o contacto físico reconfortante"
            ],
            durationMinutes: "10-15 minutos",
            emotionsValidated: ["Todas las emociones del día"],
            bookPhrases: [
                "El consuelo se encuentra en el abrazo y las palabras dulces antes de dormir",
                "Los días difíciles terminan, al igual que los buenos",
                "Te amo ahora y para siempre"
            ],
            tips: [
                "Hazlo incluso si hubo conflictos durante el día",
                "Este es el momento de reparación emocional diaria",
                "Tu presencia calmada es medicina emocional",
                "Permite silencios, no llenes todo con palabras"
            ],
            iconName: "moon.fill"
        ),
        
        // RUTINA 4: Durante Crisis
        TA5Routine(
            title: "Rutina Durante Crisis Emocional",
            timeOfDay: .crisis,
            description: "Protocolo para momentos de emociones intensas (berrinches, llanto, explosiones)",
            objective: "Mantener el amor presente y visible durante la desregulación emocional",
            steps: [
                "Pausa tu propia reactividad: respira",
                "Acércate físicamente si el niño lo permite",
                "No intentes detener la emoción, acompáñala",
                "Frase de validación: 'Te amo cuando estás enojado/triste'",
                "Presencia silenciosa si no quiere palabras",
                "Cuando baje la intensidad: 'Estoy aquí contigo'",
                "No des lecciones ni corrijas en este momento",
                "Espera a la calma para conversar si es necesario",
                "Cierre: 'Te amo incluso en los momentos más difíciles'"
            ],
            durationMinutes: "Variable (hasta que pase la crisis)",
            emotionsValidated: ["Ira", "Frustración", "Tristeza intensa", "Desesperación"],
            bookPhrases: [
                "Te amo cuando estás enojado",
                "Te amo cuando lloras y no tienes las palabras",
                "Estoy aquí contigo"
            ],
            tips: [
                "Tu calma es contagiosa, tu reactividad también",
                "No tomes personal la emoción del niño",
                "El objetivo es acompañar, no controlar",
                "La reparación viene después, no durante la crisis"
            ],
            iconName: "bolt.fill"
        ),
        
        // RUTINA 5: Fin de Semana
        TA5Routine(
            title: "Rutina de Conexión de Fin de Semana",
            timeOfDay: .morning,
            description: "Tiempo extendido de conexión para practicar amor incondicional sin prisa",
            objective: "Profundizar la conexión y practicar actividades de validación con tiempo de calidad",
            steps: [
                "Elige un momento del fin de semana sin prisa",
                "Propón: '¿Hacemos tiempo especial juntos?'",
                "Hagan una actividad que el niño elija",
                "Durante la actividad, practica validación espontánea",
                "Observa y nombra emociones que surjan",
                "Si hay frustración en el juego: 'Te amo cuando te frustras'",
                "Si hay alegría: 'Te amo en tu alegría'",
                "Al terminar, reflexionen: '¿Qué emociones tuvimos hoy?'",
                "Cierre: 'Me encantó nuestro tiempo juntos, en todas las emociones'"
            ],
            durationMinutes: "30-60 minutos",
            emotionsValidated: ["Todas las que surjan naturalmente"],
            bookPhrases: [
                "Te amo cuando estás [cualquier emoción]",
                "Me encanta nuestro tiempo juntos",
                "Me encanta tu tiempo a solas (si pide espacio)"
            ],
            tips: [
                "Guarda el celular completamente",
                "Sigue el ritmo e intereses del niño",
                "No fuerces conversaciones profundas, deja que fluyan",
                "El objetivo es presencia de calidad, no cantidad de actividades"
            ],
            iconName: "heart.circle.fill"
        )
    ]
}

extension TA5Reminder {
    static let allReminders: [TA5Reminder] = [
        TA5Reminder(
            title: "Validación Matutina",
            message: "Recuerda validar la primera emoción del día de tu hijo",
            bookQuote: "Te amo cuando te sientes así",
            whenToUse: "Al despertar",
            iconName: "sun.max.fill"
        ),
        TA5Reminder(
            title: "En Momentos Difíciles",
            message: "El amor permanece constante incluso en el conflicto",
            bookQuote: "Te amo cuando estás enojado",
            whenToUse: "Durante conflictos",
            iconName: "heart.fill"
        ),
        TA5Reminder(
            title: "Palabras Dulces",
            message: "No olvides el ritual de palabras dulces antes de dormir",
            bookQuote: "Los días difíciles terminan. Te amo ahora y para siempre",
            whenToUse: "Antes de dormir",
            iconName: "moon.stars.fill"
        ),
        TA5Reminder(
            title: "Humanidad Compartida",
            message: "Los adultos también tienen emociones difíciles",
            bookQuote: "Te amo incluso cuando yo estoy cansada o me enfado",
            whenToUse: "Cuando tú estés desbordado",
            iconName: "person.2.fill"
        ),
        TA5Reminder(
            title: "Todas las Emociones",
            message: "Cada emoción de tu hijo es válida y merece amor",
            bookQuote: "Todo el mundo tiene emociones",
            whenToUse: "Durante el día",
            iconName: "circle.grid.cross.fill"
        )
    ]
}

