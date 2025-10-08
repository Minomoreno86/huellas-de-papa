import SwiftUI

/// Tarjeta visual para mostrar una actividad de práctica
struct TV3ActivityCard: View {
    let activity: TV3Activity
    
    var body: some View {
        NavigationLink(destination: TV3ActivityDetailView(activity: activity)) {
            VStack(alignment: .leading, spacing: 16) {
                // Header
                HStack {
                    Image(systemName: activity.iconName)
                        .font(.title)
                        .foregroundColor(.purple)
                        .frame(width: 50, height: 50)
                        .background(
                            Circle()
                                .fill(Color.purple.opacity(0.2))
                        )
                    
                    Spacer()
                    
                    Image(systemName: "chevron.right")
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
                
                // Título
                Text(activity.title)
                    .font(.headline)
                    .fontWeight(.bold)
                    .foregroundColor(.primary)
                    .lineLimit(2)
                    .fixedSize(horizontal: false, vertical: true)
                
                // Descripción
                Text(activity.description)
                    .font(.caption)
                    .foregroundColor(.secondary)
                    .lineLimit(3)
                
                Spacer()
                
                // Info
                HStack {
                    Label(activity.durationMinutes, systemImage: "clock")
                        .font(.caption2)
                        .foregroundColor(.secondary)
                    
                    Spacer()
                    
                    Text(activity.ageRange)
                        .font(.caption2)
                        .foregroundColor(.purple)
                        .padding(.horizontal, 8)
                        .padding(.vertical, 4)
                        .background(
                            Capsule()
                                .fill(Color.purple.opacity(0.1))
                        )
                }
                
                // Herramienta relacionada
                HStack(spacing: 4) {
                    Image(systemName: "link")
                        .font(.caption2)
                        .foregroundColor(.mint)
                    
                    Text(activity.relatedTool)
                        .font(.caption2)
                        .foregroundColor(.mint)
                        .lineLimit(1)
                }
            }
            .padding()
            .frame(width: 280, height: 320)
            .background(
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color(.systemBackground))
                    .shadow(color: Color.black.opacity(0.1), radius: 10, x: 0, y: 4)
            )
        }
        .buttonStyle(PlainButtonStyle())
    }
}

#Preview {
    NavigationStack {
        ScrollView(.horizontal) {
            HStack {
                ForEach(TV3Data.activities) { activity in
                    TV3ActivityCard(activity: activity)
                }
            }
            .padding()
        }
    }
    .background(Color(.systemGroupedBackground))
}

