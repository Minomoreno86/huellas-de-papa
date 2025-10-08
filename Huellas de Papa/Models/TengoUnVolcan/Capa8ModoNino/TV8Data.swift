import Foundation

/// Datos consolidados de la Capa 8: Modo Niño
/// El cuento "Tengo un Volcán" de Míriam Tirado adaptado para la app
struct TV8Data {
    
    // MARK: - El Cuento de Alba (Basado en el libro de Míriam Tirado)
    static let storyChapters: [TV8StoryChapter] = [
        TV8StoryChapter(
            chapterNumber: 1,
            title: "Alba y su Secreto",
            narrative: """
            Alba no lo sabía, pero dentro de ella había algo especial. Algo que estaba escondido entre su ombligo y sus costillas.
            
            Era un volcán.
            
            Sí, un volcán de verdad, con fuego y todo. Pero Alba no sabía que estaba ahí. Hasta que un día...
            """,
            illustration: "figure.stand",
            emotion: "Curiosidad",
            learningPoint: "Todos tenemos un volcán dentro. Está entre el ombligo y las costillas.",
            interactiveQuestion: "¿Dónde crees que está TU volcán? Pon tu mano ahí."
        ),
        
        TV8StoryChapter(
            chapterNumber: 2,
            title: "El Volcán se Enciende",
            narrative: """
            A veces, cuando alguien le quitaba un juguete sin preguntar, o cuando algo no le salía bien, Alba sentía un calor extraño.
            
            El calor empezaba en su barriga y subía, subía, subía. Sus manos se cerraban en puños. Su cara se ponía roja. Su respiración se volvía rápida.
            
            Y entonces... ¡BOOM! El volcán explotaba.
            
            Alba gritaba, pataleaba, lloraba. El fuego lo quemaba todo. Y después, Alba se sentía asustada y triste.
            """,
            illustration: "flame.fill",
            emotion: "Rabia",
            learningPoint: "El volcán se enciende cuando nos enojamos. Empieza como un calor en la barriga.",
            interactiveQuestion: "¿Has sentido ese calor cuando te enojas? ¿Qué pasa en tu cuerpo?"
        ),
        
        TV8StoryChapter(
            chapterNumber: 3,
            title: "El Hada Pequeñita",
            narrative: """
            Una noche, mientras Alba dormía, un hada muy pequeñita voló hasta su oído.
            
            El hada susurró: "Alba, tengo un secreto para ti. Ese volcán que tienes dentro... yo puedo enseñarte qué hacer cuando se encienda."
            
            "¿De verdad?" preguntó Alba en su sueño.
            
            "De verdad," dijo el hada sonriendo. "Es muy sencillo. Cuando sientas el calor del volcán, vas a hacer dos cosas mágicas."
            """,
            illustration: "sparkles",
            emotion: "Esperanza",
            learningPoint: "El Hada del Volcán nos enseña cómo calmarnos.",
            interactiveQuestion: "¿Quieres saber qué le enseñó el hada?"
        ),
        
        TV8StoryChapter(
            chapterNumber: 4,
            title: "El Truco del Hada",
            narrative: """
            "Primero," dijo el hada, "vas a oler una flor. La flor más bonita que puedas imaginar. Huele profundo por tu nariz... así."
            
            "Segundo," continuó el hada, "vas a apagar una vela. Como las de un pastel de cumpleaños. Sopla despacio por tu boca... así."
            
            "¿Y eso es todo?" preguntó Alba.
            
            "Eso es todo," sonrió el hada. "Huele la flor, apaga la vela. Una y otra vez. Y verás cómo el calor del volcán empieza a bajar."
            """,
            illustration: "wind",
            emotion: "Aprendizaje",
            learningPoint: "La respiración es el poder secreto para calmar el volcán: Huele la flor, apaga la vela.",
            interactiveQuestion: "¿Probamos juntos? Huele la flor... Apaga la vela..."
        ),
        
        TV8StoryChapter(
            chapterNumber: 5,
            title: "Alba Prueba el Truco",
            narrative: """
            Al día siguiente, Alba estaba jugando cuando su hermano pequeño, sin querer, tiró su torre de bloques.
            
            Alba sintió el calor. El calor que sube desde la barriga. Sus manos empezaron a cerrarse...
            
            Pero entonces recordó al hada.
            
            "Huele la flor," se dijo Alba. Inspiró profundo por la nariz.
            
            "Apaga la vela," susurró. Sopló despacio por la boca.
            
            Y pasó algo mágico. El calor empezó a bajar. El volcán no explotó.
            
            Alba pudo decir con voz tranquila: "Fue un accidente. Pero me molesta que tiraste mi torre."
            """,
            illustration: "checkmark.circle.fill",
            emotion: "Logro",
            learningPoint: "Cuando usamos las herramientas, podemos calmar el volcán antes de que explote.",
            interactiveQuestion: "¿Alguna vez has calmado tu volcán tú solo/a?"
        ),
        
        TV8StoryChapter(
            chapterNumber: 6,
            title: "El Volcán es Parte de Ti",
            narrative: """
            Esa noche, el hada volvió.
            
            "Lo hiciste muy bien hoy, Alba," dijo el hada.
            
            "Pero... ¿mi volcán se va a ir?" preguntó Alba.
            
            "No," respondió el hada con dulzura. "El volcán es parte de ti, Alba. Siempre estará ahí. Pero ahora sabes cómo cuidarlo."
            
            "El volcán no eres TÚ. Tú eres Alba: amable, divertida, creativa. El volcán es solo una parte, y ahora eres su domadora."
            
            Alba sonrió. Ya no le daba miedo su volcán. Ahora sabía qué hacer cuando se encendiera.
            """,
            illustration: "heart.fill",
            emotion: "Aceptación",
            learningPoint: "El volcán es parte de nosotros, pero no nos define. Podemos aprender a cuidarlo.",
            interactiveQuestion: "¿Entiendes que tu volcán no es malo? Solo necesita cuidado."
        ),
        
        TV8StoryChapter(
            chapterNumber: 7,
            title: "Alba Comparte su Secreto",
            narrative: """
            Alba les contó a sus amigos sobre el hada y el volcán.
            
            "Yo también tengo un volcán," dijo su amigo Lucas.
            
            "¡Y yo!" dijo Sofía.
            
            "¡Todos tenemos uno!" dijeron juntos.
            
            Y desde ese día, cuando alguno sentía su volcán encenderse, se decían: "Huele la flor, apaga la vela."
            
            Y el hada, desde el cielo, sonreía viendo a todos los niños cuidando de sus volcanes.
            
            FIN
            """,
            illustration: "person.3.fill",
            emotion: "Comunidad",
            learningPoint: "TODOS tenemos volcanes. No estás solo/a. Podemos ayudarnos unos a otros.",
            interactiveQuestion: "¿A quién le vas a contar sobre tu volcán?"
        )
    ]
    
