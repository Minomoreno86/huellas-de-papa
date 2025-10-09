import SwiftUI

/// Vista principal de la Capa 6 (Plan de Entrenamiento)
/// Plan de 12 semanas + Guía de desarrollo cerebral por edades
struct CN6View: View {
    @State private var selectedWeek: CN6TrainingWeek?
    @State private var selectedAgeStage: CN6AgeStage?
    @State private var showingWeekDetail = false
    @State private var showingAgeStageDetail = false
    @State private var selectedTab: TrainingTab = .weeks
    
    enum TrainingTab {
        case weeks, ageStages
    }
    
    var body: some View {
        ScrollView {
            VStack(spacing: 32) {
                // Header
                headerSection
                
                // Tab selector
                tabSelector
                
                // Content
                switch selectedTab {
                case .weeks:
                    weeksSection
                case .ageStages:
                    ageStagesSection
                }
            }
            .padding()
        }
        .background(Color(.systemGroupedBackground))
        .navigationTitle("Plan de Entrenamiento")
        .navigationBarTitleDisplayMode(.large)
        .sheet(isPresented: $showingWeekDetail) {
            if let week = selectedWeek {
                CN6WeekDetailView(week: week)
            }
        }
        .sheet(isPresented: $showingAgeStageDetail) {
            if let stage = selectedAgeStage {
                CN6AgeStageDetailView(ageStage: stage)
            }
        }
    }
    
    // MARK: - Header
    private var headerSection: some View {
        VStack(spacing: 16) {
            Text("Entrena para Ser Mejor Padre")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundStyle(
                    LinearGradient(
                        colors: [.blue, .mint],
                        startPoint: .leading,
                        endPoint: .trailing
                    )
                )
            
            Text("Plan de 12 semanas para dominar las estrategias de integración cerebral")
                .font(.title3)
                .fontWeight(.medium)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
            
            Text("Una estrategia por semana • Progreso medible • Basado 100% en el libro")
                .font(.subheadline)
                .foregroundColor(.blue)
                .italic()
        }
        .padding(.vertical)
    }
    
    // MARK: - Tab Selector
    private var tabSelector: some View {
        HStack(spacing: 0) {
            CN6TabButton(
                title: "12 Semanas",
                icon: "calendar",
                isSelected: selectedTab == .weeks
            ) {
                withAnimation {
                    selectedTab = .weeks
                }
            }
            
            CN6TabButton(
                title: "Por Edades",
                icon: "figure.2.and.child.holdinghands",
                isSelected: selectedTab == .ageStages
            ) {
                withAnimation {
                    selectedTab = .ageStages
                }
            }
        }
        .padding(4)
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(Color(.systemBackground))
        )
    }
    
    // MARK: - Weeks Section
    private var weeksSection: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Plan de 12 Semanas")
                .font(.title2)
                .fontWeight(.semibold)
            
            Text("Domina una estrategia por semana con entrenamiento diario")
                .font(.subheadline)
                .foregroundColor(.secondary)
            
            VStack(spacing: 12) {
                ForEach(cn6TrainingWeeks) { week in
                    CN6WeekCard(week: week)
                        .onTapGesture {
                            selectedWeek = week
                            showingWeekDetail = true
                        }
                }
            }
        }
    }
    
    // MARK: - Age Stages Section
    private var ageStagesSection: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Desarrollo Cerebral por Edades")
                .font(.title2)
                .fontWeight(.semibold)
            
            Text("Qué esperar del cerebro de tu hijo según su edad y cómo ajustar expectativas")
                .font(.subheadline)
                .foregroundColor(.secondary)
            
            VStack(spacing: 12) {
                ForEach(cn6AgeStages) { stage in
                    CN6AgeStageCard(ageStage: stage)
                        .onTapGesture {
                            selectedAgeStage = stage
                            showingAgeStageDetail = true
                        }
                }
            }
        }
    }
}

// MARK: - Tab Button
struct CN6TabButton: View {
    let title: String
    let icon: String
    let isSelected: Bool
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            VStack(spacing: 4) {
                Image(systemName: icon)
                    .font(.title3)
                Text(title)
                    .font(.caption)
                    .fontWeight(.medium)
            }
            .frame(maxWidth: .infinity)
            .padding(.vertical, 12)
            .background(
                RoundedRectangle(cornerRadius: 8)
                    .fill(isSelected ? Color.blue : Color.clear)
            )
            .foregroundColor(isSelected ? .white : .secondary)
        }
    }
}

// MARK: - Week Card
struct CN6WeekCard: View {
    let week: CN6TrainingWeek
    
    var body: some View {
        HStack(spacing: 16) {
            // Week number
            VStack(spacing: 4) {
                Text("Semana")
                    .font(.caption2)
                    .foregroundColor(.white)
                Text("\(week.weekNumber)")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
            }
            .frame(width: 70, height: 70)
            .background(
                RoundedRectangle(cornerRadius: 12)
                    .fill(colorFromString(week.color))
            )
            
            // Content
            VStack(alignment: .leading, spacing: 6) {
                HStack {
                    Text("Estrategia #\(week.strategyNumber)")
                        .font(.caption)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding(.horizontal, 8)
                        .padding(.vertical, 4)
                        .background(
                            Capsule()
                                .fill(colorFromString(week.color))
                        )
                    
                    Spacer()
                }
                
                Text(week.strategyName)
                    .font(.headline)
                    .fontWeight(.bold)
                
                Text(week.focus)
                    .font(.caption)
                    .foregroundColor(.secondary)
                    .lineLimit(2)
            }
            
            Image(systemName: "chevron.right.circle.fill")
                .foregroundColor(.blue.opacity(0.3))
                .font(.title2)
        }
        .padding(16)
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(Color(.systemBackground))
                .shadow(radius: 4)
        )
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

// MARK: - Age Stage Card
struct CN6AgeStageCard: View {
    let ageStage: CN6AgeStage
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                Image(systemName: ageStage.icon)
                    .font(.system(size: 40))
                    .foregroundColor(colorFromString(ageStage.color))
                
                VStack(alignment: .leading, spacing: 4) {
                    Text(ageStage.ageRange)
                        .font(.headline)
                        .fontWeight(.bold)
                    
                    Text(ageStage.stageName)
                        .font(.subheadline)
                        .foregroundColor(colorFromString(ageStage.color))
                }
                
                Spacer()
                
                Image(systemName: "chevron.right")
                    .foregroundColor(.secondary)
            }
            
            Text(ageStage.brainDevelopment)
                .font(.caption)
                .foregroundColor(.secondary)
                .lineLimit(3)
        }
        .padding(16)
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(Color(.systemBackground))
                .overlay(
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(colorFromString(ageStage.color).opacity(0.3), lineWidth: 2)
                )
                .shadow(radius: 4)
        )
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

// MARK: - Preview
struct CN6View_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            CN6View()
        }
    }
}

