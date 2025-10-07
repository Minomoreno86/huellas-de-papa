import SwiftUI

// MARK: - Capa 8: Componentes Compartidos
// Componentes reutilizables para las vistas de Capa 8
// Diseño limpio y eficiente, sin animaciones excesivas

// MARK: - Burbujas de Emoción
struct EmotionBubble: View {
    let emotion: String
    let color: Color
    let isSelected: Bool
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            VStack(spacing: 8) {
                Circle()
                    .fill(color)
                    .frame(width: 60, height: 60)
                    .overlay(
                        Circle()
                            .stroke(isSelected ? Color.black : Color.clear, lineWidth: 3)
                    )
                
                Text(emotion)
                    .font(.caption)
                    .fontWeight(.medium)
                    .foregroundColor(.primary)
            }
        }
        .buttonStyle(PlainButtonStyle())
    }
}

// MARK: - Anillo de Respiración
struct BreathRing: View {
    @Binding var isBreathing: Bool
    @State private var scale: CGFloat = 1.0
    
    var body: some View {
        ZStack {
            Circle()
                .stroke(Color.blue.opacity(0.3), lineWidth: 4)
                .frame(width: 200, height: 200)
            
            Circle()
                .stroke(Color.blue, lineWidth: 8)
                .frame(width: 150, height: 150)
                .scaleEffect(scale)
                .animation(.easeInOut(duration: 4), value: scale)
        }
        .onChange(of: isBreathing) { _, breathing in
            if breathing {
                startBreathingAnimation()
            } else {
                stopBreathingAnimation()
            }
        }
    }
    
    private func startBreathingAnimation() {
        withAnimation(.easeInOut(duration: 4).repeatForever(autoreverses: true)) {
            scale = 1.3
        }
    }
    
    private func stopBreathingAnimation() {
        withAnimation(.easeInOut(duration: 0.5)) {
            scale = 1.0
        }
    }
}

// MARK: - Tarjetas de Progreso
struct ProgressCard: View {
    let title: String
    let progress: Double
    let color: Color
    
    var body: some View {
        VStack(spacing: 12) {
            Text(title)
                .font(.headline)
                .fontWeight(.semibold)
                .foregroundColor(.primary)
            
            ProgressView(value: progress)
                .progressViewStyle(LinearProgressViewStyle(tint: color))
            
            Text("\(Int(progress * 100))%")
                .font(.caption)
                .foregroundColor(.secondary)
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(Color.white.opacity(0.8))
                .shadow(color: .black.opacity(0.1), radius: 4, x: 0, y: 2)
        )
    }
}

// MARK: - Botón de Acción Principal
struct PrimaryActionButton: View {
    let title: String
    let color: Color
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.body)
                .fontWeight(.semibold)
                .foregroundColor(.white)
                .frame(maxWidth: .infinity)
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 12)
                        .fill(color)
                )
        }
        .buttonStyle(PlainButtonStyle())
    }
}

// MARK: - Tarjeta de Información
struct InfoCard: View {
    let title: String
    let content: String
    let icon: String
    let color: Color
    
    var body: some View {
        VStack(spacing: 12) {
            HStack {
                Image(systemName: icon)
                    .foregroundColor(color)
                    .font(.title2)
                
                Text(title)
                    .font(.headline)
                    .fontWeight(.semibold)
                    .foregroundColor(.primary)
                
                Spacer()
            }
            
            Text(content)
                .font(.body)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.leading)
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(Color.white.opacity(0.8))
                .shadow(color: .black.opacity(0.1), radius: 4, x: 0, y: 2)
        )
    }
}

// MARK: - Indicador de Estado
struct StatusIndicator: View {
    let status: String
    let color: Color
    let isActive: Bool
    
    var body: some View {
        HStack(spacing: 8) {
            Circle()
                .fill(isActive ? color : Color.gray.opacity(0.3))
                .frame(width: 12, height: 12)
            
            Text(status)
                .font(.caption)
                .fontWeight(.medium)
                .foregroundColor(isActive ? color : .secondary)
        }
    }
}

// MARK: - Lista de Elementos
struct SimpleList: View {
    let items: [String]
    let color: Color
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            ForEach(items, id: \.self) { item in
                HStack(spacing: 12) {
                    Circle()
                        .fill(color)
                        .frame(width: 8, height: 8)
                    
                    Text(item)
                        .font(.body)
                        .foregroundColor(.primary)
                    
                    Spacer()
                }
            }
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(Color.white.opacity(0.6))
                .shadow(color: .black.opacity(0.05), radius: 2, x: 0, y: 1)
        )
    }
}

// MARK: - Preview
#Preview {
    VStack(spacing: 20) {
        EmotionBubble(
            emotion: "Feliz",
            color: .yellow,
            isSelected: true,
            action: {}
        )
        
        ProgressCard(
            title: "Progreso",
            progress: 0.7,
            color: .blue
        )
        
        PrimaryActionButton(
            title: "Acción Principal",
            color: .green,
            action: {}
        )
        
        InfoCard(
            title: "Información",
            content: "Este es un ejemplo de tarjeta de información.",
            icon: "info.circle",
            color: .blue
        )
    }
    .padding()
}