import SwiftUI

/// Vista principal de la Capa 7 - Evaluaciones
/// Auto-evaluación del padre con feedback inmediato
struct TA7View: View {
    @State private var currentQuestionIndex = 0
    @State private var selectedAnswer: String?
    @State private var showingFeedback = false
    @State private var responses: [TA7Response] = []
    @State private var showingReport = false
    
    private let questions = TA7QuestionData.allQuestions
    
    var body: some View {
        ScrollView {
            VStack(spacing: 32) {
                if !showingReport {
                    headerSection
                    progressSection
                    
                    if currentQuestionIndex < questions.count {
                        questionSection
                        
                        if showingFeedback {
                            feedbackSection
                        }
                    }
                } else {
                    TA7ReportView(responses: responses)
                }
            }
            .padding()
        }
        .background(Color(.systemGroupedBackground))
        .navigationTitle("Evaluación")
        .navigationBarTitleDisplayMode(.large)
    }
    
    private var headerSection: some View {
        VStack(spacing: 16) {
            Image(systemName: "chart.bar.doc.horizontal.fill")
                .font(.system(size: 60))
                .foregroundStyle(LinearGradient(colors: [.pink, .mint], startPoint: .topLeading, endPoint: .bottomTrailing))
            
            Text("Auto-Evaluación del Padre")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundStyle(LinearGradient(colors: [.pink, .mint], startPoint: .leading, endPoint: .trailing))
                .multilineTextAlignment(.center)
            
            Text("Evalúa tu práctica del amor incondicional")
                .font(.title3)
                .fontWeight(.medium)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
        }
        .padding(.vertical)
    }
    
    private var progressSection: some View {
        VStack(spacing: 12) {
            HStack {
                Text("Pregunta \(currentQuestionIndex + 1) de \(questions.count)")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                
                Spacer()
            }
            
            GeometryReader { geometry in
                ZStack(alignment: .leading) {
                    RoundedRectangle(cornerRadius: 8)
                        .fill(Color.gray.opacity(0.2))
                        .frame(height: 8)
                    
                    RoundedRectangle(cornerRadius: 8)
                        .fill(LinearGradient(colors: [.pink, .mint], startPoint: .leading, endPoint: .trailing))
                        .frame(width: geometry.size.width * CGFloat(currentQuestionIndex) / CGFloat(questions.count), height: 8)
                        .animation(.spring(), value: currentQuestionIndex)
                }
            }
            .frame(height: 8)
        }
    }
    
    private var questionSection: some View {
        let question = questions[currentQuestionIndex]
        
        return VStack(alignment: .leading, spacing: 20) {
            // Categoría
            Text(question.category)
                .font(.caption)
                .foregroundColor(.white)
                .padding(.horizontal, 12)
                .padding(.vertical, 6)
                .background(Capsule().fill(Color.mint))
            
            // Pregunta
            Text(question.text)
                .font(.title2)
                .fontWeight(.semibold)
                .foregroundColor(.primary)
            
            // Referencia del libro
            HStack(alignment: .top, spacing: 8) {
                Image(systemName: "book.fill")
                    .font(.caption)
                    .foregroundColor(.pink)
                
                Text(question.bookReference)
                    .font(.caption)
                    .italic()
                    .foregroundColor(.secondary)
            }
            .padding()
            .background(RoundedRectangle(cornerRadius: 8).fill(Color.pink.opacity(0.1)))
            
            // Opciones
            if let options = question.options {
                VStack(spacing: 12) {
                    ForEach(options, id: \.self) { option in
                        Button(action: {
                            selectedAnswer = option
                            showFeedback(for: question, answer: option)
                        }) {
                            HStack {
                                Text(option)
                                    .font(.body)
                                    .foregroundColor(.primary)
                                
                                Spacer()
                                
                                if selectedAnswer == option {
                                    Image(systemName: "checkmark.circle.fill")
                                        .foregroundColor(.pink)
                                }
                            }
                            .padding()
                            .background(
                                RoundedRectangle(cornerRadius: 12)
                                    .fill(selectedAnswer == option ? Color.pink.opacity(0.1) : Color(.systemBackground))
                            )
                            .overlay(
                                RoundedRectangle(cornerRadius: 12)
                                    .stroke(selectedAnswer == option ? Color.pink : Color.gray.opacity(0.2), lineWidth: selectedAnswer == option ? 2 : 1)
                            )
                        }
                        .disabled(showingFeedback)
                    }
                }
            }
        }
        .padding()
        .background(RoundedRectangle(cornerRadius: 16).fill(Color(.systemBackground)).shadow(color: Color.pink.opacity(0.1), radius: 10))
    }
    
