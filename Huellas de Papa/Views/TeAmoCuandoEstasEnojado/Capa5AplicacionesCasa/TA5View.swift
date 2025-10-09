import SwiftUI

/// Vista principal de la Capa 5 (Aplicación en Casa)
struct TA5View: View {
    @State private var selectedTab: Tab = .activities
    
    enum Tab {
        case activities, routines, reminders
    }
    
    var body: some View {
        ScrollView {
            VStack(spacing: 32) {
                headerSection
                tabSelectorSection
                
                if selectedTab == .activities {
                    activitiesSection
                } else if selectedTab == .routines {
                    routinesSection
                } else {
                    remindersSection
                }
                
                motivationalQuoteSection
            }
            .padding()
        }
        .background(Color(.systemGroupedBackground))
        .navigationTitle("Aplicación en Casa")
        .navigationBarTitleDisplayMode(.large)
    }
    
    private var headerSection: some View {
        VStack(spacing: 16) {
            Image(systemName: "house.fill")
                .font(.system(size: 60))
                .foregroundStyle(LinearGradient(colors: [.pink, .mint], startPoint: .topLeading, endPoint: .bottomTrailing))
            
            Text("Aplicación en Casa")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundStyle(LinearGradient(gradient: Gradient(colors: [.pink, .mint]), startPoint: .leading, endPoint: .trailing))
                .multilineTextAlignment(.center)
            
            Text("Lleva el amor incondicional a tu día a día")
                .font(.title3)
                .fontWeight(.medium)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
        }
        .padding(.vertical)
    }
    
    private var tabSelectorSection: some View {
        HStack(spacing: 12) {
            Button(action: { withAnimation(.spring()) { selectedTab = .activities } }) {
                TabContent(title: "Actividades", icon: "figure.play", isSelected: selectedTab == .activities)
            }
            
            Button(action: { withAnimation(.spring()) { selectedTab = .routines } }) {
                TabContent(title: "Rutinas", icon: "clock.fill", isSelected: selectedTab == .routines)
            }
            
            Button(action: { withAnimation(.spring()) { selectedTab = .reminders } }) {
                TabContent(title: "Recordatorios", icon: "bell.fill", isSelected: selectedTab == .reminders)
            }
        }
        .padding(.vertical)
    }
    
    private var activitiesSection: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("5 Actividades para Practicar")
                .font(.title2)
                .fontWeight(.semibold)
            
            VStack(spacing: 16) {
                ForEach(TA5Activity.allActivities) { activity in
                    NavigationLink(destination: TA5ActivityDetailView(activity: activity)) {
                        TA5ActivityCard(activity: activity)
                    }
                }
            }
        }
    }
    
    private var routinesSection: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("5 Rutinas Familiares")
                .font(.title2)
                .fontWeight(.semibold)
            
            VStack(spacing: 16) {
                ForEach(TA5Routine.allRoutines) { routine in
                    NavigationLink(destination: TA5RoutineDetailView(routine: routine)) {
                        TA5RoutineCard(routine: routine)
                    }
                }
            }
        }
    }
    
    private var remindersSection: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Recordatorios Diarios")
                .font(.title2)
                .fontWeight(.semibold)
            
            VStack(spacing: 16) {
                ForEach(TA5Reminder.allReminders) { reminder in
                    TA5ReminderCard(reminder: reminder)
                }
            }
        }
    }
    
    private var motivationalQuoteSection: some View {
        VStack(spacing: 20) {
            Image(systemName: "heart.circle.fill")
                .font(.largeTitle)
                .foregroundStyle(LinearGradient(colors: [.pink, .mint], startPoint: .topLeading, endPoint: .bottomTrailing))
            
            VStack(spacing: 12) {
                Text("\"Aprender sobre nuestras emociones es clave. Hablar de ellas con alguien de confianza puede ayudar.\"")
                    .font(.title3)
                    .fontWeight(.medium)
                    .foregroundColor(.primary)
                    .multilineTextAlignment(.center)
                    .italic()
                
                Text("— Erin Winters")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
            .padding(.vertical, 24)
            .padding(.horizontal, 20)
            .background(
                RoundedRectangle(cornerRadius: 16)
                    .fill(LinearGradient(gradient: Gradient(colors: [Color.pink.opacity(0.1), Color.mint.opacity(0.05)]), startPoint: .topLeading, endPoint: .bottomTrailing))
                    .overlay(RoundedRectangle(cornerRadius: 16).stroke(LinearGradient(gradient: Gradient(colors: [Color.pink.opacity(0.3), Color.mint.opacity(0.2)]), startPoint: .topLeading, endPoint: .bottomTrailing), lineWidth: 1))
            )
            .shadow(color: Color.pink.opacity(0.1), radius: 8, x: 0, y: 4)
        }
        .padding(.top)
    }
}

struct TabContent: View {
    let title: String
    let icon: String
    let isSelected: Bool
    
    var body: some View {
        VStack(spacing: 8) {
            Image(systemName: icon)
                .font(.title3)
            
            Text(title)
                .font(.caption)
                .fontWeight(.semibold)
        }
        .foregroundColor(isSelected ? .white : .pink)
        .frame(maxWidth: .infinity)
        .padding(.vertical, 12)
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(isSelected ? LinearGradient(colors: [.pink, .mint], startPoint: .topLeading, endPoint: .bottomTrailing) : LinearGradient(colors: [Color.pink.opacity(0.1), Color.mint.opacity(0.05)], startPoint: .topLeading, endPoint: .bottomTrailing))
        )
    }
}
