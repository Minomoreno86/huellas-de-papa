import SwiftUI

/// Vista principal de la Capa 8 (Modo Niño) del módulo Bésame Mucho
/// Contenido interactivo adaptado para niños
struct BM8View: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 32) {
                headerSection
                sectionsGridSection
                importantNoteSection
            }
            .padding()
        }
        .background(
            LinearGradient(
                gradient: Gradient(colors: [
                    Color.blue.opacity(0.05),
                    Color.mint.opacity(0.05),
                    Color.purple.opacity(0.05)
                ]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
        )
        .navigationTitle("Modo Niño")
    }
    
    // MARK: - Header
    private var headerSection: some View {
        VStack(spacing: 16) {
            Image(systemName: "face.smiling.fill")
                .font(.system(size: 60))
                .foregroundStyle(
                    LinearGradient(
                        colors: [.blue, .mint, .purple],
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                )
            
            Text("Modo Niño")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundStyle(
                    LinearGradient(
                        gradient: Gradient(colors: [.blue, .mint, .purple]),
                        startPoint: .leading,
                        endPoint: .trailing
                    )
                )
            
            Text("Contenido especial para los más pequeños")
                .font(.title3)
                .fontWeight(.medium)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
            
            Text("Para usar junto con mamá y papá 💙")
                .font(.subheadline)
                .foregroundColor(.blue)
                .italic()
        }
        .padding(.vertical)
    }
    
    // MARK: - Sections Grid
    private var sectionsGridSection: some View {
        VStack(spacing: 20) {
            NavigationLink(destination: BM8StoriesView()) {
                KidSectionCard(
                    icon: "book.fill",
                    title: "Cuentos",
                    description: "Historias sobre apego y familia",
                    count: "6 cuentos",
                    color: .blue,
                    showChevron: true
                )
            }
            
            NavigationLink(destination: BM8ActivitiesView()) {
                KidSectionCard(
                    icon: "paintbrush.fill",
                    title: "Actividades",
                    description: "Manualidades para hacer juntos",
                    count: "8 actividades",
                    color: .orange,
                    showChevron: true
                )
            }
            
            NavigationLink(destination: BM8GamesView()) {
                KidSectionCard(
                    icon: "gamecontroller.fill",
                    title: "Juegos",
                    description: "Juegos interactivos divertidos",
                    count: "5 juegos",
                    color: .purple,
                    showChevron: true
                )
            }
            
            NavigationLink(destination: BM8SongsView()) {
                KidSectionCard(
                    icon: "music.note",
                    title: "Canciones",
                    description: "Canciones para cantar en familia",
                    count: "6 canciones",
                    color: .pink,
                    showChevron: true
                )
            }
            
            NavigationLink(destination: BM8ConversationsView()) {
                KidSectionCard(
                    icon: "bubble.left.and.bubble.right.fill",
                    title: "Conversaciones",
                    description: "Preguntas para hablar juntos",
                    count: "12 preguntas",
                    color: .mint,
                    showChevron: true
                )
            }
        }
    }
    
    // MARK: - Important Note
    private var importantNoteSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            Label("Nota para Padres", systemImage: "info.circle.fill")
                .font(.headline)
                .foregroundColor(.orange)
            
            VStack(alignment: .leading, spacing: 8) {
                Text("• Este contenido está diseñado para usar JUNTO con tu hijo")
                Text("• Supervisa siempre el uso de la app")
                Text("• Adapta el contenido a la edad y madurez de tu hijo")
                Text("• Usa este espacio para fortalecer el vínculo familiar")
            }
            .font(.body)
            .foregroundColor(.primary)
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(Color.orange.opacity(0.1))
        )
    }
}

// MARK: - Kid Section Card
struct KidSectionCard: View {
    let icon: String
    let title: String
    let description: String
    let count: String
    let color: Color
    let showChevron: Bool
    
    var body: some View {
        HStack(spacing: 20) {
            Image(systemName: icon)
                .font(.system(size: 40))
                .foregroundColor(color)
                .frame(width: 70, height: 70)
                .background(
                    Circle()
                        .fill(color.opacity(0.15))
                )
            
            VStack(alignment: .leading, spacing: 8) {
                Text(title)
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(.primary)
                
                Text(description)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                    .lineLimit(2)
                
                HStack {
                    Text(count)
                        .font(.caption)
                        .foregroundColor(color)
                        .fontWeight(.semibold)
                    
                    Spacer()
                    
                    if showChevron {
                        Image(systemName: "chevron.right")
                            .foregroundColor(color)
                    } else {
                        Text("Próximamente")
                            .font(.caption)
                            .foregroundColor(.orange)
                            .italic()
                    }
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 20)
                .fill(Color(.systemBackground))
                .shadow(color: color.opacity(0.2), radius: 10, x: 0, y: 5)
        )
    }
}

// MARK: - Preview
struct BM8View_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            BM8View()
        }
    }
}
