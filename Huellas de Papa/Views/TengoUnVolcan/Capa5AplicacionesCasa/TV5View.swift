import SwiftUI

/// Vista principal de la Capa 5 (Aplicación en Casa) del módulo "Tengo un Volcán"
/// Cómo implementar las herramientas en la vida diaria familiar
struct TV5View: View {
    @State private var checkedReminders: Set<UUID> = []
    
    var body: some View {
        ScrollView {
            VStack(spacing: 32) {
                // 1. Header
                headerSection
                
                // 2. Recordatorios diarios (Las 6 Básicas)
                remindersSection
                
                // 3. Rutinas familiares
                routinesSection
                
                // 4. Actividades del libro para casa
                activitiesSection
                
                // 5. Mensaje motivacional
                motivationalSection
            }
            .padding()
        }
        .navigationTitle("Aplicación en Casa")
        .navigationBarTitleDisplayMode(.large)
        .background(Color(.systemGroupedBackground))
    }
    
    // MARK: - Header
    private var headerSection: some View {
        VStack(spacing: 16) {
            ZStack {
                Circle()
                    .fill(
                        LinearGradient(
                            gradient: Gradient(colors: [.green.opacity(0.6), .mint.opacity(0.3)]),
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                    )
                    .frame(width: 100, height: 100)
                
                Image(systemName: "house.fill")
                    .font(.system(size: 40))
                    .foregroundColor(.white)
            }
            
            Text("Aplicación en Casa")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundStyle(
                    LinearGradient(
                        gradient: Gradient(colors: [.blue, .mint]),
                        startPoint: .leading,
                        endPoint: .trailing
                    )
                )
                .multilineTextAlignment(.center)
            
            Text("Lleva las herramientas del volcán a tu vida familiar diaria")
                .font(.title3)
                .fontWeight(.medium)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
        }
        .padding(.vertical)
    }
    
    // MARK: - Reminders Section
    private var remindersSection: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack {
                Image(systemName: "checklist")
                    .foregroundColor(.orange)
                    .font(.title2)
                
                Text("Las 6 Básicas de Hoy")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .foregroundColor(.primary)
            }
            
            Text("Del libro: 'Regar mi Jardín Interior' - Prevención diaria de volcanes")
                .font(.subheadline)
                .foregroundColor(.secondary)
                .italic()
            
            TV5ReminderView(checkedReminders: $checkedReminders)
        }
    }
    
    // MARK: - Routines Section
    private var routinesSection: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack {
                Image(systemName: "calendar.badge.clock")
                    .foregroundColor(.blue)
                    .font(.title2)
                
                Text("Rutinas Familiares")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .foregroundColor(.primary)
            }
            
            Text("Estructura diaria basada en las herramientas del libro")
                .font(.subheadline)
                .foregroundColor(.secondary)
            
            ForEach(TV5Data.routines) { routine in
                TV5RoutineCard(routine: routine)
            }
        }
    }
    
    // MARK: - Activities Section
    private var activitiesSection: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack {
                Image(systemName: "figure.play")
                    .foregroundColor(.purple)
                    .font(.title2)
                
                Text("Actividades para Casa")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .foregroundColor(.primary)
            }
            
            Text("De la guía pedagógica del libro, adaptadas para familia")
                .font(.subheadline)
                .foregroundColor(.secondary)
                .italic()
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 16) {
                    ForEach(TV5Data.activities) { activity in
                        TV5ActivityCard(activity: activity)
                    }
                }
                .padding(.horizontal, 4)
            }
        }
    }
    
    // MARK: - Motivational Section
    private var motivationalSection: some View {
        VStack(spacing: 16) {
            Image(systemName: "heart.circle.fill")
                .font(.system(size: 50))
                .foregroundColor(.pink)
            
            Text("Recuerda")
                .font(.title2)
                .fontWeight(.bold)
                .foregroundColor(.primary)
            
            Text("La consistencia en estas prácticas es más importante que la perfección. No todos los días saldrán bien. Habrá erupciones. Lo importante es seguir practicando, reparando y aprendiendo juntos.")
                .font(.body)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
                .lineSpacing(6)
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 16)
                        .fill(Color.pink.opacity(0.1))
                )
        }
        .padding(.vertical)
    }
}

#Preview {
    NavigationStack {
        TV5View()
    }
}

