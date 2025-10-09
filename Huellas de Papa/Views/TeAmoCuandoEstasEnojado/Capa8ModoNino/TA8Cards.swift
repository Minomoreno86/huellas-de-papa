import SwiftUI

// MARK: - Story Card
struct TA8StoryCard: View {
    let chapter: TA8StoryChapter
    
    var body: some View {
        HStack(spacing: 16) {
            Image(systemName: chapter.illustration)
                .font(.system(size: 40))
                .foregroundColor(.white)
                .frame(width: 70, height: 70)
                .background(Circle().fill(LinearGradient(colors: [.pink, .mint], startPoint: .topLeading, endPoint: .bottomTrailing)))
            
            VStack(alignment: .leading, spacing: 8) {
                Text("Capítulo \(chapter.chapterNumber)")
                    .font(.caption)
                    .foregroundColor(.mint)
                
                Text(chapter.title)
                    .font(.headline)
                    .fontWeight(.bold)
                    .foregroundColor(.primary)
                
                Text(chapter.lovePhrase)
                    .font(.subheadline)
                    .italic()
                    .foregroundColor(.pink)
                    .lineLimit(1)
            }
            
            Spacer()
            
            Image(systemName: "chevron.right.circle.fill")
                .font(.title2)
                .foregroundColor(.pink)
        }
        .padding()
        .background(RoundedRectangle(cornerRadius: 16).fill(Color(.systemBackground)).shadow(color: Color.pink.opacity(0.1), radius: 8))
        .overlay(RoundedRectangle(cornerRadius: 16).stroke(LinearGradient(colors: [.pink.opacity(0.3), .mint.opacity(0.2)], startPoint: .topLeading, endPoint: .bottomTrailing), lineWidth: 2))
    }
}

// MARK: - Game Card
struct TA8GameCard: View {
    let game: TA8Game
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                Image(systemName: game.iconName)
                    .font(.largeTitle)
                    .foregroundColor(.white)
                    .frame(width: 60, height: 60)
                    .background(Circle().fill(Color(game.color)))
                
                Spacer()
                
                Label("\(game.durationMinutes) min", systemImage: "clock.fill")
                    .font(.caption)
                    .foregroundColor(.mint)
            }
            
            Text(game.title)
                .font(.title3)
                .fontWeight(.bold)
                .foregroundColor(.primary)
            
            Text(game.gameDescription)
                .font(.subheadline)
                .foregroundColor(.secondary)
                .lineLimit(2)
            
            HStack(spacing: 4) {
                ForEach(0..<5) { index in
                    Image(systemName: "star.fill")
                        .font(.caption)
                        .foregroundColor(.yellow)
                }
            }
        }
        .padding()
        .background(RoundedRectangle(cornerRadius: 16).fill(Color(.systemBackground)).shadow(color: Color.mint.opacity(0.15), radius: 10))
        .overlay(RoundedRectangle(cornerRadius: 16).stroke(Color(game.color).opacity(0.3), lineWidth: 2))
    }
}

// MARK: - Activity Card
struct TA8ActivityCard: View {
    let activity: TA8Activity
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                Image(systemName: activity.iconName)
                    .font(.largeTitle)
                    .foregroundStyle(LinearGradient(colors: [.pink, .yellow], startPoint: .topLeading, endPoint: .bottomTrailing))
                
                Spacer()
                
                HStack(spacing: 2) {
                    ForEach(0..<activity.funFactor, id: \.self) { _ in
                        Image(systemName: "face.smiling.fill")
                            .font(.caption)
                            .foregroundColor(.yellow)
                    }
                }
            }
            
            Text(activity.title)
                .font(.headline)
                .fontWeight(.bold)
                .foregroundColor(.primary)
            
            Text(activity.activityDescription)
                .font(.subheadline)
                .foregroundColor(.secondary)
                .lineLimit(2)
        }
        .padding()
        .background(RoundedRectangle(cornerRadius: 16).fill(Color(.systemBackground)).shadow(color: Color.yellow.opacity(0.2), radius: 8))
        .overlay(RoundedRectangle(cornerRadius: 16).stroke(LinearGradient(colors: [.pink.opacity(0.3), .yellow.opacity(0.3)], startPoint: .topLeading, endPoint: .bottomTrailing), lineWidth: 2))
    }
}

