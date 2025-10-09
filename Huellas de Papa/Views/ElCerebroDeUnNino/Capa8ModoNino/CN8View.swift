import SwiftUI

/// Vista principal de la Capa 8 (Modo Niño)
/// Contenido para que el PADRE experimente el mundo desde la perspectiva del hijo
struct CN8View: View {
    @State private var selectedStory: CN8Story?
    @State private var selectedSimulation: CN8Simulation?
    @State private var selectedGame: CN8EmpathyGame?
    @State private var showingStoryDetail = false
    @State private var showingSimulationDetail = false
    @State private var showingGameDetail = false
    
    var body: some View {
        ScrollView {
            VStack(spacing: 32) {
                // Header
                headerSection
                
                // Stories
                storiesSection
                
                // Simulations
                simulationsSection
                
                // Games
                gamesSection
                
                // Final Message
                finalMessageSection
            }
            .padding()
        }
        .background(Color(.systemGroupedBackground))
        .navigationTitle("Modo Niño")
        .navigationBarTitleDisplayMode(.large)
        .sheet(isPresented: $showingStoryDetail) {
            if let story = selectedStory {
                CN8StoryDetailView(story: story)
            }
        }
        .sheet(isPresented: $showingSimulationDetail) {
            if let simulation = selectedSimulation {
                CN8SimulationDetailView(simulation: simulation)
            }
        }
        .sheet(isPresented: $showingGameDetail) {
            if let game = selectedGame {
                CN8GameDetailView(game: game)
            }
        }
    }
    
    // MARK: - Header
    private var headerSection: some View {
        VStack(spacing: 16) {
            Text("👶🏻")
                .font(.system(size: 70))
            
            Text("Ponte en Sus Zapatos")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundStyle(
                    LinearGradient(
                        colors: [.blue, .mint],
                        startPoint: .leading,
                        endPoint: .trailing
                    )
                )
            
            Text("Experimenta el mundo desde la perspectiva cerebral de tu hijo")
                .font(.title3)
                .fontWeight(.medium)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
            
            Text("No pienses como adulto • Siente como niño • Desarrolla empatía profunda")
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
            Label("Historias desde Mi Voz", systemImage: "book.pages.fill")
                .font(.title2)
                .fontWeight(.semibold)
            
            Text("Narradas en primera persona - así veo yo el mundo")
                .font(.subheadline)
                .foregroundColor(.secondary)
            
            VStack(spacing: 12) {
                ForEach(cn8Stories) { story in
                    CN8StoryCard(story: story)
                        .onTapGesture {
                            selectedStory = story
                            showingStoryDetail = true
                        }
                }
            }
        }
    }
    
    // MARK: - Simulations Section
    private var simulationsSection: some View {
        VStack(alignment: .leading, spacing: 16) {
            Label("Experimenta Mi Cerebro", systemImage: "brain.head.profile.fill")
                .font(.title2)
                .fontWeight(.semibold)
            
            Text("Simulaciones para que SIENTAS (no solo entiendas) cómo funciona mi cerebro")
                .font(.subheadline)
                .foregroundColor(.secondary)
            
            VStack(spacing: 12) {
                ForEach(cn8Simulations) { simulation in
                    CN8SimulationCard(simulation: simulation)
                        .onTapGesture {
                            selectedSimulation = simulation
                            showingSimulationDetail = true
                        }
                }
            }
        }
    }
    
    // MARK: - Games Section
    private var gamesSection: some View {
        VStack(alignment: .leading, spacing: 16) {
            Label("Juegos de Empatía", systemImage: "gamecontroller.fill")
                .font(.title2)
                .fontWeight(.semibold)
            
            Text("Actividades para desarrollar empatía visceral, no solo intelectual")
                .font(.subheadline)
                .foregroundColor(.secondary)
            
            VStack(spacing: 12) {
                ForEach(cn8EmpathyGames) { game in
                    CN8GameCard(game: game)
                        .onTapGesture {
                            selectedGame = game
                            showingGameDetail = true
                        }
                }
            }
        }
    }
    
