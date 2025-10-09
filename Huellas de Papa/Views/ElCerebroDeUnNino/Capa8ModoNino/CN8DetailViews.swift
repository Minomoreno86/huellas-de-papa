import SwiftUI

/// Vista de detalle para historia del niño
struct CN8StoryDetailView: View {
    let story: CN8Story
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 24) {
                    // Header
                    VStack(spacing: 16) {
                        Image(systemName: story.icon)
                            .font(.system(size: 60))
                            .foregroundColor(colorFromString(story.color))
                        
                        Text(story.title)
                            .font(.title)
                            .fontWeight(.bold)
                            .multilineTextAlignment(.center)
                        
                        HStack(spacing: 12) {
                            Text(story.age)
                                .font(.subheadline)
                                .padding(.horizontal, 12)
                                .padding(.vertical, 6)
                                .background(Capsule().fill(Color.gray.opacity(0.2)))
                            
                            Text(story.emotion)
                                .font(.subheadline)
                                .foregroundColor(colorFromString(story.color))
                                .padding(.horizontal, 12)
                                .padding(.vertical, 6)
                                .background(Capsule().fill(colorFromString(story.color).opacity(0.2)))
                        }
                    }
                    .frame(maxWidth: .infinity)
                    .padding(.vertical)
                    
                    // Child's Perspective
                    VStack(alignment: .leading, spacing: 12) {
                        Label("Mi Perspectiva", systemImage: "quote.bubble.fill")
                            .font(.headline)
                            .fontWeight(.semibold)
                            .foregroundColor(colorFromString(story.color))
                        
                        Text(story.childPerspective)
                            .font(.body)
                            .italic()
                            .foregroundColor(.primary)
                    }
                    .padding(20)
                    .background(
                        RoundedRectangle(cornerRadius: 16)
                            .fill(colorFromString(story.color).opacity(0.1))
                            .overlay(
                                RoundedRectangle(cornerRadius: 16)
                                    .stroke(colorFromString(story.color).opacity(0.3), lineWidth: 2)
                            )
                    )
                    
                    // Brain Explanation
                    VStack(alignment: .leading, spacing: 12) {
                        Label("Qué Pasa en Mi Cerebro", systemImage: "brain.head.profile")
                            .font(.headline)
                            .fontWeight(.semibold)
                            .foregroundColor(.blue)
                        
                        Text(story.whatsBrainDoing)
                            .font(.body)
                    }
                    .padding(16)
                    .background(
                        RoundedRectangle(cornerRadius: 12)
                            .fill(Color.blue.opacity(0.1))
                    )
                    
                    // What Child Needs
                    VStack(alignment: .leading, spacing: 12) {
                        Label("Lo Que Realmente Necesito", systemImage: "heart.fill")
                            .font(.headline)
                            .fontWeight(.semibold)
                            .foregroundColor(.pink)
                        
                        Text(story.whatChildNeeds)
                            .font(.body)
                    }
                    .padding(16)
                    .background(
                        RoundedRectangle(cornerRadius: 12)
                            .fill(Color.pink.opacity(0.1))
                    )
                    
                    // Parent Insight
                    VStack(alignment: .leading, spacing: 12) {
                        Label("Insight para Ti", systemImage: "lightbulb.fill")
                            .font(.headline)
                            .fontWeight(.semibold)
                            .foregroundColor(.orange)
                        
                        Text(story.parentInsight)
                            .font(.body)
                            .fontWeight(.medium)
                    }
                    .padding(16)
                    .background(
                        RoundedRectangle(cornerRadius: 12)
                            .fill(Color.orange.opacity(0.1))
                    )
                }
                .padding()
            }
            .background(Color(.systemGroupedBackground))
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Cerrar") {
                        dismiss()
                    }
                }
            }
        }
    }
    
    private func colorFromString(_ colorName: String) -> Color {
        switch colorName {
        case "red": return .red
        case "orange": return .orange
        case "indigo": return .indigo
        case "blue": return .blue
        case "gray": return .gray
        case "yellow": return .yellow
        case "pink": return .pink
        default: return .blue
        }
    }
}

