import SwiftUI

/// Toggle interactivo para comparar crianza autoritaria vs. con apego
struct BM1ComparisonToggle: View {
    @Binding var selectedApproach: ParentingApproach
    
    var body: some View {
        VStack(spacing: 24) {
            // Selector
            HStack(spacing: 0) {
                Button(action: {
                    triggerHaptic()
                    withAnimation(.spring(response: 0.3, dampingFraction: 0.7)) {
                        selectedApproach = .authoritarian
                    }
                }) {
                    VStack(spacing: 8) {
                        Image(systemName: "xmark.circle.fill")
                            .font(.title2)
                        Text("Autoritaria")
                            .font(.subheadline)
                            .fontWeight(.medium)
                    }
                    .foregroundColor(selectedApproach == .authoritarian ? .white : .red.opacity(0.7))
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(
                        selectedApproach == .authoritarian ?
                        Color.red.opacity(0.7) : Color.clear
                    )
                }
                .clipShape(UnevenRoundedRectangle(topLeadingRadius: 12, bottomLeadingRadius: 12, bottomTrailingRadius: 0, topTrailingRadius: 0))
                
                Button(action: {
                    triggerHaptic()
                    withAnimation(.spring(response: 0.3, dampingFraction: 0.7)) {
                        selectedApproach = .attachment
                    }
                }) {
                    VStack(spacing: 8) {
                        Image(systemName: "checkmark.circle.fill")
                            .font(.title2)
                        Text("Con Apego")
                            .font(.subheadline)
                            .fontWeight(.medium)
                    }
                    .foregroundColor(selectedApproach == .attachment ? .white : .mint)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(
                        selectedApproach == .attachment ?
                        Color.mint : Color.clear
                    )
                }
                .clipShape(UnevenRoundedRectangle(topLeadingRadius: 0, bottomLeadingRadius: 0, bottomTrailingRadius: 12, topTrailingRadius: 12))
            }
            .background(
                RoundedRectangle(cornerRadius: 12)
                    .stroke(Color.secondary.opacity(0.3), lineWidth: 1)
            )
            
            // Contenido según selección
            VStack(alignment: .leading, spacing: 16) {
                ForEach(comparisonData) { comparison in
                    ComparisonRow(
                        comparison: comparison,
                        selectedApproach: selectedApproach
                    )
                }
            }
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 12)
                    .fill(Color(.systemBackground))
                    .shadow(color: Color.blue.opacity(0.1), radius: 8, x: 0, y: 4)
            )
        }
    }
    
    private var comparisonData: [BM1Comparison] {
        [
            BM1Comparison(
                aspect: "Llanto",
                authoritarianView: "Déjalo llorar, se acostumbrará",
                attachmentView: "El llanto es comunicación, responde siempre"
            ),
            BM1Comparison(
                aspect: "Sueño",
                authoritarianView: "Debe dormir solo desde bebé",
                attachmentView: "El colecho es natural y seguro"
            ),
            BM1Comparison(
                aspect: "Brazos",
                authoritarianView: "Lo vas a malcriar",
                attachmentView: "El contacto es una necesidad biológica"
            ),
            BM1Comparison(
                aspect: "Lactancia",
                authoritarianView: "Horarios fijos cada 3 horas",
                attachmentView: "A demanda, cuando el bebé lo pida"
            )
        ]
    }
    
    private func triggerHaptic() {
        let impactFeedback = UIImpactFeedbackGenerator(style: .medium)
        impactFeedback.impactOccurred()
    }
}

/// Fila de comparación individual
struct ComparisonRow: View {
    let comparison: BM1Comparison
    let selectedApproach: ParentingApproach
    
    var body: some View {
        HStack(alignment: .top, spacing: 12) {
            Image(systemName: selectedApproach == .authoritarian ? "xmark.circle.fill" : "checkmark.circle.fill")
                .foregroundColor(selectedApproach == .authoritarian ? .red.opacity(0.7) : .mint)
                .font(.title3)
            
            VStack(alignment: .leading, spacing: 6) {
                Text(comparison.aspect)
                    .font(.headline)
                    .foregroundColor(.primary)
                
                Text(selectedApproach == .authoritarian ? comparison.authoritarianView : comparison.attachmentView)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                    .fixedSize(horizontal: false, vertical: true)
            }
        }
    }
}

enum ParentingApproach {
    case authoritarian, attachment
}

