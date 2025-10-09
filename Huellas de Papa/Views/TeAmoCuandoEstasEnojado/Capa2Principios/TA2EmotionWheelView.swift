import SwiftUI

/// Rueda de emociones válidas y aceptadas
/// Muestra todas las emociones del libro que merecen amor incondicional
struct TA2EmotionWheelView: View {
    let emotions = TA2EmotionalState.allEmotions
    @State private var selectedEmotion: TA2EmotionalState?
    
    var body: some View {
        VStack(spacing: 24) {
            // Título
            VStack(spacing: 8) {
                Image(systemName: "circle.grid.cross.fill")
                    .font(.largeTitle)
                    .foregroundStyle(
                        LinearGradient(
                            colors: [.pink, .mint],
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                    )
                
                Text("Todas las Emociones Son Válidas")
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(.primary)
                
                Text("Del libro: cada emoción merece amor incondicional")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
            .padding(.top)
            
            // Grid de emociones
            LazyVGrid(columns: [
                GridItem(.flexible()),
                GridItem(.flexible())
            ], spacing: 16) {
                ForEach(emotions) { emotion in
                    Button(action: {
                        withAnimation(.spring()) {
                            selectedEmotion = emotion
                            triggerHaptic()
                        }
                    }) {
                        VStack(spacing: 12) {
                            // Emoji o icono representativo
                            Image(systemName: emotionIcon(for: emotion.emotion))
                                .font(.largeTitle)
                                .foregroundStyle(
                                    LinearGradient(
                                        colors: [.pink, .mint],
                                        startPoint: .topLeading,
                                        endPoint: .bottomTrailing
                                    )
                                )
                            
                            Text(emotion.emotion)
                                .font(.headline)
                                .foregroundColor(.primary)
                            
                            if emotion.fromBook {
                                Image(systemName: "book.fill")
                                    .font(.caption)
                                    .foregroundColor(.mint)
                            }
                        }
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 12)
                                .fill(
                                    selectedEmotion?.id == emotion.id ?
                                    Color.pink.opacity(0.2) :
                                    Color(.systemBackground)
                                )
                        )
                        .overlay(
                            RoundedRectangle(cornerRadius: 12)
                                .stroke(
                                    LinearGradient(
                                        colors: [.pink.opacity(0.3), .mint.opacity(0.2)],
                                        startPoint: .topLeading,
                                        endPoint: .bottomTrailing
                                    ),
                                    lineWidth: selectedEmotion?.id == emotion.id ? 2 : 1
                                )
                        )
                    }
                }
            }
            
            // Detalle de emoción seleccionada
            if let emotion = selectedEmotion {
                VStack(alignment: .leading, spacing: 16) {
                    Divider()
                    
                    VStack(alignment: .leading, spacing: 12) {
                        Text(emotion.description)
                            .font(.body)
                            .foregroundColor(.primary)
                        
                        Label(emotion.validationPhrase, systemImage: "quote.bubble.fill")
                            .font(.subheadline)
                            .italic()
                            .foregroundColor(.pink)
                            .padding()
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .background(
                                RoundedRectangle(cornerRadius: 8)
                                    .fill(Color.pink.opacity(0.1))
                            )
                    }
                }
                .padding()
                .transition(.opacity.combined(with: .move(edge: .bottom)))
            }
        }
        .padding()
    }
    
    private func emotionIcon(for emotion: String) -> String {
        switch emotion.lowercased() {
        case "enojado": return "flame.fill"
        case "triste": return "cloud.rain.fill"
        case "alegre": return "sun.max.fill"
        case "melancólico": return "moon.fill"
        case "apasionado": return "heart.fill"
        case "tranquilo": return "leaf.fill"
        case "frustrado": return "exclamationmark.triangle.fill"
        case "cansado": return "zzz"
        default: return "circle.fill"
        }
    }
    
    private func triggerHaptic() {
        let impactFeedback = UIImpactFeedbackGenerator(style: .light)
        impactFeedback.impactOccurred()
    }
}

