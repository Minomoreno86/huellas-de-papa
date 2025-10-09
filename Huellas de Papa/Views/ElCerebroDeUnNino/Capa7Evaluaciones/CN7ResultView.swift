import SwiftUI

/// Vista de resultados después de completar evaluación
struct CN7ResultView: View {
    let evaluation: CN7Evaluation
    let responses: [CN7Response]
    let onDismiss: () -> Void
    
    var correctCount: Int {
        responses.filter { $0.isCorrect == true }.count
    }
    
    var totalWithCorrect: Int {
        responses.filter { $0.isCorrect != nil }.count
    }
    
    var percentage: Double {
        guard totalWithCorrect > 0 else { return 0 }
        return Double(correctCount) / Double(totalWithCorrect) * 100
    }
    
    var body: some View {
        ScrollView {
            VStack(spacing: 32) {
                // Score
                scoreSection
                
                // Feedback
                feedbackSection
                
                // Recommendations
                recommendationsSection
                
                // Detailed Feedback
                detailedFeedbackSection
                
                // Buttons
                buttonsSection
            }
            .padding()
        }
        .background(Color(.systemGroupedBackground))
        .navigationBarTitleDisplayMode(.inline)
    }
    
    // MARK: - Score Section
    private var scoreSection: some View {
        VStack(spacing: 16) {
            Text(scoreEmoji)
                .font(.system(size: 80))
            
            Text(scoreTitle)
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(scoreColor)
            
            if totalWithCorrect > 0 {
                Text("\(correctCount) de \(totalWithCorrect) correctas")
                    .font(.headline)
                    .foregroundColor(.secondary)
                
                ZStack {
                    Circle()
                        .stroke(Color.gray.opacity(0.3), lineWidth: 12)
                        .frame(width: 150, height: 150)
                    
                    Circle()
                        .trim(from: 0, to: percentage / 100)
                        .stroke(scoreColor, style: StrokeStyle(lineWidth: 12, lineCap: .round))
                        .frame(width: 150, height: 150)
                        .rotationEffect(.degrees(-90))
                    
                    Text("\(Int(percentage))%")
                        .font(.system(size: 40, weight: .bold))
                        .foregroundColor(scoreColor)
                }
                .padding()
            }
        }
        .padding(24)
        .background(
            RoundedRectangle(cornerRadius: 20)
                .fill(scoreColor.opacity(0.1))
        )
    }
    
