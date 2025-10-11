import SwiftUI

/// Vista que muestra los resultados del cuestionario
struct BM7ResultView: View {
    let result: BM7Result
    let questionnaire: BM7Questionnaire
    let onDismiss: () -> Void
    
    var body: some View {
        ScrollView {
            VStack(spacing: 24) {
                // Puntuación
                scoreSection
                
                // Nivel
                levelSection
                
                // Gráfico circular
                chartSection
                
                // Áreas de mejora
                if !result.areasOfImprovement.isEmpty {
                    improvementAreasSection
                }
                
                // Capítulos recomendados
                bookChaptersSection
                
                // Entrenamientos recomendados
                trainingsSection
                
                // Plan de acción
                actionPlanSection
                
                // Botones
                buttonsSection
            }
            .padding()
        }
        .background(Color(.systemGroupedBackground))
    }
    
    // MARK: - Score Section
    private var scoreSection: some View {
        VStack(spacing: 12) {
            Text("Tu Puntuación")
                .font(.headline)
                .foregroundColor(.secondary)
            
            HStack(alignment: .firstTextBaseline, spacing: 4) {
                Text(String(format: "%.1f", result.score))
                    .font(.system(size: 60, weight: .bold))
                    .foregroundColor(colorForResult(result.level))
                
                Text("/ \(Int(result.maxScore))")
                    .font(.title2)
                    .foregroundColor(.secondary)
            }
            
            Text("\(Int(result.percentage))%")
                .font(.title3)
                .foregroundColor(.secondary)
        }
        .padding(.vertical)
    }
    
    // MARK: - Level Section
    private var levelSection: some View {
        VStack(spacing: 16) {
            HStack(spacing: 12) {
                Image(systemName: result.level.icon)
                    .font(.system(size: 40))
                    .foregroundColor(colorForResult(result.level))
                
                VStack(alignment: .leading, spacing: 4) {
                    Text(result.level.rawValue)
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.primary)
                    
                    Text(result.level.message)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
            }
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(
                RoundedRectangle(cornerRadius: 16)
                    .fill(colorForResult(result.level).opacity(0.1))
            )
        }
    }
    
    // MARK: - Chart Section
    private var chartSection: some View {
        VStack(spacing: 12) {
            Text("Nivel de Alineación")
                .font(.headline)
                .foregroundColor(.primary)
            
            ZStack {
                Circle()
                    .stroke(Color.secondary.opacity(0.2), lineWidth: 20)
                    .frame(width: 200, height: 200)
                
                Circle()
                    .trim(from: 0, to: result.percentage / 100)
                    .stroke(
                        colorForResult(result.level),
                        style: StrokeStyle(lineWidth: 20, lineCap: .round)
                    )
                    .frame(width: 200, height: 200)
                    .rotationEffect(.degrees(-90))
                
                VStack {
                    Text("\(Int(result.percentage))%")
                        .font(.system(size: 36, weight: .bold))
                        .foregroundColor(.primary)
                    
                    Text("Alineación")
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
            }
            .padding()
        }
    }
    
    // MARK: - Improvement Areas
    private var improvementAreasSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            Label("Áreas de Mejora", systemImage: "arrow.up.circle.fill")
                .font(.headline)
                .foregroundColor(.orange)
            
            VStack(alignment: .leading, spacing: 8) {
                ForEach(Array(Set(result.areasOfImprovement)), id: \.self) { area in
                    HStack {
                        Image(systemName: "circle.fill")
                            .font(.caption2)
                            .foregroundColor(.orange)
                        Text(area)
                            .font(.body)
                            .foregroundColor(.primary)
                    }
                }
            }
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(Color.orange.opacity(0.1))
        )
    }
    
    // MARK: - Book Chapters
    private var bookChaptersSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            Label("Capítulos Recomendados", systemImage: "book.fill")
                .font(.headline)
                .foregroundColor(.blue)
            
            VStack(alignment: .leading, spacing: 8) {
                ForEach(result.bookChapters, id: \.self) { chapter in
                    HStack(alignment: .top, spacing: 8) {
                        Image(systemName: "book.closed.fill")
                            .font(.caption)
                            .foregroundColor(.blue)
                        Text(chapter)
                            .font(.body)
                            .foregroundColor(.primary)
                            .fixedSize(horizontal: false, vertical: true)
                    }
                }
            }
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(Color.blue.opacity(0.1))
        )
    }
    
    // MARK: - Trainings
    private var trainingsSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            Label("Entrenamientos Sugeridos", systemImage: "figure.run")
                .font(.headline)
                .foregroundColor(.mint)
            
            VStack(alignment: .leading, spacing: 8) {
                ForEach(result.recommendedTrainings, id: \.self) { training in
                    HStack(alignment: .top, spacing: 8) {
                        Image(systemName: "arrow.right.circle.fill")
                            .font(.caption)
                            .foregroundColor(.mint)
                        Text(training)
                            .font(.body)
                            .foregroundColor(.primary)
                            .fixedSize(horizontal: false, vertical: true)
                    }
                }
            }
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(Color.mint.opacity(0.1))
        )
    }
    
    // MARK: - Action Plan
    private var actionPlanSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            Label("Tu Plan de Acción", systemImage: "list.bullet.clipboard.fill")
                .font(.headline)
                .foregroundColor(.purple)
            
            VStack(alignment: .leading, spacing: 8) {
                ForEach(Array(result.actionPlan.enumerated()), id: \.offset) { index, action in
                    HStack(alignment: .top, spacing: 8) {
                        Text("\(index + 1)")
                            .font(.caption)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .frame(width: 24, height: 24)
                            .background(Circle().fill(Color.purple))
                        
                        Text(action)
                            .font(.body)
                            .foregroundColor(.primary)
                            .fixedSize(horizontal: false, vertical: true)
                    }
                }
            }
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(Color.purple.opacity(0.1))
        )
    }
    
    // MARK: - Buttons
    private var buttonsSection: some View {
        VStack(spacing: 12) {
            Button(action: {
                onDismiss()
            }) {
                Text("Finalizar")
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
        .padding(.top)
    }
    
    private func colorForResult(_ level: AlignmentResult) -> Color {
        switch level {
        case .mastery: return .mint
        case .goodPath: return .green
        case .inProgress: return .orange
        case .needsSupport: return .red
        }
    }
}

