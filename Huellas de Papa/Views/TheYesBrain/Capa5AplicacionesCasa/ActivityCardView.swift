import SwiftUI

/// Tarjeta que presenta una actividad conjunta padre-hijo
struct YesBrainActivityCard: View {
    let activity: YesBrainActivity
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            // Ícono y título
            HStack(spacing: 12) {
                Image(systemName: activity.icon)
                    .font(.title2)
                    .foregroundColor(activityColor)
                    .frame(width: 40, height: 40)
                    .background(
                        Circle()
                            .fill(activityColor.opacity(0.2))
                    )
                
                VStack(alignment: .leading, spacing: 4) {
                    Text(activity.title)
                        .font(.headline)
                        .fontWeight(.bold)
                        .foregroundColor(.primary)
                        .lineLimit(2)
                    
                    Label("\(activity.durationMinutes) min", systemImage: "clock.fill")
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
            }
            
            // Descripción
            Text(activity.description)
                .font(.caption)
                .foregroundColor(.secondary)
                .lineLimit(3)
                .multilineTextAlignment(.leading)
            
            // Goal
            HStack(alignment: .top, spacing: 8) {
                Image(systemName: "star.fill")
                    .font(.caption2)
                    .foregroundColor(activityColor)
                
                Text(activity.goal)
                    .font(.caption2)
                    .foregroundColor(.primary)
                    .lineLimit(2)
            }
            .padding(8)
            .background(
                RoundedRectangle(cornerRadius: 8)
                    .fill(activityColor.opacity(0.1))
            )
            
            // Botón de acción
            HStack {
                Spacer()
                Image(systemName: "arrow.right.circle.fill")
                    .font(.title3)
                    .foregroundColor(activityColor)
            }
        }
        .padding()
        .frame(width: 260)
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(Color(.systemBackground))
                .overlay(
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(activityColor.opacity(0.3), lineWidth: 2)
                )
        )
        .shadow(
            color: activityColor.opacity(0.1),
            radius: 8,
            x: 0,
            y: 4
        )
    }
    
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
struct YesBrainActivityCard_Previews: PreviewProvider {
    static var previews: some View {
        ScrollView(.horizontal) {
            HStack(spacing: 12) {
                ForEach(Capa5Data.actividades.prefix(3)) { activity in
                    YesBrainActivityCard(activity: activity)
                }
            }
            .padding()
        }
        .background(Color(.systemGroupedBackground))
    }
}

