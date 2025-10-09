import SwiftUI

/// Tarjeta visual para mostrar un escenario de aplicación práctica
struct TA2ScenarioCard: View {
    let scenario: TA2Scenario
    @State private var isExpanded = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            // Header - Situación
            HStack(alignment: .top) {
                Image(systemName: "theatermasks.fill")
                    .font(.title2)
                    .foregroundColor(.pink)
                    .frame(width: 40)
                
                VStack(alignment: .leading, spacing: 4) {
                    Text("Situación")
                        .font(.caption)
                        .fontWeight(.semibold)
                        .foregroundColor(.secondary)
                    
                    Text(scenario.situation)
                        .font(.body)
                        .fontWeight(.semibold)
                        .foregroundColor(.primary)
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
            
            // Estado emocional
            HStack(spacing: 8) {
                Image(systemName: "heart.fill")
                    .font(.caption)
                    .foregroundColor(.mint)
                
                Text(scenario.emotionalState)
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
            .padding(.horizontal, 12)
            .padding(.vertical, 6)
            .background(
                RoundedRectangle(cornerRadius: 8)
                    .fill(Color.mint.opacity(0.1))
            )
            
            // Respuesta del libro
            VStack(alignment: .leading, spacing: 8) {
                Label("Del libro", systemImage: "quote.bubble.fill")
                    .font(.caption)
                    .foregroundColor(.pink)
                
                Text(scenario.unconditionalResponse)
                    .font(.subheadline)
                    .italic()
                    .foregroundColor(.primary)
                    .padding(.horizontal, 12)
                    .padding(.vertical, 8)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(
                        RoundedRectangle(cornerRadius: 8)
                            .fill(Color.pink.opacity(0.1))
                    )
            }
            
            // Contenido expandible
            if isExpanded {
                VStack(alignment: .leading, spacing: 16) {
                    Divider()
                    
                    // Qué evitar
                    VStack(alignment: .leading, spacing: 8) {
                        Label("Qué evitar", systemImage: "xmark.circle.fill")
                            .font(.caption)
                            .foregroundColor(.red)
                        
                        Text(scenario.whatToAvoid)
                            .font(.subheadline)
                            .foregroundColor(.primary)
                    }
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 8)
                            .fill(Color.red.opacity(0.05))
                    )
                    
                    // Qué hacer
                    VStack(alignment: .leading, spacing: 8) {
                        Label("Qué hacer", systemImage: "checkmark.circle.fill")
                            .font(.caption)
                            .foregroundColor(.green)
                        
                        Text(scenario.whatToDo)
                            .font(.subheadline)
                            .foregroundColor(.primary)
                    }
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 8)
                            .fill(Color.green.opacity(0.05))
                    )
                    
                    // Insight
                    HStack(alignment: .top, spacing: 8) {
                        Image(systemName: "lightbulb.fill")
                            .font(.caption)
                            .foregroundColor(.orange)
                        
                        Text(scenario.insight)
                            .font(.caption)
                            .foregroundColor(.secondary)
                    }
                }
                .transition(.opacity.combined(with: .move(edge: .top)))
            }
        }
        .padding()
        .frame(width: 340)
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
    
    private func triggerHaptic() {
        let impactFeedback = UIImpactFeedbackGenerator(style: .light)
        impactFeedback.impactOccurred()
    }
}