/// Vista de detalle para simulación
struct CN8SimulationDetailView: View {
    let simulation: CN8Simulation
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 24) {
                    // Header
                    VStack(spacing: 16) {
                        Image(systemName: simulation.icon)
                            .font(.system(size: 60))
                            .foregroundColor(colorFromString(simulation.color))
                        
                        Text(simulation.title)
                            .font(.title)
                            .fontWeight(.bold)
                            .multilineTextAlignment(.center)
                    }
                    .frame(maxWidth: .infinity)
                    .padding(.vertical)
                    
                    // Description
                    Text(simulation.description)
                        .font(.body)
                        .foregroundColor(.secondary)
                        .multilineTextAlignment(.center)
                        .padding(16)
                        .background(
                            RoundedRectangle(cornerRadius: 12)
                                .fill(Color(.systemBackground))
                        )
                    
                    // Scenario
                    VStack(alignment: .leading, spacing: 12) {
                        Label("Escenario", systemImage: "theatermasks.fill")
                            .font(.headline)
                            .fontWeight(.semibold)
                        
                        Text(simulation.scenario)
                            .font(.body)
                    }
                    .padding(16)
                    .background(
                        RoundedRectangle(cornerRadius: 12)
                            .fill(Color.orange.opacity(0.1))
                    )
                    
                    // Instructions
                    VStack(alignment: .leading, spacing: 16) {
                        Label("Cómo Hacerlo", systemImage: "list.number")
                            .font(.headline)
                            .fontWeight(.semibold)
                        
                        ForEach(Array(simulation.instructions.enumerated()), id: \.offset) { index, instruction in
                            HStack(alignment: .top, spacing: 12) {
                                Text("\(index + 1)")
                                    .font(.headline)
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                                    .frame(width: 32, height: 32)
                                    .background(Circle().fill(colorFromString(simulation.color)))
                                
                                Text(instruction)
                                    .font(.body)
                                    .fixedSize(horizontal: false, vertical: true)
                            }
                        }
                    }
                    .padding(16)
                    .background(
                        RoundedRectangle(cornerRadius: 12)
                            .fill(Color(.systemBackground))
                    )
                    
                    // What You'll Feel
                    VStack(alignment: .leading, spacing: 12) {
                        Label("Qué Sentirás", systemImage: "心.fill")
                            .font(.headline)
                            .fontWeight(.semibold)
                            .foregroundColor(.pink)
                        
                        Text(simulation.whatYoullFeel)
                            .font(.body)
                    }
                    .padding(16)
                    .background(
                        RoundedRectangle(cornerRadius: 12)
                            .fill(Color.pink.opacity(0.1))
                    )
                    
                    // Parallel to Child
                    VStack(alignment: .leading, spacing: 12) {
                        Label("Paralelo con Tu Hijo", systemImage: "arrow.left.arrow.right")
                            .font(.headline)
                            .fontWeight(.semibold)
                            .foregroundColor(.blue)
                        
                        Text(simulation.parallelToChild)
                            .font(.body)
                    }
                    .padding(16)
                    .background(
                        RoundedRectangle(cornerRadius: 12)
                            .fill(Color.blue.opacity(0.1))
                    )
                    
                    // Insight
                    VStack(alignment: .leading, spacing: 12) {
                        Label("Insight Final", systemImage: "star.fill")
                            .font(.headline)
                            .fontWeight(.semibold)
                            .foregroundColor(.orange)
                        
                        Text(simulation.insight)
                            .font(.body)
                            .fontWeight(.medium)
                    }
                    .padding(16)
                    .background(
                        RoundedRectangle(cornerRadius: 12)
                            .fill(Color.orange.opacity(0.1))
                    )
                }
                .padding()
            }
            .background(Color(.systemGroupedBackground))
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Cerrar") {
                        dismiss()
                    }
                }
            }
        }
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

