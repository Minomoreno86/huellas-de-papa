import SwiftUI

/// Vista principal de la Capa 7 (Evaluaciones) del módulo Bésame Mucho
/// Presenta 8 cuestionarios de autoevaluación basados en el libro
struct BM7View: View {
    @State private var selectedCategory: EvaluationCategory? = nil
    
    var body: some View {
        ScrollView {
            VStack(spacing: 32) {
                headerSection
                instructionsSection
                categoryFilterSection
                questionnairesGridSection
                motivationalQuoteSection
            }
            .padding()
        }
        .background(Color(.systemGroupedBackground))
        .navigationTitle("Evaluaciones")
        .navigationBarTitleDisplayMode(.large)
    }
    
    // MARK: - Header
    private var headerSection: some View {
        VStack(spacing: 16) {
            Image(systemName: "chart.bar.doc.horizontal.fill")
                .font(.system(size: 50))
                .foregroundStyle(
                    LinearGradient(
                        colors: [.blue, .mint],
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                )
            
            Text("Evaluaciones")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundStyle(
                    LinearGradient(
                        gradient: Gradient(colors: [.blue, .mint]),
                        startPoint: .leading,
                        endPoint: .trailing
                    )
                )
            
            Text("Evalúa tu crianza con apego honestamente")
                .font(.title3)
                .fontWeight(.medium)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
            
            Text("8 cuestionarios basados en el libro")
                .font(.subheadline)
                .foregroundColor(.blue)
                .italic()
        }
        .padding(.vertical)
    }
    
    // MARK: - Instructions
    private var instructionsSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            Label("Cómo usar las evaluaciones", systemImage: "info.circle.fill")
                .font(.headline)
                .foregroundColor(.blue)
            
            VStack(alignment: .leading, spacing: 8) {
                instructionRow(number: 1, text: "Responde con honestidad total")
                instructionRow(number: 2, text: "No hay respuestas 'correctas' absolutas")
                instructionRow(number: 3, text: "Usa los resultados para mejorar")
                instructionRow(number: 4, text: "Repite cada mes para ver progreso")
                instructionRow(number: 5, text: "No te juzgues, es proceso de aprendizaje")
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
                    
                    ForEach([EvaluationCategory.sleep, .feeding, .contact, .limits, .emotions, .externalPressure, .general], id: \.self) { category in
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
    
    // MARK: - Questionnaires Grid
    private var questionnairesGridSection: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("8 Cuestionarios de Autoevaluación")
                .font(.title2)
                .fontWeight(.semibold)
                .foregroundColor(.primary)
            
            LazyVGrid(columns: [GridItem(.flexible())], spacing: 16) {
                ForEach(filteredQuestionnaires) { questionnaire in
                    BM7QuestionnaireCard(questionnaire: questionnaire)
                }
            }
        }
    }
    
    // MARK: - Motivational Quote
    private var motivationalQuoteSection: some View {
        VStack(spacing: 20) {
            Text("💙 Reflexión")
                .font(.headline)
                .fontWeight(.semibold)
                .foregroundColor(.primary)
            
            VStack(spacing: 12) {
                Text("\"La perfección no existe en la crianza. Solo existe el amor, la paciencia y el compromiso de mejorar cada día.\"")
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
    private var filteredQuestionnaires: [BM7Questionnaire] {
        if let selectedCategory = selectedCategory {
            return allQuestionnaires.filter { $0.category == selectedCategory }
        }
        return allQuestionnaires
    }
    
    // MARK: - Data
    private var allQuestionnaires: [BM7Questionnaire] {
        [questionnairesPart1, questionnairesPart2].flatMap { $0 }
    }
    
    private func colorForCategory(_ category: EvaluationCategory) -> Color {
        switch category {
        case .sleep: return .indigo
        case .feeding: return .pink
        case .contact: return .blue
        case .limits: return .orange
        case .emotions: return .mint
        case .externalPressure: return .red
        case .general: return .purple
        }
    }
    
    private func colorForResult(_ level: AlignmentResult) -> Color {
        switch level {
        case .mastery: return .mint
        case .goodPath: return .green
        case .inProgress: return .orange
        case .needsSupport: return .red
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
struct BM7View_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            BM7View()
        }
    }
}

