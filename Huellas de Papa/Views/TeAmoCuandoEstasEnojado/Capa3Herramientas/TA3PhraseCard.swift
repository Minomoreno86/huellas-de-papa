import SwiftUI

/// Tarjeta visual para mostrar una frase de validación emocional
struct TA3PhraseCard: View {
    let phrase: TA3Phrase
    @State private var isExpanded = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            // Header
            HStack {
                VStack(alignment: .leading, spacing: 8) {
                    HStack {
                        Image(systemName: emotionIcon(for: phrase.emotion))
                            .font(.title2)
                            .foregroundColor(.pink)
                        
                        Text(phrase.emotion)
                            .font(.headline)
                            .fontWeight(.bold)
                            .foregroundColor(.primary)
                    }
                    
                    if phrase.fromBook {
                        Label("Del libro", systemImage: "book.fill")
                            .font(.caption)
                            .foregroundColor(.mint)
                    }
                }
                
                Spacer()
                
                Button(action: {
                    withAnimation(.spring()) {
                        isExpanded.toggle()
                        triggerHaptic()
                    }
                }) {
                    Image(systemName: isExpanded ? "chevron.up.circle.fill" : "chevron.down.circle.fill")
                        .font(.title2)
                        .foregroundColor(.mint)
                }
            }
            
            // Frase
            Text(phrase.phrase)
                .font(.title3)
                .italic()
                .foregroundColor(.primary)
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(
                    RoundedRectangle(cornerRadius: 8)
                        .fill(
                            LinearGradient(
                                colors: [Color.pink.opacity(0.1), Color.mint.opacity(0.05)],
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            )
                        )
                )
            
            // Contenido expandible
            if isExpanded {
                VStack(alignment: .leading, spacing: 16) {
                    Divider()
                    
                    // Cuándo usar
                    VStack(alignment: .leading, spacing: 8) {
                        Label("Cuándo usar", systemImage: "clock.arrow.circlepath")
                            .font(.caption)
                            .fontWeight(.semibold)
                            .foregroundColor(.pink)
                        
                        Text(phrase.whenToUse)
                            .font(.subheadline)
                            .foregroundColor(.primary)
                    }
                    
                    // Ejemplo
                    VStack(alignment: .leading, spacing: 8) {
                        Label("Ejemplo", systemImage: "bubble.left.fill")
                            .font(.caption)
                            .fontWeight(.semibold)
                            .foregroundColor(.mint)
                        
                        Text(phrase.example)
                            .font(.subheadline)
                            .italic()
                            .foregroundColor(.primary)
                            .padding()
                            .background(
                                RoundedRectangle(cornerRadius: 8)
                                    .fill(Color.mint.opacity(0.1))
                            )
                    }
                }
                .transition(.opacity.combined(with: .move(edge: .top)))
            }
        }
        .padding()
        .frame(width: 320)
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(Color(.systemBackground))
                .shadow(color: Color.pink.opacity(0.15), radius: 10, x: 0, y: 4)
        )
        .overlay(
            RoundedRectangle(cornerRadius: 16)
                .stroke(
                    LinearGradient(
                        colors: [.pink.opacity(0.4), .mint.opacity(0.3)],
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    ),
                    lineWidth: 1.5
                )
        )
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

