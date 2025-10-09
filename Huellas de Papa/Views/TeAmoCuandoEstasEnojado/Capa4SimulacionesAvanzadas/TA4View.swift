import SwiftUI

/// Vista principal de la Capa 4 (Simulaciones Avanzadas)
/// Laboratorio emocional para practicar el amor incondicional
struct TA4View: View {
    @State private var selectedScenario: TA4Scenario?
    
    var body: some View {
        ScrollView {
            VStack(spacing: 32) {
                // 1. Header
                headerSection
                
                // 2. Escenarios
                scenariosSection
                
                // 3. Cita motivacional
                motivationalQuoteSection
            }
            .padding()
        }
        .background(Color(.systemGroupedBackground))
        .navigationTitle("Simulaciones")
        .navigationBarTitleDisplayMode(.large)
        .sheet(item: $selectedScenario) { scenario in
            TA4SimulationView(scenario: scenario)
        }
    }
    
    // MARK: - 1. Header Section
    private var headerSection: some View {
        VStack(spacing: 16) {
            Image(systemName: "theatermasks.fill")
                .font(.system(size: 60))
                .foregroundStyle(
                    LinearGradient(
                        colors: [.pink, .mint],
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                )
            
            Text("Simulaciones Avanzadas")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundStyle(
                    LinearGradient(
                        gradient: Gradient(colors: [.pink, .mint]),
                        startPoint: .leading,
                        endPoint: .trailing
                    )
                )
                .multilineTextAlignment(.center)
            
            Text("Practica el amor incondicional en situaciones reales")
                .font(.title3)
                .fontWeight(.medium)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
        }
        .padding(.vertical)
    }
    
    // MARK: - 2. Scenarios Section
    private var scenariosSection: some View {
        VStack(alignment: .leading, spacing: 16) {
            VStack(alignment: .leading, spacing: 8) {
                Text("5 Simulaciones del Libro")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .foregroundColor(.primary)
                
                Text("Situaciones únicas de 'Te amo cuando estás enojado'")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
            
            VStack(spacing: 16) {
                ForEach(TA4Scenario.allScenarios) { scenario in
                    TA4ScenarioCard(scenario: scenario) {
                        selectedScenario = scenario
                    }
                }
            }
        }
    }
    
    // MARK: - 3. Motivational Quote Section
    private var motivationalQuoteSection: some View {
        VStack(spacing: 20) {
            Image(systemName: "heart.circle.fill")
                .font(.largeTitle)
                .foregroundStyle(
                    LinearGradient(
                        colors: [.pink, .mint],
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                )
            
            VStack(spacing: 12) {
                Text("Cada elección es una oportunidad para practicar el amor incondicional.")
                    .font(.title3)
                    .fontWeight(.medium)
                    .foregroundColor(.primary)
                    .multilineTextAlignment(.center)
                
                Text("— Basado en el libro de Erin Winters")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
            .padding(.vertical, 24)
            .padding(.horizontal, 20)
            .background(
                RoundedRectangle(cornerRadius: 16)
                    .fill(
                        LinearGradient(
                            gradient: Gradient(colors: [
                                Color.pink.opacity(0.1),
                                Color.mint.opacity(0.05)
                            ]),
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                    )
                    .overlay(
                        RoundedRectangle(cornerRadius: 16)
                            .stroke(
                                LinearGradient(
                                    gradient: Gradient(colors: [
                                        Color.pink.opacity(0.3),
                                        Color.mint.opacity(0.2)
                                    ]),
                                    startPoint: .topLeading,
                                    endPoint: .bottomTrailing
                                ),
                                lineWidth: 1
                            )
                    )
            )
            .shadow(color: Color.pink.opacity(0.1), radius: 8, x: 0, y: 4)
        }
        .padding(.top)
    }
}

