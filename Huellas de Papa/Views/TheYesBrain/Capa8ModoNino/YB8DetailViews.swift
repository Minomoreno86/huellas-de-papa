import SwiftUI

// MARK: - Story Detail View
struct YB8StoryDetailView: View {
    let story: YB8Story
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ScrollView {
            VStack(spacing: 24) {
                Image(systemName: story.icon)
                    .font(.system(size: 60))
                    .foregroundColor(storyColor)
                
                Text(story.title)
                    .font(.title)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                
                Text(story.emotion)
                    .font(.headline)
                    .foregroundColor(storyColor)
                    .padding(.horizontal, 16)
                    .padding(.vertical, 8)
                    .background(RoundedRectangle(cornerRadius: 20).fill(storyColor.opacity(0.2)))
                
                Text(story.narrative)
                    .font(.body)
                    .foregroundColor(.primary)
                    .multilineTextAlignment(.leading)
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 16).fill(Color(.systemBackground)))
                
                VStack(alignment: .leading, spacing: 12) {
                    Label("Aprendizaje", systemImage: "lightbulb.fill")
                        .font(.headline)
                        .foregroundColor(storyColor)
                    
                    Text(story.moral)
                        .font(.body)
                        .italic()
                        .foregroundColor(.primary)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
                .background(RoundedRectangle(cornerRadius: 16).fill(storyColor.opacity(0.1)))
            }
            .padding()
        }
        .background(Color(.systemGroupedBackground).ignoresSafeArea())
        #if !os(macOS)
        .navigationBarTitleDisplayMode(.inline)
        #endif
    }
    
    private var storyColor: Color {
        switch story.color {
        case "red": return .red
        case "orange": return .orange
        case "yellow": return .yellow
        case "purple": return .purple
        default: return .blue
        }
    }
}

// MARK: - Game Detail View
struct YB8GameDetailView: View {
    let game: YB8Game
    @State private var completedSteps: Set<Int> = []
    
    var body: some View {
        ScrollView {
            VStack(spacing: 24) {
                Image(systemName: game.icon)
                    .font(.system(size: 60))
                    .foregroundColor(gameColor)
                
                Text(game.title)
                    .font(.title)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                
                Text(game.gameDescription)
                    .font(.body)
                    .foregroundColor(.secondary)
                    .multilineTextAlignment(.center)
                    .padding()
                
                VStack(alignment: .leading, spacing: 16) {
                    Label("Pasos a seguir", systemImage: "list.number")
                        .font(.headline)
                        .foregroundColor(.primary)
                    
                    ForEach(game.steps.indices, id: \.self) { index in
                        stepRow(index: index)
                    }
                }
                .padding()
                .background(RoundedRectangle(cornerRadius: 16).fill(Color(.systemBackground)))
            }
            .padding()
        }
        .background(Color(.systemGroupedBackground).ignoresSafeArea())
        #if !os(macOS)
        .navigationBarTitleDisplayMode(.inline)
        #endif
    }
    
