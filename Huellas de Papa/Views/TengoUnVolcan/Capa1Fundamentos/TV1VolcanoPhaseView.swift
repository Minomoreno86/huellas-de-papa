import SwiftUI

/// Vista interactiva que muestra las tres fases del volcán
struct TV1VolcanoPhaseView: View {
    @Binding var selectedPhase: TV1PhysicalSignal.VolcanoPhase
    
    var body: some View {
        VStack(spacing: 24) {
            // Visualización del volcán animado
            volcanoVisualization
            
            // Selector de fases
            phaseSelector
            
            // Descripción de la fase seleccionada
            phaseDescription
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 20)
                .fill(Color(.systemBackground))
                .shadow(color: Color.black.opacity(0.1), radius: 10, x: 0, y: 4)
        )
    }
    
    // MARK: - Volcano Visualization
    private var volcanoVisualization: some View {
        ZStack {
            // Base del volcán (triángulo)
            Triangle()
                .fill(
                    LinearGradient(
                        gradient: Gradient(colors: [.brown, .gray]),
                        startPoint: .top,
                        endPoint: .bottom
                    )
                )
                .frame(width: 200, height: 150)
            
            // Efecto según fase
            VStack {
                phaseEffect
                Spacer()
            }
            .offset(y: -80)
        }
        .frame(height: 200)
    }
    
    // MARK: - Phase Effect
    @ViewBuilder
    private var phaseEffect: some View {
        switch selectedPhase {
        case .chispa:
            // Chispa inicial - pequeña llama
            Image(systemName: "flame.fill")
                .font(.title)
                .foregroundColor(.orange)
                .scaleEffect(1.0)
                .animation(.easeInOut(duration: 1.0).repeatForever(autoreverses: true), value: selectedPhase)
            
        case .burbujeo:
            // Burbujeo - humo creciente
            VStack(spacing: 4) {
                Image(systemName: "smoke.fill")
                    .font(.title2)
                    .foregroundColor(.red)
                Image(systemName: "smoke.fill")
                    .font(.title3)
                    .foregroundColor(.orange)
            }
            .scaleEffect(1.2)
            .animation(.easeInOut(duration: 0.8).repeatForever(autoreverses: true), value: selectedPhase)
            
        case .erupcion:
            // Erupción - explosión completa
            VStack(spacing: 2) {
                Image(systemName: "tornado")
                    .font(.largeTitle)
                    .foregroundColor(.purple)
                Image(systemName: "smoke.fill")
                    .font(.title)
                    .foregroundColor(.red)
                Image(systemName: "flame.fill")
                    .font(.title2)
                    .foregroundColor(.orange)
            }
            .scaleEffect(1.5)
            .animation(.easeInOut(duration: 0.5).repeatForever(autoreverses: true), value: selectedPhase)
        }
    }
    
    // MARK: - Phase Selector
    private var phaseSelector: some View {
        HStack(spacing: 12) {
            phaseButton(phase: .chispa, icon: "flame.fill", color: .orange)
            phaseButton(phase: .burbujeo, icon: "smoke.fill", color: .red)
            phaseButton(phase: .erupcion, icon: "tornado", color: .purple)
        }
    }
    
    private func phaseButton(phase: TV1PhysicalSignal.VolcanoPhase, icon: String, color: Color) -> some View {
        Button {
            withAnimation(.spring()) {
                selectedPhase = phase
            }
        } label: {
            VStack(spacing: 8) {
                Image(systemName: icon)
                    .font(.title2)
                    .foregroundColor(selectedPhase == phase ? .white : color)
                    .frame(width: 50, height: 50)
                    .background(
                        Circle()
                            .fill(selectedPhase == phase ? color : color.opacity(0.2))
                    )
                
                Text(phaseName(phase))
                    .font(.caption)
                    .fontWeight(selectedPhase == phase ? .semibold : .regular)
                    .foregroundColor(selectedPhase == phase ? color : .secondary)
            }
        }
        .frame(maxWidth: .infinity)
    }
    
    // MARK: - Phase Description
    private var phaseDescription: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                Image(systemName: "info.circle.fill")
                    .foregroundColor(phaseColor)
                
                Text(selectedPhase.rawValue)
                    .font(.headline)
                    .foregroundColor(.primary)
            }
            
            Text(phaseDescriptionText)
                .font(.body)
                .foregroundColor(.secondary)
                .fixedSize(horizontal: false, vertical: true)
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(phaseColor.opacity(0.1))
        )
    }
    
    // MARK: - Helpers
    private func phaseName(_ phase: TV1PhysicalSignal.VolcanoPhase) -> String {
        switch phase {
        case .chispa: return "Chispa"
        case .burbujeo: return "Burbujeo"
        case .erupcion: return "Erupción"
        }
    }
    
    private var phaseColor: Color {
        switch selectedPhase {
        case .chispa: return .orange
        case .burbujeo: return .red
        case .erupcion: return .purple
        }
    }
    
    private var phaseDescriptionText: String {
        switch selectedPhase {
        case .chispa:
            return "El primer indicio de la emoción. Un calor extraño que aparece en el estómago y empieza a subir por el cuerpo. Es la señal más temprana del volcán."
        case .burbujeo:
            return "La intensificación de la emoción. El volcán avisa que se está calentando con señales físicas claras: tensión muscular, respiración acelerada, puños cerrados."
        case .erupcion:
            return "La explosión completa de la emoción. La rabia se vuelve muy intensa y puede dominar las acciones: gritos, lágrimas, pataletas o un silencio profundo."
        }
    }
}

// MARK: - Triangle Shape
struct Triangle: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        path.move(to: CGPoint(x: rect.midX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.closeSubpath()
        
        return path
    }
}

#Preview {
    struct PreviewWrapper: View {
        @State private var selectedPhase: TV1PhysicalSignal.VolcanoPhase = .chispa
        
        var body: some View {
            ScrollView {
                TV1VolcanoPhaseView(selectedPhase: $selectedPhase)
                    .padding()
            }
            .background(Color(.systemGroupedBackground))
        }
    }
    
    return PreviewWrapper()
}

