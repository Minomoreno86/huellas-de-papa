import SwiftUI

/// Tarjeta que muestra ejemplos clínicos con transición de No Brain a Yes Brain
/// Permite visualizar cómo aplicar los principios en situaciones reales
struct ClinicalExampleCard: View {
    @Binding var showingTransition: Bool
    @State private var currentExampleIndex = 0
    @State private var isAnimating = false
    
    private let examples = [
        ClinicalExample(
            scenario: "No quiere vestirse para la escuela",
            reactionNoBrain: "¡Vístete YA! ¡Vamos a llegar tarde!",
            reactionYesBrain: "Veo que te cuesta trabajo vestirte. ¿Qué necesitas para sentirte cómodo?",
            learning: "La conexión antes que la corrección activa el Yes Brain"
        ),
        ClinicalExample(
            scenario: "Tiene una rabieta en el supermercado",
            reactionNoBrain: "¡Para ya! ¡Me estás avergonzando!",
            reactionYesBrain: "Veo que estás muy molesto. Estoy aquí contigo.",
            learning: "La validación emocional calma el sistema nervioso"
        ),
        ClinicalExample(
            scenario: "No quiere hacer la tarea",
            reactionNoBrain: "¡Si no haces la tarea, no hay videojuegos!",
            reactionYesBrain: "Entiendo que la tarea puede ser difícil. ¿Cómo puedo ayudarte?",
            learning: "El apoyo reduce la resistencia y facilita el aprendizaje"
        )
    ]
    
    var body: some View {
        VStack(spacing: 16) {
            // Header con navegación
            headerSection
            
            // Contenido del ejemplo
            exampleContent
            
            // Botón de transición
            transitionButton
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(Color(.systemBackground))
                .shadow(color: .black.opacity(0.1), radius: 8, x: 0, y: 2)
        )
    }
    
    // MARK: - Header Section
    private var headerSection: some View {
        HStack {
            VStack(alignment: .leading, spacing: 4) {
                Text("Ejemplo Clínico")
                    .font(.headline)
                    .fontWeight(.semibold)
                
                Text("\(currentExampleIndex + 1) de \(examples.count)")
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
            
            Spacer()
            
            // Navegación entre ejemplos
            HStack(spacing: 8) {
                Button(action: previousExample) {
                    Image(systemName: "chevron.left")
                        .font(.caption)
                        .foregroundColor(.blue)
                }
                .disabled(currentExampleIndex == 0)
                
                Button(action: nextExample) {
                    Image(systemName: "chevron.right")
                        .font(.caption)
                        .foregroundColor(.blue)
                }
                .disabled(currentExampleIndex == examples.count - 1)
            }
        }
    }
    
    // MARK: - Example Content
    private var exampleContent: some View {
        VStack(spacing: 16) {
            // Escenario
            scenarioSection
            
            // Reacciones
            reactionsSection
        }
    }
    
    // MARK: - Scenario Section
    private var scenarioSection: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Situación:")
                .font(.subheadline)
                .fontWeight(.semibold)
                .foregroundColor(.primary)
            
            Text(examples[currentExampleIndex].scenario)
                .font(.body)
                .foregroundColor(.secondary)
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 8)
                        .fill(Color(.systemGray6))
                )
        }
    }
    
    // MARK: - Reactions Section
    private var reactionsSection: some View {
        VStack(spacing: 12) {
            // Reacción No Brain
            reactionCard(
                title: "Reacción No Brain",
                reaction: examples[currentExampleIndex].reactionNoBrain,
                color: .red,
                icon: "xmark.circle.fill"
            )
            
            // Flecha de transición
            HStack {
                Spacer()
                Image(systemName: "arrow.down")
                    .font(.title2)
                    .foregroundColor(.blue)
                    .rotationEffect(.degrees(isAnimating ? 180 : 0))
                Spacer()
            }
            .padding(.vertical, 8)
            
            // Reacción Yes Brain
            reactionCard(
                title: "Reacción Yes Brain",
                reaction: examples[currentExampleIndex].reactionYesBrain,
                color: .green,
                icon: "checkmark.circle.fill"
            )
        }
    }
    
    // MARK: - Reaction Card
    private func reactionCard(title: String, reaction: String, color: Color, icon: String) -> some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                Image(systemName: icon)
                    .foregroundColor(color)
                Text(title)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundColor(.primary)
            }
            
            Text(reaction)
                .font(.body)
                .foregroundColor(.secondary)
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 8)
                        .fill(color.opacity(0.1))
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(color.opacity(0.3), lineWidth: 1)
                        )
                )
        }
    }
    
    // MARK: - Transition Button
    private var transitionButton: some View {
        VStack(spacing: 12) {
            Button(action: {
                withAnimation(.spring(response: 0.5, dampingFraction: 0.8)) {
                    showingTransition.toggle()
                    isAnimating.toggle()
                    triggerHaptic()
                }
            }) {
                HStack {
                    Image(systemName: showingTransition ? "eye.slash" : "eye")
                        .font(.caption)
                    Text(showingTransition ? "Ocultar Transición" : "Ver Transición")
                        .fontWeight(.medium)
                }
                .foregroundColor(.white)
                .padding(.horizontal, 20)
                .padding(.vertical, 10)
                .background(
                    RoundedRectangle(cornerRadius: 20)
                        .fill(Color.blue)
                )
            }
            .buttonStyle(PlainButtonStyle())
            .accessibilityLabel(showingTransition ? "Ocultar transición" : "Ver transición")
            
            // Aprendizaje
            if showingTransition {
                learningSection
            }
        }
    }
    
    // MARK: - Learning Section
    private var learningSection: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                Image(systemName: "lightbulb.fill")
                    .foregroundColor(.orange)
                Text("Aprendizaje Clave:")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundColor(.primary)
            }
            
            Text(examples[currentExampleIndex].learning)
                .font(.body)
                .foregroundColor(.secondary)
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 8)
                        .fill(Color.orange.opacity(0.1))
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(Color.orange.opacity(0.3), lineWidth: 1)
                        )
                )
        }
        .transition(.asymmetric(
            insertion: .opacity.combined(with: .scale(scale: 0.8)),
            removal: .opacity.combined(with: .scale(scale: 0.8))
        ))
    }
    
    // MARK: - Navigation Methods
    private func previousExample() {
        withAnimation(.easeInOut(duration: 0.3)) {
            if currentExampleIndex > 0 {
                currentExampleIndex -= 1
                triggerHaptic()
            }
        }
    }
    
    private func nextExample() {
        withAnimation(.easeInOut(duration: 0.3)) {
            if currentExampleIndex < examples.count - 1 {
                currentExampleIndex += 1
                triggerHaptic()
            }
        }
    }
    
    // MARK: - Haptic Feedback
    private func triggerHaptic() {
        let impactFeedback = UIImpactFeedbackGenerator(style: .light)
        impactFeedback.impactOccurred()
    }
}

// MARK: - Supporting Types
struct ClinicalExample {
    let scenario: String
    let reactionNoBrain: String
    let reactionYesBrain: String
    let learning: String
}

// MARK: - Preview
struct ClinicalExampleCard_Previews: PreviewProvider {
    @State static var showingTransition = false
    
    static var previews: some View {
        VStack {
            ClinicalExampleCard(showingTransition: $showingTransition)
        }
        .padding()
        .background(Color(.systemGroupedBackground))
    }
}
