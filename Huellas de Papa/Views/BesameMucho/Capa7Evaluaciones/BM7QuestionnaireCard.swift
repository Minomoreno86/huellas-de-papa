import SwiftUI

/// Tarjeta que muestra un cuestionario disponible
struct BM7QuestionnaireCard: View {
    let questionnaire: BM7Questionnaire
    @State private var showingQuestionnaire = false
    
    var body: some View {
        Button(action: {
            triggerHaptic()
            showingQuestionnaire = true
        }) {
            VStack(alignment: .leading, spacing: 12) {
                // Número y categoría
                HStack {
                    Text("\(questionnaire.number)")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(colorForCategory(questionnaire.category))
                        .frame(width: 40, height: 40)
                        .background(
                            Circle()
                                .fill(colorForCategory(questionnaire.category).opacity(0.2))
                        )
                    
                    Spacer()
                    
                    Label(questionnaire.category.rawValue, systemImage: questionnaire.category.icon)
                        .font(.caption)
                        .foregroundColor(colorForCategory(questionnaire.category))
                }
                
                Text(questionnaire.title)
                    .font(.headline)
                    .fontWeight(.semibold)
                    .foregroundColor(.primary)
                    .multilineTextAlignment(.leading)
                    .lineLimit(2)
                
                Text(questionnaire.description)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                    .lineLimit(3)
                
                Divider()
                
                HStack {
                    Label("\(questionnaire.questions.count) preguntas", systemImage: "list.bullet")
                        .font(.caption)
                        .foregroundColor(.blue)
                    
                    Spacer()
                    
                    Image(systemName: "arrow.right.circle.fill")
                        .foregroundColor(colorForCategory(questionnaire.category))
                }
            }
            .padding()
            .frame(maxWidth: .infinity)
            .background(
                RoundedRectangle(cornerRadius: 16)
                    .fill(Color(.systemBackground))
                    .shadow(color: colorForCategory(questionnaire.category).opacity(0.15), radius: 8, x: 0, y: 4)
            )
        }
        .fullScreenCover(isPresented: $showingQuestionnaire) {
            BM7QuestionnaireView(questionnaire: questionnaire)
        }
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
    
    private func triggerHaptic() {
        #if !os(macOS)
        let impactFeedback = UIImpactFeedbackGenerator(style: .light)
        impactFeedback.impactOccurred()
        #endif
    }
}

/// Vista interactiva del cuestionario
struct BM7QuestionnaireView: View {
    let questionnaire: BM7Questionnaire
    @Environment(\.dismiss) var dismiss
    @State private var currentQuestionIndex = 0
    @State private var responses: [UUID: Double] = [:]
    @State private var showingResult = false
    
