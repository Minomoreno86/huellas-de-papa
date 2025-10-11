import SwiftUI

/// Vista de cuentos interactivos para niños
struct BM8StoriesView: View {
    let stories = storiesData
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                ForEach(stories) { story in
                    NavigationLink(destination: BM8StoryReaderView(story: story)) {
                        BM8StoryCard(story: story)
                    }
                }
            }
            .padding()
        }
        .background(Color(.systemGroupedBackground))
        .navigationTitle("Cuentos")
    }
}

// MARK: - BM8 Story Card
struct BM8StoryCard: View {
    let story: BM8Story
    
    var body: some View {
        HStack(spacing: 16) {
            Image(systemName: story.icon)
                .font(.system(size: 40))
                .foregroundColor(.white)
                .frame(width: 80, height: 80)
                .background(
                    RoundedRectangle(cornerRadius: 16)
                        .fill(story.color.swiftUIColor)
                )
            
            VStack(alignment: .leading, spacing: 8) {
                Text(story.title)
                    .font(.headline)
                    .fontWeight(.bold)
                    .foregroundColor(.primary)
                    .lineLimit(2)
                
                Text(story.moralLesson)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                    .lineLimit(2)
                
                HStack {
                    Label(story.ageRange, systemImage: "person.fill")
                        .font(.caption)
                        .foregroundColor(story.color.swiftUIColor)
                    
                    Spacer()
                    
                    Label("\(story.pages.count) páginas", systemImage: "book.pages")
                        .font(.caption)
                        .foregroundColor(.blue)
                }
            }
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 20)
                .fill(Color(.systemBackground))
                .shadow(color: story.color.swiftUIColor.opacity(0.2), radius: 8, x: 0, y: 4)
        )
    }
}

// MARK: - Story Reader View
struct BM8StoryReaderView: View {
    let story: BM8Story
    @State private var currentPage = 0
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack(spacing: 0) {
            // Page content
            TabView(selection: $currentPage) {
                ForEach(Array(story.pages.enumerated()), id: \.element.id) { index, page in
                    StoryPageView(page: page, storyColor: story.color)
                        .tag(index)
                }
                
                // Final page with moral
                FinalPageView(story: story)
                    .tag(story.pages.count)
            }
            .tabViewStyle(.page(indexDisplayMode: .always))
            .indexViewStyle(.page(backgroundDisplayMode: .always))
            
            // Navigation buttons
            HStack(spacing: 20) {
                if currentPage > 0 {
                    Button(action: {
                        withAnimation {
                            currentPage -= 1
                            triggerHaptic()
                        }
                    }) {
                        Label("Anterior", systemImage: "chevron.left")
                            .font(.headline)
                            .foregroundColor(.blue)
                            .padding()
                    }
                }
                
                Spacer()
                
                if currentPage < story.pages.count {
                    Button(action: {
                        withAnimation {
                            currentPage += 1
                            triggerHaptic()
                        }
                    }) {
                        HStack {
                            Text("Siguiente")
                            Image(systemName: "chevron.right")
                        }
                        .font(.headline)
                        .foregroundColor(.blue)
                        .padding()
                    }
                } else {
                    Button(action: {
                        dismiss()
                    }) {
                        HStack {
                            Text("Finalizar")
                            Image(systemName: "checkmark.circle.fill")
                        }
                        .font(.headline)
                        .foregroundColor(.green)
                        .padding()
                    }
                }
            }
            .padding(.horizontal)
            .padding(.bottom, 10)
        }
        .navigationTitle(story.title)
        .navigationBarTitleDisplayMode(.inline)
    }
    
    private func triggerHaptic() {
        #if !os(macOS)
        let impactFeedback = UIImpactFeedbackGenerator(style: .light)
        impactFeedback.impactOccurred()
        #endif
    }
}

// MARK: - Story Page View
struct StoryPageView: View {
    let page: StoryPage
    let storyColor: StoryColor
    
    var body: some View {
        VStack(spacing: 30) {
            Text("Página \(page.pageNumber)")
                .font(.caption)
                .foregroundColor(.secondary)
                .padding(.top, 20)
            
            Image(systemName: page.illustration)
                .font(.system(size: 100))
                .foregroundColor(colorFromString(page.backgroundColor))
                .padding(40)
                .background(
                    Circle()
                        .fill(colorFromString(page.backgroundColor).opacity(0.2))
                )
            
            Text(page.text)
                .font(.title2)
                .fontWeight(.medium)
                .foregroundColor(.primary)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 30)
            
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(.systemGroupedBackground))
    }
    
    private func colorFromString(_ colorString: String) -> Color {
        switch colorString {
        case "blue": return .blue
        case "pink": return .pink
        case "mint": return .mint
        case "orange": return .orange
        case "purple": return .purple
        case "green": return .green
        case "indigo": return .indigo
        case "yellow": return .yellow
        default: return .blue
        }
    }
}

// MARK: - Final Page View
struct FinalPageView: View {
    let story: BM8Story
    
    var body: some View {
        VStack(spacing: 30) {
            Image(systemName: "star.fill")
                .font(.system(size: 80))
                .foregroundColor(.yellow)
            
            Text("Fin")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(.primary)
            
            VStack(spacing: 16) {
                Text("Lo que aprendimos:")
                    .font(.headline)
                    .foregroundColor(.secondary)
                
                Text(story.moralLesson)
                    .font(.title3)
                    .fontWeight(.medium)
                    .foregroundColor(story.color.swiftUIColor)
                    .multilineTextAlignment(.center)
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 16)
                            .fill(story.color.swiftUIColor.opacity(0.1))
                    )
            }
            .padding(.horizontal, 30)
            
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .padding(.top, 40)
        .background(Color(.systemGroupedBackground))
    }
}

