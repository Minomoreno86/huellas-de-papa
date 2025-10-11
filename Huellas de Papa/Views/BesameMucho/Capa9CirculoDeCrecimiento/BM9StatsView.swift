import SwiftUI

/// Vista de estadísticas y gráficos
struct BM9StatsView: View {
    @AppStorage("BM_UserLevel") private var userLevel: Int = 1
    @AppStorage("BM_UserPoints") private var userPoints: Int = 0
    @AppStorage("BM_UserStreak") private var userStreak: Int = 0
    @AppStorage("BM_UnlockedAchievements") private var unlockedAchievements: Int = 0
    @AppStorage("BM_TotalDaysActive") private var totalDaysActive: Int = 0
    @AppStorage("BM_JournalEntriesCount") private var journalEntriesCount: Int = 0
    
    var body: some View {
        ScrollView {
            VStack(spacing: 24) {
                Text("📊")
                    .font(.system(size: 60))
                
                Text("Estadísticas")
                    .font(.title)
                    .fontWeight(.bold)
                
                VStack(spacing: 20) {
                    BM9StatCard(title: "Total de Puntos", value: "\(userPoints)", icon: "star.fill", color: .yellow)
                    BM9StatCard(title: "Días Activos", value: "\(totalDaysActive)", icon: "calendar.badge.checkmark", color: .blue)
                    BM9StatCard(title: "Racha Actual", value: "\(userStreak)", icon: "flame.fill", color: .orange)
                    BM9StatCard(title: "Logros Desbloqueados", value: "\(unlockedAchievements)/20", icon: "trophy.fill", color: .mint)
                    BM9StatCard(title: "Nivel Actual", value: "Nivel \(userLevel)", icon: "star.circle.fill", color: .purple)
                    BM9StatCard(title: "Entradas de Diario", value: "\(journalEntriesCount)", icon: "book.closed.fill", color: .pink)
                }
                .padding()
            }
            .padding()
        }
        .background(Color(.systemGroupedBackground))
        .navigationTitle("Estadísticas")
    }
}

struct BM9StatCard: View {
    let title: String
    let value: String
    let icon: String
    let color: Color
    
    var body: some View {
        HStack(spacing: 20) {
            Image(systemName: icon)
                .font(.largeTitle)
                .foregroundColor(color)
            
            VStack(alignment: .leading, spacing: 4) {
                Text(title)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                Text(value)
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(.primary)
            }
            
            Spacer()
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(Color(.systemBackground))
                .shadow(color: color.opacity(0.2), radius: 8)
        )
    }
}

