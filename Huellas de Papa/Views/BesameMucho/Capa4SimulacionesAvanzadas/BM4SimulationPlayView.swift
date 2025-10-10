import SwiftUI

/// Vista interactiva para jugar una simulación
struct BM4SimulationPlayView: View {
    let simulation: BM4Simulation
    @Environment(\.dismiss) var dismiss
    @State private var selectedDecision: BM4Decision?
    @State private var showingResult = false
    
    var body: some View {
        NavigationView {
            ZStack {
                if !showingResult {
                    // Vista de la simulación
                    simulationView
                } else if let decision = selectedDecision {
                    // Vista de resultados
                    resultView(for: decision)
                }
            }
            .navigationTitle("Simulación \(simulation.number)")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                        if showingResult {
                            withAnimation {
                                showingResult = false
                                selectedDecision = nil
                            }
                        } else {
                            dismiss()
                        }
                    }) {
                        HStack {
                            Image(systemName: showingResult ? "arrow.left" : "xmark")
                            Text(showingResult ? "Volver" : "Cerrar")
                        }
                    }
                }
            }
        }
    }
    
    // MARK: - Simulation View
    private var simulationView: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 24) {
                // Header con categoría
                VStack(alignment: .leading, spacing: 12) {
                    Label(simulation.category.rawValue, systemImage: simulation.category.icon)
                        .font(.subheadline)
                        .foregroundColor(colorForCategory(simulation.category))
                    
                    Text(simulation.title)
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundStyle(
                            LinearGradient(
                                gradient: Gradient(colors: [.blue, .mint]),
                                startPoint: .leading,
                                endPoint: .trailing
                            )
                        )
                    
                    Text(simulation.context)
                        .font(.body)
                        .foregroundColor(.secondary)
                }
                
                Divider()
                
                // Situación inicial
                VStack(alignment: .leading, spacing: 12) {
                    Label("Situación", systemImage: "doc.text.fill")
                        .font(.headline)
                        .foregroundColor(.primary)
                    
                    Text(simulation.initialSituation)
                        .font(.body)
                        .foregroundColor(.primary)
                        .fixedSize(horizontal: false, vertical: true)
                }
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 12)
                        .fill(Color.blue.opacity(0.1))
                )
                
                // Presiones externas
                if !simulation.externalPressures.isEmpty {
                    VStack(alignment: .leading, spacing: 12) {
                        Label("Presiones externas", systemImage: "exclamationmark.bubble.fill")
                            .font(.headline)
                            .foregroundColor(.red)
                        
                        ForEach(simulation.externalPressures, id: \.self) { pressure in
                            HStack(alignment: .top, spacing: 8) {
                                Image(systemName: "quote.bubble.fill")
                                    .foregroundColor(.red.opacity(0.7))
                                    .font(.caption)
                                
                                Text(pressure)
                                    .font(.body)
                                    .foregroundColor(.primary)
                                    .italic()
                                    .fixedSize(horizontal: false, vertical: true)
                            }
                        }
                    }
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 12)
                            .fill(Color.red.opacity(0.05))
                    )
                }
                
                // Pregunta
                VStack(alignment: .leading, spacing: 12) {
                    Text("¿Qué decides hacer?")
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(.primary)
                    
                    Text("Selecciona una opción y descubre las consecuencias según el libro:")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
                .padding(.top, 8)
                
                // Decisiones
                VStack(spacing: 16) {
                    ForEach(Array(simulation.decisions.enumerated()), id: \.element.id) { index, decision in
                        Button(action: {
                            triggerHaptic()
                            selectedDecision = decision
                            withAnimation(.spring(response: 0.4, dampingFraction: 0.8)) {
                                showingResult = true
                            }
                        }) {
                            HStack(alignment: .top, spacing: 12) {
                                Text("\(index + 1)")
                                    .font(.headline)
                                    .foregroundColor(.white)
                                    .frame(width: 32, height: 32)
                                    .background(Circle().fill(Color.blue))
                                
                                VStack(alignment: .leading, spacing: 6) {
                                    Text(decision.text)
                                        .font(.body)
                                        .fontWeight(.medium)
                                        .foregroundColor(.primary)
                                        .multilineTextAlignment(.leading)
                                        .fixedSize(horizontal: false, vertical: true)
                                    
                                    // Badge de alineación
                                    HStack(spacing: 4) {
                                        Image(systemName: decision.alignment.icon)
                                            .font(.caption2)
                                        Text(decision.alignment.rawValue)
                                            .font(.caption)
                                    }
                                    .foregroundColor(colorForAlignment(decision.alignment))
                                }
                                
                                Spacer()
                                
                                Image(systemName: "chevron.right")
                                    .foregroundColor(.secondary)
                            }
                            .padding()
                            .background(
                                RoundedRectangle(cornerRadius: 12)
                                    .fill(Color(.systemBackground))
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 12)
                                            .stroke(Color.blue.opacity(0.3), lineWidth: 1)
                                    )
                            )
                        }
                    }
                }
            }
            .padding()
        }
        .background(Color(.systemGroupedBackground))
    }
    
    // MARK: - Result View
    private func resultView(for decision: BM4Decision) -> some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 24) {
                // Tu decisión
                VStack(alignment: .leading, spacing: 12) {
                    Text("Tu Decisión")
                        .font(.headline)
                        .foregroundColor(.secondary)
                    
                    Text(decision.text)
                        .font(.title3)
                        .fontWeight(.semibold)
                        .foregroundColor(.primary)
                }
                
                // Alineación
                HStack(spacing: 12) {
                    Image(systemName: decision.alignment.icon)
                        .font(.largeTitle)
                        .foregroundColor(colorForAlignment(decision.alignment))
                    
                    VStack(alignment: .leading, spacing: 4) {
                        Text("Alineación con Bésame Mucho")
                            .font(.caption)
                            .foregroundColor(.secondary)
                        
                        Text(decision.alignment.rawValue)
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundColor(colorForAlignment(decision.alignment))
                        
                        Text(decision.alignment.description)
                            .font(.caption)
                            .foregroundColor(.secondary)
                    }
                }
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 16)
                        .fill(colorForAlignment(decision.alignment).opacity(0.1))
                )
                
                Divider()
                
                // Impacto a corto plazo
                VStack(alignment: .leading, spacing: 12) {
                    Label("Impacto Inmediato", systemImage: "clock.fill")
                        .font(.headline)
                        .foregroundColor(.blue)
                    
                    Text(decision.shortTermImpact)
                        .font(.body)
                        .foregroundColor(.primary)
                        .fixedSize(horizontal: false, vertical: true)
                }
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 12)
                        .fill(Color.blue.opacity(0.1))
                )
                
                // Impacto a largo plazo
                VStack(alignment: .leading, spacing: 12) {
                    Label("Impacto a Largo Plazo", systemImage: "calendar.badge.clock")
                        .font(.headline)
                        .foregroundColor(.purple)
                    
                    Text(decision.longTermImpact)
                        .font(.body)
                        .foregroundColor(.primary)
                        .fixedSize(horizontal: false, vertical: true)
                }
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 12)
                        .fill(Color.purple.opacity(0.1))
                )
                
                // Explicación del libro
                VStack(alignment: .leading, spacing: 12) {
                    Label("Según Carlos González", systemImage: "book.fill")
                        .font(.headline)
                        .foregroundColor(.mint)
                    
                    Text(decision.bookExplanation)
                        .font(.body)
                        .foregroundColor(.primary)
                        .fixedSize(horizontal: false, vertical: true)
                }
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 12)
                        .fill(Color.mint.opacity(0.1))
                )
                
                // Alternativas sugeridas (si aplica)
                if let alternatives = decision.suggestedAlternatives, !alternatives.isEmpty {
                    VStack(alignment: .leading, spacing: 12) {
                        Label("Alternativas Sugeridas", systemImage: "lightbulb.fill")
                            .font(.headline)
                            .foregroundColor(.orange)
                        
                        ForEach(alternatives, id: \.self) { alternative in
                            HStack(alignment: .top, spacing: 8) {
                                Image(systemName: "arrow.right.circle.fill")
                                    .foregroundColor(.orange)
                                Text(alternative)
                                    .font(.body)
                                    .foregroundColor(.primary)
                                    .fixedSize(horizontal: false, vertical: true)
                            }
                        }
                    }
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 12)
                            .fill(Color.orange.opacity(0.1))
                    )
                }
                
                // Botones de acción
                VStack(spacing: 12) {
                    Button(action: {
                        withAnimation {
                            showingResult = false
                            selectedDecision = nil
                        }
                    }) {
                        Text("Intentar otra decisión")
                            .font(.headline)
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(
                                RoundedRectangle(cornerRadius: 12)
                                    .fill(Color.blue)
                            )
                    }
                    
                    Button(action: {
                        dismiss()
                    }) {
                        Text("Finalizar simulación")
                            .font(.subheadline)
                            .foregroundColor(.blue)
                    }
                }
                .padding(.top)
            }
            .padding()
        }
        .background(Color(.systemGroupedBackground))
    }
    
    private func colorForCategory(_ category: SimulationCategory) -> Color {
        switch category {
        case .sleep: return .indigo
        case .feeding: return .pink
        case .separation: return .blue
        case .discipline: return .orange
        case .development: return .purple
        case .externalPressure: return .red
        }
    }
    
    private func colorForAlignment(_ alignment: AlignmentLevel) -> Color {
        switch alignment {
        case .high: return .mint
        case .medium: return .orange
        case .low: return .red
        }
    }
    
    private func triggerHaptic() {
        #if !os(macOS)
        let impactFeedback = UIImpactFeedbackGenerator(style: .medium)
        impactFeedback.impactOccurred()
        #endif
    }
}

