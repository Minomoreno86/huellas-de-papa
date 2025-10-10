import SwiftUI

/// Tarjeta que muestra uno de los pilares de la crianza con apego
struct BM1PillarCard: View {
    let pillar: BM1Pillar
    @State private var showingDetail = false
    
    var body: some View {
        Button(action: {
            triggerHaptic()
            showingDetail = true
        }) {
            VStack(spacing: 12) {
                // Icono
                Circle()
                    .fill(
                        LinearGradient(
                            gradient: Gradient(colors: [.blue, .mint]),
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                    )
                    .frame(width: 60, height: 60)
                    .overlay(
                        Image(systemName: iconForPillar(pillar.name))
                            .font(.title2)
                            .foregroundColor(.white)
                    )
                
                Text(pillar.name)
                    .font(.headline)
                    .fontWeight(.semibold)
                    .foregroundColor(.primary)
                    .multilineTextAlignment(.center)
                    .lineLimit(2)
                    .fixedSize(horizontal: false, vertical: true)
                
                Text(pillar.definition)
                    .font(.caption)
                    .foregroundColor(.secondary)
                    .multilineTextAlignment(.center)
                    .lineLimit(3)
            }
            .padding()
            .frame(maxWidth: .infinity)
            .frame(height: 180)
            .background(
                RoundedRectangle(cornerRadius: 16)
                    .fill(Color(.systemBackground))
                    .shadow(color: Color.blue.opacity(0.15), radius: 8, x: 0, y: 4)
            )
        }
        .sheet(isPresented: $showingDetail) {
            BM1PillarDetailView(pillar: pillar)
        }
    }
    
    private func iconForPillar(_ name: String) -> String {
        switch name {
        case "Contacto Físico": return "hands.sparkles.fill"
        case "Lactancia Prolongada": return "heart.circle.fill"
        case "Respuesta al Llanto": return "ear.fill"
        case "Respeto al Ritmo": return "clock.fill"
        default: return "heart.fill"
        }
    }
    
    private func triggerHaptic() {
        let impactFeedback = UIImpactFeedbackGenerator(style: .light)
        impactFeedback.impactOccurred()
    }
}

/// Vista detallada de un pilar
struct BM1PillarDetailView: View {
    let pillar: BM1Pillar
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 24) {
                    // Header con icono
                    VStack(spacing: 16) {
                        Circle()
                            .fill(
                                LinearGradient(
                                    gradient: Gradient(colors: [.blue, .mint]),
                                    startPoint: .topLeading,
                                    endPoint: .bottomTrailing
                                )
                            )
                            .frame(width: 80, height: 80)
                            .overlay(
                                Image(systemName: iconForPillar(pillar.name))
                                    .font(.largeTitle)
                                    .foregroundColor(.white)
                            )
                        
                        Text(pillar.name)
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundStyle(
                                LinearGradient(
                                    gradient: Gradient(colors: [.blue, .mint]),
                                    startPoint: .leading,
                                    endPoint: .trailing
                                )
                            )
                    }
                    .frame(maxWidth: .infinity)
                    
                    Divider()
                    
                    // Definición
                    VStack(alignment: .leading, spacing: 12) {
                        Text("Definición")
                            .font(.headline)
                            .foregroundColor(.primary)
                        
                        Text(pillar.definition)
                            .font(.body)
                            .foregroundColor(.primary)
                    }
                    
                    // Ejemplo práctico
                    VStack(alignment: .leading, spacing: 12) {
                        HStack {
                            Image(systemName: "house.fill")
                                .foregroundColor(.blue)
                            Text("En la práctica")
                                .font(.headline)
                                .foregroundColor(.primary)
                        }
                        
                        Text(pillar.parentalExample)
                            .font(.body)
                            .foregroundColor(.primary)
                            .italic()
                    }
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 12)
                            .fill(Color.blue.opacity(0.1))
                    )
                    
                    // Base biológica
                    VStack(alignment: .leading, spacing: 12) {
                        HStack {
                            Image(systemName: "leaf.fill")
                                .foregroundColor(.mint)
                            Text("Base Biológica")
                                .font(.headline)
                                .foregroundColor(.primary)
                        }
                        
                        Text(pillar.biologicalBasis)
                            .font(.body)
                            .foregroundColor(.primary)
                    }
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 12)
                            .fill(Color.mint.opacity(0.1))
                    )
                }
                .padding()
            }
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
    
    private func iconForPillar(_ name: String) -> String {
        switch name {
        case "Contacto Físico": return "hands.sparkles.fill"
        case "Lactancia Prolongada": return "heart.circle.fill"
        case "Respuesta al Llanto": return "ear.fill"
        case "Respeto al Ritmo": return "clock.fill"
        default: return "heart.fill"
        }
    }
}

