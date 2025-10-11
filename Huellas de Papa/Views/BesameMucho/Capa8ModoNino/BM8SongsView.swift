import SwiftUI

/// Vista de canciones infantiles
struct BM8SongsView: View {
    let songs = songsData
    @State private var selectedSong: BM8Song?
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                ForEach(songs) { song in
                    Button(action: {
                        selectedSong = song
                    }) {
                        BM8SongCard(song: song)
                    }
                }
            }
            .padding()
        }
        .background(Color(.systemGroupedBackground))
        .navigationTitle("Canciones")
        .sheet(item: $selectedSong) { song in
            BM8SongDetailView(song: song)
        }
    }
}

// MARK: - BM8 Song Card
struct BM8SongCard: View {
    let song: BM8Song
    
    var body: some View {
        HStack(spacing: 16) {
            Image(systemName: song.icon)
                .font(.system(size: 35))
                .foregroundColor(.white)
                .frame(width: 70, height: 70)
                .background(
                    Circle()
                        .fill(colorFromString(song.color))
                )
            
            VStack(alignment: .leading, spacing: 8) {
                Text(song.title)
                    .font(.headline)
                    .fontWeight(.semibold)
                    .foregroundColor(.primary)
                    .lineLimit(2)
                
                Text(song.theme)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                    .lineLimit(1)
                
                HStack {
                    Label(song.melody, systemImage: "music.note")
                        .font(.caption)
                        .foregroundColor(.pink)
                        .lineLimit(1)
                    
                    Spacer()
                    
                    Label(song.ageRange, systemImage: "person.fill")
                        .font(.caption)
                        .foregroundColor(.orange)
                }
            }
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 18)
                .fill(Color(.systemBackground))
                .shadow(color: colorFromString(song.color).opacity(0.2), radius: 8, x: 0, y: 4)
        )
    }
    
    private func colorFromString(_ colorString: String) -> Color {
        switch colorString {
        case "pink": return .pink
        case "purple": return .purple
        case "blue": return .blue
        case "mint": return .mint
        case "orange": return .orange
        case "yellow": return .yellow
        default: return .pink
        }
    }
}

// MARK: - BM8 Song Detail View
struct BM8SongDetailView: View {
    let song: BM8Song
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 30) {
                    Image(systemName: song.icon)
                        .font(.system(size: 80))
                        .foregroundColor(colorFromString(song.color))
                        .padding(40)
                        .background(
                            Circle()
                                .fill(colorFromString(song.color).opacity(0.2))
                        )
                    
                    Text(song.title)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.primary)
                        .multilineTextAlignment(.center)
                    
                    Text(song.theme)
                        .font(.title3)
                        .foregroundColor(.secondary)
                        .multilineTextAlignment(.center)
                    
                    VStack(alignment: .leading, spacing: 12) {
                        Label("Melodía sugerida:", systemImage: "music.note")
                            .font(.headline)
                            .foregroundColor(.pink)
                        
                        Text(song.melody)
                            .font(.body)
                            .foregroundColor(.secondary)
                            .italic()
                    }
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(
                        RoundedRectangle(cornerRadius: 16)
                            .fill(Color.pink.opacity(0.1))
                    )
                    
                    VStack(alignment: .leading, spacing: 16) {
                        Label("Letra:", systemImage: "text.alignleft")
                            .font(.headline)
                            .foregroundColor(colorFromString(song.color))
                        
                        ForEach(Array(song.lyrics.enumerated()), id: \.offset) { index, verse in
                            Text(verse)
                                .font(.title3)
                                .foregroundColor(.primary)
                                .multilineTextAlignment(.leading)
                                .padding()
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .background(
                                    RoundedRectangle(cornerRadius: 12)
                                        .fill(Color(.secondarySystemGroupedBackground))
                                )
                        }
                    }
                }
                .padding()
            }
            .background(Color(.systemGroupedBackground))
            .navigationTitle("Canción")
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
        case "pink": return .pink
        case "purple": return .purple
        case "blue": return .blue
        case "mint": return .mint
        case "orange": return .orange
        case "yellow": return .yellow
        default: return .pink
        }
    }
}

