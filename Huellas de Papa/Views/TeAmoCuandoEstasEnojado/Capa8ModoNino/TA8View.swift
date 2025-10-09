import SwiftUI

/// Vista principal de la Capa 8 - Modo Niño
/// Contenido interactivo para que el niño explore
struct TA8View: View {
    @State private var selectedTab: Tab = .story
    
    enum Tab {
        case story, games, activities
    }
    
    var body: some View {
        ScrollView {
            VStack(spacing: 32) {
                headerSection
                tabSelectorSection
                
                if selectedTab == .story {
                    storySection
                } else if selectedTab == .games {
                    gamesSection
                } else {
                    activitiesSection
                }
            }
            .padding()
        }
        .background(
            LinearGradient(
                colors: [Color.pink.opacity(0.05), Color.mint.opacity(0.05)],
                startPoint: .top,
                endPoint: .bottom
            )
        )
        .navigationTitle("Modo Niño")
        .navigationBarTitleDisplayMode(.large)
    }
    
    private var headerSection: some View {
        VStack(spacing: 16) {
            Image(systemName: "heart.circle.fill")
                .font(.system(size: 80))
                .foregroundStyle(LinearGradient(colors: [.pink, .mint, .yellow], startPoint: .topLeading, endPoint: .bottomTrailing))
                .symbolEffect(.bounce, options: .repeat(2))
            
            Text("¡Hola! 👋")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundStyle(LinearGradient(colors: [.pink, .mint], startPoint: .leading, endPoint: .trailing))
            
            Text("¿Quieres jugar y aprender sobre emociones?")
                .font(.title3)
                .fontWeight(.medium)
                .foregroundColor(.primary)
                .multilineTextAlignment(.center)
        }
        .padding(.vertical)
    }
    
    private var tabSelectorSection: some View {
        HStack(spacing: 12) {
            Button(action: { withAnimation(.spring()) { selectedTab = .story } }) {
                ChildTabContent(title: "Cuento", icon: "book.fill", color: .pink, isSelected: selectedTab == .story)
            }
            
            Button(action: { withAnimation(.spring()) { selectedTab = .games } }) {
                ChildTabContent(title: "Juegos", icon: "gamecontroller.fill", color: .mint, isSelected: selectedTab == .games)
            }
            
            Button(action: { withAnimation(.spring()) { selectedTab = .activities } }) {
                ChildTabContent(title: "Actividades", icon: "paintbrush.fill", color: .yellow, isSelected: selectedTab == .activities)
            }
        }
    }
    
    private var storySection: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("📖 El Cuento")
                .font(.title2)
                .fontWeight(.bold)
            
            VStack(spacing: 16) {
                ForEach(TA8StoryChapter.allChapters) { chapter in
                    NavigationLink(destination: TA8StoryChapterView(chapter: chapter)) {
                        TA8StoryCard(chapter: chapter)
                    }
                }
            }
        }
    }
    
    private var gamesSection: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("🎮 Juegos Divertidos")
                .font(.title2)
                .fontWeight(.bold)
            
            VStack(spacing: 16) {
                ForEach(TA8Game.allGames) { game in
                    NavigationLink(destination: TA8GameDetailView(game: game)) {
                        TA8GameCard(game: game)
                    }
                }
            }
        }
    }
    
    private var activitiesSection: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("🎨 Actividades Creativas")
                .font(.title2)
                .fontWeight(.bold)
            
            VStack(spacing: 16) {
                ForEach(TA8Activity.allActivities) { activity in
                    NavigationLink(destination: TA8ActivityDetailView(activity: activity)) {
                        TA8ActivityCard(activity: activity)
                    }
                }
            }
        }
    }
}

struct ChildTabContent: View {
    let title: String
    let icon: String
    let color: Color
    let isSelected: Bool
    
    var body: some View {
        VStack(spacing: 8) {
            Image(systemName: icon)
                .font(.title2)
            
            Text(title)
                .font(.caption)
                .fontWeight(.bold)
        }
        .foregroundColor(isSelected ? .white : color)
        .frame(maxWidth: .infinity)
        .padding(.vertical, 16)
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(isSelected ? LinearGradient(colors: [color, color.opacity(0.7)], startPoint: .topLeading, endPoint: .bottomTrailing) : LinearGradient(colors: [color.opacity(0.1), color.opacity(0.05)], startPoint: .topLeading, endPoint: .bottomTrailing))
                .shadow(color: isSelected ? color.opacity(0.3) : .clear, radius: 8)
        )
    }
}

