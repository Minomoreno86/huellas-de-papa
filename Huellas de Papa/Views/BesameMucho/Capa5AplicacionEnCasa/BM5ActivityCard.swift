import SwiftUI

/// Tarjeta que muestra una actividad rápida
struct BM5ActivityCard: View {
    let activity: BM5Activity
    @State private var showingDetail = false
    
    var body: some View {
        Button(action: {
            triggerHaptic()
            showingDetail = true
        }) {
            VStack(alignment: .leading, spacing: 12) {
                Label(activity.category.rawValue, systemImage: activity.category.icon)
                    .font(.caption)
                    .foregroundColor(colorForCategory(activity.category))
                
                Text(activity.title)
                    .font(.headline)
                    .fontWeight(.semibold)
                    .foregroundColor(.primary)
                    .multilineTextAlignment(.leading)
                    .lineLimit(2)
                
                Text(activity.description)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                    .lineLimit(3)
                
                Divider()
                
                HStack {
                    Label(activity.duration, systemImage: "clock.fill")
                        .font(.caption)
                        .foregroundColor(.blue)
                    
                    Spacer()
                    
                    Text(activity.ageRange)
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
            }
            .padding()
            .frame(width: 260)
            .background(
                RoundedRectangle(cornerRadius: 16)
                    .fill(Color(.systemBackground))
                    .shadow(color: colorForCategory(activity.category).opacity(0.15), radius: 8, x: 0, y: 4)
            )
        }
        .sheet(isPresented: $showingDetail) {
            BM5ActivityDetailView(activity: activity)
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

/// Vista detallada de una actividad
struct BM5ActivityDetailView: View {
    let activity: BM5Activity
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 24) {
                    // Header
                    VStack(alignment: .leading, spacing: 8) {
                        Label(activity.category.rawValue, systemImage: activity.category.icon)
                            .font(.caption)
                            .foregroundColor(colorForCategory(activity.category))
                        
                        Text(activity.title)
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(.primary)
                        
                        HStack {
                            Label(activity.duration, systemImage: "clock.fill")
                            Spacer()
                            Text(activity.ageRange)
                        }
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                    }
                    
                    Divider()
                    
                    // Descripción
                    Text(activity.description)
                        .font(.body)
                        .foregroundColor(.primary)
                    
                    // Pasos
                    VStack(alignment: .leading, spacing: 12) {
                        Label("Cómo hacerlo", systemImage: "list.number")
                            .font(.headline)
                            .foregroundColor(.blue)
                        
                        ForEach(Array(activity.steps.enumerated()), id: \.offset) { index, step in
                            HStack(alignment: .top, spacing: 12) {
                                Text("\(index + 1)")
                                    .font(.caption)
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                                    .frame(width: 24, height: 24)
                                    .background(Circle().fill(Color.blue))
                                
                                Text(step)
                                    .font(.body)
                                    .fixedSize(horizontal: false, vertical: true)
                            }
                        }
                    }
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 12)
                            .fill(Color.blue.opacity(0.1))
                    )
                    
                    // Beneficios
                    VStack(alignment: .leading, spacing: 12) {
                        Label("Beneficios", systemImage: "star.fill")
                            .font(.headline)
                            .foregroundColor(.mint)
                        
                        ForEach(activity.benefits, id: \.self) { benefit in
                            HStack(alignment: .top, spacing: 8) {
                                Image(systemName: "checkmark.circle.fill")
                                    .foregroundColor(.mint)
                                Text(benefit)
                                    .font(.body)
                                    .fixedSize(horizontal: false, vertical: true)
                            }
                        }
                    }
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 12)
                            .fill(Color.mint.opacity(0.1))
                    )
                }
                .padding()
            }
            .navigationTitle("Actividad")
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
    
    private func colorForCategory(_ category: SituationCategory) -> Color {
        switch category {
        case .sleep: return .indigo
        case .feeding: return .pink
        case .contact: return .blue
        case .limits: return .orange
        }
    }
}

