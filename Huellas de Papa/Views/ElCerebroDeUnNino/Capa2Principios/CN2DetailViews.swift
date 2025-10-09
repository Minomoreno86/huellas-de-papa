import SwiftUI

/// Vista de detalle para un principio
struct CN2PrincipleDetailView: View {
    let principle: CN2Principle
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 24) {
                    // Header
                    VStack(spacing: 16) {
                        Image(systemName: principle.icon)
                            .font(.system(size: 60))
                            .foregroundColor(colorFromString(principle.color))
                        
                        Text(principle.name)
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(.primary)
                            .multilineTextAlignment(.center)
                        
                        Text(principle.subtitle)
                            .font(.headline)
                            .foregroundColor(colorFromString(principle.color))
                            .multilineTextAlignment(.center)
                    }
                    .frame(maxWidth: .infinity)
                    .padding(.vertical)
                    
                    // Definición
                    VStack(alignment: .leading, spacing: 12) {
                        Label("Definición", systemImage: "book.fill")
                            .font(.headline)
                            .fontWeight(.semibold)
                        
                        Text(principle.definition)
                            .font(.body)
                            .foregroundColor(.primary)
                    }
                    .padding(16)
                    .background(
                        RoundedRectangle(cornerRadius: 12)
                            .fill(Color(.systemBackground))
                    )
                    
                    // Base Neurobiológica
                    VStack(alignment: .leading, spacing: 12) {
                        Label("Base Neurobiológica", systemImage: "brain.head.profile")
                            .font(.headline)
                            .fontWeight(.semibold)
                            .foregroundColor(.primary)
                        
                        Text(principle.neuroBasis)
                            .font(.body)
                            .foregroundColor(.primary)
                    }
                    .padding(16)
                    .background(
                        RoundedRectangle(cornerRadius: 12)
                            .fill(Color.blue.opacity(0.1))
                    )
                    
                    // Key Insight
                    HStack(spacing: 12) {
                        Image(systemName: "lightbulb.fill")
                            .font(.title2)
                            .foregroundColor(.orange)
                        
                        Text(principle.keyInsight)
                            .font(.body)
                            .fontWeight(.semibold)
                            .foregroundColor(.primary)
                    }
                    .padding(16)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(
                        RoundedRectangle(cornerRadius: 12)
                            .fill(Color.orange.opacity(0.1))
                    )
                    
                    // Estrategias Relacionadas
                    VStack(alignment: .leading, spacing: 12) {
                        Label("Estrategias Relacionadas", systemImage: "list.number")
                            .font(.headline)
                            .fontWeight(.semibold)
                        
                        ForEach(principle.relatedStrategies, id: \.self) { strategyNumber in
                            if let strategy = cn1Strategies.first(where: { $0.number == strategyNumber }) {
                                HStack(spacing: 12) {
                                    Text("\(strategyNumber)")
                                        .font(.headline)
                                        .fontWeight(.bold)
                                        .foregroundColor(.white)
                                        .frame(width: 32, height: 32)
                                        .background(Circle().fill(colorFromString(principle.color)))
                                    
                                    VStack(alignment: .leading, spacing: 4) {
                                        Text(strategy.title)
                                            .font(.subheadline)
                                            .fontWeight(.semibold)
                                            .foregroundColor(.primary)
                                        
                                        Text(strategy.shortDescription)
                                            .font(.caption)
                                            .foregroundColor(.secondary)
                                    }
                                }
                                .padding(12)
                                .background(
                                    RoundedRectangle(cornerRadius: 10)
                                        .fill(colorFromString(principle.color).opacity(0.05))
                                )
                            }
                        }
                    }
                    .padding(16)
                    .background(
                        RoundedRectangle(cornerRadius: 12)
                            .fill(Color(.systemBackground))
                    )
                    
                    // Aplicación Práctica
                    VStack(alignment: .leading, spacing: 12) {
                        Label("Aplicación Práctica", systemImage: "hand.raised.fill")
                            .font(.headline)
                            .fontWeight(.semibold)
                            .foregroundColor(.primary)
                        
                        Text(principle.practicalApplication)
                            .font(.body)
                            .foregroundColor(.primary)
                    }
                    .padding(16)
                    .background(
                        RoundedRectangle(cornerRadius: 12)
                            .fill(colorFromString(principle.color).opacity(0.1))
                    )
                    
                    // Llamado a la acción
                    VStack(spacing: 12) {
                        Text("💪 Practica Esta Semana")
                            .font(.headline)
                            .fontWeight(.semibold)
                        
                        Text("Elige una situación donde puedas aplicar este principio. Observa qué pasa en el cerebro de tu hijo y cómo respondes.")
                            .font(.body)
                            .foregroundColor(.secondary)
                            .multilineTextAlignment(.center)
                    }
                    .padding(20)
                    .frame(maxWidth: .infinity)
                    .background(
                        RoundedRectangle(cornerRadius: 16)
                            .fill(
                                LinearGradient(
                                    colors: [colorFromString(principle.color).opacity(0.1), colorFromString(principle.color).opacity(0.05)],
                                    startPoint: .topLeading,
                                    endPoint: .bottomTrailing
                                )
                            )
                    )
                }
                .padding()
            }
            .background(Color(.systemGroupedBackground))
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Cerrar") {
                        dismiss()
                    }
                }
            }
        }
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

