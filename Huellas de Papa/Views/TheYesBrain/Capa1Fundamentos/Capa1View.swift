import SwiftUI

/// Vista principal de la Capa 1 (Fundamentos) del módulo The Yes Brain
/// Presenta los conceptos básicos del cerebro receptivo vs reactivo
struct Capa1View: View {
    @State private var selectedToggle: YesNoState = .yes
    @State private var selectedPillar: YesBrainPillar? = nil
    @State private var showingClinicalTransition = false
    
    var body: some View {
        ScrollView {
            VStack(spacing: 24) {
                // Header con título y frase-llave
                headerSection
                
                // Sección Conceptos
                conceptSection
                
                // Comparador Yes/No
                comparisonSection
                
                // Pilares del Yes Brain
                pillarsSection
                
                // Ejes neurobiológicos
                neuroAxisSection
                
                // Ejemplos clínicos
                clinicalExamplesSection
                
                // Cita de cierre
                keyQuoteSection
            }
            .padding()
        }
        .navigationTitle("Fundamentos")
        #if !os(macOS)
        .navigationBarTitleDisplayMode(.large)
        #endif
    }
    
    // MARK: - Header Section
    private var headerSection: some View {
        VStack(spacing: 12) {
            Text("The Yes Brain")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(.primary)
            
            Text("Del cerebro reactivo al cerebro receptivo")
                .font(.title2)
                .fontWeight(.medium)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
        }
        .padding(.vertical)
    }
    
    // MARK: - Concept Section
    private var conceptSection: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("¿Qué es el Yes Brain?")
                .font(.title2)
                .fontWeight(.semibold)
            
            // Placeholder para conceptos
            VStack(spacing: 12) {
                conceptCard(
                    title: "Estado Receptivo",
                    description: "El cerebro en modo Yes está abierto, curioso y listo para aprender",
                    insight: "Tu calma activa su Yes Brain"
                )
                
                conceptCard(
                    title: "Estado Reactivo", 
                    description: "El cerebro en modo No está cerrado, defensivo y en alerta",
                    insight: "El estrés activa su No Brain"
                )
            }
        }
    }
    
    // MARK: - Comparison Section
    private var comparisonSection: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Yes Brain vs No Brain")
                .font(.title2)
                .fontWeight(.semibold)
            
            // Placeholder para comparador interactivo
            YesNoToggleView(selectedState: $selectedToggle)
        }
    }
    
    // MARK: - Pillars Section
    private var pillarsSection: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Los 4 Pilares del Yes Brain")
                .font(.title2)
                .fontWeight(.semibold)
            
            LazyVGrid(columns: [
                GridItem(.flexible()),
                GridItem(.flexible())
            ], spacing: 16) {
                // Placeholder para pilares
                ForEach(YesBrainPillar.allCases, id: \.self) { pillar in
                    PillarCard(
                        pillar: pillar,
                        isSelected: selectedPillar == pillar
                    ) {
                        selectedPillar = selectedPillar == pillar ? nil : pillar
                    }
                }
            }
        }
    }
    
    // MARK: - Neuro Axis Section
    private var neuroAxisSection: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Ejes Neurobiológicos")
                .font(.title2)
                .fontWeight(.semibold)
            
            // Placeholder para badges neurobiológicos
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 12) {
                    NeuroAxisBadge(name: "Amígdala", role: "Detección de amenazas")
                    NeuroAxisBadge(name: "Corteza Prefrontal", role: "Regulación ejecutiva")
                    NeuroAxisBadge(name: "Integración", role: "Conexión hemisférica")
                    NeuroAxisBadge(name: "Recompensa", role: "Sistema de motivación")
                }
                .padding(.horizontal)
            }
        }
    }
    
    // MARK: - Clinical Examples Section
    private var clinicalExamplesSection: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Ejemplos Clínicos")
                .font(.title2)
                .fontWeight(.semibold)
            
            // Placeholder para ejemplos clínicos
            ClinicalExampleCard(
                showingTransition: $showingClinicalTransition
            )
        }
    }
    
    // MARK: - Key Quote Section
    private var keyQuoteSection: some View {
        VStack(spacing: 16) {
            // Header de la sección
            HStack {
                Image(systemName: "quote.bubble.fill")
                    .font(.title2)
                    .foregroundColor(.blue)
                
                Text("Recordatorio Clave")
                    .font(.headline)
                    .fontWeight(.semibold)
                    .foregroundColor(.primary)
            }
            
            // Cita principal
            VStack(spacing: 12) {
                Text("Tu calma activa su Yes Brain")
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(.primary)
                    .multilineTextAlignment(.center)
                    .lineLimit(nil)
                
                Text("— Daniel J. Siegel & Tina Payne Bryson")
                    .font(.caption)
                    .fontWeight(.medium)
                    .foregroundColor(.secondary)
                    .italic()
            }
            .padding(.vertical, 20)
            .padding(.horizontal, 24)
            .background(
                RoundedRectangle(cornerRadius: 16)
                    .fill(
                        LinearGradient(
                            gradient: Gradient(colors: [
                                Color.blue.opacity(0.1),
                                Color.blue.opacity(0.05)
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
                                        Color.blue.opacity(0.3),
                                        Color.blue.opacity(0.1)
                                    ]),
                                    startPoint: .topLeading,
                                    endPoint: .bottomTrailing
                                ),
                                lineWidth: 1
                            )
                    )
            )
            .shadow(
                color: Color.blue.opacity(0.1),
                radius: 8,
                x: 0,
                y: 4
            )
            
            // Subtítulo explicativo
            Text("Cuando mantienes la calma, tu hijo puede acceder a su cerebro receptivo y aprender de la experiencia")
                .font(.subheadline)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
                .lineLimit(nil)
        }
        .padding(.vertical)
    }
    
    // MARK: - Helper Views
    private func conceptCard(title: String, description: String, insight: String) -> some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(title)
                .font(.headline)
                .fontWeight(.semibold)
            
            Text(description)
                .font(.body)
                .foregroundColor(.secondary)
            
            Text(insight)
                .font(.caption)
                .fontWeight(.medium)
                .foregroundColor(.blue)
                .padding(.top, 4)
        }
        .padding()
                .background(Color(UIColor.systemGray6))
        .cornerRadius(12)
    }
}

// MARK: - Supporting Types
enum YesNoState {
    case yes, no
}

enum YesBrainPillar: String, CaseIterable {
    case balance = "Balance"
    case resilience = "Resiliencia"
    case insight = "Insight"
    case empathy = "Empatía"
    
    var description: String {
        switch self {
        case .balance:
            return "Equilibrio emocional y regulación"
        case .resilience:
            return "Recuperación tras el estrés"
        case .insight:
            return "Autoconciencia significativa"
        case .empathy:
            return "Conexión con el otro"
        }
    }
}

// MARK: - Preview
struct Capa1View_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            Capa1View()
        }
    }
}
