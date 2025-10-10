import SwiftUI

/// Tarjeta que muestra un ejemplo clínico comparativo
struct BM1ExampleCard: View {
    let example: BM1Example
    @State private var showingDetail = false
    
    var body: some View {
        Button(action: {
            triggerHaptic()
            showingDetail = true
        }) {
            VStack(alignment: .leading, spacing: 12) {
                // Icono de escenario
                HStack {
                    Image(systemName: "person.2.fill")
                        .font(.title3)
                        .foregroundColor(.blue)
                    
                    Spacer()
                    
                    Image(systemName: "chevron.right")
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
                
                Text(example.scenario)
                    .font(.headline)
                    .fontWeight(.semibold)
                    .foregroundColor(.primary)
                    .multilineTextAlignment(.leading)
                    .lineLimit(3)
                
                Divider()
                
                // Preview de enfoques
                HStack(spacing: 8) {
                    Label("Autoritario", systemImage: "xmark.circle.fill")
                        .font(.caption)
                        .foregroundColor(.red.opacity(0.7))
                    
                    Spacer()
                    
                    Label("Con Apego", systemImage: "checkmark.circle.fill")
                        .font(.caption)
                        .foregroundColor(.mint)
                }
            }
            .padding()
            .frame(width: 300, height: 160)
            .background(
                RoundedRectangle(cornerRadius: 16)
                    .fill(Color(.systemBackground))
                    .shadow(color: Color.blue.opacity(0.15), radius: 8, x: 0, y: 4)
            )
        }
        .sheet(isPresented: $showingDetail) {
            BM1ExampleDetailView(example: example)
        }
    }
    
    private func triggerHaptic() {
        let impactFeedback = UIImpactFeedbackGenerator(style: .light)
        impactFeedback.impactOccurred()
    }
}

/// Vista detallada de un ejemplo clínico
struct BM1ExampleDetailView: View {
    let example: BM1Example
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 24) {
                    // Escenario
                    VStack(alignment: .leading, spacing: 12) {
                        HStack {
                            Image(systemName: "person.2.fill")
                                .foregroundColor(.blue)
                            Text("Situación")
                                .font(.headline)
                                .foregroundColor(.primary)
                        }
                        
                        Text(example.scenario)
                            .font(.title3)
                            .fontWeight(.semibold)
                            .foregroundColor(.primary)
                    }
                    
                    Divider()
                    
                    // Enfoque Autoritario
                    VStack(alignment: .leading, spacing: 12) {
                        HStack {
                            Image(systemName: "xmark.circle.fill")
                                .foregroundColor(.red.opacity(0.7))
                            Text("Enfoque Autoritario")
                                .font(.headline)
                                .foregroundColor(.primary)
                        }
                        
                        Text(example.authoritarianApproach)
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
                    
                    // Enfoque Bésame Mucho
                    VStack(alignment: .leading, spacing: 12) {
                        HStack {
                            Image(systemName: "checkmark.circle.fill")
                                .foregroundColor(.mint)
                            Text("Enfoque Bésame Mucho")
                                .font(.headline)
                                .foregroundColor(.primary)
                        }
                        
                        Text(example.attachmentApproach)
                            .font(.body)
                            .foregroundColor(.primary)
                            .italic()
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
                    
                    // Insight clínico
                    VStack(alignment: .leading, spacing: 12) {
                        HStack {
                            Image(systemName: "lightbulb.fill")
                                .foregroundColor(.blue)
                            Text("Por qué funciona")
                                .font(.headline)
                                .foregroundColor(.primary)
                        }
                        
                        Text(example.clinicalInsight)
                            .font(.body)
                            .foregroundColor(.primary)
                    }
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 12)
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

