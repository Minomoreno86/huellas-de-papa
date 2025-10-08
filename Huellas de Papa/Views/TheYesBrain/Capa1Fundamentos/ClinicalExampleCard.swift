import SwiftUI

/// Tarjeta que presenta un ejemplo clínico del Yes Brain
/// Muestra información básica y navega a vista detallada
struct ClinicalExampleCard: View {
    let example: Capa1Example
    @State private var isPressed = false
    
    var body: some View {
        NavigationLink(destination: ClinicalExampleDetailView(example: example)) {
            VStack(alignment: .leading, spacing: 16) {
                // Header con ícono y título
                HStack {
                    Image(systemName: "stethoscope")
                        .font(.title2)
                        .foregroundColor(.blue)
                    
                    Text("Escenario Clínico")
                        .font(.headline)
                        .fontWeight(.semibold)
                        .foregroundColor(.primary)
                    
                    Spacer()
                    
                    Image(systemName: "arrow.right.circle.fill")
                        .font(.title3)
                        .foregroundColor(.blue)
                }
                
                // Escenario
                Text(example.scenario)
                    .font(.subheadline)
                    .fontWeight(.medium)
                    .foregroundColor(.primary)
                    .multilineTextAlignment(.leading)
                    .lineLimit(2)
                
                Spacer()
                
                // Preview de la transición
                VStack(alignment: .leading, spacing: 8) {
                    HStack {
                        Image(systemName: "xmark.circle.fill")
                            .foregroundColor(.red)
                            .font(.caption)
                        
                        Text("No Brain")
                            .font(.caption)
                            .fontWeight(.semibold)
                            .foregroundColor(.primary)
                        
                        Spacer()
                        
                        Image(systemName: "arrow.right")
                            .font(.caption)
                            .foregroundColor(.blue)
                        
                        Spacer()
                        
                        Image(systemName: "checkmark.circle.fill")
                            .foregroundColor(.green)
                            .font(.caption)
                        
                        Text("Yes Brain")
                            .font(.caption)
                            .fontWeight(.semibold)
                            .foregroundColor(.primary)
                    }
                    
                    Text("Toca para ver la transición completa")
                        .font(.caption)
                        .foregroundColor(.blue)
                        .italic()
                }
            }
            .padding()
            .frame(width: 280, height: 140)
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
                radius: 6,
                x: 0,
                y: 3
            )
        }
        .buttonStyle(PlainButtonStyle())
        .scaleEffect(isPressed ? 0.98 : 1.0)
        .animation(.spring(response: 0.3, dampingFraction: 0.7), value: isPressed)
        .onLongPressGesture(minimumDuration: 0, maximumDistance: .infinity, pressing: { pressing in
            isPressed = pressing
        }, perform: {})
        .accessibilityLabel("Ejemplo clínico: \(example.scenario)")
        .accessibilityHint("Toca para ver detalles completos del ejemplo clínico")
    }
}

// MARK: - Preview
struct ClinicalExampleCard_Previews: PreviewProvider {
    static var previews: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 16) {
                ClinicalExampleCard(
                    example: Capa1Example(
                        scenario: "No quiere vestirse para la escuela",
                        reactionNo: "\"¡Vístete YA! ¡Vamos a llegar tarde!\"",
                        reactionYes: "\"Veo que te cuesta trabajo vestirte. ¿Qué necesitas para sentirte cómodo?\"",
                        clinicalInsight: "La conexión antes que la corrección activa el Yes Brain"
                    )
                )
                
                ClinicalExampleCard(
                    example: Capa1Example(
                        scenario: "Tiene una rabieta en el supermercado",
                        reactionNo: "\"¡Para ya! ¡Me estás avergonzando!\"",
                        reactionYes: "\"Veo que estás muy molesto. Estoy aquí contigo.\"",
                        clinicalInsight: "La validación emocional calma el sistema nervioso"
                    )
                )
            }
            .padding(.horizontal)
        }
        .background(Color(.systemGroupedBackground))
    }
}