/// Vista de detalle para juego de empatía
struct CN8GameDetailView: View {
    let game: CN8EmpathyGame
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 24) {
                    // Header
                    VStack(spacing: 16) {
                        Image(systemName: game.icon)
                            .font(.system(size: 60))
                            .foregroundColor(colorFromString(game.color))
                        
                        Text(game.title)
                            .font(.title)
                            .fontWeight(.bold)
                            .multilineTextAlignment(.center)
                        
                        HStack(spacing: 12) {
                            Label(game.ageGroup, systemImage: "person.fill")
                                .font(.subheadline)
                            Label(game.duration, systemImage: "clock")
                                .font(.subheadline)
                        }
                        .foregroundColor(.secondary)
                    }
                    .frame(maxWidth: .infinity)
                    .padding(.vertical)
                    
                    // Objective
                    VStack(alignment: .leading, spacing: 12) {
                        Label("Objetivo", systemImage: "target")
                            .font(.headline)
                            .fontWeight(.semibold)
                        
                        Text(game.objective)
                            .font(.body)
                    }
                    .padding(16)
                    .background(
                        RoundedRectangle(cornerRadius: 12)
                            .fill(colorFromString(game.color).opacity(0.1))
                    )
                    
                    // Setup
                    VStack(alignment: .leading, spacing: 12) {
                        Label("Preparación", systemImage: "wrench.and.screwdriver.fill")
                            .font(.headline)
                            .fontWeight(.semibold)
                        
                        Text(game.setup)
                            .font(.body)
                    }
                    .padding(16)
                    .background(
                        RoundedRectangle(cornerRadius: 12)
                            .fill(Color(.systemBackground))
                    )
                    
                    // How to Play
                    VStack(alignment: .leading, spacing: 16) {
                        Label("Cómo Jugar", systemImage: "list.number")
                            .font(.headline)
                            .fontWeight(.semibold)
                        
                        ForEach(Array(game.howToPlay.enumerated()), id: \.offset) { index, step in
                            HStack(alignment: .top, spacing: 12) {
                                Text("\(index + 1)")
                                    .font(.headline)
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                                    .frame(width: 32, height: 32)
                                    .background(Circle().fill(colorFromString(game.color)))
                                
                                Text(step)
                                    .font(.body)
                                    .fixedSize(horizontal: false, vertical: true)
                            }
                        }
                    }
                    .padding(16)
                    .background(
                        RoundedRectangle(cornerRadius: 12)
                            .fill(Color(.systemBackground))
                    )
                    
                    // What You'll Learn
                    VStack(alignment: .leading, spacing: 12) {
                        Label("Qué Aprenderás", systemImage: "lightbulb.fill")
                            .font(.headline)
                            .fontWeight(.semibold)
                            .foregroundColor(.orange)
                        
                        Text(game.whatYoullLearn)
                            .font(.body)
                            .fontWeight(.medium)
                    }
                    .padding(16)
                    .background(
                        RoundedRectangle(cornerRadius: 12)
                            .fill(Color.orange.opacity(0.1))
                    )
                    
                    // Call to Action
                    VStack(spacing: 12) {
                        Text("💪 Prueba Este Juego")
                            .font(.headline)
                            .fontWeight(.semibold)
                        
                        Text("La empatía visceral (no solo intelectual) transformará completamente tu crianza. Dale una oportunidad real.")
                            .font(.body)
                            .foregroundColor(.secondary)
                            .multilineTextAlignment(.center)
                    }
                    .padding(20)
                    .frame(maxWidth: .infinity)
                    .background(
                        RoundedRectangle(cornerRadius: 16)
                            .fill(
                                LinearGradient(
                                    colors: [colorFromString(game.color).opacity(0.1), colorFromString(game.color).opacity(0.05)],
                                    startPoint: .topLeading,
                                    endPoint: .bottomTrailing
                                )
                            )
                    )
                }
                .padding()
            }
            .background(Color(.systemGroupedBackground))
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Cerrar") {
                        dismiss()
                    }
                }
            }
        }
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

