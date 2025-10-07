import SwiftUI

// MARK: - Vista de Cuentos Guiados
// Cuentos para compartir con instrucciones de narración para padres

struct GuidedStoriesView: View {
    @State private var selectedStory: Capa8Story? = nil
    @State private var showingStoryDetail = false
    
    // Cuentos de ejemplo basados en principios de Bilbao
    private let sampleStories: [Capa8Story] = [
        Capa8Story(
            title: "El Oso que Respiraba Despacio",
            summary: "Un oso aprende a calmarse cuando se siente enojado, enseñando técnicas de respiración.",
            pages: [
                Capa8StoryPage(
                    text: "Había una vez un oso grande y fuerte que vivía en el bosque. Cuando algo lo molestaba, se ponía muy enojado y gruñía fuerte.",
                    narratorCue: "Haz una pausa aquí. Pregunta: '¿Alguna vez te has sentido enojado como el oso?'",
                    pageNumber: 1
                ),
                Capa8StoryPage(
                    text: "Un día, una ardilla sabia le enseñó al oso a respirar despacio cuando se sintiera molesto: 'Inhala por la nariz... exhala por la boca'.",
                    narratorCue: "Haz la respiración junto con tu hijo. Inhala y exhala tres veces.",
                    pageNumber: 2
                ),
                Capa8StoryPage(
                    text: "Desde ese día, cada vez que el oso se sentía enojado, recordaba respirar despacio y se sentía mucho mejor.",
                    narratorCue: "Pregunta: '¿Qué aprendió el oso?' Abraza a tu hijo y di: 'Tú también puedes respirar cuando te sientas enojado'.",
                    pageNumber: 3
                )
            ],
            keyMessage: "La respiración nos ayuda a calmarnos cuando sentimos emociones intensas.",
            readingTime: 5,
            emotionalTheme: "Calma y Autocontrol"
        ),
        Capa8Story(
            title: "La Pequeña Estrella Valiente",
            summary: "Una estrella pequeña aprende que el valor no es la ausencia de miedo, sino actuar a pesar del miedo.",
            pages: [
                Capa8StoryPage(
                    text: "En el cielo vivía una pequeña estrella que tenía miedo de brillar muy fuerte. '¿Y si no soy lo suficientemente buena?', pensaba.",
                    narratorCue: "Pregunta: '¿Alguna vez has tenido miedo de hacer algo nuevo?'",
                    pageNumber: 1
                ),
                Capa8StoryPage(
                    text: "Su mamá estrella le dijo: 'Ser valiente no significa no tener miedo. Significa intentar aunque tengas miedo'.",
                    narratorCue: "Mira a tu hijo a los ojos y di: 'Tú también eres muy valiente'.",
                    pageNumber: 2
                ),
                Capa8StoryPage(
                    text: "La pequeña estrella decidió brillar con todo su corazón, y su luz fue la más hermosa de todas.",
                    narratorCue: "Pregunta: '¿Qué hace que la pequeña estrella sea especial?'",
                    pageNumber: 3
                )
            ],
            keyMessage: "El valor verdadero está en intentar, no en la ausencia de miedo.",
            readingTime: 6,
            emotionalTheme: "Valentía y Autoestima"
        )
    ]
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                // Header
                VStack(spacing: 12) {
                    HStack {
                        Image(systemName: "book.pages.fill")
                            .font(.title)
                            .foregroundColor(.pink)
                        
                        VStack(alignment: .leading, spacing: 4) {
                            Text("Cuentos Guiados")
                                .font(.title2)
                                .fontWeight(.bold)
                            
                            Text("Narra con propósito y conexión")
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                        }
                        
                        Spacer()
                    }
                    
                    Text("Estos cuentos incluyen instrucciones específicas para que puedas crear momentos mágicos de conexión mientras lees. Cada pausa y pregunta está diseñada para fortalecer el vínculo emocional.")
                        .font(.body)
                        .foregroundColor(.secondary)
                        .multilineTextAlignment(.leading)
                }
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 12)
                        .fill(Color.pink.opacity(0.1))
                )
                
                // Lista de cuentos
                LazyVStack(spacing: 16) {
                    ForEach(sampleStories) { story in
                        StoryCard(story: story) {
                            selectedStory = story
                            showingStoryDetail = true
                        }
                    }
                }
            }
            .padding()
        }
        .navigationTitle("Cuentos")
        .navigationBarTitleDisplayMode(.inline)
        .sheet(isPresented: $showingStoryDetail) {
            if let story = selectedStory {
                StoryDetailView(story: story)
            }
        }
    }
}

