import SwiftUI

/// Vista comparativa interactiva entre estados Yes Brain y No Brain
/// Permite alternar entre ambos estados con animaciones y haptics
struct YesNoToggleView: View {
    @Binding var selectedState: YesNoState
    @State private var isAnimating = false
    
    var body: some View {
        VStack(spacing: 20) {
            // Toggle principal
            HStack(spacing: 0) {
                // Botón Yes Brain
                Button(action: {
                    withAnimation(.spring(response: 0.3, dampingFraction: 0.7)) {
                        selectedState = .yes
                        triggerHaptic()
                    }
                }) {
                    HStack {
                        Image(systemName: "checkmark.circle.fill")
                            .foregroundColor(selectedState == .yes ? .white : .green)
                        Text("YES BRAIN")
                            .fontWeight(.semibold)
                    }
                    .foregroundColor(selectedState == .yes ? .white : .green)
                    .padding(.horizontal, 20)
                    .padding(.vertical, 12)
                    .background(
                        RoundedRectangle(cornerRadius: 25)
                            .fill(selectedState == .yes ? Color.green : Color.green.opacity(0.1))
                    )
                }
                .buttonStyle(PlainButtonStyle())
                .accessibilityLabel("Yes Brain - Estado receptivo")
                .accessibilityHint("Toca para seleccionar el estado Yes Brain")
                
                // Botón No Brain
                Button(action: {
                    withAnimation(.spring(response: 0.3, dampingFraction: 0.7)) {
                        selectedState = .no
                        triggerHaptic()
                    }
                }) {
                    HStack {
                        Image(systemName: "xmark.circle.fill")
                            .foregroundColor(selectedState == .no ? .white : .red)
                        Text("NO BRAIN")
                            .fontWeight(.semibold)
                    }
                    .foregroundColor(selectedState == .no ? .white : .red)
                    .padding(.horizontal, 20)
                    .padding(.vertical, 12)
                    .background(
                        RoundedRectangle(cornerRadius: 25)
                            .fill(selectedState == .no ? Color.red : Color.red.opacity(0.1))
                    )
                }
                .buttonStyle(PlainButtonStyle())
                .accessibilityLabel("No Brain - Estado reactivo")
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
            
            // Descripción del estado seleccionado
            stateDescription
        }
        .padding()
        .background(Color(.systemBackground))
        .cornerRadius(16)
        .shadow(color: .black.opacity(0.05), radius: 8, x: 0, y: 2)
    }
    
    // MARK: - State Description
    private var stateDescription: some View {
        VStack(spacing: 12) {
            Text(selectedState == .yes ? "Estado Receptivo" : "Estado Reactivo")
                .font(.headline)
                .fontWeight(.semibold)
                .foregroundColor(selectedState == .yes ? .green : .red)
            
            Text(selectedState == .yes ? yesBrainDescription : noBrainDescription)
                .font(.body)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
                .lineLimit(nil)
            
            // Características clave
            characteristicsView
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(selectedState == .yes ? Color.green.opacity(0.05) : Color.red.opacity(0.05))
        )
    }
    
    // MARK: - Characteristics View
    private var characteristicsView: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Características:")
                .font(.subheadline)
                .fontWeight(.medium)
            
            ForEach(selectedState == .yes ? yesCharacteristics : noCharacteristics, id: \.self) { characteristic in
                HStack(alignment: .top, spacing: 8) {
                    Image(systemName: selectedState == .yes ? "checkmark.circle.fill" : "xmark.circle.fill")
                        .foregroundColor(selectedState == .yes ? .green : .red)
                        .font(.caption)
                    
                    Text(characteristic)
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
            }
        }
    }
    
    // MARK: - Data Properties
    private var yesBrainDescription: String {
        "El cerebro está abierto, curioso y listo para aprender. Es un estado de receptividad y flexibilidad mental."
    }
    
    private var noBrainDescription: String {
        "El cerebro está cerrado, defensivo y en alerta. Es un estado de reactividad y rigidez mental."
    }
    
    private var yesCharacteristics: [String] {
        [
            "Apertura a nuevas experiencias",
            "Curiosidad y exploración",
            "Flexibilidad mental",
            "Conexión emocional",
            "Aprendizaje activo"
        ]
    }
    
    private var noCharacteristics: [String] {
        [
            "Resistencia al cambio",
            "Miedo y ansiedad",
            "Rigidez mental",
            "Desconexión emocional",
            "Comportamiento defensivo"
        ]
    }
    
    // MARK: - Haptic Feedback
    private func triggerHaptic() {
        let impactFeedback = UIImpactFeedbackGenerator(style: .light)
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
