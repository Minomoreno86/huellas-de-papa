import SwiftUI

/// Vista principal de la Capa 7 - Evaluaciones
struct Capa7View: View {
    @State private var questions: [YB7Question] = YB7EvaluationData.createQuestions()
    @State private var responses: [UUID: Double] = [:]
    @State private var currentPillar: String = "Balance"
    @State private var showingResults = false
    @State private var generatedReport: YB7Report?
    
    let pillars = ["Balance", "Resiliencia", "Insight", "Empatía"]
    
    var currentQuestions: [YB7Question] {
        questions.filter { $0.pillar == currentPillar }.sorted { $0.order < $1.order }
    }
    
    var currentProgress: Double {
        let answeredInPillar = currentQuestions.filter { responses[$0.id] != nil }.count
        return Double(answeredInPillar) / Double(currentQuestions.count)
    }
    
    var totalProgress: Double {
        let answered = responses.count
        return Double(answered) / Double(questions.count)
    }
    
    var body: some View {
        ScrollView {
            VStack(spacing: 24) {
                // Header
                headerSection
                
                // Overall Progress
                overallProgressSection
                
                // Pillar Selector
                pillarSelectorSection
                
                // Questions
                questionsSection
                
                // Navigation Buttons
                navigationButtons
            }
            .padding()
        }
        .background(Color(.systemGroupedBackground).ignoresSafeArea())
        #if !os(macOS)
        .navigationBarTitleDisplayMode(.inline)
        #endif
        .sheet(isPresented: $showingResults) {
            if let report = generatedReport {
                YB7ReportView(report: report, onDismiss: {
                    showingResults = false
                })
            }
        }
    }
    
