import SwiftUI

/// Tarjeta visual para mostrar una herramienta práctica
struct TA3ToolCard: View {
    let tool: TA3Tool
    
    var body: some View {
        NavigationLink(destination: TA3ToolDetailView(tool: tool)) {
            VStack(alignment: .leading, spacing: 16) {
                // Header
                HStack {
                    Image(systemName: tool.icon)
                        .font(.title)
                        .foregroundStyle(
                            LinearGradient(
                                colors: [.pink, .mint],
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            )
                        )
                        .frame(width: 50, height: 50)
                        .background(
                            Circle()
                                .fill(Color.pink.opacity(0.1))
                        )
                    
                    Spacer()
                    
                    VStack(alignment: .trailing, spacing: 4) {
                        Text(tool.category)
                            .font(.caption)
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                            .padding(.horizontal, 12)
                            .padding(.vertical, 4)
                            .background(
                                Capsule()
                                    .fill(Color.mint)
                            )
                        
                        Label("\(tool.durationMinutes) min", systemImage: "clock.fill")
                            .font(.caption2)
                            .foregroundColor(.secondary)
                    }
                }
                
                // Nombre
                Text(tool.name)
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundColor(.primary)
                
                // Objetivo
                Text(tool.objective)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                    .lineLimit(2)
                
                // Edad recomendada
                HStack(spacing: 8) {
                    Image(systemName: "figure.child")
                        .font(.caption)
                        .foregroundColor(.pink)
                    
                    Text(tool.recommendedAge)
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
            }
            .padding()
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
        .buttonStyle(PlainButtonStyle())
    }
}