    // MARK: - Final Message
    private var finalMessageSection: some View {
        VStack(spacing: 16) {
            Image(systemName: "heart.circle.fill")
                .font(.system(size: 50))
                .foregroundColor(.pink)
            
            Text("La empatía profunda cambia todo")
                .font(.title2)
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
            
            Text("Cuando entiendes visceralmente (no solo intelectualmente) cómo vive tu hijo el mundo, tu paciencia se transforma. Sus berrinches tienen sentido. Sus miedos son reales. Sus limitaciones son biológicas, no actitud.")
                .font(.body)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
            
            Text("— Daniel J. Siegel")
                .font(.caption)
                .foregroundColor(.secondary)
                .italic()
        }
        .padding(24)
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(
                    LinearGradient(
                        colors: [Color.pink.opacity(0.1), Color.blue.opacity(0.05)],
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                )
        )
    }
}

// MARK: - Story Card
struct CN8StoryCard: View {
    let story: CN8Story
    
    var body: some View {
        HStack(spacing: 16) {
            VStack {
                Image(systemName: story.icon)
                    .font(.system(size: 30))
                    .foregroundColor(colorFromString(story.color))
                
                Text(story.age)
                    .font(.caption2)
                    .foregroundColor(.secondary)
            }
            .frame(width: 60)
            
            VStack(alignment: .leading, spacing: 6) {
                Text(story.title)
                    .font(.headline)
                    .fontWeight(.bold)
                
                Text(story.emotion)
                    .font(.subheadline)
                    .foregroundColor(colorFromString(story.color))
                
                Text("Toca para leer mi historia")
                    .font(.caption)
                    .foregroundColor(.secondary)
                    .italic()
            }
            
            Spacer()
            
            Image(systemName: "chevron.right.circle.fill")
                .foregroundColor(.blue.opacity(0.3))
                .font(.title2)
        }
        .padding(16)
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(Color(.systemBackground))
                .shadow(radius: 4)
        )
    }
    
    private func colorFromString(_ colorName: String) -> Color {
        switch colorName {
        case "red": return .red
        case "orange": return .orange
        case "indigo": return .indigo
        case "blue": return .blue
        case "gray": return .gray
        case "yellow": return .yellow
        default: return .blue
        }
    }
}

// MARK: - Simulation Card  
struct CN8SimulationCard: View {
    let simulation: CN8Simulation
    
    var body: some View {
        HStack(spacing: 16) {
            Image(systemName: simulation.icon)
                .font(.system(size: 40))
                .foregroundColor(colorFromString(simulation.color))
                .frame(width: 70)
            
            VStack(alignment: .leading, spacing: 6) {
                Text(simulation.title)
                    .font(.headline)
                    .fontWeight(.bold)
                
                Text(simulation.description)
                    .font(.caption)
                    .foregroundColor(.secondary)
                    .lineLimit(2)
            }
            
            Spacer()
            
            Image(systemName: "play.circle.fill")
                .foregroundColor(colorFromString(simulation.color))
                .font(.title)
        }
        .padding(16)
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(Color(.systemBackground))
                .shadow(radius: 4)
        )
    }
    
    private func colorFromString(_ colorName: String) -> Color {
        switch colorName {
        case "red": return .red
        case "pink": return .pink
        case "purple": return .purple
        default: return .blue
        }
    }
}

// MARK: - Game Card
struct CN8GameCard: View {
    let game: CN8EmpathyGame
    
    var body: some View {
        HStack(spacing: 16) {
            Image(systemName: game.icon)
                .font(.system(size: 40))
                .foregroundColor(colorFromString(game.color))
                .frame(width: 70)
            
            VStack(alignment: .leading, spacing: 6) {
                Text(game.title)
                    .font(.headline)
                    .fontWeight(.bold)
                
                HStack {
                    Label(game.ageGroup, systemImage: "person.fill")
                        .font(.caption)
                    Label(game.duration, systemImage: "clock")
                        .font(.caption)
                }
                .foregroundColor(.secondary)
            }
            
            Spacer()
            
            Image(systemName: "chevron.right.circle.fill")
                .foregroundColor(.blue.opacity(0.3))
                .font(.title2)
        }
        .padding(16)
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(Color(.systemBackground))
                .shadow(radius: 4)
        )
    }
    
    private func colorFromString(_ colorName: String) -> Color {
        switch colorName {
        case "blue": return .blue
        case "teal": return .teal
        case "orange": return .orange
        default: return .blue
        }
    }
}

// MARK: - Preview
struct CN8View_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            CN8View()
        }
    }
}

