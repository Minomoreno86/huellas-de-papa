import SwiftUI

/// Tarjeta visual para mostrar un ejemplo de aplicación del modelo del volcán
struct TV1ExampleCard: View {
    let example: TV1Example
    @State private var showingAfter = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            // Header con fase del volcán
            HStack {
                VStack(alignment: .leading, spacing: 4) {
                    Text(example.volcanoPhase.rawValue)
                        .font(.caption)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .padding(.horizontal, 12)
                        .padding(.vertical, 6)
                        .background(
                            Capsule()
                                .fill(phaseColor)
                        )
                    
                    Text(example.childName)
                        .font(.title3)
                        .fontWeight(.bold)
                        .foregroundColor(.primary)
                }
                
                Spacer()
                
                Image(systemName: phaseIcon)
                    .font(.title)
                    .foregroundColor(phaseColor)
            }
            
            // Scenario
            Text(example.scenario)
                .font(.subheadline)
                .foregroundColor(.secondary)
                .fontWeight(.medium)
            
            Divider()
            
            // Toggle para ver antes/después
            Picker("Vista", selection: $showingAfter) {
                Text("Sin Gestión").tag(false)
                Text("Con Gestión").tag(true)
            }
            .pickerStyle(.segmented)
            
            // Contenido según toggle
            VStack(alignment: .leading, spacing: 12) {
                HStack {
                    Image(systemName: showingAfter ? "checkmark.circle.fill" : "xmark.circle.fill")
                        .foregroundColor(showingAfter ? .green : .red)
                    
                    Text(showingAfter ? "Con Herramientas" : "Sin Herramientas")
                        .font(.headline)
                        .foregroundColor(showingAfter ? .green : .red)
                }
                
                Text(showingAfter ? example.afterManagement : example.beforeManagement)
                    .font(.body)
                    .foregroundColor(.primary)
                    .fixedSize(horizontal: false, vertical: true)
            }
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 12)
                    .fill(showingAfter ? Color.green.opacity(0.1) : Color.red.opacity(0.1))
            )
            
            // Clinical Insight
            VStack(alignment: .leading, spacing: 8) {
                HStack {
                    Image(systemName: "brain.head.profile")
                        .foregroundColor(.blue)
                    
                    Text("Insight Clínico")
                        .font(.caption)
                        .fontWeight(.semibold)
                        .foregroundColor(.blue)
                }
                
                Text(example.clinicalInsight)
                    .font(.caption)
                    .foregroundColor(.secondary)
                    .fixedSize(horizontal: false, vertical: true)
            }
        }
        .padding(20)
        .frame(width: 340)
        .background(
            RoundedRectangle(cornerRadius: 20)
                .fill(Color(.systemBackground))
                .shadow(color: Color.black.opacity(0.1), radius: 10, x: 0, y: 4)
        )
    }
    
    // Helper para colores según fase
    private var phaseColor: Color {
        switch example.volcanoPhase {
        case .chispa: return .orange
        case .burbujeo: return .red
        case .erupcion: return .purple
        }
    }
    
    // Helper para iconos según fase
    private var phaseIcon: String {
        switch example.volcanoPhase {
        case .chispa: return "flame.fill"
        case .burbujeo: return "smoke.fill"
        case .erupcion: return "tornado"
        }
    }
}

#Preview {
    ScrollView(.horizontal) {
        HStack {
            ForEach(TV1Data.clinicalExamples) { example in
                TV1ExampleCard(example: example)
            }
        }
        .padding()
    }
    .background(Color(.systemGroupedBackground))
}

