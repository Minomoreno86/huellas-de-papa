import SwiftUI

/// Vista que muestra el mapa físico del volcán con señales corporales
struct TV1PhysicalSignalView: View {
    let selectedPhase: TV1PhysicalSignal.VolcanoPhase
    
    // Señales filtradas por fase
    private var filteredSignals: [TV1PhysicalSignal] {
        TV1Data.physicalSignals.filter { $0.phase == selectedPhase }
    }
    
    var body: some View {
        VStack(spacing: 16) {
            // Ilustración simbólica del cuerpo
            bodyIllustration
            
            // Lista de señales
            VStack(spacing: 12) {
                ForEach(filteredSignals) { signal in
                    signalRow(signal)
                }
            }
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 20)
                .fill(Color(.systemBackground))
                .shadow(color: Color.black.opacity(0.1), radius: 8, x: 0, y: 2)
        )
    }
    
    // MARK: - Body Illustration
    private var bodyIllustration: some View {
        ZStack {
            // Silueta simple
            VStack(spacing: 4) {
                // Cabeza
                Circle()
                    .fill(phaseColor.opacity(0.3))
                    .frame(width: 60, height: 60)
                    .overlay(
                        Image(systemName: "person.fill")
                            .font(.title)
                            .foregroundColor(phaseColor)
                    )
                
                // Cuerpo
                RoundedRectangle(cornerRadius: 20)
                    .fill(phaseColor.opacity(0.2))
                    .frame(width: 80, height: 120)
            }
            
            // Indicador visual de fase
            VStack {
                Spacer()
                
                HStack {
                    Image(systemName: phaseIcon)
                        .font(.title2)
                        .foregroundColor(phaseColor)
                    
                    Text(selectedPhase.rawValue)
                        .font(.caption)
                        .fontWeight(.semibold)
                        .foregroundColor(phaseColor)
                }
                .padding(.horizontal, 12)
                .padding(.vertical, 6)
                .background(
                    Capsule()
                        .fill(Color(.systemBackground))
                        .shadow(radius: 4)
                )
            }
        }
        .frame(height: 220)
        .frame(maxWidth: .infinity)
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(phaseColor.opacity(0.1))
        )
    }
    
    // MARK: - Signal Row
    private func signalRow(_ signal: TV1PhysicalSignal) -> some View {
        HStack(alignment: .top, spacing: 12) {
            Image(systemName: signal.iconName)
                .font(.title3)
                .foregroundColor(phaseColor)
                .frame(width: 30)
            
            VStack(alignment: .leading, spacing: 4) {
                Text(signal.bodyPart)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundColor(.primary)
                
                Text(signal.description)
                    .font(.caption)
                    .foregroundColor(.secondary)
                    .fixedSize(horizontal: false, vertical: true)
            }
            
            Spacer()
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(phaseColor.opacity(0.1))
        )
    }
    
    // MARK: - Helpers
    private var phaseColor: Color {
        switch selectedPhase {
        case .chispa: return .orange
        case .burbujeo: return .red
        case .erupcion: return .purple
        }
    }
    
    private var phaseIcon: String {
        switch selectedPhase {
        case .chispa: return "flame.fill"
        case .burbujeo: return "smoke.fill"
        case .erupcion: return "tornado"
        }
    }
}

#Preview {
    ScrollView {
        VStack(spacing: 20) {
            TV1PhysicalSignalView(selectedPhase: .chispa)
            TV1PhysicalSignalView(selectedPhase: .burbujeo)
            TV1PhysicalSignalView(selectedPhase: .erupcion)
        }
        .padding()
    }
    .background(Color(.systemGroupedBackground))
}