/// Vista de detalle para escenario clínico
struct CN2ScenarioDetailView: View {
    let scenario: CN2Scenario
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 24) {
                    // Header
                    VStack(spacing: 16) {
                        Image(systemName: "theatermasks.fill")
                            .font(.system(size: 60))
                            .foregroundColor(.purple)
                        
                        Text(scenario.title)
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(.primary)
                            .multilineTextAlignment(.center)
                        
                        HStack(spacing: 12) {
                            Label(scenario.age, systemImage: "person.fill")
                                .font(.subheadline)
                                .padding(.horizontal, 12)
                                .padding(.vertical, 6)
                                .background(
                                    Capsule()
                                        .fill(Color.purple.opacity(0.2))
                                )
                                .foregroundColor(.purple)
                        }
                    }
                    .frame(maxWidth: .infinity)
                    .padding(.vertical)
                    
                    // Situación
                    VStack(alignment: .leading, spacing: 12) {
                        Label("Situación", systemImage: "exclamationmark.triangle.fill")
                            .font(.headline)
                            .fontWeight(.semibold)
                        
                        Text(scenario.situation)
                            .font(.body)
                            .foregroundColor(.primary)
                    }
                    .padding(16)
                    .background(
                        RoundedRectangle(cornerRadius: 12)
                            .fill(Color(.systemBackground))
                    )
                    
                    // Reacción Incorrecta
                    VStack(alignment: .leading, spacing: 12) {
                        Label("Reacción que NO Integra", systemImage: "xmark.circle.fill")
                            .font(.headline)
                            .fontWeight(.semibold)
                            .foregroundColor(.red)
                        
                        Text(scenario.parentReactionWrong)
                            .font(.body)
                            .foregroundColor(.primary)
                    }
                    .padding(16)
                    .background(
                        RoundedRectangle(cornerRadius: 12)
                            .fill(Color.red.opacity(0.1))
                            .overlay(
                                RoundedRectangle(cornerRadius: 12)
                                    .stroke(Color.red.opacity(0.3), lineWidth: 2)
                            )
                    )
                    
                    // Reacción Correcta
                    VStack(alignment: .leading, spacing: 12) {
                        Label("Reacción que SÍ Integra", systemImage: "checkmark.circle.fill")
                            .font(.headline)
                            .fontWeight(.semibold)
                            .foregroundColor(.green)
                        
                        Text(scenario.parentReactionRight)
                            .font(.body)
                            .foregroundColor(.primary)
                    }
                    .padding(16)
                    .background(
                        RoundedRectangle(cornerRadius: 12)
                            .fill(Color.green.opacity(0.1))
                            .overlay(
                                RoundedRectangle(cornerRadius: 12)
                                    .stroke(Color.green.opacity(0.3), lineWidth: 2)
                            )
                    )
                    
                    // Explicación Cerebral
                    VStack(alignment: .leading, spacing: 12) {
                        Label("¿Qué Pasa en el Cerebro?", systemImage: "brain.head.profile")
                            .font(.headline)
                            .fontWeight(.semibold)
                            .foregroundColor(.blue)
                        
                        Text(scenario.brainExplanation)
                            .font(.body)
                            .foregroundColor(.primary)
                    }
                    .padding(16)
                    .background(
                        RoundedRectangle(cornerRadius: 12)
                            .fill(Color.blue.opacity(0.1))
                    )
                    
                    // Resultado a Largo Plazo
                    VStack(alignment: .leading, spacing: 12) {
                        Label("Resultado a Largo Plazo", systemImage: "chart.line.uptrend.xyaxis")
                            .font(.headline)
                            .fontWeight(.semibold)
                        
                        Text(scenario.outcome)
                            .font(.body)
                            .foregroundColor(.primary)
                    }
                    .padding(16)
                    .background(
                        RoundedRectangle(cornerRadius: 12)
                            .fill(Color.mint.opacity(0.1))
                    )
                    
                    // Principio Aplicado
                    VStack(spacing: 12) {
                        Image(systemName: "star.fill")
                            .font(.title)
                            .foregroundColor(.orange)
                        
                        Text("Principio Aplicado")
                            .font(.headline)
                            .fontWeight(.semibold)
                        
                        Text(scenario.principleApplied)
                            .font(.body)
                            .fontWeight(.medium)
                            .foregroundColor(.primary)
                            .multilineTextAlignment(.center)
                    }
                    .padding(20)
                    .frame(maxWidth: .infinity)
                    .background(
                        RoundedRectangle(cornerRadius: 16)
                            .fill(
                                LinearGradient(
                                    colors: [Color.orange.opacity(0.1), Color.orange.opacity(0.05)],
                                    startPoint: .topLeading,
                                    endPoint: .bottomTrailing
                                )
                            )
                    )
                }
                .padding()
            }
            .background(Color(.systemGroupedBackground))
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Cerrar") {
                        dismiss()
                    }
                }
            }
        }
    }
}