// MARK: - Stories Data
let storiesData: [BM8Story] = [
    // HISTORIA 1: El Osito que Necesitaba Abrazos
    BM8Story(
        number: 1,
        title: "El Osito que Necesitaba Abrazos",
        icon: "heart.fill",
        color: .blue,
        pages: [
            StoryPage(pageNumber: 1, text: "Mira, mi amor, te voy a contar la historia de Bruno, un osito muy especial. Bruno vivía en un bosque enorme con su mamá y su papá. ¿Sabes qué era lo que más le gustaba en el mundo? Los abrazos. Le gustaban incluso más que la miel.", illustration: "figure.walk", backgroundColor: "blue"),
            StoryPage(pageNumber: 2, text: "Cada mañana, cuando el sol salía y los pajaritos comenzaban a cantar, Bruno abría sus ojitos. Y lo primero que hacía era buscar a papá oso. 'Papá, papá, ¿me das un abrazo de buenos días?'. Y papá oso, con una gran sonrisa, lo abrazaba fuerte fuerte.", illustration: "sunrise.fill", backgroundColor: "yellow"),
            StoryPage(pageNumber: 3, text: "'Estos abrazos son mágicos', pensaba Bruno. 'Cuando papá me abraza, siento que puedo hacer cualquier cosa. Siento que estoy seguro. Siento que soy importante'. Los abrazos de papá eran como un superpoder invisible.", illustration: "heart.fill", backgroundColor: "pink"),
            StoryPage(pageNumber: 4, text: "Durante el día, Bruno jugaba con sus amiguitos del bosque. Saltaba, corría, trepaba árboles. A veces se caía y se raspaba las rodillas. Y cuando eso pasaba, Bruno corría directo a buscar... ¿qué crees? ¡Un abrazo de papá!", illustration: "figure.run", backgroundColor: "mint"),
            StoryPage(pageNumber: 5, text: "Papá oso siempre dejaba lo que estaba haciendo. Aunque estuviera buscando miel, aunque estuviera cansado, aunque estuviera ocupado. Los brazos de papá SIEMPRE estaban abiertos para Bruno.", illustration: "figure.2.arms.open", backgroundColor: "blue"),
            StoryPage(pageNumber: 6, text: "Pero un día, algo pasó. El viejo búho del bosque, que se creía muy sabio, le dijo a papá oso: 'Ese osito tuyo está MUY acostumbrado a los brazos. Ya tiene tres años. Deberías dejarlo llorar solo, para que aprenda a ser fuerte e independiente'.", illustration: "exclamationmark.bubble", backgroundColor: "orange"),
            StoryPage(pageNumber: 7, text: "Otros animales del bosque empezaron a opinar también. 'Lo estás malcriando', decía la ardilla. 'Nunca va a ser independiente', decía el castor. 'Tiene que aprender a arreglárselas solo', decía la lechuza. Papá oso se sintió triste y confundido.", illustration: "cloud.fill", backgroundColor: "purple"),
            StoryPage(pageNumber: 8, text: "Esa noche, papá oso observó a Bruno dormido en sus brazos. Sintió el corazoncito de su hijito latiendo tranquilo. Vio su carita llena de paz. Y en ese momento, papá oso entendió la verdad más importante.", illustration: "moon.stars.fill", backgroundColor: "indigo"),
            StoryPage(pageNumber: 9, text: "A la mañana siguiente, cuando Bruno pidió su abrazo de buenos días, papá lo alzó con amor y le dijo: 'Bruno, los abrazos que te doy no son mimos tontos. Son alimento para tu corazón. Cada abrazo te dice: Eres amado. Estás seguro. Vales mucho'.", illustration: "heart.circle.fill", backgroundColor: "pink"),
            StoryPage(pageNumber: 10, text: "'Y ¿sabes qué, hijito?', continuó papá. 'Los ositos que reciben muchos abrazos crecen siendo los MÁS fuertes y valientes. Porque tienen el corazón lleno. No tengas miedo, los abrazos son tu superpoder secreto'.", illustration: "sparkles", backgroundColor: "yellow"),
            StoryPage(pageNumber: 11, text: "Pasaron los años. Bruno siguió recibiendo abrazos de papá todos los días. Sin límite. Sin vergüenza. Sin miedo a las opiniones de otros. Y papá nunca dejó de dárselos, porque sabía que eran importantes.", illustration: "figure.and.child.holdinghands", backgroundColor: "mint"),
            StoryPage(pageNumber: 12, text: "¿Y sabes qué pasó? Bruno creció siendo el oso más cariñoso, valiente, seguro y feliz de todo el bosque. Exploraba sin miedo porque sabía que papá siempre sería su refugio seguro. Los abrazos lo hicieron FUERTE, no débil.", illustration: "star.fill", backgroundColor: "orange"),
            StoryPage(pageNumber: 13, text: "Hoy, Bruno es papá también. Y cuando su hijito le pide abrazos, aunque sean 100 veces al día, Bruno sonríe y lo abraza. Porque aprendió la lección más valiosa: Los abrazos nunca sobran. Los abrazos siempre faltan. Y el amor NUNCA malcría.", illustration: "figure.2", backgroundColor: "blue")
        ],
        moralLesson: "Así como Bruno necesitaba los abrazos de su papá, tú también necesitas los míos. No importa cuántos abrazos te dé, nunca serán demasiados. Los abrazos te hacen fuerte, seguro y valiente. Y yo siempre estaré aquí con mis brazos abiertos para ti.",
        ageRange: "3-7 años"
    ),
    
    // HISTORIA 2: La Cama Grande
    BM8Story(
        number: 2,
        title: "La Cama Grande",
        icon: "bed.double.fill",
        color: .mint,
        pages: [
            StoryPage(pageNumber: 1, text: "Escucha bien, cariño, porque esta historia te va a gustar. Había una vez una conejita llamada Luna que vivía con su mamá y su papá en una casa muy acogedora. ¿Sabes qué tenía de especial esa casa? Una cama ENORME, del tamaño de tres camas juntas.", illustration: "house.fill", backgroundColor: "mint"),
            StoryPage(pageNumber: 2, text: "Desde que Luna era un bebecito chiquitito, apenas del tamaño de tu mano, dormía en esa cama grande junto a sus papás. Luna en el medio, mamá a un lado, papá al otro. Era como dormir entre dos montañas mullidas de amor.", illustration: "bed.double.fill", backgroundColor: "blue"),
            StoryPage(pageNumber: 3, text: "Por las noches, cuando la luna brillaba en el cielo (sí, como su nombre), Luna se acurrucaba cerquita de mamá. Sentía su respiración suave, su calor, su olor familiar. Y se quedaba dormida sintiendo que estaba en el lugar más seguro del mundo.", illustration: "moon.stars.fill", backgroundColor: "indigo"),
            StoryPage(pageNumber: 4, text: "A veces, Luna tenía pesadillas. Soñaba con monstruos o con perderse en el bosque. Pero cuando se despertaba asustada, solo necesitaba extender su patita y SENTIR a mamá o papá ahí. No tenía ni que llorar. Ya estaban ahí. 'Shh, todo está bien, mi vida', susurraba mamá.", illustration: "heart.fill", backgroundColor: "purple"),
            StoryPage(pageNumber: 5, text: "Otras noches, Luna se despertaba con hambre o sed. Pero no tenía que gritar ni llorar mucho tiempo. Papá la escuchaba enseguida. 'Te oí, pequeña. Aquí estoy', decía con voz suave mientras le daba agua o la acercaba a mamá para que mamara.", illustration: "figure.and.child.holdinghands", backgroundColor: "pink"),
            StoryPage(pageNumber: 6, text: "Luna dormía tan bien en la cama grande que cada mañana despertaba feliz, descansada y llena de energía. Y mamá y papá también descansaban mejor, porque no tenían que levantarse tantas veces.", illustration: "sunrise.fill", backgroundColor: "yellow"),
            StoryPage(pageNumber: 7, text: "Pero un día, llegó de visita la abuela coneja. Cuando vio que Luna todavía dormía con sus papás (Luna ya tenía tres años), se preocupó mucho. '¿Todavía duerme con ustedes?', preguntó con cara seria.", illustration: "exclamationmark.bubble.fill", backgroundColor: "orange"),
            StoryPage(pageNumber: 8, text: "'Hija', le dijo la abuela a mamá coneja, 'deberías poner a Luna en su propia habitación YA. Si no, se acostumbrará. Nunca querrá dormir sola. Los niños necesitan independencia. Así es como lo hicimos en mi época'.", illustration: "bubble.left.fill", backgroundColor: "orange"),
            StoryPage(pageNumber: 9, text: "Mamá y papá conejo se miraron. Papá conejo respiró profundo y con respeto pero firmeza le dijo a la abuela: 'Abuela, entendemos tu preocupación. Pero Luna duerme donde se siente segura. Y ahora mismo, ese lugar es nuestra cama'.", illustration: "shield.fill", backgroundColor: "blue"),
            StoryPage(pageNumber: 10, text: "'¿Sabías', continuó papá, 'que en TODO el mundo animal, desde leones hasta elefantes, los bebés duermen con sus padres? Nosotros los conejos también lo hacemos naturalmente. Es biología, no malcriar'.", illustration: "figure.2", backgroundColor: "mint"),
            StoryPage(pageNumber: 11, text: "'Luna dormirá sola cuando esté lista', agregó mamá con calma. 'Puede ser a los cinco años, a los siete, o cuando ella decida. No hay prisa. No hay edad correcta. Cada niño es diferente'. La abuela se quedó pensando.", illustration: "lightbulb.fill", backgroundColor: "purple"),
            StoryPage(pageNumber: 12, text: "Pasaron los meses. Luna seguía durmiendo en la cama grande, feliz y segura. Y una noche, cuando tenía seis años, pasó algo mágico. Luna les dijo a sus papás: 'Creo que quiero probar mi propia camita'.", illustration: "sparkles", backgroundColor: "yellow"),
            StoryPage(pageNumber: 13, text: "Mamá y papá prepararon su camita con sábanas suavecitas. La pusieron cerquita de la cama grande, por si acaso. Esa noche, Luna durmió sola por primera vez. Se sintió orgullosa, valiente y... ¿sabes? Todavía segura, porque sabía que mamá y papá estaban a solo dos saltitos de distancia.", illustration: "star.fill", backgroundColor: "mint"),
            StoryPage(pageNumber: 14, text: "Y en las noches cuando tenía pesadillas o no se sentía bien, Luna venía a la cama grande. Y eso estaba PERFECTAMENTE bien. Porque en esa familia, Luna siempre tendría un lugar seguro. Siempre.", illustration: "heart.circle.fill", backgroundColor: "blue")
        ],
        moralLesson: "Tal como Luna dormía con sus papás, tú duermes conmigo. Y eso es natural, saludable y hermoso. Cuando estés listo, dormirás solo. No hay prisa. No hay edad correcta. Nuestra cama siempre será tu refugio seguro cuando lo necesites.",
        ageRange: "3-8 años"
    ),
    
    // HISTORIA 3: Papá Está Aquí
    BM8Story(
        number: 3,
        title: "Papá Está Aquí",
        icon: "figure.stand",
        color: .orange,
        pages: [
            StoryPage(pageNumber: 1, text: "Mi amor, déjame contarte sobre Nico, un zorrito muy pequeñito que acaba de nacer. Nico era tan chiquitín que cabía perfecto en las dos manos de su papá. La primera vez que papá zorro lo cargó, sintió algo enorme en el pecho: amor infinito.", illustration: "figure.and.child.holdinghands", backgroundColor: "orange"),
            StoryPage(pageNumber: 2, text: "Ese mismo día, con Nico dormido en sus brazos, papá zorro le hizo una promesa al oído, una promesa muy seria: 'Hijito, te prometo que SIEMPRE estaré cuando me necesites. De día, de noche, cuando sea. Si me llamas, vendré. Esa es mi palabra'.", illustration: "heart.circle.fill", backgroundColor: "pink"),
            StoryPage(pageNumber: 3, text: "Las primeras noches fueron difíciles. Nico lloraba mucho. Tenía hambre, tenía frío, tenía miedo. Pero cada vez que lloraba, papá zorro se levantaba enseguida. Ni un minuto de espera. '¿Qué pasa, mi pequeño? Aquí está papá', decía con voz calmada.", illustration: "moon.stars.fill", backgroundColor: "indigo"),
            StoryPage(pageNumber: 4, text: "Papá caminaba por la madriguera meciendo a Nico. A veces durante horas. Estaba cansado, sí. Tenía sueño, sí. Pero nunca, ni una sola vez, dejó de responder cuando Nico lo necesitaba. Porque había hecho una promesa.", illustration: "figure.walk", backgroundColor: "blue"),
            StoryPage(pageNumber: 5, text: "Cuando Nico creció un poquito y empezó a jugar, seguía necesitando a papá. Si se caía y se raspaba, lloraba. Si se asustaba con un ruido fuerte, lloraba. Si extrañaba a mamá, lloraba. Y papá SIEMPRE venía corriendo.", illustration: "figure.run", backgroundColor: "mint"),
            StoryPage(pageNumber: 6, text: "Papá dejaba lo que estuviera haciendo. Aunque estuviera cazando, aunque estuviera jugando con otros zorros, aunque estuviera descansando. La voz de Nico era su alarma más importante. 'Te escuché, hijito. Ya llegó papá', decía mientras lo alzaba.", illustration: "figure.2.arms.open", backgroundColor: "pink"),
            StoryPage(pageNumber: 7, text: "Nico empezó a entender algo mágico: cuando necesitaba ayuda, alguien siempre venía. Cuando tenía miedo, no estaba solo. Cuando le dolía algo, papá lo curaba. Cuando estaba triste, papá lo consolaba. El mundo era un lugar SEGURO.", illustration: "shield.fill", backgroundColor: "purple"),
            StoryPage(pageNumber: 8, text: "Pero un día, mientras papá zorro jugaba con Nico en el bosque, llegó el tejón vecino. Era un tejón gruñón que siempre tenía opiniones. 'Oye, amigo', le dijo a papá zorro, 'ese hijito tuyo llora mucho y tú SIEMPRE vas corriendo'.", illustration: "exclamationmark.triangle.fill", backgroundColor: "orange"),
            StoryPage(pageNumber: 9, text: "'¿No crees', continuó el tejón, 'que lo estás mal acostumbrando? Si siempre vas cuando llora, va a llorar por todo. Déjalo llorar un rato solo, para que aprenda a calmarse. Así se hacen fuertes los zorros'.", illustration: "bubble.left.fill", backgroundColor: "orange"),
            StoryPage(pageNumber: 10, text: "Papá zorro sintió un nudo en el estómago. ¿Y si el tejón tenía razón? ¿Y si estaba haciendo las cosas mal? Esa noche, cuando Nico lloró, papá dudó por primera vez. 'Tal vez debería esperar un poco', pensó.", illustration: "cloud.fill", backgroundColor: "indigo"),
            StoryPage(pageNumber: 11, text: "Pero entonces escuchó el llanto de Nico haciéndose más fuerte, más desesperado. Y el corazón de papá no pudo soportarlo. Fue corriendo. Alzó a Nico y lo abrazó fuerte. 'Perdón, perdón hijito. Papá está aquí. Siempre estaré aquí'.", illustration: "heart.fill", backgroundColor: "pink"),
            StoryPage(pageNumber: 12, text: "Al día siguiente, papá zorro buscó al tejón y le explicó con respeto: 'Amigo, entiendo que quieres ayudar. Pero el llanto de Nico NO es manipulación. Es su forma de HABLAR. Es su única forma de decirme: Papá, te necesito'.", illustration: "bubble.left.and.bubble.right.fill", backgroundColor: "mint"),
            StoryPage(pageNumber: 13, text: "'¿Tú ignorarías a alguien que te está pidiendo ayuda?', preguntó papá zorro. 'Yo no puedo. Cuando respondo a su llanto, le enseño la lección más importante: Puedes confiar en mí. No estás solo. Tus necesidades importan. ESO lo hace fuerte'.", illustration: "figure.stand", backgroundColor: "blue"),
            StoryPage(pageNumber: 14, text: "Los años pasaron volando. Nico creció y creció. Y ¿sabes qué? Se convirtió en el zorro más valiente, más confiado y más feliz de todo el bosque. Exploraba lugares nuevos sin miedo. Hacía amigos fácilmente. Era seguro de sí mismo.", illustration: "star.fill", backgroundColor: "yellow"),
            StoryPage(pageNumber: 15, text: "¿Por qué era tan valiente y seguro? Porque en lo más profundo de su corazón, Nico sabía algo que nunca olvidaría: papá SIEMPRE había estado ahí. Cada vez. Sin falta. Esa certeza le dio alas para volar alto.", illustration: "sparkles", backgroundColor: "orange"),
            StoryPage(pageNumber: 16, text: "Ahora Nico tiene sus propios hijitos. Y cuando lloran por la noche, ¿adivina qué hace? Se levanta enseguida. Porque papá Nico aprendió la verdad: responder al llanto no malcría. El amor, la presencia constante, la respuesta inmediata... ESO es lo que cría zorros fuertes.", illustration: "figure.2", backgroundColor: "mint")
        ],
        moralLesson: "Igual que papá zorro con Nico, yo siempre voy a responder cuando me necesites. Tu llanto es tu forma de hablarme. Nunca lo voy a ignorar. Responder a tu llanto te hace sentir seguro, confiado y amado. Y eso, mi amor, es lo que te hará fuerte de verdad.",
        ageRange: "2-6 años"
    ),
    
    // HISTORIA 4: El Bebé que Mamaba Mucho
    BM8Story(
        number: 4,
        title: "El Bebé que Mamaba Mucho",
        icon: "heart.circle.fill",
        color: .pink,
        pages: [
            StoryPage(pageNumber: 1, text: "Cariño, esta historia es sobre Mía, una elefantita que acababa de llegar al mundo. Imagínate: Mía era tan pequeñita que papá elefante podía cargarla con su trompa. Lo primero que hizo Mía al nacer fue buscar instintivamente la leche tibia de mamá. Y ese fue el inicio de una historia hermosa.", illustration: "heart.fill", backgroundColor: "pink"),
            StoryPage(pageNumber: 2, text: "Desde ese primer día, mamar se convirtió en la actividad favorita de Mía. Mamaba cuando tenía hambre. Mamaba cuando tenía sed. Mamaba cuando sentía miedo. Mamaba para dormir. Mamaba para consolarse. Mamaba cuando extrañaba a mamá. Mamaba, mamaba y mamaba.", illustration: "drop.fill", backgroundColor: "blue"),
            StoryPage(pageNumber: 3, text: "Y ¿sabes cuántas veces al día mamaba Mía? Nadie las contaba. Podían ser 10, 15, 20 veces o más. Por el día, por la noche, cada hora, cada media hora. No había horario. Mía mamaba cuando lo necesitaba, y mamá siempre le daba el pecho.", illustration: "moon.fill", backgroundColor: "indigo"),
            StoryPage(pageNumber: 4, text: "Un día soleado, la tía elefanta vino de visita. Observó a Mía mamando felizmente. Miró su reloj varias veces. Luego, con cara preocupada, le dijo a mamá: 'Sobrina querida, Mía mama DEMASIADO. Ya tiene seis meses. Deberías ponerle horarios'.", illustration: "clock.fill", backgroundColor: "orange"),
            StoryPage(pageNumber: 5, text: "'Cada 3 horas es lo correcto', insistió la tía. 'Y solo 10 minutos por pecho. Si no, te está usando como chupete. Se está aprovechando de ti. Nunca va a soltar el pecho si sigues así. Tienes que poner límites YA'.", illustration: "exclamationmark.bubble", backgroundColor: "orange"),
            StoryPage(pageNumber: 6, text: "Otra elefanta del rebaño que pasaba por ahí agregó: 'Yo a mis hijitos les di horarios desde el principio: cada 4 horas exactas. Lloraban un poco, pero aprendieron. Tu bebé te está manipulando'. Mamá elefanta sintió un nudo en la garganta.", illustration: "bubble.left.fill", backgroundColor: "purple"),
            StoryPage(pageNumber: 7, text: "Esa noche, mamá elefanta se sintió confundida y triste. Miró a papá buscando respuestas. Papá la abrazó y le dijo: 'Mi amor, no escuches esas voces. Mira a nuestra hija. ¿Ves lo feliz que es? ¿Ves lo tranquila que está? ¿Ves cómo te mira con amor?'", illustration: "figure.2", backgroundColor: "blue"),
            StoryPage(pageNumber: 8, text: "Esa misma noche, bajo un cielo lleno de estrellas, mientras Mía mamaba tranquilamente, mamá la observó con atención. Mía cerraba sus ojitos de placer. Su manita agarraba la piel de mamá. Hacía ruiditos de satisfacción. Estaba en PAZ completa.", illustration: "moon.stars.fill", backgroundColor: "indigo"),
            StoryPage(pageNumber: 9, text: "Y entonces mamá elefanta comprendió algo profundo: 'La leche que le doy no es solo comida. Es AMOR líquido. Cada gota lleva mi olor, mi calor, mi presencia. Cuando mama, no solo se alimenta. Se conecta conmigo. Se siente amada. Se siente segura'.", illustration: "heart.circle.fill", backgroundColor: "pink"),
            StoryPage(pageNumber: 10, text: "'Mía sabe perfectamente cuánto necesita mamar', continuó pensando mamá. 'Su cuerpo es sabio. Su instinto es perfecto. ¿Por qué debería confiar más en un reloj que en mi propia hija? ¿Por qué debería poner límites arbitrarios a algo tan natural?'", illustration: "lightbulb.fill", backgroundColor: "yellow"),
            StoryPage(pageNumber: 11, text: "'Y otra cosa', pensó mamá con una sonrisa, 'ese comentario sobre usar el pecho como chupete es ridículo. ¡El chupete fue inventado para IMITAR el pecho! No al revés. El pecho es el original. El pecho es perfecto. El pecho es lo NATURAL'.", illustration: "sparkles", backgroundColor: "mint"),
            StoryPage(pageNumber: 12, text: "Desde ese día, mamá elefanta nunca más miró el reloj. Dejó de contar cuántas veces mamaba Mía. Dejó de preocuparse por opiniones ajenas. Solo escuchaba a su bebé y a su propio instinto. Y papá la apoyaba siempre: 'Estás haciendo lo correcto'.", illustration: "shield.fill", backgroundColor: "blue"),
            StoryPage(pageNumber: 13, text: "Los meses pasaron. Mía seguía mamando a demanda total: cuando quería, cuanto quería, por el tiempo que quería. Sin horarios. Sin límites. Sin culpa. Y ¿adivina qué? Creció siendo la elefantita más sana, feliz, segura y confiada del rebaño.", illustration: "figure.walk", backgroundColor: "purple"),
            StoryPage(pageNumber: 14, text: "Pasaron los años. Mía cumplió uno, dos, tres años. Seguía mamando. Algunas elefantas criticaban: '¿Todavía? ¡Ya está muy grande!'. Pero mamá y papá sabían que Mía dejaría el pecho cuando estuviera lista. Y confiaban en su tiempo.", illustration: "calendar.badge.checkmark", backgroundColor: "orange"),
            StoryPage(pageNumber: 15, text: "Y un día, cuando Mía tenía cuatro años, algo mágico pasó. Simplemente dejó de pedir el pecho. No hubo drama. No hubo llanto. Solo llegó el momento natural. Mía miró a mamá y le dijo: 'Ya no necesito mamar, mami. Pero gracias. Fue hermoso'.", illustration: "star.fill", backgroundColor: "yellow"),
            StoryPage(pageNumber: 16, text: "Mamá la abrazó con lágrimas de alegría y nostalgia. 'Gracias a TI, mi amor, por estos años mágicos. Por confiar en mí. Por enseñarme que tu cuerpo sabe lo que necesita. Esa conexión que tuvimos nunca la olvidaré'. Y se abrazaron fuerte fuerte.", illustration: "figure.2.arms.open", backgroundColor: "pink")
        ],
        moralLesson: "La leche de mamá es mucho más que alimento. Es amor, conexión y seguridad. Si tu mamá te amamanta, no hay horarios ni límites correctos. Ella confía en ti, en que tú sabes cuánto necesitas. Y cuando estés listo, dejarás el pecho solo. Sin prisa. Tal como debe ser.",
        ageRange: "2-6 años"
    ),
    
    // HISTORIA 5: Rabieta de Conejito
    BM8Story(
        number: 5,
        title: "Rabieta de Conejito",
        icon: "face.dashed",
        color: .purple,
        pages: [
            StoryPage(pageNumber: 1, text: "Hijito, esta historia es sobre emociones grandes. Verás, había un conejito llamado Tomás que tenía tres años. Era un conejito normal: jugaba, reía, saltaba. Pero ese día, algo especial iba a pasar.", illustration: "figure.walk", backgroundColor: "purple"),
            StoryPage(pageNumber: 2, text: "Era una tarde soleada. Tomás jugaba en el jardín cuando encontró un libro con dibujos. En una página vio algo increíble: ¡una zanahoria AZUL! Brillante, hermosa, del color del cielo. Tomás nunca había visto algo tan maravilloso.", illustration: "book.fill", backgroundColor: "blue"),
            StoryPage(pageNumber: 3, text: "'¡MAMÁ, MAMÁ!', gritó corriendo hacia adentro. '¡Quiero una zanahoria azul! ¡Por favor, por favor! ¡Es la cosa más linda que he visto! ¡La quiero YA!'. Sus ojitos brillaban de emoción. Su corazoncito latía rápido.", illustration: "sparkles", backgroundColor: "yellow"),
            StoryPage(pageNumber: 4, text: "Mamá coneja dejó lo que estaba haciendo y se agachó a su altura. Con una sonrisa dulce le explicó: 'Mi amor, las zanahorias azules no existen de verdad. Solo en los dibujos. Las zanahorias reales son naranjas. Mira, aquí tengo una fresquita y crujiente para ti'.", illustration: "carrot.fill", backgroundColor: "orange"),
            StoryPage(pageNumber: 5, text: "Pero Tomás NO quería una zanahoria naranja. Quería la azul. La del dibujo. La imposible. Y cuando mamá le dijo que no existía, algo grande explotó dentro de él. Una frustración ENORME que nunca había sentido antes.", illustration: "cloud.bolt.fill", backgroundColor: "purple"),
            StoryPage(pageNumber: 6, text: "Tomás se enojó más de lo que se había enojado en toda su vida. Lloró con un llanto fuerte y desgarrador. Gritó hasta quedarse sin voz. Pateó el suelo con todas sus fuerzas. Se tiró al piso y golpeó con sus patitas. Estaba completamente DESCONTROLADO.", illustration: "cloud.bolt.rain.fill", backgroundColor: "indigo"),
            StoryPage(pageNumber: 7, text: "Mamá coneja sintió muchas cosas al mismo tiempo. Sintió ganas de gritar: '¡BASTA! ¡Deja de llorar por una tontería!' Sintió vergüenza de los vecinos que la miraban. Sintió cansancio. Sintió frustración. Pero respiró profundo.", illustration: "wind", backgroundColor: "mint"),
            StoryPage(pageNumber: 8, text: "Mamá recordó algo muy importante que había leído: 'Para los niños pequeños, TODO es real. TODO es importante. No existen tonterías. Si Tomás llora así, es porque para ÉL esto es ENORME. Debo respetar sus emociones, aunque no entienda completamente'.", illustration: "lightbulb.fill", backgroundColor: "yellow"),
            StoryPage(pageNumber: 9, text: "Entonces mamá hizo algo sabio. No gritó. No castigó. No lo mandó a su cuarto. En lugar de eso, se sentó en el suelo al lado de Tomás. No lo tocó (porque él estaba muy alterado), pero se quedó cerca. Muy cerca. Presente.", illustration: "figure.2.arms.open", backgroundColor: "blue"),
            StoryPage(pageNumber: 10, text: "Con voz calmada y amorosa, mamá le dijo: 'Veo que estás muy, muy enojado. Entiendo que querías esa zanahoria azul y que te frustra que no exista. Está bien sentir enojo. Puedes llorar todo lo que necesites. Yo voy a estar aquí acompañándote'.", illustration: "heart.fill", backgroundColor: "pink"),
            StoryPage(pageNumber: 11, text: "Tomás siguió llorando. Y llorando. Y llorando. Mamá no lo apuró. No le dijo 'ya basta'. No miró el reloj. Solo respiró tranquila y esperó con paciencia infinita. Como esperamos que pase una tormenta.", illustration: "clock.badge.questionmark", backgroundColor: "purple"),
            StoryPage(pageNumber: 12, text: "Pasaron 5 minutos. 10 minutos. 15 minutos. Poco a poco, como pasan todas las tormentas, el llanto de Tomás empezó a calmarse. Sus sollozos se hicieron más suaves. Su respiración se regularizó. La rabieta estaba pasando.", illustration: "cloud.sun.fill", backgroundColor: "yellow"),
            StoryPage(pageNumber: 13, text: "Cuando Tomás estuvo más tranquilo, buscó con sus ojitos a mamá. Y ahí estaba. Esperándolo. Sin enojo. Sin cara de decepción. Con amor en la mirada. Mamá abrió sus brazos y Tomás se lanzó a ellos. Necesitaba ese abrazo.", illustration: "figure.arms.open", backgroundColor: "mint"),
            StoryPage(pageNumber: 14, text: "'Está bien sentir enojo, mi vida', le dijo mamá mientras lo acunaba suavemente. 'Está bien querer cosas imposibles. Está bien llorar cuando estás frustrado. Todas tus emociones son válidas y yo te amo IGUAL cuando estás enojado que cuando estás feliz'.", illustration: "heart.circle.fill", backgroundColor: "pink"),
            StoryPage(pageNumber: 15, text: "Tomás aprendió lecciones muy valiosas ese día: 1) Todas sus emociones importaban. 2) Podía sentir lo que fuera sin ser castigado. 3) Mamá siempre lo acompañaría. 4) Las emociones fuertes pasan, no duran para siempre. 5) Después de llorar, vienen los abrazos.", illustration: "checkmark.seal.fill", backgroundColor: "blue"),
            StoryPage(pageNumber: 16, text: "Desde ese día, Tomás tuvo muchas otras rabietas (todos los conejitos las tienen). Pero nunca tuvo miedo de sentir emociones grandes. Porque sabía que mamá y papá siempre estarían ahí, acompañándolo con paciencia y amor. Las emociones dejaron de darle miedo.", illustration: "face.smiling.fill", backgroundColor: "purple")
        ],
        moralLesson: "Todas las emociones son válidas, incluso el enojo más grande. Las rabietas son normales y sanas. No voy a castigarte por sentir. Voy a acompañarte con paciencia hasta que pase la tormenta. Todas las emociones son parte de ti, y yo te amo completo.",
        ageRange: "3-7 años"
    ),
    
    // HISTORIA 6: La Familia que se Escuchaba
    BM8Story(
        number: 6,
        title: "La Familia que se Escuchaba",
        icon: "ear.fill",
        color: .green,
        pages: [
            StoryPage(pageNumber: 1, text: "Tesoro, esta última historia es muy especial porque habla de familias como la nuestra. Había una vez una madriguera acogedora bajo la tierra donde vivía una familia de topos: mamá Tina, papá Teo, y dos topitos llamados Sara (5 años) y Leo (3 años).", illustration: "house.fill", backgroundColor: "green"),
            StoryPage(pageNumber: 2, text: "Esta familia de topos era diferente a otras familias del bosque. ¿Quieres saber por qué? Porque en esa familia, todos podían HABLAR. Y más importante todavía: todos ESCUCHABAN. De verdad. No con las orejas nada más, sino con el corazón.", illustration: "ear.fill", backgroundColor: "blue"),
            StoryPage(pageNumber: 3, text: "Una mañana de lunes, la pequeña Sara bajó a desayunar con cara triste. Papá Teo la notó enseguida. Dejó su café, apagó su teléfono, se agachó a su altura y le preguntó: '¿Qué pasa, princesa? Veo tristeza en tus ojitos'.", illustration: "figure.and.child.holdinghands", backgroundColor: "pink"),
            StoryPage(pageNumber: 4, text: "Sara, con voz temblorosa, dijo: 'Papá, ayer mi mejor amiga Julia no quiso jugar conmigo en el parque. Jugó con otra niña. Me sentí sola y fea'. Una lágrima rodó por su mejilla. Papá sintió su dolor como propio.", illustration: "drop.fill", backgroundColor: "blue"),
            StoryPage(pageNumber: 5, text: "Papá NO dijo 'ay, eso no es nada' o 'ya se te pasará' o 'no llores por tonterías'. En lugar de eso, la alzó con ternura, la sentó en su regazo y le dijo: 'Cuéntame TODO. ¿Qué pasó? ¿Cómo te sentiste? Papá te escucha'. Y escuchó de verdad.", illustration: "heart.fill", backgroundColor: "pink"),
            StoryPage(pageNumber: 6, text: "Sara habló durante 10 minutos. Papá no interrumpió ni una vez. No la apuró. No miró el reloj. Solo escuchó con atención, mirándola a los ojos, asintiendo. Cuando terminó, papá le dijo: 'Entiendo perfectamente que te hayas sentido triste y sola. La amistad es importante para ti'.", illustration: "bubble.left.and.bubble.right.fill", backgroundColor: "purple"),
            StoryPage(pageNumber: 7, text: "'Tu tristeza es válida', continuó papá. 'No es tonta ni exagerada. Para ti fue real y dolió. Y eso es lo que importa'. Sara se sintió comprendida. Se acurrucó en los brazos de papá y su tristeza empezó a pasar. Ser escuchada la sanó.", illustration: "figure.2.arms.open", backgroundColor: "mint"),
            StoryPage(pageNumber: 8, text: "Otro día, era el turno de Leo. Por la noche, Leo se aferró a papá con miedo. 'Papá, no quiero que apagues la luz. Le tengo miedo a la oscuridad. Siento que hay monstruos'. Muchos papás dirían: 'Ya eres grande, no hay monstruos'.", illustration: "moon.stars.fill", backgroundColor: "indigo"),
            StoryPage(pageNumber: 9, text: "Pero papá Teo no hizo eso. Se sentó en la cama de Leo y le dijo: 'Gracias por decírmelo, campeón. Entiendo que la oscuridad da miedo. Para ti los monstruos son reales. ¿Qué te ayudaría a sentirte más seguro? ¿Una lucecita? ¿Que me quede un ratito? Dime qué necesitas'.", illustration: "lightbulb.fill", backgroundColor: "yellow"),
            StoryPage(pageNumber: 10, text: "Leo pensó un momento y dijo: '¿Puedes quedarte hasta que me duerma? Y dejar una luz pequeñita'. 'Por supuesto', dijo papá. Y se quedó ahí, acariciando su cabecita, hasta que Leo se durmió tranquilo. Sin prisa. Sin obligarlo a ser 'valiente'.", illustration: "hand.raised.fill", backgroundColor: "orange"),
            StoryPage(pageNumber: 11, text: "Pero esta familia era especial por otra razón también. Una tarde, mamá Tina estaba muy cansada. Sara le pidió algo y mamá le respondió mal, con voz fuerte: '¡Ya déjame en paz! ¡Estoy harta!'. Sara se asustó. Sus ojitos se llenaron de lágrimas.", illustration: "exclamationmark.bubble", backgroundColor: "orange"),
            StoryPage(pageNumber: 12, text: "Mamá se dio cuenta enseguida de su error. Respiró profundo. Luego hizo algo que Sara recordaría toda su vida: mamá se arrodilló frente a ella, la miró a los ojos y le dijo: 'Sara, perdón. Perdón por gritarte. Estaba cansada, pero no es tu culpa. Me equivoqué. ¿Me perdonas?'", illustration: "hand.raised.fill", backgroundColor: "pink"),
            StoryPage(pageNumber: 13, text: "Sara se quedó con la boca abierta. '¿Los adultos también se disculpan?', preguntó sorprendida. 'Claro que sí, mi amor', respondió mamá. 'Todos nos equivocamos. Adultos y niños. Lo importante es reconocerlo y pedir perdón. Eso es de personas valientes y honestas'.", illustration: "shield.fill", backgroundColor: "blue"),
            StoryPage(pageNumber: 14, text: "Y había más. En esa familia, los niños también podían expresar cuando algo no les gustaba de mamá o papá. Un día Leo le dijo a papá: 'Papá, cuando hablas muy fuerte me asusto. Me dan ganas de llorar'. Y papá, en lugar de ofenderse, dijo: 'Gracias por decírmelo, hijo. Voy a intentar hablar más suave'.", illustration: "bubble.left.and.bubble.right.fill", backgroundColor: "mint"),
            StoryPage(pageNumber: 15, text: "Cada noche, en la cena, la familia tenía un ritual. Cada uno contaba algo: algo feliz del día, algo triste, algo que aprendieron. Y TODOS escuchaban sin juzgar. Sin burlarse. Sin minimizar. Así, los topitos aprendieron que su voz importaba.", illustration: "fork.knife", backgroundColor: "yellow"),
            StoryPage(pageNumber: 16, text: "Los años pasaron. Sara y Leo crecieron. Se hicieron adolescentes, luego adultos. Y ¿sabes qué? Siguieron hablando con mamá y papá. Porque sabían que SIEMPRE serían escuchados. Esa confianza creada desde pequeños nunca se rompió.", illustration: "figure.2", backgroundColor: "purple"),
            StoryPage(pageNumber: 17, text: "Ahora Sara tiene su propia familia. Cuando su hijito le dice 'estoy triste', Sara deja todo, se agacha, lo mira a los ojos y escucha. Y Leo, cuando su hijita dice 'tengo miedo', no se ríe. Escucha. Porque así los criaron a ellos.", illustration: "heart.circle.fill", backgroundColor: "pink"),
            StoryPage(pageNumber: 18, text: "El amor, la escucha, el respeto... esas cosas se heredan. Pasan de generación en generación. Como un regalo precioso que nunca se gasta, solo se multiplica. La familia de topos lo entendió: escuchar con amor es el mejor regalo que puedes dar.", illustration: "sparkles", backgroundColor: "green")
        ],
        moralLesson: "En nuestra familia, tú puedes hablar siempre. Yo voy a escucharte de verdad. Tus sentimientos importan. Tu voz cuenta. Y cuando yo me equivoque (porque a veces pasa), te pediré perdón. Así construimos confianza juntos.",
        ageRange: "4-8 años"
    )
]
