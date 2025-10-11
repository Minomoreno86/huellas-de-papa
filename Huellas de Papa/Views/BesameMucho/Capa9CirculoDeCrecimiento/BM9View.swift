import SwiftUI

/// Vista principal de la Capa 9 (Círculo de Crecimiento) del módulo Bésame Mucho
/// Sistema de gamificación con logros, desafíos y seguimiento
struct BM9View: View {
    @AppStorage("BM_UserLevel") private var userLevel: Int = 1
    @AppStorage("BM_UserPoints") private var userPoints: Int = 0
    @AppStorage("BM_UserStreak") private var userStreak: Int = 0
    @AppStorage("BM_UnlockedAchievements") private var unlockedAchievements: Int = 0
    
    var body: some View {
        ScrollView {
            VStack(spacing: 32) {
                headerSection
                dashboardSection
                sectionsGridSection
            }
            .padding()
        }
        .background(
            LinearGradient(
                gradient: Gradient(colors: [
                    Color.yellow.opacity(0.1),
                    Color.orange.opacity(0.05),
                    Color.blue.opacity(0.05)
                ]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
        )
        .navigationTitle("Círculo de Crecimiento")
    }
    
    // MARK: - Header
    private var headerSection: some View {
        VStack(spacing: 16) {
            Image(systemName: "star.circle.fill")
                .font(.system(size: 60))
                .foregroundStyle(
                    LinearGradient(
                        colors: [.yellow, .orange],
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                )
            
            Text("Círculo de Crecimiento")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundStyle(
                    LinearGradient(
                        gradient: Gradient(colors: [.yellow, .orange]),
                        startPoint: .leading,
                        endPoint: .trailing
                    )
                )
            
            Text("Tu viaje hacia la crianza con apego")
                .font(.title3)
                .fontWeight(.medium)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
        }
        .padding(.vertical)
    }
    
    // MARK: - Dashboard
    private var dashboardSection: some View {
        VStack(spacing: 20) {
            // Nivel
            HStack {
                VStack(alignment: .leading, spacing: 8) {
                    Text("Nivel \(userLevel)")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.yellow)
                    
                    Text("\(userPoints) puntos")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
                
                Spacer()
                
                Image(systemName: "star.fill")
                    .font(.system(size: 50))
                    .foregroundColor(.yellow)
            }
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 16)
                    .fill(Color.yellow.opacity(0.1))
            )
            
            // Progreso circular
            ZStack {
                Circle()
                    .stroke(Color.secondary.opacity(0.2), lineWidth: 15)
                    .frame(width: 150, height: 150)
                
                Circle()
                    .trim(from: 0, to: Double(unlockedAchievements) / 20.0)
                    .stroke(
                        LinearGradient(
                            gradient: Gradient(colors: [.yellow, .orange]),
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        ),
                        style: StrokeStyle(lineWidth: 15, lineCap: .round)
                    )
                    .frame(width: 150, height: 150)
                    .rotationEffect(.degrees(-90))
                
                VStack {
                    Text("\(Int((Double(unlockedAchievements) / 20.0) * 100))%")
                        .font(.system(size: 32, weight: .bold))
                        .foregroundColor(.primary)
                    
                    Text("Completado")
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
            }
            .padding()
            
            // Racha
            HStack(spacing: 20) {
                VStack {
                    Image(systemName: "flame.fill")
                        .font(.largeTitle)
                        .foregroundColor(.orange)
                    Text("\(userStreak) días")
                        .font(.headline)
                        .foregroundColor(.primary)
                    Text("Racha")
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 12)
                        .fill(Color(.systemBackground))
                )
                
                VStack {
                    Image(systemName: "trophy.fill")
                        .font(.largeTitle)
                        .foregroundColor(.yellow)
                    Text("\(unlockedAchievements)/20")
                        .font(.headline)
                        .foregroundColor(.primary)
                    Text("Logros")
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 12)
                        .fill(Color(.systemBackground))
                )
            }
        }
    }
    
    // MARK: - Sections Grid
    private var sectionsGridSection: some View {
        VStack(spacing: 20) {
            NavigationLink(destination: BM9AchievementsView()) {
                GrowthSectionCard2(
                    icon: "trophy.fill",
                    title: "Logros",
                    description: "20 insignias desbloqueables",
                    color: .yellow
                )
            }
            
            NavigationLink(destination: BM9ChallengesView()) {
                GrowthSectionCard2(
                    icon: "target",
                    title: "Desafíos",
                    description: "Desafíos semanales renovables",
                    color: .orange
                )
            }
            
            NavigationLink(destination: BM9HabitTrackerView()) {
                GrowthSectionCard2(
                    icon: "calendar.badge.checkmark",
                    title: "Seguimiento Diario",
                    description: "Registra tus prácticas diarias",
                    color: .blue
                )
            }
            
            NavigationLink(destination: BM9JournalView()) {
                GrowthSectionCard2(
                    icon: "book.closed.fill",
                    title: "Diario de Reflexión",
                    description: "Reflexiona sobre tu progreso",
                    color: .purple
                )
            }
            
            NavigationLink(destination: BM9StatsView()) {
                GrowthSectionCard2(
                    icon: "chart.bar.fill",
                    title: "Estadísticas",
                    description: "Visualiza tu evolución",
                    color: .mint
                )
            }
        }
    }
}

// MARK: - Growth Section Card
struct GrowthSectionCard2: View {
    let icon: String
    let title: String
    let description: String
    let color: Color
    
    var body: some View {
        HStack(spacing: 20) {
            Image(systemName: icon)
                .font(.system(size: 40))
                .foregroundColor(color)
                .frame(width: 70, height: 70)
                .background(
                    Circle()
                        .fill(color.opacity(0.15))
                )
            
            VStack(alignment: .leading, spacing: 8) {
                Text(title)
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(.primary)
                
                Text(description)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                    .lineLimit(2)
                
                Text("Próximamente")
                    .font(.caption)
                    .foregroundColor(.orange)
                    .italic()
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
            Image(systemName: "chevron.right")
                .foregroundColor(color)
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 20)
                .fill(Color(.systemBackground))
                .shadow(color: color.opacity(0.2), radius: 10, x: 0, y: 5)
        )
    }
}

// MARK: - Preview
struct BM9View_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            BM9View()
        }
    }
}