    private var feedbackSection: some View {
        let question = questions[currentQuestionIndex]
        guard let answer = selectedAnswer,
              let feedback = question.feedbacks[answer] else {
            return AnyView(EmptyView())
        }
        
        return AnyView(
            VStack(spacing: 20) {
                // Score visual
                ZStack {
                    Circle()
                        .stroke(Color.gray.opacity(0.2), lineWidth: 8)
                        .frame(width: 100, height: 100)
                    
                    Circle()
                        .trim(from: 0, to: CGFloat(feedback.score) / 100)
                        .stroke(feedbackColor(feedback.type), style: StrokeStyle(lineWidth: 8, lineCap: .round))
                        .frame(width: 100, height: 100)
                        .rotationEffect(.degrees(-90))
                        .animation(.spring(), value: feedback.score)
                    
                    VStack(spacing: 4) {
                        Text("\(feedback.score)")
                            .font(.title)
                            .fontWeight(.bold)
                        
                        Text(feedback.type.rawValue)
                            .font(.caption2)
                            .multilineTextAlignment(.center)
                    }
                }
                
                // Mensaje
                VStack(alignment: .leading, spacing: 12) {
                    Label("Feedback", systemImage: feedbackIcon(feedback.type))
                        .font(.headline)
                        .foregroundColor(feedbackColor(feedback.type))
                    
                    Text(feedback.message)
                        .font(.body)
                        .foregroundColor(.primary)
                }
                .padding()
                .background(RoundedRectangle(cornerRadius: 12).fill(feedbackColor(feedback.type).opacity(0.1)))
                
                // Cita del libro
                VStack(alignment: .leading, spacing: 12) {
                    Label("Del libro", systemImage: "quote.bubble.fill")
                        .font(.headline)
                        .foregroundColor(.pink)
                    
                    Text("\"\(feedback.bookQuote)\"")
                        .font(.body)
                        .italic()
                        .foregroundColor(.primary)
                }
                .padding()
                .background(RoundedRectangle(cornerRadius: 12).fill(Color.pink.opacity(0.1)))
                
                // Recomendación
                VStack(alignment: .leading, spacing: 12) {
                    Label("Recomendación", systemImage: "lightbulb.fill")
                        .font(.headline)
                        .foregroundColor(.orange)
                    
                    Text(feedback.recommendation)
                        .font(.body)
                        .foregroundColor(.primary)
                }
                .padding()
                .background(RoundedRectangle(cornerRadius: 12).fill(Color.orange.opacity(0.1)))
                
                // Botón siguiente
                Button(action: nextQuestion) {
                    Label(currentQuestionIndex < questions.count - 1 ? "Siguiente Pregunta" : "Ver Reporte Final", systemImage: "arrow.right.circle.fill")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(LinearGradient(colors: [.pink, .mint], startPoint: .leading, endPoint: .trailing))
                        .cornerRadius(12)
                }
            }
            .padding()
            .background(RoundedRectangle(cornerRadius: 16).fill(Color(.systemBackground)).shadow(color: feedbackColor(feedback.type).opacity(0.2), radius: 12))
            .transition(.opacity.combined(with: .move(edge: .bottom)))
        )
    }
    
    private func showFeedback(for question: TA7Question, answer: String) {
        withAnimation(.spring()) {
            showingFeedback = true
        }
        triggerHaptic()
        
        // Guardar respuesta
        if let feedback = question.feedbacks[answer] {
            let response = TA7Response(questionId: question.id, answer: answer, feedback: feedback.message, score: feedback.score)
            responses.append(response)
        }
    }
    
    private func nextQuestion() {
        withAnimation(.spring()) {
            if currentQuestionIndex < questions.count - 1 {
                currentQuestionIndex += 1
                selectedAnswer = nil
                showingFeedback = false
            } else {
                showingReport = true
            }
        }
        triggerHaptic()
    }
    
    private func feedbackColor(_ type: TA7Feedback.FeedbackType) -> Color {
        switch type {
        case .excellent: return .green
        case .good: return .mint
        case .needsWork: return .orange
        case .critical: return .pink
        }
    }
    
    private func feedbackIcon(_ type: TA7Feedback.FeedbackType) -> String {
        switch type {
        case .excellent: return "star.fill"
        case .good: return "hand.thumbsup.fill"
        case .needsWork: return "wrench.fill"
        case .critical: return "exclamationmark.triangle.fill"
        }
    }
    
    private func triggerHaptic() {
        let impactFeedback = UIImpactFeedbackGenerator(style: .medium)
        impactFeedback.impactOccurred()
    }
}

