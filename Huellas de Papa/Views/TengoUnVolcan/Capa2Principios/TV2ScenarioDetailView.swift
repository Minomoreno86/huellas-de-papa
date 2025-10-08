import SwiftUI

/// Vista de detalle completa para un escenario de aplicación
struct TV2ScenarioDetailView: View {
    let scenario: TV2Scenario
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 24) {
                // 1. Situación
                sectionCard(
                    icon: "book.fill",
                    title: "La Situación",
                    content: scenario.situation,
                    color: .blue
                )
                
                // 2. Análisis
                analysisSection
                
                // 3. Intervención
                sectionCard(
                    icon: "hand.raised.fill",
                    title: "Intervención Aplicada",
                    content: scenario.interventionApplied,
                    color: .mint
                )
                
                // 4. Resultado
                sectionCard(
                    icon: "checkmark.circle.fill",
                    title: "Resultado",
                    content: scenario.outcome,
                    color: .green
                )
                
                // 5. Lección aprendida
                lessonLearnedSection
            }
            .padding()
        }
        .navigationTitle(scenario.title)
        .navigationBarTitleDisplayMode(.large)
        .background(Color(.systemGroupedBackground))
    }
    
    // MARK: - Analysis Section
    private var analysisSection: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack {
                Image(systemName: "magnifyingglass")
                    .foregroundColor(.orange)
                    .font(.title2)
                
                Text("Análisis del Volcán")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .foregroundColor(.primary)
            }
            
            // Botón presionado
            analysisItem(
                icon: "circle.grid.cross.fill",
                label: "Botón Presionado",
                content: scenario.triggerIdentified,
                color: .red
            )
            
            // Nube de humo
            analysisItem(
                icon: "cloud.fill",
                label: "Nube de Humo",
                content: scenario.thoughtPatternIdentified,
                color: .purple
            )
            
            // Fase del volcán
            analysisItem(
                icon: phaseIcon,
                label: "Fase del Volcán",
                content: scenario.volcanoPhase,
                color: phaseColor
            )
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(Color(.systemBackground))
                .shadow(color: Color.black.opacity(0.1), radius: 8, x: 0, y: 2)
        )
    }
    
    private func analysisItem(icon: String, label: String, content: String, color: Color) -> some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                Image(systemName: icon)
                    .foregroundColor(color)
                
                Text(label)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundColor(color)
            }
            
            Text(content)
                .font(.body)
                .foregroundColor(.primary)
                .fixedSize(horizontal: false, vertical: true)
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(
                    RoundedRectangle(cornerRadius: 8)
                        .fill(color.opacity(0.1))
                )
        }
    }
    
    // MARK: - Lesson Learned Section
    private var lessonLearnedSection: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack {
                Image(systemName: "lightbulb.fill")
                    .foregroundColor(.yellow)
                    .font(.title2)
                
                Text("Lección Aprendida")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .foregroundColor(.primary)
            }
            
            VStack(alignment: .leading, spacing: 12) {
                HStack(alignment: .top, spacing: 12) {
                    Image(systemName: "quote.opening")
                        .foregroundColor(.orange)
                        .font(.title3)
                    
                    Text(scenario.lessonLearned)
                        .font(.callout)
                        .foregroundColor(.primary)
                        .fontWeight(.medium)
                        .fixedSize(horizontal: false, vertical: true)
                        .lineSpacing(6)
                }
            }
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 12)
                    .fill(
                        LinearGradient(
                            gradient: Gradient(colors: [.orange.opacity(0.2), .yellow.opacity(0.1)]),
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                    )
            )
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(Color(.systemBackground))
                .shadow(color: Color.black.opacity(0.1), radius: 8, x: 0, y: 2)
        )
    }
    
    // MARK: - Section Card Helper
    private func sectionCard(icon: String, title: String, content: String, color: Color) -> some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack {
                Image(systemName: icon)
                    .foregroundColor(color)
                    .font(.title2)
                
                Text(title)
                    .font(.title2)
                    .fontWeight(.semibold)
                    .foregroundColor(.primary)
            }
            
            Text(content)
                .font(.body)
                .foregroundColor(.secondary)
                .fixedSize(horizontal: false, vertical: true)
                .lineSpacing(6)
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(Color(.systemBackground))
                .shadow(color: Color.black.opacity(0.1), radius: 8, x: 0, y: 2)
        )
    }
    
    // MARK: - Helpers
    private var phaseIcon: String {
        if scenario.volcanoPhase.contains("Chispa") {
            return "flame.fill"
        } else if scenario.volcanoPhase.contains("Burbujeo") {
            return "smoke.fill"
        } else if scenario.volcanoPhase.contains("Erupción") {
            return "tornado"
        }
        return "flame.fill"
    }
    
    private var phaseColor: Color {
        if scenario.volcanoPhase.contains("Chispa") {
            return .orange
        } else if scenario.volcanoPhase.contains("Burbujeo") {
            return .red
        } else if scenario.volcanoPhase.contains("Erupción") {
            return .purple
        }
        return .orange
    }
}

#Preview {
    NavigationStack {
        TV2ScenarioDetailView(scenario: TV2Data.scenarios[0])
    }
}

