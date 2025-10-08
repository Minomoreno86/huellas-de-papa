import SwiftUI

/// Vista que muestra una rutina diaria con herramientas combinadas
struct RoutineCarouselView: View {
    let routine: YesBrainRoutine
    @State private var isExpanded: Bool = false
    
    var body: some View {
        Button(action: {
            withAnimation(.spring(response: 0.6, dampingFraction: 0.8)) {
                isExpanded.toggle()
            }
            triggerHaptic()
        }) {
            VStack(alignment: .leading, spacing: 16) {
                // Header
                HStack {
                    Image(systemName: routine.icon)
                        .font(.title2)
                        .foregroundColor(routineColor)
                        .frame(width: 32, height: 32)
                        .background(
                            Circle()
                                .fill(routineColor.opacity(0.1))
                        )
                    
                    VStack(alignment: .leading, spacing: 4) {
                        Text(routine.title)
                            .font(.headline)
                            .fontWeight(.bold)
                            .foregroundColor(.primary)
                            .multilineTextAlignment(.leading)
                        
                        Text(routine.category)
                            .font(.caption)
                            .fontWeight(.medium)
                            .padding(.horizontal, 8)
                            .padding(.vertical, 4)
                            .background(
                                RoundedRectangle(cornerRadius: 8)
                                    .fill(routineColor.opacity(0.2))
                            )
                            .foregroundColor(routineColor)
                    }
                    
                    Spacer()
                    
                    VStack(alignment: .trailing, spacing: 2) {
                        Text("\(routine.durationMinutes) min")
                            .font(.caption)
                            .fontWeight(.medium)
                            .foregroundColor(routineColor)
                        
                        if isExpanded {
                            Image(systemName: "chevron.up")
                                .font(.caption)
                                .foregroundColor(.secondary)
                        } else {
                            Image(systemName: "chevron.down")
                                .font(.caption)
                                .foregroundColor(.secondary)
                        }
                    }
                }
                
                // Description
                Text(routine.description)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                    .multilineTextAlignment(.leading)
                    .lineLimit(isExpanded ? nil : 2)
                
                // Tools count
                if !routine.tools.isEmpty {
                    HStack {
                        Image(systemName: "wrench.and.screwdriver")
                            .font(.caption)
                            .foregroundColor(.secondary)
                        
                        Text("\(routine.tools.count) herramienta\(routine.tools.count == 1 ? "" : "s")")
                            .font(.caption)
                            .foregroundColor(.secondary)
                        
                        Spacer()
                    }
                }
                
                // Expanded content
                if isExpanded {
                    VStack(alignment: .leading, spacing: 12) {
                        Divider()
                            .background(routineColor.opacity(0.3))
                        
                        Text("Herramientas incluidas:")
                            .font(.subheadline)
                            .fontWeight(.medium)
                            .foregroundColor(.primary)
                        
                        if !routine.tools.isEmpty {
                            Text("Esta rutina combina \(routine.tools.count) herramientas específicas para crear una experiencia completa de conexión y regulación.")
                                .font(.caption)
                                .foregroundColor(.secondary)
                                .multilineTextAlignment(.leading)
                        } else {
                            Text("Esta rutina está diseñada para aplicarse de manera flexible según las necesidades del momento.")
                                .font(.caption)
                                .foregroundColor(.secondary)
                                .multilineTextAlignment(.leading)
                        }
                        
                        // Action button
                        HStack {
                            Image(systemName: "play.circle.fill")
                                .font(.title3)
                                .foregroundColor(routineColor)
                            
                            Text("Comenzar rutina")
                                .font(.subheadline)
                                .fontWeight(.medium)
                                .foregroundColor(routineColor)
                            
                            Spacer()
                        }
                        .padding(.top, 8)
                    }
                    .transition(.opacity.combined(with: .scale))
                }
            }
            .padding()
            .frame(width: 300, alignment: .leading)
            .background(
                RoundedRectangle(cornerRadius: 16)
                    .fill(Color(.systemBackground))
                    .overlay(
                        RoundedRectangle(cornerRadius: 16)
                            .stroke(routineColor.opacity(0.3), lineWidth: 1)
                    )
            )
            .shadow(
                color: routineColor.opacity(0.1),
                radius: 6,
                x: 0,
                y: 3
            )
        }
        .buttonStyle(PlainButtonStyle())
    }
    
    private var routineColor: Color {
        switch routine.color {
        case "blue": return .blue
        case "green": return .green
        case "purple": return .purple
        case "pink": return .pink
        case "red": return .red
        case "orange": return .orange
        case "cyan": return .cyan
        case "yellow": return .yellow
        case "indigo": return .indigo
        case "teal": return .teal
        case "brown": return .brown
        case "mint": return .mint
        default: return .blue
        }
    }
    
    private func triggerHaptic() {
        #if !os(macOS)
        let impactFeedback = UIImpactFeedbackGenerator(style: .light)
        impactFeedback.impactOccurred()
        #endif
    }
}

// MARK: - Preview
struct RoutineCarouselView_Previews: PreviewProvider {
    static var previews: some View {
        let sampleRoutine = YesBrainRoutine(
            title: "Rutina de la Mañana con Cerebro Sí",
            description: "Comienza el día con conexión y regulación emocional",
            tools: [],
            durationMinutes: 10,
            category: "Mañana",
            icon: "sun.max",
            color: "yellow"
        )
        
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 16) {
                RoutineCarouselView(routine: sampleRoutine)
                
                RoutineCarouselView(routine: YesBrainRoutine(
                    title: "Rutina de Crisis",
                    description: "Herramientas de emergencia para momentos de alta activación emocional",
                    tools: [],
                    durationMinutes: 3,
                    category: "Crisis",
                    icon: "exclamationmark.triangle",
                    color: "red"
                ))
            }
            .padding()
        }
        .background(Color(.systemGroupedBackground))
    }
}
