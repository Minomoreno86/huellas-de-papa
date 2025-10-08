import SwiftUI

/// Banner que muestra una frase de conexión para usar en situaciones cotidianas
struct PhraseBannerView: View {
    let phrase: YesBrainPhrase
    @State private var isExpanded: Bool = false
    
    var body: some View {
        Button(action: {
            withAnimation(.spring(response: 0.6, dampingFraction: 0.8)) {
                isExpanded.toggle()
            }
            triggerHaptic()
        }) {
            VStack(alignment: .leading, spacing: 12) {
                // Header con ícono y pilar
                HStack {
                    Image(systemName: phrase.icon)
                        .font(.title3)
                        .foregroundColor(phraseColor)
                        .frame(width: 24, height: 24)
                        .background(
                            Circle()
                                .fill(phraseColor.opacity(0.1))
                        )
                    
                    Spacer()
                    
                    Text(phrase.pillar)
                        .font(.caption)
                        .fontWeight(.medium)
                        .padding(.horizontal, 8)
                        .padding(.vertical, 4)
                        .background(
                            RoundedRectangle(cornerRadius: 8)
                                .fill(phraseColor.opacity(0.2))
                        )
                        .foregroundColor(phraseColor)
                }
                
                // Contexto
                Text(phrase.context)
                    .font(.subheadline)
                    .fontWeight(.medium)
                    .foregroundColor(.secondary)
                    .multilineTextAlignment(.leading)
                    .lineLimit(isExpanded ? nil : 1)
                
                // Frase principal
                Text(phrase.phrase)
                    .font(.body)
                    .fontWeight(.medium)
                    .foregroundColor(.primary)
                    .multilineTextAlignment(.leading)
                    .lineLimit(isExpanded ? nil : 2)
                
                // Expand indicator
                if !isExpanded {
                    HStack {
                        Spacer()
                        Image(systemName: "chevron.down")
                            .font(.caption)
                            .foregroundColor(.secondary)
                    }
                } else {
                    HStack {
                        Spacer()
                        Image(systemName: "chevron.up")
                            .font(.caption)
                            .foregroundColor(.secondary)
                    }
                }
            }
            .padding()
            .frame(width: 280, alignment: .leading)
            .background(
                RoundedRectangle(cornerRadius: 16)
                    .fill(Color(.systemBackground))
                    .overlay(
                        RoundedRectangle(cornerRadius: 16)
                            .stroke(phraseColor.opacity(0.3), lineWidth: 1)
                    )
            )
            .shadow(
                color: phraseColor.opacity(0.1),
                radius: 4,
                x: 0,
                y: 2
            )
        }
        .buttonStyle(PlainButtonStyle())
    }
    
    private var phraseColor: Color {
        switch phrase.color {
        case "blue": return .blue
        case "green": return .green
        case "purple": return .purple
        case "pink": return .pink
        case "red": return .red
        case "orange": return .orange
        case "cyan": return .cyan
        case "yellow": return .yellow
        case "indigo": return .indigo
        case "teal": return .teal
        case "brown": return .brown
        case "mint": return .mint
        default: return .blue
        }
    }
    
    private func triggerHaptic() {
        #if !os(macOS)
        let impactFeedback = UIImpactFeedbackGenerator(style: .light)
        impactFeedback.impactOccurred()
        #endif
    }
}

// MARK: - Preview
struct PhraseBannerView_Previews: PreviewProvider {
    static var previews: some View {
        let samplePhrase = YesBrainPhrase(
            context: "Cuando el niño está muy activado",
            phrase: "Veo que estás muy activado. Vamos a respirar juntos para calmarnos.",
            pillar: "Balance",
            icon: "wind",
            color: "blue"
        )
        
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 16) {
                PhraseBannerView(phrase: samplePhrase)
                
                PhraseBannerView(phrase: YesBrainPhrase(
                    context: "Después de un error o conflicto",
                    phrase: "Los errores son cómo aprendemos. ¿Qué podemos aprender de esto?",
                    pillar: "Resiliencia",
                    icon: "arrow.clockwise",
                    color: "orange"
                ))
            }
            .padding()
        }
        .background(Color(.systemGroupedBackground))
    }
}
