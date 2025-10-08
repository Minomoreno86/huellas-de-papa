import SwiftUI

/// Vista que muestra el resultado de una elección en la simulación
struct OutcomeView: View {
    let scenario: Capa4Scenario
    let outcome: YesBrainScenarioOutcome
    let selectedOption: YesBrainScenarioOption
    let onRepeat: () -> Void
    let onContinue: () -> Void
    
    @State private var showDetails: Bool = false
    
    var body: some View {
        ScrollView {
            VStack(spacing: 24) {
                // Success Level Indicator
                successLevelSection
                
                // Child Reaction
                childReactionSection
                
                // Brain State Explanation
                brainStateSection
                
                // Narrator Feedback
                narratorFeedbackSection
                
                // Recommendation
                recommendationSection
                
                // Insight Panel
                insightSection
                
                // Action Buttons
                actionButtons
            }
            .padding()
        }
        .onAppear {
            withAnimation(.easeIn(duration: 0.5).delay(0.3)) {
                showDetails = true
            }
            triggerHaptic()
        }
    }
    
    // MARK: - Success Level Section
    private var successLevelSection: some View {
        VStack(spacing: 16) {
            // Circular progress
            ZStack {
                Circle()
                    .stroke(outcomeColor.opacity(0.2), lineWidth: 12)
                    .frame(width: 120, height: 120)
                
                Circle()
                    .trim(from: 0, to: CGFloat(outcome.successLevel) / 100)
                    .stroke(
                        outcomeColor,
                        style: StrokeStyle(lineWidth: 12, lineCap: .round)
                    )
                    .frame(width: 120, height: 120)
                    .rotationEffect(.degrees(-90))
                    .animation(.spring(response: 1.0, dampingFraction: 0.8), value: showDetails)
                
                VStack(spacing: 4) {
                    Text("\(outcome.successLevel)")
                        .font(.system(size: 36, weight: .bold))
                        .foregroundColor(outcomeColor)
                    
                    Text("Yes Brain")
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
            }
            .padding()
            
            // Impact label
            Text(emotionalImpactLabel)
                .font(.headline)
                .foregroundColor(outcomeColor)
                .padding(.horizontal, 16)
                .padding(.vertical, 8)
                .background(
                    RoundedRectangle(cornerRadius: 20)
                        .fill(outcomeColor.opacity(0.1))
                )
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(Color(.systemBackground))
                .shadow(color: outcomeColor.opacity(0.2), radius: 8, x: 0, y: 4)
        )
    }
    
    // MARK: - Child Reaction Section
    private var childReactionSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                Image(systemName: "person.fill")
                    .foregroundColor(.blue)
                Text("Reacción del Niño:")
                    .font(.headline)
                    .fontWeight(.semibold)
                    .foregroundColor(.primary)
            }
            
