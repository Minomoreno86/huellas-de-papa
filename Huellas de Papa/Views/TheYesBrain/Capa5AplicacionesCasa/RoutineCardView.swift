import SwiftUI

/// Tarjeta que presenta una rutina familiar
struct RoutineCardView: View {
    let rutina: YesBrainRoutineCasa
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            // Header con ícono
            HStack(spacing: 12) {
                Image(systemName: rutina.icon)
                    .font(.title)
                    .foregroundColor(routineColor)
                    .frame(width: 50, height: 50)
                    .background(
                        Circle()
                            .fill(routineColor.opacity(0.15))
                    )
                
                VStack(alignment: .leading, spacing: 4) {
                    Text(rutina.title)
                        .font(.headline)
                        .fontWeight(.bold)
                        .foregroundColor(.primary)
                    
                    HStack(spacing: 8) {
                        Label("\(rutina.durationMinutes) min", systemImage: "clock.fill")
                            .font(.caption)
                            .foregroundColor(.secondary)
                        
                        Text("•")
                            .foregroundColor(.secondary)
                        
                        Text(rutina.context)
                            .font(.caption)
                            .fontWeight(.medium)
                            .padding(.horizontal, 8)
                            .padding(.vertical, 4)
                            .background(
                                RoundedRectangle(cornerRadius: 6)
                                    .fill(routineColor.opacity(0.2))
                            )
                            .foregroundColor(routineColor)
                    }
                }
                
                Spacer()
                
                Image(systemName: "chevron.right.circle.fill")
                    .font(.title2)
                    .foregroundColor(routineColor)
            }
            
            // Descripción
            Text(rutina.description)
                .font(.subheadline)
                .foregroundColor(.secondary)
                .lineLimit(3)
                .multilineTextAlignment(.leading)
            
            // Objetivo
            HStack(alignment: .top, spacing: 8) {
                Image(systemName: "target")
                    .font(.caption)
                    .foregroundColor(routineColor)
                
                Text(rutina.objective)
                    .font(.caption)
                    .foregroundColor(.primary)
                    .lineLimit(2)
            }
            .padding(10)
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .fill(routineColor.opacity(0.1))
            )
            
            // Pilares involucrados
            HStack(spacing: 8) {
                Image(systemName: "brain.head.profile")
                    .font(.caption)
                    .foregroundColor(.secondary)
                
                ForEach(rutina.pillarsInvolved, id: \.self) { pilar in
                    Text(pilar)
                        .font(.caption2)
                        .fontWeight(.medium)
                        .padding(.horizontal, 8)
                        .padding(.vertical, 4)
                        .background(
                            Capsule()
                                .fill(Color(.systemGray6))
                        )
                        .foregroundColor(.secondary)
                }
            }
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(Color(.systemBackground))
                .overlay(
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(routineColor.opacity(0.3), lineWidth: 2)
                )
        )
        .shadow(
            color: routineColor.opacity(0.1),
            radius: 8,
            x: 0,
            y: 4
        )
    }
    
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
}

// MARK: - Preview
struct RoutineCardView_Previews: PreviewProvider {
    static var previews: some View {
        ScrollView {
            VStack(spacing: 16) {
                ForEach(Capa5Data.rutinas.prefix(3)) { rutina in
                    RoutineCardView(rutina: rutina)
                }
            }
            .padding()
        }
        .background(Color(.systemGroupedBackground))
    }
}

