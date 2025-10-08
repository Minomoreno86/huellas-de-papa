import SwiftUI

/// Vista comparativa interactiva entre estados Yes Brain y No Brain
/// Muestra las diferencias fundamentales entre ambos modos cerebrales
struct YesNoToggleView: View {
    @Binding var selectedState: YesNoState
    @State private var isAnimating = false
    
    var body: some View {
        VStack(spacing: 24) {
            // Toggle principal con diseño mejorado
            HStack(spacing: 0) {
                // Botón Yes Brain
                Button(action: {
                    withAnimation(.spring(response: 0.4, dampingFraction: 0.8)) {
                        selectedState = .yes
                        triggerHaptic()
                    }
                }) {
                    HStack(spacing: 8) {
                        Image(systemName: "checkmark.circle.fill")
                            .font(.title3)
                            .foregroundColor(selectedState == .yes ? .white : .green)
                        Text("YES BRAIN")
                            .font(.headline)
                            .fontWeight(.bold)
                    }
                    .foregroundColor(selectedState == .yes ? .white : .green)
                    .padding(.horizontal, 24)
                    .padding(.vertical, 16)
                    .background(
                        RoundedRectangle(cornerRadius: 25)
                            .fill(
                                selectedState == .yes ? 
                                LinearGradient(
                                    gradient: Gradient(colors: [.green, .mint]),
                                    startPoint: .leading,
                                    endPoint: .trailing
                                ) :
                                LinearGradient(
                                    gradient: Gradient(colors: [Color.green.opacity(0.1), Color.mint.opacity(0.1)]),
                                    startPoint: .leading,
                                    endPoint: .trailing
                                )
                            )
                    )
                }
                .buttonStyle(PlainButtonStyle())
                .accessibilityLabel("Yes Brain - Estado receptivo e integrado")
                .accessibilityHint("Toca para seleccionar el estado Yes Brain")
                
                // Botón No Brain
                Button(action: {
                    withAnimation(.spring(response: 0.4, dampingFraction: 0.8)) {
                        selectedState = .no
                        triggerHaptic()
                    }
                }) {
                    HStack(spacing: 8) {
                        Image(systemName: "xmark.circle.fill")
                            .font(.title3)
                            .foregroundColor(selectedState == .no ? .white : .red)
                        Text("NO BRAIN")
                            .font(.headline)
                            .fontWeight(.bold)
                    }
                    .foregroundColor(selectedState == .no ? .white : .red)
                    .padding(.horizontal, 24)
                    .padding(.vertical, 16)
                    .background(
                        RoundedRectangle(cornerRadius: 25)
                            .fill(
                                selectedState == .no ? 
                                LinearGradient(
                                    gradient: Gradient(colors: [.red, .orange]),
                                    startPoint: .leading,
                                    endPoint: .trailing
                                ) :
                                LinearGradient(
                                    gradient: Gradient(colors: [Color.red.opacity(0.1), Color.orange.opacity(0.1)]),
                                    startPoint: .leading,
                                    endPoint: .trailing
                                )
                            )
                    )
                }
                .buttonStyle(PlainButtonStyle())
                .accessibilityLabel("No Brain - Estado reactivo y defensivo")
                .accessibilityHint("Toca para seleccionar el estado No Brain")
            }
            .background(
                RoundedRectangle(cornerRadius: 25)
                    .fill(Color(.systemGray6))
            )
            .overlay(
                RoundedRectangle(cornerRadius: 25)
                    .stroke(Color(.systemGray4), lineWidth: 1)
            )
            
            // Descripción del estado seleccionado con animación
            stateDescription
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 20)
                .fill(Color(.systemBackground))
                .shadow(color: .black.opacity(0.1), radius: 10, x: 0, y: 5)
        )
    }
    
    // MARK: - State Description
    private var stateDescription: some View {
        VStack(spacing: 16) {
            // Título del estado
            Text(selectedState == .yes ? "Estado Integrador" : "Estado Defensivo")
                .font(.title2)
                .fontWeight(.bold)
                .foregroundColor(selectedState == .yes ? .green : .red)
                .transition(.opacity.combined(with: .scale(scale: 0.8)))
            
            // Descripción principal
            Text(selectedState == .yes ? yesBrainDescription : noBrainDescription)
                .font(.body)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
                .lineLimit(nil)
                .transition(.opacity.combined(with: .scale(scale: 0.8)))
            
            // Características clave
            characteristicsView
        }
        .animation(.easeInOut(duration: 0.3), value: selectedState)
    }
    
    // MARK: - Characteristics View
    private var characteristicsView: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Características:")
                .font(.subheadline)
                .fontWeight(.semibold)
                .foregroundColor(.primary)
            
            LazyVGrid(columns: [
                GridItem(.flexible()),
                GridItem(.flexible())
            ], spacing: 8) {
                ForEach(selectedState == .yes ? yesCharacteristics : noCharacteristics, id: \.self) { characteristic in
                    HStack(alignment: .top, spacing: 8) {
                        Image(systemName: selectedState == .yes ? "checkmark.circle.fill" : "xmark.circle.fill")
                            .foregroundColor(selectedState == .yes ? .green : .red)
                            .font(.caption)
                        
                        Text(characteristic)
                            .font(.caption)
                            .foregroundColor(.secondary)
                            .multilineTextAlignment(.leading)
                    }
                }
            }
        }
        .transition(.opacity.combined(with: .scale(scale: 0.8)))
    }
    
    // MARK: - Data Properties
    private var yesBrainDescription: String {
        "Corteza prefrontal activa + amígdala regulada. El cerebro está abierto, curioso y listo para aprender de manera integrada."
    }
    
    private var noBrainDescription: String {
        "Amígdala dominante + desconexión cortical. El cerebro está cerrado, defensivo y en modo de supervivencia."
    }
    
    private var yesCharacteristics: [String] {
        [
            "Apertura a nuevas experiencias",
            "Curiosidad y exploración",
            "Flexibilidad mental",
            "Conexión emocional",
            "Aprendizaje activo",
            "Autorregulación"
        ]
    }
    
    private var noCharacteristics: [String] {
        [
            "Resistencia al cambio",
            "Miedo y ansiedad",
            "Rigidez mental",
            "Desconexión emocional",
            "Comportamiento defensivo",
            "Reactividad"
        ]
    }
    
    // MARK: - Haptic Feedback
    private func triggerHaptic() {
        let impactFeedback = UIImpactFeedbackGenerator(style: .medium)
        impactFeedback.impactOccurred()
    }
}

// MARK: - Preview
struct YesNoToggleView_Previews: PreviewProvider {
    @State static var selectedState: YesNoState = .yes
    
    static var previews: some View {
        VStack {
            YesNoToggleView(selectedState: $selectedState)
        }
        .padding()
        .background(Color(.systemGroupedBackground))
    }
}
