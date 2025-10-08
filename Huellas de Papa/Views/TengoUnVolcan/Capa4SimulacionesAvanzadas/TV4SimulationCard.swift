import SwiftUI

/// Tarjeta visual para mostrar un escenario de simulación
struct TV4SimulationCard: View {
    let scenario: TV4Scenario
    let isCompleted: Bool
    let onComplete: () -> Void
    
    var body: some View {
        NavigationLink(destination: TV4InteractiveView(scenario: scenario, onComplete: onComplete)) {
            HStack(spacing: 16) {
                // Indicador de completado + ícono
                VStack(spacing: 8) {
                    ZStack {
                        Circle()
                            .fill(scenarioColor.opacity(0.2))
                            .frame(width: 60, height: 60)
                        
                        if isCompleted {
                            Image(systemName: "checkmark.circle.fill")
                                .font(.title)
                                .foregroundColor(.green)
                        } else {
                            Image(systemName: scenario.iconName)
                                .font(.title2)
                                .foregroundColor(scenarioColor)
                        }
                    }
                    
                    // Dificultad
                    HStack(spacing: 2) {
                        ForEach(1...scenario.difficulty, id: \.self) { _ in
                            Image(systemName: "star.fill")
                                .font(.caption2)
                                .foregroundColor(.orange)
                        }
                    }
                }
                
                // Contenido
                VStack(alignment: .leading, spacing: 8) {
                    // Título
                    Text(scenario.title)
                        .font(.headline)
                        .fontWeight(.semibold)
                        .foregroundColor(.primary)
                        .lineLimit(2)
                    
                    // Info del niño
                    HStack(spacing: 12) {
                        Label(scenario.childName, systemImage: "person.fill")
                            .font(.caption)
                            .foregroundColor(.secondary)
                        
                        Label(scenario.childAge, systemImage: "calendar")
                            .font(.caption)
                            .foregroundColor(.secondary)
                    }
                    
                    // Fase del volcán
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
                    
                    // Estado
                    if isCompleted {
                        HStack {
                            Image(systemName: "checkmark")
                                .foregroundColor(.green)
                            Text("Completado")
                                .font(.caption)
                                .fontWeight(.semibold)
                                .foregroundColor(.green)
                        }
                    } else {
                        HStack {
                            Image(systemName: "play.fill")
                                .foregroundColor(.blue)
                            Text("Iniciar simulación")
                                .font(.caption)
                                .fontWeight(.semibold)
                                .foregroundColor(.blue)
                        }
                    }
                }
                
                Spacer()
                
                // Chevron
                Image(systemName: "chevron.right")
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 16)
                    .fill(Color(.systemBackground))
                    .shadow(color: Color.black.opacity(0.1), radius: 8, x: 0, y: 2)
            )
            .overlay(
                RoundedRectangle(cornerRadius: 16)
                    .stroke(isCompleted ? Color.green : Color.clear, lineWidth: 2)
            )
        }
        .buttonStyle(PlainButtonStyle())
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
        ScrollView {
            VStack {
                TV4SimulationCard(
                    scenario: TV4Data.scenarios[0],
                    isCompleted: false,
                    onComplete: {}
                )
                TV4SimulationCard(
                    scenario: TV4Data.scenarios[1],
                    isCompleted: true,
                    onComplete: {}
                )
            }
            .padding()
        }
    }
    .background(Color(.systemGroupedBackground))
}

