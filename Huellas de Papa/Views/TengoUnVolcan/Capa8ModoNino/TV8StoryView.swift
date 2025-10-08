import SwiftUI

/// Vista del cuento "Tengo un Volcán" por capítulos
struct TV8StoryView: View {
    @State private var currentChapter = 0
    
    var body: some View {
        VStack(spacing: 0) {
            // Cuento
            TabView(selection: $currentChapter) {
                ForEach(Array(TV8Data.storyChapters.enumerated()), id: \.element.id) { index, chapter in
                    chapterView(chapter)
                        .tag(index)
                }
            }
            .tabViewStyle(.page(indexDisplayMode: .always))
            .indexViewStyle(.page(backgroundDisplayMode: .always))
            
            // Controles
            controlsSection
        }
        .navigationTitle("El Cuento de Alba")
        .navigationBarTitleDisplayMode(.inline)
        .background(
            LinearGradient(
                gradient: Gradient(colors: [Color.purple.opacity(0.1), Color.pink.opacity(0.1)]),
                startPoint: .top,
                endPoint: .bottom
            )
        )
    }
    
    // MARK: - Chapter View
    private func chapterView(_ chapter: TV8StoryChapter) -> some View {
        ScrollView {
            VStack(spacing: 24) {
                // Número de capítulo
                Text("Capítulo \(chapter.chapterNumber)")
                    .font(.caption)
                    .fontWeight(.semibold)
                    .foregroundColor(.purple)
                    .padding(.horizontal, 16)
                    .padding(.vertical, 6)
                    .background(
                        Capsule()
                            .fill(Color.purple.opacity(0.1))
                    )
                
                // Título
                Text(chapter.title)
                    .font(.system(size: 28))
                    .fontWeight(.bold)
                    .foregroundColor(.primary)
                    .multilineTextAlignment(.center)
                
                // Ilustración simbólica
                ZStack {
                    RoundedRectangle(cornerRadius: 20)
                        .fill(
                            LinearGradient(
                                gradient: Gradient(colors: [emotionColor(chapter.emotion).opacity(0.3), emotionColor(chapter.emotion).opacity(0.1)]),
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            )
                        )
                        .frame(height: 200)
                    
                    Image(systemName: chapter.illustration)
                        .font(.system(size: 80))
                        .foregroundColor(emotionColor(chapter.emotion))
                }
                
                // Narrativa
                Text(chapter.narrative)
                    .font(.title3)
                    .foregroundColor(.primary)
                    .lineSpacing(10)
                    .multilineTextAlignment(.leading)
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 16)
                            .fill(Color(.systemBackground))
                    )
                
                // Aprendizaje
                VStack(alignment: .leading, spacing: 12) {
                    HStack {
                        Image(systemName: "lightbulb.fill")
                            .foregroundColor(.yellow)
                        
                        Text("Aprendizaje")
                            .font(.headline)
                            .foregroundColor(.primary)
                    }
                    
                    Text(chapter.learningPoint)
                        .font(.body)
                        .foregroundColor(.secondary)
                        .italic()
                }
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 12)
                        .fill(Color.yellow.opacity(0.1))
                )
                
                // Pregunta interactiva
                if let question = chapter.interactiveQuestion {
                    VStack(alignment: .leading, spacing: 12) {
                        HStack {
                            Image(systemName: "hand.raised.fill")
                                .foregroundColor(.mint)
                            
                            Text("Para Ti")
                                .font(.headline)
                                .foregroundColor(.primary)
                        }
                        
                        Text(question)
                            .font(.title3)
                            .fontWeight(.medium)
                            .foregroundColor(.primary)
                    }
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 12)
                            .fill(Color.mint.opacity(0.1))
                    )
                }
            }
            .padding()
        }
    }
    
    // MARK: - Controls
    private var controlsSection: some View {
        HStack(spacing: 20) {
            // Anterior
            Button {
                withAnimation {
                    if currentChapter > 0 {
                        currentChapter -= 1
                    }
                }
            } label: {
                HStack {
                    Image(systemName: "chevron.left")
                    Text("Anterior")
                        .fontWeight(.semibold)
                }
                .foregroundColor(currentChapter > 0 ? .blue : .gray)
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 12)
                        .fill(Color(.systemBackground))
                )
            }
            .disabled(currentChapter == 0)
            
            // Indicador
            Text("\(currentChapter + 1) de \(TV8Data.storyChapters.count)")
                .font(.caption)
                .foregroundColor(.secondary)
            
            // Siguiente
            Button {
                withAnimation {
                    if currentChapter < TV8Data.storyChapters.count - 1 {
                        currentChapter += 1
                    }
                }
            } label: {
                HStack {
                    Text("Siguiente")
                        .fontWeight(.semibold)
                    Image(systemName: "chevron.right")
                }
                .foregroundColor(currentChapter < TV8Data.storyChapters.count - 1 ? .blue : .gray)
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 12)
                        .fill(Color(.systemBackground))
                )
            }
            .disabled(currentChapter == TV8Data.storyChapters.count - 1)
        }
        .padding()
        .background(Color(.systemGroupedBackground))
    }
    
    // MARK: - Helper
    private func emotionColor(_ emotion: String) -> Color {
        switch emotion {
        case "Rabia": return .red
        case "Esperanza": return .yellow
        case "Aprendizaje": return .mint
        case "Logro": return .green
        case "Aceptación": return .blue
        case "Comunidad": return .purple
        default: return .orange
        }
    }
}

#Preview {
    NavigationStack {
        TV8View()
    }
}

