import SwiftUI

/// Vista de estadísticas y gráficos
struct BM9StatsView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 24) {
                Text("📊")
                    .font(.system(size: 60))
                
                Text("Estadísticas")
                    .font(.title)
                    .fontWeight(.bold)
                
                VStack(spacing: 20) {
                    BM9StatCard(title: "Total de Puntos", value: "0", icon: "star.fill", color: .yellow)
                    BM9StatCard(title: "Días Activos", value: "0", icon: "calendar.badge.checkmark", color: .blue)
                    BM9StatCard(title: "Racha Máxima", value: "0", icon: "flame.fill", color: .orange)
                    BM9StatCard(title: "Logros Desbloqueados", value: "0/20", icon: "trophy.fill", color: .mint)
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

