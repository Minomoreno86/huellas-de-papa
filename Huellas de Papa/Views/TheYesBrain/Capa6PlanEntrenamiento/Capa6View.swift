import SwiftUI

/// Vista principal de la Capa 6 - Plan de Entrenamiento de 28 días
struct Capa6View: View {
    @State private var trainingDays: [YBTrainingDay] = YBTrainingData.createTrainingDays()
    @State private var currentDay: Int = 1
    @State private var showingReward = false
    @State private var completedToday = false
    
    var currentTrainingDay: YBTrainingDay? {
        trainingDays.first { $0.dayNumber == currentDay }
    }
    
    var completedDays: Int {
        trainingDays.filter { $0.completed }.count
    }
    
    var currentStreak: Int {
        var streak = 0
        for day in trainingDays.sorted(by: { $0.dayNumber < $1.dayNumber }) {
            if day.completed {
                streak += 1
            } else {
                break
            }
        }
        return streak
    }
    
    var body: some View {
        ScrollView {
            VStack(spacing: 24) {
                // Header
                headerSection
                
                // Progress Bar
                progressSection
                
                // Streak Bar
                streakSection
                
                // Training Card
                if let day = currentTrainingDay {
                    YBTrainingDayCard(
                        day: day,
                        onComplete: {
                            completeDay(day)
                        }
                    )
                }
                
                // Phase Overview
                phaseOverviewSection
            }
            .padding()
        }
        .background(Color(.systemGroupedBackground).ignoresSafeArea())
        #if !os(macOS)
        .navigationBarTitleDisplayMode(.inline)
        #endif
        .sheet(isPresented: $showingReward) {
            if let day = currentTrainingDay {
                YBTrainingRewardModal(day: day, onDismiss: {
                    showingReward = false
                    moveToNextDay()
                })
            }
        }
    }
    
    // MARK: - Header
    private var headerSection: some View {
        VStack(spacing: 16) {
            Image(systemName: "leaf.fill")
                .font(.system(size: 50))
                .foregroundStyle(
                    LinearGradient(
                        colors: [.blue, .mint],
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                )
            
            Text("Plan de Entrenamiento")
                .font(.largeTitle)
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
                .foregroundStyle(
                    LinearGradient(
                        gradient: Gradient(colors: [.blue, .mint]),
                        startPoint: .leading,
                        endPoint: .trailing
                    )
                )
            
            Text("28 días para cultivar el cerebro Sí")
                .font(.title3)
                .fontWeight(.medium)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
            
            if let day = currentTrainingDay {
                Text("Día \(day.dayNumber) • \(day.phase)")
                    .font(.subheadline)
                    .foregroundColor(phaseColor(day.phase))
                    .italic()
            }
        }
        .padding(.vertical)
    }
    
    // MARK: - Progress Section
    private var progressSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                Text("Progreso")
                    .font(.headline)
                    .foregroundColor(.primary)
                
                Spacer()
                
                Text("\(completedDays)/28 días")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
            
            GeometryReader { geometry in
                ZStack(alignment: .leading) {
                    RoundedRectangle(cornerRadius: 8)
                        .fill(Color(.systemGray5))
                        .frame(height: 12)
                    
                    RoundedRectangle(cornerRadius: 8)
                        .fill(
                            LinearGradient(
                                colors: [.blue, .mint],
                                startPoint: .leading,
                                endPoint: .trailing
                            )
                        )
                        .frame(width: geometry.size.width * CGFloat(completedDays) / 28.0, height: 12)
                }
            }
            .frame(height: 12)
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(Color(.systemBackground))
        )
    }
    
    // MARK: - Streak Section
    private var streakSection: some View {
        HStack(spacing: 16) {
            Image(systemName: "flame.fill")
                .font(.title)
                .foregroundColor(.orange)
            
            VStack(alignment: .leading, spacing: 4) {
                Text("Racha actual")
                    .font(.caption)
                    .foregroundColor(.secondary)
                
                Text("\(currentStreak) días seguidos")
                    .font(.headline)
                    .foregroundColor(.primary)
            }
            
            Spacer()
            
            if currentStreak > 0 {
                Text("¡Sigue así!")
                    .font(.caption)
                    .fontWeight(.medium)
                    .foregroundColor(.orange)
                    .padding(.horizontal, 12)
                    .padding(.vertical, 6)
                    .background(
                        RoundedRectangle(cornerRadius: 12)
                            .fill(Color.orange.opacity(0.2))
                    )
            }
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(Color(.systemBackground))
        )
    }
    
    // MARK: - Phase Overview
    private var phaseOverviewSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Fases del entrenamiento")
                .font(.title2)
                .fontWeight(.semibold)
                .foregroundColor(.primary)
            
            VStack(spacing: 12) {
                YBPhaseCard(
                    phase: "Balance",
                    days: "Días 1-7",
                    description: "Calma y control emocional",
                    color: .blue,
                    isActive: currentDay <= 7
                )
                
                YBPhaseCard(
                    phase: "Resiliencia",
                    days: "Días 8-14",
                    description: "Recuperar y avanzar tras el error",
                    color: .green,
                    isActive: currentDay > 7 && currentDay <= 14
                )
                
                YBPhaseCard(
                    phase: "Insight",
                    days: "Días 15-21",
                    description: "Comprender desde dentro",
                    color: .orange,
                    isActive: currentDay > 14 && currentDay <= 21
                )
                
                YBPhaseCard(
                    phase: "Empatía",
                    days: "Días 22-28",
                    description: "Conectar con el otro",
                    color: .pink,
                    isActive: currentDay > 21
                )
            }
        }
    }
    
    // MARK: - Actions
    private func completeDay(_ day: YBTrainingDay) {
        if let index = trainingDays.firstIndex(where: { $0.id == day.id }) {
            trainingDays[index].completed = true
            trainingDays[index].completedAt = Date()
            completedToday = true
            
            #if !os(macOS)
            UIImpactFeedbackGenerator(style: .medium).impactOccurred()
            #endif
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                showingReward = true
            }
        }
    }
    
    private func moveToNextDay() {
        if currentDay < 28 {
            currentDay += 1
        }
    }
    
    private func phaseColor(_ phase: String) -> Color {
        switch phase {
        case "Balance": return .blue
        case "Resiliencia": return .green
        case "Insight": return .orange
        case "Empatía": return .pink
        default: return .blue
        }
    }
}

// MARK: - Phase Card
struct YBPhaseCard: View {
    let phase: String
    let days: String
    let description: String
    let color: Color
    let isActive: Bool
    
    var body: some View {
        HStack(spacing: 12) {
            Circle()
                .fill(isActive ? color : Color(.systemGray5))
                .frame(width: 12, height: 12)
            
            VStack(alignment: .leading, spacing: 4) {
                HStack {
                    Text(phase)
                        .font(.headline)
                        .foregroundColor(isActive ? color : .secondary)
                    
                    Text(days)
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
                
                Text(description)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
            
            Spacer()
            
            if isActive {
                Image(systemName: "arrow.right.circle.fill")
                    .foregroundColor(color)
            }
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(isActive ? color.opacity(0.1) : Color(.systemBackground))
        )
        .overlay(
            RoundedRectangle(cornerRadius: 12)
                .stroke(isActive ? color.opacity(0.3) : Color.clear, lineWidth: 2)
        )
    }
}

// MARK: - Preview
struct Capa6View_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            Capa6View()
        }
    }
}

