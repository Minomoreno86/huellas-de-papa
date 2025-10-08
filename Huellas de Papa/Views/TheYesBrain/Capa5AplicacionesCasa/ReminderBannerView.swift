import SwiftUI

/// Banner que muestra un recordatorio o frase de uso doméstico
struct ReminderBannerView: View {
    let reminder: YesBrainReminder
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            // Ícono y contexto
            HStack(spacing: 8) {
                Image(systemName: reminder.icon)
                    .font(.title3)
                    .foregroundColor(reminderColor)
                
                Text(reminder.context)
                    .font(.caption)
                    .fontWeight(.semibold)
                    .foregroundColor(reminderColor)
            }
            
            // Frase
            Text(reminder.phrase)
                .font(.subheadline)
                .fontWeight(.medium)
                .foregroundColor(.primary)
                .multilineTextAlignment(.leading)
                .lineLimit(4)
            
            // Tono
            Text(reminder.tone)
                .font(.caption2)
                .foregroundColor(.secondary)
        }
        .padding()
        .frame(width: 280)
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(reminderColor.opacity(0.1))
                .overlay(
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(reminderColor.opacity(0.3), lineWidth: 2)
                )
        )
    }
    
    private var reminderColor: Color {
        switch reminder.color {
        case "orange": return .orange
        case "pink": return .pink
        case "teal": return .teal
        case "purple": return .purple
        case "blue": return .blue
        case "green": return .green
        case "mint": return .mint
        case "yellow": return .yellow
        case "indigo": return .indigo
        default: return .blue
        }
    }
}

// MARK: - Preview
struct ReminderBannerView_Previews: PreviewProvider {
    static var previews: some View {
        ScrollView(.horizontal) {
            HStack(spacing: 12) {
                ForEach(Capa5Data.recordatorios.prefix(3)) { reminder in
                    ReminderBannerView(reminder: reminder)
                }
            }
            .padding()
        }
        .background(Color(.systemGroupedBackground))
    }
}

