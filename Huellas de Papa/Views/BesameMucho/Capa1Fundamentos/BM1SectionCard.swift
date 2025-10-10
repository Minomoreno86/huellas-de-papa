import SwiftUI

/// Tarjeta que muestra una sección teórica del libro Bésame Mucho
struct BM1SectionCard: View {
    let section: BM1Section
    @State private var showingDetail = false
    
    var body: some View {
        Button(action: {
            triggerHaptic()
            showingDetail = true
        }) {
            VStack(alignment: .leading, spacing: 12) {
                // Icono y título
                HStack {
                    Image(systemName: "book.fill")
                        .font(.title2)
                        .foregroundColor(.blue)
                    
                    Spacer()
                }
                
                Text(section.title)
                    .font(.headline)
                    .fontWeight(.semibold)
                    .foregroundColor(.primary)
                    .multilineTextAlignment(.leading)
                
                Text(section.subtitle)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                    .lineLimit(2)
                
                Spacer()
                
                // Idea clave
                HStack {
                    Image(systemName: "lightbulb.fill")
                        .font(.caption)
                        .foregroundColor(.mint)
                    
                    Text(section.keyIdea)
                        .font(.caption)
                        .fontWeight(.medium)
                        .foregroundColor(.mint)
                        .lineLimit(2)
                }
            }
            .padding()
            .frame(width: 280, height: 200)
            .background(
                RoundedRectangle(cornerRadius: 16)
                    .fill(Color(.systemBackground))
                    .shadow(color: Color.blue.opacity(0.15), radius: 8, x: 0, y: 4)
            )
        }
        .sheet(isPresented: $showingDetail) {
            BM1SectionDetailView(section: section)
        }
    }
    
    private func triggerHaptic() {
        let impactFeedback = UIImpactFeedbackGenerator(style: .light)
        impactFeedback.impactOccurred()
    }
}

/// Vista detallada de una sección teórica
struct BM1SectionDetailView: View {
    let section: BM1Section
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 24) {
                    // Header
                    VStack(alignment: .leading, spacing: 8) {
                        Text(section.title)
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundStyle(
                                LinearGradient(
                                    gradient: Gradient(colors: [.blue, .mint]),
                                    startPoint: .leading,
                                    endPoint: .trailing
                                )
                            )
                        
                        Text(section.subtitle)
                            .font(.title3)
                            .foregroundColor(.secondary)
                    }
                    
                    Divider()
                    
                    // Descripción
                    VStack(alignment: .leading, spacing: 12) {
                        Text("Concepto")
                            .font(.headline)
                            .foregroundColor(.primary)
                        
                        Text(section.description)
                            .font(.body)
                            .foregroundColor(.primary)
                            .fixedSize(horizontal: false, vertical: true)
                    }
                    
                    // Idea clave destacada
                    VStack(alignment: .leading, spacing: 12) {
                        HStack {
                            Image(systemName: "lightbulb.fill")
                                .foregroundColor(.mint)
                            Text("Idea Clave")
                                .font(.headline)
                                .foregroundColor(.primary)
                        }
                        
                        Text(section.keyIdea)
                            .font(.title3)
                            .fontWeight(.medium)
                            .foregroundColor(.mint)
                            .italic()
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
}

