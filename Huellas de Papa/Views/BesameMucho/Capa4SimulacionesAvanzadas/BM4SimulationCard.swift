import SwiftUI

/// Tarjeta que muestra una simulación disponible
struct BM4SimulationCard: View {
    let simulation: BM4Simulation
    @State private var showingSimulation = false
    
    var body: some View {
        Button(action: {
            triggerHaptic()
            showingSimulation = true
        }) {
            VStack(alignment: .leading, spacing: 12) {
                // Header con número y dificultad
                HStack {
                    Text("\(simulation.number)")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(colorForCategory(simulation.category))
                        .frame(width: 40, height: 40)
                        .background(
                            Circle()
                                .fill(colorForCategory(simulation.category).opacity(0.2))
                        )
                    
                    Spacer()
                    
                    HStack(spacing: 2) {
                        ForEach(0..<simulation.difficulty.stars, id: \.self) { _ in
                            Image(systemName: "star.fill")
                                .font(.caption)
                                .foregroundColor(.yellow)
                        }
                    }
                }
                
                // Categoría
                Label(simulation.category.rawValue, systemImage: simulation.category.icon)
                    .font(.caption)
                    .foregroundColor(colorForCategory(simulation.category))
                
                // Título
                Text(simulation.title)
                    .font(.headline)
                    .fontWeight(.semibold)
                    .foregroundColor(.primary)
                    .multilineTextAlignment(.leading)
                    .lineLimit(2)
                
                // Contexto
                Text(simulation.context)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                    .lineLimit(3)
                
                Divider()
                
                // Info de decisiones
                HStack {
                    Label("\(simulation.decisions.count) decisiones", systemImage: "hand.point.up.left.fill")
                        .font(.caption)
                        .foregroundColor(.blue)
                    
                    Spacer()
                    
                    Text(simulation.difficulty.rawValue)
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
            }
            .padding()
            .frame(maxWidth: .infinity)
            .background(
                RoundedRectangle(cornerRadius: 16)
                    .fill(Color(.systemBackground))
                    .shadow(color: colorForCategory(simulation.category).opacity(0.15), radius: 8, x: 0, y: 4)
            )
        }
        .fullScreenCover(isPresented: $showingSimulation) {
            BM4SimulationPlayView(simulation: simulation)
        }
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
    
    private func triggerHaptic() {
        #if !os(macOS)
        let impactFeedback = UIImpactFeedbackGenerator(style: .light)
        impactFeedback.impactOccurred()
        #endif
    }
}

