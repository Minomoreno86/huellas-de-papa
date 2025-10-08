import SwiftUI

/// Tarjeta que presenta el reto del día con pasos completables
struct YBTrainingDayCard: View {
    let day: YBTrainingDay
    let onComplete: () -> Void
    
    @State private var completedSteps: Set<Int> = []
    
    private var allStepsCompleted: Bool {
        completedSteps.count == day.actionSteps.count
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            // Header
            headerSection
            
            // Theme
            themeSection
            
            // Challenge
            challengeSection
            
            // Action Steps
            stepsSection
            
            // Reflection
            reflectionSection
            
            // Complete Button
            if !day.completed {
                completeButton
            } else {
                completedBadge
            }
        }
        .padding(20)
        .background(
            RoundedRectangle(cornerRadius: 20)
                .fill(Color(.systemBackground))
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(phaseColor.opacity(0.3), lineWidth: 2)
                )
        )
        .shadow(color: phaseColor.opacity(0.1), radius: 12, x: 0, y: 6)
    }
    
    // MARK: - Header
    private var headerSection: some View {
        HStack(spacing: 12) {
            Image(systemName: day.icon)
                .font(.title)
                .foregroundColor(phaseColor)
                .frame(width: 50, height: 50)
                .background(
                    Circle()
                        .fill(phaseColor.opacity(0.15))
                )
            
            VStack(alignment: .leading, spacing: 4) {
                Text("Día \(day.dayNumber)")
                    .font(.caption)
                    .fontWeight(.semibold)
                    .foregroundColor(.secondary)
                
                Text(day.phase)
                    .font(.headline)
                    .foregroundColor(phaseColor)
            }
            
            Spacer()
            
            if day.completed {
                Image(systemName: "checkmark.seal.fill")
                    .font(.title2)
                    .foregroundColor(.green)
            }
        }
    }
    
    // MARK: - Theme
    private var themeSection: some View {
        Text(day.theme)
            .font(.title2)
            .fontWeight(.bold)
            .foregroundColor(.primary)
            .multilineTextAlignment(.leading)
    }
    
    // MARK: - Challenge
    private var challengeSection: some View {
        VStack(alignment: .leading, spacing: 8) {
            Label("Reto del día", systemImage: "target")
                .font(.subheadline)
                .fontWeight(.semibold)
                .foregroundColor(phaseColor)
            
            Text(day.challenge)
                .font(.body)
                .foregroundColor(.primary)
                .multilineTextAlignment(.leading)
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(phaseColor.opacity(0.1))
        )
    }
    
    // MARK: - Steps
    private var stepsSection: some View {
        VStack(alignment: .leading, spacing: 16) {
            Label("Pasos a seguir", systemImage: "list.number")
                .font(.subheadline)
                .fontWeight(.semibold)
                .foregroundColor(.primary)
            
            ForEach(day.actionSteps.indices, id: \.self) { index in
                stepRow(index: index)
            }
        }
    }
    
    private func stepRow(index: Int) -> some View {
        Button(action: {
            withAnimation(.spring(response: 0.3, dampingFraction: 0.7)) {
                if completedSteps.contains(index) {
                    completedSteps.remove(index)
                } else {
                    completedSteps.insert(index)
                    #if !os(macOS)
                    UIImpactFeedbackGenerator(style: .light).impactOccurred()
                    #endif
                }
            }
        }) {
            HStack(alignment: .top, spacing: 12) {
                ZStack {
                    Circle()
                        .stroke(completedSteps.contains(index) ? phaseColor : Color(.systemGray4), lineWidth: 2)
                        .frame(width: 28, height: 28)
                    
                    if completedSteps.contains(index) {
                        Image(systemName: "checkmark")
                            .font(.caption)
                            .fontWeight(.bold)
                            .foregroundColor(phaseColor)
                    } else {
                        Text("\(index + 1)")
                            .font(.caption)
                            .fontWeight(.semibold)
                            .foregroundColor(.secondary)
                    }
                }
                
                Text(day.actionSteps[index])
                    .font(.subheadline)
                    .foregroundColor(completedSteps.contains(index) ? .secondary : .primary)
                    .strikethrough(completedSteps.contains(index))
                    .multilineTextAlignment(.leading)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            .padding(.vertical, 4)
        }
        .buttonStyle(PlainButtonStyle())
        .disabled(day.completed)
    }
    
    // MARK: - Reflection
    private var reflectionSection: some View {
        VStack(alignment: .leading, spacing: 8) {
            Label("Reflexión", systemImage: "lightbulb.fill")
                .font(.subheadline)
                .fontWeight(.semibold)
                .foregroundColor(phaseColor)
            
            Text(day.reflection)
                .font(.body)
                .italic()
                .foregroundColor(.primary)
                .multilineTextAlignment(.leading)
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(
                    RoundedRectangle(cornerRadius: 12)
                        .fill(Color(.systemGray6))
                )
        }
    }
    
    // MARK: - Complete Button
    private var completeButton: some View {
        Button(action: {
            #if !os(macOS)
            UIImpactFeedbackGenerator(style: .heavy).impactOccurred()
            #endif
            onComplete()
        }) {
            HStack {
                Image(systemName: allStepsCompleted ? "checkmark.circle.fill" : "circle")
                    .font(.title3)
                
                Text(allStepsCompleted ? "¡Lo logré!" : "Completar todos los pasos primero")
                    .font(.headline)
            }
            .foregroundColor(.white)
            .frame(maxWidth: .infinity)
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 16)
                    .fill(
                        allStepsCompleted ? 
                        LinearGradient(colors: [phaseColor, phaseColor.opacity(0.8)], startPoint: .leading, endPoint: .trailing) :
                        LinearGradient(colors: [Color(.systemGray4), Color(.systemGray4)], startPoint: .leading, endPoint: .trailing)
                    )
            )
        }
        .disabled(!allStepsCompleted)
    }
    
    // MARK: - Completed Badge
    private var completedBadge: some View {
        HStack {
            Image(systemName: "checkmark.seal.fill")
                .font(.title3)
            
            Text("Completado el \(formattedDate)")
                .font(.subheadline)
                .fontWeight(.medium)
        }
        .foregroundColor(.green)
        .frame(maxWidth: .infinity)
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(Color.green.opacity(0.1))
        )
    }
    
    // MARK: - Helpers
    private var phaseColor: Color {
        switch day.color {
        case "blue": return .blue
        case "green": return .green
        case "orange": return .orange
        case "pink": return .pink
        default: return .blue
        }
    }
    
    private var formattedDate: String {
        guard let date = day.completedAt else { return "" }
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        return formatter.string(from: date)
    }
}

// MARK: - Preview
struct YBTrainingDayCard_Previews: PreviewProvider {
    static var previews: some View {
        ScrollView {
            VStack(spacing: 20) {
                YBTrainingDayCard(
                    day: YBTrainingData.createTrainingDays()[0],
                    onComplete: {}
                )
                
                YBTrainingDayCard(
                    day: YBTrainingData.createTrainingDays()[7],
                    onComplete: {}
                )
            }
            .padding()
        }
        .background(Color(.systemGroupedBackground))
    }
}

