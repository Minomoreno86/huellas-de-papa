import SwiftUI
import SwiftData
import Charts

/// Vista de estadísticas completas del seguimiento
struct TV6StatsView: View {
    @Query(sort: \TV6VolcanoLog.date, order: .reverse) private var volcanoLogs: [TV6VolcanoLog]
    @Query(sort: \TV6DailyCheck.date, order: .reverse) private var dailyChecks: [TV6DailyCheck]
    
    var body: some View {
        ScrollView {
            VStack(spacing: 32) {
                // 1. Resumen general
                summarySection
                
                // 2. Volcanes por fase
                phaseDistributionSection
                
                // 3. Botones más frecuentes
                triggerDistributionSection
                
                // 4. Herramientas usadas
                toolsUsageSection
                
                // 5. Cumplimiento de las 6 básicas
                basicsComplianceSection
            }
            .padding()
        }
        .navigationTitle("Estadísticas")
        .navigationBarTitleDisplayMode(.large)
        .background(Color(.systemGroupedBackground))
    }
    
    // MARK: - Summary
    private var summarySection: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Resumen General")
                .font(.title2)
                .fontWeight(.semibold)
            
            LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 12) {
                summaryCard("Total Volcanes", value: "\(volcanoLogs.count)", icon: "flame.fill", color: .orange)
                summaryCard("Días Seguimiento", value: "\(trackingDays)", icon: "calendar", color: .blue)
                summaryCard("Con Herramientas", value: "\(Int(toolUsageRate * 100))%", icon: "wrench.fill", color: .green)
                summaryCard("6 Básicas", value: "\(Int(basicsComplianceRate * 100))%", icon: "leaf.fill", color: .mint)
            }
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(Color(.systemBackground))
                .shadow(color: Color.black.opacity(0.1), radius: 8, x: 0, y: 2)
        )
    }
    
    private func summaryCard(_ label: String, value: String, icon: String, color: Color) -> some View {
        VStack(spacing: 8) {
            Image(systemName: icon)
                .foregroundColor(color)
                .font(.title2)
            
            Text(value)
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.primary)
            
            Text(label)
                .font(.caption)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
        }
        .frame(maxWidth: .infinity)
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(color.opacity(0.1))
        )
    }
    
    // MARK: - Phase Distribution
    private var phaseDistributionSection: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Volcanes por Fase")
                .font(.title2)
                .fontWeight(.semibold)
            
            ForEach(phaseStats, id: \.phase) { stat in
                phaseRow(stat.phase, count: stat.count, total: volcanoLogs.count)
            }
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(Color(.systemBackground))
                .shadow(color: Color.black.opacity(0.1), radius: 8, x: 0, y: 2)
        )
    }
    
    private func phaseRow(_ phase: String, count: Int, total: Int) -> some View {
        VStack(spacing: 8) {
            HStack {
                phaseLabel(phase)
                
                Spacer()
                
                Text("\(count)")
                    .font(.headline)
                    .foregroundColor(.primary)
            }
            
            GeometryReader { geometry in
                ZStack(alignment: .leading) {
                    RoundedRectangle(cornerRadius: 4)
                        .fill(Color.gray.opacity(0.2))
                        .frame(height: 8)
                    
                    RoundedRectangle(cornerRadius: 4)
                        .fill(phaseColor(phase))
                        .frame(width: geometry.size.width * percentage(count, total), height: 8)
                }
            }
            .frame(height: 8)
        }
        .frame(height: 50)
    }
    
    private func phaseLabel(_ phase: String) -> some View {
        HStack {
            if phase.contains("Chispa") {
                Image(systemName: "flame.fill")
                    .foregroundColor(.orange)
            } else if phase.contains("Burbujeo") {
                Image(systemName: "smoke.fill")
                    .foregroundColor(.red)
            } else {
                Image(systemName: "tornado")
                    .foregroundColor(.purple)
            }
            
            Text(phase)
                .font(.subheadline)
                .foregroundColor(.primary)
        }
    }
    
    private func phaseColor(_ phase: String) -> Color {
        if phase.contains("Chispa") { return .orange }
        if phase.contains("Burbujeo") { return .red }
        return .purple
    }
    
    // MARK: - Trigger Distribution
    private var triggerDistributionSection: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Botones Más Frecuentes")
                .font(.title2)
                .fontWeight(.semibold)
            
            ForEach(triggerStats, id: \.button) { stat in
                HStack {
                    Text(stat.button)
                        .font(.subheadline)
                        .foregroundColor(.primary)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    Text("\(stat.count)")
                        .font(.headline)
                        .foregroundColor(.red)
                        .padding(.horizontal, 12)
                        .padding(.vertical, 6)
                        .background(
                            Capsule()
                                .fill(Color.red.opacity(0.1))
                        )
                }
            }
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(Color(.systemBackground))
                .shadow(color: Color.black.opacity(0.1), radius: 8, x: 0, y: 2)
        )
    }
    
    // MARK: - Tools Usage
    private var toolsUsageSection: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Herramientas Usadas")
                .font(.title2)
                .fontWeight(.semibold)
            
            if toolStats.isEmpty {
                Text("Aún no has usado herramientas en los volcanes registrados")
                    .font(.caption)
                    .foregroundColor(.secondary)
                    .italic()
            } else {
                ForEach(toolStats, id: \.tool) { stat in
                    HStack {
                        VStack(alignment: .leading, spacing: 4) {
                            Text(stat.tool)
                                .font(.subheadline)
                                .foregroundColor(.primary)
                            
                            if let effectiveness = stat.effectiveness {
                                Text("Efectividad: \(Int(effectiveness * 100))%")
                                    .font(.caption)
                                    .foregroundColor(effectiveness >= 0.7 ? .green : .orange)
                            }
                        }
                        
                        Spacer()
                        
                        Text("\(stat.count)")
                            .font(.headline)
                            .foregroundColor(.mint)
                            .padding(.horizontal, 12)
                            .padding(.vertical, 6)
                            .background(
                                Capsule()
                                    .fill(Color.mint.opacity(0.1))
                            )
                    }
                }
            }
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(Color(.systemBackground))
                .shadow(color: Color.black.opacity(0.1), radius: 8, x: 0, y: 2)
        )
    }
    
    // MARK: - Basics Compliance
    private var basicsComplianceSection: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Cumplimiento de las 6 Básicas")
                .font(.title2)
                .fontWeight(.semibold)
            
            if dailyChecks.isEmpty {
                Text("Comienza a registrar las 6 básicas diarias para ver estadísticas")
                    .font(.caption)
                    .foregroundColor(.secondary)
                    .italic()
            } else {
                VStack(spacing: 12) {
                    basicComplianceRow("Sueño", compliance: sleepCompliance)
                    basicComplianceRow("Alimentación", compliance: nutritionCompliance)
                    basicComplianceRow("Movimiento", compliance: movementCompliance)
                    basicComplianceRow("Conexión 1-a-1", compliance: connectionCompliance)
                    basicComplianceRow("Calma", compliance: calmCompliance)
                    basicComplianceRow("Consistencia", compliance: consistencyCompliance)
                }
            }
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(Color(.systemBackground))
                .shadow(color: Color.black.opacity(0.1), radius: 8, x: 0, y: 2)
        )
    }
    
    private func basicComplianceRow(_ name: String, compliance: Double) -> some View {
        HStack {
            Text(name)
                .font(.subheadline)
                .foregroundColor(.primary)
            
            Spacer()
            
            Text("\(Int(compliance * 100))%")
                .font(.caption)
                .fontWeight(.semibold)
                .foregroundColor(complianceColor(compliance))
                .padding(.horizontal, 8)
                .padding(.vertical, 4)
                .background(
                    Capsule()
                        .fill(complianceColor(compliance).opacity(0.1))
                )
        }
    }
    
    private func complianceColor(_ rate: Double) -> Color {
        if rate >= 0.8 { return .green }
        if rate >= 0.5 { return .orange }
        return .red
    }
    
    // MARK: - Computed Stats
    private var phaseStats: [(phase: String, count: Int)] {
        let grouped = Dictionary(grouping: volcanoLogs, by: { $0.volcanoPhase })
        return grouped.map { (phase: $0.key, count: $0.value.count) }
            .sorted { $0.count > $1.count }
    }
    
    private var triggerStats: [(button: String, count: Int)] {
        let grouped = Dictionary(grouping: volcanoLogs, by: { $0.triggerButton })
        return grouped.map { (button: $0.key, count: $0.value.count) }
            .sorted { $0.count > $1.count }
    }
    
    private var toolStats: [(tool: String, count: Int, effectiveness: Double?)] {
        let withTools = volcanoLogs.compactMap { $0.toolUsed }
        let grouped = Dictionary(grouping: withTools, by: { $0 })
        
        return grouped.map { tool, uses in
            let toolLogs = volcanoLogs.filter { $0.toolUsed == tool }
            let effectiveCount = toolLogs.filter { $0.toolEffective == true }.count
            let totalWithRating = toolLogs.filter { $0.toolEffective != nil }.count
            let effectiveness = totalWithRating > 0 ? Double(effectiveCount) / Double(totalWithRating) : nil
            
            return (tool: tool, count: uses.count, effectiveness: effectiveness)
        }
        .sorted { $0.count > $1.count }
    }
    
    private var trackingDays: Int {
        guard let first = dailyChecks.last?.date else { return 0 }
        return Calendar.current.dateComponents([.day], from: first, to: Date()).day ?? 0
    }
    
    private var toolUsageRate: Double {
        guard !volcanoLogs.isEmpty else { return 0 }
        let withTools = volcanoLogs.filter { $0.toolUsed != nil }.count
        return Double(withTools) / Double(volcanoLogs.count)
    }
    
    private var basicsComplianceRate: Double {
        guard !dailyChecks.isEmpty else { return 0 }
        let total = dailyChecks.reduce(0.0) { $0 + $1.compliancePercentage }
        return total / Double(dailyChecks.count)
    }
    
    private func percentage(_ count: Int, _ total: Int) -> CGFloat {
        guard total > 0 else { return 0 }
        return CGFloat(count) / CGFloat(total)
    }
    
    // Compliance por básica
    private var sleepCompliance: Double {
        complianceFor { $0.sleepCompliant }
    }
    
    private var nutritionCompliance: Double {
        complianceFor { $0.nutritionCompliant }
    }
    
    private var movementCompliance: Double {
        complianceFor { $0.movementCompliant }
    }
    
    private var connectionCompliance: Double {
        complianceFor { $0.connectionCompliant }
    }
    
    private var calmCompliance: Double {
        complianceFor { $0.calmCompliant }
    }
    
    private var consistencyCompliance: Double {
        complianceFor { $0.consistencyCompliant }
    }
    
    private func complianceFor(_ check: (TV6DailyCheck) -> Bool) -> Double {
        guard !dailyChecks.isEmpty else { return 0 }
        let compliant = dailyChecks.filter(check).count
        return Double(compliant) / Double(dailyChecks.count)
    }
}

#Preview {
    NavigationStack {
        TV6StatsView()
            .modelContainer(for: [TV6VolcanoLog.self, TV6DailyCheck.self], inMemory: true)
    }
}