// MARK: - SONGS DATA
let songsData: [BM8Song] = [
    BM8Song(
        number: 1,
        title: "Canción de la Cama Grande",
        icon: "moon.stars.fill",
        color: "purple",
        theme: "Colecho - Dormir juntos es natural y seguro",
        lyrics: [
            "En la cama grande, dormimos los tres\nMamá, papá y yo, qué feliz me siento aquí\nNo hay prisa por crecer\nDormir juntitos está bien",
            "Cuando tengo miedo en la oscuridad\nSolo estiro mi manita y mamá está\nCuando tengo una pesadilla que me asusta\nPapá me abraza y todo se ajusta",
            "La luna nos cuida desde el cielo azul\nLas estrellas brillan con su luz\nY yo duermo tranquilo entre el amor\nDe mamá y papá, mi tesoro mayor",
            "Algún día, cuando esté listo ya\nEn mi propia camita dormiré quizá\nPero ahora, aquí es mi lugar\nEn la cama grande, mi refugio sin par",
            "Y si una noche necesito regresar\nA la cama grande volver a llorar\nSiempre habrá un lugarcito para mí\nPorque en mi familia, el amor es así"
        ],
        melody: "Melodía suave tipo nana, estilo 'Estrellita dónde estás' (lenta y calmada)",
        ageRange: "2-7 años"
    ),
    
    BM8Song(
        number: 2,
        title: "La Leche Mágica de Mamá",
        icon: "heart.circle.fill",
        color: "pink",
        theme: "Lactancia - La leche materna es alimento y amor",
        lyrics: [
            "La leche de mamá es mágica y especial\nNo es solo comida, es mucho más\nEs amor líquido que me hace crecer\nEs abrazo y consuelo también",
            "No hay reloj que me diga cuándo tomar\nCuando tengo hambre o miedo, mamá está\nDe día o de noche, siempre que necesite\nEl pecho de mamá mi alma persigue",
            "Dicen algunos que mama demasiado\nQue debería tener horarios marcados\nPero mamá sabe, papá también\nQue yo sé cuánto necesito y está bien",
            "La leche de mamá tiene su calor\nSu olor, su sabor, todo su amor\nCuando mamo siento su corazón latir\nY sé que estoy en el mejor lugar para mí",
            "Algún día, cuando crezca un poco más\nYo solito dejaré de mamar\nPero ahora este es mi tiempo dorado\nY mamá me ama, amamantado"
        ],
        melody: "Melodía tierna, estilo 'Arroz con leche' o 'Los pollitos dicen' (dulce y repetitiva)",
        ageRange: "0-5 años"
    ),
    
    BM8Song(
        number: 3,
        title: "Abrazos Sin Límite",
        icon: "figure.2.arms.open",
        color: "blue",
        theme: "Contacto físico - Los abrazos nunca sobran",
        lyrics: [
            "Un abrazo por la mañana al despertar\nOtro abrazo antes de desayunar\nUn abrazo cuando lloro sin cesar\nY otro más cuando me voy a jugar",
            "Cien abrazos, mil abrazos, los que sean\nEn mi casa los abrazos no se cuentan\nNo hay número máximo, no hay límite\nLos abrazos son mi alimento invisible",
            "Me dicen que me acostumbro a los brazos\nQue nunca voy a querer soltarlos\nPero papá me dice al oído\n'Los abrazos te hacen fuerte, mi querido'",
            "Con cada abrazo me lleno de amor\nCon cada abrazo crece mi valor\nMe siento seguro, me siento querido\nLos abrazos son mi superpoder escondido",
            "Y cuando sea grande y tenga mis hijitos\nLes daré abrazos, abrazos infinitos\nPorque aprendí lo que es más verdadero\nLos abrazos nunca sobran, siempre hacen falta primero"
        ],
        melody: "Melodía alegre, estilo 'Si estás feliz y lo sabes' (ritmo animado)",
        ageRange: "2-7 años"
    ),
    
    BM8Song(
        number: 4,
        title: "Todas las Emociones Son Bienvenidas",
        icon: "face.smiling.fill",
        color: "orange",
        theme: "Validación emocional - No hay emociones malas",
        lyrics: [
            "A veces estoy feliz y quiero saltar\nA veces estoy triste y quiero llorar\nA veces tengo miedo de la oscuridad\nY a veces me enojo con intensidad",
            "Todas, todas, todas mis emociones\nSon válidas, importantes, no hay excepciones\nNo hay sentimientos buenos ni hay sentimientos malos\nTodos son parte de mí, todos los regalo",
            "Cuando lloro fuerte papá no se enoja\nCuando grito de rabia mamá no me arroja\nMe abrazan, me escuchan, están ahí presentes\n'Puedes sentir lo que sea', me dicen siempre",
            "La alegría es bienvenida, la tristeza también\nEl miedo puede llegar, el enojo igual que él\nY después de sentir viene siempre el abrazo\nMi familia me ama en cada uno de mis pasos",
            "Aprendo a nombrarlas: 'Estoy frustrado'\n'Estoy emocionado, estoy asustado'\nY mamá y papá me ayudan a entender\nQue sentir no es malo, es parte de crecer"
        ],
        melody: "Melodía expresiva con cambios de ritmo según la emoción (creativa y dinámica)",
        ageRange: "3-7 años"
    ),
    
    BM8Song(
        number: 5,
        title: "Mamá y Papá Siempre Vuelven",
        icon: "arrow.uturn.left.circle.fill",
        color: "mint",
        theme: "Permanencia del objeto - Los padres siempre regresan",
        lyrics: [
            "Mamá se fue a trabajar esta mañana\nPero volverá, volverá mañana\nPapá salió un ratito al mercado\nPero regresará, eso está asegurado",
            "Siempre, siempre, siempre vuelven a casa\nEsto lo puedo confiar, esto nunca pasa\nAunque no los vea, aunque estén lejos\nSu amor está conmigo, aunque sean viejos",
            "Me aman mucho, mucho, mucho me aman\nNunca me van a dejar, eso lo proclaman\nY mientras los espero, estoy bien aquí\nCon las personas que me cuidan a mí",
            "A veces extraño cuando tardan mucho\nY está bien sentir eso, lo escucho\nPero en mi corazón yo sé la verdad\nQue mamá y papá siempre volverán",
            "Y cuando regresen voy a correr\nA sus brazos voy a correr\nY me van a abrazar fuerte fuerte\n'Te extrañamos', dirán, 'nunca te vamos a perderte'"
        ],
        melody: "Melodía reconfortante, estilo 'Los pollitos dicen' o 'Estrellita' (calmada y segura)",
        ageRange: "2-5 años"
    ),
    
    BM8Song(
        number: 6,
        title: "Buenas Noches, Mi Tesoro",
        icon: "sparkles",
        color: "yellow",
        theme: "Despedida nocturna - Canción para dormir con amor",
        lyrics: [
            "Buenas noches, mi amor, mi tesoro\nQue descanses muy bien, te adoro\nAquí estoy yo cerquita de ti\nNo te preocupes por nada, mi amor, duerme así",
            "La luna te cuida desde el cielo\nLas estrellas brillan como un desvelo\nY yo estaré aquí, no me voy a ir\nSi me necesitas en la noche, solo pídeme venir",
            "Cerramos los ojitos, respiramos profundo\nUno, dos, tres, dejamos atrás el mundo\nTus manitas descansan, tu corazón late suave\nEres mi regalo más hermoso, eso tú lo sabes",
            "Si tienes una pesadilla o despiertas asustado\nSolo di mi nombre y estaré a tu lado\nNo tienes que llorar mucho ni gritar\nYa estoy aquí, nunca me voy a apartar",
            "Buenas noches, mi cielo, mi vida\nQue sueñes con cosas bonitas y queridas\nMañana cuando despiertes yo estaré aquí\nCon un abrazo enorme esperándote para ti",
            "Te amo cuando duermes, te amo cuando juegas\nTe amo en las buenas y cuando te desesperas\nEres mi amor más grande, mi razón de ser\nBuenas noches, descansa, nos vemos al amanecer"
        ],
        melody: "Melodía suave de nana, muy lenta y calmada (tipo 'Duerme negrito' o nanas tradicionales)",
        ageRange: "0-8 años"
    )
]
