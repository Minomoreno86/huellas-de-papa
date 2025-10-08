import SwiftUI

/// Tarjeta que representa un bloque teórico clave del Yes Brain
/// Se muestra en scroll horizontal para facilitar la navegación
struct TheoreticalSectionCard: View {
    let section: Capa1Section
    @State private var isPressed = false
    
    var body: some View {
        NavigationLink(destination: TheoreticalSectionDetailView(section: section)) {
            VStack(alignment: .leading, spacing: 16) {
                // Header con título y subtítulo
                HStack {
                    VStack(alignment: .leading, spacing: 8) {
                        Text(section.title)
                            .font(.headline)
                            .fontWeight(.bold)
                            .foregroundColor(.primary)
                        
                        Text(section.subtitle)
                            .font(.subheadline)
                            .fontWeight(.medium)
                            .foregroundColor(.blue)
                    }
                    
                    Spacer()
                    
                    Image(systemName: "arrow.right.circle.fill")
                        .font(.title3)
                        .foregroundColor(.blue)
                }
                
                // Descripción básica
                Text(section.description)
                    .font(.body)
                    .foregroundColor(.secondary)
                    .lineLimit(3)
                    .multilineTextAlignment(.leading)
                
                Spacer()
                
                // Idea clave destacada
                VStack(alignment: .leading, spacing: 8) {
                    Text("💡 Idea Clave del Libro:")
                        .font(.caption)
                        .fontWeight(.semibold)
                        .foregroundColor(.primary)
                    
                    Text(section.keyIdea)
                        .font(.subheadline)
                        .fontWeight(.medium)
                        .foregroundColor(.blue)
                        .italic()
                }
                .padding(.top, 8)
            }
            .padding()
            .frame(width: 280, height: 240)
            .background(
                RoundedRectangle(cornerRadius: 16)
                    .fill(Color(.systemBackground))
                    .overlay(
                        RoundedRectangle(cornerRadius: 16)
                            .stroke(
                                LinearGradient(
                                    gradient: Gradient(colors: [
                                        Color.blue.opacity(0.3),
                                        Color.mint.opacity(0.2)
                                    ]),
                                    startPoint: .topLeading,
                                    endPoint: .bottomTrailing
                                ),
                                lineWidth: 1
                            )
                    )
            )
            .shadow(
                color: Color.blue.opacity(0.1),
                radius: 8,
                x: 0,
                y: 4
            )
        }
        .buttonStyle(PlainButtonStyle())
        .scaleEffect(isPressed ? 0.95 : 1.0)
        .animation(.spring(response: 0.3, dampingFraction: 0.7), value: isPressed)
        .onLongPressGesture(minimumDuration: 0, maximumDistance: .infinity, pressing: { pressing in
            isPressed = pressing
        }, perform: {})
        .accessibilityLabel("\(section.title) - \(section.subtitle)")
        .accessibilityHint("Toca para ver detalles completos")
    }
}

// MARK: - Preview
struct TheoreticalSectionCard_Previews: PreviewProvider {
    static var previews: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 16) {
                TheoreticalSectionCard(
                    section: Capa1Section(
                        title: "Arquitectura del Cerebro",
                        subtitle: "Sí y No",
                        description: "Sistemas cerebrales implicados: amígdala, corteza PFC, cuerpo calloso, sistema de recompensa.",
                        keyIdea: "Tu calma regula su cerebro"
                    )
                )
                
                TheoreticalSectionCard(
                    section: Capa1Section(
                        title: "Neurointegración",
                        subtitle: "Estados de Apertura",
                        description: "Integración vertical, horizontal y relacional. Cómo la calma del adulto regula la neuroconectividad del niño.",
                        keyIdea: "Conexión antes que corrección"
                    )
                )
            }
            .padding(.horizontal)
        }
        .background(Color(.systemGroupedBackground))
    }
}
