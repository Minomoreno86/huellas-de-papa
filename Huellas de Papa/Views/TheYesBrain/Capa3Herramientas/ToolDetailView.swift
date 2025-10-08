import SwiftUI

/// Vista detallada de una herramienta con pasos, materiales y reflexión
struct ToolDetailView: View {
    let tool: YesBrainTool
    @Environment(\.dismiss) private var dismiss
    @State private var currentStep: Int = 0
    @State private var showingReflection: Bool = false
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 24) {
                    // Header
                    headerSection
                    
                    // Materials Section
                    if !tool.materials.isEmpty {
                        materialsSection
                    }
                    
                    // Steps Section
                    stepsSection
                    
                    // Practice Button
                    practiceButton
                    
                    // Reflection Section
                    if showingReflection {
                        reflectionSection
                    }
                }
                .padding()
            }
            .navigationTitle(tool.name)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Cerrar") {
                        dismiss()
                    }
                }
            }
        }
    }
    
    // MARK: - Header Section
    private var headerSection: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack {
                Image(systemName: tool.icon)
                    .font(.largeTitle)
                    .foregroundColor(toolColor)
                    .frame(width: 48, height: 48)
                    .background(
                        Circle()
                            .fill(toolColor.opacity(0.1))
                    )
                
                VStack(alignment: .leading, spacing: 4) {
                    Text(tool.category)
                        .font(.title3)
                        .fontWeight(.medium)
                        .foregroundColor(.secondary)
                    
                    HStack(spacing: 16) {
                        Label("\(tool.durationMinutes) min", systemImage: "clock")
                            .font(.caption)
                            .foregroundColor(.secondary)
                        
                        Label(tool.recommendedAge, systemImage: "person")
                            .font(.caption)
                            .foregroundColor(.secondary)
                    }
                }
                
                Spacer()
            }
            
            Text(tool.objective)
                .font(.body)
                .foregroundColor(.primary)
                .multilineTextAlignment(.leading)
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(toolColor.opacity(0.05))
                .overlay(
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(toolColor.opacity(0.2), lineWidth: 1)
                )
        )
    }
    
    // MARK: - Materials Section
    private var materialsSection: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("📦 Materiales Necesarios")
                .font(.title2)
                .fontWeight(.bold)
                .foregroundColor(.orange)
            
            ForEach(tool.materials, id: \.self) { material in
                HStack(alignment: .top, spacing: 12) {
                    Image(systemName: "checkmark.circle.fill")
                        .font(.headline)
                        .foregroundColor(.green)
                        .frame(width: 20)
                    
                    Text(material)
                        .font(.body)
                        .foregroundColor(.primary)
                        .multilineTextAlignment(.leading)
                }
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 12)
                        .fill(Color.orange.opacity(0.1))
                        .overlay(
                            RoundedRectangle(cornerRadius: 12)
                                .stroke(Color.orange.opacity(0.3), lineWidth: 1)
                        )
                )
            }
        }
    }
    
    // MARK: - Steps Section
    private var stepsSection: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("📋 Pasos a Seguir")
                .font(.title2)
                .fontWeight(.bold)
                .foregroundColor(.blue)
            
            ForEach(Array(tool.steps.enumerated()), id: \.offset) { index, step in
                HStack(alignment: .top, spacing: 12) {
                    Text("\(index + 1)")
                        .font(.headline)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .frame(width: 24, height: 24)
                        .background(
                            Circle()
                                .fill(Color.blue)
                        )
                    
                    Text(step)
                        .font(.body)
                        .foregroundColor(.primary)
                        .multilineTextAlignment(.leading)
                }
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 12)
                        .fill(Color.blue.opacity(0.1))
                        .overlay(
                            RoundedRectangle(cornerRadius: 12)
                                .stroke(Color.blue.opacity(0.3), lineWidth: 1)
                        )
                )
            }
        }
    }
    
    // MARK: - Practice Button
    private var practiceButton: some View {
        VStack(spacing: 16) {
            Button(action: {
                withAnimation(.spring()) {
                    showingReflection = true
                }
                triggerHaptic()
            }) {
                HStack {
                    Image(systemName: "play.circle.fill")
                        .font(.title2)
                    Text("¡Practicar Ahora!")
                        .font(.headline)
                        .fontWeight(.semibold)
                }
                .foregroundColor(.white)
                .frame(maxWidth: .infinity)
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 16)
                        .fill(
                            LinearGradient(
                                gradient: Gradient(colors: [toolColor, toolColor.opacity(0.8)]),
                                startPoint: .leading,
                                endPoint: .trailing
                            )
                        )
                )
            }
            .buttonStyle(PlainButtonStyle())
            
            Text("Toca para practicar esta herramienta con tu hijo")
                .font(.caption)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
        }
    }
    
    // MARK: - Reflection Section
    private var reflectionSection: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("✨ Reflexión Final")
                .font(.title2)
                .fontWeight(.bold)
                .foregroundColor(.purple)
            
            VStack(alignment: .leading, spacing: 12) {
                Text(tool.reflectionCue)
                    .font(.title3)
                    .italic()
                    .foregroundColor(.primary)
                    .multilineTextAlignment(.leading)
                
                Text("¡Excelente trabajo! Has fortalecido el cerebro receptivo de tu familia.")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 16)
                    .fill(Color.purple.opacity(0.1))
                    .overlay(
                        RoundedRectangle(cornerRadius: 16)
                            .stroke(Color.purple.opacity(0.3), lineWidth: 1)
                    )
            )
        }
        .transition(.opacity.combined(with: .scale))
    }
    
    // MARK: - Helper Functions
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
        let impactFeedback = UIImpactFeedbackGenerator(style: .medium)
        impactFeedback.impactOccurred()
        #endif
    }
}

// MARK: - Preview
struct ToolDetailView_Previews: PreviewProvider {
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
        
        ToolDetailView(tool: sampleTool)
    }
}
