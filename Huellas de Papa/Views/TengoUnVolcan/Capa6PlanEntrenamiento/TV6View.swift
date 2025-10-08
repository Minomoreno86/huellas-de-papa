import SwiftUI
import SwiftData

/// Vista principal de la Capa 6 (Seguimiento del Volcán)
/// Sistema de tracking basado en las categorías del libro
struct TV6View: View {
    @Query(sort: \TV6VolcanoLog.date, order: .reverse) private var volcanoLogs: [TV6VolcanoLog]
    @Query(sort: \TV6DailyCheck.date, order: .reverse) private var dailyChecks: [TV6DailyCheck]
    @Environment(\.modelContext) private var modelContext
    
    @State private var showingLogEntry = false
    @State private var showingStats = false
    
    var body: some View {
        ScrollView {
            VStack(spacing: 32) {
                // 1. Header
                headerSection
                
                // 2. Resumen de esta semana
                weekSummarySection
                
                // 3. Checklist de hoy
                todayChecklistSection
                
                // 4. Botón para registrar volcán
                registerButton
                
                // 5. Insights automáticos
                insightsSection
                
                // 6. Últimos registros
                recentLogsSection
                
                // 7. Ver estadísticas completas
                statsButton
            }
            .padding()
        }
        .navigationTitle("Seguimiento")
        .navigationBarTitleDisplayMode(.large)
        .background(Color(.systemGroupedBackground))
        .sheet(isPresented: $showingLogEntry) {
            TV6LogEntryView()
        }
        .sheet(isPresented: $showingStats) {
            NavigationStack {
                TV6StatsView()
            }
        }
    }
    
    // MARK: - Header
    private var headerSection: some View {
        VStack(spacing: 16) {
            ZStack {
                Circle()
                    .fill(
                        LinearGradient(
                            gradient: Gradient(colors: [.blue.opacity(0.6), .mint.opacity(0.3)]),
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                    )
                    .frame(width: 100, height: 100)
                
                Image(systemName: "chart.line.uptrend.xyaxis")
                    .font(.system(size: 40))
                    .foregroundColor(.white)
            }
            
            Text("Seguimiento del Volcán")
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
            
            Text("Registra y aprende de los volcanes de tu hijo")
                .font(.title3)
                .fontWeight(.medium)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
        }
        .padding(.vertical)
    }
    
    // MARK: - Week Summary
    private var weekSummarySection: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack {
                Image(systemName: "calendar")
                    .foregroundColor(.blue)
                    .font(.title2)
                
                Text("Esta Semana")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .foregroundColor(.primary)
            }
            
            HStack(spacing: 12) {
                statCard(
                    value: "\(thisWeekVolcanoes.count)",
                    label: "Volcanes",
                    icon: "flame.fill",
                    color: volcanoesTrendColor
                )
                
                statCard(
                    value: "\(Int(thisWeekBasicsCompliance * 100))%",
                    label: "6 Básicas",
                    icon: "leaf.fill",
                    color: basicsComplianceColor
                )
                
                statCard(
                    value: "\(Int(thisWeekToolUsage * 100))%",
                    label: "Con Herramientas",
                    icon: "wrench.fill",
                    color: toolUsageColor
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
                .font(.title2)
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
    
    // MARK: - Today Checklist
    private var todayChecklistSection: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack {
                Image(systemName: "checklist")
                    .foregroundColor(.mint)
                    .font(.title2)
                
                Text("Las 6 Básicas de Hoy")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .foregroundColor(.primary)
            }
            
            if let todayCheck = todayDailyCheck {
                Text("\(todayCheck.totalCompliance)/6 completadas")
                    .font(.subheadline)
                    .foregroundColor(todayCheck.totalCompliance >= 4 ? .green : .orange)
                    .fontWeight(.semibold)
            } else {
                Text("Aún no registrado hoy")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
            
            NavigationLink(destination: TV6DailyCheckView()) {
                HStack {
                    Text("Ver/Actualizar Checklist")
                        .fontWeight(.semibold)
                    
                    Spacer()
                    
                    Image(systemName: "chevron.right")
                }
                .foregroundColor(.mint)
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 12)
                        .fill(Color.mint.opacity(0.1))
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
    
    // MARK: - Register Button
    private var registerButton: some View {
        Button {
            showingLogEntry = true
        } label: {
            HStack {
                Image(systemName: "plus.circle.fill")
                    .font(.title2)
                
                Text("Registrar un Volcán")
                    .font(.headline)
                    .fontWeight(.semibold)
            }
            .foregroundColor(.white)
            .frame(maxWidth: .infinity)
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 16)
                    .fill(
                        LinearGradient(
                            gradient: Gradient(colors: [.blue, .mint]),
                            startPoint: .leading,
                            endPoint: .trailing
                        )
                    )
            )
        }
    }
    
    // MARK: - Insights
    private var insightsSection: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack {
                Image(systemName: "lightbulb.fill")
                    .foregroundColor(.yellow)
                    .font(.title2)
                
                Text("Insights")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .foregroundColor(.primary)
            }
            
            TV6InsightsView()
        }
    }
    
