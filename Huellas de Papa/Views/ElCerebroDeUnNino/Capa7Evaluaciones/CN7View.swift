import SwiftUI

/// Vista principal de la Capa 7 (Evaluaciones)
/// Sistema de evaluación de comprensión y aplicación
struct CN7View: View {
    @State private var selectedEvaluation: CN7Evaluation?
    @State private var showingEvaluation = false
    
    var body: some View {
        ScrollView {
            VStack(spacing: 32) {
                // Header
                headerSection
                
                // Evaluations
                evaluationsSection
                
                // Info
                infoSection
            }
            .padding()
        }
        .background(Color(.systemGroupedBackground))
        .navigationTitle("Evaluaciones")
        .navigationBarTitleDisplayMode(.large)
        .sheet(isPresented: $showingEvaluation) {
            if let evaluation = selectedEvaluation {
                CN7EvaluationView(evaluation: evaluation)
            }
        }
    }
    
    // MARK: - Header
    private var headerSection: some View {
        VStack(spacing: 16) {
            Text("Evalúa tu Progreso")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundStyle(
                    LinearGradient(
                        colors: [.blue, .mint],
                        startPoint: .leading,
                        endPoint: .trailing
                    )
                )
            
            Text("Verifica tu comprensión del libro y reflexiona sobre tu aplicación práctica")
                .font(.title3)
                .fontWeight(.medium)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
            
            Text("Auto-reflexión • Sin juicios • Oportunidad de crecimiento")
                .font(.subheadline)
                .foregroundColor(.blue)
                .italic()
        }
        .padding(.vertical)
    }
    
    // MARK: - Evaluations Section
    private var evaluationsSection: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Evaluaciones Disponibles")
                .font(.title2)
                .fontWeight(.semibold)
            
            VStack(spacing: 12) {
                ForEach(cn7Evaluations) { evaluation in
                    CN7EvaluationCard(evaluation: evaluation)
                        .onTapGesture {
                            selectedEvaluation = evaluation
                            showingEvaluation = true
                        }
                }
            }
        }
    }
    
    // MARK: - Info Section
    private var infoSection: some View {
        VStack(spacing: 16) {
            Label("Sobre las Evaluaciones", systemImage: "info.circle.fill")
                .font(.headline)
                .foregroundColor(.blue)
            
            VStack(alignment: .leading, spacing: 12) {
                InfoPoint(
                    icon: "target",
                    text: "Las evaluaciones NO son exámenes. Son herramientas de reflexión.",
                    color: .blue
                )
                
                InfoPoint(
                    icon: "arrow.triangle.branch",
                    text: "Áreas débiles = oportunidades de crecimiento específicas.",
                    color: .orange
                )
                
                InfoPoint(
                    icon: "heart.fill",
                    text: "No se trata de ser padre perfecto. Se trata de ser intencional.",
                    color: .pink
                )
                
                InfoPoint(
                    icon: "brain.head.profile",
                    text: "Tu cerebro también está aprendiendo. Ten paciencia contigo mismo.",
                    color: .purple
                )
            }
        }
        .padding(20)
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(
                    LinearGradient(
                        colors: [Color.blue.opacity(0.1), Color.mint.opacity(0.05)],
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                )
        )
    }
}

// MARK: - Evaluation Card
struct CN7EvaluationCard: View {
    let evaluation: CN7Evaluation
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                Image(systemName: evaluation.icon)
                    .font(.system(size: 40))
                    .foregroundColor(colorFromString(evaluation.color))
                
                Spacer()
                
                VStack(alignment: .trailing, spacing: 4) {
                    Text("\(evaluation.questions.count)")
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(colorFromString(evaluation.color))
                    Text("preguntas")
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
            }
            
            Text(evaluation.title)
                .font(.title3)
                .fontWeight(.bold)
            
            Text(evaluation.description)
                .font(.body)
                .foregroundColor(.secondary)
            
            HStack {
                Label(evaluation.duration, systemImage: "clock")
                    .font(.caption)
                    .foregroundColor(.secondary)
                
                Spacer()
                
                HStack(spacing: 6) {
                    Text("Comenzar")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                    Image(systemName: "arrow.right.circle.fill")
                }
                .foregroundColor(colorFromString(evaluation.color))
            }
        }
        .padding(16)
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(Color(.systemBackground))
                .overlay(
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(colorFromString(evaluation.color).opacity(0.3), lineWidth: 2)
                )
                .shadow(radius: 4)
        )
    }
    
    private func colorFromString(_ colorName: String) -> Color {
        switch colorName {
        case "blue": return .blue
        case "purple": return .purple
        case "green": return .green
        case "orange": return .orange
        default: return .blue
        }
    }
}

// MARK: - Info Point
struct InfoPoint: View {
    let icon: String
    let text: String
    let color: Color
    
