import SwiftUI

/// Vista de detalle para actividad
struct CN5ActivityDetailView: View {
    let activity: CN5Activity
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 24) {
                    // Header
                    VStack(spacing: 16) {
                        Image(systemName: activity.icon)
                            .font(.system(size: 60))
                            .foregroundColor(colorFromString(activity.color))
                        
                        Text(activity.title)
                            .font(.title)
                            .fontWeight(.bold)
                            .multilineTextAlignment(.center)
                        
                        Text(activity.category)
                            .font(.headline)
                            .foregroundColor(colorFromString(activity.color))
                        
                        HStack(spacing: 16) {
                            CN5InfoBadge(icon: "person.fill", text: activity.ageRange)
                            CN5InfoBadge(icon: "clock.fill", text: activity.duration)
                            CN5InfoBadge(icon: "calendar", text: activity.frequency)
                        }
                    }
                    .frame(maxWidth: .infinity)
                    .padding(.vertical)
                    
                    // Objetivo
                    CN5SectionCard(
                        title: "Objetivo",
                        icon: "target",
                        content: activity.goal,
                        color: colorFromString(activity.color)
                    )
                    
                    // Estrategia
                    HStack(spacing: 12) {
                        Image(systemName: "brain.head.profile")
                            .font(.title2)
                            .foregroundColor(.blue)
                        
                        VStack(alignment: .leading, spacing: 4) {
                            Text("Estrategia #\(activity.strategyUsed)")
                                .font(.subheadline)
                                .fontWeight(.bold)
                                .foregroundColor(.blue)
                            
                            if let strategy = cn1Strategies.first(where: { $0.number == activity.strategyUsed }) {
                                Text(strategy.title)
                                    .font(.caption)
                                    .foregroundColor(.secondary)
                            }
                        }
                        
                        Spacer()
                    }
                    .padding(16)
                    .background(
                        RoundedRectangle(cornerRadius: 12)
                            .fill(Color.blue.opacity(0.1))
                    )
                    
                    // Materiales
                    if !activity.materials.isEmpty {
                        VStack(alignment: .leading, spacing: 12) {
                            Label("Materiales", systemImage: "basket.fill")
                                .font(.headline)
                                .fontWeight(.semibold)
                            
                            ForEach(activity.materials, id: \.self) { material in
                                HStack(spacing: 8) {
                                    Image(systemName: "checkmark.circle.fill")
                                        .foregroundColor(.green)
                                    Text(material)
                                        .font(.body)
                                }
                            }
                        }
                        .padding(16)
                        .background(
                            RoundedRectangle(cornerRadius: 12)
                                .fill(Color.green.opacity(0.1))
                        )
                    }
                    
                    // Pasos
                    VStack(alignment: .leading, spacing: 16) {
                        Label("Paso a Paso", systemImage: "list.number")
                            .font(.headline)
                            .fontWeight(.semibold)
                        
                        ForEach(Array(activity.steps.enumerated()), id: \.offset) { index, step in
                            HStack(alignment: .top, spacing: 12) {
                                Text("\(index + 1)")
                                    .font(.headline)
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                                    .frame(width: 32, height: 32)
                                    .background(Circle().fill(colorFromString(activity.color)))
                                
                                Text(step)
                                    .font(.body)
                                    .fixedSize(horizontal: false, vertical: true)
                            }
                        }
                    }
                    .padding(16)
                    .background(
                        RoundedRectangle(cornerRadius: 12)
                            .fill(Color(.systemBackground))
                    )
                    
                    // Tips
                    VStack(alignment: .leading, spacing: 12) {
                        Label("Tips de Implementación", systemImage: "lightbulb.fill")
                            .font(.headline)
                            .fontWeight(.semibold)
                        
                        ForEach(activity.tips, id: \.self) { tip in
                            HStack(alignment: .top, spacing: 8) {
                                Image(systemName: "star.fill")
                                    .foregroundColor(.orange)
                                Text(tip)
                                    .font(.body)
                            }
                        }
                    }
                    .padding(16)
                    .background(
                        RoundedRectangle(cornerRadius: 12)
                            .fill(Color.orange.opacity(0.1))
                    )
                    
                    // Success Indicators
                    VStack(alignment: .leading, spacing: 12) {
                        Label("Señales de Éxito", systemImage: "checkmark.seal.fill")
                            .font(.headline)
                            .fontWeight(.semibold)
                            .foregroundColor(.green)
                        
                        ForEach(activity.successIndicators, id: \.self) { indicator in
                            HStack(alignment: .top, spacing: 8) {
                                Image(systemName: "arrow.up.circle.fill")
                                    .foregroundColor(.green)
                                Text(indicator)
                                    .font(.body)
                            }
                        }
                    }
                    .padding(16)
                    .background(
                        RoundedRectangle(cornerRadius: 12)
                            .fill(Color.green.opacity(0.1))
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
        case "orange": return .orange
        case "blue": return .blue
        case "purple": return .purple
        case "teal": return .teal
        case "mint": return .mint
        case "pink": return .pink
        case "yellow": return .yellow
        case "indigo": return .indigo
        default: return .blue
        }
    }
}

// MARK: - Helper Component
struct CN5InfoBadge: View {
    let icon: String
    let text: String
    
