import SwiftUI

/// Tarjeta visual para mostrar un ejemplo clínico del libro
struct TA1ExampleCard: View {
    let example: TA1Example
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            // Escenario
            HStack(alignment: .top) {
                Image(systemName: "person.fill.questionmark")
                    .font(.title2)
                    .foregroundColor(.pink)
                    .frame(width: 40)
                
                VStack(alignment: .leading, spacing: 4) {
                    Text("Escenario")
                        .font(.caption)
                        .fontWeight(.semibold)
                        .foregroundColor(.secondary)
                    
                    Text(example.scenario)
                        .font(.body)
                        .fontWeight(.semibold)
                        .foregroundColor(.primary)
                }
            }
            
            // Estado emocional
            VStack(alignment: .leading, spacing: 8) {
                Label("Estado emocional", systemImage: "heart.fill")
                    .font(.caption)
                    .foregroundColor(.mint)
                
                Text(example.emotionalState)
                    .font(.subheadline)
                    .foregroundColor(.primary)
                    .padding(.horizontal, 12)
                    .padding(.vertical, 8)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(
                        RoundedRectangle(cornerRadius: 8)
                            .fill(Color.mint.opacity(0.1))
                    )
            }
            
            // Respuesta incondicional
            VStack(alignment: .leading, spacing: 8) {
                Label("Respuesta de amor", systemImage: "bubble.left.fill")
                    .font(.caption)
                    .foregroundColor(.pink)
                
                Text(example.unconditionalResponse)
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
            
            Divider()
            
            // Insight
            HStack(alignment: .top, spacing: 8) {
                Image(systemName: "lightbulb.fill")
                    .font(.caption)
                    .foregroundColor(.orange)
                
                Text(example.insight)
                    .font(.caption)
                    .foregroundColor(.secondary)
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
}