    var body: some View {
        HStack(alignment: .top, spacing: 12) {
            Image(systemName: icon)
                .foregroundColor(color)
                .font(.title3)
            
            Text(text)
                .font(.body)
                .foregroundColor(.primary)
        }
    }
}

// MARK: - Evaluation View (Interactive)
struct CN7EvaluationView: View {
    let evaluation: CN7Evaluation
    @State private var currentQuestionIndex = 0
    @State private var responses: [CN7Response] = []
    @State private var selectedAnswer: String?
    @State private var showingResult = false
    @Environment(\.dismiss) var dismiss
    
    var currentQuestion: CN7Question? {
        guard currentQuestionIndex < evaluation.questions.count else { return nil }
        return evaluation.questions[currentQuestionIndex]
    }
    
    var body: some View {
        NavigationView {
            if showingResult {
                CN7ResultView(
                    evaluation: evaluation,
                    responses: responses,
                    onDismiss: { dismiss() }
                )
            } else {
                questionView
            }
        }
    }
    
    private var questionView: some View {
        ScrollView {
            VStack(spacing: 24) {
                if let question = currentQuestion {
                    // Progress
                    progressSection
                    
                    // Question
                    questionSection(question: question)
                    
                    // Options
                    optionsSection(question: question)
                    
                    // Navigation
                    navigationSection
                }
            }
            .padding()
        }
        .background(Color(.systemGroupedBackground))
        .navigationTitle(evaluation.title)
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button("Cancelar") {
                    dismiss()
                }
            }
        }
    }
    
    private var progressSection: some View {
        VStack(spacing: 8) {
            HStack {
                Text("Pregunta \(currentQuestionIndex + 1) de \(evaluation.questions.count)")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                
                Spacer()
            }
            
            ProgressView(value: Double(currentQuestionIndex + 1), total: Double(evaluation.questions.count))
                .tint(.blue)
        }
    }
    
    private func questionSection(question: CN7Question) -> some View {
        VStack(alignment: .leading, spacing: 12) {
            if let strategy = question.strategyRelated {
                Text("Estrategia #\(strategy)")
                    .font(.caption)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding(.horizontal, 12)
                    .padding(.vertical, 6)
                    .background(Capsule().fill(Color.blue))
            }
            
            Text(question.questionText)
                .font(.title3)
                .fontWeight(.semibold)
                .foregroundColor(.primary)
        }
        .padding(20)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(Color(.systemBackground))
        )
    }
    
    private func optionsSection(question: CN7Question) -> some View {
        VStack(spacing: 12) {
            if let options = question.options {
                ForEach(options, id: \.self) { option in
                    CN7OptionButton(
                        text: option,
                        isSelected: selectedAnswer == option
                    ) {
                        selectedAnswer = option
                    }
                }
            }
        }
    }
    
    private var navigationSection: some View {
        Button(action: nextQuestion) {
            HStack {
                Spacer()
                Text(currentQuestionIndex == evaluation.questions.count - 1 ? "Finalizar" : "Siguiente")
                    .fontWeight(.semibold)
                Image(systemName: "arrow.right")
            }
            .foregroundColor(.white)
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 12)
                    .fill(selectedAnswer != nil ? Color.blue : Color.gray)
            )
        }
        .disabled(selectedAnswer == nil)
    }
    
    private func nextQuestion() {
        guard let question = currentQuestion,
              let answer = selectedAnswer else { return }
        
        let isCorrect = question.correctAnswer != nil ? (answer == question.correctAnswer) : nil
        let response = CN7Response(questionId: question.id, answer: answer, isCorrect: isCorrect)
        responses.append(response)
        
        if currentQuestionIndex < evaluation.questions.count - 1 {
            currentQuestionIndex += 1
            selectedAnswer = nil
        } else {
            showingResult = true
        }
    }
}

// MARK: - Option Button
struct CN7OptionButton: View {
    let text: String
    let isSelected: Bool
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            HStack {
                Text(text)
                    .font(.body)
                    .foregroundColor(.primary)
                    .multilineTextAlignment(.leading)
                
                Spacer()
                
                if isSelected {
                    Image(systemName: "checkmark.circle.fill")
                        .foregroundColor(.blue)
                        .font(.title3)
                }
            }
            .padding(16)
            .background(
                RoundedRectangle(cornerRadius: 12)
                    .fill(Color(.systemBackground))
                    .overlay(
                        RoundedRectangle(cornerRadius: 12)
                            .stroke(isSelected ? Color.blue : Color.gray.opacity(0.3), lineWidth: isSelected ? 2 : 1)
                    )
            )
        }
    }
}

// MARK: - Preview
struct CN7View_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            CN7View()
        }
    }
}

