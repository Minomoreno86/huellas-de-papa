import SwiftUI

/// Vista interactiva de un escenario de simulación con narrativa y opciones
struct ScenarioInteractiveView: View {
    let scenario: Capa4Scenario
    @Environment(\.dismiss) private var dismiss
    @State private var selectedOption: YesBrainScenarioOption? = nil
    @State private var showingOutcome: Bool = false
    @State private var currentOutcome: YesBrainScenarioOutcome? = nil
    
    var body: some View {
        NavigationView {
            ZStack {
                // Background gradient basado en el estado
                backgroundGradient
                    .ignoresSafeArea()
                
                if !showingOutcome {
                    // Vista de narrativa y opciones
                    narrativeView
                } else if let outcome = currentOutcome {
                    // Vista de resultado
                    OutcomeView(
                        scenario: scenario,
                        outcome: outcome,
                        selectedOption: selectedOption!,
                        onRepeat: {
                            withAnimation {
                                resetSimulation()
                            }
                        },
                        onContinue: {
                            dismiss()
                        }
                    )
                    .transition(.asymmetric(
                        insertion: .opacity.combined(with: .scale),
                        removal: .opacity
                    ))
                }
            }
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
    
    // MARK: - Narrative View
    private var narrativeView: some View {
        ScrollView {
            VStack(spacing: 24) {
                // Header con contexto
                contextSection
                
                // Descripción narrativa
                narrativeSection
                
                // Opciones de respuesta
                optionsSection
            }
            .padding()
        }
    }
    
    // MARK: - Context Section
    private var contextSection: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack {
                Image(systemName: scenario.icon)
                    .font(.largeTitle)
                    .foregroundColor(scenarioColor)
                    .frame(width: 50, height: 50)
                    .background(
                        Circle()
                            .fill(scenarioColor.opacity(0.1))
                    )
                
                VStack(alignment: .leading, spacing: 4) {
                    Text(scenario.category)
                        .font(.headline)
                        .foregroundColor(scenarioColor)
                    
                    HStack(spacing: 4) {
                        ForEach(0..<scenario.difficulty, id: \.self) { _ in
                            Image(systemName: "star.fill")
                                .font(.caption)
                                .foregroundColor(.orange)
                        }
                        Text("Nivel \(scenario.difficulty)")
                            .font(.caption)
                            .foregroundColor(.secondary)
                    }
                }
                
                Spacer()
            }
            
            // Trigger
            VStack(alignment: .leading, spacing: 8) {
                Text("🎬 Situación:")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundColor(.orange)
                
                Text(scenario.trigger)
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
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(Color(.systemBackground))
                .shadow(color: .black.opacity(0.1), radius: 4, x: 0, y: 2)
        )
    }
    
    // MARK: - Narrative Section
    private var narrativeSection: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("📖 La Escena:")
                .font(.title2)
                .fontWeight(.bold)
                .foregroundColor(.primary)
            
            Text(scenario.description)
                .font(.body)
                .foregroundColor(.primary)
                .multilineTextAlignment(.leading)
                .lineSpacing(4)
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 12)
                        .fill(Color(.systemBackground))
                        .overlay(
                            RoundedRectangle(cornerRadius: 12)
                                .stroke(scenarioColor.opacity(0.2), lineWidth: 1)
                        )
                )
        }
    }
    
    // MARK: - Options Section
    private var optionsSection: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("🤔 ¿Cómo Respondes?")
                .font(.title2)
                .fontWeight(.bold)
                .foregroundColor(.primary)
            
            Text("Elige tu respuesta. Cada decisión tiene un impacto emocional en tu hijo.")
                .font(.subheadline)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.leading)
            
            ForEach(scenario.options) { option in
                YesBrainOptionButton(
                    option: option,
                    isSelected: selectedOption?.id == option.id,
                    onSelect: {
                        selectOption(option)
                    }
                )
            }
        }
    }
    
    // MARK: - Background Gradient
    private var backgroundGradient: some View {
        LinearGradient(
            gradient: Gradient(colors: showingOutcome ? 
                [scenarioColor.opacity(0.1), scenarioColor.opacity(0.05)] :
                [Color(.systemBackground), Color(.systemBackground)]
            ),
            startPoint: .topLeading,
            endPoint: .bottomTrailing
        )
        .animation(.easeInOut(duration: 0.8), value: showingOutcome)
    }
    
    // MARK: - Helper Functions
    private var scenarioColor: Color {
        switch scenario.color {
        case "red": return .red
        case "orange": return .orange
        case "pink": return .pink
        case "purple": return .purple
        case "blue": return .blue
        case "green": return .green
        case "indigo": return .indigo
        case "teal": return .teal
        default: return .purple
        }
    }
    
    private func selectOption(_ option: YesBrainScenarioOption) {
        selectedOption = option
        
        // Encontrar el outcome correspondiente
        if let outcome = scenario.outcomes.first(where: { $0.id == option.nextOutcomeId }) {
            currentOutcome = outcome
            
            // Trigger haptic basado en el nivel de alineación
            triggerHaptic(for: option.yesBrainAlignment)
            
            // Mostrar resultado después de una breve pausa
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                withAnimation(.spring(response: 0.6, dampingFraction: 0.8)) {
                    showingOutcome = true
                }
            }
        }
    }
    
    private func resetSimulation() {
        selectedOption = nil
        currentOutcome = nil
        showingOutcome = false
    }
    
    private func triggerHaptic(for alignment: Int) {
        #if !os(macOS)
        let generator: UIImpactFeedbackGenerator
        
        if alignment >= 70 {
            generator = UIImpactFeedbackGenerator(style: .light)
        } else if alignment >= 40 {
            generator = UIImpactFeedbackGenerator(style: .medium)
        } else {
            generator = UIImpactFeedbackGenerator(style: .heavy)
        }
        
        generator.impactOccurred()
        #endif
    }
}

