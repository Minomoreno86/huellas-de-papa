import SwiftUI

/// Tarjeta visual para mostrar un escenario de aplicación de principios
struct TV2ScenarioCard: View {
    let scenario: TV2Scenario
    
    var body: some View {
        NavigationLink(destination: TV2ScenarioDetailView(scenario: scenario)) {
            VStack(alignment: .leading, spacing: 16) {
                // Header
                VStack(alignment: .leading, spacing: 8) {
                    HStack {
                        Image(systemName: "book.pages.fill")
                            .foregroundColor(.orange)
                            .font(.title3)
                        
                        Spacer()
                        
                        Image(systemName: "chevron.right")
                            .foregroundColor(.secondary)
                            .font(.caption)
                    }
                    
                    Text(scenario.title)
                        .font(.title3)
                        .fontWeight(.bold)
                        .foregroundColor(.primary)
                        .lineLimit(2)
                        .fixedSize(horizontal: false, vertical: true)
                }
                
                Divider()
                
                // Situación
                Text(scenario.situation)
                    .font(.caption)
                    .foregroundColor(.secondary)
                    .lineLimit(4)
                    .fixedSize(horizontal: false, vertical: true)
                
                Spacer()
                
                // Fase del volcán
                HStack {
                    Image(systemName: phaseIcon)
                        .foregroundColor(phaseColor)
                    
                    Text(scenario.volcanoPhase)
                        .font(.caption)
                        .fontWeight(.semibold)
                        .foregroundColor(phaseColor)
                        .padding(.horizontal, 12)
                        .padding(.vertical, 6)
                        .background(
                            Capsule()
                                .fill(phaseColor.opacity(0.1))
                        )
                }
                
                // Footer
                HStack {
                    Text("Ver historia completa")
                        .font(.caption)
                        .fontWeight(.semibold)
                        .foregroundColor(.orange)
                    
                    Image(systemName: "arrow.right")
                        .font(.caption)
                        .foregroundColor(.orange)
                }
            }
            .padding()
            .frame(width: 300, height: 300)
            .background(
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color(.systemBackground))
                    .shadow(color: Color.black.opacity(0.1), radius: 10, x: 0, y: 4)
            )
        }
        .buttonStyle(PlainButtonStyle())
    }
    
    // MARK: - Helpers
    private var phaseIcon: String {
        if scenario.volcanoPhase.contains("Chispa") {
            return "flame.fill"
        } else if scenario.volcanoPhase.contains("Burbujeo") {
            return "smoke.fill"
        } else if scenario.volcanoPhase.contains("Erupción") {
            return "tornado"
        }
        return "flame.fill"
    }
    
    private var phaseColor: Color {
        if scenario.volcanoPhase.contains("Chispa") {
            return .orange
        } else if scenario.volcanoPhase.contains("Burbujeo") {
            return .red
        } else if scenario.volcanoPhase.contains("Erupción") {
            return .purple
        }
        return .orange
    }
}

#Preview {
    NavigationStack {
        ScrollView(.horizontal) {
            HStack {
                ForEach(TV2Data.scenarios) { scenario in
                    TV2ScenarioCard(scenario: scenario)
                }
            }
            .padding()
        }
    }
    .background(Color(.systemGroupedBackground))
}

