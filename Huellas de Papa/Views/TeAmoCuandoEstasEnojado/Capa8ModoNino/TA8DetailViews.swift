import SwiftUI

// MARK: - Story Chapter View
struct TA8StoryChapterView: View {
    let chapter: TA8StoryChapter
    
    var body: some View {
        ScrollView {
            VStack(spacing: 32) {
                // Ilustración grande
                Image(systemName: chapter.illustration)
                    .font(.system(size: 120))
                    .foregroundStyle(LinearGradient(colors: [.pink, .mint, .yellow], startPoint: .topLeading, endPoint: .bottomTrailing))
                    .padding(.top, 40)
                
                // Emoción
                Text(chapter.emotion)
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.pink)
                
                // Narrativa del cuento
                Text(chapter.narrative)
                    .font(.title3)
                    .foregroundColor(.primary)
                    .multilineTextAlignment(.center)
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 16).fill(Color(.systemBackground)))
                
                // Frase de amor
                VStack(spacing: 12) {
                    Image(systemName: "heart.fill")
                        .font(.largeTitle)
                        .foregroundColor(.pink)
                    
                    Text(chapter.lovePhrase)
                        .font(.title2)
                        .fontWeight(.bold)
                        .italic()
                        .foregroundStyle(LinearGradient(colors: [.pink, .mint], startPoint: .leading, endPoint: .trailing))
                        .multilineTextAlignment(.center)
                }
                .padding(.vertical, 24)
                .padding(.horizontal, 20)
                .background(
                    RoundedRectangle(cornerRadius: 20)
                        .fill(LinearGradient(colors: [Color.pink.opacity(0.15), Color.mint.opacity(0.1)], startPoint: .topLeading, endPoint: .bottomTrailing))
                )
                
                // Pregunta interactiva
                VStack(alignment: .leading, spacing: 12) {
                    HStack {
                        Image(systemName: "questionmark.circle.fill")
                            .foregroundColor(.mint)
                        
                        Text("Pregunta para ti")
                            .font(.headline)
                            .foregroundColor(.mint)
                    }
                    
                    Text(chapter.interactiveQuestion)
                        .font(.body)
                        .foregroundColor(.primary)
                }
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(RoundedRectangle(cornerRadius: 12).fill(Color.mint.opacity(0.1)))
            }
            .padding()
        }
        .background(LinearGradient(colors: [Color.pink.opacity(0.03), Color.mint.opacity(0.03)], startPoint: .top, endPoint: .bottom))
        .navigationTitle("Capítulo \(chapter.chapterNumber)")
        .navigationBarTitleDisplayMode(.inline)
    }
}

// MARK: - Game Detail View
struct TA8GameDetailView: View {
    let game: TA8Game
    
    var body: some View {
        ScrollView {
            VStack(spacing: 24) {
                // Header
                VStack(spacing: 16) {
                    Image(systemName: game.iconName)
                        .font(.system(size: 100))
                        .foregroundColor(Color(game.color))
                    
                    Text(game.title)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .multilineTextAlignment(.center)
                    
                    HStack(spacing: 4) {
                        ForEach(0..<5) { _ in
                            Image(systemName: "star.fill")
                                .foregroundColor(.yellow)
                        }
                    }
                }
                .padding(.top)
                
                // Descripción
                Text(game.gameDescription)
                    .font(.title3)
                    .foregroundColor(.primary)
                    .multilineTextAlignment(.center)
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 12).fill(Color(game.color).opacity(0.1)))
                
                // Cómo jugar
                VStack(alignment: .leading, spacing: 16) {
                    Label("Cómo Jugar", systemImage: "play.circle.fill")
                        .font(.headline)
                        .foregroundColor(Color(game.color))
                    
                    VStack(alignment: .leading, spacing: 12) {
                        ForEach(Array(game.instructions.enumerated()), id: \.offset) { index, instruction in
                            HStack(alignment: .top, spacing: 12) {
                                Text("\(index + 1)")
                                    .font(.title3)
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                                    .frame(width: 32, height: 32)
                                    .background(Circle().fill(Color(game.color)))
                                
                                Text(instruction)
                                    .font(.body)
                                    .foregroundColor(.primary)
                            }
                        }
                    }
                }
                .padding()
                .background(RoundedRectangle(cornerRadius: 16).fill(Color(.systemBackground)))
                
                // Info
                HStack(spacing: 16) {
                    InfoBubble(icon: "clock.fill", text: "\(game.durationMinutes) min", color: .mint)
                    InfoBubble(icon: "figure.child", text: game.ageRange, color: .pink)
                }
            }
            .padding()
        }
        .background(LinearGradient(colors: [Color(game.color).opacity(0.05), .white], startPoint: .top, endPoint: .bottom))
        .navigationTitle("Juego")
        .navigationBarTitleDisplayMode(.inline)
    }
}

