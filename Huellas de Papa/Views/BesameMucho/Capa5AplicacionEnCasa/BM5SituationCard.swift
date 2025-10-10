import SwiftUI

/// Tarjeta que muestra una situación cotidiana
struct BM5SituationCard: View {
    let situation: BM5Situation
    @State private var showingDetail = false
    
    var body: some View {
        Button(action: {
            triggerHaptic()
            showingDetail = true
        }) {
            VStack(alignment: .leading, spacing: 12) {
                // Número y categoría
                HStack {
                    Text("\(situation.number)")
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(colorForCategory(situation.category))
                        .frame(width: 35, height: 35)
                        .background(
                            Circle()
                                .fill(colorForCategory(situation.category).opacity(0.2))
                        )
                    
                    Spacer()
                    
                    Label(situation.category.rawValue, systemImage: situation.category.icon)
                        .font(.caption)
                        .foregroundColor(colorForCategory(situation.category))
                }
                
                Text(situation.title)
                    .font(.headline)
                    .fontWeight(.semibold)
                    .foregroundColor(.primary)
                    .multilineTextAlignment(.leading)
                    .lineLimit(2)
                
                Text(situation.context)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                    .lineLimit(3)
                
                Divider()
                
                HStack {
                    Label("\(situation.implementationSteps.count) pasos", systemImage: "list.number")
                        .font(.caption)
                        .foregroundColor(.blue)
                    
                    Spacer()
                    
                    Text(situation.ageRange)
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
            }
            .padding()
            .frame(maxWidth: .infinity)
            .background(
                RoundedRectangle(cornerRadius: 16)
                    .fill(Color(.systemBackground))
                    .shadow(color: colorForCategory(situation.category).opacity(0.15), radius: 8, x: 0, y: 4)
            )
        }
        .sheet(isPresented: $showingDetail) {
            BM5SituationDetailView(situation: situation)
        }
    }
    
    private func colorForCategory(_ category: SituationCategory) -> Color {
        switch category {
        case .sleep: return .indigo
        case .feeding: return .pink
        case .contact: return .blue
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

/// Vista detallada de una situación
struct BM5SituationDetailView: View {
    let situation: BM5Situation
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 24) {
                    // Header
                    VStack(alignment: .leading, spacing: 8) {
                        HStack {
                            Text("\(situation.number)")
                                .font(.system(size: 50, weight: .bold))
                                .foregroundColor(colorForCategory(situation.category))
                            
                            VStack(alignment: .leading) {
                                Label(situation.category.rawValue, systemImage: situation.category.icon)
                                    .font(.caption)
                                    .foregroundColor(.secondary)
                                
                                Text(situation.title)
                                    .font(.title2)
                                    .fontWeight(.bold)
                                    .foregroundColor(.primary)
                            }
                        }
                        
                        Text(situation.ageRange)
                            .font(.caption)
                            .foregroundColor(.secondary)
                            .padding(.horizontal, 12)
                            .padding(.vertical, 6)
                            .background(
                                Capsule()
                                    .fill(Color.secondary.opacity(0.1))
                            )
                    }
                    
                    Divider()
                    
                    // Contexto
                    sectionView(title: "Contexto", icon: "info.circle.fill", color: .blue) {
                        Text(situation.context)
                            .font(.body)
                            .fixedSize(horizontal: false, vertical: true)
                    }
                    
                    // Preparación
                    if !situation.preparation.isEmpty {
                        sectionView(title: "Preparación necesaria", icon: "checklist", color: .purple) {
                            VStack(alignment: .leading, spacing: 8) {
                                ForEach(Array(situation.preparation.enumerated()), id: \.offset) { index, item in
                                    HStack(alignment: .top, spacing: 8) {
                                        Image(systemName: "checkmark.circle.fill")
                                            .foregroundColor(.purple)
                                        Text(item)
                                            .font(.body)
                                            .fixedSize(horizontal: false, vertical: true)
                                    }
                                }
                            }
                        }
                    }
                    
                    // Implementación paso a paso
                    sectionView(title: "Implementación paso a paso", icon: "list.number", color: .orange) {
                        VStack(alignment: .leading, spacing: 12) {
                            ForEach(Array(situation.implementationSteps.enumerated()), id: \.offset) { index, step in
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
                    
                    // Obstáculos y soluciones
                    if !situation.commonObstacles.isEmpty {
                        sectionView(title: "Obstáculos comunes y soluciones", icon: "exclamationmark.triangle.fill", color: .red) {
                            VStack(alignment: .leading, spacing: 16) {
                                ForEach(situation.commonObstacles) { obstacle in
                                    VStack(alignment: .leading, spacing: 8) {
                                        HStack(alignment: .top, spacing: 8) {
                                            Image(systemName: "xmark.circle.fill")
                                                .foregroundColor(.red.opacity(0.7))
                                            Text(obstacle.obstacle)
                                                .font(.body)
                                                .fontWeight(.semibold)
                                                .fixedSize(horizontal: false, vertical: true)
                                        }
                                        
                                        HStack(alignment: .top, spacing: 8) {
                                            Image(systemName: "checkmark.circle.fill")
                                                .foregroundColor(.mint)
                                            Text(obstacle.solution)
                                                .font(.body)
                                                .fixedSize(horizontal: false, vertical: true)
                                        }
                                    }
                                    .padding()
                                    .background(
                                        RoundedRectangle(cornerRadius: 8)
                                            .fill(Color.red.opacity(0.05))
                                    )
                                }
                            }
                        }
                    }
                    
                    // Citas del libro
                    if !situation.bookQuotes.isEmpty {
                        sectionView(title: "Según Carlos González", icon: "book.fill", color: .mint) {
                            VStack(alignment: .leading, spacing: 12) {
                                ForEach(situation.bookQuotes, id: \.self) { quote in
                                    HStack(alignment: .top, spacing: 8) {
                                        Image(systemName: "quote.bubble.fill")
                                            .foregroundColor(.mint)
                                        Text(quote)
                                            .font(.body)
                                            .italic()
                                            .fixedSize(horizontal: false, vertical: true)
                                    }
                                }
                            }
                        }
                    }
                }
                .padding()
            }
            .navigationTitle("Situación \(situation.number)")
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
    
    private func colorForCategory(_ category: SituationCategory) -> Color {
        switch category {
        case .sleep: return .indigo
        case .feeding: return .pink
        case .contact: return .blue
        case .limits: return .orange
        }
    }
}

