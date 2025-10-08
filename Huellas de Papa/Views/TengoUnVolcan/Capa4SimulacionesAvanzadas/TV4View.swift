import SwiftUI

/// Vista principal de la Capa 4 (Simulaciones Avanzadas) del módulo "Tengo un Volcán"
/// Escenarios interactivos para practicar respuestas ante el volcán del hijo
struct TV4View: View {
    @State private var completedScenarios: Set<UUID> = []
    
    var body: some View {
        ScrollView {
            VStack(spacing: 32) {
                // 1. Header
                headerSection
                
                // 2. Instrucciones
                instructionsSection
                
                // 3. Estadísticas de progreso
                progressSection
                
                // 4. Escenarios
                scenariosSection
            }
            .padding()
        }
        .navigationTitle("Simulaciones")
        .navigationBarTitleDisplayMode(.large)
        .background(Color(.systemGroupedBackground))
    }
    
    // MARK: - Header
    private var headerSection: some View {
        VStack(spacing: 16) {
            ZStack {
                Circle()
                    .fill(
                        LinearGradient(
                            gradient: Gradient(colors: [.purple.opacity(0.6), .blue.opacity(0.3)]),
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                    )
                    .frame(width: 100, height: 100)
                
                Image(systemName: "brain.head.profile")
                    .font(.system(size: 40))
                    .foregroundColor(.white)
            }
            
            Text("Simulaciones Avanzadas")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundStyle(
                    LinearGradient(
                        gradient: Gradient(colors: [.blue, .mint]),
                        startPoint: .leading,
                        endPoint: .trailing
                    )
                )
                .multilineTextAlignment(.center)
            
            Text("Practica cómo responder cuando el volcán de tu hijo se activa")
                .font(.title3)
                .fontWeight(.medium)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
        }
        .padding(.vertical)
    }
    
    // MARK: - Instructions
    private var instructionsSection: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack {
                Image(systemName: "info.circle.fill")
                    .foregroundColor(.blue)
                    .font(.title2)
                
                Text("¿Cómo funciona?")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .foregroundColor(.primary)
            }
            
            VStack(alignment: .leading, spacing: 12) {
                instructionRow(number: "1", text: "Lee el escenario cuidadosamente", icon: "book.fill")
                instructionRow(number: "2", text: "Elige cómo responderías", icon: "hand.point.up.fill")
                instructionRow(number: "3", text: "Ve el resultado de tu elección", icon: "eye.fill")
                instructionRow(number: "4", text: "Aprende qué funcionó y qué no", icon: "lightbulb.fill")
                instructionRow(number: "5", text: "Prueba diferentes respuestas", icon: "arrow.triangle.2.circlepath")
            }
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(Color(.systemBackground))
                .shadow(color: Color.black.opacity(0.1), radius: 8, x: 0, y: 2)
        )
    }
    
    private func instructionRow(number: String, text: String, icon: String) -> some View {
        HStack(spacing: 12) {
            Text(number)
                .font(.headline)
                .fontWeight(.bold)
                .foregroundColor(.white)
                .frame(width: 28, height: 28)
                .background(Circle().fill(Color.blue))
            
            Image(systemName: icon)
                .foregroundColor(.mint)
            
            Text(text)
                .font(.subheadline)
                .foregroundColor(.primary)
        }
    }
    
    // MARK: - Progress
    private var progressSection: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack {
                Image(systemName: "chart.bar.fill")
                    .foregroundColor(.mint)
                    .font(.title2)
                
                Text("Tu Progreso")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .foregroundColor(.primary)
            }
            
            HStack(spacing: 20) {
                statCard(
                    value: "\(completedScenarios.count)",
                    label: "Completados",
                    icon: "checkmark.circle.fill",
                    color: .green
                )
                
                statCard(
                    value: "\(TV4Data.scenarios.count)",
                    label: "Total",
                    icon: "list.bullet",
                    color: .blue
                )
                
                statCard(
                    value: "\(progressPercentage)%",
                    label: "Progreso",
                    icon: "chart.line.uptrend.xyaxis",
                    color: .orange
                )
            }
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(Color(.systemBackground))
                .shadow(color: Color.black.opacity(0.1), radius: 8, x: 0, y: 2)
        )
    }
    
    private func statCard(value: String, label: String, icon: String, color: Color) -> some View {
        VStack(spacing: 8) {
            Image(systemName: icon)
                .foregroundColor(color)
                .font(.title3)
            
            Text(value)
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.primary)
            
            Text(label)
                .font(.caption)
                .foregroundColor(.secondary)
        }
        .frame(maxWidth: .infinity)
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(color.opacity(0.1))
        )
    }
    
    private var progressPercentage: Int {
        guard !TV4Data.scenarios.isEmpty else { return 0 }
        return Int((Double(completedScenarios.count) / Double(TV4Data.scenarios.count)) * 100)
    }
    
    // MARK: - Scenarios
    private var scenariosSection: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack {
                Image(systemName: "play.circle.fill")
                    .foregroundColor(.purple)
                    .font(.title2)
                
                Text("Escenarios para Practicar")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .foregroundColor(.primary)
            }
            
            ForEach(TV4Data.scenarios) { scenario in
                TV4SimulationCard(
                    scenario: scenario,
                    isCompleted: completedScenarios.contains(scenario.id),
                    onComplete: {
                        completedScenarios.insert(scenario.id)
                    }
                )
            }
        }
    }
}

#Preview {
    NavigationStack {
        TV4View()
    }
}

