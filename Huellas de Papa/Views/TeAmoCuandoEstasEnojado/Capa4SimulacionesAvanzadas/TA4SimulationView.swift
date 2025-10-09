import SwiftUI

/// Vista interactiva de simulación donde el padre elige respuestas
struct TA4SimulationView: View {
    let scenario: TA4Scenario
    @Environment(\.dismiss) var dismiss
    
    @State private var selectedOption: TA4Option?
    @State private var showingOutcome = false
    @State private var currentOutcome: TA4Outcome?
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 32) {
                    if !showingOutcome {
                        // Fase 1: Presentación del escenario
                        scenarioPhase
                    } else {
                        // Fase 2: Resultado de la elección
                        outcomePhase
                    }
                }
                .padding()
            }
            .background(Color(.systemGroupedBackground))
            .navigationTitle(scenario.title)
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
    
    // MARK: - Fase 1: Escenario
    private var scenarioPhase: some View {
        VStack(spacing: 24) {
            // Icono y título
            VStack(spacing: 16) {
                Image(systemName: scenario.icon)
                    .font(.system(size: 80))
                    .foregroundStyle(
                        LinearGradient(
                            colors: [.pink, .mint],
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                    )
                
                Text(scenario.title)
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.primary)
                    .multilineTextAlignment(.center)
                
                Text(scenario.category)
                    .font(.subheadline)
                    .foregroundColor(.mint)
            }
            .padding(.top)
            
            // Descripción de la situación
            VStack(alignment: .leading, spacing: 12) {
                Label("Situación", systemImage: "text.bubble.fill")
                    .font(.headline)
                    .foregroundColor(.pink)
                
                Text(scenario.description)
                    .font(.body)
                    .foregroundColor(.primary)
            }
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(
                RoundedRectangle(cornerRadius: 12)
                    .fill(Color.pink.opacity(0.1))
            )
            
            // Emoción del niño
            VStack(alignment: .leading, spacing: 12) {
                Label("Estado emocional del niño", systemImage: "heart.fill")
                    .font(.headline)
                    .foregroundColor(.mint)
                
                Text(scenario.childEmotion)
                    .font(.body)
                    .foregroundColor(.primary)
            }
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(
                RoundedRectangle(cornerRadius: 12)
                    .fill(Color.mint.opacity(0.1))
            )
            
            // Opciones de respuesta
            VStack(alignment: .leading, spacing: 16) {
                Text("¿Cómo respondes?")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .foregroundColor(.primary)
                
                ForEach(scenario.options) { option in
                    TA4OptionButton(option: option, isSelected: selectedOption?.id == option.id) {
                        selectedOption = option
                        showOutcome()
                    }
                }
            }
        }
    }
    
    // MARK: - Fase 2: Resultado
    private var outcomePhase: some View {
        VStack(spacing: 24) {
            if let outcome = currentOutcome, let option = selectedOption {
                // Score visual
                VStack(spacing: 16) {
                    ZStack {
                        Circle()
                            .stroke(Color.gray.opacity(0.2), lineWidth: 10)
                            .frame(width: 120, height: 120)
                        
                        Circle()
                            .trim(from: 0, to: CGFloat(outcome.score) / 100)
                            .stroke(
                                LinearGradient(
                                    colors: scoreColor(outcome.score),
                                    startPoint: .topLeading,
                                    endPoint: .bottomTrailing
                                ),
                                style: StrokeStyle(lineWidth: 10, lineCap: .round)
                            )
                            .frame(width: 120, height: 120)
                            .rotationEffect(.degrees(-90))
                            .animation(.spring(), value: outcome.score)
                        
                        VStack(spacing: 4) {
                            Text("\(outcome.score)")
                                .font(.largeTitle)
                                .fontWeight(.bold)
                                .foregroundColor(.primary)
                            
                            Text("Amor\nIncondicional")
                                .font(.caption2)
                                .multilineTextAlignment(.center)
                                .foregroundColor(.secondary)
                        }
                    }
                    
                    Text(option.tone)
                        .font(.subheadline)
                        .foregroundColor(.mint)
                }
                .padding(.top)
                
                // Tu elección
                VStack(alignment: .leading, spacing: 12) {
                    Label("Tu respuesta", systemImage: "bubble.left.fill")
                        .font(.headline)
                        .foregroundColor(.pink)
                    
                    Text(option.text)
                        .font(.body)
                        .italic()
                        .foregroundColor(.primary)
                }
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(
                    RoundedRectangle(cornerRadius: 12)
                        .fill(Color.pink.opacity(0.1))
                )
                
                // Reacción del niño
                OutcomeSection(
                    title: "Reacción del niño",
                    icon: "person.fill",
                    color: .blue,
                    content: outcome.childReaction
                )
                
                // Impacto emocional
                OutcomeSection(
                    title: "Impacto emocional",
                    icon: "heart.fill",
                    color: .mint,
                    content: outcome.emotionalImpact
                )
                
                // Efecto a largo plazo
                OutcomeSection(
                    title: "Efecto a largo plazo",
                    icon: "arrow.forward.circle.fill",
                    color: .purple,
                    content: outcome.longTermEffect
                )
                
                // Sabiduría del libro
                VStack(alignment: .leading, spacing: 12) {
                    Label("Del libro de Erin Winters", systemImage: "book.fill")
                        .font(.headline)
                        .foregroundColor(.pink)
                    
                    Text("\"")
                        .font(.title)
                        .foregroundColor(.pink.opacity(0.3))
                        + Text(outcome.bookWisdom)
                        .font(.body)
                        .italic()
                        .foregroundColor(.primary)
                        + Text("\"")
                        .font(.title)
                        .foregroundColor(.pink.opacity(0.3))
                }
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(
                    RoundedRectangle(cornerRadius: 12)
                        .fill(
                            LinearGradient(
                                colors: [Color.pink.opacity(0.1), Color.mint.opacity(0.05)],
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            )
                        )
                )
                
                // Reflexión para el padre
                VStack(alignment: .leading, spacing: 12) {
                    Label("Reflexión", systemImage: "lightbulb.fill")
                        .font(.headline)
                        .foregroundColor(.orange)
                    
                    Text(outcome.parentReflection)
                        .font(.body)
                        .foregroundColor(.primary)
                }
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(
                    RoundedRectangle(cornerRadius: 12)
                        .fill(Color.orange.opacity(0.1))
                )
                
                // Botón de reiniciar
                Button(action: {
                    resetSimulation()
                }) {
                    Label("Intentar otra respuesta", systemImage: "arrow.counterclockwise")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(
                            LinearGradient(
                                colors: [.pink, .mint],
                                startPoint: .leading,
                                endPoint: .trailing
                            )
                        )
                        .cornerRadius(12)
                }
            }
        }
    }
    
    // MARK: - Helper Views
    private struct OutcomeSection: View {
        let title: String
        let icon: String
        let color: Color
        let content: String
        
        var body: some View {
            VStack(alignment: .leading, spacing: 12) {
                Label(title, systemImage: icon)
                    .font(.headline)
                    .foregroundColor(color)
                
                Text(content)
                    .font(.body)
                    .foregroundColor(.primary)
            }
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(
                RoundedRectangle(cornerRadius: 12)
                    .fill(color.opacity(0.1))
            )
        }
    }
    
    // MARK: - Helper Functions
    private func showOutcome() {
        guard let option = selectedOption else { return }
        
        // Buscar el outcome correspondiente
        if let outcome = scenario.outcomes.first(where: { $0.id == option.nextOutcomeId }) {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                withAnimation(.spring()) {
                    currentOutcome = outcome
                    showingOutcome = true
                }
                triggerHaptic()
            }
        }
    }
    
    private func resetSimulation() {
        withAnimation(.spring()) {
            selectedOption = nil
            currentOutcome = nil
            showingOutcome = false
        }
        triggerHaptic()
    }
    
    private func scoreColor(_ score: Int) -> [Color] {
        if score >= 80 {
            return [.green, .mint]
        } else if score >= 50 {
            return [.orange, .yellow]
        } else {
            return [.red, .pink]
        }
    }
    
    private func triggerHaptic() {
        let impactFeedback = UIImpactFeedbackGenerator(style: .medium)
        impactFeedback.impactOccurred()
    }
}

// MARK: - Option Button
struct TA4OptionButton: View {
    let option: TA4Option
    let isSelected: Bool
    let onTap: () -> Void
    
    var body: some View {
        Button(action: {
            onTap()
        }) {
            VStack(alignment: .leading, spacing: 12) {
                HStack {
                    Text(option.text)
                        .font(.body)
                        .foregroundColor(.primary)
                        .multilineTextAlignment(.leading)
                    
                    Spacer()
                    
                    Image(systemName: "chevron.right.circle.fill")
                        .foregroundColor(.pink)
                }
                
                Text(option.tone)
                    .font(.caption)
                    .foregroundColor(.mint)
            }
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 12)
                    .fill(Color(.systemBackground))
                    .shadow(color: Color.pink.opacity(0.1), radius: 4, x: 0, y: 2)
            )
            .overlay(
                RoundedRectangle(cornerRadius: 12)
                    .stroke(
                        LinearGradient(
                            colors: [.pink.opacity(0.3), .mint.opacity(0.2)],
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        ),
                        lineWidth: 1
                    )
            )
        }
        .buttonStyle(PlainButtonStyle())
    }
}

