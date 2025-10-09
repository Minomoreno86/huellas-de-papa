import SwiftUI

/// Vista principal de la Capa 4 (Simulaciones Avanzadas)
/// Escenarios interactivos donde el padre elige cómo responder
struct CN4View: View {
    @State private var selectedScenario: CN4Scenario?
    @State private var showingSimulation = false
    
    var body: some View {
        ScrollView {
            VStack(spacing: 32) {
                // Header
                headerSection
                
                // Escenarios
                scenariosSection
            }
            .padding()
        }
        .background(Color(.systemGroupedBackground))
        .navigationTitle("Simulaciones")
        .navigationBarTitleDisplayMode(.large)
        .sheet(isPresented: $showingSimulation) {
            if let scenario = selectedScenario {
                CN4SimulationView(scenario: scenario)
            }
        }
    }
    
    // MARK: - Header
    private var headerSection: some View {
        VStack(spacing: 16) {
            Text("Simulaciones Interactivas")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundStyle(
                    LinearGradient(
                        colors: [.blue, .mint],
                        startPoint: .leading,
                        endPoint: .trailing
                    )
                )
            
            Text("Practica tus respuestas en situaciones reales y ve el impacto en el cerebro de tu hijo")
                .font(.title3)
                .fontWeight(.medium)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
            
            Text("Interactivo • Educativo • Basado en neurociencia")
                .font(.subheadline)
                .foregroundColor(.blue)
                .italic()
        }
        .padding(.vertical)
    }
    
    // MARK: - Scenarios
    private var scenariosSection: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Elige un Escenario")
                .font(.title2)
                .fontWeight(.semibold)
            
            ForEach(cn4Scenarios) { scenario in
                CN4ScenarioCard(scenario: scenario)
                    .onTapGesture {
                        selectedScenario = scenario
                        showingSimulation = true
                    }
            }
        }
    }
}

// MARK: - Scenario Card
struct CN4ScenarioCard: View {
    let scenario: CN4Scenario
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                Image(systemName: scenario.icon)
                    .font(.title)
                    .foregroundColor(colorFromString(scenario.color))
                
                Spacer()
                
                DifficultyBadge(level: scenario.difficulty)
            }
            
            Text(scenario.title)
                .font(.title3)
                .fontWeight(.bold)
            
            Text(scenario.ageGroup)
                .font(.subheadline)
                .foregroundColor(colorFromString(scenario.color))
                .padding(.horizontal, 8)
                .padding(.vertical, 4)
                .background(
                    Capsule()
                        .fill(colorFromString(scenario.color).opacity(0.2))
                )
            
            Text(scenario.situation)
                .font(.body)
                .foregroundColor(.secondary)
                .lineLimit(3)
            
            HStack {
                Label("Estrategia #\(scenario.relatedStrategy)", systemImage: "brain.head.profile")
                    .font(.caption)
                    .foregroundColor(.blue)
                
                Spacer()
                
                Text("Toca para empezar")
                    .font(.caption)
                    .foregroundColor(.secondary)
                    .italic()
            }
        }
        .padding(16)
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(Color(.systemBackground))
                .shadow(radius: 4)
        )
    }
    
    private func colorFromString(_ colorName: String) -> Color {
        switch colorName {
        case "blue": return .blue
        case "indigo": return .indigo
        case "purple": return .purple
        case "pink": return .pink
        case "green": return .green
        default: return .blue
        }
    }
}

// MARK: - Difficulty Badge
struct DifficultyBadge: View {
    let level: Int
    
    var body: some View {
        HStack(spacing: 2) {
            ForEach(0..<5) { index in
                Circle()
                    .fill(index < level ? Color.orange : Color.gray.opacity(0.3))
                    .frame(width: 8, height: 8)
            }
        }
    }
}