struct StoryCard: View {
    let story: Capa8Story
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            VStack(alignment: .leading, spacing: 12) {
                HStack {
                    VStack(alignment: .leading, spacing: 4) {
                        Text(story.title)
                            .font(.headline)
                            .fontWeight(.semibold)
                            .foregroundColor(.primary)
                        
                        Text(story.summary)
                            .font(.body)
                            .foregroundColor(.secondary)
                            .multilineTextAlignment(.leading)
                            .lineLimit(2)
                    }
                    
                    Spacer()
                    
                    VStack(spacing: 4) {
                        Image(systemName: "clock")
                            .font(.caption)
                            .foregroundColor(.secondary)
                        
                        Text("\(story.readingTime) min")
                            .font(.caption)
                            .fontWeight(.medium)
                            .foregroundColor(.secondary)
                    }
                }
                
                HStack {
                    VStack(alignment: .leading, spacing: 2) {
                        Text("Tema: \(story.emotionalTheme)")
                            .font(.caption)
                            .foregroundColor(.pink)
                        
                        Text("\(story.pages.count) páginas")
                            .font(.caption)
                            .foregroundColor(.secondary)
                    }
                    
                    Spacer()
                    
                    Image(systemName: "book.circle.fill")
                        .font(.title2)
                        .foregroundColor(.pink)
                }
            }
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 12)
                    .fill(Color.white.opacity(0.8))
                    .shadow(color: .black.opacity(0.1), radius: 4, x: 0, y: 2)
            )
        }
        .buttonStyle(PlainButtonStyle())
    }
}

struct StoryDetailView: View {
    let story: Capa8Story
    @Environment(\.dismiss) private var dismiss
    @State private var currentPage = 0
    @State private var isReading = false
    
    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                if isReading {
                    // Vista de lectura
                    StoryReadingView(story: story, currentPage: $currentPage)
                } else {
                    // Vista de preparación
                    ScrollView {
                        VStack(spacing: 24) {
                            // Header del cuento
                            VStack(spacing: 16) {
                                HStack {
                                    Image(systemName: "book.pages.fill")
                                        .font(.largeTitle)
                                        .foregroundColor(.pink)
                                    
                                    VStack(alignment: .leading, spacing: 4) {
                                        Text(story.title)
                                            .font(.title2)
                                            .fontWeight(.bold)
                                        
                                        Text(story.summary)
                                            .font(.body)
                                            .foregroundColor(.secondary)
                                    }
                                    
                                    Spacer()
                                }
                                
                                // Información del cuento
                                HStack(spacing: 20) {
                                    InfoChip(icon: "clock", text: "\(story.readingTime) min")
                                    InfoChip(icon: "doc.text", text: "\(story.pages.count) páginas")
                                    InfoChip(icon: "heart", text: story.emotionalTheme)
                                }
                            }
                            .padding()
                            .background(
                                RoundedRectangle(cornerRadius: 16)
                                    .fill(Color.pink.opacity(0.1))
                            )
                            
                            // Preparación para la lectura
                            VStack(alignment: .leading, spacing: 16) {
                                Text("📖 Antes de Comenzar")
                                    .font(.headline)
                                    .fontWeight(.semibold)
                                
                                VStack(alignment: .leading, spacing: 8) {
                                    Text("• Encuentra un lugar cómodo y tranquilo")
                                    Text("• Asegúrate de tener tiempo sin interrupciones")
                                    Text("• Prepara abrazos para los momentos especiales")
                                    Text("• Sigue las instrucciones de narración en cada página")
                                }
                                .font(.body)
                                .foregroundColor(.secondary)
                            }
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding()
                            .background(
                                RoundedRectangle(cornerRadius: 12)
                                    .fill(Color.blue.opacity(0.1))
                            )
                            
                            // Mensaje clave
                            VStack(alignment: .leading, spacing: 12) {
                                Text("💡 Mensaje Clave")
                                    .font(.headline)
                                    .fontWeight(.semibold)
                                
                                Text(story.keyMessage)
                                    .font(.body)
                                    .foregroundColor(.secondary)
                            }
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding()
                            .background(
                                RoundedRectangle(cornerRadius: 12)
                                    .fill(Color.green.opacity(0.1))
                            )
                            
                            // Botón de inicio
                            Button(action: {
                                isReading = true
                            }) {
                                HStack {
                                    Image(systemName: "play.circle.fill")
                                    Text("Comenzar Cuento")
                                }
                                .font(.headline)
                                .fontWeight(.semibold)
                                .foregroundColor(.white)
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(
                                    RoundedRectangle(cornerRadius: 12)
                                        .fill(Color.pink)
                                )
                            }
                        }
                        .padding()
                    }
                }
            }
            .navigationTitle(isReading ? "Leyendo" : "Cuento")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Cerrar") {
                        dismiss()
                    }
                }
                
                if isReading {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button("Atrás") {
                            if currentPage > 0 {
                                currentPage -= 1
                            } else {
                                isReading = false
                            }
                        }
                    }
                }
            }
        }
    }
}

