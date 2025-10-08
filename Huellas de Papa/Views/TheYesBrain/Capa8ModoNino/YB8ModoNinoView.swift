import SwiftUI

/// Vista principal de la Capa 8 - Modo Niño
struct YB8ModoNinoView: View {
    @State private var stories = YB8Data.createStories()
    @State private var games = YB8Data.createGames()
    @State private var scenes = YB8Data.createScenes()
    @State private var simulations = YB8Data.createSimulations()
    
    var body: some View {
        ScrollView {
            VStack(spacing: 32) {
                // Header
                headerSection
                
                // Stories Section
                storiesSection
                
                // Games Section
                gamesSection
                
                // Scenes Section
                scenesSection
                
                // Simulations Section
                simulationsSection
            }
            .padding()
        }
        .background(Color(.systemGroupedBackground).ignoresSafeArea())
        #if !os(macOS)
        .navigationBarTitleDisplayMode(.inline)
        #endif
    }
    
    // MARK: - Header
    private var headerSection: some View {
        VStack(spacing: 16) {
            Text("🌈")
                .font(.system(size: 60))
            
            Text("Ponte en su lugar")
                .font(.largeTitle)
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
                .foregroundStyle(
                    LinearGradient(
                        gradient: Gradient(colors: [.blue, .mint]),
                        startPoint: .leading,
                        endPoint: .trailing
                    )
                )
            
            Text("Vive el mundo como él lo siente")
                .font(.title3)
                .fontWeight(.medium)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
            
            Text("No pienses como adulto. Siente como tu hijo")
                .font(.subheadline)
                .foregroundColor(.blue)
                .italic()
                .multilineTextAlignment(.center)
        }
        .padding(.vertical)
    }
    
    // MARK: - Stories Section
    private var storiesSection: some View {
        VStack(alignment: .leading, spacing: 16) {
            Label("Cuentos del Cerebro Sí", systemImage: "book.fill")
                .font(.title2)
                .fontWeight(.semibold)
                .foregroundColor(.primary)
            
            Text("Historias narradas desde la voz de tu hijo")
                .font(.subheadline)
                .foregroundColor(.secondary)
            
            ForEach(stories, id: \.id) { story in
                NavigationLink(destination: YB8StoryDetailView(story: story)) {
                    YB8StoryCard(story: story)
                }
                .buttonStyle(PlainButtonStyle())
            }
        }
    }
    
    // MARK: - Games Section
    private var gamesSection: some View {
        VStack(alignment: .leading, spacing: 16) {
            Label("Juegos de Empatía", systemImage: "hand.raised.fill")
                .font(.title2)
                .fontWeight(.semibold)
                .foregroundColor(.primary)
            
            Text("Dinámicas para conectar desde la experiencia compartida")
                .font(.subheadline)
                .foregroundColor(.secondary)
            
            ForEach(games, id: \.id) { game in
                NavigationLink(destination: YB8GameDetailView(game: game)) {
                    YB8GameCard(game: game)
                }
                .buttonStyle(PlainButtonStyle())
            }
        }
    }
    
    // MARK: - Scenes Section
    private var scenesSection: some View {
        VStack(alignment: .leading, spacing: 16) {
            Label("Dramatizaciones Interactivas", systemImage: "theatermasks.fill")
                .font(.title2)
                .fontWeight(.semibold)
                .foregroundColor(.primary)
            
            Text("Escenas para practicar respuestas del Yes Brain")
                .font(.subheadline)
                .foregroundColor(.secondary)
            
            ForEach(scenes, id: \.id) { scene in
                NavigationLink(destination: YB8SceneDetailView(scene: scene)) {
                    YB8SceneCard(scene: scene)
                }
                .buttonStyle(PlainButtonStyle())
            }
        }
    }
    
    // MARK: - Simulations Section
    private var simulationsSection: some View {
        VStack(alignment: .leading, spacing: 16) {
            Label("Simulador Sensorial", systemImage: "sparkles")
                .font(.title2)
                .fontWeight(.semibold)
                .foregroundColor(.primary)
            
            Text("Experimenta cómo percibe el mundo tu hijo")
                .font(.subheadline)
                .foregroundColor(.secondary)
            
            ForEach(simulations, id: \.id) { simulation in
                NavigationLink(destination: YB8SimulationDetailView(simulation: simulation)) {
                    YB8SimulationCard(simulation: simulation)
                }
                .buttonStyle(PlainButtonStyle())
            }
        }
    }
}

// MARK: - Story Card
struct YB8StoryCard: View {
    let story: YB8Story
    
