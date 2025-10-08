import SwiftUI

/// Vista que muestra el mapa de regulación para un principio específico
/// Visualiza sobre-activación, sub-activación y estrategias de corrección
struct RegulationMapView: View {
    let map: Capa2RegulationMap
    @State private var showingDetails = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            // Header
            HStack {
                Text("Mapa de Regulación")
                    .font(.headline)
                    .fontWeight(.bold)
                    .foregroundColor(.primary)
                
                Spacer()
                
                Image(systemName: "arrow.right.circle.fill")
                    .font(.title3)
                    .foregroundColor(.blue)
            }
            
            // Descripción
            Text("Señales de desbalance y estrategias de corrección")
                .font(.caption)
                .foregroundColor(.secondary)
            
            // Mapa visual simplificado
            VStack(spacing: 12) {
                // Sobre-activación
                HStack {
                    Circle()
                        .fill(Color.red.opacity(0.3))
                        .frame(width: 12, height: 12)
                    
                    Text("Sobre-activación:")
                        .font(.caption)
                        .fontWeight(.semibold)
                        .foregroundColor(.red)
                    
                    Spacer()
                }
                
                Text(map.overActivation)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                    .padding(.leading, 24)
                
                // Sub-activación
                HStack {
                    Circle()
                        .fill(Color.blue.opacity(0.3))
                        .frame(width: 12, height: 12)
                    
                    Text("Sub-activación:")
                        .font(.caption)
                        .fontWeight(.semibold)
                        .foregroundColor(.blue)
                    
                    Spacer()
                }
                
                Text(map.underActivation)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                    .padding(.leading, 24)
                
                // Estrategia de corrección
                VStack(alignment: .leading, spacing: 8) {
                    Text("💡 Estrategia de Corrección:")
                        .font(.caption)
                        .fontWeight(.semibold)
                        .foregroundColor(.primary)
                    
                    Text(map.correctionStrategy)
                        .font(.subheadline)
                        .foregroundColor(.blue)
                        .italic()
                }
                .padding(.top, 8)
            }
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(Color(.systemBackground))
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
            radius: 6,
            x: 0,
            y: 3
        )
        .onTapGesture {
            showingDetails = true
            triggerHaptic()
        }
        .sheet(isPresented: $showingDetails) {
            RegulationDetailView(map: map)
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

/// Vista detallada del mapa de regulación
struct RegulationDetailView: View {
    let map: Capa2RegulationMap
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 24) {
                    // Header
                    VStack(alignment: .leading, spacing: 12) {
                        Text("Mapa de Regulación")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .foregroundStyle(
                                LinearGradient(
                                    gradient: Gradient(colors: [.blue, .mint]),
                                    startPoint: .leading,
                                    endPoint: .trailing
                                )
                            )
                        
                        Text("Principio: \(map.principle)")
                            .font(.title3)
                            .foregroundColor(.secondary)
                    }
                    
                    // Sobre-activación
                    VStack(alignment: .leading, spacing: 12) {
                        HStack {
                            Image(systemName: "exclamationmark.triangle.fill")
                                .foregroundColor(.red)
                            Text("Sobre-activación")
                                .font(.headline)
                                .fontWeight(.semibold)
                                .foregroundColor(.red)
                        }
                        
                        Text(map.overActivation)
                            .font(.body)
                            .foregroundColor(.primary)
                            .padding()
                            .background(
                                RoundedRectangle(cornerRadius: 12)
                                    .fill(Color.red.opacity(0.1))
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 12)
                                            .stroke(Color.red.opacity(0.3), lineWidth: 1)
                                    )
                            )
                    }
                    
                    // Sub-activación
                    VStack(alignment: .leading, spacing: 12) {
                        HStack {
                            Image(systemName: "minus.circle.fill")
                                .foregroundColor(.blue)
                            Text("Sub-activación")
                                .font(.headline)
                                .fontWeight(.semibold)
                                .foregroundColor(.blue)
                        }
                        
                        Text(map.underActivation)
                            .font(.body)
                            .foregroundColor(.primary)
                            .padding()
                            .background(
                                RoundedRectangle(cornerRadius: 12)
                                    .fill(Color.blue.opacity(0.1))
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 12)
                                            .stroke(Color.blue.opacity(0.3), lineWidth: 1)
                                    )
                            )
                    }
                    
                    // Estrategia de corrección
                    VStack(alignment: .leading, spacing: 12) {
                        HStack {
                            Image(systemName: "checkmark.circle.fill")
                                .foregroundColor(.green)
                            Text("Estrategia de Corrección")
                                .font(.headline)
                                .fontWeight(.semibold)
                                .foregroundColor(.green)
                        }
                        
                        Text(map.correctionStrategy)
                            .font(.body)
                            .foregroundColor(.primary)
                            .padding()
                            .background(
                                RoundedRectangle(cornerRadius: 12)
                                    .fill(Color.green.opacity(0.1))
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 12)
                                            .stroke(Color.green.opacity(0.3), lineWidth: 1)
                                    )
                            )
                    }
                }
                .padding()
            }
            .navigationTitle("Regulación")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Cerrar") {
                        dismiss()
                    }
                }
            }
        }
    }
}

// MARK: - Preview
struct RegulationMapView_Previews: PreviewProvider {
    static var previews: some View {
        RegulationMapView(
            map: Capa2RegulationMap(
                principle: "Balance",
                overActivation: "Hiperreactivo, impulsivo, no puede parar",
                underActivation: "Desconectado, pasivo, sin energía",
                correctionStrategy: "Respiración profunda, movimiento suave, conexión visual"
            )
        )
        .padding()
        .background(Color(.systemGroupedBackground))
    }
}