    // MARK: - Juegos Basados en la Guía Pedagógica
    static let games: [TV8Game] = [
        TV8Game(
            title: "Hadas y Volcanes",
            description: "El juego de persecución del libro donde los volcanes se transforman en hadas",
            fromBookActivity: "Guía pedagógica: Actividad 'Hadas y Volcanes'",
            instructions: [
                "1. Algunos son Volcanes 🌋, otros son Hadas ✨",
                "2. Las Hadas persiguen a los Volcanes",
                "3. Cuando un Hada atrapa a un Volcán, ese Volcán se transforma en Hada",
                "4. ¡El objetivo es que TODOS sean Hadas!",
                "5. Cuando todos sean Hadas, se sientan y respiran juntos: 'Huele la flor, apaga la vela' (5 veces)"
            ],
            durationMinutes: 20,
            ageRange: "4+ años",
            toolPracticed: "El Botón de Pausa (Respiración)",
            iconName: "figure.run",
            color: "purple"
        ),
        
        TV8Game(
            title: "¡Mi Volcán Explota!",
            description: "Teatralización de cómo se siente cuando el volcán echa fuego",
            fromBookActivity: "Guía pedagógica: Actividad '¡Cuando el volcán se enciende!'",
            instructions: [
                "1. Todos juntos, van a actuar cómo se siente cuando su volcán explota",
                "2. Pueden gritar (en un lugar seguro)",
                "3. Pueden saltar, correr, hacer muecas",
                "4. ¡Dejen salir toda la energía del volcán!",
                "5. Después, se sientan y respiran: 'Huele la flor, apaga la vela' para calmarse"
            ],
            durationMinutes: 15,
            ageRange: "4+ años",
            toolPracticed: "Reconocer señales físicas del volcán",
            iconName: "tornado",
            color: "red"
        ),
        
        TV8Game(
            title: "Colorea tu Hada",
            description: "Crea y decora tu propia Hada del Volcán",
            fromBookActivity: "Guía pedagógica: Actividad 'Soy el Hada del Volcán'",
            instructions: [
                "1. Dibuja o imprime la plantilla del hada",
                "2. Coloréala con tus colores favoritos",
                "3. Puedes ponerle brillantina, pegatinas, lo que quieras",
                "4. Pégala en un palito o guárdala en tu mochila",
                "5. Cuando tu volcán se encienda, toma tu Hada y respira: 'Huele la flor, apaga la vela'"
            ],
            durationMinutes: 30,
            ageRange: "5+ años",
            toolPracticed: "El Botón de Pausa",
            iconName: "paintbrush.fill",
            color: "mint"
        )
    ]
    
    // MARK: - Actividades Creativas
    static let activities: [TV8Activity] = [
        TV8Activity(
            title: "Dibuja Tu Volcán",
            description: "Dibuja cómo es TU volcán por dentro",
            materials: ["Papel", "Colores o crayones"],
            steps: [
                "1. Dibuja un volcán grande",
                "2. Píntalo de los colores que sientes cuando te enojas",
                "3. Escribe o dibuja qué hace que tu volcán se encienda",
                "4. Dibuja al Hada cerca del volcán, cuidándolo"
            ],
            ageRange: "4+ años",
            iconName: "paintpalette.fill"
        ),
        
        TV8Activity(
            title: "El Mapa de Mi Cuerpo",
            description: "Dibuja dónde sientes tu volcán en tu cuerpo",
            materials: ["Papel", "Colores"],
            steps: [
                "1. Dibuja tu cuerpo (puede ser un muñequito simple)",
                "2. Marca con rojo donde sientes calor cuando te enojas",
                "3. Marca con azul donde sientes la calma cuando respiras",
                "4. Muéstrale a papá/mamá tu mapa del volcán"
            ],
            ageRange: "5+ años",
            iconName: "figure.stand"
        ),
        
        TV8Activity(
            title: "Mis Nubes de Humo",
            description: "Dibuja tus nubes oscuras y tus nubes claras",
            materials: ["Papel", "Marcadores negros y de colores"],
            steps: [
                "1. Dibuja nubes oscuras (negras) y escribe pensamientos que te enojan más: 'Siempre me pasa', 'Lo hace a propósito'",
                "2. Dibuja nubes claras (colores suaves) y escribe pensamientos que te calman: 'Esta vez sí, pero no siempre', 'Fue un accidente'",
                "3. Táchale las nubes oscuras",
                "4. Pon estrellas en las nubes claras"
            ],
            ageRange: "6+ años (con ayuda de adulto)",
            iconName: "cloud.fill"
        )
    ]
}