struct StoryReadingView: View {
    let story: Capa8Story
    @Binding var currentPage: Int
    
    var body: some View {
        VStack(spacing: 0) {
            // Contenido de la página
            ScrollView {
                VStack(spacing: 20) {
                    // Página actual
                    VStack(spacing: 16) {
                        Text("Página \(currentPage + 1) de \(story.pages.count)")
                            .font(.caption)
                            .fontWeight(.medium)
                            .foregroundColor(.secondary)
                        
                        Text(story.pages[currentPage].text)
                            .font(.title3)
                            .foregroundColor(.primary)
                            .multilineTextAlignment(.center)
                            .lineSpacing(4)
                    }
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 16)
                            .fill(Color.white.opacity(0.8))
                            .shadow(color: .black.opacity(0.1), radius: 4, x: 0, y: 2)
                    )
                    
                    // Instrucción de narración
                    VStack(alignment: .leading, spacing: 12) {
                        Text("📢 Instrucción de Narración")
                            .font(.headline)
                            .fontWeight(.semibold)
                        
                        Text(story.pages[currentPage].narratorCue)
                            .font(.body)
                            .foregroundColor(.secondary)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 12)
                            .fill(Color.orange.opacity(0.1))
                    )
                }
                .padding()
            }
            
            // Navegación
            HStack {
                if currentPage > 0 {
                    Button("Página Anterior") {
                        currentPage -= 1
                    }
                    .foregroundColor(.blue)
                }
                
                Spacer()
                
                if currentPage < story.pages.count - 1 {
                    Button("Siguiente Página") {
                        currentPage += 1
                    }
                    .foregroundColor(.white)
                    .padding(.horizontal, 16)
                    .padding(.vertical, 8)
                    .background(
                        RoundedRectangle(cornerRadius: 8)
                            .fill(Color.pink)
                    )
                } else {
                    Button("¡Cuento Completado!") {
                        // Marcar como completado
                    }
                    .foregroundColor(.white)
                    .padding(.horizontal, 16)
                    .padding(.vertical, 8)
                    .background(
                        RoundedRectangle(cornerRadius: 8)
                            .fill(Color.green)
                    )
                }
            }
            .padding()
            .background(
                Rectangle()
                    .fill(Color.white.opacity(0.9))
                    .shadow(color: .black.opacity(0.1), radius: 4, x: 0, y: -2)
            )
        }
    }
}

#Preview {
    GuidedStoriesView()
}