// MARK: - Option Button Component
struct YesBrainOptionButton: View {
    let option: YesBrainScenarioOption
    let isSelected: Bool
    let onSelect: () -> Void
    
    var body: some View {
        Button(action: {
            onSelect()
        }) {
            VStack(alignment: .leading, spacing: 12) {
                HStack {
                    // Tone indicator
                    Text(option.tone)
                        .font(.caption)
                        .fontWeight(.medium)
                        .padding(.horizontal, 8)
                        .padding(.vertical, 4)
                        .background(
                            RoundedRectangle(cornerRadius: 8)
                                .fill(toneColor.opacity(0.2))
                        )
                        .foregroundColor(toneColor)
                    
                    Spacer()
                    
                    // Alignment indicator
                    HStack(spacing: 4) {
                        Image(systemName: alignmentIcon)
                            .font(.caption)
                            .foregroundColor(alignmentColor)
                        
                        Text("\(option.yesBrainAlignment)%")
                            .font(.caption)
                            .fontWeight(.medium)
                            .foregroundColor(alignmentColor)
                    }
                }
                
                // Option text
                Text(option.text)
                    .font(.body)
                    .foregroundColor(.primary)
                    .multilineTextAlignment(.leading)
                    .lineSpacing(2)
            }
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 12)
                    .fill(isSelected ? toneColor.opacity(0.1) : Color(.systemBackground))
                    .overlay(
                        RoundedRectangle(cornerRadius: 12)
                            .stroke(isSelected ? toneColor : Color.gray.opacity(0.3), lineWidth: isSelected ? 2 : 1)
                    )
            )
            .shadow(
                color: isSelected ? toneColor.opacity(0.2) : .clear,
                radius: 8,
                x: 0,
                y: 4
            )
        }
        .buttonStyle(PlainButtonStyle())
    }
    
    private var toneColor: Color {
        if option.yesBrainAlignment >= 70 {
            return .green
        } else if option.yesBrainAlignment >= 40 {
            return .orange
        } else {
            return .red
        }
    }
    
    private var alignmentColor: Color {
        if option.yesBrainAlignment >= 70 {
            return .green
        } else if option.yesBrainAlignment >= 40 {
            return .orange
        } else {
            return .red
        }
    }
    
    private var alignmentIcon: String {
        if option.yesBrainAlignment >= 70 {
            return "checkmark.circle.fill"
        } else if option.yesBrainAlignment >= 40 {
            return "exclamationmark.circle.fill"
        } else {
            return "xmark.circle.fill"
        }
    }
}

// MARK: - Preview
struct ScenarioInteractiveView_Previews: PreviewProvider {
    static var previews: some View {
        if let firstScenario = Capa4EscenariosData.escenarios.first {
            ScenarioInteractiveView(scenario: firstScenario)
                .environmentObject(ProgresoManager())
        }
    }
}

