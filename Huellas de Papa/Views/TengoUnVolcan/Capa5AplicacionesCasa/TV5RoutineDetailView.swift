import SwiftUI

/// Vista de detalle completa para una rutina familiar
struct TV5RoutineDetailView: View {
    let routine: TV5Routine
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 32) {
                // Header
                headerSection
                
                // Objetivo
                objectiveSection
                
                // Pasos
                stepsSection
                
                // Herramientas que practica
                toolsSection
                
                // Enfoque de prevención
                if !routine.preventionFocus.isEmpty {
                    preventionSection
                }
                
                // Tips
                tipsSection
            }
            .padding()
        }
        .navigationTitle(routine.title)
        .navigationBarTitleDisplayMode(.large)
        .background(Color(.systemGroupedBackground))
    }
    
    // MARK: - Header
    private var headerSection: some View {
        VStack(spacing: 20) {
            ZStack {
                Circle()
                    .fill(
                        LinearGradient(
                            gradient: Gradient(colors: [timeColor.opacity(0.6), timeColor.opacity(0.3)]),
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                    )
                    .frame(width: 100, height: 100)
                
                Image(systemName: routine.iconName)
                    .font(.system(size: 40))
                    .foregroundColor(.white)
            }
            
            HStack(spacing: 16) {
                Label(routine.timeOfDay.rawValue, systemImage: timeIcon)
                    .font(.subheadline)
                    .foregroundColor(timeColor)
                    .padding(.horizontal, 12)
                    .padding(.vertical, 6)
                    .background(
                        Capsule()
                            .fill(timeColor.opacity(0.1))
                    )
                
                Label(routine.durationMinutes, systemImage: "clock")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
        }
        .frame(maxWidth: .infinity)
    }
    
    // MARK: - Objective
    private var objectiveSection: some View {
        sectionCard(
            icon: "target",
            title: "Objetivo",
            content: routine.objective,
            color: .blue
        )
    }
    
    // MARK: - Steps
    private var stepsSection: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack {
                Image(systemName: "list.number")
                    .foregroundColor(timeColor)
                    .font(.title2)
                
                Text("Pasos de la Rutina")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .foregroundColor(.primary)
            }
            
            VStack(alignment: .leading, spacing: 16) {
                ForEach(Array(routine.steps.enumerated()), id: \.offset) { index, step in
                    stepRow(number: index + 1, text: step)
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
    
    private func stepRow(number: Int, text: String) -> some View {
        HStack(alignment: .top, spacing: 12) {
            Text("\(number)")
                .font(.headline)
                .fontWeight(.bold)
                .foregroundColor(.white)
                .frame(width: 32, height: 32)
                .background(
                    Circle()
                        .fill(timeColor)
                )
            
            Text(text)
                .font(.body)
                .foregroundColor(.primary)
                .fixedSize(horizontal: false, vertical: true)
        }
    }
    
    // MARK: - Tools Section
    private var toolsSection: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack {
                Image(systemName: "wrench.and.screwdriver.fill")
                    .foregroundColor(.mint)
                    .font(.title2)
                
                Text("Herramientas que Practica")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .foregroundColor(.primary)
            }
            
            VStack(alignment: .leading, spacing: 8) {
                ForEach(routine.toolsPracticed, id: \.self) { tool in
                    HStack(spacing: 12) {
                        Image(systemName: "checkmark.circle.fill")
                            .foregroundColor(.mint)
                        
                        Text(tool)
                            .font(.body)
                            .foregroundColor(.primary)
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
    
    // MARK: - Prevention Section
    private var preventionSection: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack {
                Image(systemName: "shield.fill")
                    .foregroundColor(.green)
                    .font(.title2)
                
                Text("Prevención Activa")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .foregroundColor(.primary)
            }
            
            Text("Aspectos de 'Regar el Jardín Interior' que esta rutina cubre:")
                .font(.caption)
                .foregroundColor(.secondary)
                .italic()
            
            VStack(alignment: .leading, spacing: 8) {
                ForEach(routine.preventionFocus, id: \.self) { focus in
                    HStack(spacing: 12) {
                        Image(systemName: "leaf.fill")
                            .foregroundColor(.green)
                            .font(.caption)
                        
                        Text(focus)
                            .font(.subheadline)
                            .foregroundColor(.primary)
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
    
    // MARK: - Tips Section
    private var tipsSection: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack {
                Image(systemName: "lightbulb.fill")
                    .foregroundColor(.yellow)
                    .font(.title2)
                
                Text("Consejos Importantes")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .foregroundColor(.primary)
            }
            
            VStack(alignment: .leading, spacing: 12) {
                ForEach(routine.tips, id: \.self) { tip in
                    HStack(alignment: .top, spacing: 12) {
                        Image(systemName: "star.fill")
                            .foregroundColor(.yellow)
                            .font(.caption)
                            .padding(.top, 4)
                        
                        Text(tip)
                            .font(.callout)
                            .foregroundColor(.primary)
                            .italic()
                            .fixedSize(horizontal: false, vertical: true)
                    }
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 8)
                            .fill(Color.yellow.opacity(0.1))
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
    
    // MARK: - Helper
    private func sectionCard(icon: String, title: String, content: String, color: Color) -> some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack {
                Image(systemName: icon)
                    .foregroundColor(color)
                    .font(.title2)
                
                Text(title)
                    .font(.title2)
                    .fontWeight(.semibold)
                    .foregroundColor(.primary)
            }
            
            Text(content)
                .font(.body)
                .foregroundColor(.secondary)
                .fixedSize(horizontal: false, vertical: true)
                .lineSpacing(6)
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(Color(.systemBackground))
                .shadow(color: Color.black.opacity(0.1), radius: 8, x: 0, y: 2)
        )
    }
    
    private var timeColor: Color {
        switch routine.timeOfDay {
        case .morning: return .orange
        case .afternoon: return .yellow
        case .evening: return .indigo
        case .anytime: return .mint
        case .crisis: return .red
        }
    }
    
    private var timeIcon: String {
        switch routine.timeOfDay {
        case .morning: return "sunrise.fill"
        case .afternoon: return "sun.max.fill"
        case .evening: return "moon.stars.fill"
        case .anytime: return "clock.fill"
        case .crisis: return "exclamationmark.triangle.fill"
        }
    }
}

#Preview {
    NavigationStack {
        TV5RoutineDetailView(routine: TV5Data.routines[0])
    }
}