            Text(outcome.childReaction)
                .font(.body)
                .foregroundColor(.primary)
                .multilineTextAlignment(.leading)
                .lineSpacing(4)
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(Color.blue.opacity(0.05))
                .overlay(
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(Color.blue.opacity(0.2), lineWidth: 1)
                )
        )
        .opacity(showDetails ? 1 : 0)
        .offset(y: showDetails ? 0 : 20)
        .animation(.easeIn(duration: 0.5).delay(0.5), value: showDetails)
    }
    
    // MARK: - Brain State Section
    private var brainStateSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                Image(systemName: "brain.head.profile")
                    .foregroundColor(.purple)
                Text("Estado Cerebral:")
                    .font(.headline)
                    .fontWeight(.semibold)
                    .foregroundColor(.primary)
            }
            
            Text(outcome.brainState)
                .font(.body)
                .foregroundColor(.primary)
                .multilineTextAlignment(.leading)
                .lineSpacing(4)
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(Color.purple.opacity(0.05))
                .overlay(
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(Color.purple.opacity(0.2), lineWidth: 1)
                )
        )
        .opacity(showDetails ? 1 : 0)
        .offset(y: showDetails ? 0 : 20)
        .animation(.easeIn(duration: 0.5).delay(0.7), value: showDetails)
    }
    
    // MARK: - Narrator Feedback Section
    private var narratorFeedbackSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                Image(systemName: feedbackIcon)
                    .foregroundColor(outcomeColor)
                Text("Análisis:")
                    .font(.headline)
                    .fontWeight(.semibold)
                    .foregroundColor(.primary)
            }
            
            Text(outcome.narratorFeedback)
                .font(.body)
                .fontWeight(.medium)
                .foregroundColor(.primary)
                .multilineTextAlignment(.leading)
                .lineSpacing(4)
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(outcomeColor.opacity(0.05))
                .overlay(
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(outcomeColor.opacity(0.3), lineWidth: 2)
                )
        )
        .opacity(showDetails ? 1 : 0)
        .offset(y: showDetails ? 0 : 20)
        .animation(.easeIn(duration: 0.5).delay(0.9), value: showDetails)
    }
    
    // MARK: - Recommendation Section
    private var recommendationSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                Image(systemName: "lightbulb.fill")
                    .foregroundColor(.yellow)
                Text("Recomendación:")
                    .font(.headline)
                    .fontWeight(.semibold)
                    .foregroundColor(.primary)
            }
            
            Text(outcome.recommendation)
                .font(.body)
                .foregroundColor(.primary)
                .multilineTextAlignment(.leading)
                .lineSpacing(4)
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(Color.yellow.opacity(0.05))
                .overlay(
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(Color.yellow.opacity(0.3), lineWidth: 1)
                )
        )
        .opacity(showDetails ? 1 : 0)
        .offset(y: showDetails ? 0 : 20)
        .animation(.easeIn(duration: 0.5).delay(1.1), value: showDetails)
    }
    
    // MARK: - Insight Section
    private var insightSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                Image(systemName: "star.fill")
                    .foregroundColor(.orange)
                Text("Aprendizaje Clave:")
                    .font(.headline)
                    .fontWeight(.semibold)
                    .foregroundColor(.primary)
            }
            
            Text(scenario.insight)
                .font(.body)
                .italic()
                .foregroundColor(.primary)
                .multilineTextAlignment(.leading)
                .lineSpacing(4)
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(Color.orange.opacity(0.05))
                .overlay(
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(Color.orange.opacity(0.3), lineWidth: 1)
                )
        )
        .opacity(showDetails ? 1 : 0)
        .offset(y: showDetails ? 0 : 20)
        .animation(.easeIn(duration: 0.5).delay(1.3), value: showDetails)
    }
    
    // MARK: - Action Buttons
    private var actionButtons: some View {
        VStack(spacing: 12) {
            // Repeat button
            Button(action: {
                onRepeat()
            }) {
                HStack {
                    Image(systemName: "arrow.clockwise")
                        .font(.headline)
                    Text("Intentar Nuevamente")
                        .font(.headline)
                        .fontWeight(.semibold)
                }
                .foregroundColor(.white)
                .frame(maxWidth: .infinity)
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 12)
                        .fill(Color.blue)
                )
            }
            .buttonStyle(PlainButtonStyle())
            
            // Continue button
            Button(action: {
                onContinue()
            }) {
                HStack {
                    Image(systemName: "checkmark.circle.fill")
                        .font(.headline)
                    Text("Continuar")
                        .font(.headline)
                        .fontWeight(.semibold)
                }
                .foregroundColor(outcomeColor)
                .frame(maxWidth: .infinity)
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 12)
                        .fill(outcomeColor.opacity(0.1))
                        .overlay(
                            RoundedRectangle(cornerRadius: 12)
                                .stroke(outcomeColor, lineWidth: 2)
                        )
                )
            }
            .buttonStyle(PlainButtonStyle())
        }
        .opacity(showDetails ? 1 : 0)
        .offset(y: showDetails ? 0 : 20)
        .animation(.easeIn(duration: 0.5).delay(1.5), value: showDetails)
    }
    
    // MARK: - Helper Properties
    private var outcomeColor: Color {
        switch outcome.visualCue {
        case "red": return .red
        case "orange": return .orange
        case "yellow": return .yellow
        case "green": return .green
        case "blue": return .blue
        case "pink": return .pink
        case "purple": return .purple
        case "gray": return .gray
        default: return .blue
        }
    }
    
    private var emotionalImpactLabel: String {
        switch outcome.emotionalImpact {
        case "Positivo": return "✅ Impacto Positivo"
        case "Neutral": return "⚠️ Impacto Neutral"
        case "Negativo": return "❌ Impacto Negativo"
        default: return outcome.emotionalImpact
        }
    }
    
    private var feedbackIcon: String {
        switch outcome.emotionalImpact {
        case "Positivo": return "checkmark.circle.fill"
        case "Neutral": return "exclamationmark.circle.fill"
        case "Negativo": return "xmark.circle.fill"
        default: return "info.circle.fill"
        }
    }
    
    private func triggerHaptic() {
        #if !os(macOS)
        let generator: UINotificationFeedbackGenerator
        generator = UINotificationFeedbackGenerator()
        
        switch outcome.emotionalImpact {
        case "Positivo":
            generator.notificationOccurred(.success)
        case "Neutral":
            generator.notificationOccurred(.warning)
        case "Negativo":
            generator.notificationOccurred(.error)
        default:
            generator.notificationOccurred(.warning)
        }
        #endif
    }
}

// MARK: - Preview
struct OutcomeView_Previews: PreviewProvider {
    static var previews: some View {
        if let scenario = Capa4EscenariosData.escenarios.first,
           let option = scenario.options.first,
           let outcome = scenario.outcomes.first {
            OutcomeView(
                scenario: scenario,
                outcome: outcome,
                selectedOption: option,
                onRepeat: { print("Repeat") },
                onContinue: { print("Continue") }
            )
        }
    }
}

