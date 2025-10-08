import SwiftUI

/// Tarjeta visual para mostrar una rutina familiar
struct TV5RoutineCard: View {
    let routine: TV5Routine
    
    var body: some View {
        NavigationLink(destination: TV5RoutineDetailView(routine: routine)) {
            HStack(spacing: 16) {
                // Ícono con momento del día
                VStack(spacing: 4) {
                    Image(systemName: routine.iconName)
                        .font(.title)
                        .foregroundColor(timeColor)
                        .frame(width: 60, height: 60)
                        .background(
                            Circle()
                                .fill(timeColor.opacity(0.2))
                        )
                    
                    Text(routine.timeOfDay.rawValue)
                        .font(.caption2)
                        .foregroundColor(timeColor)
                        .fontWeight(.semibold)
                }
                
                // Contenido
                VStack(alignment: .leading, spacing: 8) {
                    Text(routine.title)
                        .font(.headline)
                        .fontWeight(.semibold)
                        .foregroundColor(.primary)
                        .lineLimit(2)
                        .fixedSize(horizontal: false, vertical: true)
                    
                    Text(routine.description)
                        .font(.caption)
                        .foregroundColor(.secondary)
                        .lineLimit(2)
                    
                    HStack(spacing: 12) {
                        Label(routine.durationMinutes, systemImage: "clock")
                            .font(.caption2)
                            .foregroundColor(.secondary)
                        
                        if !routine.toolsPracticed.isEmpty {
                            Label("\(routine.toolsPracticed.count) herramientas", systemImage: "wrench.and.screwdriver")
                                .font(.caption2)
                                .foregroundColor(.mint)
                        }
                    }
                }
                
                Spacer()
                
                Image(systemName: "chevron.right")
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 16)
                    .fill(Color(.systemBackground))
                    .shadow(color: Color.black.opacity(0.1), radius: 8, x: 0, y: 2)
            )
        }
        .buttonStyle(PlainButtonStyle())
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
}

#Preview {
    NavigationStack {
        ScrollView {
            VStack {
                ForEach(TV5Data.routines) { routine in
                    TV5RoutineCard(routine: routine)
                }
            }
            .padding()
        }
    }
    .background(Color(.systemGroupedBackground))
}

