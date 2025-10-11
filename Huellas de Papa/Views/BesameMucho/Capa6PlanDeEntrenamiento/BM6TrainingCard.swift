import SwiftUI

/// Tarjeta que muestra un entrenamiento disponible
struct BM6TrainingCard: View {
    let training: BM6Training
    @State private var showingDetail = false
    
    var body: some View {
        Button(action: {
            triggerHaptic()
            showingDetail = true
        }) {
            VStack(alignment: .leading, spacing: 12) {
                // Número y categoría
                HStack {
                    Text("\(training.number)")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(colorForCategory(training.category))
                        .frame(width: 40, height: 40)
                        .background(
                            Circle()
                                .fill(colorForCategory(training.category).opacity(0.2))
                        )
                    
                    Spacer()
                    
                    // Estrellas de dificultad
                    HStack(spacing: 2) {
                        ForEach(0..<training.difficulty.stars, id: \.self) { _ in
                            Image(systemName: "star.fill")
                                .font(.caption)
                                .foregroundColor(colorForDifficulty(training.difficulty))
                        }
                    }
                }
                
                // Categoría
                Label(training.category.rawValue, systemImage: training.category.icon)
                    .font(.caption)
                    .foregroundColor(colorForCategory(training.category))
                
                // Título
                Text(training.title)
                    .font(.headline)
                    .fontWeight(.semibold)
                    .foregroundColor(.primary)
                    .multilineTextAlignment(.leading)
                    .lineLimit(2)
                
                // Qué entrenas
                Text(training.whatYouTrain)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                    .lineLimit(2)
                
                Divider()
                
                // Info adicional
                HStack {
                    Label(training.duration, systemImage: "clock.fill")
                        .font(.caption)
                        .foregroundColor(.blue)
                    
                    Spacer()
                    
                    Label("\(training.modules.count) módulos", systemImage: "list.bullet")
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
            }
            .padding()
            .frame(maxWidth: .infinity)
            .background(
                RoundedRectangle(cornerRadius: 16)
                    .fill(Color(.systemBackground))
                    .shadow(color: colorForCategory(training.category).opacity(0.15), radius: 8, x: 0, y: 4)
            )
        }
        .sheet(isPresented: $showingDetail) {
            BM6TrainingDetailView(training: training)
        }
    }
    
    private func colorForCategory(_ category: TrainingCategory) -> Color {
        switch category {
        case .sleep: return .indigo
        case .feeding: return .pink
        case .contact: return .blue
        case .communication: return .mint
        case .limits: return .orange
        case .externalPressure: return .red
        }
    }
    
    private func colorForDifficulty(_ difficulty: TrainingDifficulty) -> Color {
        switch difficulty {
        case .beginner: return .green
        case .intermediate: return .orange
        case .advanced: return .red
        }
    }
    
    private func triggerHaptic() {
        #if !os(macOS)
        let impactFeedback = UIImpactFeedbackGenerator(style: .light)
        impactFeedback.impactOccurred()
        #endif
    }
}

/// Vista detallada de un entrenamiento
struct BM6TrainingDetailView: View {
    let training: BM6Training
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 24) {
                    // Header
                    VStack(alignment: .leading, spacing: 8) {
                        HStack {
                            Text("\(training.number)")
                                .font(.system(size: 50, weight: .bold))
                                .foregroundColor(colorForCategory(training.category))
                            
                            VStack(alignment: .leading) {
                                Label(training.category.rawValue, systemImage: training.category.icon)
                                    .font(.caption)
                                    .foregroundColor(.secondary)
                                
                                Text(training.title)
                                    .font(.title2)
                                    .fontWeight(.bold)
                                    .foregroundColor(.primary)
                            }
                            
                            Spacer()
                        }
                        
                        HStack {
                            Label(training.duration, systemImage: "clock.fill")
                            
                            Spacer()
                            
                            HStack(spacing: 2) {
                                ForEach(0..<training.difficulty.stars, id: \.self) { _ in
                                    Image(systemName: "star.fill")
                                        .font(.caption)
                                        .foregroundColor(colorForDifficulty(training.difficulty))
                                }
                                Text(training.difficulty.rawValue)
                                    .font(.caption)
                                    .foregroundColor(.secondary)
                            }
                        }
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                    }
                    
                    Divider()
                    
                    // Qué entrenas
                    sectionView(title: "¿Qué vas a entrenar?", icon: "target", color: .blue) {
                        Text(training.whatYouTrain)
                            .font(.body)
                            .fixedSize(horizontal: false, vertical: true)
                    }
                    
                    // Módulos
                    sectionView(title: "Módulos del entrenamiento", icon: "list.number", color: .purple) {
                        VStack(alignment: .leading, spacing: 12) {
                            ForEach(Array(training.modules.enumerated()), id: \.element.id) { index, module in
                                VStack(alignment: .leading, spacing: 8) {
                                    HStack {
                                        Text("Módulo \(index + 1)")
                                            .font(.caption)
                                            .fontWeight(.bold)
                                            .foregroundColor(.white)
                                            .padding(.horizontal, 10)
                                            .padding(.vertical, 4)
                                            .background(Capsule().fill(Color.purple))
                                        
                                        Text(module.title)
                                            .font(.headline)
                                            .foregroundColor(.primary)
                                    }
                                    
                                    Text(module.description)
                                        .font(.body)
                                        .foregroundColor(.secondary)
                                        .fixedSize(horizontal: false, vertical: true)
                                }
                                
                                if index < training.modules.count - 1 {
                                    Divider()
                                }
                            }
                        }
                    }
                    
                    // Ejercicios prácticos
                    sectionView(title: "Ejercicios prácticos", icon: "figure.run", color: .orange) {
                        VStack(alignment: .leading, spacing: 8) {
                            ForEach(training.practicalExercises, id: \.self) { exercise in
                                HStack(alignment: .top, spacing: 8) {
                                    Image(systemName: "checkmark.circle.fill")
                                        .foregroundColor(.orange)
                                    Text(exercise)
                                        .font(.body)
                                        .fixedSize(horizontal: false, vertical: true)
                                }
                            }
                        }
                    }
                    
                    // Evaluación
                    sectionView(title: "Cómo evaluar tu progreso", icon: "chart.line.uptrend.xyaxis", color: .mint) {
                        VStack(alignment: .leading, spacing: 8) {
                            ForEach(training.evaluation, id: \.self) { criterion in
                                HStack(alignment: .top, spacing: 8) {
                                    Image(systemName: "questionmark.circle.fill")
                                        .foregroundColor(.mint)
                                    Text(criterion)
                                        .font(.body)
                                        .fixedSize(horizontal: false, vertical: true)
                                }
                            }
                        }
                    }
                    
                    // Recursos del libro
                    sectionView(title: "Recursos de Bésame Mucho", icon: "book.fill", color: .blue) {
                        VStack(alignment: .leading, spacing: 8) {
                            ForEach(training.bookResources, id: \.self) { resource in
                                HStack(alignment: .top, spacing: 8) {
                                    Image(systemName: "book.closed.fill")
                                        .foregroundColor(.blue)
                                    Text(resource)
                                        .font(.body)
                                        .italic()
                                        .fixedSize(horizontal: false, vertical: true)
                                }
                            }
                        }
                    }
                    
                    // Botón de inicio
                    Button(action: {
                        // Aquí se podría implementar tracking de progreso
                        dismiss()
                    }) {
                        Text("Comenzar Entrenamiento")
                            .font(.headline)
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(
                                RoundedRectangle(cornerRadius: 12)
                                    .fill(
                                        LinearGradient(
                                            gradient: Gradient(colors: [.blue, .mint]),
                                            startPoint: .leading,
                                            endPoint: .trailing
                                        )
                                    )
                            )
                    }
                }
                .padding()
            }
            .navigationTitle("Entrenamiento \(training.number)")
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
    
    private func colorForCategory(_ category: TrainingCategory) -> Color {
        switch category {
        case .sleep: return .indigo
        case .feeding: return .pink
        case .contact: return .blue
        case .communication: return .mint
        case .limits: return .orange
        case .externalPressure: return .red
        }
    }
    
    private func colorForDifficulty(_ difficulty: TrainingDifficulty) -> Color {
        switch difficulty {
        case .beginner: return .green
        case .intermediate: return .orange
        case .advanced: return .red
        }
    }
}

