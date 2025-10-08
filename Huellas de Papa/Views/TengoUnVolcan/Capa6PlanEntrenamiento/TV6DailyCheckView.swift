import SwiftUI
import SwiftData

/// Vista de checklist diario de las 6 básicas
struct TV6DailyCheckView: View {
    @Query private var dailyChecks: [TV6DailyCheck]
    @Environment(\.modelContext) private var modelContext
    
    @State private var todayCheck: TV6DailyCheck?
    
    var body: some View {
        ScrollView {
            VStack(spacing: 24) {
                // Header
                headerSection
                
                // Checklist
                checklistSection
                
                // Notas
                notesSection
                
                // Tips
                tipsSection
            }
            .padding()
        }
        .navigationTitle("Checklist de Hoy")
        .navigationBarTitleDisplayMode(.large)
        .background(Color(.systemGroupedBackground))
        .onAppear {
            loadTodayCheck()
        }
    }
    
    // MARK: - Header
    private var headerSection: some View {
        VStack(spacing: 16) {
            // Progreso circular
            if let check = todayCheck {
                ZStack {
                    Circle()
                        .stroke(Color.gray.opacity(0.2), lineWidth: 12)
                        .frame(width: 120, height: 120)
                    
                    Circle()
                        .trim(from: 0, to: check.compliancePercentage)
                        .stroke(
                            LinearGradient(
                                gradient: Gradient(colors: [.green, .mint]),
                                startPoint: .top,
                                endPoint: .bottom
                            ),
                            style: StrokeStyle(lineWidth: 12, lineCap: .round)
                        )
                        .frame(width: 120, height: 120)
                        .rotationEffect(.degrees(-90))
                        .animation(.spring(), value: check.totalCompliance)
                    
                    VStack {
                        Text("\(check.totalCompliance)")
                            .font(.system(size: 40))
                            .fontWeight(.bold)
                            .foregroundColor(.primary)
                        
                        Text("de 6")
                            .font(.caption)
                            .foregroundColor(.secondary)
                    }
                }
                
                Text(progressMessage)
                    .font(.headline)
                    .foregroundColor(progressColor)
            }
        }
        .frame(maxWidth: .infinity)
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(Color(.systemBackground))
                .shadow(color: Color.black.opacity(0.1), radius: 8, x: 0, y: 2)
        )
    }
    
    // MARK: - Checklist
    private var checklistSection: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Las 6 Básicas de Hoy")
                .font(.title2)
                .fontWeight(.semibold)
            
            if let check = todayCheck {
                checkItem("Sueño suficiente", isChecked: check.sleepCompliant, icon: "moon.stars.fill", color: .indigo) {
                    check.sleepCompliant.toggle()
                }
                
                checkItem("Alimentación regular", isChecked: check.nutritionCompliant, icon: "fork.knife", color: .orange) {
                    check.nutritionCompliant.toggle()
                }
                
                checkItem("Movimiento diario", isChecked: check.movementCompliant, icon: "figure.run", color: .green) {
                    check.movementCompliant.toggle()
                }
                
                checkItem("Conexión 1-a-1", isChecked: check.connectionCompliant, icon: "heart.fill", color: .pink) {
                    check.connectionCompliant.toggle()
                }
                
                checkItem("Momentos de calma", isChecked: check.calmCompliant, icon: "leaf.fill", color: .mint) {
                    check.calmCompliant.toggle()
                }
                
                checkItem("Límites consistentes", isChecked: check.consistencyCompliant, icon: "list.bullet.clipboard.fill", color: .blue) {
                    check.consistencyCompliant.toggle()
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
    
    private func checkItem(_ label: String, isChecked: Bool, icon: String, color: Color, action: @escaping () -> Void) -> some View {
        Button {
            withAnimation(.spring()) {
                action()
            }
        } label: {
            HStack(spacing: 12) {
                Image(systemName: isChecked ? "checkmark.circle.fill" : "circle")
                    .foregroundColor(isChecked ? .green : .gray)
                    .font(.title3)
                
                Image(systemName: icon)
                    .foregroundColor(color)
                
                Text(label)
                    .font(.body)
                    .foregroundColor(.primary)
                    .strikethrough(isChecked)
                
                Spacer()
            }
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 12)
                    .fill(isChecked ? Color.green.opacity(0.1) : Color(.systemBackground))
            )
        }
    }
    
    // MARK: - Notes
    private var notesSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Notas del día")
                .font(.headline)
                .foregroundColor(.primary)
            
            if let check = todayCheck {
                TextEditor(text: Binding(
                    get: { check.notes ?? "" },
                    set: { check.notes = $0.isEmpty ? nil : $0 }
                ))
                .frame(height: 100)
                .padding(8)
                .background(
                    RoundedRectangle(cornerRadius: 8)
                        .fill(Color(.systemBackground))
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
    
    // MARK: - Tips
    private var tipsSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            ForEach(TV6Data.trackingTips.prefix(2)) { tip in
                HStack(alignment: .top, spacing: 12) {
                    Image(systemName: tip.iconName)
                        .foregroundColor(.yellow)
                        .font(.title3)
                    
                    VStack(alignment: .leading, spacing: 4) {
                        Text(tip.title)
                            .font(.caption)
                            .fontWeight(.semibold)
                            .foregroundColor(.primary)
                        
                        Text(tip.description)
                            .font(.caption)
                            .foregroundColor(.secondary)
                    }
                }
            }
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(Color.yellow.opacity(0.1))
        )
    }
    
    // MARK: - Helpers
    private func loadTodayCheck() {
        let calendar = Calendar.current
        if let existing = dailyChecks.first(where: { calendar.isDateInToday($0.date) }) {
            todayCheck = existing
        } else {
            let newCheck = TV6DailyCheck()
            modelContext.insert(newCheck)
            todayCheck = newCheck
        }
    }
    
    private var progressMessage: String {
        guard let check = todayCheck else { return "" }
        switch check.totalCompliance {
        case 6: return "¡Jardín completo! 🌟"
        case 4...5: return "¡Muy bien! Casi completo"
        case 2...3: return "Vas por buen camino"
        default: return "Falta regar el jardín"
        }
    }
    
    private var progressColor: Color {
        guard let check = todayCheck else { return .gray }
        switch check.totalCompliance {
        case 6: return .green
        case 4...5: return .mint
        case 2...3: return .orange
        default: return .red
        }
    }
}

#Preview {
    NavigationStack {
        TV6DailyCheckView()
            .modelContainer(for: TV6DailyCheck.self, inMemory: true)
    }
}

