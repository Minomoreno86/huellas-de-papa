import SwiftUI

/// Tarjeta que representa uno de los 4 pilares del Yes Brain
/// Muestra información sobre Balance, Resiliencia, Insight o Empatía
struct PillarCard: View {
    let pillar: YesBrainPillar
    let isSelected: Bool
    let onTap: () -> Void
    
    @State private var isPressed = false
    
    var body: some View {
        Button(action: {
            withAnimation(.spring(response: 0.3, dampingFraction: 0.7)) {
                onTap()
                triggerHaptic()
            }
        }) {
            VStack(spacing: 12) {
                // Icono del pilar
                iconView
                
                // Título del pilar
                Text(pillar.rawValue)
                    .font(.headline)
                    .fontWeight(.semibold)
                    .foregroundColor(.primary)
                    .multilineTextAlignment(.center)
                
                // Descripción del pilar
                Text(pillar.description)
                    .font(.caption)
                    .foregroundColor(.secondary)
                    .multilineTextAlignment(.center)
                    .lineLimit(2)
                
                // Indicador de selección
                if isSelected {
                    selectionIndicator
                }
            }
            .padding()
            .frame(maxWidth: .infinity)
            .background(
                RoundedRectangle(cornerRadius: 16)
                    .fill(backgroundColor)
                    .overlay(
                        RoundedRectangle(cornerRadius: 16)
                            .stroke(borderColor, lineWidth: isSelected ? 2 : 1)
                    )
            )
            .scaleEffect(isPressed ? 0.95 : 1.0)
            .shadow(
                color: shadowColor,
                radius: isSelected ? 8 : 4,
                x: 0,
                y: isSelected ? 4 : 2
            )
        }
        .buttonStyle(PlainButtonStyle())
        .onLongPressGesture(minimumDuration: 0, maximumDistance: .infinity, pressing: { pressing in
            withAnimation(.easeInOut(duration: 0.1)) {
                isPressed = pressing
            }
        }, perform: {})
        .accessibilityLabel("\(pillar.rawValue) - \(pillar.description)")
        .accessibilityHint("Toca para obtener más información sobre este pilar")
    }
    
    // MARK: - Icon View
    private var iconView: some View {
        ZStack {
            Circle()
                .fill(iconBackgroundColor)
                .frame(width: 50, height: 50)
            
            Image(systemName: iconName)
                .font(.title2)
                .foregroundColor(iconColor)
        }
    }
    
    // MARK: - Selection Indicator
    private var selectionIndicator: some View {
        HStack(spacing: 4) {
            Image(systemName: "checkmark.circle.fill")
                .font(.caption)
                .foregroundColor(.blue)
            
            Text("Seleccionado")
                .font(.caption)
                .fontWeight(.medium)
                .foregroundColor(.blue)
        }
        .padding(.horizontal, 8)
        .padding(.vertical, 4)
        .background(
            Capsule()
                .fill(Color.blue.opacity(0.1))
        )
    }
    
    // MARK: - Computed Properties
    private var backgroundColor: Color {
        if isSelected {
            return pillarColor.opacity(0.1)
        } else {
            return Color(.systemBackground)
        }
    }
    
    private var borderColor: Color {
        if isSelected {
            return pillarColor
        } else {
            return Color(.systemGray4)
        }
    }
    
    private var shadowColor: Color {
        if isSelected {
            return pillarColor.opacity(0.3)
        } else {
            return .black.opacity(0.1)
        }
    }
    
    private var iconBackgroundColor: Color {
        if isSelected {
            return pillarColor.opacity(0.2)
        } else {
            return pillarColor.opacity(0.1)
        }
    }
    
    private var iconColor: Color {
        pillarColor
    }
    
    private var iconName: String {
        switch pillar {
        case .balance:
            return "scalemass"
        case .resilience:
            return "heart.fill"
        case .insight:
            return "lightbulb.fill"
        case .empathy:
            return "person.2.fill"
        }
    }
    
    private var pillarColor: Color {
        switch pillar {
        case .balance:
            return .blue
        case .resilience:
            return .orange
        case .insight:
            return .purple
        case .empathy:
            return .green
        }
    }
    
    // MARK: - Haptic Feedback
    private func triggerHaptic() {
        let impactFeedback = UIImpactFeedbackGenerator(style: .light)
        impactFeedback.impactOccurred()
    }
}

// MARK: - Preview
struct PillarCard_Previews: PreviewProvider {
    static var previews: some View {
        LazyVGrid(columns: [
            GridItem(.flexible()),
            GridItem(.flexible())
        ], spacing: 16) {
            ForEach(YesBrainPillar.allCases, id: \.self) { pillar in
                PillarCard(
                    pillar: pillar,
                    isSelected: pillar == .balance
                ) {
                    print("Tapped \(pillar.rawValue)")
                }
            }
        }
        .padding()
    }
}
