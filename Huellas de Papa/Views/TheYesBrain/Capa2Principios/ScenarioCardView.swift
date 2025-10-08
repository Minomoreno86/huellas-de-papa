import SwiftUI

/// Tarjeta que muestra escenarios de transformación No Brain → Yes Brain
/// Demuestra cómo aplicar los principios en situaciones cotidianas
struct ScenarioCardView: View {
    let scenario: Capa2Scenario
    @State private var showingTransformation = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            // Header con título
            HStack {
                Text("Transformación No → Sí")
                    .font(.headline)
                    .fontWeight(.bold)
                    .foregroundColor(.primary)
                
                Spacer()
                
                Image(systemName: "arrow.right.circle.fill")
                    .font(.title3)
                    .foregroundColor(.blue)
            }
            
            // Situación
            VStack(alignment: .leading, spacing: 8) {
                Text("Situación:")
                    .font(.caption)
                    .fontWeight(.semibold)
                    .foregroundColor(.primary)
                
                Text(scenario.situation)
                    .font(.body)
                    .foregroundColor(.secondary)
                    .multilineTextAlignment(.leading)
            }
            
            Spacer()
            
            // Ejemplo de aplicación
            VStack(alignment: .leading, spacing: 8) {
                Text("💡 Aplicación:")
                    .font(.caption)
                    .fontWeight(.semibold)
                    .foregroundColor(.primary)
                
                Text(scenario.whatToDo)
                    .font(.subheadline)
                    .foregroundColor(.blue)
                    .italic()
                    .multilineTextAlignment(.leading)
                    .lineLimit(2)
            }
        }
        .padding()
        .frame(width: 280, height: 200)
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
        .onTapGesture {
            showingTransformation = true
            triggerHaptic()
        }
        .sheet(isPresented: $showingTransformation) {
            ScenarioTransformationView(scenario: scenario)
        }
    }
    
    // MARK: - Haptic Feedback
    private func triggerHaptic() {
        #if !os(macOS)
        let impactFeedback = UIImpactFeedbackGenerator(style: .light)
        impactFeedback.impactOccurred()
        #endif
    }
}

/// Vista detallada de transformación del escenario
struct ScenarioTransformationView: View {
    let scenario: Capa2Scenario
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 24) {
                    // Header
                    VStack(alignment: .leading, spacing: 12) {
                        Text("Transformación No → Sí")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .foregroundStyle(
                                LinearGradient(
                                    gradient: Gradient(colors: [.blue, .mint]),
                                    startPoint: .leading,
                                    endPoint: .trailing
                                )
                            )
                        
                        Text(scenario.situation)
                            .font(.title3)
                            .foregroundColor(.secondary)
                    }
                    
                    // Comparación No Brain vs Yes Brain
                    VStack(spacing: 20) {
                        // No Brain
                        VStack(alignment: .leading, spacing: 12) {
                            HStack {
                                Image(systemName: "xmark.circle.fill")
                                    .foregroundColor(.red)
                                Text("Modo No Brain")
                                    .font(.headline)
                                    .fontWeight(.semibold)
                                    .foregroundColor(.red)
                            }
                            
                            Text(scenario.whatNotToDo)
                                .font(.body)
                                .foregroundColor(.primary)
                                .padding()
                                .background(
                                    RoundedRectangle(cornerRadius: 12)
                                        .fill(Color.red.opacity(0.1))
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 12)
                                                .stroke(Color.red.opacity(0.3), lineWidth: 1)
                                        )
                                )
                        }
                        
                        // Flecha de transformación
                        HStack {
                            Spacer()
                            Image(systemName: "arrow.down")
                                .font(.title2)
                                .foregroundColor(.blue)
                            Spacer()
                        }
                        
                        // Yes Brain
                        VStack(alignment: .leading, spacing: 12) {
                            HStack {
                                Image(systemName: "checkmark.circle.fill")
                                    .foregroundColor(.green)
                                Text("Modo Yes Brain")
                                    .font(.headline)
                                    .fontWeight(.semibold)
                                    .foregroundColor(.green)
                            }
                            
                            Text(scenario.whatToDo)
                                .font(.body)
                                .foregroundColor(.primary)
                                .padding()
                                .background(
                                    RoundedRectangle(cornerRadius: 12)
                                        .fill(Color.green.opacity(0.1))
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 12)
                                                .stroke(Color.green.opacity(0.3), lineWidth: 1)
                                        )
                                )
                        }
                    }
                    
                    // Efecto en el cerebro
                    VStack(alignment: .leading, spacing: 12) {
                        Text("🧠 Efecto en el Cerebro")
                            .font(.headline)
                            .fontWeight(.semibold)
                            .foregroundColor(.primary)
                        
                        Text(scenario.brainEffect)
                            .font(.body)
                            .foregroundColor(.secondary)
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
                .padding()
            }
            .navigationTitle("Transformación")
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
}

// MARK: - Preview
struct ScenarioCardView_Previews: PreviewProvider {
    static var previews: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 16) {
                ScenarioCardView(
                    scenario: Capa2Scenario(
                        situation: "Rabieta por la tablet",
                        whatNotToDo: "¡Ya no más tablet! ¡Eres un niño malo!",
                        whatToDo: "Veo que te sientes frustrado. Vamos a respirar juntos.",
                        brainEffect: "La calma del adulto regula la amígdala del niño."
                    )
                )
                
                ScenarioCardView(
                    scenario: Capa2Scenario(
                        situation: "No quiere hacer tarea",
                        whatNotToDo: "¡Tienes que hacerlo! ¡No hay excusas!",
                        whatToDo: "Entiendo que es difícil. ¿Cómo podemos hacerlo más divertido?",
                        brainEffect: "La conexión activa el sistema de recompensa."
                    )
                )
            }
            .padding(.horizontal)
        }
        .background(Color(.systemGroupedBackground))
    }
}