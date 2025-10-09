import SwiftUI

/// Vista detallada de un nivel de entrenamiento
struct TA6LevelDetailView: View {
    let level: TA6Level
    @Environment(\.dismiss) var dismiss
    @State private var showingReflection = false
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 24) {
                    // Header
                    VStack(spacing: 16) {
                        Image(systemName: level.icon)
                            .font(.system(size: 100))
                            .foregroundStyle(LinearGradient(colors: [.pink, .mint], startPoint: .topLeading, endPoint: .bottomTrailing))
                        
                        Text("Nivel \(level.levelNumber)")
                            .font(.title3)
                            .foregroundColor(.mint)
                        
                        Text(level.title)
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .multilineTextAlignment(.center)
                        
                        Text(level.estimatedDays)
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                    }
                    .padding(.top)
                    
                    // Descripción
                    InfoBox(title: "Descripción", icon: "text.alignleft", color: .pink, content: level.levelDescription)
                    
                    // Misión
                    InfoBox(title: "Tu Misión", icon: "target", color: .mint, content: level.mission)
                    
                    // Desafío diario
                    VStack(alignment: .leading, spacing: 12) {
                        Label("Desafío Diario", systemImage: "flame.fill")
                            .font(.headline)
                            .foregroundColor(.orange)
                        
                        Text(level.dailyChallenge)
                            .font(.body)
                            .fontWeight(.medium)
                            .foregroundColor(.primary)
                    }
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(RoundedRectangle(cornerRadius: 12).fill(LinearGradient(colors: [Color.orange.opacity(0.15), Color.yellow.opacity(0.1)], startPoint: .topLeading, endPoint: .bottomTrailing)))
                    .overlay(RoundedRectangle(cornerRadius: 12).stroke(Color.orange.opacity(0.3), lineWidth: 2))
                    
                    // Del libro
                    VStack(alignment: .leading, spacing: 12) {
                        Label("Del libro de Erin Winters", systemImage: "book.fill")
                            .font(.headline)
                            .foregroundColor(.pink)
                        
                        Text("\"")
                            .font(.title)
                            .foregroundColor(.pink.opacity(0.3))
                            + Text(level.bookReference)
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
                    
                    // Pregunta de reflexión
                    Button(action: { showingReflection.toggle() }) {
                        VStack(alignment: .leading, spacing: 12) {
                            HStack {
                                Label("Pregunta de Reflexión", systemImage: "lightbulb.fill")
                                    .font(.headline)
                                    .foregroundColor(.purple)
                                
                                Spacer()
                                
                                Image(systemName: showingReflection ? "chevron.up" : "chevron.down")
                                    .foregroundColor(.purple)
                            }
                            
                            if showingReflection {
                                Text(level.reflectionQuestion)
                                    .font(.body)
                                    .foregroundColor(.primary)
                                    .transition(.opacity)
                            }
                        }
                        .padding()
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .background(RoundedRectangle(cornerRadius: 12).fill(Color.purple.opacity(0.1)))
                    }
                    .buttonStyle(PlainButtonStyle())
                    
                    // Botón de inicio
                    Button(action: {
                        triggerHaptic()
                        dismiss()
                    }) {
                        Label("Comenzar Este Nivel", systemImage: "play.circle.fill")
                            .font(.headline)
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(LinearGradient(colors: [.pink, .mint], startPoint: .leading, endPoint: .trailing))
                            .cornerRadius(12)
                    }
                }
                .padding()
            }
            .background(Color(.systemGroupedBackground))
            .navigationTitle("Nivel \(level.levelNumber)")
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
    
    private func triggerHaptic() {
        let impactFeedback = UIImpactFeedbackGenerator(style: .medium)
        impactFeedback.impactOccurred()
    }
}

struct InfoBox: View {
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

