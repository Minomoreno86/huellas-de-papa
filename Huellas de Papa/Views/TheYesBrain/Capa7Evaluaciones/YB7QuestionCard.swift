import SwiftUI

/// Tarjeta de pregunta con escala visual (1-5)
struct YB7QuestionCard: View {
    let question: YB7Question
    let response: Double?
    let onResponse: (Double) -> Void
    
    private let scaleValues = [20.0, 40.0, 60.0, 80.0, 100.0]
    private let scaleLabels = ["Nunca", "Rara vez", "A veces", "Frecuente", "Siempre"]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            // Question Text
            Text(question.text)
                .font(.body)
                .fontWeight(.medium)
                .foregroundColor(.primary)
                .multilineTextAlignment(.leading)
            
            // Scale
            VStack(spacing: 12) {
                HStack(spacing: 12) {
                    ForEach(0..<5) { index in
                        scaleButton(index: index)
                    }
                }
                
                // Labels
                HStack {
                    Text(scaleLabels.first!)
                        .font(.caption)
                        .foregroundColor(.secondary)
                    
                    Spacer()
                    
                    Text(scaleLabels.last!)
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
            }
            
            // Visual Feedback
            if let score = response {
                HStack(spacing: 8) {
                    Image(systemName: feedbackIcon(score))
                        .foregroundColor(feedbackColor(score))
                    
                    Text(feedbackText(score))
                        .font(.caption)
                        .foregroundColor(feedbackColor(score))
                }
                .padding(.horizontal, 12)
                .padding(.vertical, 6)
                .background(
                    RoundedRectangle(cornerRadius: 8)
                        .fill(feedbackColor(score).opacity(0.1))
                )
            }
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(Color(.systemBackground))
                .shadow(color: Color.black.opacity(0.05), radius: 4, x: 0, y: 2)
        )
    }
    
    private func scaleButton(index: Int) -> some View {
        let value = scaleValues[index]
        let isSelected = response == value
        
        return Button(action: {
            onResponse(value)
        }) {
            VStack(spacing: 4) {
                Circle()
                    .fill(isSelected ? Color.blue : Color(.systemGray5))
                    .frame(width: 44, height: 44)
                    .overlay(
                        Text("\(index + 1)")
                            .font(.headline)
                            .foregroundColor(isSelected ? .white : .secondary)
                    )
                
                Text(scaleLabels[index])
                    .font(.caption2)
                    .foregroundColor(isSelected ? .blue : .secondary)
                    .multilineTextAlignment(.center)
                    .lineLimit(2)
                    .frame(height: 30)
            }
        }
        .buttonStyle(PlainButtonStyle())
    }
    
    private func feedbackIcon(_ score: Double) -> String {
        switch score {
        case 0..<40: return "info.circle.fill"
        case 40..<70: return "checkmark.circle.fill"
        case 70...100: return "star.circle.fill"
        default: return "circle.fill"
        }
    }
    
    private func feedbackColor(_ score: Double) -> Color {
        switch score {
        case 0..<40: return .orange
        case 40..<70: return .blue
        case 70...100: return .green
        default: return .gray
        }
    }
    
    private func feedbackText(_ score: Double) -> String {
        switch score {
        case 0..<40: return "Área de crecimiento"
        case 40..<70: return "En progreso"
        case 70...100: return "Fortaleza consolidada"
        default: return ""
        }
    }
}

// MARK: - Preview
struct YB7QuestionCard_Previews: PreviewProvider {
    static var previews: some View {
        VStack(spacing: 16) {
            YB7QuestionCard(
                question: YB7EvaluationData.createQuestions()[0],
                response: nil,
                onResponse: { _ in }
            )
            
            YB7QuestionCard(
                question: YB7EvaluationData.createQuestions()[1],
                response: 80.0,
                onResponse: { _ in }
            )
        }
        .padding()
        .background(Color(.systemGroupedBackground))
    }
}