    var body: some View {
        NavigationView {
            ZStack {
                if !showingResult {
                    questionView
                } else {
                    BM7ResultView(
                        result: calculateResult(),
                        questionnaire: questionnaire,
                        onDismiss: { dismiss() }
                    )
                }
            }
            .navigationTitle(questionnaire.title)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cerrar") {
                        dismiss()
                    }
                }
            }
        }
    }
    
    // MARK: - Question View
    private var questionView: some View {
        VStack(spacing: 24) {
            // Progreso
            VStack(spacing: 8) {
                HStack {
                    Text("Pregunta \(currentQuestionIndex + 1) de \(questionnaire.questions.count)")
                        .font(.caption)
                        .foregroundColor(.secondary)
                    Spacer()
                    Text("\(Int((Double(currentQuestionIndex) / Double(questionnaire.questions.count)) * 100))%")
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
                
                ProgressView(value: Double(currentQuestionIndex), total: Double(questionnaire.questions.count))
                    .tint(colorForCategory(questionnaire.category))
            }
            .padding()
            
            ScrollView {
                VStack(spacing: 24) {
                    let question = questionnaire.questions[currentQuestionIndex]
                    
                    // Pregunta
                    Text(question.text)
                        .font(.title3)
                        .fontWeight(.semibold)
                        .foregroundColor(.primary)
                        .multilineTextAlignment(.leading)
                        .padding()
                    
                    // Opciones
                    VStack(spacing: 12) {
                        ForEach(question.options) { option in
                            Button(action: {
                                triggerHaptic()
                                responses[question.id] = option.points
                                
                                // Avanzar a siguiente pregunta o mostrar resultados
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                                    if currentQuestionIndex < questionnaire.questions.count - 1 {
                                        withAnimation {
                                            currentQuestionIndex += 1
                                        }
                                    } else {
                                        withAnimation {
                                            showingResult = true
                                        }
                                    }
                                }
                            }) {
                                HStack {
                                    Text(option.text)
                                        .font(.body)
                                        .foregroundColor(.primary)
                                        .multilineTextAlignment(.leading)
                                    
                                    Spacer()
                                    
                                    if responses[question.id] == option.points {
                                        Image(systemName: "checkmark.circle.fill")
                                            .foregroundColor(colorForCategory(questionnaire.category))
                                    }
                                }
                                .padding()
                                .background(
                                    RoundedRectangle(cornerRadius: 12)
                                        .fill(Color(.systemBackground))
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 12)
                                                .stroke(
                                                    responses[question.id] == option.points ?
                                                    colorForCategory(questionnaire.category) : Color.secondary.opacity(0.3),
                                                    lineWidth: responses[question.id] == option.points ? 2 : 1
                                                )
                                        )
                                )
                            }
                        }
                    }
                    .padding()
                }
            }
            
            // Navegación
            HStack {
                if currentQuestionIndex > 0 {
                    Button(action: {
                        withAnimation {
                            currentQuestionIndex -= 1
                        }
                    }) {
                        Label("Anterior", systemImage: "chevron.left")
                            .font(.subheadline)
                            .foregroundColor(.blue)
                    }
                }
                
                Spacer()
                
                if currentQuestionIndex < questionnaire.questions.count - 1 && responses[questionnaire.questions[currentQuestionIndex].id] != nil {
                    Button(action: {
                        withAnimation {
                            currentQuestionIndex += 1
                        }
                    }) {
                        Label("Siguiente", systemImage: "chevron.right")
                            .font(.subheadline)
                            .foregroundColor(.blue)
                            .labelStyle(.trailingIcon)
                    }
                }
            }
            .padding()
        }
        .background(Color(.systemGroupedBackground))
    }
    
    private func calculateResult() -> BM7Result {
        let totalScore = responses.values.reduce(0, +)
        let maxScore = Double(questionnaire.questions.count)
        
        // Identificar áreas de mejora (preguntas con puntuación baja)
        var improvements: [String] = []
        for question in questionnaire.questions {
            if let score = responses[question.id], score < 0.5 {
                improvements.append(question.category)
            }
        }
        
        // Recomendaciones genéricas (se pueden personalizar más)
        let chapters = getRecommendedChapters(for: questionnaire.category)
        let trainings = getRecommendedTrainings(for: questionnaire.category)
        let actions = getActionPlan(score: totalScore, maxScore: maxScore)
        
        return BM7Result(
            score: totalScore,
            maxScore: maxScore,
            areasOfImprovement: improvements,
            bookChapters: chapters,
            recommendedTrainings: trainings,
            actionPlan: actions
        )
    }
    
    private func getRecommendedChapters(for category: EvaluationCategory) -> [String] {
        switch category {
        case .sleep: return ["'Por qué no quieren dormir solos'", "'El colecho en la práctica'", "'Algunos mitos en torno al sueño'"]
        case .feeding: return ["Sección sobre lactancia a demanda", "'Mamar por la noche'", "Capítulo sobre lactancia prolongada"]
        case .contact: return ["'Por qué siempre quieren brazos'", "Sección sobre porteo", "'Por qué llaman nuestra atención'"]
        case .limits: return ["'Una bofetada a tiempo' (crítica al castigo)", "'El castigo'", "'Límites respetuosos'"]
        case .emotions: return ["Secciones sobre validación emocional", "Capítulo sobre rabietas"]
        case .externalPressure: return ["'La puericultura fascista'", "Secciones sobre presión social"]
        case .general: return ["Leer/releer el libro completo"]
        }
    }
    
    private func getRecommendedTrainings(for category: EvaluationCategory) -> [String] {
        switch category {
        case .sleep: return ["Entrenamiento 1: Maestría en Colecho Seguro"]
        case .feeding: return ["Entrenamiento 2: Lactancia a Demanda", "Entrenamiento 9: Lactancia Prolongada"]
        case .contact: return ["Entrenamiento 3: Experto en Porteo", "Entrenamiento 4: Respuesta al Llanto"]
        case .limits: return ["Entrenamiento 5: Límites sin Violencia", "Entrenamiento 6: Gestión de Rabietas"]
        case .emotions: return ["Entrenamiento 11: Validación Emocional"]
        case .externalPressure: return ["Entrenamiento 7: Defensa ante Presión Social"]
        case .general: return ["Revisar todos los entrenamientos disponibles"]
        }
    }
    
    private func getActionPlan(score: Double, maxScore: Double) -> [String] {
        let percentage = (score / maxScore) * 100
        
        if percentage >= 85 {
            return [
                "Continúa haciendo lo que haces, está funcionando",
                "Comparte tu experiencia con otras familias",
                "Mantente firme ante críticas",
                "Sigue confiando en tu instinto"
            ]
        } else if percentage >= 65 {
            return [
                "Revisa las áreas de mejora identificadas",
                "Elige 1-2 entrenamientos específicos",
                "Relee capítulos recomendados",
                "Busca apoyo en grupos de apego"
            ]
        } else if percentage >= 40 {
            return [
                "Releer Bésame Mucho completo",
                "Comenzar con entrenamientos de nivel principiante",
                "Unirte a grupo de apoyo es crucial",
                "Ser paciente contigo misma, es proceso"
            ]
        } else {
            return [
                "Considera buscar apoyo profesional pro-apego",
                "Releer el libro con pareja",
                "Unirte a grupo de apoyo urgentemente",
                "Comenzar con 1 cambio pequeño a la vez",
                "Ser compasiva contigo: crianza es difícil"
            ]
        }
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
    
    private func triggerHaptic() {
        #if !os(macOS)
        let impactFeedback = UIImpactFeedbackGenerator(style: .medium)
        impactFeedback.impactOccurred()
        #endif
    }
}

// Extension para trailing icon
extension LabelStyle where Self == TrailingIconLabelStyle {
    static var trailingIcon: TrailingIconLabelStyle { TrailingIconLabelStyle() }
}

struct TrailingIconLabelStyle: LabelStyle {
    func makeBody(configuration: Configuration) -> some View {
        HStack {
            configuration.title
            configuration.icon
        }
    }
}