    // MARK: - Feedback Section
    private var feedbackSection: some View {
        VStack(alignment: .leading, spacing: 16) {
            Label("Retroalimentación", systemImage: "lightbulb.fill")
                .font(.headline)
                .fontWeight(.semibold)
            
            Text(feedbackText)
                .font(.body)
                .foregroundColor(.primary)
        }
        .padding(16)
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(Color(.systemBackground))
        )
    }
    
    // MARK: - Recommendations Section
    private var recommendationsSection: some View {
        VStack(alignment: .leading, spacing: 16) {
            Label("Próximos Pasos", systemImage: "arrow.right.circle.fill")
                .font(.headline)
                .fontWeight(.semibold)
                .foregroundColor(.blue)
            
            ForEach(recommendations, id: \.self) { recommendation in
                HStack(alignment: .top, spacing: 12) {
                    Image(systemName: "checkmark.circle.fill")
                        .foregroundColor(.green)
                    Text(recommendation)
                        .font(.body)
                }
            }
        }
        .padding(16)
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(Color.green.opacity(0.1))
        )
    }
    
    // MARK: - Detailed Feedback Section
    private var detailedFeedbackSection: some View {
        VStack(alignment: .leading, spacing: 16) {
            Label("Feedback Detallado por Pregunta", systemImage: "list.bullet.clipboard.fill")
                .font(.headline)
                .fontWeight(.semibold)
                .foregroundColor(.blue)
            
            ForEach(Array(zip(evaluation.questions, responses).enumerated()), id: \.offset) { index, pair in
                let (question, response) = pair
                
                VStack(alignment: .leading, spacing: 12) {
                    HStack {
                        Text("Pregunta \(index + 1)")
                            .font(.caption)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .padding(.horizontal, 10)
                            .padding(.vertical, 4)
                            .background(Capsule().fill(Color.blue))
                        
                        if let isCorrect = response.isCorrect {
                            Image(systemName: isCorrect ? "checkmark.circle.fill" : "xmark.circle.fill")
                                .foregroundColor(isCorrect ? .green : .red)
                        }
                        
                        Spacer()
                    }
                    
                    Text(question.questionText)
                        .font(.subheadline)
                        .fontWeight(.semibold)
                    
                    HStack(spacing: 8) {
                        Text("Tu respuesta:")
                            .font(.caption)
                            .foregroundColor(.secondary)
                        Text(response.answer)
                            .font(.caption)
                            .italic()
                    }
                    
                    Divider()
                    
                    // Feedback específico
                    HStack(alignment: .top, spacing: 8) {
                        Image(systemName: "lightbulb.fill")
                            .foregroundColor(.orange)
                        Text(question.explanation)
                            .font(.caption)
                            .foregroundColor(.primary)
                    }
                }
                .padding(12)
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color(.systemBackground))
                )
            }
        }
        .padding(16)
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(Color.blue.opacity(0.05))
        )
    }
    
    // MARK: - Buttons Section
    private var buttonsSection: some View {
        VStack(spacing: 12) {
            Button(action: onDismiss) {
                Text("Finalizar Evaluación")
                    .fontWeight(.semibold)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(12)
            }
        }
        .padding(.top)
    }
    
    // MARK: - Computed Properties
    private var scoreEmoji: String {
        switch percentage {
        case 90...100: return "🌟"
        case 75..<90: return "🎉"
        case 60..<75: return "👍"
        case 40..<60: return "📚"
        default: return "🌱"
        }
    }
    
    private var scoreTitle: String {
        switch percentage {
        case 90...100: return "¡Excelente Dominio!"
        case 75..<90: return "¡Muy Bien!"
        case 60..<75: return "Buen Progreso"
        case 40..<60: return "En Desarrollo"
        default: return "Iniciando el Camino"
        }
    }
    
    private var scoreColor: Color {
        switch percentage {
        case 75...100: return .green
        case 50..<75: return .orange
        default: return .blue
        }
    }
    
    private var feedbackText: String {
        switch percentage {
        case 90...100:
            return "Tienes excelente comprensión de los conceptos del libro. Has integrado profundamente las enseñanzas de Siegel. Continúa practicando y refinando tu aplicación. Recuerda: el objetivo no es perfección, sino intencionalidad."
        case 75..<90:
            return "Tienes buena comprensión de las estrategias principales. Hay algunas áreas donde puedes profundizar. Revisa los capítulos relacionados con las preguntas que fallaste. La práctica repetida fortalecerá tu dominio."
        case 60..<75:
            return "Estás en buen camino de comprensión. Hay conceptos clave que necesitas reforzar. Te recomiendo releer los capítulos del libro enfocándote en las áreas identificadas abajo. Recuerda: tu cerebro también está aprendiendo."
        case 40..<60:
            return "Estás comenzando a integrar los conceptos. Te recomendamos revisar el libro nuevamente, especialmente las 'Hojas de Refrigerador' de cada capítulo. Practica una estrategia a la vez. El aprendizaje toma tiempo."
        default:
            return "Estás al inicio del camino. No te desanimes. El libro presenta conceptos contra-intuitivos que requieren tiempo para integrar. Te recomendamos empezar con las primeras 3 estrategias y practicarlas intensamente antes de avanzar."
        }
    }
    
    private var recommendations: [String] {
        var recs: [String] = []
        
        // Identificar áreas débiles
        let wrongQuestions = responses.filter { $0.isCorrect == false }
        let strategies = Set(wrongQuestions.compactMap { response in
            evaluation.questions.first(where: { $0.id == response.questionId })?.strategyRelated
        })
        
        if strategies.isEmpty {
            recs.append("¡Excelente trabajo! Continúa practicando todas las estrategias en tu vida diaria.")
        } else {
            recs.append("Enfócate especialmente en estas estrategias:")
            for strategy in strategies.sorted() {
                if let stratData = cn1Strategies.first(where: { $0.number == strategy }) {
                    recs.append("  • Estrategia #\(strategy): \(stratData.title)")
                }
            }
        }
        
        recs.append("Revisa la Capa 5 'Del Libro' para repasar conceptos clave.")
        recs.append("Practica una estrategia por semana siguiendo el Plan de Entrenamiento (Capa 6).")
        recs.append("Recuerda: el objetivo no es perfección, sino progreso intencional.")
        
        return recs
    }
}

// MARK: - Preview
struct CN7EvaluationView_Previews: PreviewProvider {
    static var previews: some View {
        CN7View()
    }
}

