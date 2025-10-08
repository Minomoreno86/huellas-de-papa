import SwiftUI

/// Vista principal de la Capa 8 (Modo Niño)
/// Contenido adaptado para que los niños lo disfruten
struct TV8View: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 32) {
                // Header infantil
                headerSection
                
                // El cuento de Alba
                storySection
                
                // Juegos
                gamesSection
                
                // Actividades creativas
                activitiesSection
            }
            .padding()
        }
        .navigationTitle("Modo Niño")
        .navigationBarTitleDisplayMode(.large)
        .background(
            LinearGradient(
                gradient: Gradient(colors: [Color.blue.opacity(0.1), Color.mint.opacity(0.1)]),
                startPoint: .top,
                endPoint: .bottom
            )
        )
    }
    
    // MARK: - Header
    private var headerSection: some View {
        VStack(spacing: 20) {
            // Hada grande
            ZStack {
                Circle()
                    .fill(
                        LinearGradient(
                            gradient: Gradient(colors: [.yellow, .orange]),
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                    )
                    .frame(width: 120, height: 120)
                
                Image(systemName: "sparkles")
                    .font(.system(size: 60))
                    .foregroundColor(.white)
            }
            
            Text("El Hada del Volcán")
                .font(.system(size: 36))
                .fontWeight(.bold)
                .foregroundStyle(
                    LinearGradient(
                        gradient: Gradient(colors: [.orange, .yellow]),
                        startPoint: .leading,
                        endPoint: .trailing
                    )
                )
            
            Text("¡Bienvenido/a! Aquí aprenderás sobre tu volcán")
                .font(.title3)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
        }
        .padding(.vertical)
    }
    
    // MARK: - Story Section
    private var storySection: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack {
                Image(systemName: "book.fill")
                    .foregroundColor(.purple)
                    .font(.largeTitle)
                
                Text("El Cuento de Alba")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.primary)
            }
            
            Text("La historia de una niña que descubrió su volcán")
                .font(.headline)
                .foregroundColor(.secondary)
            
            NavigationLink(destination: TV8StoryView()) {
                HStack {
                    Image(systemName: "play.circle.fill")
                        .font(.title)
                    
                    Text("Leer el Cuento")
                        .font(.title3)
                        .fontWeight(.semibold)
                    
                    Spacer()
                    
                    Image(systemName: "chevron.right")
                }
                .foregroundColor(.white)
                .padding(20)
                .background(
                    RoundedRectangle(cornerRadius: 20)
                        .fill(
                            LinearGradient(
                                gradient: Gradient(colors: [.purple, .pink]),
                                startPoint: .leading,
                                endPoint: .trailing
                            )
                        )
                )
            }
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 20)
                .fill(Color(.systemBackground))
                .shadow(color: Color.black.opacity(0.1), radius: 10, x: 0, y: 4)
        )
    }
    
    // MARK: - Games Section
    private var gamesSection: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack {
                Image(systemName: "gamecontroller.fill")
                    .foregroundColor(.green)
                    .font(.largeTitle)
                
                Text("Juegos Divertidos")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.primary)
            }
            
            ForEach(TV8Data.games) { game in
                gameCard(game)
            }
        }
    }
    
    private func gameCard(_ game: TV8Game) -> some View {
        NavigationLink(destination: TV8GameView(game: game)) {
            HStack(spacing: 16) {
                Image(systemName: game.iconName)
                    .font(.system(size: 40))
                    .foregroundColor(gameColor(game.color))
                    .frame(width: 70, height: 70)
                    .background(
                        Circle()
                            .fill(gameColor(game.color).opacity(0.2))
                    )
                
                VStack(alignment: .leading, spacing: 8) {
                    Text(game.title)
                        .font(.title3)
                        .fontWeight(.bold)
                        .foregroundColor(.primary)
                    
                    Text(game.description)
                        .font(.caption)
                        .foregroundColor(.secondary)
                        .lineLimit(2)
                    
                    HStack {
                        Image(systemName: "clock.fill")
                            .foregroundColor(.orange)
                        Text("\(game.durationMinutes) min")
                            .font(.caption)
                            .foregroundColor(.orange)
                    }
                }
                
                Spacer()
                
                Image(systemName: "play.circle.fill")
                    .font(.title)
                    .foregroundColor(gameColor(game.color))
            }
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 16)
                    .fill(Color(.systemBackground))
                    .shadow(color: Color.black.opacity(0.1), radius: 8, x: 0, y: 2)
            )
        }
        .buttonStyle(PlainButtonStyle())
    }
    
    private func gameColor(_ colorName: String) -> Color {
        switch colorName {
        case "purple": return .purple
        case "red": return .red
        case "mint": return .mint
        case "green": return .green
        default: return .blue
        }
    }
    
    // MARK: - Activities Section
    private var activitiesSection: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack {
                Image(systemName: "paintbrush.fill")
                    .foregroundColor(.orange)
                    .font(.largeTitle)
                
                Text("Actividades Creativas")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.primary)
            }
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 16) {
                    ForEach(TV8Data.activities) { activity in
                        activityCard(activity)
                    }
                }
                .padding(.horizontal, 4)
            }
        }
    }
    
    private func activityCard(_ activity: TV8Activity) -> some View {
        VStack(alignment: .leading, spacing: 12) {
            Image(systemName: activity.iconName)
                .font(.system(size: 40))
                .foregroundColor(.orange)
            
            Text(activity.title)
                .font(.headline)
                .fontWeight(.bold)
                .foregroundColor(.primary)
                .lineLimit(2)
                .fixedSize(horizontal: false, vertical: true)
            
            Text(activity.description)
                .font(.caption)
                .foregroundColor(.secondary)
                .lineLimit(3)
            
            Spacer()
            
            Text("👉 Toca para empezar")
                .font(.caption)
                .fontWeight(.semibold)
                .foregroundColor(.orange)
        }
        .padding()
        .frame(width: 200, height: 220)
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(Color(.systemBackground))
                .shadow(color: Color.black.opacity(0.1), radius: 8, x: 0, y: 2)
        )
    }
}

#Preview {
    NavigationStack {
        TV8View()
    }
}

