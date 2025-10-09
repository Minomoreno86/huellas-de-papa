import SwiftUI

/// Vista de detalle para semana de entrenamiento
struct CN6WeekDetailView: View {
    let week: CN6TrainingWeek
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 24) {
                    // Header
                    VStack(spacing: 16) {
                        Text("Semana \(week.weekNumber)")
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(colorFromString(week.color))
                        
                        Text("Estrategia #\(week.strategyNumber)")
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                        
                        Text(week.strategyName)
                            .font(.title2)
                            .fontWeight(.bold)
                            .multilineTextAlignment(.center)
                        
                        Image(systemName: week.icon)
                            .font(.system(size: 50))
                            .foregroundColor(colorFromString(week.color))
                    }
                    .frame(maxWidth: .infinity)
                    .padding(.vertical)
                    
                    // Focus
                    VStack(alignment: .leading, spacing: 12) {
                        Label("Enfoque de la Semana", systemImage: "target")
                            .font(.headline)
                            .fontWeight(.semibold)
                            .foregroundColor(colorFromString(week.color))
                        
                        Text(week.focus)
                            .font(.body)
                    }
                    .padding(16)
                    .background(
                        RoundedRectangle(cornerRadius: 12)
                            .fill(colorFromString(week.color).opacity(0.1))
                    )
                    
                    // Daily Challenges
                    VStack(alignment: .leading, spacing: 12) {
                        Label("Retos Diarios", systemImage: "calendar.badge.checkmark")
                            .font(.headline)
                            .fontWeight(.semibold)
                        
                        ForEach(Array(week.dailyChallenges.enumerated()), id: \.offset) { index, challenge in
                            HStack(alignment: .top, spacing: 12) {
                                Image(systemName: dayIcon(for: index))
                                    .foregroundColor(colorFromString(week.color))
                                    .font(.title3)
                                    .frame(width: 30)
                                
                                Text(challenge)
                                    .font(.body)
                                    .fixedSize(horizontal: false, vertical: true)
                            }
                            .padding(12)
                            .background(
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(Color(.systemBackground))
                            )
                        }
                    }
                    .padding(16)
                    .background(
                        RoundedRectangle(cornerRadius: 12)
                            .fill(Color(.systemBackground))
                    )
                    
                    // Practice Scenarios
                    VStack(alignment: .leading, spacing: 12) {
                        Label("Dónde Practicar", systemImage: "location.fill")
                            .font(.headline)
                            .fontWeight(.semibold)
                        
                        ForEach(week.practiceScenarios, id: \.self) { scenario in
                            HStack(spacing: 8) {
                                Image(systemName: "checkmark.circle.fill")
                                    .foregroundColor(.green)
                                Text(scenario)
                                    .font(.body)
                            }
                        }
                    }
                    .padding(16)
                    .background(
                        RoundedRectangle(cornerRadius: 12)
                            .fill(Color.green.opacity(0.1))
                    )
                    
                    // Observation Questions
                    VStack(alignment: .leading, spacing: 12) {
                        Label("Qué Observar", systemImage: "eye.fill")
                            .font(.headline)
                            .fontWeight(.semibold)
                            .foregroundColor(.blue)
                        
                        ForEach(week.observationQuestions, id: \.self) { question in
                            HStack(alignment: .top, spacing: 8) {
                                Image(systemName: "questionmark.circle.fill")
                                    .foregroundColor(.blue)
                                Text(question)
                                    .font(.body)
                            }
                        }
                    }
                    .padding(16)
                    .background(
                        RoundedRectangle(cornerRadius: 12)
                            .fill(Color.blue.opacity(0.1))
                    )
                    
                    // Success Indicators
                    VStack(alignment: .leading, spacing: 12) {
                        Label("Señales de Éxito", systemImage: "star.fill")
                            .font(.headline)
                            .fontWeight(.semibold)
                            .foregroundColor(.orange)
                        
                        ForEach(week.successIndicators, id: \.self) { indicator in
                            HStack(alignment: .top, spacing: 8) {
                                Image(systemName: "arrow.up.circle.fill")
                                    .foregroundColor(.orange)
                                Text(indicator)
                                    .font(.body)
                            }
                        }
                    }
                    .padding(16)
                    .background(
                        RoundedRectangle(cornerRadius: 12)
                            .fill(Color.orange.opacity(0.1))
                    )
                    
                    // Common Mistakes
                    VStack(alignment: .leading, spacing: 12) {
                        Label("Errores Comunes a Evitar", systemImage: "exclamationmark.triangle.fill")
                            .font(.headline)
                            .fontWeight(.semibold)
                            .foregroundColor(.red)
                        
                        ForEach(week.commonMistakes, id: \.self) { mistake in
                            HStack(alignment: .top, spacing: 8) {
                                Image(systemName: "xmark.circle.fill")
                                    .foregroundColor(.red)
                                Text(mistake)
                                    .font(.body)
                            }
                        }
                    }
                    .padding(16)
                    .background(
                        RoundedRectangle(cornerRadius: 12)
                            .fill(Color.red.opacity(0.1))
                    )
                    
                    // Weekly Reflection
                    VStack(alignment: .leading, spacing: 12) {
                        Label("Reflexión de Fin de Semana", systemImage: "lightbulb.fill")
                            .font(.headline)
                            .fontWeight(.semibold)
                            .foregroundColor(.purple)
                        
                        Text(week.weeklyReflection)
                            .font(.body)
                            .italic()
                    }
                    .padding(16)
                    .background(
                        RoundedRectangle(cornerRadius: 12)
                            .fill(Color.purple.opacity(0.1))
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
    
    private func dayIcon(for index: Int) -> String {
        let days = ["1.circle.fill", "2.circle.fill", "3.circle.fill", "4.circle.fill", "5.circle.fill", "6.circle.fill", "7.circle.fill"]
        return days[index]
    }
    
    private func colorFromString(_ colorName: String) -> Color {
        switch colorName {
        case "pink": return .pink
        case "blue": return .blue
        case "purple": return .purple
        case "indigo": return .indigo
        case "green": return .green
        case "teal": return .teal
        case "cyan": return .cyan
        case "yellow": return .yellow
        default: return .blue
        }
    }
}

/// Vista de detalle para etapa de edad
struct CN6AgeStageDetailView: View {
    let ageStage: CN6AgeStage
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 24) {
                    // Header
                    VStack(spacing: 16) {
                        Image(systemName: ageStage.icon)
                            .font(.system(size: 60))
                            .foregroundColor(colorFromString(ageStage.color))
                        
                        Text(ageStage.ageRange)
                            .font(.title)
                            .fontWeight(.bold)
                        
                        Text(ageStage.stageName)
                            .font(.headline)
                            .foregroundColor(colorFromString(ageStage.color))
                            .multilineTextAlignment(.center)
                    }
                    .frame(maxWidth: .infinity)
                    .padding(.vertical)
                    
                    // Brain Development
                    VStack(alignment: .leading, spacing: 12) {
                        Label("Desarrollo Cerebral", systemImage: "brain.head.profile")
                            .font(.headline)
                            .fontWeight(.semibold)
                            .foregroundColor(.blue)
                        
                        Text(ageStage.brainDevelopment)
                            .font(.body)
                    }
                    .padding(16)
                    .background(
                        RoundedRectangle(cornerRadius: 12)
                            .fill(Color.blue.opacity(0.1))
                    )
                    
                    // Capabilities
                    VStack(alignment: .leading, spacing: 12) {
                        Label("Qué PUEDE Hacer", systemImage: "checkmark.seal.fill")
                            .font(.headline)
                            .fontWeight(.semibold)
                            .foregroundColor(.green)
                        
                        ForEach(ageStage.capabilities, id: \.self) { capability in
                            HStack(alignment: .top, spacing: 8) {
                                Image(systemName: "checkmark.circle.fill")
                                    .foregroundColor(.green)
                                Text(capability)
                                    .font(.body)
                            }
                        }
                    }
                    .padding(16)
                    .background(
                        RoundedRectangle(cornerRadius: 12)
                            .fill(Color.green.opacity(0.1))
                    )
                    
                    // Limitations
                    VStack(alignment: .leading, spacing: 12) {
                        Label("Qué NO Puede Hacer Aún", systemImage: "exclamationmark.triangle.fill")
                            .font(.headline)
                            .fontWeight(.semibold)
                            .foregroundColor(.red)
                        
                        ForEach(ageStage.limitations, id: \.self) { limitation in
                            HStack(alignment: .top, spacing: 8) {
                                Image(systemName: "xmark.circle.fill")
                                    .foregroundColor(.red)
                                Text(limitation)
                                    .font(.body)
                            }
                        }
                    }
                    .padding(16)
                    .background(
                        RoundedRectangle(cornerRadius: 12)
                            .fill(Color.red.opacity(0.1))
                    )
                    
                    // Recommended Strategies
                    VStack(alignment: .leading, spacing: 12) {
                        Label("Estrategias Recomendadas", systemImage: "star.circle.fill")
                            .font(.headline)
                            .fontWeight(.semibold)
                            .foregroundColor(.purple)
                        
                        HStack(spacing: 8) {
                            ForEach(ageStage.strategiesRecommended, id: \.self) { strategy in
                                if let strategyData = cn1Strategies.first(where: { $0.number == strategy }) {
                                    VStack(spacing: 4) {
                                        Text("#\(strategy)")
                                            .font(.caption)
                                            .fontWeight(.bold)
                                            .foregroundColor(.purple)
                                        Text(strategyData.title)
                                            .font(.caption2)
                                            .foregroundColor(.secondary)
                                            .lineLimit(2)
                                            .multilineTextAlignment(.center)
                                    }
                                    .padding(8)
                                    .background(
                                        RoundedRectangle(cornerRadius: 8)
                                            .fill(Color.purple.opacity(0.1))
                                    )
                                }
                            }
                        }
                    }
                    .padding(16)
                    .background(
                        RoundedRectangle(cornerRadius: 12)
                            .fill(Color(.systemBackground))
                    )
                    
                    // Realistic Expectations
                    VStack(alignment: .leading, spacing: 12) {
                        Label("Expectativas Realistas", systemImage: "list.bullet.clipboard.fill")
                            .font(.headline)
                            .fontWeight(.semibold)
                            .foregroundColor(.orange)
                        
                        Text(ageStage.realisticExpectations)
                            .font(.body)
                    }
                    .padding(16)
                    .background(
                        RoundedRectangle(cornerRadius: 12)
                            .fill(Color.orange.opacity(0.1))
                    )
                    
                    // Parental Support
                    VStack(alignment: .leading, spacing: 12) {
                        Label("Cómo Apoyar", systemImage: "hands.and.sparkles.fill")
                            .font(.headline)
                            .fontWeight(.semibold)
                            .foregroundColor(.mint)
                        
                        Text(ageStage.parentalSupport)
                            .font(.body)
                    }
                    .padding(16)
                    .background(
                        RoundedRectangle(cornerRadius: 12)
                            .fill(Color.mint.opacity(0.1))
                    )
                    
                    // Red Flags
                    VStack(alignment: .leading, spacing: 12) {
                        Label("Señales de Alerta", systemImage: "exclamationmark.octagon.fill")
                            .font(.headline)
                            .fontWeight(.semibold)
                            .foregroundColor(.red)
                        
                        Text(ageStage.redFlags)
                            .font(.body)
                    }
                    .padding(16)
                    .background(
                        RoundedRectangle(cornerRadius: 12)
                            .fill(Color.red.opacity(0.1))
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
        case "pink": return .pink
        case "orange": return .orange
        case "blue": return .blue
        case "teal": return .teal
        case "purple": return .purple
        case "mint": return .mint
        default: return .blue
        }
    }
}