    // MARK: - Recent Logs
    private var recentLogsSection: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack {
                Image(systemName: "clock.arrow.circlepath")
                    .foregroundColor(.purple)
                    .font(.title2)
                
                Text("Últimos Registros")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .foregroundColor(.primary)
            }
            
            if volcanoLogs.isEmpty {
                emptyState
            } else {
                ForEach(volcanoLogs.prefix(5)) { log in
                    logSummaryRow(log)
                }
            }
        }
    }
    
    private var emptyState: some View {
        VStack(spacing: 16) {
            Image(systemName: "tray")
                .font(.system(size: 50))
                .foregroundColor(.secondary)
            
            Text("Aún no hay registros")
                .font(.headline)
                .foregroundColor(.secondary)
            
            Text("Presiona 'Registrar un Volcán' cuando observe un volcán en tu hijo")
                .font(.caption)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
        }
        .frame(maxWidth: .infinity)
        .padding(40)
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(Color(.systemBackground))
        )
    }
    
    private func logSummaryRow(_ log: TV6VolcanoLog) -> some View {
        HStack(spacing: 12) {
            phaseIcon(log.volcanoPhase)
            
            VStack(alignment: .leading, spacing: 4) {
                Text(log.triggerButton)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundColor(.primary)
                
                HStack(spacing: 8) {
                    Text(log.volcanoPhase)
                        .font(.caption)
                        .foregroundColor(.secondary)
                    
                    Text("•")
                        .foregroundColor(.secondary)
                    
                    Text(log.date, style: .relative)
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
            }
            
            Spacer()
            
            if let toolUsed = log.toolUsed {
                Image(systemName: "checkmark.circle.fill")
                    .foregroundColor(.green)
                    .font(.title3)
            }
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(Color(.systemBackground))
        )
    }
    
    private func phaseIcon(_ phase: String) -> some View {
        Group {
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
        }
        .font(.title3)
        .frame(width: 40, height: 40)
        .background(
            Circle()
                .fill(Color.gray.opacity(0.1))
        )
    }
    
    // MARK: - Stats Button
    private var statsButton: some View {
        NavigationLink(destination: TV6StatsView()) {
            HStack {
                Image(systemName: "chart.bar.fill")
                    .font(.title3)
                
                Text("Ver Estadísticas Completas")
                    .font(.headline)
                    .fontWeight(.semibold)
            }
            .foregroundColor(.blue)
            .frame(maxWidth: .infinity)
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 12)
                    .fill(Color.blue.opacity(0.1))
            )
        }
    }
    
    // MARK: - Computed Properties
    private var thisWeekVolcanoes: [TV6VolcanoLog] {
        let calendar = Calendar.current
        let weekAgo = calendar.date(byAdding: .day, value: -7, to: Date())!
        return volcanoLogs.filter { $0.date >= weekAgo }
    }
    
    private var thisWeekDailyChecks: [TV6DailyCheck] {
        let calendar = Calendar.current
        let weekAgo = calendar.date(byAdding: .day, value: -7, to: Date())!
        return dailyChecks.filter { $0.date >= weekAgo }
    }
    
    private var thisWeekBasicsCompliance: Double {
        guard !thisWeekDailyChecks.isEmpty else { return 0 }
        let total = thisWeekDailyChecks.reduce(0.0) { $0 + $1.compliancePercentage }
        return total / Double(thisWeekDailyChecks.count)
    }
    
    private var thisWeekToolUsage: Double {
        guard !thisWeekVolcanoes.isEmpty else { return 0 }
        let withTools = thisWeekVolcanoes.filter { $0.toolUsed != nil }.count
        return Double(withTools) / Double(thisWeekVolcanoes.count)
    }
    
    private var volcanoesTrendColor: Color {
        let count = thisWeekVolcanoes.count
        if count == 0 { return .green }
        if count <= 3 { return .green }
        if count <= 7 { return .orange }
        return .red
    }
    
    private var basicsComplianceColor: Color {
        if thisWeekBasicsCompliance >= 0.8 { return .green }
        if thisWeekBasicsCompliance >= 0.5 { return .orange }
        return .red
    }
    
    private var toolUsageColor: Color {
        if thisWeekToolUsage >= 0.7 { return .green }
        if thisWeekToolUsage >= 0.3 { return .orange }
        return .red
    }
    
    private var todayDailyCheck: TV6DailyCheck? {
        let calendar = Calendar.current
        return dailyChecks.first { calendar.isDateInToday($0.date) }
    }
}

#Preview {
    NavigationStack {
        TV6View()
            .modelContainer(for: [TV6VolcanoLog.self, TV6DailyCheck.self], inMemory: true)
    }
}

