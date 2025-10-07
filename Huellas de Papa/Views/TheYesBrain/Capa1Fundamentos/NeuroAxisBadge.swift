import SwiftUI

/// Badge que representa un eje neurobiológico clave en el Yes Brain
/// Muestra información sobre áreas cerebrales como amígdala, corteza prefrontal, etc.
struct NeuroAxisBadge: View {
    let name: String
    let role: String
    
    @State private var isPressed = false
    
    var body: some View {
        Button(action: {
            withAnimation(.spring(response: 0.2, dampingFraction: 0.8)) {
                isPressed.toggle()
                triggerHaptic()
            }
        }) {
            VStack(spacing: 8) {
                // Icono del eje
                iconView
                
                // Nombre del eje
                Text(name)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundColor(.primary)
                    .multilineTextAlignment(.center)
                
                // Rol del eje
                Text(role)
                    .font(.caption)
                    .foregroundColor(.secondary)
                    .multilineTextAlignment(.center)
                    .lineLimit(2)
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 12)
            .background(
                RoundedRectangle(cornerRadius: 12)
                    .fill(backgroundColor)
                    .overlay(
                        RoundedRectangle(cornerRadius: 12)
                            .stroke(borderColor, lineWidth: 1)
                    )
            )
            .scaleEffect(isPressed ? 0.95 : 1.0)
            .shadow(
                color: shadowColor,
                radius: isPressed ? 2 : 4,
                x: 0,
                y: isPressed ? 1 : 2
            )
        }
        .buttonStyle(PlainButtonStyle())
        .accessibilityLabel("\(name) - \(role)")
        .accessibilityHint("Toca para obtener más información sobre este eje neurobiológico")
    }
    
    // MARK: - Icon View
    private var iconView: some View {
        ZStack {
            Circle()
                .fill(iconBackgroundColor)
                .frame(width: 40, height: 40)
            
            Image(systemName: iconName)
                .font(.title3)
                .foregroundColor(iconColor)
        }
    }
    
    // MARK: - Computed Properties
    private var backgroundColor: Color {
        if isPressed {
            return axisColor.opacity(0.15)
        } else {
            return Color(.systemBackground)
        }
    }
    
    private var borderColor: Color {
        if isPressed {
            return axisColor
        } else {
            return Color(.systemGray4)
        }
    }
    
    private var shadowColor: Color {
        if isPressed {
            return axisColor.opacity(0.3)
        } else {
            return .black.opacity(0.1)
        }
    }
    
    private var iconBackgroundColor: Color {
        if isPressed {
            return axisColor.opacity(0.2)
        } else {
            return axisColor.opacity(0.1)
        }
    }
    
    private var iconColor: Color {
        axisColor
    }
    
    private var iconName: String {
        switch name.lowercased() {
        case "amígdala", "amygdala":
            return "exclamationmark.triangle.fill"
        case "corteza prefrontal", "prefrontal":
            return "brain.head.profile"
        case "integración", "integracion":
            return "link"
        case "recompensa", "reward":
            return "star.fill"
        default:
            return "brain"
        }
    }
    
    private var axisColor: Color {
        switch name.lowercased() {
        case "amígdala", "amygdala":
            return .red
        case "corteza prefrontal", "prefrontal":
            return .blue
        case "integración", "integracion":
            return .purple
        case "recompensa", "reward":
            return .orange
        default:
            return .gray
        }
    }
    
    // MARK: - Haptic Feedback
    private func triggerHaptic() {
        let impactFeedback = UIImpactFeedbackGenerator(style: .light)
        impactFeedback.impactOccurred()
    }
}

// MARK: - Preview
struct NeuroAxisBadge_Previews: PreviewProvider {
    static var previews: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 12) {
                NeuroAxisBadge(name: "Amígdala", role: "Detección de amenazas")
                NeuroAxisBadge(name: "Corteza Prefrontal", role: "Regulación ejecutiva")
                NeuroAxisBadge(name: "Integración", role: "Conexión hemisférica")
                NeuroAxisBadge(name: "Recompensa", role: "Sistema de motivación")
            }
            .padding(.horizontal)
        }
        .background(Color(.systemGroupedBackground))
    }
}