    var body: some View {
        Label(text, systemImage: icon)
            .font(.subheadline)
            .padding(.horizontal, 12)
            .padding(.vertical, 6)
            .background(
                Capsule()
                    .fill(Color.blue.opacity(0.1))
            )
            .foregroundColor(.blue)
    }
}

struct CN5SectionCard: View {
    let title: String
    let icon: String
    let content: String
    let color: Color
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Label(title, systemImage: icon)
                .font(.headline)
                .fontWeight(.semibold)
                .foregroundColor(color)
            
            Text(content)
                .font(.body)
                .foregroundColor(.primary)
        }
        .padding(16)
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(color.opacity(0.1))
        )
    }
}

/// Vista de detalle para rutina
struct CN5RoutineDetailView: View {
    let routine: CN5Routine
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 24) {
                    // Header
                    VStack(spacing: 16) {
                        Image(systemName: routine.icon)
                            .font(.system(size: 60))
                            .foregroundColor(colorFromString(routine.color))
                        
                        Text(routine.title)
                            .font(.title)
                            .fontWeight(.bold)
                            .multilineTextAlignment(.center)
                        
                        Text(routine.timeOfDay)
                            .font(.headline)
                            .foregroundColor(colorFromString(routine.color))
                            .padding(.horizontal, 12)
                            .padding(.vertical, 6)
                            .background(
                                Capsule()
                                    .fill(colorFromString(routine.color).opacity(0.2))
                            )
                    }
                    .frame(maxWidth: .infinity)
                    .padding(.vertical)
                    
                    // Descripción
                    Text(routine.description)
                        .font(.body)
                        .foregroundColor(.secondary)
                        .padding(16)
                        .background(
                            RoundedRectangle(cornerRadius: 12)
                                .fill(Color(.systemBackground))
                        )
                    
                    // Estrategias integradas
                    VStack(alignment: .leading, spacing: 12) {
                        Label("Estrategias Integradas", systemImage: "brain.head.profile")
                            .font(.headline)
                            .fontWeight(.semibold)
                        
                        HStack(spacing: 8) {
                            ForEach(routine.strategiesIntegrated, id: \.self) { strategy in
                                if let strategyData = cn1Strategies.first(where: { $0.number == strategy }) {
                                    VStack(alignment: .leading, spacing: 4) {
                                        Text("#\(strategy)")
                                            .font(.caption)
                                            .fontWeight(.bold)
                                            .foregroundColor(.blue)
                                        Text(strategyData.title)
                                            .font(.caption2)
                                            .foregroundColor(.secondary)
                                            .lineLimit(2)
                                    }
                                    .padding(8)
                                    .background(
                                        RoundedRectangle(cornerRadius: 8)
                                            .fill(Color.blue.opacity(0.1))
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
                    
                    // Pasos
                    VStack(alignment: .leading, spacing: 12) {
                        Label("Cronograma Paso a Paso", systemImage: "list.number")
                            .font(.headline)
                            .fontWeight(.semibold)
                        
                        VStack(alignment: .leading, spacing: 8) {
                            ForEach(routine.steps, id: \.self) { step in
                                HStack(alignment: .top, spacing: 8) {
                                    Image(systemName: "clock.fill")
                                        .foregroundColor(colorFromString(routine.color))
                                        .font(.caption)
                                    
                                    Text(step)
                                        .font(.body)
                                        .fixedSize(horizontal: false, vertical: true)
                                }
                                .padding(.vertical, 4)
                            }
                        }
                    }
                    .padding(16)
                    .background(
                        RoundedRectangle(cornerRadius: 12)
                            .fill(colorFromString(routine.color).opacity(0.1))
                    )
                    
                    // Beneficios cerebrales
                    CN5SectionCard(
                        title: "Beneficios Cerebrales",
                        icon: "brain.head.profile",
                        content: routine.brainBenefits,
                        color: .purple
                    )
                    
                    // Desafíos y Soluciones
                    VStack(alignment: .leading, spacing: 16) {
                        Label("Desafíos Comunes y Soluciones", systemImage: "wrench.and.screwdriver.fill")
                            .font(.headline)
                            .fontWeight(.semibold)
                        
                        ForEach(Array(zip(routine.commonChallenges, routine.solutions)), id: \.0) { challenge, solution in
                            VStack(alignment: .leading, spacing: 8) {
                                HStack(spacing: 8) {
                                    Image(systemName: "exclamationmark.triangle.fill")
                                        .foregroundColor(.orange)
                                    Text(challenge)
                                        .font(.subheadline)
                                        .fontWeight(.semibold)
                                        .italic()
                                }
                                
                                HStack(alignment: .top, spacing: 8) {
                                    Image(systemName: "lightbulb.fill")
                                        .foregroundColor(.green)
                                    Text(solution)
                                        .font(.body)
                                        .foregroundColor(.primary)
                                }
                                .padding(.leading, 8)
                            }
                            .padding(12)
                            .background(
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(Color.orange.opacity(0.05))
                            )
                        }
                    }
                    .padding(16)
                    .background(
                        RoundedRectangle(cornerRadius: 12)
                            .fill(Color(.systemBackground))
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
        case "orange": return .orange
        case "blue": return .blue
        case "purple": return .purple
        case "teal": return .teal
        case "mint": return .mint
        default: return .blue
        }
    }
}

