import SwiftUI

/// Vista principal de la Capa 1 (Fundamentos) del módulo "Te Amo Cuando Estás Enojado"
/// Basado 100% en el libro de Erin Winters sobre amor incondicional y manejo de emociones
struct TA1View: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 32) {
                // 1. Header animado
                headerSection
                
                // 2. Secciones teóricas
                theoreticalSectionsView
                
                // 3. Los cuatro pilares
                pillarsGridSection
                
                // 4. Ejemplos clínicos (scroll horizontal)
                clinicalExamplesSection
                
                // 5. Cita motivacional del libro
                motivationalQuoteSection
            }
            .padding()
        }
        .background(Color(.systemGroupedBackground))
        .navigationTitle("Fundamentos")
        .navigationBarTitleDisplayMode(.large)
    }
    
    // MARK: - 1. Header Section
    private var headerSection: some View {
        VStack(spacing: 16) {
            Image(systemName: "heart.circle.fill")
                .font(.system(size: 60))
                .foregroundStyle(
                    LinearGradient(
                        colors: [.pink, .mint],
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                )
            
            Text("¡Te Amo Cuando Estás Enojado!")
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
            
            Text("Amor incondicional a través de todas las emociones")
                .font(.title3)
                .fontWeight(.medium)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
            
            Text("Por Erin Winters")
                .font(.subheadline)
                .foregroundColor(.pink)
                .italic()
        }
        .padding(.vertical)
    }
    
    // MARK: - 2. Theoretical Sections
    private var theoreticalSectionsView: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Fundamentos del Libro")
                .font(.title2)
                .fontWeight(.semibold)
                .foregroundColor(.primary)
            
            VStack(spacing: 16) {
                ForEach(TA1Section.allSections) { section in
                    TA1SectionCard(section: section)
                }
            }
        }
    }
    
    // MARK: - 3. Pillars Grid Section
    private var pillarsGridSection: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Los Cuatro Pilares")
                .font(.title2)
                .fontWeight(.semibold)
                .foregroundColor(.primary)
            
            Text("Bases del amor incondicional")
                .font(.subheadline)
                .foregroundColor(.secondary)
            
            LazyVGrid(columns: [
                GridItem(.flexible()),
                GridItem(.flexible())
            ], spacing: 16) {
                ForEach(TA1Pillar.allPillars) { pillar in
                    TA1PillarCard(pillar: pillar)
                }
            }
        }
    }
    
    // MARK: - 4. Clinical Examples Section
    private var clinicalExamplesSection: some View {
        VStack(alignment: .leading, spacing: 16) {
            VStack(alignment: .leading, spacing: 8) {
                Text("Ejemplos del Libro")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .foregroundColor(.primary)
                
                Text("Situaciones reales de amor incondicional")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 16) {
                    ForEach(TA1Example.allExamples) { example in
                        TA1ExampleCard(example: example)
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
            Image(systemName: "quote.bubble.fill")
                .font(.largeTitle)
                .foregroundStyle(
                    LinearGradient(
                        colors: [.pink, .mint],
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                )
            
            VStack(spacing: 12) {
                Text("\"Todo el mundo tiene emociones, y en ocasiones es difícil saber lo que estamos sintiendo y por qué.\"")
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
                
                Text("Aprender sobre nuestras emociones es clave. Hablar de ellas con alguien de confianza puede ayudar.")
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
struct TA1View_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            TA1View()
        }
    }
}

