import SwiftUI

/// Vista principal de la Capa 2 (Principios) del módulo El Cerebro del Niño
/// Enseña los 4 principios de integración cerebral de Daniel Siegel
struct CN2View: View {
    @State private var selectedPrinciple: CN2Principle?
    @State private var showingPrincipleDetail = false
    @State private var selectedScenario: CN2Scenario?
    @State private var showingScenarioDetail = false
    
    var body: some View {
        ScrollView {
            VStack(spacing: 32) {
                // 1. Header
                headerSection
                
                // 2. Los 4 Principios
                principlesSection
                
                // 3. Escenarios Clínicos
                scenariosSection
                
                // 4. Quote Final
                quoteSection
            }
            .padding()
        }
        .background(Color(.systemGroupedBackground))
        .navigationTitle("Principios")
        .navigationBarTitleDisplayMode(.large)
        .sheet(isPresented: $showingPrincipleDetail) {
            if let principle = selectedPrinciple {
                CN2PrincipleDetailView(principle: principle)
            }
        }
        .sheet(isPresented: $showingScenarioDetail) {
            if let scenario = selectedScenario {
                CN2ScenarioDetailView(scenario: scenario)
            }
        }
    }
    
    // MARK: - 1. Header Section
    private var headerSection: some View {
        VStack(spacing: 16) {
            Text("Los 4 Principios de Integración")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundStyle(
                    LinearGradient(
                        gradient: Gradient(colors: [.blue, .mint]),
                        startPoint: .leading,
                        endPoint: .trailing
                    )
                )
            
            Text("Cómo ayudar a tu hijo a desarrollar un cerebro integrado y equilibrado")
                .font(.title3)
                .fontWeight(.medium)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
            
            Text("Neurociencia aplicada • Casos reales • Transformación familiar")
                .font(.subheadline)
                .foregroundColor(.blue)
                .multilineTextAlignment(.center)
                .italic()
        }
        .padding(.vertical)
    }
    
    // MARK: - 2. Principles Section
    private var principlesSection: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack {
                Text("Principios Fundamentales")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .foregroundColor(.primary)
                
                Spacer()
                
                Text("\(cn2Principles.count)")
                    .font(.caption)
                    .fontWeight(.bold)
                    .padding(.horizontal, 10)
                    .padding(.vertical, 4)
                    .background(
                        Circle()
                            .fill(Color.blue.opacity(0.2))
                    )
                    .foregroundColor(.blue)
            }
            
            Text("Cada principio agrupa estrategias relacionadas bajo un tema neuropsicológico")
                .font(.subheadline)
                .foregroundColor(.secondary)
            
            VStack(spacing: 16) {
                ForEach(cn2Principles) { principle in
                    CN2PrincipleCard(principle: principle)
                        .onTapGesture {
                            selectedPrinciple = principle
                            showingPrincipleDetail = true
                            triggerHaptic()
                        }
                }
            }
        }
    }
    
    // MARK: - 3. Scenarios Section
    private var scenariosSection: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Escenarios Clínicos")
                .font(.title2)
                .fontWeight(.semibold)
                .foregroundColor(.primary)
            
            Text("Casos reales que ilustran los principios en acción")
                .font(.subheadline)
                .foregroundColor(.secondary)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 16) {
                    ForEach(cn2Scenarios) { scenario in
                        CN2ScenarioCard(scenario: scenario)
                            .onTapGesture {
                                selectedScenario = scenario
                                showingScenarioDetail = true
                                triggerHaptic()
                            }
                    }
                }
                .padding(.horizontal, 4)
            }
        }
    }
    
    // MARK: - 4. Quote Section
    private var quoteSection: some View {
        VStack(spacing: 20) {
            Text("💡 Recordatorio Clave")
                .font(.headline)
                .fontWeight(.semibold)
                .foregroundColor(.primary)
            
            if let quote = cn2Quotes.first {
                VStack(spacing: 12) {
                    Text("\"" + quote.text + "\"")
                        .font(.title3)
                        .fontWeight(.medium)
                        .foregroundColor(.primary)
                        .multilineTextAlignment(.center)
                        .italic()
                    
                    Text("— \(quote.author)")
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
                                    Color.blue.opacity(0.1),
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
                                            Color.blue.opacity(0.3),
                                            Color.mint.opacity(0.2)
                                        ]),
                                        startPoint: .topLeading,
                                        endPoint: .bottomTrailing
                                    ),
                                    lineWidth: 1
                                )
                        )
                )
                .shadow(
                    color: Color.blue.opacity(0.1),
                    radius: 8,
                    x: 0,
                    y: 4
                )
            }
        }
        .padding(.bottom, 32)
    }
    
    // MARK: - Haptic Feedback
    private func triggerHaptic() {
        let impactFeedback = UIImpactFeedbackGenerator(style: .light)
        impactFeedback.impactOccurred()
    }
}

