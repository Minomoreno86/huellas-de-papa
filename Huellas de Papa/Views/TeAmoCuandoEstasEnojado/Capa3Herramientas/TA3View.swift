import SwiftUI

/// Vista principal de la Capa 3 (Herramientas) del módulo "Te Amo Cuando Estás Enojado"
/// Basado 100% en el libro de Erin Winters
struct TA3View: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 32) {
                // 1. Header
                headerSection
                
                // 2. Herramientas prácticas
                toolsSection
                
                // 3. Frases de validación
                phrasesSection
                
                // 4. Actividades de conexión
                activitiesSection
                
                // 5. Cita motivacional
                motivationalQuoteSection
            }
            .padding()
        }
        .background(Color(.systemGroupedBackground))
        .navigationTitle("Herramientas")
        .navigationBarTitleDisplayMode(.large)
    }
    
    // MARK: - 1. Header Section
    private var headerSection: some View {
        VStack(spacing: 16) {
            Image(systemName: "wrench.and.screwdriver.fill")
                .font(.system(size: 60))
                .foregroundStyle(
                    LinearGradient(
                        colors: [.pink, .mint],
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                )
            
            Text("Herramientas Prácticas")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundStyle(
                    LinearGradient(
                        gradient: Gradient(colors: [.pink, .mint]),
                        startPoint: .leading,
                        endPoint: .trailing
                    )
                )
                .multilineTextAlignment(.center)
            
            Text("Aplica el amor incondicional en el día a día")
                .font(.title3)
                .fontWeight(.medium)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
        }
        .padding(.vertical)
    }
    
    // MARK: - 2. Tools Section
    private var toolsSection: some View {
        VStack(alignment: .leading, spacing: 16) {
            VStack(alignment: .leading, spacing: 8) {
                Text("Herramientas del Libro")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .foregroundColor(.primary)
                
                Text("8 herramientas prácticas basadas en el libro de Erin Winters")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
            
            VStack(spacing: 16) {
                ForEach(TA3Tool.allTools) { tool in
                    TA3ToolCard(tool: tool)
                }
            }
        }
    }
    
    // MARK: - 3. Phrases Section
    private var phrasesSection: some View {
        VStack(alignment: .leading, spacing: 16) {
            Divider()
                .padding(.vertical)
            
            VStack(alignment: .leading, spacing: 8) {
                Text("Frases de Validación Emocional")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .foregroundColor(.primary)
                
                Text("Frases específicas del libro para cada emoción")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 16) {
                    ForEach(TA3Phrase.allPhrases) { phrase in
                        TA3PhraseCard(phrase: phrase)
                    }
                }
                .padding(.horizontal, 4)
                .padding(.vertical, 8)
            }
        }
    }
    
    // MARK: - 4. Activities Section
    private var activitiesSection: some View {
        VStack(alignment: .leading, spacing: 16) {
            Divider()
                .padding(.vertical)
            
            VStack(alignment: .leading, spacing: 8) {
                Text("Actividades de Conexión")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .foregroundColor(.primary)
                
                Text("Actividades para fortalecer el vínculo emocional")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 16) {
                    ForEach(TA3Activity.allActivities) { activity in
                        TA3ActivityCard(activity: activity)
                    }
                }
                .padding(.horizontal, 4)
                .padding(.vertical, 8)
            }
        }
    }
    
    // MARK: - 5. Motivational Quote Section
    private var motivationalQuoteSection: some View {
        VStack(spacing: 20) {
            Image(systemName: "heart.text.square.fill")
                .font(.largeTitle)
                .foregroundStyle(
                    LinearGradient(
                        colors: [.pink, .mint],
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                )
            
            VStack(spacing: 12) {
                Text("\"Aprender sobre nuestras emociones es clave. Hablar de ellas con alguien de confianza puede ayudar.\"")
                    .font(.title3)
                    .fontWeight(.medium)
                    .foregroundColor(.primary)
                    .multilineTextAlignment(.center)
                    .italic()
                
                Text("— Erin Winters")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                
                Divider()
                    .padding(.vertical, 8)
                
                Text("Estas herramientas te ayudarán a aplicar el amor incondicional en cada momento del día, validando todas las emociones de tu hijo.")
                    .font(.body)
                    .foregroundColor(.primary)
                    .multilineTextAlignment(.center)
            }
            .padding(.vertical, 24)
            .padding(.horizontal, 20)
            .background(
                RoundedRectangle(cornerRadius: 16)
                    .fill(
                        LinearGradient(
                            gradient: Gradient(colors: [
                                Color.pink.opacity(0.1),
                                Color.mint.opacity(0.05)
                            ]),
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                    )
                    .overlay(
                        RoundedRectangle(cornerRadius: 16)
                            .stroke(
                                LinearGradient(
                                    gradient: Gradient(colors: [
                                        Color.pink.opacity(0.3),
                                        Color.mint.opacity(0.2)
                                    ]),
                                    startPoint: .topLeading,
                                    endPoint: .bottomTrailing
                                ),
                                lineWidth: 1
                            )
                    )
            )
            .shadow(
                color: Color.pink.opacity(0.1),
                radius: 8,
                x: 0,
                y: 4
            )
        }
        .padding(.top)
    }
}

// MARK: - Preview
struct TA3View_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            TA3View()
        }
    }
}

