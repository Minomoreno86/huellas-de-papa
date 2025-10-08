import SwiftUI

struct PrincipleCardView: View {
    let principle: Capa2Principle
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            // Header con ícono y nombre
            HStack {
                Image(systemName: iconName)
                    .font(.title2)
                    .foregroundColor(iconColor)
                    .frame(width: 24, height: 24)
                
                Spacer()
                
                Image(systemName: "arrow.right.circle.fill")
                    .font(.title3)
                    .foregroundColor(iconColor)
            }
            
            // Nombre del principio
            Text(principle.name)
                .font(.headline)
                .fontWeight(.bold)
                .foregroundColor(.primary)
                .multilineTextAlignment(.leading)
            
            // Definición
            Text(principle.definition)
                .font(.body)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.leading)
                .lineLimit(2)
            
            Spacer()
            
            // Ejemplo parental básico
            VStack(alignment: .leading, spacing: 8) {
                Text("Ejemplo:")
                    .font(.caption)
                    .fontWeight(.semibold)
                    .foregroundColor(.primary)
                
                Text(principle.parentApplication)
                    .font(.subheadline)
                    .foregroundColor(iconColor)
                    .italic()
                    .multilineTextAlignment(.leading)
                    .lineLimit(2)
            }
            
        }
        .padding()
        .frame(width: 280, height: 200)
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(Color(.systemBackground))
                .overlay(
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(iconColor.opacity(0.3), lineWidth: 1)
                )
        )
        .shadow(
            color: iconColor.opacity(0.1),
            radius: 6,
            x: 0,
            y: 3
        )
        .onTapGesture {
            triggerHaptic()
        }
    }
    
    // MARK: - Computed Properties
    private var iconName: String {
        switch principle.name {
        case "Balance":
            return "scalemass"
        case "Resiliencia":
            return "arrow.clockwise.circle"
        case "Insight":
            return "brain.head.profile"
        case "Empatía":
            return "heart.circle"
        default:
            return "circle"
        }
    }
    
    private var iconColor: Color {
        switch principle.name {
        case "Balance":
            return .blue
        case "Resiliencia":
            return .green
        case "Insight":
            return .purple
        case "Empatía":
            return .mint
        default:
            return .blue
        }
    }
    
    // MARK: - Haptic Feedback
    private func triggerHaptic() {
        #if !os(macOS)
        let impactFeedback = UIImpactFeedbackGenerator(style: .light)
        impactFeedback.impactOccurred()
        #endif
    }
}

// MARK: - Preview
struct PrincipleCardView_Previews: PreviewProvider {
    static var previews: some View {
        let samplePrinciple = Capa2Principle(
            name: "Balance",
            definition: "Estado interno de calma y regulación ante el estrés",
            neuroBasis: "Integración amígdala ↔ corteza orbitofrontal",
            childExample: "Niño se frustra → padre mantiene tono y ritmo regulado",
            parentApplication: "Respiro, nombro, acompaño",
            quote: "Tu calma regula su cerebro"
        )
        
        VStack(spacing: 16) {
            PrincipleCardView(principle: samplePrinciple)
            PrincipleCardView(principle: samplePrinciple)
        }
        .padding()
        .previewLayout(.sizeThatFits)
    }
}