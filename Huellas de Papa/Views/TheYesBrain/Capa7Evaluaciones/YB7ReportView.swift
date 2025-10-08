import SwiftUI

/// Vista del informe integrador con círculo de crecimiento
struct YB7ReportView: View {
    let report: YB7Report
    let onDismiss: () -> Void
    
    @State private var showContent = false
    @State private var animateCircle = false
    
    var body: some View {
        ScrollView {
            VStack(spacing: 32) {
                // Header
                headerSection
                
                // Overall Score Circle
                scoreCircleSection
                
                // Pillars Results
                pillarsResultsSection
                
                // Recommendations
                recommendationsSection
                
                // Close Button
                closeButton
            }
            .padding()
        }
        .background(Color(.systemGroupedBackground).ignoresSafeArea())
        .onAppear {
            withAnimation(.easeOut(duration: 0.6)) {
                showContent = true
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                withAnimation(.spring(response: 0.8, dampingFraction: 0.6)) {
                    animateCircle = true
                }
            }
        }
    }
    
    // MARK: - Header
    private var headerSection: some View {
        VStack(spacing: 16) {
            Image(systemName: "checkmark.seal.fill")
                .font(.system(size: 60))
                .foregroundStyle(
                    LinearGradient(
                        colors: [.green, .mint],
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                )
                .scaleEffect(showContent ? 1.0 : 0.0)
            
            Text("Tu Evaluación del Yes Brain")
                .font(.title)
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
            
            Text(levelDescription)
                .font(.title3)
                .fontWeight(.medium)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
        }
        .opacity(showContent ? 1 : 0)
    }
    
    // MARK: - Score Circle
    private var scoreCircleSection: some View {
        VStack(spacing: 16) {
            ZStack {
                // Background Circle
                Circle()
                    .stroke(Color(.systemGray5), lineWidth: 20)
                    .frame(width: 200, height: 200)
                
                // Progress Circle
                Circle()
                    .trim(from: 0, to: animateCircle ? report.overallScore / 100 : 0)
                    .stroke(
                        LinearGradient(
                            colors: [.blue, .mint, .green],
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        ),
                        style: StrokeStyle(lineWidth: 20, lineCap: .round)
                    )
                    .frame(width: 200, height: 200)
                    .rotationEffect(.degrees(-90))
                
                // Score Text
                VStack(spacing: 4) {
                    Text("\(Int(report.overallScore))")
                        .font(.system(size: 60, weight: .bold))
                        .foregroundColor(.primary)
                    
                    Text("Puntuación")
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
            }
            
            Text("Pilar dominante: \(report.dominantPillar)")
                .font(.headline)
                .foregroundColor(pillarColor(report.dominantPillar))
                .padding(.horizontal, 16)
                .padding(.vertical, 8)
                .background(
                    RoundedRectangle(cornerRadius: 20)
                        .fill(pillarColor(report.dominantPillar).opacity(0.2))
                )
        }
        .opacity(showContent ? 1 : 0)
    }
    
    // MARK: - Pillars Results
    private var pillarsResultsSection: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Resultados por pilar")
                .font(.title2)
                .fontWeight(.semibold)
                .foregroundColor(.primary)
            
            ForEach(report.results, id: \.id) { result in
                YB7ResultCard(result: result)
            }
        }
        .opacity(showContent ? 1 : 0)
    }
    
    // MARK: - Recommendations
    private var recommendationsSection: some View {
        VStack(alignment: .leading, spacing: 16) {
            Label("Recomendaciones", systemImage: "lightbulb.fill")
                .font(.title2)
                .fontWeight(.semibold)
                .foregroundColor(.orange)
            
            ForEach(report.recommendations.indices, id: \.self) { index in
                HStack(alignment: .top, spacing: 12) {
                    Image(systemName: "\(index + 1).circle.fill")
                        .foregroundColor(.blue)
                    
                    Text(report.recommendations[index])
                        .font(.body)
                        .foregroundColor(.primary)
                        .multilineTextAlignment(.leading)
                }
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 12)
                        .fill(Color(.systemBackground))
                )
            }
        }
        .opacity(showContent ? 1 : 0)
    }
    
    // MARK: - Close Button
    private var closeButton: some View {
        Button(action: {
            #if !os(macOS)
            UIImpactFeedbackGenerator(style: .medium).impactOccurred()
            #endif
            onDismiss()
        }) {
            HStack {
                Text("Continuar mi crecimiento")
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
        .opacity(showContent ? 1 : 0)
    }
    
    // MARK: - Helpers
    private var levelDescription: String {
        switch report.overallScore {
        case 0..<40:
            return "Estás en el inicio de tu viaje del Yes Brain"
        case 40..<70:
            return "Tu cerebro Sí está evolucionando constantemente"
        case 70...100:
            return "Has integrado profundamente el cerebro Sí"
        default:
            return "Continúa tu camino de crecimiento"
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
}

// MARK: - Result Card
struct YB7ResultCard: View {
    let result: YB7Result
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                Image(systemName: result.icon)
                    .font(.title2)
                    .foregroundColor(pillarColor)
                
                VStack(alignment: .leading, spacing: 4) {
                    Text(result.pillar)
                        .font(.headline)
                        .foregroundColor(.primary)
                    
                    Text(result.level)
                        .font(.subheadline)
                        .foregroundColor(pillarColor)
                }
                
                Spacer()
                
                Text("\(Int(result.score))")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(pillarColor)
            }
            
            // Progress Bar
            GeometryReader { geometry in
                ZStack(alignment: .leading) {
                    RoundedRectangle(cornerRadius: 6)
                        .fill(Color(.systemGray5))
                        .frame(height: 8)
                    
                    RoundedRectangle(cornerRadius: 6)
                        .fill(pillarColor)
                        .frame(width: geometry.size.width * (result.score / 100), height: 8)
                }
            }
            .frame(height: 8)
            
            Text(result.feedback)
                .font(.body)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.leading)
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(Color(.systemBackground))
                .overlay(
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(pillarColor.opacity(0.3), lineWidth: 2)
                )
        )
    }
    
    private var pillarColor: Color {
        switch result.color {
        case "balance", "blue": return .blue
        case "resiliencia", "green": return .green
        case "insight", "orange": return .orange
        case "empatía", "pink": return .pink
        default: return .blue
        }
    }
}

// MARK: - Preview
struct YB7ReportView_Previews: PreviewProvider {
    static var previews: some View {
        YB7ReportView(
            report: YB7Report(
                overallScore: 75.0,
                dominantPillar: "Empatía",
                recommendations: [
                    "Continúa practicando respiración consciente",
                    "Revisa las simulaciones de manejo de errores"
                ],
                results: [
                    YB7Result(pillar: "Balance", score: 70, level: "Progresando", feedback: "Tu capacidad de mantener la calma está creciendo", icon: "scale.3d", color: "blue"),
                    YB7Result(pillar: "Resiliencia", score: 65, level: "Progresando", feedback: "Tu enfoque hacia el error está evolucionando", icon: "arrow.triangle.2.circlepath", color: "green"),
                    YB7Result(pillar: "Insight", score: 80, level: "Integrado", feedback: "Tienes una profunda comprensión", icon: "eye.circle.fill", color: "orange"),
                    YB7Result(pillar: "Empatía", score: 85, level: "Integrado", feedback: "Has desarrollado empatía profunda", icon: "heart.circle.fill", color: "pink")
                ]
            ),
            onDismiss: {}
        )
    }
}

