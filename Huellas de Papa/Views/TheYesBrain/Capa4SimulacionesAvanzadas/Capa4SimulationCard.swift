import SwiftUI

/// Tarjeta que representa un escenario de simulación de la Capa 4
struct Capa4SimulationCard: View {
    let scenario: Capa4Scenario
    
    var body: some View {
        NavigationLink(destination: ScenarioInteractiveView(scenario: scenario)) {
            cardContent
        }
        .buttonStyle(PlainButtonStyle())
    }
    
    private var cardContent: some View {
        VStack(alignment: .leading, spacing: 16) {
            // Header con ícono y categoría
            HStack {
                Image(systemName: scenario.icon)
                    .font(.title)
                    .foregroundColor(scenarioColor)
                    .frame(width: 40, height: 40)
                    .background(
                        Circle()
                            .fill(scenarioColor.opacity(0.1))
                    )
                
                VStack(alignment: .leading, spacing: 4) {
                    Text(scenario.category)
                        .font(.caption)
                        .fontWeight(.medium)
                        .padding(.horizontal, 8)
                        .padding(.vertical, 4)
                        .background(
                            RoundedRectangle(cornerRadius: 8)
                                .fill(scenarioColor.opacity(0.2))
                        )
                        .foregroundColor(scenarioColor)
                    
                    HStack(spacing: 4) {
                        ForEach(0..<scenario.difficulty, id: \.self) { _ in
                            Image(systemName: "star.fill")
                                .font(.caption2)
                                .foregroundColor(.orange)
                        }
                        
                        Text("Nivel \(scenario.difficulty)")
                            .font(.caption2)
                            .foregroundColor(.secondary)
                    }
                }
                
                Spacer()
                
                Image(systemName: "chevron.right.circle.fill")
                    .font(.title2)
                    .foregroundColor(scenarioColor)
            }
            
            // Título
            Text(scenario.title)
                .font(.headline)
                .fontWeight(.bold)
                .foregroundColor(.primary)
                .multilineTextAlignment(.leading)
                .lineLimit(2)
            
            // Trigger
            HStack(alignment: .top, spacing: 8) {
                Image(systemName: "exclamationmark.triangle.fill")
                    .font(.caption)
                    .foregroundColor(.orange)
                
                Text(scenario.trigger)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                    .multilineTextAlignment(.leading)
                    .lineLimit(2)
            }
            
            Divider()
            
            // Footer con información
            HStack {
                Label("\(scenario.options.count) opciones", systemImage: "point.3.connected.trianglepath.dotted")
                    .font(.caption)
                    .foregroundColor(.secondary)
                
                Spacer()
                
                Text("Iniciar →")
                    .font(.subheadline)
                    .fontWeight(.medium)
                    .foregroundColor(scenarioColor)
            }
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(Color(.systemBackground))
                .overlay(
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(scenarioColor.opacity(0.3), lineWidth: 2)
                )
        )
        .shadow(
            color: scenarioColor.opacity(0.1),
            radius: 8,
            x: 0,
            y: 4
        )
    }
    
    private var scenarioColor: Color {
        switch scenario.color {
        case "red": return .red
        case "orange": return .orange
        case "pink": return .pink
        case "purple": return .purple
        case "blue": return .blue
        case "green": return .green
        case "indigo": return .indigo
        case "teal": return .teal
        default: return .purple
        }
    }
}

// MARK: - Preview
struct Capa4SimulationCard_Previews: PreviewProvider {
    static var previews: some View {
        ScrollView {
            VStack(spacing: 16) {
                ForEach(Capa4EscenariosData.escenarios.prefix(3)) { scenario in
                    Capa4SimulationCard(scenario: scenario)
                }
            }
            .padding()
        }
        .background(Color(.systemGroupedBackground))
    }
}

