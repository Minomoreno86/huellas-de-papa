import SwiftUI

/// Vista de reporte de autoevaluación
struct TV7ReportView: View {
    let responses: [UUID: Int]
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 32) {
                    // Puntaje general
                    overallScoreSection
                    
                    // Puntajes por categoría
                    categoryScoresSection
                    
                    // Fortalezas
                    strengthsSection
                    
                    // Áreas de mejora
                    areasToImproveSection
                    
                    // Recomendaciones
                    recommendationsSection
                }
                .padding()
            }
            .navigationTitle("Tu Reporte")
            .navigationBarTitleDisplayMode(.large)
            .background(Color(.systemGroupedBackground))
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button("Cerrar") {
                        dismiss()
                    }
                }
            }
        }
    }
    
    // MARK: - Overall Score
    private var overallScoreSection: some View {
        VStack(spacing: 20) {
            ZStack {
                Circle()
                    .stroke(Color.gray.opacity(0.2), lineWidth: 15)
                    .frame(width: 150, height: 150)
                
                Circle()
                    .trim(from: 0, to: overallScore / 100)
                    .stroke(
                        LinearGradient(
                            gradient: Gradient(colors: scoreColors),
                            startPoint: .top,
                            endPoint: .bottom
                        ),
                        style: StrokeStyle(lineWidth: 15, lineCap: .round)
                    )
                    .frame(width: 150, height: 150)
                    .rotationEffect(.degrees(-90))
                
                VStack {
                    Text("\(Int(overallScore))")
                        .font(.system(size: 50))
                        .fontWeight(.bold)
                        .foregroundColor(.primary)
                    
                    Text("de 100")
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
            }
            
            Text(feedback.message)
                .font(.title3)
                .fontWeight(.medium)
                .foregroundColor(.primary)
                .multilineTextAlignment(.center)
                .padding(.horizontal)
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(Color(.systemBackground))
                .shadow(color: Color.black.opacity(0.1), radius: 8, x: 0, y: 2)
        )
    }
    
    // MARK: - Category Scores
    private var categoryScoresSection: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Puntajes por Categoría")
                .font(.title2)
                .fontWeight(.semibold)
            
            ForEach(categoryScores.sorted(by: { $0.key < $1.key }), id: \.key) { category, score in
                categoryRow(category: category, score: score)
            }
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(Color(.systemBackground))
                .shadow(color: Color.black.opacity(0.1), radius: 8, x: 0, y: 2)
        )
    }
    
    private func categoryRow(category: String, score: Double) -> some View {
        VStack(spacing: 8) {
            HStack {
                Text(category)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundColor(.primary)
                
                Spacer()
                
                Text("\(Int(score))%")
                    .font(.headline)
                    .foregroundColor(categoryColor(score))
            }
            
            GeometryReader { geometry in
                ZStack(alignment: .leading) {
                    RoundedRectangle(cornerRadius: 4)
                        .fill(Color.gray.opacity(0.2))
                        .frame(height: 8)
                    
                    RoundedRectangle(cornerRadius: 4)
                        .fill(categoryColor(score))
                        .frame(width: geometry.size.width * (score / 100), height: 8)
                }
            }
            .frame(height: 8)
        }
    }
    
    private func categoryColor(_ score: Double) -> Color {
        if score >= 80 { return .green }
        if score >= 60 { return .orange }
        return .red
    }
    
    // MARK: - Strengths
    private var strengthsSection: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack {
                Image(systemName: "star.fill")
                    .foregroundColor(.yellow)
                    .font(.title2)
                
                Text("Tus Fortalezas")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .foregroundColor(.primary)
            }
            
            ForEach(strengths, id: \.self) { strength in
                HStack(alignment: .top, spacing: 12) {
                    Image(systemName: "checkmark.circle.fill")
                        .foregroundColor(.green)
                    
                    Text(strength)
                        .font(.body)
                        .foregroundColor(.primary)
                }
            }
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(Color(.systemBackground))
                .shadow(color: Color.black.opacity(0.1), radius: 8, x: 0, y: 2)
        )
    }
    
    // MARK: - Areas to Improve
    private var areasToImproveSection: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack {
                Image(systemName: "target")
                    .foregroundColor(.orange)
                    .font(.title2)
                
                Text("Áreas de Mejora")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .foregroundColor(.primary)
            }
            
            ForEach(areasToImprove, id: \.self) { area in
                HStack(alignment: .top, spacing: 12) {
                    Image(systemName: "arrow.up.circle.fill")
                        .foregroundColor(.orange)
                    
                    Text(area)
                        .font(.body)
                        .foregroundColor(.primary)
                }
            }
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(Color(.systemBackground))
                .shadow(color: Color.black.opacity(0.1), radius: 8, x: 0, y: 2)
        )
    }
    
    // MARK: - Recommendations
    private var recommendationsSection: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack {
                Image(systemName: "lightbulb.fill")
                    .foregroundColor(.mint)
                    .font(.title2)
                
                Text("Recomendaciones")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .foregroundColor(.primary)
            }
            
            ForEach(Array(feedback.recommendations.enumerated()), id: \.offset) { index, recommendation in
                HStack(alignment: .top, spacing: 12) {
                    Text("\(index + 1)")
                        .font(.caption)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .frame(width: 24, height: 24)
                        .background(Circle().fill(Color.mint))
                    
                    Text(recommendation)
                        .font(.body)
                        .foregroundColor(.primary)
                        .fixedSize(horizontal: false, vertical: true)
                }
            }
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
                Text("Ver Mi Reporte Completo")
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
    
    // MARK: - Computed Properties
    private var overallScore: Double {
        guard !responses.isEmpty else { return 0 }
        let total = responses.values.reduce(0.0) { $0 + Double($1) }
        return (total / Double(responses.count)) * 20 // Convierte escala 1-5 a 0-100
    }
    
    private var categoryScores: [String: Double] {
        var scores: [String: Double] = [:]
        
        for category in Set(TV7Data.evaluationQuestions.map { $0.category }) {
            let categoryQuestions = TV7Data.evaluationQuestions.filter { $0.category == category }
            let categoryResponses = categoryQuestions.compactMap { responses[$0.id] }
            
            guard !categoryResponses.isEmpty else { continue }
            
            let avg = Double(categoryResponses.reduce(0, +)) / Double(categoryResponses.count)
            scores[category] = avg * 20
        }
        
        return scores
    }
    
    private var feedback: (message: String, recommendations: [String]) {
        TV7Data.overallFeedback(score: overallScore)
    }
    
    private var strengths: [String] {
        TV7Data.evaluationQuestions.filter { responses[$0.id] ?? 0 >= 4 }
            .map { question in
                "\(question.category): \(question.text.prefix(60))..."
            }
    }
    
    private var areasToImprove: [String] {
        TV7Data.evaluationQuestions.filter { responses[$0.id] ?? 0 <= 2 }
            .map { question in
                "\(question.text) → \(question.relatedCapa)"
            }
    }
    
    private var scoreColors: [Color] {
        if overallScore >= 80 { return [.green, .mint] }
        if overallScore >= 60 { return [.orange, .yellow] }
        return [.red, .orange]
    }
}

#Preview {
    TV7View()
}

