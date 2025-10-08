import SwiftUI
import SwiftData

/// Vista de insights automáticos basados en patrones detectados
struct TV6InsightsView: View {
    @Query(sort: \TV6VolcanoLog.date, order: .reverse) private var volcanoLogs: [TV6VolcanoLog]
    @Query(sort: \TV6DailyCheck.date, order: .reverse) private var dailyChecks: [TV6DailyCheck]
    
    var body: some View {
        VStack(spacing: 12) {
            if insights.isEmpty {
                emptyInsights
            } else {
                ForEach(insights) { insight in
                    insightCard(insight)
                }
            }
        }
    }
    
    private var emptyInsights: some View {
        VStack(spacing: 12) {
            Image(systemName: "lightbulb")
                .font(.title)
                .foregroundColor(.secondary)
            
            Text("Registra volcanes para recibir insights personalizados")
                .font(.caption)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
        }
        .frame(maxWidth: .infinity)
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(Color(.systemBackground))
        )
    }
    
    private func insightCard(_ insight: TV6Data.InsightPattern) -> some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                Image(systemName: insight.iconName)
                    .foregroundColor(insightColor(insight.color))
                    .font(.title3)
                
                Text("Patrón Detectado")
                    .font(.caption)
                    .fontWeight(.semibold)
                    .foregroundColor(insightColor(insight.color))
                    .padding(.horizontal, 8)
                    .padding(.vertical, 4)
                    .background(
                        Capsule()
                            .fill(insightColor(insight.color).opacity(0.1))
                    )
            }
            
            Text(insight.pattern)
                .font(.headline)
                .foregroundColor(.primary)
            
            Text(insight.suggestion)
                .font(.body)
                .foregroundColor(.secondary)
                .fixedSize(horizontal: false, vertical: true)
            
            Divider()
            
            HStack {
                Image(systemName: "arrow.right.circle.fill")
                    .foregroundColor(.mint)
                
                Text("Ir a: \(insight.relatedCapa)")
                    .font(.caption)
                    .foregroundColor(.mint)
                    .fontWeight(.semibold)
            }
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(Color(.systemBackground))
                .overlay(
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(insightColor(insight.color).opacity(0.3), lineWidth: 2)
                )
        )
    }
    
    private func insightColor(_ colorName: String) -> Color {
        switch colorName {
        case "blue": return .blue
        case "orange": return .orange
        case "purple": return .purple
        case "red": return .red
        case "green": return .green
        default: return .blue
        }
    }
    
    // MARK: - Computed Insights
    private var insights: [TV6Data.InsightPattern] {
        var detectedInsights: [TV6Data.InsightPattern] = []
        
        // Insight 1: Botón frecuente
        if let mostFrequentButton = mostFrequentTrigger, mostFrequentButton.count >= 3 {
            if mostFrequentButton.button.contains("Frustración") {
                detectedInsights.append(TV6Data.insightPatterns[3]) // Frustración
            }
        }
        
        // Insight 2: Básicas bajas
        if let weekChecks = thisWeekDailyChecks, !weekChecks.isEmpty {
            let avgCompliance = weekChecks.reduce(0.0) { $0 + $1.compliancePercentage } / Double(weekChecks.count)
            if avgCompliance < 0.5 {
                detectedInsights.append(TV6Data.insightPatterns[5]) // 6 básicas
            }
        }
        
        // Insight 3: Pocas herramientas
        let withTools = volcanoLogs.filter { $0.toolUsed != nil }.count
        if !volcanoLogs.isEmpty && Double(withTools) / Double(volcanoLogs.count) < 0.3 {
            detectedInsights.append(TV6Data.insightPatterns[4]) // Herramientas
        }
        
        return detectedInsights
    }
    
    private var mostFrequentTrigger: (button: String, count: Int)? {
        let grouped = Dictionary(grouping: volcanoLogs, by: { $0.triggerButton })
        return grouped.map { (button: $0.key, count: $0.value.count) }
            .sorted { $0.count > $1.count }
            .first
    }
    
    private var thisWeekDailyChecks: [TV6DailyCheck]? {
        let calendar = Calendar.current
        let weekAgo = calendar.date(byAdding: .day, value: -7, to: Date())!
        let checks = dailyChecks.filter { $0.date >= weekAgo }
        return checks.isEmpty ? nil : checks
    }
}

#Preview {
    ScrollView {
        TV6InsightsView()
            .padding()
            .modelContainer(for: [TV6VolcanoLog.self, TV6DailyCheck.self], inMemory: true)
    }
    .background(Color(.systemGroupedBackground))
}

