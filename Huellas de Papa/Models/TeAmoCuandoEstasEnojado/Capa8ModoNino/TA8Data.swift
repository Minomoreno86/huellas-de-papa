import Foundation

/// Datos de la Capa 8 - Modo Niño
/// Contenido interactivo para que el NIÑO explore el libro
/// Basado en "¡Te amo cuando estás enojado!" de Erin Winters

extension TA8StoryChapter {
    static let allChapters: [TA8StoryChapter] = [
        TA8StoryChapter(
            chapterNumber: 1,
            title: "Cuando Estás Enojado",
            narrative: "A veces te sientes muy enojado. Tu cara se pone roja, tus manos se aprietan, y quieres gritar muy fuerte. ¿Sabes qué? ¡Te amo cuando estás enojado!",
            illustration: "flame.fill",
            emotion: "Enojado",
            lovePhrase: "Te amo cuando estás enojado",
            interactiveQuestion: "¿Tú también te has sentido enojado alguna vez? ¿Qué haces cuando te enojas?"
        ),
        TA8StoryChapter(
            chapterNumber: 2,
            title: "Cuando Estás Triste",
            narrative: "Hay días en que te sientes triste. Tal vez lloras, o tu corazón se siente pesado. Tus lágrimas mojan tus mejillas. ¿Sabes qué? ¡Te amo cuando estás triste!",
            illustration: "cloud.rain.fill",
            emotion: "Triste",
            lovePhrase: "Te amo cuando estás triste",
            interactiveQuestion: "¿Cuándo fue la última vez que te sentiste triste? ¿Qué te ayudó a sentirte mejor?"
        ),
        TA8StoryChapter(
            chapterNumber: 3,
            title: "En Tu Alegría",
            narrative: "¡Cuando estás feliz, tu sonrisa ilumina todo! Saltas, ríes, juegas y tu corazón está lleno de alegría. ¿Sabes qué? ¡Te amo en tu alegría!",
            illustration: "sun.max.fill",
            emotion: "Alegre",
            lovePhrase: "Te amo en tu alegría",
            interactiveQuestion: "¿Qué cosas te hacen sentir muy feliz? ¿Cuándo fue la última vez que saltaste de alegría?"
        ),
        TA8StoryChapter(
            chapterNumber: 4,
            title: "Cuando Lloras sin Palabras",
            narrative: "A veces lloras pero no tienes las palabras para decir lo que sientes. Tu boca quiere hablar pero solo salen lágrimas. Está bien. ¿Sabes qué? ¡Te amo cuando lloras y no tienes palabras!",
            illustration: "drop.fill",
            emotion: "Sin palabras",
            lovePhrase: "Te amo cuando lloras y no tienes las palabras",
            interactiveQuestion: "¿Alguna vez has sentido algo muy fuerte pero no sabías cómo explicarlo?"
        ),
        TA8StoryChapter(
            chapterNumber: 5,
            title: "Cuando Necesitas Estar Solo",
            narrative: "Hay momentos en que necesitas estar solo en tu habitación. Necesitas tu espacio especial, tu tiempo para ti. Y eso está perfecto. ¿Sabes qué? ¡Te amo cuando necesitas estar solo! Me encanta tu tiempo a solas.",
            illustration: "door.left.hand.closed",
            emotion: "Necesito espacio",
            lovePhrase: "Me encanta tu tiempo a solas",
            interactiveQuestion: "¿Te gusta tener tiempo para ti solo a veces? ¿Qué haces cuando quieres estar solo?"
        ),
        TA8StoryChapter(
            chapterNumber: 6,
            title: "Cuando Tenemos Días Difíciles",
            narrative: "Algunos días son difíciles. Tú estás cansado, yo estoy cansado. Ambos nos sentimos derrotados. Pero ¿sabes qué? Los días difíciles terminan. Y mi amor por ti nunca, nunca cambia. Te amo ahora y para siempre.",
            illustration: "heart.circle.fill",
            emotion: "Cansado",
            lovePhrase: "Te amo ahora y para siempre",
            interactiveQuestion: "¿Recuerdas algún día difícil? ¿Cómo terminó ese día?"
        )
    ]
}

