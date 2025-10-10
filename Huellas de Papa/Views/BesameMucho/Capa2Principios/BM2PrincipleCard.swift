import SwiftUI

/// Tarjeta que muestra uno de los 12 principios
struct BM2PrincipleCard: View {
    let principle: BM2Principle
    @State private var showingDetail = false
    
    var body: some View {
        Button(action: {
            triggerHaptic()
            showingDetail = true
        }) {
            VStack(alignment: .leading, spacing: 12) {
                // Número y bloque
                HStack {
                    Text("\(principle.number)")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(colorForBlock(principle.block))
                        .frame(width: 40, height: 40)
                        .background(
                            Circle()
                                .fill(colorForBlock(principle.block).opacity(0.2))
                        )
                    
                    Spacer()
                    
                    Image(systemName: principle.block.icon)
                        .foregroundColor(colorForBlock(principle.block))
                }
                
                Text(principle.title)
                    .font(.headline)
                    .fontWeight(.semibold)
                    .foregroundColor(.primary)
                    .multilineTextAlignment(.leading)
                    .lineLimit(2)
                
                Text(principle.concept)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                    .lineLimit(3)
                
                Divider()
                
                // Aplicación práctica preview
                HStack {
                    Image(systemName: "lightbulb.fill")
                        .font(.caption)
                        .foregroundColor(.mint)
                    
                    Text("Ver aplicación práctica")
                        .font(.caption)
                        .fontWeight(.medium)
                        .foregroundColor(.mint)
                }
            }
            .padding()
            .frame(maxWidth: .infinity)
            .background(
                RoundedRectangle(cornerRadius: 16)
                    .fill(Color(.systemBackground))
                    .shadow(color: colorForBlock(principle.block).opacity(0.15), radius: 8, x: 0, y: 4)
            )
        }
        .sheet(isPresented: $showingDetail) {
            BM2PrincipleDetailView(principle: principle)
        }
    }
    
    private func colorForBlock(_ block: PrincipleBlock) -> Color {
        switch block {
        case .biologicalNeeds: return .blue
        case .communicationResponse: return .mint
        case .developmentAutonomy: return .purple
        case .respectfulParenting: return .pink
        }
    }
    
    private func triggerHaptic() {
        #if !os(macOS)
        let impactFeedback = UIImpactFeedbackGenerator(style: .light)
        impactFeedback.impactOccurred()
        #endif
    }
}

/// Vista detallada de un principio
struct BM2PrincipleDetailView: View {
    let principle: BM2Principle
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 24) {
                    // Header con número y bloque
                    HStack {
                        Text("\(principle.number)")
                            .font(.system(size: 60, weight: .bold))
                            .foregroundColor(colorForBlock(principle.block))
                        
                        VStack(alignment: .leading, spacing: 4) {
                            Text(principle.block.rawValue)
                                .font(.caption)
                                .fontWeight(.medium)
                                .foregroundColor(.secondary)
                            
                            Text(principle.title)
                                .font(.title2)
                                .fontWeight(.bold)
                                .foregroundColor(.primary)
                        }
                        
                        Spacer()
                    }
                    
                    Divider()
                    
                    // Concepto
                    VStack(alignment: .leading, spacing: 12) {
                        Label("Concepto", systemImage: "star.fill")
                            .font(.headline)
                            .foregroundColor(colorForBlock(principle.block))
                        
                        Text(principle.concept)
                            .font(.title3)
                            .fontWeight(.medium)
                            .foregroundColor(.primary)
                            .italic()
                    }
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 12)
                            .fill(colorForBlock(principle.block).opacity(0.1))
                    )
                    
                    // Explicación
                    VStack(alignment: .leading, spacing: 12) {
                        Label("Explicación", systemImage: "book.fill")
                            .font(.headline)
                            .foregroundColor(.primary)
                        
                        Text(principle.explanation)
                            .font(.body)
                            .foregroundColor(.primary)
                            .fixedSize(horizontal: false, vertical: true)
                    }
                    
                    // Aplicación práctica
                    VStack(alignment: .leading, spacing: 12) {
                        Label("En la práctica", systemImage: "house.fill")
                            .font(.headline)
                            .foregroundColor(.blue)
                        
                        Text(principle.practicalApplication)
                            .font(.body)
                            .foregroundColor(.primary)
                            .italic()
                    }
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 12)
                            .fill(Color.blue.opacity(0.1))
                    )
                    
                    // Base científica
                    VStack(alignment: .leading, spacing: 12) {
                        Label("Base Científica", systemImage: "atom")
                            .font(.headline)
                            .foregroundColor(.mint)
                        
                        Text(principle.scientificBasis)
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
            .navigationTitle("Principio \(principle.number)")
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
    
    private func colorForBlock(_ block: PrincipleBlock) -> Color {
        switch block {
        case .biologicalNeeds: return .blue
        case .communicationResponse: return .mint
        case .developmentAutonomy: return .purple
        case .respectfulParenting: return .pink
        }
    }
}

