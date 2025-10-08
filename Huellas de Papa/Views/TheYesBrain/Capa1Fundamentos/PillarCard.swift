import SwiftUI

/// Tarjeta que representa uno de los cuatro pilares del Yes Brain
/// Muestra información básica y navega a vista detallada
struct PillarCard: View {
    let pillar: Capa1Pillar
    @State private var isPressed = false
    
    // Colores específicos para cada pilar
    private var pillarColor: Color {
        switch pillar.name {
        case "Equilibrio":
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
    
    // Íconos específicos para cada pilar
    private var pillarIcon: String {
        switch pillar.name {
        case "Equilibrio":
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
    
    var body: some View {
        NavigationLink(destination: PillarDetailView(pillar: pillar)) {
            VStack(alignment: .leading, spacing: 16) {
                // Header con ícono y nombre
                HStack {
                    Image(systemName: pillarIcon)
                        .font(.title2)
                        .foregroundColor(pillarColor)
                        .frame(width: 24, height: 24)
                    
                    Spacer()
                    
                    Image(systemName: "arrow.right.circle.fill")
                        .font(.title3)
                        .foregroundColor(pillarColor)
                }
                
                // Nombre del pilar
                Text(pillar.name)
                    .font(.headline)
                    .fontWeight(.bold)
                    .foregroundColor(.primary)
                    .multilineTextAlignment(.leading)
                
                // Definición
                Text(pillar.definition)
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
                    
                    Text(pillar.parentalExample)
                        .font(.subheadline)
                        .foregroundColor(pillarColor)
                        .italic()
                        .multilineTextAlignment(.leading)
                        .lineLimit(2)
                }
            }
            .padding()
            .frame(height: 160)
            .background(
                RoundedRectangle(cornerRadius: 16)
                    .fill(Color(.systemBackground))
                    .overlay(
                        RoundedRectangle(cornerRadius: 16)
                            .stroke(pillarColor.opacity(0.3), lineWidth: 1)
                    )
            )
            .shadow(
                color: pillarColor.opacity(0.1),
                radius: 6,
                x: 0,
                y: 3
            )
        }
        .buttonStyle(PlainButtonStyle())
        .scaleEffect(isPressed ? 0.95 : 1.0)
        .animation(.spring(response: 0.3, dampingFraction: 0.7), value: isPressed)
        .onLongPressGesture(minimumDuration: 0, maximumDistance: .infinity, pressing: { pressing in
            isPressed = pressing
        }, perform: {})
        .accessibilityLabel("Pilar \(pillar.name)")
        .accessibilityHint("Toca para ver detalles completos del pilar")
        .accessibilityValue(pillar.definition)
    }
}

// MARK: - Preview
struct PillarCard_Previews: PreviewProvider {
    static var previews: some View {
        LazyVGrid(columns: [
            GridItem(.flexible()),
            GridItem(.flexible())
        ], spacing: 16) {
            PillarCard(
                pillar: Capa1Pillar(
                    name: "Equilibrio",
                    definition: "Regular emociones y cuerpo",
                    parentalExample: "\"Respiramos juntos antes de hablar.\"",
                    brainPathway: "Corteza orbitofrontal ↔ amígdala"
                )
            )
            
            PillarCard(
                pillar: Capa1Pillar(
                    name: "Resiliencia",
                    definition: "Volver al equilibrio tras el error",
                    parentalExample: "\"No pasa nada, inténtalo otra vez.\"",
                    brainPathway: "Cíngulo anterior ↔ dopamina"
                )
            )
        }
        .padding()
        .background(Color(.systemGroupedBackground))
    }
}
