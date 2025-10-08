import SwiftUI

/// Vista de checklist interactivo para las 6 necesidades básicas
/// Basado en "Regar mi Jardín Interior" del libro
struct TV5ReminderView: View {
    @Binding var checkedReminders: Set<UUID>
    
    var body: some View {
        VStack(spacing: 12) {
            ForEach(TV5Data.reminders) { reminder in
                reminderRow(reminder)
            }
            
            // Indicador de progreso
            progressIndicator
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(Color(.systemBackground))
                .shadow(color: Color.black.opacity(0.1), radius: 8, x: 0, y: 2)
        )
    }
    
    private func reminderRow(_ reminder: TV5Reminder) -> some View {
        Button {
            withAnimation(.spring()) {
                if checkedReminders.contains(reminder.id) {
                    checkedReminders.remove(reminder.id)
                } else {
                    checkedReminders.insert(reminder.id)
                }
            }
        } label: {
            HStack(spacing: 12) {
                // Checkbox
                Image(systemName: checkedReminders.contains(reminder.id) ? "checkmark.circle.fill" : "circle")
                    .foregroundColor(checkedReminders.contains(reminder.id) ? .green : .gray)
                    .font(.title3)
                
                // Ícono de categoría
                Image(systemName: reminder.iconName)
                    .foregroundColor(categoryColor(reminder.category))
                    .frame(width: 30)
                
                // Pregunta
                VStack(alignment: .leading, spacing: 4) {
                    Text(reminder.question)
                        .font(.subheadline)
                        .fontWeight(.medium)
                        .foregroundColor(.primary)
                        .strikethrough(checkedReminders.contains(reminder.id))
                    
                    Text(reminder.category.rawValue)
                        .font(.caption2)
                        .foregroundColor(categoryColor(reminder.category))
                }
                
                Spacer()
                
                // Info button
                NavigationLink(destination: TV5ReminderDetailView(reminder: reminder)) {
                    Image(systemName: "info.circle")
                        .foregroundColor(.blue)
                        .font(.title3)
                }
            }
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 12)
                    .fill(checkedReminders.contains(reminder.id) ? Color.green.opacity(0.1) : Color(.systemBackground))
            )
        }
    }
    
    private var progressIndicator: some View {
        VStack(spacing: 12) {
            HStack {
                Text("Progreso de Hoy")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundColor(.primary)
                
                Spacer()
                
                Text("\(checkedReminders.count)/\(TV5Data.reminders.count)")
                    .font(.subheadline)
                    .fontWeight(.bold)
                    .foregroundColor(progressColor)
            }
            
            GeometryReader { geometry in
                ZStack(alignment: .leading) {
                    RoundedRectangle(cornerRadius: 8)
                        .fill(Color.gray.opacity(0.2))
                        .frame(height: 8)
                    
                    RoundedRectangle(cornerRadius: 8)
                        .fill(progressColor)
                        .frame(width: geometry.size.width * progressPercentage, height: 8)
                        .animation(.spring(), value: checkedReminders.count)
                }
            }
            .frame(height: 8)
            
            if checkedReminders.count == TV5Data.reminders.count {
                HStack {
                    Image(systemName: "star.fill")
                        .foregroundColor(.yellow)
                    Text("¡Jardín completo hoy! El volcán está bien regado")
                        .font(.caption)
                        .fontWeight(.semibold)
                        .foregroundColor(.green)
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(
                    RoundedRectangle(cornerRadius: 8)
                        .fill(Color.green.opacity(0.1))
                )
            }
        }
        .padding(.top, 8)
    }
    
    private var progressPercentage: CGFloat {
        guard !TV5Data.reminders.isEmpty else { return 0 }
        return CGFloat(checkedReminders.count) / CGFloat(TV5Data.reminders.count)
    }
    
    private var progressColor: Color {
        let percentage = Double(checkedReminders.count) / Double(TV5Data.reminders.count)
        if percentage == 1.0 {
            return .green
        } else if percentage >= 0.5 {
            return .orange
        } else {
            return .red
        }
    }
    
    private func categoryColor(_ category: TV5Reminder.PreventionCategory) -> Color {
        switch category {
        case .sleep: return .indigo
        case .nutrition: return .orange
        case .movement: return .green
        case .connection: return .pink
        case .calm: return .mint
        case .consistency: return .blue
        }
    }
}

/// Vista de detalle de un recordatorio
struct TV5ReminderDetailView: View {
    let reminder: TV5Reminder
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 24) {
                sectionCard(
                    icon: "questionmark.circle.fill",
                    title: "La Pregunta",
                    content: reminder.question,
                    color: .blue
                )
                
                sectionCard(
                    icon: "info.circle.fill",
                    title: "¿Por Qué Es Importante?",
                    content: reminder.why,
                    color: .orange
                )
                
                sectionCard(
                    icon: "wrench.and.screwdriver.fill",
                    title: "Cómo Implementarlo",
                    content: reminder.howToFix,
                    color: .green
                )
            }
            .padding()
        }
        .navigationTitle(reminder.category.rawValue)
        .background(Color(.systemGroupedBackground))
    }
    
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
}

#Preview {
    struct PreviewWrapper: View {
        @State private var checked: Set<UUID> = []
        
        var body: some View {
            ScrollView {
                TV5ReminderView(checkedReminders: $checked)
                    .padding()
            }
            .background(Color(.systemGroupedBackground))
        }
    }
    
    return PreviewWrapper()
}

