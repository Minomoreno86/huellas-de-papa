import SwiftUI

/// Vista principal de la Capa 2 (Principios) del módulo "Tengo un Volcán"
/// Enseña los principios fundamentales del modelo de gestión de la rabia
struct TV2View: View {
    @State private var selectedPrincipleIndex = 0
    
    var body: some View {
        ScrollView {
            VStack(spacing: 32) {
                // 1. Header
                headerSection
                
                // 2. Principios Fundamentales (scroll horizontal)
                principlesSection
                
                // 3. Los Desencadenantes ("Botones")
                triggersSection
                
                // 4. Patrones de Pensamiento ("Nubes de Humo")
                thoughtPatternsSection
                
                // 5. Escenarios de Aplicación
                scenariosSection
                
                // 6. Cita inspiradora
                quoteSection
            }
            .padding()
        }
        .navigationTitle("Principios del Volcán")
        .navigationBarTitleDisplayMode(.large)
        .background(Color(.systemGroupedBackground))
    }
    
    // MARK: - 1. Header
    private var headerSection: some View {
        VStack(spacing: 16) {
            Text("Los 5 Principios Fundamentales")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundStyle(
                    LinearGradient(
                        gradient: Gradient(colors: [.blue, .mint]),
                        startPoint: .leading,
                        endPoint: .trailing
                    )
                )
                .multilineTextAlignment(.center)
            
            Text("Comprender cómo funciona el volcán para gestionarlo mejor")
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
            Text("Principios del Modelo")
                .font(.title2)
                .fontWeight(.semibold)
                .foregroundColor(.primary)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 16) {
                    ForEach(Array(TV2Data.principles.enumerated()), id: \.element.id) { index, principle in
                        TV2PrincipleCard(
                            principle: principle,
                            isSelected: selectedPrincipleIndex == index
                        )
                        .onTapGesture {
                            withAnimation(.spring()) {
                                selectedPrincipleIndex = index
                            }
                        }
                    }
                }
                .padding(.horizontal, 4)
            }
        }
    }
    
    // MARK: - 3. Triggers Section
    private var triggersSection: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack {
                Image(systemName: "circle.grid.cross.fill")
                    .foregroundColor(.red)
                    .font(.title2)
                
                Text("Los Botones del Volcán")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .foregroundColor(.primary)
            }
            
            Text("¿Qué enciende el volcán?")
                .font(.subheadline)
                .foregroundColor(.secondary)
            
            ForEach(TV2Data.triggers) { trigger in
                TV2TriggerCard(trigger: trigger)
            }
        }
    }
    
    // MARK: - 4. Thought Patterns Section
    private var thoughtPatternsSection: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack {
                Image(systemName: "cloud.fill")
                    .foregroundColor(.purple)
                    .font(.title2)
                
                Text("Nubes de Humo vs Aire Fresco")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .foregroundColor(.primary)
            }
            
            Text("Pensamientos que alimentan o calman el volcán")
                .font(.subheadline)
                .foregroundColor(.secondary)
            
            TV2ThoughtPatternView()
        }
    }
    
    // MARK: - 5. Scenarios Section
    private var scenariosSection: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack {
                Image(systemName: "book.pages.fill")
                    .foregroundColor(.orange)
                    .font(.title2)
                
                Text("Escenarios de Aplicación")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .foregroundColor(.primary)
            }
            
            Text("Cómo aplicar los principios en situaciones reales")
                .font(.subheadline)
                .foregroundColor(.secondary)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 16) {
                    ForEach(TV2Data.scenarios) { scenario in
                        TV2ScenarioCard(scenario: scenario)
                    }
                }
                .padding(.horizontal, 4)
            }
        }
    }
    
    // MARK: - 6. Quote Section
    private var quoteSection: some View {
        VStack(spacing: 16) {
            if let quote = TV2Data.quotes.first {
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
        TV2View()
    }
}

