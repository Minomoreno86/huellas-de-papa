import SwiftUI

/// Tarjeta que representa una herramienta práctica del Yes Brain
/// Muestra información básica y permite abrir la vista detallada
struct ToolCardView: View {
    let tool: YesBrainTool
    let onTap: () -> Void
    
    var body: some View {
        Button(action: {
            onTap()
            triggerHaptic()
        }) {
            VStack(alignment: .leading, spacing: 12) {
                // Header con ícono y duración
                HStack {
                    Image(systemName: tool.icon)
                        .font(.title2)
                        .foregroundColor(toolColor)
                        .frame(width: 32, height: 32)
                        .background(
                            Circle()
                                .fill(toolColor.opacity(0.1))
                        )
                    
                    Spacer()
                    
                    VStack(alignment: .trailing, spacing: 2) {
                        Text("\(tool.durationMinutes) min")
                            .font(.caption)
                            .fontWeight(.medium)
                            .foregroundColor(toolColor)
                        
                        Text(tool.recommendedAge)
                            .font(.caption2)
                            .foregroundColor(.secondary)
                    }
                }
                
                // Título y objetivo
                VStack(alignment: .leading, spacing: 8) {
                    Text(tool.name)
                        .font(.headline)
                        .fontWeight(.bold)
                        .foregroundColor(.primary)
                        .multilineTextAlignment(.leading)
                        .lineLimit(2)
                    
                    Text(tool.objective)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                        .multilineTextAlignment(.leading)
                        .lineLimit(3)
                }
                
                Spacer()
                
                // Footer con materiales
                HStack {
                    if !tool.materials.isEmpty {
                        HStack(spacing: 4) {
                            Image(systemName: "list.bullet")
                                .font(.caption)
                                .foregroundColor(.secondary)
                            
                            Text("\(tool.materials.count) material\(tool.materials.count == 1 ? "" : "es")")
                                .font(.caption)
                                .foregroundColor(.secondary)
                        }
                    }
                    
                    Spacer()
                    
                    Image(systemName: "arrow.right.circle.fill")
                        .font(.title3)
                        .foregroundColor(toolColor)
                }
            }
            .padding()
            .frame(height: 180)
            .background(
                RoundedRectangle(cornerRadius: 16)
                    .fill(Color(.systemBackground))
                    .overlay(
                        RoundedRectangle(cornerRadius: 16)
                            .stroke(toolColor.opacity(0.3), lineWidth: 1)
                    )
            )
            .shadow(
                color: toolColor.opacity(0.1),
                radius: 6,
                x: 0,
                y: 3
            )
        }
        .buttonStyle(PlainButtonStyle())
    }
    
    private var toolColor: Color {
        switch tool.color {
        case "blue": return .blue
        case "green": return .green
        case "purple": return .purple
        case "pink": return .pink
        case "red": return .red
        case "orange": return .orange
        case "cyan": return .cyan
        case "yellow": return .yellow
        case "indigo": return .indigo
        case "teal": return .teal
        case "brown": return .brown
        case "mint": return .mint
        default: return .blue
        }
    }
    
    private func triggerHaptic() {
        #if !os(macOS)
        let impactFeedback = UIImpactFeedbackGenerator(style: .light)
        impactFeedback.impactOccurred()
        #endif
    }
}

// MARK: - Preview
struct ToolCardView_Previews: PreviewProvider {
    static var previews: some View {
        let sampleTool = YesBrainTool(
            name: "El Semáforo Interno",
            category: "Balance",
            objective: "Enseñar al niño a reconocer sus niveles de activación emocional y autorregularse",
            materials: ["Imagen de semáforo", "Colores verde, amarillo y rojo"],
            steps: [
                "Explica que el semáforo tiene 3 colores: verde (tranquilo), amarillo (alerta) y rojo (muy activado)",
                "Pregunta: '¿En qué color te sientes ahora?' y escucha su respuesta",
                "Si está en amarillo o rojo, respira juntos: 'Inhala por la nariz, exhala por la boca'",
                "Cuenta hasta 5 inhalando y hasta 5 exhalando",
                "Pregunta nuevamente: '¿En qué color te sientes ahora?'"
            ],
            durationMinutes: 3,
            recommendedAge: "3-12 años",
            reflectionCue: "Acabas de enseñarle a tu hijo a ser su propio regulador emocional",
            icon: "trafficlight",
            color: "green"
        )
        
        VStack {
            ToolCardView(tool: sampleTool) {
                print("Tool tapped")
            }
            .padding()
            
            Spacer()
        }
        .background(Color(.systemGroupedBackground))
    }
}