// MARK: - Simulation View
struct CN4SimulationView: View {
    let scenario: CN4Scenario
    @State private var selectedOption: CN4Option?
    @State private var showingOutcome = false
    @State private var currentOutcome: CN4Outcome?
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 24) {
                    if !showingOutcome {
                        // Mostrar situación y opciones
                        scenarioContent
                    } else if let outcome = currentOutcome {
                        // Mostrar resultado
                        outcomeContent(outcome)
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
    
    private var scenarioContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            // Situación
            VStack(alignment: .leading, spacing: 12) {
                Label("Situación", systemImage: "exclamationmark.triangle.fill")
                    .font(.headline)
                    .foregroundColor(.orange)
                
                Text(scenario.situation)
                    .font(.body)
            }
            .padding(16)
            .background(
                RoundedRectangle(cornerRadius: 12)
                    .fill(Color.orange.opacity(0.1))
            )
            
            // Estado del niño
            VStack(alignment: .leading, spacing: 12) {
                Label("Estado del Cerebro del Niño", systemImage: "brain.head.profile")
                    .font(.headline)
                    .foregroundColor(.blue)
                
                Text(scenario.childState)
                    .font(.body)
            }
            .padding(16)
            .background(
                RoundedRectangle(cornerRadius: 12)
                    .fill(Color.blue.opacity(0.1))
            )
            
            // Desafío
            VStack(alignment: .leading, spacing: 12) {
                Label("Tu Desafío", systemImage: "flag.fill")
                    .font(.headline)
                    .foregroundColor(.purple)
                
                Text(scenario.challenge)
                    .font(.body)
            }
            .padding(16)
            .background(
                RoundedRectangle(cornerRadius: 12)
                    .fill(Color.purple.opacity(0.1))
            )
            
            // Opciones
            VStack(alignment: .leading, spacing: 16) {
                Text("¿Cómo Respondes?")
                    .font(.title2)
                    .fontWeight(.bold)
                
                ForEach(scenario.options) { option in
                    CN4OptionButton(option: option) {
                        selectedOption = option
                        showOutcome(for: option)
                    }
                }
            }
        }
    }
    
    private func outcomeContent(_ outcome: CN4Outcome) -> some View {
        VStack(alignment: .leading, spacing: 24) {
            // Score
            CN4ScoreView(score: outcome.score)
            
            // Tu elección
            if let option = selectedOption {
                VStack(alignment: .leading, spacing: 8) {
                    Text("Tu Elección:")
                        .font(.headline)
                        .foregroundColor(.secondary)
                    
                    Text(option.text)
                        .font(.body)
                        .italic()
                }
                .padding(16)
                .background(
                    RoundedRectangle(cornerRadius: 12)
                        .fill(Color.gray.opacity(0.1))
                )
            }
            
            // Reacción inmediata
            CN4OutcomeSection(
                title: "Reacción Inmediata",
                icon: "bolt.fill",
                color: .orange,
                content: outcome.immediateReaction
            )
            
            // Estado cerebral
            CN4OutcomeSection(
                title: "Estado del Cerebro del Niño",
                icon: "brain.head.profile",
                color: .blue,
                content: outcome.childBrainState
            )
            
            // Cómo te sientes
            CN4OutcomeSection(
                title: "Cómo te Sientes",
                icon: "heart.fill",
                color: .pink,
                content: outcome.parentFeeling
            )
            
            // Impacto largo plazo
            CN4OutcomeSection(
                title: "Impacto a Largo Plazo",
                icon: "chart.line.uptrend.xyaxis",
                color: .green,
                content: outcome.longTermImpact
            )
            
            // Feedback
            VStack(alignment: .leading, spacing: 12) {
                Label("Aprendizaje", systemImage: "graduationcap.fill")
                    .font(.headline)
                    .fontWeight(.semibold)
                    .foregroundColor(.purple)
                
                Text(outcome.feedback)
                    .font(.body)
            }
            .padding(16)
            .background(
                RoundedRectangle(cornerRadius: 12)
                    .fill(Color.purple.opacity(0.1))
            )
            
            // Botones
            VStack(spacing: 12) {
                Button(action: {
                    showingOutcome = false
                    selectedOption = nil
                    currentOutcome = nil
                }) {
                    Text("Intentar Otra Respuesta")
                        .fontWeight(.semibold)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(12)
                }
                
                Button(action: {
                    dismiss()
                }) {
                    Text("Finalizar Simulación")
                        .fontWeight(.semibold)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.gray.opacity(0.2))
                        .foregroundColor(.primary)
                        .cornerRadius(12)
                }
            }
            .padding(.top)
        }
    }
    
    private func showOutcome(for option: CN4Option) {
        if let outcome = scenario.outcomes.first(where: { $0.optionId == option.id }) {
            currentOutcome = outcome
            withAnimation {
                showingOutcome = true
            }
        }
    }
}

// MARK: - Option Button
struct CN4OptionButton: View {
    let option: CN4Option
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            VStack(alignment: .leading, spacing: 8) {
                HStack {
                    Text(option.text)
                        .font(.body)
                        .foregroundColor(.primary)
                        .multilineTextAlignment(.leading)
                    
                    Spacer()
                    
                    if option.isRecommended {
                        Image(systemName: "star.fill")
                            .foregroundColor(.yellow)
                    }
                }
                
                Text(option.brainApproach)
                    .font(.caption)
                    .foregroundColor(.secondary)
                    .italic()
            }
            .padding(16)
            .background(
                RoundedRectangle(cornerRadius: 12)
                    .fill(Color(.systemBackground))
                    .overlay(
                        RoundedRectangle(cornerRadius: 12)
                            .stroke(option.isRecommended ? Color.green : Color.gray.opacity(0.3), lineWidth: 2)
                    )
            )
        }
    }
}

// MARK: - Score View
struct CN4ScoreView: View {
    let score: Int
    
    var scoreColor: Color {
        switch score {
        case 8...10: return .green
        case 5...7: return .orange
        default: return .red
        }
    }
    
    var scoreEmoji: String {
        switch score {
        case 9...10: return "🌟"
        case 7...8: return "👍"
        case 5...6: return "😐"
        default: return "⚠️"
        }
    }
    
    var body: some View {
        VStack(spacing: 12) {
            Text(scoreEmoji)
                .font(.system(size: 60))
            
            Text("Efectividad: \(score)/10")
                .font(.title2)
                .fontWeight(.bold)
                .foregroundColor(scoreColor)
            
            ProgressView(value: Double(score), total: 10)
                .tint(scoreColor)
                .scaleEffect(x: 1, y: 2, anchor: .center)
        }
        .padding(20)
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(scoreColor.opacity(0.1))
        )
    }
}

// MARK: - Outcome Section
struct CN4OutcomeSection: View {
    let title: String
    let icon: String
    let color: Color
    let content: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Label(title, systemImage: icon)
                .font(.headline)
                .fontWeight(.semibold)
                .foregroundColor(color)
            
            Text(content)
                .font(.body)
        }
        .padding(16)
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(color.opacity(0.1))
        )
    }
}

// MARK: - Preview
struct CN4View_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            CN4View()
        }
    }
}

