import SwiftUI

/// Vista principal de la Capa 2 (Principios) del módulo "Te Amo Cuando Estás Enojado"
/// Basado 100% en el libro de Erin Winters sobre amor incondicional
struct TA2View: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 32) {
                // 1. Header
                headerSection
                
                // 2. Los 4 principios clave
                principlesSection
                
                // 3. Rueda de emociones válidas
                emotionWheelSection
                
                // 4. Escenarios de aplicación práctica
                scenariosSection
                
                // 5. Cita motivacional
                motivationalQuoteSection
            }
            .padding()
        }
        .background(Color(.systemGroupedBackground))
        .navigationTitle("Principios")
        .navigationBarTitleDisplayMode(.large)
    }
    
    // MARK: - 1. Header Section
    private var headerSection: some View {
        VStack(spacing: 16) {
            Image(systemName: "heart.text.square.fill")
                .font(.system(size: 60))
                .foregroundStyle(
                    LinearGradient(
                        colors: [.pink, .mint],
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                )
            
            Text("Principios del Amor Incondicional")
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
            
            Text("Cómo amar a través de todas las emociones")
                .font(.title3)
                .fontWeight(.medium)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
        }
        .padding(.vertical)
    }
    
    // MARK: - 2. Principles Section
    private var principlesSection: some View {
        VStack(alignment: .leading, spacing: 16) {
            VStack(alignment: .leading, spacing: 8) {
                Text("Los 4 Principios Clave")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .foregroundColor(.primary)
                
                Text("Basados en las ideas centrales del libro")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
            
            VStack(spacing: 16) {
                ForEach(TA2Principle.allPrinciples) { principle in
                    TA2PrincipleCard(principle: principle)
                }
            }
        }
    }
    
    // MARK: - 3. Emotion Wheel Section
    private var emotionWheelSection: some View {
        VStack(alignment: .leading, spacing: 16) {
            Divider()
            
            TA2EmotionWheelView()
        }
    }
    
    // MARK: - 4. Scenarios Section
    private var scenariosSection: some View {
        VStack(alignment: .leading, spacing: 16) {
            Divider()
            
            VStack(alignment: .leading, spacing: 8) {
                Text("Escenarios de Aplicación Práctica")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .foregroundColor(.primary)
                
                Text("Situaciones reales del libro y cómo aplicar el amor incondicional")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 16) {
                    ForEach(TA2Scenario.allScenarios) { scenario in
                        TA2ScenarioCard(scenario: scenario)
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
            Image(systemName: "heart.circle.fill")
                .font(.largeTitle)
                .foregroundStyle(
                    LinearGradient(
                        colors: [.pink, .mint],
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                )
            
            VStack(spacing: 12) {
                Text("\"Te amo cuando estás enojado, cuando estás triste, en tu alegría, en tu melancolía.\"")
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
                
                Text("El amor incondicional abraza todas las emociones sin condiciones. Cada sentimiento de tu hijo merece ser validado y amado.")
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
struct TA2View_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            TA2View()
        }
    }
}

