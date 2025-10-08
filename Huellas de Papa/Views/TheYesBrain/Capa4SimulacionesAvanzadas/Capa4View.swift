import SwiftUI

/// Vista principal de la Capa 4 (Simulaciones Avanzadas) del módulo The Yes Brain
/// Laboratorio emocional interactivo que entrena la toma de decisiones bajo presión
struct Capa4View: View {
    @EnvironmentObject var progresoManager: ProgresoManager
    @State private var selectedCategory: String = "Todos"
    
    let categories = ["Todos", "Balance", "Resiliencia", "Insight", "Empatía"]
    
    var body: some View {
        ScrollView {
            VStack(spacing: 24) {
                // 1. Header Section
                headerSection
                
                // 2. Category Selector
                categorySelectorSection
                
                // 3. Scenarios Grid
                scenariosSection
                
                // 4. Progress Indicator (placeholder)
                progressSection
            }
            .padding()
        }
        .navigationTitle("Simulaciones")
        #if !os(macOS)
        .navigationBarTitleDisplayMode(.large)
        #endif
        .onAppear {
            triggerHaptic()
        }
    }
    
    // MARK: - 1. Header Section
    private var headerSection: some View {
        VStack(spacing: 16) {
            Text("Simulaciones Avanzadas")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundStyle(
                    LinearGradient(
                        gradient: Gradient(colors: [.purple, .pink]),
                        startPoint: .leading,
                        endPoint: .trailing
                    )
                )
            
            Text("Entrena tu cerebro en situaciones reales")
                .font(.title3)
                .fontWeight(.medium)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
            
            Text("Cada elección crea una nueva conexión neuronal")
                .font(.subheadline)
                .foregroundColor(.purple)
                .italic()
        }
        .padding(.vertical)
    }
    
    // MARK: - 2. Category Selector
    private var categorySelectorSection: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Selecciona una Categoría")
                .font(.title2)
                .fontWeight(.semibold)
                .foregroundColor(.primary)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 12) {
                    ForEach(categories, id: \.self) { category in
                        Button(action: {
                            withAnimation(.spring()) {
                                selectedCategory = category
                            }
                            triggerHaptic()
                        }) {
                            Text(category)
                                .font(.subheadline)
                                .fontWeight(.medium)
                                .foregroundColor(selectedCategory == category ? .white : categoryColor(category))
                                .padding(.horizontal, 16)
                                .padding(.vertical, 8)
                                .background(
                                    RoundedRectangle(cornerRadius: 20)
                                        .fill(selectedCategory == category ? categoryColor(category) : categoryColor(category).opacity(0.1))
                                )
                        }
                        .buttonStyle(PlainButtonStyle())
                    }
                }
                .padding(.horizontal)
            }
        }
    }
    
    // MARK: - 3. Scenarios Section
    private var scenariosSection: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack {
                Text("Escenarios Disponibles")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .foregroundColor(.primary)
                
                Spacer()
                
                Text("\(filteredScenarios.count) escenarios")
                    .font(.caption)
                    .padding(.horizontal, 8)
                    .padding(.vertical, 4)
                    .background(
                        RoundedRectangle(cornerRadius: 8)
                            .fill(Color.purple.opacity(0.2))
                    )
                    .foregroundColor(.purple)
            }
            
            Text("Cada escenario simula una situación real de crianza donde tu respuesta impacta el desarrollo emocional de tu hijo")
                .font(.subheadline)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.leading)
            
            if !filteredScenarios.isEmpty {
                LazyVGrid(columns: [
                    GridItem(.flexible())
                ], spacing: 16) {
                    ForEach(filteredScenarios) { scenario in
                        Capa4SimulationCard(scenario: scenario)
                    }
                }
            } else {
                VStack(spacing: 12) {
                    Image(systemName: "brain.head.profile")
                        .font(.system(size: 60))
                        .foregroundColor(.secondary)
                    
                    Text("No hay escenarios en esta categoría")
                        .font(.body)
                        .foregroundColor(.secondary)
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 40)
            }
        }
    }
    
    // MARK: - 4. Progress Section
    private var progressSection: some View {
        VStack(spacing: 16) {
            Text("📊 Tu Progreso")
                .font(.title2)
                .fontWeight(.semibold)
                .foregroundColor(.primary)
            
            VStack(spacing: 12) {
                HStack {
                    Text("Escenarios Completados:")
                        .font(.body)
                        .foregroundColor(.secondary)
                    
                    Spacer()
                    
                    Text("0/\(Capa4EscenariosData.escenarios.count)")
                        .font(.headline)
                        .foregroundColor(.purple)
                }
                
                ProgressView(value: 0.0, total: 1.0)
                    .tint(.purple)
                
                Text("Cada simulación fortalece tu cerebro receptivo")
                    .font(.caption)
                    .foregroundColor(.secondary)
                    .italic()
            }
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 16)
                    .fill(Color.purple.opacity(0.05))
                    .overlay(
                        RoundedRectangle(cornerRadius: 16)
                            .stroke(Color.purple.opacity(0.2), lineWidth: 1)
                    )
            )
        }
    }
    
    // MARK: - Helper Functions
    private var filteredScenarios: [Capa4Scenario] {
        if selectedCategory == "Todos" {
            return Capa4EscenariosData.escenarios
        } else {
            return Capa4EscenariosData.escenarios.filter { $0.category == selectedCategory }
        }
    }
    
    private func categoryColor(_ category: String) -> Color {
        switch category {
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
struct Capa4View_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            Capa4View()
                .environmentObject(ProgresoManager())
        }
    }
}

