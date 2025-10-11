import SwiftUI

/// Vista de mini-juegos interactivos
struct BM8GamesView: View {
    let games = gamesData
    @State private var selectedGame: BM8Game?
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                ForEach(games) { game in
                    Button(action: {
                        selectedGame = game
                    }) {
                        BM8GameCard(game: game)
                    }
                }
            }
            .padding()
        }
        .background(Color(.systemGroupedBackground))
        .navigationTitle("Juegos")
        .sheet(item: $selectedGame) { game in
            BM8GameDetailView(game: game)
        }
    }
}

// MARK: - BM8 Game Card
struct BM8GameCard: View {
    let game: BM8Game
    
    var body: some View {
        HStack(spacing: 16) {
            Image(systemName: game.icon)
                .font(.system(size: 40))
                .foregroundColor(.white)
                .frame(width: 70, height: 70)
                .background(
                    RoundedRectangle(cornerRadius: 14)
                        .fill(colorFromString(game.color))
                )
            
            VStack(alignment: .leading, spacing: 8) {
                Text(game.title)
                    .font(.headline)
                    .fontWeight(.semibold)
                    .foregroundColor(.primary)
                    .lineLimit(2)
                
                Text(game.description)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                    .lineLimit(2)
                
                Label(game.ageRange, systemImage: "person.fill")
                    .font(.caption)
                    .foregroundColor(.purple)
            }
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 18)
                .fill(Color(.systemBackground))
                .shadow(color: colorFromString(game.color).opacity(0.2), radius: 8, x: 0, y: 4)
        )
    }
    
    private func colorFromString(_ colorString: String) -> Color {
        switch colorString {
        case "purple": return .purple
        case "pink": return .pink
        case "blue": return .blue
        case "mint": return .mint
        case "orange": return .orange
        default: return .purple
        }
    }
}

// MARK: - BM8 Game Detail View
struct BM8GameDetailView: View {
    let game: BM8Game
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 30) {
                    Image(systemName: game.icon)
                        .font(.system(size: 80))
                        .foregroundColor(colorFromString(game.color))
                        .padding(40)
                        .background(
                            Circle()
                                .fill(colorFromString(game.color).opacity(0.2))
                        )
                    
                    Text(game.title)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.primary)
                        .multilineTextAlignment(.center)
                    
                    Text(game.description)
                        .font(.title3)
                        .foregroundColor(.secondary)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal)
                    
                    VStack(alignment: .leading, spacing: 16) {
                        Label("Cómo Jugar", systemImage: "info.circle.fill")
                            .font(.headline)
                            .foregroundColor(colorFromString(game.color))
                        
                        Text(game.instructions)
                            .font(.body)
                            .foregroundColor(.primary)
                            .fixedSize(horizontal: false, vertical: true)
                    }
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(
                        RoundedRectangle(cornerRadius: 16)
                            .fill(Color(.secondarySystemGroupedBackground))
                    )
                    
                    Button(action: {
                        triggerHaptic()
                    }) {
                        Label("¡Jugar!", systemImage: "play.fill")
                            .font(.title3)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(
                                RoundedRectangle(cornerRadius: 16)
                                    .fill(
                                        LinearGradient(
                                            gradient: Gradient(colors: [colorFromString(game.color), colorFromString(game.color).opacity(0.7)]),
                                            startPoint: .leading,
                                            endPoint: .trailing
                                        )
                                    )
                            )
                    }
                }
                .padding()
            }
            .background(Color(.systemGroupedBackground))
            .navigationTitle("Juego")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Cerrar") {
                        dismiss()
                    }
                }
            }
        }
    }
    
    private func colorFromString(_ colorString: String) -> Color {
        switch colorString {
        case "purple": return .purple
        case "pink": return .pink
        case "blue": return .blue
        case "mint": return .mint
        case "orange": return .orange
        default: return .purple
        }
    }
    
    private func triggerHaptic() {
        #if !os(macOS)
        let impactFeedback = UIImpactFeedbackGenerator(style: .medium)
        impactFeedback.impactOccurred()
        #endif
    }
}