// MARK: - Activity Detail View
struct TA8ActivityDetailView: View {
    let activity: TA8Activity
    
    var body: some View {
        ScrollView {
            VStack(spacing: 24) {
                // Header
                VStack(spacing: 16) {
                    Image(systemName: activity.iconName)
                        .font(.system(size: 100))
                        .foregroundStyle(LinearGradient(colors: [.pink, .yellow], startPoint: .topLeading, endPoint: .bottomTrailing))
                    
                    Text(activity.title)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .multilineTextAlignment(.center)
                    
                    HStack(spacing: 2) {
                        ForEach(0..<activity.funFactor, id: \.self) { _ in
                            Image(systemName: "face.smiling.fill")
                                .font(.title3)
                                .foregroundColor(.yellow)
                        }
                    }
                }
                .padding(.top)
                
                // Descripción
                Text(activity.activityDescription)
                    .font(.title3)
                    .foregroundColor(.primary)
                    .multilineTextAlignment(.center)
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 12).fill(Color.pink.opacity(0.1)))
                
                // Materiales
                if !activity.materials.isEmpty {
                    VStack(alignment: .leading, spacing: 12) {
                        Label("Necesitas", systemImage: "bag.fill")
                            .font(.headline)
                            .foregroundColor(.mint)
                        
                        VStack(alignment: .leading, spacing: 8) {
                            ForEach(activity.materials, id: \.self) { material in
                                HStack {
                                    Image(systemName: "checkmark.circle.fill")
                                        .foregroundColor(.mint)
                                    
                                    Text(material)
                                        .font(.body)
                                }
                            }
                        }
                    }
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(RoundedRectangle(cornerRadius: 12).fill(Color.mint.opacity(0.1)))
                }
                
                // Pasos
                VStack(alignment: .leading, spacing: 16) {
                    Label("Pasos", systemImage: "list.number")
                        .font(.headline)
                        .foregroundColor(.pink)
                    
                    VStack(alignment: .leading, spacing: 12) {
                        ForEach(Array(activity.steps.enumerated()), id: \.offset) { index, step in
                            HStack(alignment: .top, spacing: 12) {
                                Text("\(index + 1)")
                                    .font(.title3)
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                                    .frame(width: 32, height: 32)
                                    .background(Circle().fill(LinearGradient(colors: [.pink, .yellow], startPoint: .topLeading, endPoint: .bottomTrailing)))
                                
                                Text(step)
                                    .font(.body)
                                    .foregroundColor(.primary)
                            }
                        }
                    }
                }
                .padding()
                .background(RoundedRectangle(cornerRadius: 16).fill(Color(.systemBackground)))
            }
            .padding()
        }
        .background(LinearGradient(colors: [Color.pink.opacity(0.05), Color.yellow.opacity(0.05)], startPoint: .top, endPoint: .bottom))
        .navigationTitle("Actividad")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct InfoBubble: View {
    let icon: String
    let text: String
    let color: Color
    
    var body: some View {
        HStack(spacing: 8) {
            Image(systemName: icon)
            Text(text)
        }
        .font(.subheadline)
        .fontWeight(.semibold)
        .foregroundColor(.white)
        .padding(.horizontal, 16)
        .padding(.vertical, 8)
        .background(Capsule().fill(color))
    }
}

