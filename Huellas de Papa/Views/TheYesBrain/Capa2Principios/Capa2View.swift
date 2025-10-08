import SwiftUI

/// Vista principal de la Capa 2 (Principios de Integración) del módulo The Yes Brain
/// Enseña los cuatro pilares que sostienen el cerebro receptivo
struct Capa2View: View {
    @EnvironmentObject var progresoManager: ProgresoManager
    @State private var selectedPrinciple: String = ""
    
    var body: some View {
        ScrollView {
            VStack(spacing: 32) {
                // 1. Header Section
                headerSection
                
                // 2. Ideas Clave Section
                ideasClaveSection
                
                // 3. Quote Banner Section
                quoteBannerSection
            }
            .padding()
        }
        .navigationTitle("20 Ideas Clave")
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
            Text("20 Ideas Clave del Yes Brain")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundStyle(
                    LinearGradient(
                        gradient: Gradient(colors: [.blue, .mint]),
                        startPoint: .leading,
                        endPoint: .trailing
                    )
                )
            
            Text("Desarrollo neuropsicológico profundo basado en el libro de Daniel J. Siegel y Tina Payne Bryson")
                .font(.title3)
                .fontWeight(.medium)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
                .lineLimit(nil)
            
            Text("Fundamentos científicos • Casos clínicos • Aplicaciones parentales")
                .font(.subheadline)
                .foregroundColor(.blue)
                .multilineTextAlignment(.center)
                .italic()
        }
        .padding(.vertical)
    }
    
    // MARK: - 2. Ideas Clave Section
    private var ideasClaveSection: some View {
        VStack(alignment: .leading, spacing: 20) {
            HStack {
                Text("Explora las Ideas")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .foregroundColor(.primary)
                
                Spacer()
                
                Text("\(Capa2IdeasClaveData.ideasClave.count) ideas")
                    .font(.caption)
                    .padding(.horizontal, 8)
                    .padding(.vertical, 4)
                    .background(
                        RoundedRectangle(cornerRadius: 8)
                            .fill(Color.blue.opacity(0.2))
                    )
                    .foregroundColor(.blue)
            }
            
            Text("Toca cualquier idea para explorar su desarrollo neuropsicológico completo, casos clínicos y aplicaciones parentales específicas")
                .font(.subheadline)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.leading)
            
            LazyVGrid(columns: [
                GridItem(.flexible())
            ], spacing: 16) {
                ForEach(Capa2IdeasClaveData.ideasClave) { idea in
                    Capa2IdeaClaveCard(idea: idea)
                }
            }
        }
    }
    
    
    // MARK: - 5. Quote Banner Section
    private var quoteBannerSection: some View {
        VStack(spacing: 20) {
            Text("💡 Recordatorio Clave")
                .font(.headline)
                .fontWeight(.semibold)
                .foregroundColor(.primary)
            
            VStack(spacing: 12) {
                Text("\"Tu calma enseña, tu conexión construye\"")
                    .font(.title3)
                    .fontWeight(.medium)
                    .foregroundColor(.primary)
                    .multilineTextAlignment(.center)
                    .italic()
                
                Text("— Daniel J. Siegel")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
            .padding(.vertical, 24)
            .padding(.horizontal, 20)
            .background(
                RoundedRectangle(cornerRadius: 16)
                    .fill(
                        LinearGradient(
                            gradient: Gradient(colors: [
                                Color.blue.opacity(0.1),
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
                                        Color.blue.opacity(0.3),
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
                color: Color.blue.opacity(0.1),
                radius: 8,
                x: 0,
                y: 4
            )
        }
    }
    
    
    // MARK: - Haptic Feedback
    private func triggerHaptic() {
        #if !os(macOS)
        let impactFeedback = UIImpactFeedbackGenerator(style: .light)
        impactFeedback.impactOccurred()
        #endif
    }
}

// MARK: - Preview
struct Capa2View_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            Capa2View()
                .environmentObject(ProgresoManager())
        }
    }
}