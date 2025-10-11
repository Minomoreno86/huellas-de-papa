import SwiftUI

/// Vista principal de la Capa 6 (Plan de Entrenamiento) del módulo Bésame Mucho
/// Presenta 10 entrenamientos específicos que el padre puede elegir
struct BM6View: View {
    @State private var selectedCategory: TrainingCategory? = nil
    
    var body: some View {
        ScrollView {
            VStack(spacing: 32) {
                headerSection
                instructionsSection
                categoryFilterSection
                trainingsGridSection
                motivationalQuoteSection
            }
            .padding()
        }
        .background(Color(.systemGroupedBackground))
        .navigationTitle("Plan de Entrenamiento")
        .navigationBarTitleDisplayMode(.large)
    }
    
    // MARK: - Header
    private var headerSection: some View {
        VStack(spacing: 16) {
            Image(systemName: "figure.run")
                .font(.system(size: 50))
                .foregroundStyle(
                    LinearGradient(
                        colors: [.blue, .mint],
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                )
            
            Text("Plan de Entrenamiento")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundStyle(
                    LinearGradient(
                        gradient: Gradient(colors: [.blue, .mint]),
                        startPoint: .leading,
                        endPoint: .trailing
                    )
                )
            
            Text("Elige qué aspecto de la crianza con apego quieres entrenar")
                .font(.title3)
                .fontWeight(.medium)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
            
            Text("7 programas especializados basados en el libro")
                .font(.subheadline)
                .foregroundColor(.blue)
                .italic()
        }
        .padding(.vertical)
    }
    
    // MARK: - Instructions
    private var instructionsSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            Label("Cómo usar los entrenamientos", systemImage: "info.circle.fill")
                .font(.headline)
                .foregroundColor(.blue)
            
            VStack(alignment: .leading, spacing: 8) {
                instructionRow(number: 1, text: "Elige el entrenamiento que necesitas")
                instructionRow(number: 2, text: "Lee todos los módulos incluidos")
                instructionRow(number: 3, text: "Practica los ejercicios sugeridos")
                instructionRow(number: 4, text: "Evalúa tu progreso honestamente")
                instructionRow(number: 5, text: "Repite o combina entrenamientos según necesites")
            }
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(Color(.systemBackground))
                .shadow(color: Color.blue.opacity(0.1), radius: 4, x: 0, y: 2)
        )
    }
    
    private func instructionRow(number: Int, text: String) -> some View {
        HStack(spacing: 12) {
            Text("\(number)")
                .font(.caption)
                .fontWeight(.bold)
                .foregroundColor(.white)
                .frame(width: 24, height: 24)
                .background(Circle().fill(Color.blue))
            
            Text(text)
                .font(.body)
                .foregroundColor(.primary)
        }
    }
    
    // MARK: - Category Filter
    private var categoryFilterSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Filtrar por categoría")
                .font(.headline)
                .foregroundColor(.primary)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 12) {
                    Button(action: {
                        triggerHaptic()
                        withAnimation { selectedCategory = nil }
                    }) {
                        Text("Todos")
                            .font(.subheadline)
                            .fontWeight(.medium)
                            .foregroundColor(selectedCategory == nil ? .white : .blue)
                            .padding(.horizontal, 16)
                            .padding(.vertical, 8)
                            .background(
                                Capsule()
                                    .fill(selectedCategory == nil ? Color.blue : Color.blue.opacity(0.1))
                            )
                    }
                    
                    ForEach([TrainingCategory.sleep, .feeding, .contact, .communication, .limits, .externalPressure], id: \.self) { category in
                        Button(action: {
                            triggerHaptic()
                            withAnimation { selectedCategory = category }
                        }) {
                            HStack(spacing: 6) {
                                Image(systemName: category.icon)
                                Text(category.rawValue)
                            }
                            .font(.subheadline)
                            .fontWeight(.medium)
                            .foregroundColor(selectedCategory == category ? .white : colorForCategory(category))
                            .padding(.horizontal, 16)
                            .padding(.vertical, 8)
                            .background(
                                Capsule()
                                    .fill(selectedCategory == category ? colorForCategory(category) : colorForCategory(category).opacity(0.1))
                            )
                        }
                    }
                }
                .padding(.horizontal, 4)
            }
        }
    }
    
    // MARK: - Trainings Grid
    private var trainingsGridSection: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("7 Entrenamientos Disponibles")
                .font(.title2)
                .fontWeight(.semibold)
                .foregroundColor(.primary)
            
            LazyVGrid(columns: [GridItem(.flexible())], spacing: 16) {
                ForEach(filteredTrainings) { training in
                    BM6TrainingCard(training: training)
                }
            }
        }
    }
    
    // MARK: - Motivational Quote
    private var motivationalQuoteSection: some View {
        VStack(spacing: 20) {
            Text("💙 Motivación")
                .font(.headline)
                .fontWeight(.semibold)
                .foregroundColor(.primary)
            
            VStack(spacing: 12) {
                Text("\"Criar con apego no es un método que se aprende en un día. Es un compromiso diario de amor, respeto y paciencia.\"")
                    .font(.title3)
                    .fontWeight(.medium)
                    .foregroundColor(.primary)
                    .multilineTextAlignment(.center)
                    .italic()
                
                Text("— Carlos González")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
            .padding(.vertical, 24)
            .padding(.horizontal, 20)
            .background(
                RoundedRectangle(cornerRadius: 16)
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
                    .overlay(
                        RoundedRectangle(cornerRadius: 16)
                            .stroke(
                                LinearGradient(
                                    gradient: Gradient(colors: [
                                        Color.blue.opacity(0.3),
                                        Color.mint.opacity(0.2)
                                    ]),
                                    startPoint: .topLeading,
                                    endPoint: .bottomTrailing
                                ),
                                lineWidth: 1
                            )
                    )
            )
            .shadow(color: Color.blue.opacity(0.1), radius: 8, x: 0, y: 4)
        }
    }
    
    // MARK: - Computed Properties
    private var filteredTrainings: [BM6Training] {
        if let selectedCategory = selectedCategory {
            return allTrainings.filter { $0.category == selectedCategory }
        }
        return allTrainings
    }
    
    // MARK: - Data
    private var allTrainings: [BM6Training] {
        [trainingsPart1, trainingsPart2].flatMap { $0 }
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
    
    private func triggerHaptic() {
        #if !os(macOS)
        let impactFeedback = UIImpactFeedbackGenerator(style: .light)
        impactFeedback.impactOccurred()
        #endif
    }
}

// MARK: - Preview
struct BM6View_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            BM6View()
        }
    }
}

