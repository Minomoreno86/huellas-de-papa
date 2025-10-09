import SwiftUI

/// Vista detallada de una herramienta práctica
struct TA3ToolDetailView: View {
    let tool: TA3Tool
    
    var body: some View {
        ScrollView {
            VStack(spacing: 24) {
                // Header
                VStack(spacing: 16) {
                    Image(systemName: tool.icon)
                        .font(.system(size: 80))
                        .foregroundStyle(
                            LinearGradient(
                                colors: [.pink, .mint],
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            )
                        )
                    
                    Text(tool.name)
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundStyle(
                            LinearGradient(
                                colors: [.pink, .mint],
                                startPoint: .leading,
                                endPoint: .trailing
                            )
                        )
                        .multilineTextAlignment(.center)
                    
                    HStack(spacing: 16) {
                        Label(tool.category, systemImage: "tag.fill")
                            .font(.caption)
                            .foregroundColor(.mint)
                        
                        Label("\(tool.durationMinutes) min", systemImage: "clock.fill")
                            .font(.caption)
                            .foregroundColor(.pink)
                        
                        Label(tool.recommendedAge, systemImage: "figure.child")
                            .font(.caption)
                            .foregroundColor(.secondary)
                    }
                }
                .padding(.top)
                
                // Objetivo
                VStack(alignment: .leading, spacing: 12) {
                    Label("Objetivo", systemImage: "target")
                        .font(.headline)
                        .foregroundColor(.pink)
                    
                    Text(tool.objective)
                        .font(.body)
                        .foregroundColor(.primary)
                }
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(
                    RoundedRectangle(cornerRadius: 12)
                        .fill(Color.pink.opacity(0.1))
                )
                
                // Referencia del libro
                VStack(alignment: .leading, spacing: 12) {
                    Label("Del libro de Erin Winters", systemImage: "book.fill")
                        .font(.headline)
                        .foregroundColor(.mint)
                    
                    Text("\"")
                        .font(.title)
                        .foregroundColor(.mint.opacity(0.3))
                        + Text(tool.bookReference)
                        .font(.body)
                        .italic()
                        .foregroundColor(.primary)
                        + Text("\"")
                        .font(.title)
                        .foregroundColor(.mint.opacity(0.3))
                }
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(
                    RoundedRectangle(cornerRadius: 12)
                        .fill(Color.mint.opacity(0.1))
                )
                
                // Materiales
                if !tool.materials.isEmpty {
                    VStack(alignment: .leading, spacing: 12) {
                        Label("Materiales", systemImage: "list.bullet")
                            .font(.headline)
                            .foregroundColor(.pink)
                        
                        VStack(alignment: .leading, spacing: 8) {
                            ForEach(Array(tool.materials.enumerated()), id: \.offset) { index, material in
                                HStack(alignment: .top, spacing: 8) {
                                    Image(systemName: "checkmark.circle.fill")
                                        .font(.caption)
                                        .foregroundColor(.mint)
                                    
                                    Text(material)
                                        .font(.body)
                                        .foregroundColor(.primary)
                                }
                            }
                        }
                    }
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(
                        RoundedRectangle(cornerRadius: 12)
                            .fill(Color(.systemBackground))
                    )
                }
                
                // Pasos
                VStack(alignment: .leading, spacing: 12) {
                    Label("Pasos a seguir", systemImage: "list.number")
                        .font(.headline)
                        .foregroundColor(.pink)
                    
                    VStack(alignment: .leading, spacing: 16) {
                        ForEach(Array(tool.steps.enumerated()), id: \.offset) { index, step in
                            HStack(alignment: .top, spacing: 12) {
                                Text("\(index + 1)")
                                    .font(.headline)
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                                    .frame(width: 28, height: 28)
                                    .background(
                                        Circle()
                                            .fill(
                                                LinearGradient(
                                                    colors: [.pink, .mint],
                                                    startPoint: .topLeading,
                                                    endPoint: .bottomTrailing
                                                )
                                            )
                                    )
                                
                                Text(step)
                                    .font(.body)
                                    .foregroundColor(.primary)
                            }
                        }
                    }
                }
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(
                    RoundedRectangle(cornerRadius: 12)
                        .fill(
                            LinearGradient(
                                colors: [Color.pink.opacity(0.05), Color.mint.opacity(0.05)],
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            )
                        )
                )
                
                // Reflexión final
                VStack(alignment: .leading, spacing: 12) {
                    Label("Reflexión", systemImage: "lightbulb.fill")
                        .font(.headline)
                        .foregroundColor(.orange)
                    
                    Text(tool.reflectionCue)
                        .font(.body)
                        .italic()
                        .foregroundColor(.primary)
                }
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(
                    RoundedRectangle(cornerRadius: 12)
                        .fill(Color.orange.opacity(0.1))
                )
            }
            .padding()
        }
        .background(Color(.systemGroupedBackground))
        .navigationTitle("Herramienta")
        .navigationBarTitleDisplayMode(.inline)
    }
}