    var body: some View {
        HStack(spacing: 16) {
            Image(systemName: story.icon)
                .font(.title)
                .foregroundColor(emotionColor)
                .frame(width: 50, height: 50)
                .background(Circle().fill(emotionColor.opacity(0.2)))
            
            VStack(alignment: .leading, spacing: 4) {
                Text(story.title)
                    .font(.headline)
                    .foregroundColor(.primary)
                
                Text(story.emotion)
                    .font(.subheadline)
                    .foregroundColor(emotionColor)
                
                Text("\(story.duration) segundos")
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
            
            Spacer()
            
            Image(systemName: "chevron.right.circle.fill")
                .foregroundColor(emotionColor)
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(Color(.systemBackground))
                .overlay(
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(emotionColor.opacity(0.3), lineWidth: 2)
                )
        )
    }
    
    private var emotionColor: Color {
        switch story.color {
        case "red": return .red
        case "orange": return .orange
        case "yellow": return .yellow
        case "purple": return .purple
        default: return .blue
        }
    }
}

// MARK: - Game Card  
struct YB8GameCard: View {
    let game: YB8Game
    
    var body: some View {
        HStack(spacing: 16) {
            Image(systemName: game.icon)
                .font(.title)
                .foregroundColor(gameColor)
                .frame(width: 50, height: 50)
                .background(Circle().fill(gameColor.opacity(0.2)))
            
            VStack(alignment: .leading, spacing: 4) {
                Text(game.title)
                    .font(.headline)
                    .foregroundColor(.primary)
                
                Text(game.emotionTrained)
                    .font(.subheadline)
                    .foregroundColor(gameColor)
                
                Text("\(game.durationMinutes) minutos")
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
            
            Spacer()
            
            Image(systemName: "chevron.right.circle.fill")
                .foregroundColor(gameColor)
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(Color(.systemBackground))
                .overlay(
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(gameColor.opacity(0.3), lineWidth: 2)
                )
        )
    }
    
    private var gameColor: Color {
        switch game.color {
        case "yellow": return .yellow
        case "pink": return .pink
        case "blue": return .blue
        case "green": return .green
        default: return .blue
        }
    }
}

// MARK: - Scene Card
struct YB8SceneCard: View {
    let scene: YB8Scene
    
    var body: some View {
        HStack(spacing: 16) {
            Image(systemName: scene.icon)
                .font(.title)
                .foregroundColor(sceneColor)
                .frame(width: 50, height: 50)
                .background(Circle().fill(sceneColor.opacity(0.2)))
            
            VStack(alignment: .leading, spacing: 4) {
                Text(scene.title)
                    .font(.headline)
                    .foregroundColor(.primary)
                
                Text(scene.scenario)
                    .font(.caption)
                    .foregroundColor(.secondary)
                    .lineLimit(2)
            }
            
            Spacer()
            
            Image(systemName: "chevron.right.circle.fill")
                .foregroundColor(sceneColor)
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(Color(.systemBackground))
                .overlay(
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(sceneColor.opacity(0.3), lineWidth: 2)
                )
        )
    }
    
    private var sceneColor: Color {
        switch scene.color {
        case "purple": return .purple
        case "blue": return .blue
        case "indigo": return .indigo
        default: return .blue
        }
    }
}

// MARK: - Simulation Card
struct YB8SimulationCard: View {
    let simulation: YB8Simulation
    
    var body: some View {
        HStack(spacing: 16) {
            Image(systemName: simulation.icon)
                .font(.title)
                .foregroundColor(simulationColor)
                .frame(width: 50, height: 50)
                .background(Circle().fill(simulationColor.opacity(0.2)))
            
            VStack(alignment: .leading, spacing: 4) {
                Text(simulation.title)
                    .font(.headline)
                    .foregroundColor(.primary)
                
                Text(simulation.type)
                    .font(.subheadline)
                    .foregroundColor(simulationColor)
                
                Text("\(simulation.durationSeconds) segundos")
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
            
            Spacer()
            
            Image(systemName: "chevron.right.circle.fill")
                .foregroundColor(simulationColor)
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(Color(.systemBackground))
                .overlay(
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(simulationColor.opacity(0.3), lineWidth: 2)
                )
        )
    }
    
    private var simulationColor: Color {
        switch simulation.color {
        case "orange": return .orange
        case "red": return .red
        case "yellow": return .yellow
        case "purple": return .purple
        default: return .blue
        }
    }
}

// MARK: - Preview
struct YB8ModoNinoView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            YB8ModoNinoView()
        }
    }
}

