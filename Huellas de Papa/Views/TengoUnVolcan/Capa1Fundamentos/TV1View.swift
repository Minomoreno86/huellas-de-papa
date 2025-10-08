import SwiftUI

/// Vista principal de la Capa 1 (Fundamentos) del módulo "Tengo un Volcán"
/// Forma al padre en los fundamentos del modelo de gestión emocional de la rabia
struct TV1View: View {
    @State private var selectedPhase: TV1PhysicalSignal.VolcanoPhase = .chispa
    
    var body: some View {
        ScrollView {
            VStack(spacing: 32) {
                // 1. Header animado
                headerSection
                
                // 2. Sección Conceptos - scroll horizontal
                theoreticalSectionsScrollView
                
                // 3. Visualización de Fases del Volcán
                volcanoPhaseSection
                
                // 4. Bloque Pilares (grid 2×2)
                pillarsGridSection
                
                // 5. Mapa Físico del Volcán
                physicalSignalsSection
                
                // 6. Ejemplos Clínicos
                clinicalExamplesSection
                
                // 7. Frase final motivacional
                motivationalQuoteSection
            }
            .padding()
        }
        .navigationTitle("Fundamentos del Volcán")
        .navigationBarTitleDisplayMode(.large)
        .background(Color(.systemGroupedBackground))
    }
    
    // MARK: - 1. Header Section
    private var headerSection: some View {
        VStack(spacing: 16) {
            Text("Tengo un Volcán")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundStyle(
                    LinearGradient(
                        gradient: Gradient(colors: [.blue, .mint]),
                        startPoint: .leading,
                        endPoint: .trailing
                    )
                )
            
            Text("Formación en gestión emocional de la rabia")
                .font(.title3)
                .fontWeight(.medium)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
            
            Text("Basado en el libro de Míriam Tirado")
                .font(.subheadline)
                .foregroundColor(.blue)
                .multilineTextAlignment(.center)
                .italic()
        }
        .padding(.vertical)
    }
    
    // MARK: - 2. Theoretical Sections Scroll View
    private var theoreticalSectionsScrollView: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Conceptos Fundamentales")
                .font(.title2)
                .fontWeight(.semibold)
                .foregroundColor(.primary)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 16) {
                    ForEach(TV1Data.theoreticalSections) { section in
                        TV1SectionCard(section: section)
                    }
                }
                .padding(.horizontal, 4)
            }
        }
    }
    
    // MARK: - 3. Volcano Phase Section
    private var volcanoPhaseSection: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Las Tres Fases del Volcán")
                .font(.title2)
                .fontWeight(.semibold)
                .foregroundColor(.primary)
            
            TV1VolcanoPhaseView(selectedPhase: $selectedPhase)
        }
    }
    
    // MARK: - 4. Pillars Grid Section
    private var pillarsGridSection: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Los Cuatro Pilares del Modelo")
                .font(.title2)
                .fontWeight(.semibold)
                .foregroundColor(.primary)
            
            LazyVGrid(columns: [
                GridItem(.flexible()),
                GridItem(.flexible())
            ], spacing: 16) {
                ForEach(TV1Data.pillars) { pillar in
                    TV1PillarCard(pillar: pillar)
                }
            }
        }
    }
    
    // MARK: - 5. Physical Signals Section
    private var physicalSignalsSection: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Mapa Físico del Volcán")
                .font(.title2)
                .fontWeight(.semibold)
                .foregroundColor(.primary)
            
            Text("Señales corporales según la fase: \(selectedPhase.rawValue)")
                .font(.subheadline)
                .foregroundColor(.secondary)
            
            TV1PhysicalSignalView(selectedPhase: selectedPhase)
        }
    }
    
    // MARK: - 6. Clinical Examples Section
    private var clinicalExamplesSection: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Ejemplos de Aplicación")
                .font(.title2)
                .fontWeight(.semibold)
                .foregroundColor(.primary)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 16) {
                    ForEach(TV1Data.clinicalExamples) { example in
                        TV1ExampleCard(example: example)
                    }
                }
                .padding(.horizontal, 4)
            }
        }
    }
    
    // MARK: - 7. Motivational Quote Section
    private var motivationalQuoteSection: some View {
        VStack(spacing: 16) {
            if let quote = TV1Data.inspirationalQuotes.first {
                VStack(spacing: 12) {
                    Image(systemName: "quote.opening")
                        .font(.title)
                        .foregroundColor(.mint)
                    
                    Text(quote.text)
                        .font(.title3)
                        .fontWeight(.medium)
                        .foregroundColor(.primary)
                        .multilineTextAlignment(.center)
                        .italic()
                    
                    Text("— \(quote.author)")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
                .padding(24)
                .background(
                    RoundedRectangle(cornerRadius: 16)
                        .fill(Color.blue.opacity(0.1))
                )
            }
        }
        .padding(.vertical)
    }
}

#Preview {
    NavigationStack {
        TV1View()
    }
}

