import SwiftUI

// MARK: - Activity Detail View
struct TA5ActivityDetailView: View {
    let activity: TA5Activity
    
    var body: some View {
        ScrollView {
            VStack(spacing: 24) {
                // Header
                VStack(spacing: 16) {
                    Image(systemName: activity.iconName)
                        .font(.system(size: 80))
                        .foregroundStyle(LinearGradient(colors: [.pink, .mint], startPoint: .topLeading, endPoint: .bottomTrailing))
                    
                    Text(activity.title)
                        .font(.title)
                        .fontWeight(.bold)
                        .multilineTextAlignment(.center)
                }
                
                // Info
                InfoSection(title: "Objetivo", icon: "target", color: .pink, content: activity.objective)
                InfoSection(title: "Descripción", icon: "text.alignleft", color: .mint, content: activity.description)
                
                // Detalles
                HStack(spacing: 16) {
                    DetailBadge(icon: "clock", text: activity.durationMinutes, color: .pink)
                    DetailBadge(icon: "figure.child", text: activity.ageRange, color: .mint)
                    DetailBadge(icon: "calendar", text: activity.frequency.rawValue, color: .blue)
                }
                
                // Materiales
                if !activity.materials.isEmpty {
                    ListSection(title: "Materiales", icon: "list.bullet", color: .pink, items: activity.materials)
                }
                
                // Instrucciones
                StepsSection(title: "Instrucciones", icon: "list.number", color: .mint, steps: activity.instructions)
                
                // Del libro
                QuoteSection(title: "Del libro", quote: activity.bookReference)
                
                // Tips
                if !activity.tips.isEmpty {
                    ListSection(title: "Tips", icon: "lightbulb.fill", color: .orange, items: activity.tips)
                }
            }
            .padding()
        }
        .background(Color(.systemGroupedBackground))
        .navigationTitle("Actividad")
        .navigationBarTitleDisplayMode(.inline)
    }
}

// MARK: - Routine Detail View
struct TA5RoutineDetailView: View {
    let routine: TA5Routine
    
    var body: some View {
        ScrollView {
            VStack(spacing: 24) {
                // Header
                VStack(spacing: 16) {
                    Image(systemName: routine.iconName)
                        .font(.system(size: 80))
                        .foregroundStyle(LinearGradient(colors: [.mint, .pink], startPoint: .topLeading, endPoint: .bottomTrailing))
                    
                    Text(routine.title)
                        .font(.title)
                        .fontWeight(.bold)
                        .multilineTextAlignment(.center)
                    
                    Text(routine.timeOfDay.rawValue)
                        .font(.subheadline)
                        .foregroundColor(.white)
                        .padding(.horizontal, 16)
                        .padding(.vertical, 6)
                        .background(Capsule().fill(Color.pink))
                }
                
                // Info
                InfoSection(title: "Objetivo", icon: "target", color: .mint, content: routine.objective)
                InfoSection(title: "Descripción", icon: "text.alignleft", color: .pink, content: routine.description)
                
                Label(routine.durationMinutes, systemImage: "clock")
                    .font(.subheadline)
                    .foregroundColor(.mint)
                
                // Pasos
                StepsSection(title: "Pasos", icon: "list.number", color: .pink, steps: routine.steps)
                
                // Emociones
                if !routine.emotionsValidated.isEmpty {
                    ListSection(title: "Emociones validadas", icon: "heart.fill", color: .mint, items: routine.emotionsValidated)
                }
                
                // Frases del libro
                if !routine.bookPhrases.isEmpty {
                    VStack(alignment: .leading, spacing: 12) {
                        Label("Frases del libro", systemImage: "quote.bubble.fill")
                            .font(.headline)
                            .foregroundColor(.pink)
                        
                        ForEach(routine.bookPhrases, id: \.self) { phrase in
                            Text("\"\(phrase)\"")
                                .font(.subheadline)
                                .italic()
                                .foregroundColor(.primary)
                                .padding()
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .background(RoundedRectangle(cornerRadius: 8).fill(Color.pink.opacity(0.1)))
                        }
                    }
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 12).fill(Color(.systemBackground)))
                }
                
                // Tips
                if !routine.tips.isEmpty {
                    ListSection(title: "Tips", icon: "lightbulb.fill", color: .orange, items: routine.tips)
                }
            }
            .padding()
        }
        .background(Color(.systemGroupedBackground))
        .navigationTitle("Rutina")
        .navigationBarTitleDisplayMode(.inline)
    }
}

// MARK: - Helper Components
struct InfoSection: View {
    let title: String
    let icon: String
    let color: Color
    let content: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Label(title, systemImage: icon)
                .font(.headline)
                .foregroundColor(color)
            
            Text(content)
                .font(.body)
                .foregroundColor(.primary)
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(RoundedRectangle(cornerRadius: 12).fill(color.opacity(0.1)))
    }
}

struct ListSection: View {
    let title: String
    let icon: String
    let color: Color
    let items: [String]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Label(title, systemImage: icon)
                .font(.headline)
                .foregroundColor(color)
            
            VStack(alignment: .leading, spacing: 8) {
                ForEach(items, id: \.self) { item in
                    HStack(alignment: .top, spacing: 8) {
                        Image(systemName: "checkmark.circle.fill")
                            .font(.caption)
                            .foregroundColor(color)
                        
                        Text(item)
                            .font(.subheadline)
                            .foregroundColor(.primary)
                    }
                }
            }
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(RoundedRectangle(cornerRadius: 12).fill(Color(.systemBackground)))
    }
}

struct StepsSection: View {
    let title: String
    let icon: String
    let color: Color
    let steps: [String]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Label(title, systemImage: icon)
                .font(.headline)
                .foregroundColor(color)
            
            VStack(alignment: .leading, spacing: 12) {
                ForEach(Array(steps.enumerated()), id: \.offset) { index, step in
                    HStack(alignment: .top, spacing: 12) {
                        Text("\(index + 1)")
                            .font(.caption)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .frame(width: 24, height: 24)
                            .background(Circle().fill(color))
                        
                        Text(step)
                            .font(.subheadline)
                            .foregroundColor(.primary)
                    }
                }
            }
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(RoundedRectangle(cornerRadius: 12).fill(color.opacity(0.05)))
    }
}

struct QuoteSection: View {
    let title: String
    let quote: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Label(title, systemImage: "book.fill")
                .font(.headline)
                .foregroundColor(.pink)
            
            Text("\"")
                .font(.title)
                .foregroundColor(.pink.opacity(0.3))
                + Text(quote)
                .font(.body)
                .italic()
                .foregroundColor(.primary)
                + Text("\"")
                .font(.title)
                .foregroundColor(.pink.opacity(0.3))
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(RoundedRectangle(cornerRadius: 12).fill(LinearGradient(colors: [Color.pink.opacity(0.1), Color.mint.opacity(0.05)], startPoint: .topLeading, endPoint: .bottomTrailing)))
    }
}

struct DetailBadge: View {
    let icon: String
    let text: String
    let color: Color
    
    var body: some View {
        VStack(spacing: 4) {
            Image(systemName: icon)
                .font(.title3)
                .foregroundColor(color)
            
            Text(text)
                .font(.caption2)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical, 8)
        .background(RoundedRectangle(cornerRadius: 8).fill(color.opacity(0.1)))
    }
}