// MARK: - Supporting Views

/// Tarjeta para principio
struct CN2PrincipleCard: View {
    let principle: CN2Principle
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                Image(systemName: principle.icon)
                    .font(.system(size: 32))
                    .foregroundColor(colorFromString(principle.color))
                
                Spacer()
                
                // Badge con número de estrategias relacionadas
                VStack(spacing: 2) {
                    Text("\(principle.relatedStrategies.count)")
                        .font(.headline)
                        .fontWeight(.bold)
                    Text("estrategias")
                        .font(.caption2)
                }
                .foregroundColor(colorFromString(principle.color))
            }
            
            Text(principle.name)
                .font(.title3)
                .fontWeight(.bold)
                .foregroundColor(.primary)
            
            Text(principle.subtitle)
                .font(.subheadline)
                .foregroundColor(colorFromString(principle.color))
                .fontWeight(.medium)
            
            Text(principle.definition)
                .font(.caption)
                .foregroundColor(.secondary)
                .lineLimit(3)
            
            Divider()
            
            HStack(spacing: 8) {
                Image(systemName: "lightbulb.fill")
                    .foregroundColor(.orange)
                    .font(.caption)
                
                Text(principle.keyInsight)
                    .font(.caption)
                    .fontWeight(.semibold)
                    .foregroundColor(.orange)
                    .lineLimit(2)
            }
            
            HStack {
                Text("Toca para ver más")
                    .font(.caption2)
                    .foregroundColor(.secondary)
                    .italic()
                
                Spacer()
                
                Image(systemName: "chevron.right.circle.fill")
                    .foregroundColor(.blue.opacity(0.3))
            }
        }
        .padding(16)
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(Color(.systemBackground))
                .overlay(
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(colorFromString(principle.color).opacity(0.3), lineWidth: 2)
                )
                .shadow(color: Color.black.opacity(0.08), radius: 12, x: 0, y: 4)
        )
    }
    
    private func colorFromString(_ colorName: String) -> Color {
        switch colorName {
        case "blue": return .blue
        case "purple": return .purple
        case "mint": return .mint
        case "orange": return .orange
        case "green": return .green
        default: return .blue
        }
    }
}

/// Tarjeta compacta para escenario clínico
struct CN2ScenarioCard: View {
    let scenario: CN2Scenario
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                Image(systemName: "theatermasks.fill")
                    .font(.title2)
                    .foregroundColor(.purple)
                
                Spacer()
                
                Text(scenario.age)
                    .font(.caption)
                    .padding(.horizontal, 8)
                    .padding(.vertical, 4)
                    .background(
                        Capsule()
                            .fill(Color.purple.opacity(0.2))
                    )
                    .foregroundColor(.purple)
            }
            
            Text(scenario.title)
                .font(.headline)
                .fontWeight(.bold)
                .foregroundColor(.primary)
            
            Text(scenario.situation)
                .font(.caption)
                .foregroundColor(.secondary)
                .lineLimit(4)
            
            Divider()
            
            HStack {
                Image(systemName: "brain.head.profile")
                    .foregroundColor(.blue)
                    .font(.caption)
                
                Text(scenario.principleApplied)
                    .font(.caption)
                    .fontWeight(.medium)
                    .foregroundColor(.blue)
                    .lineLimit(2)
            }
        }
        .padding(16)
        .frame(width: 280, height: 240)
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(Color(.systemBackground))
                .shadow(color: Color.black.opacity(0.05), radius: 8, x: 0, y: 2)
        )
    }
}

// MARK: - Preview
struct CN2View_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            CN2View()
        }
    }
}