    private func stepRow(index: Int) -> some View {
        Button(action: {
            withAnimation {
                if completedSteps.contains(index) {
                    completedSteps.remove(index)
                } else {
                    completedSteps.insert(index)
                    #if !os(macOS)
                    UIImpactFeedbackGenerator(style: .light).impactOccurred()
                    #endif
                }
            }
        }) {
            HStack(alignment: .top, spacing: 12) {
                ZStack {
                    Circle()
                        .stroke(completedSteps.contains(index) ? gameColor : Color(.systemGray4), lineWidth: 2)
                        .frame(width: 28, height: 28)
                    
                    if completedSteps.contains(index) {
                        Image(systemName: "checkmark")
                            .font(.caption)
                            .foregroundColor(gameColor)
                    } else {
                        Text("\(index + 1)")
                            .font(.caption)
                            .foregroundColor(.secondary)
                    }
                }
                
                Text(game.steps[index])
                    .font(.subheadline)
                    .foregroundColor(completedSteps.contains(index) ? .secondary : .primary)
                    .strikethrough(completedSteps.contains(index))
                    .multilineTextAlignment(.leading)
            }
        }
        .buttonStyle(PlainButtonStyle())
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

// MARK: - Scene Detail View
struct YB8SceneDetailView: View {
    let scene: YB8Scene
    @State private var currentLine = 0
    
    var body: some View {
        ScrollView {
            VStack(spacing: 24) {
                Image(systemName: scene.icon)
                    .font(.system(size: 60))
                    .foregroundColor(sceneColor)
                
                Text(scene.title)
                    .font(.title)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                
                Text(scene.scenario)
                    .font(.body)
                    .foregroundColor(.secondary)
                    .multilineTextAlignment(.center)
                    .padding()
                
                VStack(spacing: 16) {
                    ForEach(0..<max(scene.roleParent.count, scene.roleChild.count), id: \.self) { index in
                        VStack(spacing: 12) {
                            if index < scene.roleParent.count {
                                dialogueBubble(text: scene.roleParent[index], isParent: true)
                            }
                            if index < scene.roleChild.count {
                                dialogueBubble(text: scene.roleChild[index], isParent: false)
                            }
                        }
                    }
                }
                
                VStack(alignment: .leading, spacing: 12) {
                    Label("Aprendizaje", systemImage: "lightbulb.fill")
                        .font(.headline)
                        .foregroundColor(sceneColor)
                    
                    Text(scene.learning)
                        .font(.body)
                        .foregroundColor(.primary)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
                .background(RoundedRectangle(cornerRadius: 16).fill(sceneColor.opacity(0.1)))
            }
            .padding()
        }
        .background(Color(.systemGroupedBackground).ignoresSafeArea())
        #if !os(macOS)
        .navigationBarTitleDisplayMode(.inline)
        #endif
    }
    
    private func dialogueBubble(text: String, isParent: Bool) -> some View {
        HStack {
            if isParent { Spacer() }
            
            VStack(alignment: isParent ? .trailing : .leading, spacing: 4) {
                Text(isParent ? "Padre" : "Niño")
                    .font(.caption)
                    .foregroundColor(.secondary)
                
                Text(text)
                    .font(.body)
                    .foregroundColor(isParent ? .white : .primary)
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 16)
                            .fill(isParent ? sceneColor : Color(.systemGray6))
                    )
            }
            .frame(maxWidth: .infinity * 0.75, alignment: isParent ? .trailing : .leading)
            
            if !isParent { Spacer() }
        }
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

// MARK: - Simulation Detail View
struct YB8SimulationDetailView: View {
    let simulation: YB8Simulation
    @State private var isRunning = false
    @State private var showInsight = false
    
    var body: some View {
        ZStack {
            Color(.systemGroupedBackground).ignoresSafeArea()
            
            VStack(spacing: 24) {
                if !isRunning {
                    Image(systemName: simulation.icon)
                        .font(.system(size: 60))
                        .foregroundColor(simulationColor)
                    
                    Text(simulation.title)
                        .font(.title)
                        .fontWeight(.bold)
                        .multilineTextAlignment(.center)
                    
                    Text(simulation.simulationDescription)
                        .font(.body)
                        .foregroundColor(.secondary)
                        .multilineTextAlignment(.center)
                        .padding()
                    
                    Button(action: {
                        startSimulation()
                    }) {
                        HStack {
                            Image(systemName: "play.circle.fill")
                            Text("Iniciar simulación")
                                .fontWeight(.semibold)
                        }
                        .foregroundColor(.white)
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 16).fill(simulationColor))
                    }
                } else if !showInsight {
                    Text("Experimenta...")
                        .font(.title)
                        .foregroundColor(simulationColor)
                } else {
                    VStack(spacing: 20) {
                        Image(systemName: "checkmark.circle.fill")
                            .font(.system(size: 60))
                            .foregroundColor(.green)
                        
                        Text("Insight")
                            .font(.title)
                            .fontWeight(.bold)
                        
                        Text(simulation.insight)
                            .font(.body)
                            .foregroundColor(.primary)
                            .multilineTextAlignment(.center)
                            .padding()
                            .background(RoundedRectangle(cornerRadius: 16).fill(Color(.systemBackground)))
                    }
                }
            }
            .padding()
        }
        #if !os(macOS)
        .navigationBarTitleDisplayMode(.inline)
        #endif
    }
    
    private func startSimulation() {
        isRunning = true
        #if !os(macOS)
        UIImpactFeedbackGenerator(style: .medium).impactOccurred()
        #endif
        
        DispatchQueue.main.asyncAfter(deadline: .now() + Double(simulation.durationSeconds)) {
            showInsight = true
        }
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