    // MARK: - Header
    private var headerSection: some View {
        VStack(spacing: 16) {
            Image(systemName: "brain.head.profile")
                .font(.system(size: 50))
                .foregroundStyle(
                    LinearGradient(
                        colors: [.blue, .mint],
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                )
            
            Text("Evaluación del Yes Brain")
                .font(.largeTitle)
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
                .foregroundStyle(
                    LinearGradient(
                        gradient: Gradient(colors: [.blue, .mint]),
                        startPoint: .leading,
                        endPoint: .trailing
                    )
                )
            
            Text("Explora cómo ha evolucionado tu cerebro Sí")
                .font(.title3)
                .fontWeight(.medium)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
            
            Text("Esta no es una prueba, es un espejo emocional")
                .font(.subheadline)
                .foregroundColor(.blue)
                .italic()
                .multilineTextAlignment(.center)
        }
        .padding(.vertical)
    }
    
    // MARK: - Overall Progress
    private var overallProgressSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                Text("Progreso general")
                    .font(.headline)
                    .foregroundColor(.primary)
                
                Spacer()
                
                Text("\(Int(totalProgress * 100))%")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
            
            GeometryReader { geometry in
                ZStack(alignment: .leading) {
                    RoundedRectangle(cornerRadius: 8)
                        .fill(Color(.systemGray5))
                        .frame(height: 12)
                    
                    RoundedRectangle(cornerRadius: 8)
                        .fill(
                            LinearGradient(
                                colors: [.blue, .mint],
                                startPoint: .leading,
                                endPoint: .trailing
                            )
                        )
                        .frame(width: geometry.size.width * totalProgress, height: 12)
                        .animation(.spring(), value: totalProgress)
                }
            }
            .frame(height: 12)
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(Color(.systemBackground))
        )
    }
    
    // MARK: - Pillar Selector
    private var pillarSelectorSection: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Selecciona un pilar")
                .font(.title2)
                .fontWeight(.semibold)
                .foregroundColor(.primary)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 12) {
                    ForEach(pillars, id: \.self) { pillar in
                        pillarChip(pillar)
                    }
                }
            }
        }
    }
    
    private func pillarChip(_ pillar: String) -> some View {
        Button(action: {
            withAnimation(.spring()) {
                currentPillar = pillar
                #if !os(macOS)
                UIImpactFeedbackGenerator(style: .light).impactOccurred()
                #endif
            }
        }) {
            HStack(spacing: 8) {
                Image(systemName: pillarIcon(pillar))
                    .font(.title3)
                
                VStack(alignment: .leading, spacing: 2) {
                    Text(pillar)
                        .font(.subheadline)
                        .fontWeight(.semibold)
                    
                    let answeredCount = questions.filter { $0.pillar == pillar && responses[$0.id] != nil }.count
                    let totalCount = questions.filter { $0.pillar == pillar }.count
                    
                    Text("\(answeredCount)/\(totalCount)")
                        .font(.caption2)
                }
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 10)
            .background(
                RoundedRectangle(cornerRadius: 20)
                    .fill(currentPillar == pillar ? pillarColor(pillar) : Color(.systemGray6))
            )
            .foregroundColor(currentPillar == pillar ? .white : .primary)
            .overlay(
                RoundedRectangle(cornerRadius: 20)
                    .stroke(pillarColor(pillar).opacity(0.3), lineWidth: currentPillar == pillar ? 2 : 0)
            )
        }
    }
    
    // MARK: - Questions Section
    private var questionsSection: some View {
        VStack(spacing: 16) {
            ForEach(currentQuestions) { question in
                YB7QuestionCard(
                    question: question,
                    response: responses[question.id],
                    onResponse: { score in
                        withAnimation(.spring()) {
                            responses[question.id] = score
                            #if !os(macOS)
                            UIImpactFeedbackGenerator(style: .light).impactOccurred()
                            #endif
                        }
                    }
                )
            }
        }
    }
    
    // MARK: - Navigation Buttons
    private var navigationButtons: some View {
        VStack(spacing: 12) {
            if let nextPillarIndex = pillars.firstIndex(of: currentPillar),
               nextPillarIndex < pillars.count - 1 {
                Button(action: {
                    withAnimation(.spring()) {
                        currentPillar = pillars[nextPillarIndex + 1]
                    }
                }) {
                    HStack {
                        Text("Siguiente pilar")
                            .font(.headline)
                        
                        Image(systemName: "arrow.right.circle.fill")
                            .font(.title3)
                    }
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 16)
                            .fill(
                                LinearGradient(
                                    colors: [.blue, .mint],
                                    startPoint: .leading,
                                    endPoint: .trailing
                                )
                            )
                    )
                }
                .disabled(currentProgress < 1.0)
                .opacity(currentProgress < 1.0 ? 0.5 : 1.0)
            }
            
            if currentPillar == pillars.last && responses.count == questions.count {
                Button(action: {
                    generateReport()
                    showingResults = true
                }) {
                    HStack {
                        Text("Ver resultados")
                            .font(.headline)
                        
                        Image(systemName: "chart.bar.doc.horizontal.fill")
                            .font(.title3)
                    }
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 16)
                            .fill(
                                LinearGradient(
                                    colors: [.green, .mint],
                                    startPoint: .leading,
                                    endPoint: .trailing
                                )
                            )
                    )
                }
            }
        }
    }
    
    // MARK: - Helpers
    private func pillarIcon(_ pillar: String) -> String {
        switch pillar {
        case "Balance": return "scale.3d"
        case "Resiliencia": return "arrow.triangle.2.circlepath"
        case "Insight": return "eye.circle.fill"
        case "Empatía": return "heart.circle.fill"
        default: return "circle"
        }
    }
    
    private func pillarColor(_ pillar: String) -> Color {
        switch pillar {
        case "Balance": return .blue
        case "Resiliencia": return .green
        case "Insight": return .orange
        case "Empatía": return .pink
        default: return .blue
        }
    }
    
    private func generateReport() {
        // Calculate scores by pillar
        var results: [YB7Result] = []
        
        for pillar in pillars {
            let pillarQuestions = questions.filter { $0.pillar == pillar }
            let pillarResponses = responses.filter { key, _ in
                pillarQuestions.contains(where: { $0.id == key })
            }
            
            let averageScore = pillarResponses.values.reduce(0.0, +) / Double(pillarResponses.count)
            let level = YB7EvaluationData.determineLevel(score: averageScore)
            let feedback = YB7EvaluationData.generateFeedback(for: pillar, score: averageScore)
            
            let result = YB7Result(
                pillar: pillar,
                score: averageScore,
                level: level,
                feedback: feedback,
                icon: pillarIcon(pillar),
                color: pillar.lowercased()
            )
            results.append(result)
        }
        
        // Calculate overall score
        let overallScore = results.reduce(0.0) { $0 + $1.score } / Double(results.count)
        
        // Find dominant pillar
        let dominantPillar = results.max(by: { $0.score < $1.score })?.pillar ?? "Balance"
        
        // Generate recommendations
        let recommendations = YB7EvaluationData.generateRecommendations(results: results)
        
        // Create report
        generatedReport = YB7Report(
            overallScore: overallScore,
            dominantPillar: dominantPillar,
            recommendations: recommendations,
            results: results
        )
    }
}

// MARK: - Preview
struct Capa7View_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            Capa7View()
        }
    }
}

