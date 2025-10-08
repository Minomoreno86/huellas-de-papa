import SwiftUI

/// Vista detallada de una rutina con pasos y reflexión
struct RoutineDetailView: View {
    let rutina: YesBrainRoutineCasa
    @Environment(\.dismiss) var dismiss
    @State private var completedSteps: Set<Int> = []
    @State private var showingCompletion = false
    
    var body: some View {
        ScrollView {
            VStack(spacing: 24) {
                // Header
                headerSection
                
                // Objetivo
                objetivoSection
                
                // Materiales (si existen)
                if let materials = rutina.materials, !materials.isEmpty {
                    materialsSection(materials)
                }
                
                // Pasos
                stepsSection
                
                // Reflexión
                reflexionSection
                
                // Botón de completar
                completeButton
            }
            .padding()
        }
        .background(Color(.systemGroupedBackground).ignoresSafeArea())
        .navigationTitle(rutina.title)
        #if !os(macOS)
        .navigationBarTitleDisplayMode(.inline)
        #endif
        .alert("¡Rutina completada!", isPresented: $showingCompletion) {
            Button("Continuar", role: .cancel) {
                dismiss()
            }
        } message: {
            Text("Has entrenado el cerebro Sí de tu familia. \(rutina.reflectionCue)")
        }
    }
    
    // MARK: - Header
    private var headerSection: some View {
        VStack(spacing: 16) {
            Image(systemName: rutina.icon)
                .font(.system(size: 60))
                .foregroundStyle(
                    LinearGradient(
                        colors: [routineColor, routineColor.opacity(0.6)],
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                )
            
            Text(rutina.title)
                .font(.title)
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
            
            HStack(spacing: 16) {
                Label("\(rutina.durationMinutes) min", systemImage: "clock.fill")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                
                Label(rutina.context, systemImage: contextIcon)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
            
            Text(rutina.description)
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
    
    // MARK: - Objetivo
    private var objetivoSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            Label("Objetivo neuroemocional", systemImage: "target")
                .font(.headline)
                .foregroundColor(routineColor)
            
            Text(rutina.objective)
                .font(.body)
                .foregroundColor(.primary)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(routineColor.opacity(0.1))
                .overlay(
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(routineColor.opacity(0.3), lineWidth: 2)
                )
        )
    }
    
    // MARK: - Materiales
    private func materialsSection(_ materials: [String]) -> some View {
        VStack(alignment: .leading, spacing: 12) {
            Label("Materiales necesarios", systemImage: "list.bullet.rectangle")
                .font(.headline)
                .foregroundColor(routineColor)
            
            ForEach(materials.indices, id: \.self) { index in
                HStack(spacing: 8) {
                    Image(systemName: "checkmark.circle.fill")
                        .foregroundColor(routineColor)
                    
                    Text(materials[index])
                        .font(.subheadline)
                }
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(Color(.systemBackground))
        )
    }
    
    // MARK: - Pasos
    private var stepsSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            Label("Pasos a seguir", systemImage: "list.number")
                .font(.headline)
                .foregroundColor(routineColor)
            
            ForEach(rutina.steps.indices, id: \.self) { index in
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
                        .stroke(completedSteps.contains(index) ? routineColor : Color(.systemGray4), lineWidth: 2)
                        .frame(width: 28, height: 28)
                    
                    if completedSteps.contains(index) {
                        Image(systemName: "checkmark")
                            .font(.caption)
                            .foregroundColor(routineColor)
                    } else {
                        Text("\(index + 1)")
                            .font(.caption)
                            .fontWeight(.semibold)
                            .foregroundColor(.secondary)
                    }
                }
                
                Text(rutina.steps[index])
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
    
    // MARK: - Reflexión
    private var reflexionSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            Label("Reflexión", systemImage: "lightbulb.fill")
                .font(.headline)
                .foregroundColor(routineColor)
            
            Text(rutina.reflectionCue)
                .font(.body)
                .italic()
                .foregroundColor(.primary)
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(
                    RoundedRectangle(cornerRadius: 12)
                        .fill(routineColor.opacity(0.1))
                )
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(Color(.systemBackground))
        )
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
                    .fill(routineColor)
            )
        }
        .disabled(completedSteps.count < rutina.steps.count)
        .opacity(completedSteps.count < rutina.steps.count ? 0.5 : 1.0)
    }
    
    // MARK: - Helpers
    private var routineColor: Color {
        switch rutina.color {
        case "orange": return .orange
        case "blue": return .blue
        case "pink": return .pink
        case "purple": return .purple
        case "green": return .green
        case "teal": return .teal
        case "yellow": return .yellow
        case "indigo": return .indigo
        default: return .blue
        }
    }
    
    private var contextIcon: String {
        switch rutina.context {
        case "Mañanas": return "sunrise.fill"
        case "Conflictos": return "exclamationmark.triangle.fill"
        case "Desconexión": return "arrow.uturn.backward.circle.fill"
        case "Reencuentros": return "figure.wave.circle.fill"
        case "Noche": return "moon.stars.fill"
        default: return "house.fill"
        }
    }
}

// MARK: - Preview
struct RoutineDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            RoutineDetailView(rutina: Capa5Data.rutinas[0])
        }
    }
}

