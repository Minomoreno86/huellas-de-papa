import SwiftUI

/// Vista principal de la Capa 3 (Herramientas) del módulo The Yes Brain
/// Convierte la teoría en práctica diaria con herramientas concretas y aplicables
struct Capa3View: View {
    @EnvironmentObject var progresoManager: ProgresoManager
    @State private var selectedPillar: String = "Balance"
    @State private var showingToolDetail: YesBrainTool? = nil
    
    let pilares = ["Balance", "Resiliencia", "Insight", "Empatía"]
    
    var body: some View {
        ScrollView {
            VStack(spacing: 24) {
                // 1. Header Section
                headerSection
                
                // 2. Pilar Selector
                pilarSelectorSection
                
                // 3. Tools Section
                toolsSection
                
                // 4. Phrases Section
                phrasesSection
                
                // 5. Routines Section
                routinesSection
            }
            .padding()
        }
        .navigationTitle("Herramientas")
        #if !os(macOS)
        .navigationBarTitleDisplayMode(.large)
        #endif
        .onAppear {
            triggerHaptic()
        }
        .sheet(item: $showingToolDetail) { tool in
            ToolDetailView(tool: tool)
        }
    }
    
    // MARK: - 1. Header Section
    private var headerSection: some View {
        VStack(spacing: 16) {
            Text("Herramientas del Yes Brain")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundStyle(
                    LinearGradient(
                        gradient: Gradient(colors: [.blue, .mint]),
                        startPoint: .leading,
                        endPoint: .trailing
                    )
                )
            
            Text("De la comprensión a la práctica diaria")
                .font(.title3)
                .fontWeight(.medium)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
            
            Text("El cerebro se entrena con práctica")
                .font(.subheadline)
                .foregroundColor(.blue)
                .italic()
        }
        .padding(.vertical)
    }
    
    // MARK: - 2. Pilar Selector
    private var pilarSelectorSection: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Selecciona un Pilar")
                .font(.title2)
                .fontWeight(.semibold)
                .foregroundColor(.primary)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 12) {
                    ForEach(pilares, id: \.self) { pilar in
                        Button(action: {
                            withAnimation(.spring()) {
                                selectedPillar = pilar
                            }
                            triggerHaptic()
                        }) {
                            Text(pilar)
                                .font(.subheadline)
                                .fontWeight(.medium)
                                .foregroundColor(selectedPillar == pilar ? .white : pilarColor(pilar))
                                .padding(.horizontal, 16)
                                .padding(.vertical, 8)
                                .background(
                                    RoundedRectangle(cornerRadius: 20)
                                        .fill(selectedPillar == pilar ? pilarColor(pilar) : pilarColor(pilar).opacity(0.1))
                                )
                        }
                        .buttonStyle(PlainButtonStyle())
                    }
                }
                .padding(.horizontal)
            }
        }
    }
    
    // MARK: - 3. Tools Section
    private var toolsSection: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Herramientas de \(selectedPillar)")
                .font(.title2)
                .fontWeight(.semibold)
                .foregroundColor(.primary)
            
            let filteredTools = Capa3HerramientasData.herramientas.filter { $0.category == selectedPillar }
            
            if !filteredTools.isEmpty {
                LazyVGrid(columns: [
                    GridItem(.flexible())
                ], spacing: 16) {
                    ForEach(filteredTools) { tool in
                        ToolCardView(tool: tool) {
                            showingToolDetail = tool
                        }
                    }
                }
            } else {
                Text("No hay herramientas disponibles para este pilar")
                    .font(.body)
                    .foregroundColor(.secondary)
                    .padding()
            }
        }
    }
    
    // MARK: - 4. Phrases Section
    private var phrasesSection: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Frases de Conexión")
                .font(.title2)
                .fontWeight(.semibold)
                .foregroundColor(.primary)
            
            Text("Guiones verbales para usar en situaciones cotidianas")
                .font(.subheadline)
                .foregroundColor(.secondary)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 16) {
                    ForEach(Capa3HerramientasData.frases) { phrase in
                        PhraseBannerView(phrase: phrase)
                    }
                }
                .padding(.horizontal)
            }
        }
    }
    
    // MARK: - 5. Routines Section
    private var routinesSection: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Rutinas Sugeridas")
                .font(.title2)
                .fontWeight(.semibold)
                .foregroundColor(.primary)
            
            Text("Combinaciones de herramientas para aplicar en el día")
                .font(.subheadline)
                .foregroundColor(.secondary)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 16) {
                    ForEach(Capa3HerramientasData.rutinas) { routine in
                        RoutineCarouselView(routine: routine)
                    }
                }
                .padding(.horizontal)
            }
        }
    }
    
    // MARK: - Helper Functions
    private func pilarColor(_ pilar: String) -> Color {
        switch pilar {
        case "Balance": return .blue
        case "Resiliencia": return .green
        case "Insight": return .purple
        case "Empatía": return .pink
        default: return .blue
        }
    }
    
    private func triggerHaptic() {
        #if !os(macOS)
        let impactFeedback = UIImpactFeedbackGenerator(style: .light)
        impactFeedback.impactOccurred()
        #endif
    }
}

// MARK: - Preview
struct Capa3View_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            Capa3View()
                .environmentObject(ProgresoManager())
        }
    }
}