// MARK: - GAMES DATA
let gamesData: [BM8Game] = [
    BM8Game(
        number: 1,
        title: "Encuentra los Abrazos Escondidos",
        icon: "figure.2.arms.open",
        color: "purple",
        description: "Juego de búsqueda física donde tu hijo debe encontrar corazones/abrazos escondidos en la casa",
        instructions: """
        PREPARACIÓN (5 minutos antes):
        Mientras tu hijo no mira, esconde 10-15 papelitos con corazones dibujados o stickers de corazones por toda la casa. En lugares accesibles: debajo de almohadas, detrás de puertas, en cajones, bajo la mesa.
        
        CÓMO JUGAR:
        1. Dile a tu hijo: "Escondí 15 abrazos mágicos por toda la casa. Cada vez que encuentres uno, vienes corriendo y me das un abrazo REAL. ¿Listo para buscar?"
        
        2. Cuando encuentre un corazón, debe correr hacia ti. Tú abres tus brazos y le das un abrazo fuerte de 5 segundos mínimo. Di: "¡Encontraste un abrazo! Aquí está tu abrazo real"
        
        3. Después del abrazo, busca el siguiente. Repite: encuentra corazón → abrazo real → busca otro
        
        4. Cuenta cuántos lleva. Celebra cada hallazgo: "¡Ya van 5! ¡Eres un experto buscador de amor!"
        
        5. Cuando encuentre todos, celebración grande: "¡Encontraste TODOS los abrazos! Y recibiste 15 abrazos reales. ¡Tu corazón debe estar muy lleno!"
        
        VARIACIONES:
        - Con niños pequeños: esconde solo 5-7
        - Con niños grandes: esconde en lugares más difíciles
        - Dale pistas: "está cerca de algo donde duermes"
        - Usa temporizador: "¿cuántos puedes encontrar en 5 minutos?"
        
        MENSAJE DEL JUEGO:
        Los abrazos son tesoros. Buscarlos es divertido. Recibirlos es necesario. En tu familia, los abrazos abundan y están siempre disponibles.
        """,
        ageRange: "2-7 años",
        category: .attachment
    ),
    
    BM8Game(
        number: 2,
        title: "El Juego de las Caras y Emociones",
        icon: "face.smiling.fill",
        color: "pink",
        description: "Juego para aprender a reconocer, nombrar y expresar diferentes emociones a través de caras",
        instructions: """
        MATERIALES SIMPLES:
        - Espejo grande donde se vean ambos
        - Opcional: imprimir o dibujar tarjetas con caritas de emociones
        
        CÓMO JUGAR - VERSIÓN 1 (Imitación):
        1. Siéntense frente al espejo juntos. Di: "Vamos a hacer caras de diferentes emociones. Yo hago una cara y tú la copias. ¿Listo?"
        
        2. Haz una cara de FELICIDAD exagerada: sonrisa enorme, ojos brillantes. Dile: "Esta es mi cara de MUY FELIZ. ¿Puedes hacerla tú?" Observen juntos en el espejo
        
        3. Luego tristeza: cara larga, boca hacia abajo, ojos tristes. "Esta es mi cara de TRISTE". Que la copie
        
        4. Continúa con: ENOJADO (ceño fruncido, boca apretada), ASUSTADO (ojos grandes, boca abierta), SORPRENDIDO, CANSADO, ABURRIDO
        
        5. Después de cada emoción, pregunta: "¿Cuándo te has sentido así? ¿Qué te hace sentir [emoción]?"
        
        VERSIÓN 2 (Adivinanza):
        1. Tú haces una cara de una emoción SIN decir cuál es. Tu hijo adivina: "¿Estás feliz? ¿Triste?"
        
        2. Cuando adivine, pregunta: "¿Cómo lo supiste?" Esto enseña a leer señales faciales
        
        3. Cambien roles: él hace caras, tú adivinas. Exagera tus adivinanzas para hacerlo divertido
        
        VERSIÓN 3 (Situaciones):
        1. Describe situaciones: "Imagina que se rompió tu juguete favorito. ¿Qué cara harías?" Que haga la cara
        
        2. "Imagina que papá llegó con un regalo sorpresa. ¿Qué cara?" 
        
        3. Esto conecta situaciones con emociones faciales
        
        MENSAJE DEL JUEGO:
        Todas las emociones tienen una cara. Todas son válidas. Reconocer emociones en caras te ayuda a entender a otros y a ti mismo. Es inteligencia emocional jugando.
        """,
        ageRange: "3-7 años",
        category: .emotions
    ),
    
    BM8Game(
        number: 3,
        title: "¿Qué Necesita el Bebé?",
        icon: "speaker.wave.2.fill",
        color: "blue",
        description: "Juego educativo donde identifican diferentes tipos de llanto y aprenden que el llanto es comunicación",
        instructions: """
        PREPARACIÓN:
        Este juego enseña que el LLANTO es COMUNICACIÓN, no manipulación. Es especialmente útil si tienes un bebé pequeño O si planean tener otro bebé.
        
        CÓMO JUGAR - CON BEBÉ REAL:
        1. Cuando tu bebé (hermano menor) llore, involucra a tu hijo mayor. Di: "Escucha. ¿Qué crees que necesita el bebé? ¿Hambre? ¿Sueño? ¿Abrazo?"
        
        2. Deja que adivine. Luego explica: "Vamos a ver. Yo creo que tiene hambre porque hace este ruido. Vamos a ofrecerle leche y verificamos"
        
        3. Si era correcto: "¡Tenías razón! Tenía hambre. El bebé nos HABLA con su llanto". Si no: "Era sueño, no hambre. A veces cuesta adivinar. Seguimos aprendiendo juntos"
        
        4. Esto enseña: El llanto tiene significado. No es manipulación. Es el lenguaje del bebé
        
        CÓMO JUGAR - SIN BEBÉ (con muñeco):
        1. Usa un muñeco o peluche como "bebé". Tú haces diferentes llantos (imítalos)
        
        2. "Waaa, waaa, waaa" (llanto rítmico) = hambre
        "Eh, eh, eh" (quejido) = sueño  
        "WAAAH" (grito agudo) = dolor
        "Mmmm, mmmm" (quejido bajo) = necesita abrazo
        
        3. Tu hijo adivina qué necesita el "bebé" y actúa: le da biberón de mentira, lo mece, lo abraza
        
        4. Celebra cada acierto: "¡Correcto! Le diste justo lo que necesitaba"
        
        VERSIÓN AVANZADA (Role-play completo):
        1. Tu hijo es el "papá/mamá" y el muñeco es su "bebé"
        2. Tú narras situaciones: "Es de noche. Tu bebé llora. ¿Qué haces?"
        3. Observa qué hace. ¿Va rápido? ¿Lo consuela? Esto revela lo que ha aprendido
        4. Modela respuestas empáticas si hace falta
        
        MENSAJE DEL JUEGO:
        El llanto es el lenguaje de los bebés. No es manipulación ni "malcriadez". Es comunicación de necesidades reales. Responder rápido es correcto y amoroso.
        """,
        ageRange: "3-8 años",
        category: .recognition
    ),
    
    BM8Game(
        number: 4,
        title: "Jardín del Apego Mágico",
        icon: "leaf.fill",
        color: "mint",
        description: "Juego simbólico donde cada acción de amor 'planta' una flor en su jardín emocional",
        instructions: """
        MATERIALES:
        - Cartulina grande verde (el jardín)
        - Flores de papel de colores (pueden comprar o hacer ustedes)
        - Pegamento o cinta adhesiva
        - Marcadores
        
        PREPARACIÓN:
        1. Dibujen juntos un jardín en la cartulina: pasto, sol, nubes, tierra
        2. Déjenlo mayormente vacío. Ahí irán plantando las flores
        3. Cuelguen el jardín en un lugar visible: su cuarto o la sala
        
        CÓMO JUGAR:
        1. Explica: "Este es tu Jardín del Apego. Cada vez que haces algo amoroso, plantas una flor. Vamos a ver cuánto puede crecer tu jardín"
        
        2. ¿Qué cuenta como "algo amoroso"?
        - Dar un abrazo espontáneo
        - Ayudar sin que se lo pidan
        - Compartir un juguete
        - Decir "te amo"
        - Pedir perdón cuando se equivoca
        - Consolar a alguien triste
        - Dar las gracias
        - Usar palabras amables
        
        3. Cuando haga algo amoroso, RECONÓCELO inmediatamente: "Acabas de compartir tu juguete. Eso fue muy amoroso. ¡Puedes plantar una flor en tu jardín!"
        
        4. Vayan juntos al jardín. Que él elija una flor de papel y la pegue donde quiera. Mientras la pega, di: "Mira cómo crece tu jardín de amor. Estoy muy orgulloso"
        
        5. TÚ también puedes tener tu propio jardín. Modela: "Hoy te abracé cuando estabas triste. Voy a plantar una flor en MI jardín también"
        
        6. NO uses el jardín como castigo. No digas: "Como te portaste mal, no plantas flor". El jardín es SOLO para reconocer lo positivo, nunca para castigar lo negativo
        
        7. Cuando el jardín esté lleno (unas 20-30 flores), celebren: "¡Tu jardín está lleno! ¡Eres un experto en amor!" Tomen una foto, luego pueden empezar un jardín nuevo
        
        VARIACIONES:
        - Cada color de flor puede significar algo: roja = abrazo, amarilla = palabra amable, azul = ayudar
        - Pueden hacer un "jardín familiar" donde todos plantan en el mismo jardín
        - Agreguen mariposas, abejas, pajaritos cuando logren hitos especiales
        
        MENSAJE DEL JUEGO:
        Las acciones amorosas "siembran" amor. Mientras más amor das, más crece. El amor es como un jardín: requiere cuidado diario, pero florece hermoso.
        """,
        ageRange: "3-8 años",
        category: .creativity
    ),
    
    BM8Game(
        number: 5,
        title: "Estrellitas de Calma Nocturna",
        icon: "star.fill",
        color: "orange",
        description: "Juego relajante antes de dormir que ayuda a la transición del día a la noche con calma",
        instructions: """
        PREPARACIÓN:
        - Oscurece el cuarto pero deja una luz tenue
        - Pueden estar en la cama o en el suelo con mantas
        - Ambiente tranquilo, sin ruidos fuertes
        - Opcional: proyector de estrellas o linterna
        
        CÓMO JUGAR - VERSIÓN FÍSICA:
        1. Acuéstate con tu hijo. Di: "Vamos a recoger las estrellitas del cielo para relajarnos antes de dormir. Cada estrella que 'tocamos' nos ayuda a estar más calmados"
        
        2. Señala al techo (o usa proyector de estrellas). Di: "Mira, ahí hay una estrellita brillante. Vamos a 'tocarla'. Extiende tu mano hacia arriba como si pudieras alcanzarla"
        
        3. Ambos extienden la mano hacia el techo. Di: "Respira profundo mientras tocas la estrella. 1, 2, 3, respiramos juntos" Inhalen profundo, exhalen lento
        
        4. "Muy bien. Recogimos esa estrella y ahora está en tu corazón. Te ayudará a dormir tranquilo. ¿Ves otra estrella?"
        
        5. Repite el proceso: señala estrella → extiende mano → respira profundo → "estrella en el corazón"
        
        6. Hagan esto 5-10 veces. Con cada estrella, habla más suave, más lento, más calmado
        
        VERSIÓN IMAGINARIA (sin proyector):
        1. "Vamos a imaginar que el techo está lleno de estrellas. Cierra tus ojitos. ¿Las ves brillar?"
        
        2. "Voy a contar estrellas y con cada una, respiramos profundo. Lista la primera estrella... respira... la segunda estrella... respira..."
        
        3. Sincroniza tu respiración con la de él. Que sienta tu pecho subir y bajar si están abrazados
        
        VERSIÓN CON MASAJE:
        1. Mientras "recogen estrellas", masajea suavemente: cabecita, bracitos, espalda
        2. "Esta estrella te relaja la cabeza... esta te relaja los brazos..."
        3. Combina respiración + masaje + visualización
        
        MENSAJE DEL JUEGO:
        La respiración profunda calma el cuerpo. La visualización tranquiliza la mente. El contacto físico regula el sistema nervioso. Este juego es meditación disfrazada de magia para niños.
        
        BONUS:
        Muchos niños se duermen durante este juego. Y eso está perfecto. Es su objetivo secreto.
        """,
        ageRange: "2-7 años",
        category: .relaxation
    )
]
