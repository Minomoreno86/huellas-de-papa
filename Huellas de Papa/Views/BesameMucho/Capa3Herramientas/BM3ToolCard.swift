import SwiftUI

/// Tarjeta que muestra una herramienta práctica
struct BM3ToolCard: View {
    let tool: BM3Tool
    @State private var showingDetail = false
    
    var body: some View {
        Button(action: {
            triggerHaptic()
            showingDetail = true
        }) {
            VStack(alignment: .leading, spacing: 12) {
                // Número y categoría
                HStack {
                    Text("\(tool.number)")
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(colorForCategory(tool.category))
                        .frame(width: 35, height: 35)
                        .background(
                            Circle()
                                .fill(colorForCategory(tool.category).opacity(0.2))
                        )
                    
                    Spacer()
                    
                    Label(tool.category.rawValue, systemImage: tool.category.icon)
                        .font(.caption)
                        .foregroundColor(colorForCategory(tool.category))
                }
                
                Text(tool.title)
                    .font(.headline)
                    .fontWeight(.semibold)
                    .foregroundColor(.primary)
                    .multilineTextAlignment(.leading)
                    .lineLimit(2)
                
                Text(tool.whatItIs)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                    .lineLimit(3)
                
                Divider()
                
                HStack {
                    Image(systemName: "list.bullet")
                        .font(.caption)
                        .foregroundColor(.blue)
                    Text("\(tool.howToSteps.count) pasos")
                        .font(.caption)
                        .foregroundColor(.blue)
                }
            }
            .padding()
            .frame(maxWidth: .infinity)
            .background(
                RoundedRectangle(cornerRadius: 16)
                    .fill(Color(.systemBackground))
                    .shadow(color: colorForCategory(tool.category).opacity(0.15), radius: 8, x: 0, y: 4)
            )
        }
        .sheet(isPresented: $showingDetail) {
            BM3ToolDetailView(tool: tool)
        }
    }
    
    private func colorForCategory(_ category: ToolCategory) -> Color {
        switch category {
        case .sleep: return .indigo
        case .feeding: return .pink
        case .contact: return .blue
        case .communication: return .mint
        case .development: return .purple
        case .limits: return .orange
        }
    }
    
    private func triggerHaptic() {
        #if !os(macOS)
        let impactFeedback = UIImpactFeedbackGenerator(style: .light)
        impactFeedback.impactOccurred()
        #endif
    }
}

/// Vista detallada de una herramienta con todo el contenido
struct BM3ToolDetailView: View {
    let tool: BM3Tool
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 24) {
                    // Header
                    VStack(alignment: .leading, spacing: 8) {
                        HStack {
                            Text("\(tool.number)")
                                .font(.system(size: 50, weight: .bold))
                                .foregroundColor(colorForCategory(tool.category))
                            
                            VStack(alignment: .leading) {
                                Label(tool.category.rawValue, systemImage: tool.category.icon)
                                    .font(.caption)
                                    .foregroundColor(.secondary)
                                
                                Text(tool.title)
                                    .font(.title2)
                                    .fontWeight(.bold)
                                    .foregroundColor(.primary)
                            }
                        }
                    }
                    
                    Divider()
                    
                    // Qué es
                    sectionView(title: "¿Qué es?", icon: "info.circle.fill", color: .blue) {
                        Text(tool.whatItIs)
                            .font(.body)
                    }
                    
                    // Por qué funciona
                    sectionView(title: "Por qué funciona", icon: "lightbulb.fill", color: .mint) {
                        Text(tool.whyItWorks)
                            .font(.body)
                    }
                    
                    // Cómo hacerlo
                    sectionView(title: "Cómo hacerlo paso a paso", icon: "list.number", color: .orange) {
                        VStack(alignment: .leading, spacing: 12) {
                            ForEach(Array(tool.howToSteps.enumerated()), id: \.offset) { index, step in
                                HStack(alignment: .top, spacing: 12) {
                                    Text("\(index + 1)")
                                        .font(.headline)
                                        .foregroundColor(.white)
                                        .frame(width: 28, height: 28)
                                        .background(Circle().fill(Color.orange))
                                    
                                    Text(step)
                                        .font(.body)
                                        .fixedSize(horizontal: false, vertical: true)
                                }
                            }
                        }
                    }
                    
                    // Beneficios
                    sectionView(title: "Beneficios específicos", icon: "star.fill", color: .purple) {
                        VStack(alignment: .leading, spacing: 8) {
                            ForEach(tool.specificBenefits, id: \.self) { benefit in
                                HStack(alignment: .top, spacing: 8) {
                                    Image(systemName: "checkmark.circle.fill")
                                        .foregroundColor(.purple)
                                    Text(benefit)
                                        .font(.body)
                                        .fixedSize(horizontal: false, vertical: true)
                                }
                            }
                        }
                    }
                    
                    // Mitos
                    if !tool.mythsDebunked.isEmpty {
                        sectionView(title: "Mitos que desmiente", icon: "xmark.shield.fill", color: .red) {
                            VStack(alignment: .leading, spacing: 8) {
                                ForEach(tool.mythsDebunked, id: \.self) { myth in
                                    HStack(alignment: .top, spacing: 8) {
                                        Image(systemName: "xmark.circle.fill")
                                            .foregroundColor(.red.opacity(0.7))
                                        Text(myth)
                                            .font(.body)
                                            .fixedSize(horizontal: false, vertical: true)
                                    }
                                }
                            }
                        }
                    }
                    
                    // Cuándo aplicarla
                    sectionView(title: "Cuándo aplicarla", icon: "clock.fill", color: .indigo) {
                        Text(tool.whenToApply)
                            .font(.body)
                            .fontWeight(.medium)
                    }
                }
                .padding()
            }
            .navigationTitle("Herramienta \(tool.number)")
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
    
    @ViewBuilder
    private func sectionView<Content: View>(title: String, icon: String, color: Color, @ViewBuilder content: () -> Content) -> some View {
        VStack(alignment: .leading, spacing: 12) {
            Label(title, systemImage: icon)
                .font(.headline)
                .foregroundColor(color)
            
            content()
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(color.opacity(0.1))
        )
    }
    
    private func colorForCategory(_ category: ToolCategory) -> Color {
        switch category {
        case .sleep: return .indigo
        case .feeding: return .pink
        case .contact: return .blue
        case .communication: return .mint
        case .development: return .purple
        case .limits: return .orange
        }
    }
}

