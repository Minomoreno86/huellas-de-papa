import SwiftUI

/// Vista detallada de una actividad con pasos y objetivo
struct YesBrainActivityDetailView: View {
    let activity: YesBrainActivity
    @Environment(\.dismiss) var dismiss
    @State private var completedSteps: Set<Int> = []
    @State private var showingCompletion = false
    
    var body: some View {
        ScrollView {
            VStack(spacing: 24) {
                // Header
                headerSection
                
                // Goal
                goalSection
                
                // Pasos
                stepsSection
                
                // Botón de completar
                completeButton
            }
            .padding()
        }
        .background(Color(.systemGroupedBackground).ignoresSafeArea())
        .navigationTitle(activity.title)
        #if !os(macOS)
        .navigationBarTitleDisplayMode(.inline)
        #endif
        .alert("¡Actividad completada!", isPresented: $showingCompletion) {
            Button("Continuar", role: .cancel) {
                dismiss()
            }
        } message: {
            Text("Has entrenado \(activity.goal)")
        }
    }
    
    // MARK: - Header
    private var headerSection: some View {
        VStack(spacing: 16) {
            Image(systemName: activity.icon)
                .font(.system(size: 60))
                .foregroundStyle(
                    LinearGradient(
                        colors: [activityColor, activityColor.opacity(0.6)],
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                )
            
            Text(activity.title)
                .font(.title)
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
            
            Label("\(activity.durationMinutes) min", systemImage: "clock.fill")
                .font(.subheadline)
                .foregroundColor(.secondary)
            
            Text(activity.description)
                .font(.body)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
                .padding(.horizontal)
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(Color(.systemBackground))
        )
    }
    
    // MARK: - Goal
    private var goalSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            Label("Objetivo", systemImage: "star.fill")
                .font(.headline)
                .foregroundColor(activityColor)
            
            Text(activity.goal)
                .font(.body)
                .foregroundColor(.primary)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(activityColor.opacity(0.1))
                .overlay(
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(activityColor.opacity(0.3), lineWidth: 2)
                )
        )
    }
    
    // MARK: - Pasos
    private var stepsSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            Label("Pasos a seguir", systemImage: "list.number")
                .font(.headline)
                .foregroundColor(activityColor)
            
            ForEach(activity.steps.indices, id: \.self) { index in
                stepRow(index: index)
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(Color(.systemBackground))
        )
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
                        .stroke(completedSteps.contains(index) ? activityColor : Color(.systemGray4), lineWidth: 2)
                        .frame(width: 28, height: 28)
                    
                    if completedSteps.contains(index) {
                        Image(systemName: "checkmark")
                            .font(.caption)
                            .foregroundColor(activityColor)
                    } else {
                        Text("\(index + 1)")
                            .font(.caption)
                            .fontWeight(.semibold)
                            .foregroundColor(.secondary)
                    }
                }
                
                Text(activity.steps[index])
                    .font(.subheadline)
                    .foregroundColor(completedSteps.contains(index) ? .secondary : .primary)
                    .strikethrough(completedSteps.contains(index))
                    .multilineTextAlignment(.leading)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            .padding(.vertical, 8)
        }
        .buttonStyle(PlainButtonStyle())
    }
    
    // MARK: - Complete Button
    private var completeButton: some View {
        Button(action: {
            #if !os(macOS)
            UIImpactFeedbackGenerator(style: .medium).impactOccurred()
            #endif
            showingCompletion = true
        }) {
            HStack {
                Image(systemName: "checkmark.circle.fill")
                    .font(.title3)
                
                Text("Marcar como completada")
                    .font(.headline)
            }
            .foregroundColor(.white)
            .frame(maxWidth: .infinity)
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 16)
                    .fill(activityColor)
            )
        }
        .disabled(completedSteps.count < activity.steps.count)
        .opacity(completedSteps.count < activity.steps.count ? 0.5 : 1.0)
    }
    
    // MARK: - Helpers
    private var activityColor: Color {
        switch activity.color {
        case "orange": return .orange
        case "yellow": return .yellow
        case "teal": return .teal
        case "green": return .green
        case "red": return .red
        case "purple": return .purple
        default: return .blue
        }
    }
}

// MARK: - Preview
struct YesBrainActivityDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            YesBrainActivityDetailView(activity: Capa5Data.actividades[0])
        }
    }
}