extension TA8Game {
    static let allGames: [TA8Game] = [
        TA8Game(
            title: "Adivina Mi Emoción",
            gameDescription: "Juego de caras y adivinanzas con todas las emociones del libro",
            objective: "Aprender a reconocer emociones en uno mismo y en otros",
            instructions: [
                "Un jugador hace una cara de una emoción (enojado, triste, alegre, etc.)",
                "El otro jugador adivina qué emoción es",
                "Cuando adivine, ambos dicen juntos: '¡Te amo cuando estás [emoción]!'",
                "Intercambian turnos",
                "Pueden usar las 8 emociones del libro"
            ],
            durationMinutes: 10,
            ageRange: "3-8 años",
            emotionsPracticed: ["Enojado", "Triste", "Alegre", "Melancólico", "Cansado", "Frustrado", "Apasionado", "Tranquilo"],
            bookBasis: "Basado en las emociones del libro",
            iconName: "face.smiling.fill",
            color: "yellow"
        ),
        
        TA8Game(
            title: "El Espejo Mágico",
            gameDescription: "Practicar todas las emociones frente al espejo con amor",
            objective: "Normalizar todas las expresiones emocionales como válidas",
            instructions: [
                "Párate frente a un espejo con tu papá o mamá",
                "Practica hacer caras de cada emoción",
                "Después de cada cara, di: 'Me amo cuando estoy [emoción]'",
                "Tu papá o mamá dice: 'Te amo cuando estás [emoción]'",
                "Pueden tomar fotos divertidas si quieren"
            ],
            durationMinutes: 10,
            ageRange: "4-10 años",
            emotionsPracticed: ["Todas las emociones"],
            bookBasis: "Actividad del Espejo de Emociones de Capa 5",
            iconName: "rectangle.portrait.fill",
            color: "purple"
        ),
        
        TA8Game(
            title: "Pinta Tu Emoción",
            gameDescription: "Dibuja o colorea cómo se siente cada emoción",
            objective: "Expresar emociones a través del arte",
            instructions: [
                "Piensa en una emoción que sentiste hoy",
                "Dibújala con colores que representen cómo se sintió",
                "Muéstrale tu dibujo a papá o mamá",
                "Escucha cuando te digan: 'Te amo cuando te sientes así'",
                "Guarden los dibujos en tu álbum de emociones"
            ],
            durationMinutes: 15,
            ageRange: "3-10 años",
            emotionsPracticed: ["Todas"],
            bookBasis: "Expresión creativa de emociones",
            iconName: "paintpalette.fill",
            color: "rainbow"
        ),
        
        TA8Game(
            title: "Teatro de Emociones",
            gameDescription: "Actúa pequeñas escenas del libro con diferentes emociones",
            objective: "Practicar emociones de forma segura a través del juego de roles",
            instructions: [
                "Elige una emoción del libro",
                "Actúa una pequeña escena donde sientes esa emoción",
                "Tu papá o mamá responde con la frase del libro",
                "Intercambian roles: ahora papá/mamá actúa",
                "Tú respondes: '¡Te amo cuando estás [emoción]!'"
            ],
            durationMinutes: 15,
            ageRange: "4-10 años",
            emotionsPracticed: ["Enojado", "Triste", "Alegre", "Cansado"],
            bookBasis: "Escenas del libro dramatizadas",
            iconName: "theatermasks.fill",
            color: "purple"
        )
    ]
}

extension TA8Activity {
    static let allActivities: [TA8Activity] = [
        TA8Activity(
            title: "Mi Libro de Emociones",
            activityDescription: "Crea tu propio libro de emociones con dibujos y fotos",
            materials: ["Hojas de papel", "Colores", "Pegamento", "Fotos (opcional)"],
            steps: [
                "Haz una página para cada emoción",
                "Dibuja cómo se ve esa emoción",
                "Pega una foto tuya con esa cara si quieres",
                "Papá o mamá escribe: 'Te amo cuando estás [emoción]'",
                "Decoren el libro juntos"
            ],
            funFactor: 5,
            ageRange: "3-8 años",
            emotionFocus: "Todas las emociones",
            iconName: "book.pages.fill"
        ),
        
        TA8Activity(
            title: "Memoria de Emociones",
            activityDescription: "Juego de memoria con tarjetas de emociones",
            materials: ["Tarjetas con caras de emociones"],
            steps: [
                "Crea pares de tarjetas con la misma emoción",
                "Voltea las tarjetas boca abajo",
                "Encuentra los pares de emociones",
                "Cuando encuentres un par, di: '¡Te amo cuando estás [emoción]!'",
                "Gana quien diga más frases de amor"
            ],
            funFactor: 4,
            ageRange: "4-8 años",
            emotionFocus: "Reconocimiento de emociones",
            iconName: "square.grid.2x2.fill"
        ),
        
        TA8Activity(
            title: "El Baúl de los Días Difíciles",
            activityDescription: "Guarda notas de días difíciles que ya pasaron",
            materials: ["Caja especial", "Papel", "Colores"],
            steps: [
                "Decora una caja especial con papá o mamá",
                "Cuando tengas un día difícil, escribe o dibuja sobre él",
                "Ponlo en el baúl",
                "Cada mes, abran el baúl juntos",
                "Vean que todos esos días difíciles pasaron",
                "Papá o mamá dice: 'Te amé en cada uno de estos días'"
            ],
            funFactor: 4,
            ageRange: "5-10 años",
            emotionFocus: "Perspectiva temporal",
            iconName: "archivebox.fill"
        )
    ]
}

