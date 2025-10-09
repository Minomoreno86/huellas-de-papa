import SwiftUI

/// Vista principal de la Capa 6 - Plan de Entrenamiento
/// Sistema de niveles progresivos para el padre
struct TA6View: View {
    @State private var currentLevel = 1
    @State private var showingLevel: TA6Level?
    
    var body: some View {
        ScrollView {
            VStack(spacing: 32) {
                headerSection
                currentLevelSection
                allLevelsSection
                badgesSection
                statsSection
            }
            .padding()
        }
        .background(Color(.systemGroupedBackground))
        .navigationTitle("Plan de Entrenamiento")
        .navigationBarTitleDisplayMode(.large)
        .sheet(item: $showingLevel) { level in
            TA6LevelDetailView(level: level)
        }
    }
    
    private var headerSection: some View {
        VStack(spacing: 16) {
            Image(systemName: "figure.strengthtraining.traditional")
                .font(.system(size: 60))
                .foregroundStyle(LinearGradient(colors: [.pink, .mint], startPoint: .topLeading, endPoint: .bottomTrailing))
            
            Text("Entrenamiento del Padre")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundStyle(LinearGradient(colors: [.pink, .mint], startPoint: .leading, endPoint: .trailing))
                .multilineTextAlignment(.center)
            
            Text("Sistema de niveles progresivos en amor incondicional")
                .font(.title3)
                .fontWeight(.medium)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
        }
        .padding(.vertical)
    }
    
    private var currentLevelSection: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Tu Nivel Actual")
                .font(.title2)
                .fontWeight(.semibold)
            
            TA6CurrentLevelCard(level: TA6LevelData.createLevel1())
        }
    }
    
    private var allLevelsSection: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("5 Niveles de Maestría")
                .font(.title2)
                .fontWeight(.semibold)
            
            VStack(spacing: 16) {
                TA6LevelCard(level: TA6LevelData.createLevel1(), onTap: { showingLevel = TA6LevelData.createLevel1() })
                TA6LevelCard(level: TA6LevelData.createLevel2(), onTap: { showingLevel = TA6LevelData.createLevel2() })
                TA6LevelCard(level: TA6LevelData.createLevel3(), onTap: { showingLevel = TA6LevelData.createLevel3() })
                TA6LevelCard(level: TA6LevelData.createLevel4(), onTap: { showingLevel = TA6LevelData.createLevel4() })
                TA6LevelCard(level: TA6LevelData.createLevel5(), onTap: { showingLevel = TA6LevelData.createLevel5() })
            }
        }
    }
    
    private var badgesSection: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Insignias")
                .font(.title2)
                .fontWeight(.semibold)
            
            LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 16) {
                ForEach(TA6Badge.allBadges) { badge in
                    TA6BadgeCard(badge: badge)
                }
            }
        }
    }
    
    private var statsSection: some View {
        VStack(spacing: 20) {
            Image(systemName: "chart.bar.fill")
                .font(.largeTitle)
                .foregroundStyle(LinearGradient(colors: [.pink, .mint], startPoint: .topLeading, endPoint: .bottomTrailing))
            
            Text("Tu progreso se construye día a día con cada validación auténtica.")
                .font(.body)
                .foregroundColor(.primary)
                .multilineTextAlignment(.center)
                .padding()
                .background(RoundedRectangle(cornerRadius: 12).fill(Color.pink.opacity(0.1)))
        }
        .padding(.top)
    }
}

struct TA6CurrentLevelCard: View {
    let level: TA6Level
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack {
                Image(systemName: level.icon)
                    .font(.system(size: 50))
                    .foregroundStyle(LinearGradient(colors: [.pink, .mint], startPoint: .topLeading, endPoint: .bottomTrailing))
                
                VStack(alignment: .leading) {
                    Text("Nivel \(level.levelNumber)")
                        .font(.caption)
                        .foregroundColor(.mint)
                    
                    Text(level.title)
                        .font(.title2)
                        .fontWeight(.bold)
                }
                
                Spacer()
            }
            
            Text(level.mission)
                .font(.body)
                .foregroundColor(.primary)
            
            VStack(alignment: .leading, spacing: 8) {
                Label("Desafío Diario", systemImage: "target")
                    .font(.caption)
                    .foregroundColor(.pink)
                
                Text(level.dailyChallenge)
                    .font(.subheadline)
                    .foregroundColor(.primary)
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 8).fill(Color.pink.opacity(0.1)))
            }
        }
        .padding()
        .background(RoundedRectangle(cornerRadius: 16).fill(Color(.systemBackground)).shadow(color: Color.pink.opacity(0.2), radius: 12))
        .overlay(RoundedRectangle(cornerRadius: 16).stroke(LinearGradient(colors: [.pink, .mint], startPoint: .topLeading, endPoint: .bottomTrailing), lineWidth: 2))
    }
}

struct TA6LevelCard: View {
    let level: TA6Level
    let onTap: () -> Void
    
    var body: some View {
        Button(action: onTap) {
            HStack(spacing: 16) {
                Image(systemName: level.icon)
                    .font(.title)
                    .foregroundColor(.white)
                    .frame(width: 50, height: 50)
                    .background(Circle().fill(LinearGradient(colors: [.pink, .mint], startPoint: .topLeading, endPoint: .bottomTrailing)))
                
                VStack(alignment: .leading, spacing: 4) {
                    Text("Nivel \(level.levelNumber)")
                        .font(.caption)
                        .foregroundColor(.mint)
                    
                    Text(level.title)
                        .font(.headline)
                        .foregroundColor(.primary)
                    
                    Text(level.estimatedDays)
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
                
                Spacer()
                
                Image(systemName: "chevron.right")
                    .foregroundColor(.pink)
            }
            .padding()
            .background(RoundedRectangle(cornerRadius: 12).fill(Color(.systemBackground)))
            .overlay(RoundedRectangle(cornerRadius: 12).stroke(Color.pink.opacity(0.2), lineWidth: 1))
        }
    }
}

struct TA6BadgeCard: View {
    let badge: TA6Badge
    
    var body: some View {
        VStack(spacing: 12) {
            Image(systemName: badge.icon)
                .font(.largeTitle)
                .foregroundColor(badge.unlocked ? Color(badge.color) : .gray.opacity(0.3))
            
            Text(badge.name)
                .font(.caption)
                .fontWeight(.semibold)
                .foregroundColor(.primary)
                .multilineTextAlignment(.center)
                .lineLimit(2)
        }
        .frame(maxWidth: .infinity)
        .padding()
        .background(RoundedRectangle(cornerRadius: 12).fill(badge.unlocked ? Color(badge.color).opacity(0.1) : Color.gray.opacity(0.05)))
        .overlay(RoundedRectangle(cornerRadius: 12).stroke(badge.unlocked ? Color(badge.color).opacity(0.3) : Color.gray.opacity(0.2), lineWidth: 1))
        .grayscale(badge.unlocked ? 0 : 0.8)
    }
}

