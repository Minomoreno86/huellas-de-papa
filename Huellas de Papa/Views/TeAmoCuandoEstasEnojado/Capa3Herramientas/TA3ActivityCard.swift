import SwiftUI

/// Tarjeta visual para mostrar una actividad de conexión
struct TA3ActivityCard: View {
    let activity: TA3Activity
    @State private var showingDetail = false
    
    var body: some View {
        Button(action: {
            withAnimation(.spring()) {
                showingDetail.toggle()
                triggerHaptic()
            }
        }) {
            VStack(alignment: .leading, spacing: 16) {
                // Header
                HStack {
                    Image(systemName: activity.icon)
                        .font(.title)
                        .foregroundColor(.white)
                        .frame(width: 50, height: 50)
                        .background(
                            Circle()
                                .fill(
                                    LinearGradient(
                                        colors: [.pink, .mint],
                                        startPoint: .topLeading,
                                        endPoint: .bottomTrailing
                                    )
                                )
                        )
                    
                    Spacer()
                    
                    Text(activity.type)
                        .font(.caption)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .padding(.horizontal, 12)
                        .padding(.vertical, 4)
                        .background(
                            Capsule()
                                .fill(Color.mint)
                        )
                }
                
                // Nombre
                Text(activity.name)
                    .font(.headline)
                    .fontWeight(.bold)
                    .foregroundColor(.primary)
                
                // Descripción
                Text(activity.description)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                    .lineLimit(2)
                
                // Frecuencia
                HStack {
                    Image(systemName: "calendar.circle.fill")
                        .foregroundColor(.pink)
                    
                    Text(activity.frequency)
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
            }
            .padding()
            .frame(width: 300)
            .background(
                RoundedRectangle(cornerRadius: 16)
                    .fill(Color(.systemBackground))
                    .shadow(color: Color.pink.opacity(0.15), radius: 10, x: 0, y: 4)
            )
            .overlay(
                RoundedRectangle(cornerRadius: 16)
                    .stroke(
                        LinearGradient(
                            colors: [.pink.opacity(0.4), .mint.opacity(0.3)],
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        ),
                        lineWidth: 1.5
                    )
            )
        }
        .buttonStyle(PlainButtonStyle())
        .sheet(isPresented: $showingDetail) {
            TA3ActivityDetailView(activity: activity)
        }
    }
    
    private func triggerHaptic() {
        let impactFeedback = UIImpactFeedbackGenerator(style: .light)
        impactFeedback.impactOccurred()
    }
}

/// Vista detallada de una actividad
struct TA3ActivityDetailView: View {
    let activity: TA3Activity
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 24) {
                    // Header
                    VStack(spacing: 16) {
                        Image(systemName: activity.icon)
                            .font(.system(size: 80))
                            .foregroundStyle(
                                LinearGradient(
                                    colors: [.pink, .mint],
                                    startPoint: .topLeading,
                                    endPoint: .bottomTrailing
                                )
                            )
                        
                        Text(activity.name)
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(.primary)
                            .multilineTextAlignment(.center)
                        
                        Text(activity.type)
                            .font(.subheadline)
                            .foregroundColor(.mint)
                    }
                    .padding(.top)
                    
                    // Descripción
                    Text(activity.description)
                        .font(.body)
                        .foregroundColor(.primary)
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 12)
                                .fill(Color.pink.opacity(0.1))
                        )
                    
                    // Objetivos
                    VStack(alignment: .leading, spacing: 12) {
                        Label("Objetivos", systemImage: "target")
                            .font(.headline)
                            .foregroundColor(.pink)
                        
                        VStack(alignment: .leading, spacing: 8) {
                            ForEach(activity.objectives, id: \.self) { objective in
                                HStack(alignment: .top, spacing: 8) {
                                    Image(systemName: "star.fill")
                                        .font(.caption)
                                        .foregroundColor(.mint)
                                    
                                    Text(objective)
                                        .font(.subheadline)
                                        .foregroundColor(.primary)
                                }
                            }
                        }
                    }
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(
                        RoundedRectangle(cornerRadius: 12)
                            .fill(Color.mint.opacity(0.1))
                    )
                    
                    // Cómo hacer
                    VStack(alignment: .leading, spacing: 12) {
                        Label("Cómo hacerlo", systemImage: "list.number")
                            .font(.headline)
                            .foregroundColor(.pink)
                        
                        VStack(alignment: .leading, spacing: 12) {
                            ForEach(Array(activity.howToDo.enumerated()), id: \.offset) { index, step in
                                HStack(alignment: .top, spacing: 12) {
                                    Text("\(index + 1)")
                                        .font(.caption)
                                        .fontWeight(.bold)
                                        .foregroundColor(.white)
                                        .frame(width: 24, height: 24)
                                        .background(
                                            Circle()
                                                .fill(Color.pink)
                                        )
                                    
                                    Text(step)
                                        .font(.subheadline)
                                        .foregroundColor(.primary)
                                }
                            }
                        }
                    }
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(
                        RoundedRectangle(cornerRadius: 12)
                            .fill(Color(.systemBackground))
                    )
                    
                    // Base del libro
                    VStack(alignment: .leading, spacing: 12) {
                        Label("Del libro", systemImage: "book.fill")
                            .font(.headline)
                            .foregroundColor(.mint)
                        
                        Text(activity.bookBasis)
                            .font(.body)
                            .italic()
                            .foregroundColor(.primary)
                    }
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(
                        RoundedRectangle(cornerRadius: 12)
                            .fill(Color.mint.opacity(0.1))
                    )
                }
                .padding()
            }
            .background(Color(.systemGroupedBackground))
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
}

