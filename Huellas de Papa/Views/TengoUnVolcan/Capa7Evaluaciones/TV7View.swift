import SwiftUI

/// Vista principal de la Capa 7 (Autoevaluación)
/// Evaluación reflexiva para padres basada en el libro
struct TV7View: View {
    @State private var responses: [UUID: Int] = [:] // questionId: rating (1-5)
    @State private var showingReport = false
    
    var body: some View {
        ScrollView {
            VStack(spacing: 32) {
                // Header
                headerSection
                
                // Instrucciones
                instructionsSection
                
                // Preguntas por categoría
                questionsSection
                
                // Botón de ver resultados
                if responses.count == TV7Data.evaluationQuestions.count {
                    resultsButton
                }
            }
            .padding()
        }
        .navigationTitle("Autoevaluación")
        .navigationBarTitleDisplayMode(.large)
        .background(Color(.systemGroupedBackground))
        .sheet(isPresented: $showingReport) {
            TV7ReportView(responses: responses)
        }
    }
    
    // MARK: - Header
    private var headerSection: some View {
        VStack(spacing: 16) {
            ZStack {
                Circle()
                    .fill(
                        LinearGradient(
                            gradient: Gradient(colors: [.purple.opacity(0.6), .blue.opacity(0.3)]),
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                    )
                    .frame(width: 100, height: 100)
                
                Image(systemName: "list.clipboard.fill")
                    .font(.system(size: 40))
                    .foregroundColor(.white)
            }
            
            Text("Autoevaluación")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundStyle(
                    LinearGradient(
                        gradient: Gradient(colors: [.blue, .mint]),
                        startPoint: .leading,
                        endPoint: .trailing
                    )
                )
            
            Text("Reflexiona sobre tu comprensión y aplicación del modelo del volcán")
                .font(.title3)
                .fontWeight(.medium)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
        }
        .padding(.vertical)
    }
    
    // MARK: - Instructions
    private var instructionsSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                Image(systemName: "info.circle.fill")
                    .foregroundColor(.blue)
                
                Text("Instrucciones")
                    .font(.headline)
                    .foregroundColor(.primary)
            }
            
            Text("Responde honestamente usando la escala 1-5. Esta evaluación es para TI, para identificar fortalezas y áreas de mejora. No hay respuestas correctas o incorrectas, solo reflexión.")
                .font(.body)
                .foregroundColor(.secondary)
                .fixedSize(horizontal: false, vertical: true)
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(Color.blue.opacity(0.1))
        )
    }
    
    // MARK: - Questions Section
    private var questionsSection: some View {
        VStack(spacing: 24) {
            ForEach(groupedQuestions.keys.sorted(), id: \.self) { category in
                categorySection(category: category, questions: groupedQuestions[category] ?? [])
            }
        }
    }
    
    private func categorySection(category: String, questions: [TV7Data.EvaluationQuestion]) -> some View {
        VStack(alignment: .leading, spacing: 16) {
            Text(category)
                .font(.title2)
                .fontWeight(.semibold)
                .foregroundColor(.primary)
            
            ForEach(questions) { question in
                questionCard(question)
            }
        }
    }
    
    private func questionCard(_ question: TV7Data.EvaluationQuestion) -> some View {
        VStack(alignment: .leading, spacing: 16) {
            Text(question.text)
                .font(.body)
                .fontWeight(.medium)
                .foregroundColor(.primary)
                .fixedSize(horizontal: false, vertical: true)
            
            if let labels = question.scaleLabels {
                HStack {
                    Text(labels.low)
                        .font(.caption)
                        .foregroundColor(.secondary)
                    
                    Spacer()
                    
                    Text(labels.high)
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
            }
            
            HStack(spacing: 12) {
                ForEach(1...5, id: \.self) { rating in
                    Button {
                        withAnimation(.spring()) {
                            responses[question.id] = rating
                        }
                    } label: {
                        Text("\(rating)")
                            .font(.headline)
                            .fontWeight(.semibold)
                            .foregroundColor(responses[question.id] == rating ? .white : .blue)
                            .frame(width: 50, height: 50)
                            .background(
                                Circle()
                                    .fill(responses[question.id] == rating ? Color.blue : Color.blue.opacity(0.1))
                            )
                    }
                }
            }
            .frame(maxWidth: .infinity)
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(Color(.systemBackground))
                .shadow(color: Color.black.opacity(0.1), radius: 8, x: 0, y: 2)
        )
    }
    
    // MARK: - Results Button
    private var resultsButton: some View {
        Button {
            showingReport = true
        } label: {
            HStack {
                Image(systemName: "chart.bar.doc.horizontal.fill")
                Text("Ver Mi Reporte")
                    .fontWeight(.semibold)
            }
            .foregroundColor(.white)
            .frame(maxWidth: .infinity)
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 16)
                    .fill(
                        LinearGradient(
                            gradient: Gradient(colors: [.green, .mint]),
                            startPoint: .leading,
                            endPoint: .trailing
                        )
                    )
            )
        }
    }
    
    // MARK: - Helpers
    private var groupedQuestions: [String: [TV7Data.EvaluationQuestion]] {
        Dictionary(grouping: TV7Data.evaluationQuestions, by: { $0.category })
    }
}

#Preview {
    NavigationStack {
        TV7View()
    }
}

