import SwiftUI

/// Vista interactiva donde el padre elige su respuesta
struct TV4InteractiveView: View {
    let scenario: TV4Scenario
    let onComplete: () -> Void
    
    @State private var selectedOption: TV4Option?
    @State private var showingOutcome = false
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        ScrollView {
            VStack(spacing: 32) {
                if !showingOutcome {
                    // Fase 1: Presentación del escenario
                    scenarioPresentation
                } else if let option = selectedOption {
                    // Fase 2: Mostrar resultado
                    TV4OutcomeView(
                        option: option,
                        scenario: scenario,
                        onTryAgain: {
                            withAnimation {
                                selectedOption = nil
                                showingOutcome = false
                            }
                        },
                        onContinue: {
                            onComplete()
                            dismiss()
                        }
                    )
                }
            }
            .padding()
        }
        .navigationTitle(scenario.title)
        .navigationBarTitleDisplayMode(.large)
        .background(Color(.systemGroupedBackground))
    }
    
    // MARK: - Scenario Presentation
    private var scenarioPresentation: some View {
        VStack(spacing: 24) {
            // Header con info del niño
            childInfoCard
            
            // Situación
            situationCard
            
            // Análisis del volcán
            analysisCard
            
            // Opciones de respuesta
            optionsSection
        }
    }
    
    private var childInfoCard: some View {
        HStack(spacing: 16) {
            Image(systemName: "person.circle.fill")
                .font(.system(size: 50))
                .foregroundColor(.blue)
            
            VStack(alignment: .leading, spacing: 4) {
                Text(scenario.childName)
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(.primary)
                
                Text(scenario.childAge)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                
                HStack {
                    phaseIcon
                    Text(scenario.volcanoPhase.rawValue)
                        .font(.caption)
                        .fontWeight(.semibold)
                        .foregroundColor(phaseColor)
                }
                .padding(.horizontal, 10)
                .padding(.vertical, 4)
                .background(
                    Capsule()
                        .fill(phaseColor.opacity(0.1))
                )
            }
            
            Spacer()
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(Color(.systemBackground))
                .shadow(color: Color.black.opacity(0.1), radius: 8, x: 0, y: 2)
        )
    }
    
    private var situationCard: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack {
                Image(systemName: "book.pages.fill")
                    .foregroundColor(.orange)
                    .font(.title2)
                
                Text("La Situación")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .foregroundColor(.primary)
            }
            
            Text(scenario.situation)
                .font(.body)
                .foregroundColor(.primary)
                .fixedSize(horizontal: false, vertical: true)
                .lineSpacing(6)
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(Color(.systemBackground))
                .shadow(color: Color.black.opacity(0.1), radius: 8, x: 0, y: 2)
        )
    }
    
    private var analysisCard: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack {
                Image(systemName: "magnifyingglass")
                    .foregroundColor(.mint)
                    .font(.title2)
                
                Text("Análisis del Volcán")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .foregroundColor(.primary)
            }
            
            // Botón presionado
            analysisRow(icon: "circle.grid.cross.fill", label: "Botón Presionado", value: scenario.trigger, color: .red)
            
            // Señales físicas
            VStack(alignment: .leading, spacing: 8) {
                HStack {
                    Image(systemName: "figure.stand")
                        .foregroundColor(.orange)
                    Text("Señales Físicas:")
                        .font(.caption)
                        .fontWeight(.semibold)
                        .foregroundColor(.orange)
                }
                
                ForEach(scenario.physicalSignals, id: \.self) { signal in
                    HStack(spacing: 8) {
                        Image(systemName: "circle.fill")
                            .font(.system(size: 4))
                            .foregroundColor(.orange)
                        Text(signal)
                            .font(.caption)
                            .foregroundColor(.secondary)
                    }
                    .padding(.leading, 8)
                }
            }
            
            // Pensamiento
            analysisRow(icon: "cloud.fill", label: "Pensamiento", value: scenario.thoughtPattern, color: .purple)
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(Color(.systemBackground))
                .shadow(color: Color.black.opacity(0.1), radius: 8, x: 0, y: 2)
        )
    }
    
    private func analysisRow(icon: String, label: String, value: String, color: Color) -> some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                Image(systemName: icon)
                    .foregroundColor(color)
                Text(label)
                    .font(.caption)
                    .fontWeight(.semibold)
                    .foregroundColor(color)
            }
            
            Text(value)
                .font(.caption)
                .foregroundColor(.secondary)
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(
                    RoundedRectangle(cornerRadius: 8)
                        .fill(color.opacity(0.1))
                )
        }
    }
    
    private var optionsSection: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack {
                Image(systemName: "hand.point.up.fill")
                    .foregroundColor(.blue)
                    .font(.title2)
                
                Text("¿Cómo Responderías?")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .foregroundColor(.primary)
            }
            
            Text("Elige la opción que mejor refleja lo que harías:")
                .font(.subheadline)
                .foregroundColor(.secondary)
            
            ForEach(scenario.options) { option in
                optionButton(option)
            }
        }
    }
    
    private func optionButton(_ option: TV4Option) -> some View {
        Button {
            withAnimation(.spring()) {
                selectedOption = option
                showingOutcome = true
            }
        } label: {
            HStack(spacing: 12) {
                Image(systemName: "circle")
                    .foregroundColor(.blue)
                    .font(.title3)
                
                Text(option.text)
                    .font(.body)
                    .foregroundColor(.primary)
                    .multilineTextAlignment(.leading)
                    .fixedSize(horizontal: false, vertical: true)
                
                Spacer()
            }
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 12)
                    .fill(Color.blue.opacity(0.05))
                    .overlay(
                        RoundedRectangle(cornerRadius: 12)
                            .stroke(Color.blue.opacity(0.3), lineWidth: 1)
                    )
            )
        }
    }
    
    // MARK: - Helpers
    private var phaseIcon: some View {
        Group {
            switch scenario.volcanoPhase {
            case .chispa:
                Image(systemName: "flame.fill")
                    .foregroundColor(.orange)
            case .burbujeo:
                Image(systemName: "smoke.fill")
                    .foregroundColor(.red)
            case .erupcion:
                Image(systemName: "tornado")
                    .foregroundColor(.purple)
            }
        }
        .font(.caption)
    }
    
    private var phaseColor: Color {
        switch scenario.volcanoPhase {
        case .chispa: return .orange
        case .burbujeo: return .red
        case .erupcion: return .purple
        }
    }
    
    private var scenarioColor: Color {
        switch scenario.color {
        case "red": return .red
        case "orange": return .orange
        case "purple": return .purple
        case "blue": return .blue
        case "green": return .green
        default: return .blue
        }
    }
}

#Preview {
    NavigationStack {
        TV4InteractiveView(scenario: TV4Data.scenarios[0], onComplete: {})
    }
}

