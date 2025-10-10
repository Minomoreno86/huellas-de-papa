import SwiftUI

/// Tarjeta que muestra un escenario de aplicación práctica
struct BM2ScenarioCard: View {
    let scenario: BM2Scenario
    @State private var showingDetail = false
    
    var body: some View {
        Button(action: {
            triggerHaptic()
            showingDetail = true
        }) {
            VStack(alignment: .leading, spacing: 12) {
                // Badge del principio
                HStack {
                    Text("Principio \(scenario.principleNumber)")
                        .font(.caption)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .padding(.horizontal, 12)
                        .padding(.vertical, 6)
                        .background(
                            Capsule()
                                .fill(Color.blue)
                        )
                    
                    Spacer()
                    
                    Image(systemName: "chevron.right")
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
                
                Text(scenario.situation)
                    .font(.headline)
                    .fontWeight(.semibold)
                    .foregroundColor(.primary)
                    .multilineTextAlignment(.leading)
                    .lineLimit(3)
                
                Divider()
                
                // Preview de respuestas
                VStack(alignment: .leading, spacing: 8) {
                    HStack(spacing: 4) {
                        Image(systemName: "xmark.circle.fill")
                            .font(.caption)
                            .foregroundColor(.red.opacity(0.7))
                        Text("Error común")
                            .font(.caption)
                            .foregroundColor(.secondary)
                    }
                    
                    HStack(spacing: 4) {
                        Image(systemName: "checkmark.circle.fill")
                            .font(.caption)
                            .foregroundColor(.mint)
                        Text("Bésame Mucho")
                            .font(.caption)
                            .foregroundColor(.secondary)
                    }
                }
            }
            .padding()
            .frame(width: 280)
            .background(
                RoundedRectangle(cornerRadius: 16)
                    .fill(Color(.systemBackground))
                    .shadow(color: Color.blue.opacity(0.15), radius: 8, x: 0, y: 4)
            )
        }
        .sheet(isPresented: $showingDetail) {
            BM2ScenarioDetailView(scenario: scenario)
        }
    }
    
    private func triggerHaptic() {
        #if !os(macOS)
        let impactFeedback = UIImpactFeedbackGenerator(style: .light)
        impactFeedback.impactOccurred()
        #endif
    }
}

/// Vista detallada de un escenario
struct BM2ScenarioDetailView: View {
    let scenario: BM2Scenario
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 24) {
                    // Badge del principio
                    Text("Principio \(scenario.principleNumber)")
                        .font(.caption)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .padding(.horizontal, 16)
                        .padding(.vertical, 8)
                        .background(
                            Capsule()
                                .fill(Color.blue)
                        )
                    
                    // Situación
                    VStack(alignment: .leading, spacing: 12) {
                        Label("Situación", systemImage: "person.2.fill")
                            .font(.headline)
                            .foregroundColor(.primary)
                        
                        Text(scenario.situation)
                            .font(.title3)
                            .fontWeight(.semibold)
                            .foregroundColor(.primary)
                    }
                    
                    Divider()
                    
                    // Error común
                    VStack(alignment: .leading, spacing: 12) {
                        HStack {
                            Image(systemName: "xmark.circle.fill")
                                .foregroundColor(.red.opacity(0.7))
                            Text("Error Común")
                                .font(.headline)
                                .foregroundColor(.primary)
                        }
                        
                        Text(scenario.commonMistake)
                            .font(.body)
                            .foregroundColor(.primary)
                            .italic()
                    }
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 12)
                            .fill(Color.red.opacity(0.05))
                            .overlay(
                                RoundedRectangle(cornerRadius: 12)
                                    .stroke(Color.red.opacity(0.3), lineWidth: 1)
                            )
                    )
                    
                    // Respuesta Bésame Mucho
                    VStack(alignment: .leading, spacing: 12) {
                        HStack {
                            Image(systemName: "checkmark.circle.fill")
                                .foregroundColor(.mint)
                            Text("Respuesta Bésame Mucho")
                                .font(.headline)
                                .foregroundColor(.primary)
                        }
                        
                        Text(scenario.besameMuchoResponse)
                            .font(.body)
                            .foregroundColor(.primary)
                            .fontWeight(.medium)
                    }
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 12)
                            .fill(Color.mint.opacity(0.1))
                            .overlay(
                                RoundedRectangle(cornerRadius: 12)
                                    .stroke(Color.mint.opacity(0.3), lineWidth: 1)
                            )
                    )
                    
                    // Resultado esperado
                    VStack(alignment: .leading, spacing: 12) {
                        HStack {
                            Image(systemName: "star.fill")
                                .foregroundColor(.blue)
                            Text("Resultado Esperado")
                                .font(.headline)
                                .foregroundColor(.primary)
                        }
                        
                        Text(scenario.expectedOutcome)
                            .font(.body)
                            .foregroundColor(.primary)
                    }
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 12)
                            .fill(Color.blue.opacity(0.1))
                    )
                }
                .padding()
            }
            .navigationTitle("Caso Práctico")
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

