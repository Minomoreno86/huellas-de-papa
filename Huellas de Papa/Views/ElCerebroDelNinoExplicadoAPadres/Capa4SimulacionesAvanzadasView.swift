import SwiftUI

// MARK: - Capa 4 View (UI base con placeholders)

struct Capa4SimulacionesAvanzadasView: View {
    // Estado de sesión
    @State private var metrics = Capa4ProgressMetrics(
        connectionScore: 0,
        regulationScore: 0,
        limitScore: 0,
        currentSceneId: "",
        decisions: []
    )
    @State private var isShowingOutcome = false
    @State private var isLoading = false
    @State private var currentScene: Capa4Scene? = nil
    @State private var options: [Capa4Option] = []
    @State private var microFeedbackText: String = ""
    @State private var microFeedbackStyle: OptionButton.Style = .neutral
    
    // Estado de simulación actual
    @State private var currentSimulation: Capa4Simulation? = nil
    @State private var availableSimulations: [Capa4Simulation] = []
    @State private var scenesById: [String: Capa4Scene] = [:]
    @State private var outcomesById: [String: Capa4Outcome] = [:]
    @State private var selectedOutcome: Capa4Outcome? = nil
    
    // Estado de selección de simulación
    @State private var isShowingSimulationPicker = false
    
    // Estado de visualización de detalles
    @State private var isShowingDecisionHistory = false
    
    var body: some View {
        NavigationView {
            ZStack {
                BackgroundGradient()
                    .ignoresSafeArea()
                
                if currentSimulation == nil {
                    // Pantalla de selección de simulación
                    SimulationPickerView(
                        simulations: availableSimulations,
                        onSimulationSelected: { simulation in
                            startSimulation(simulation)
                        }
                    )
                } else {
                    // Pantalla de simulación activa
                    ScrollView {
                        VStack(spacing: 20) {
                            // Header con información de la simulación
                            SimulationHeaderView(
                                simulation: currentSimulation!,
                                onShowHistory: { isShowingDecisionHistory = true }
                            )
                                .padding(.top, 8)
                            
                            ProgressHUD(metrics: metrics)
                            
                            SceneCard(prompt: currentScene?.prompt ?? "Cargando escena...")
                                .transition(.asymmetric(insertion: .move(edge: .bottom),
                                                        removal: .opacity))
                            
                            VStack(spacing: 12) {
                                if options.isEmpty {
                                    Text("Sin opciones disponibles")
                                        .font(.footnote)
                                        .foregroundColor(.secondary)
                                } else {
                                    ForEach(options, id: \.id) { option in
                                        OptionButton(title: option.text, style: style(for: option)) {
                                            handleSelection(option)
                                        }
                                    }
                                }
                            }
                            .padding(.horizontal)

                            if !microFeedbackText.isEmpty {
                                MicroFeedbackBanner(text: microFeedbackText, style: microFeedbackStyle)
                                    .transition(.move(edge: .top).combined(with: .opacity))
                            }
                            
                            if isShowingOutcome {
                                OutcomeSummary(
                                    title: selectedOutcomeTitle,
                                    subtitle: selectedOutcomeSubtitle,
                                    outcome: selectedOutcome,
                                    metrics: metrics
                                )
                                    .transition(.opacity.combined(with: .move(edge: .bottom)))
                                    .padding(.top, 12)
                                
                                HStack(spacing: 16) {
                                    Button(action: { resetSession() }) {
                                        Text("Volver a intentar")
                                            .fontWeight(.semibold)
                                            .padding(.horizontal, 16)
                                            .padding(.vertical, 12)
                                            .background(Capsule().fill(Color.blue.opacity(0.15)))
                                    }
                                    .buttonStyle(.plain)
                                    
                                    Button(action: { selectNewSimulation() }) {
                                        Text("Nueva simulación")
                                            .fontWeight(.semibold)
                                            .padding(.horizontal, 16)
                                            .padding(.vertical, 12)
                                            .background(Capsule().fill(Color.green.opacity(0.15)))
                                    }
                                    .buttonStyle(.plain)
                                }
                                .padding(.bottom, 16)
                            }
                        }
                        .padding(.horizontal)
                    }
                }
                
                if isLoading {
                    ProgressView()
                        .scaleEffect(1.3)
                        .progressViewStyle(CircularProgressViewStyle())
                }
            }
            .navigationTitle("Simulaciones Avanzadas")
            .navigationBarTitleDisplayMode(.large)
            .onAppear {
                loadSimulationsData()
            }
            .sheet(isPresented: $isShowingDecisionHistory) {
                DecisionHistoryView(metrics: metrics, scenesById: scenesById)
            }
        }
    }
}

// MARK: - Subviews

private struct SimulationPickerView: View {
    let simulations: [Capa4Simulation]
    let onSimulationSelected: (Capa4Simulation) -> Void
    
    var body: some View {
        ScrollView {
        VStack(spacing: 16) {
                Text("Selecciona una simulación")
                    .font(.title2)
                    .fontWeight(.bold)
                    .padding(.top, 20)
                
                Text("Practica herramientas parentales en escenarios realistas")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
                
                LazyVStack(spacing: 12) {
                    ForEach(simulations, id: \.id) { simulation in
                        SimulationCard(simulation: simulation) {
                            onSimulationSelected(simulation)
                        }
                    }
                }
                .padding(.horizontal)
                .padding(.top, 20)
            }
        }
    }
}

private struct SimulationCard: View {
    let simulation: Capa4Simulation
    let onTap: () -> Void
    
    var body: some View {
        Button(action: onTap) {
            VStack(alignment: .leading, spacing: 12) {
                HStack {
                    Text(simulation.title)
                        .font(.headline)
                        .foregroundColor(.primary)
                    Spacer()
                    Text("\(simulation.difficulty)/5")
                        .font(.caption)
                        .padding(.horizontal, 8)
                        .padding(.vertical, 4)
                        .background(Capsule().fill(difficultyColor.opacity(0.2)))
                        .foregroundColor(difficultyColor)
                }
                
                Text(simulation.summary)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                    .multilineTextAlignment(.leading)
                
                HStack {
                    Text("\(simulation.ageRangeLower)-\(simulation.ageRangeUpper) años")
                        .font(.caption)
                        .padding(.horizontal, 8)
                        .padding(.vertical, 4)
                        .background(Capsule().fill(Color.blue.opacity(0.15)))
                    
                    Text("\(simulation.estimatedDurationMinutes) min")
                        .font(.caption)
                        .padding(.horizontal, 8)
                        .padding(.vertical, 4)
                        .background(Capsule().fill(Color.green.opacity(0.15)))
                    
                    Spacer()
                }
            }
            .padding(16)
            .background(
                RoundedRectangle(cornerRadius: 16, style: .continuous)
                    .fill(Color(.systemBackground).opacity(0.9))
                    .shadow(color: Color.black.opacity(0.08), radius: 8, x: 0, y: 4)
            )
        }
        .buttonStyle(.plain)
    }
    
    private var difficultyColor: Color {
        switch simulation.difficulty {
        case 1...2: return .green
        case 3: return .orange
        case 4...5: return .red
        default: return .gray
        }
    }
}

private struct SimulationHeaderView: View {
    let simulation: Capa4Simulation
    let onShowHistory: () -> Void
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                Text(simulation.title)
                    .font(.headline)
                    .foregroundColor(.primary)
                Spacer()
                
                HStack(spacing: 12) {
                    Button(action: onShowHistory) {
                        HStack(spacing: 4) {
                            Image(systemName: "clock.arrow.circlepath")
                            Text("Historial")
                        }
                        .font(.caption)
                        .foregroundColor(.blue)
                    }
                    
                    Button("Cambiar") {
                        // Volver a la selección
                    }
                    .font(.caption)
                .foregroundColor(.blue)
                }
            }
            
            Text(simulation.summary)
                .font(.subheadline)
                .foregroundColor(.secondary)
        }
        .padding(12)
        .background(
            RoundedRectangle(cornerRadius: 12, style: .continuous)
                .fill(Color(.secondarySystemBackground).opacity(0.8))
        )
    }
}

private struct SceneCard: View {
    let prompt: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Escena")
                .font(.headline)
                .foregroundColor(.primary)
            
            Text(prompt)
                .font(.body)
                .foregroundColor(.primary)
                .multilineTextAlignment(.leading)
        }
        .padding(20)
        .background(
            RoundedRectangle(cornerRadius: 20, style: .continuous)
                .fill(Color(.systemBackground).opacity(0.9))
                .shadow(color: Color.black.opacity(0.08), radius: 10, x: 0, y: 6)
        )
    }
}

private struct OptionButton: View {
    enum Style { case positive, neutral, caution }
    
    let title: String
    var style: Style = .neutral
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            HStack {
                Text(title)
                    .font(.subheadline)
                    .foregroundColor(.primary)
                    .multilineTextAlignment(.leading)
                Spacer()
            }
            .padding(16)
            .background(
                RoundedRectangle(cornerRadius: 14, style: .continuous)
                    .fill(backgroundColor)
            )
        }
        .buttonStyle(.plain)
        .contentShape(Rectangle())
    }
    
    private var backgroundColor: Color {
        switch style {
        case .positive: return Color.green.opacity(0.15)
        case .neutral: return Color.blue.opacity(0.12)
        case .caution: return Color.orange.opacity(0.15)
        }
    }
}

private struct OutcomeSummary: View {
    let title: String
    let subtitle: String
    let outcome: Capa4Outcome?
    let metrics: Capa4ProgressMetrics
    
    var body: some View {
        VStack(spacing: 16) {
            // Header del resultado
            VStack(spacing: 8) {
                Text(title)
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(.primary)
                
                Text(subtitle)
                    .font(.callout)
                    .foregroundColor(.secondary)
                    .multilineTextAlignment(.center)
            }
            
            // Métricas finales
            if let outcome = outcome {
                FinalMetricsView(outcome: outcome, metrics: metrics)
            }
            
            // Recomendación de transferencia
            if let outcome = outcome, !outcome.transferTip.isEmpty {
                TransferTipView(tip: outcome.transferTip)
            }
            
            // Herramientas recomendadas de Capa 3
            if let outcome = outcome, !outcome.recommendedTools.isEmpty {
                RecommendedToolsView(
                    tools: outcome.recommendedTools,
                    specificGuidance: outcome.specificGuidance
                )
            }
        }
        .padding(20)
        .background(
            RoundedRectangle(cornerRadius: 18, style: .continuous)
                .fill(Color(.secondarySystemBackground).opacity(0.9))
                .shadow(color: Color.black.opacity(0.08), radius: 10, x: 0, y: 6)
        )
    }
    
    private struct FinalMetricsView: View {
        let outcome: Capa4Outcome
        let metrics: Capa4ProgressMetrics
        
        var body: some View {
            VStack(spacing: 12) {
                Text("Métricas Finales")
                    .font(.headline)
                    .foregroundColor(.primary)
                
                HStack(spacing: 16) {
                    MetricBadge(
                        color: .blue,
                        title: "CONEXIÓN",
                        value: metrics.connectionScore,
                        threshold: outcome.threshold.connection,
                        achieved: metrics.connectionScore >= outcome.threshold.connection
                    )
                    
                    MetricBadge(
                        color: .teal,
                        title: "REGULACIÓN",
                        value: metrics.regulationScore,
                        threshold: outcome.threshold.regulation,
                        achieved: metrics.regulationScore >= outcome.threshold.regulation
                    )
                    
                    MetricBadge(
                        color: .orange,
                        title: "LÍMITES",
                        value: metrics.limitScore,
                        threshold: outcome.threshold.limit,
                        achieved: metrics.limitScore >= outcome.threshold.limit
                    )
                }
                
                // Descripción del estado cerebral
                if !outcome.brainStateDescription.isEmpty {
                    VStack(alignment: .leading, spacing: 6) {
                        Text("Estado Cerebral Alcanzado")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .foregroundColor(.primary)
                        
                        Text(outcome.brainStateDescription)
                            .font(.caption)
                            .foregroundColor(.secondary)
                            .multilineTextAlignment(.leading)
                    }
                    .padding(12)
                    .background(
                        RoundedRectangle(cornerRadius: 12, style: .continuous)
                            .fill(Color(.tertiarySystemBackground).opacity(0.8))
                    )
                }
            }
        }
        
        private struct MetricBadge: View {
            let color: Color
            let title: String
            let value: Int
            let threshold: Int
            let achieved: Bool
            
            var body: some View {
                VStack(spacing: 6) {
                    Text(title)
                        .font(.caption2)
                        .fontWeight(.semibold)
                        .foregroundColor(.secondary)
                    
                    Text("\(value)")
                        .font(.title3)
                        .fontWeight(.bold)
                        .foregroundColor(achieved ? color : .secondary)
                    
                    Text("≥ \(threshold)")
                        .font(.caption2)
                        .foregroundColor(.secondary)
                    
                    // Indicador de logro
                    Circle()
                        .fill(achieved ? color : Color(.systemGray4))
                        .frame(width: 12, height: 12)
                        .overlay(
                            Image(systemName: "checkmark")
                                .font(.caption2)
                                .foregroundColor(achieved ? .white : .clear)
                        )
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 8)
                .padding(.horizontal, 4)
                .background(
                    RoundedRectangle(cornerRadius: 10, style: .continuous)
                        .fill(achieved ? color.opacity(0.1) : Color(.systemGray6).opacity(0.5))
                        .overlay(
                            RoundedRectangle(cornerRadius: 10, style: .continuous)
                                .stroke(achieved ? color.opacity(0.3) : Color(.systemGray4), lineWidth: 1)
                        )
                )
            }
        }
    }
    
    private struct TransferTipView: View {
        let tip: String
        
        var body: some View {
            VStack(alignment: .leading, spacing: 8) {
                HStack {
                    Image(systemName: "lightbulb.fill")
                        .foregroundColor(.yellow)
                    Text("Consejo para Casa")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundColor(.primary)
                }
                
                Text(tip)
                    .font(.caption)
                    .foregroundColor(.secondary)
                    .multilineTextAlignment(.leading)
            }
            .padding(12)
            .background(
                RoundedRectangle(cornerRadius: 12, style: .continuous)
                    .fill(Color.yellow.opacity(0.1))
                    .overlay(
                        RoundedRectangle(cornerRadius: 12, style: .continuous)
                            .stroke(Color.yellow.opacity(0.3), lineWidth: 1)
                    )
            )
        }
    }
}

private struct ProgressHUD: View {
    let metrics: Capa4ProgressMetrics
    
    var body: some View {
        VStack(spacing: 12) {
            // Barra de progreso general
            OverallProgressBar(metrics: metrics)
            
            // Métricas individuales
            HStack(spacing: 12) {
                MetricPill(
                    color: .blue,
                    title: "CONEXIÓN",
                    value: metrics.connectionScore,
                    description: "Conexión emocional"
                )
                MetricPill(
                    color: .teal,
                    title: "REGULACIÓN",
                    value: metrics.regulationScore,
                    description: "Regulación emocional"
                )
                MetricPill(
                    color: .orange,
                    title: "LÍMITES",
                    value: metrics.limitScore,
                    description: "Límites claros"
                )
            }
        }
        .padding(16)
        .background(
            RoundedRectangle(cornerRadius: 18, style: .continuous)
                .fill(Color(.secondarySystemBackground).opacity(0.9))
                .shadow(color: Color.black.opacity(0.05), radius: 8, x: 0, y: 4)
        )
    }
    
    private struct OverallProgressBar: View {
        let metrics: Capa4ProgressMetrics
        
        var overallScore: Int {
            max(0, metrics.connectionScore + metrics.regulationScore + metrics.limitScore)
        }
        
        var maxPossibleScore: Int {
            // Asumiendo que cada simulación puede tener hasta 20 puntos por métrica
            60
        }
        
        var progressPercentage: Double {
            min(1.0, Double(overallScore) / Double(maxPossibleScore))
        }
        
        var body: some View {
            VStack(alignment: .leading, spacing: 6) {
                HStack {
                    Text("Progreso General")
                        .font(.caption)
                        .fontWeight(.semibold)
                        .foregroundColor(.primary)
                    Spacer()
                    Text("\(overallScore)/\(maxPossibleScore)")
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
                
                GeometryReader { geometry in
                    ZStack(alignment: .leading) {
                        // Fondo de la barra
                        RoundedRectangle(cornerRadius: 4)
                            .fill(Color(.systemGray5))
                            .frame(height: 8)
                        
                        // Barra de progreso
                        RoundedRectangle(cornerRadius: 4)
                            .fill(progressGradient)
                            .frame(width: geometry.size.width * progressPercentage, height: 8)
                            .animation(.easeInOut(duration: 0.6), value: progressPercentage)
                    }
                }
                .frame(height: 8)
            }
        }
        
        private var progressGradient: LinearGradient {
            LinearGradient(
                colors: [
                    Color.red.opacity(0.7),
                    Color.orange.opacity(0.8),
                    Color.yellow.opacity(0.9),
                    Color.green.opacity(0.8),
                    Color.blue.opacity(0.9)
                ],
                startPoint: .leading,
                endPoint: .trailing
            )
        }
    }
    
    private struct MetricPill: View {
        let color: Color
        let title: String
        let value: Int
        let description: String
        
        var body: some View {
            VStack(spacing: 6) {
                HStack(spacing: 6) {
                    Circle().fill(color.opacity(0.9)).frame(width: 8, height: 8)
                    Text(title)
                        .font(.caption2).bold()
                        .foregroundColor(.primary)
                }
                
                Text("\(value)")
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundColor(color)
                
                Text(description)
                    .font(.caption2)
                    .foregroundColor(.secondary)
                    .multilineTextAlignment(.center)
            }
            .frame(maxWidth: .infinity)
            .padding(.vertical, 8)
            .padding(.horizontal, 6)
            .background(
                RoundedRectangle(cornerRadius: 12, style: .continuous)
                    .fill(color.opacity(0.08))
                    .overlay(
                        RoundedRectangle(cornerRadius: 12, style: .continuous)
                            .stroke(color.opacity(0.2), lineWidth: 1)
                    )
            )
        }
    }
}

private struct BackgroundGradient: View {
    var body: some View {
        LinearGradient(
            colors: [Color.blue.opacity(0.15), Color.teal.opacity(0.12), Color.green.opacity(0.10)],
            startPoint: .topLeading,
            endPoint: .bottomTrailing
        )
    }
}

private struct MicroFeedbackBanner: View {
    let text: String
    let style: OptionButton.Style
    
    var body: some View {
        HStack(spacing: 10) {
            Circle()
                .fill(indicatorColor)
                .frame(width: 8, height: 8)
            Text(text)
                .font(.footnote)
                .foregroundColor(.primary)
                .multilineTextAlignment(.leading)
            Spacer()
        }
        .padding(12)
        .background(
            RoundedRectangle(cornerRadius: 12, style: .continuous)
                .fill(indicatorColor.opacity(0.12))
        )
    }
    
    private var indicatorColor: Color {
        switch style {
        case .positive: return .green
        case .neutral: return .blue
        case .caution: return .orange
        }
    }
}

// MARK: - Lógica de navegación y simulación
private extension Capa4SimulacionesAvanzadasView {
    
    // MARK: - Carga de datos
    
    func loadSimulationsData() {
        isLoading = true
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            // Cargar datos reales desde Capa4SimulationData
            availableSimulations = Capa4SimulationData.todasLasSimulaciones
            
            // Crear diccionarios para acceso rápido
            scenesById = Dictionary(uniqueKeysWithValues: Capa4SimulationData.todasLasEscenas.map { ($0.id, $0) })
            outcomesById = Dictionary(uniqueKeysWithValues: Capa4SimulationData.todosLosOutcomes.map { ($0.id, $0) })
            
            isLoading = false
        }
    }
    
    // MARK: - Gestión de simulaciones
    
    func startSimulation(_ simulation: Capa4Simulation) {
        withAnimation(.easeInOut(duration: 0.3)) {
            currentSimulation = simulation
            resetMetrics()
            
            // Cargar la escena inicial
            if let initialScene = scenesById[simulation.startSceneId] {
                loadScene(initialScene)
            }
        }
    }
    
    func selectNewSimulation() {
        withAnimation(.easeInOut(duration: 0.3)) {
            currentSimulation = nil
            resetMetrics()
            currentScene = nil
            options = []
            microFeedbackText = ""
            isShowingOutcome = false
            selectedOutcome = nil
        }
    }
    
    func resetMetrics() {
        metrics = Capa4ProgressMetrics(
            connectionScore: 0,
            regulationScore: 0,
            limitScore: 0,
            currentSceneId: "",
            decisions: []
        )
    }
    
    // MARK: - Navegación entre escenas
    
    func loadScene(_ scene: Capa4Scene?) {
        withAnimation(.easeInOut(duration: 0.25)) {
            currentScene = scene
            options = scene?.options ?? []
            metrics.currentSceneId = scene?.id ?? ""
            microFeedbackText = ""
            isShowingOutcome = false
            selectedOutcome = nil
        }
    }
    
    func handleSelection(_ option: Capa4Option) {
        // Actualizar métricas
        metrics.connectionScore += option.deltaConnection
        metrics.regulationScore += option.deltaRegulation
        metrics.limitScore += option.deltaLimit
        metrics.decisions.append(
            Capa4Decision(
                sceneId: currentScene?.id ?? "",
                optionId: option.id,
                deltaConnection: option.deltaConnection,
                deltaRegulation: option.deltaRegulation,
                deltaLimit: option.deltaLimit,
                timestamp: Date()
            )
        )
        
        // Micro feedback inmediato
        microFeedbackStyle = style(for: option)
        withAnimation(.spring(response: 0.5, dampingFraction: 0.85)) {
            microFeedbackText = option.quickFeedback
        }
        
        // Háptico sutil según el estilo de feedback
        #if os(iOS)
        let generator = UINotificationFeedbackGenerator()
        switch microFeedbackStyle {
        case .positive: generator.notificationOccurred(.success)
        case .neutral: generator.notificationOccurred(.warning)
        case .caution: generator.notificationOccurred(.error)
        }
        #endif
        
        // Auto-ocultar micro feedback después de un tiempo
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            withAnimation(.easeInOut(duration: 0.25)) {
                microFeedbackText = ""
            }
        }
        
        // Navegación: ramificación o cierre por outcome
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            if let nextSceneId = option.nextSceneId, !nextSceneId.isEmpty {
                // Hay una siguiente escena - navegar a ella
                if let nextScene = scenesById[nextSceneId] {
                    loadScene(nextScene)
                }
            } else if let outcomeId = option.outcomeId, !outcomeId.isEmpty {
                // La opción tiene un outcome específico
                if let outcome = outcomesById[outcomeId] {
                    selectedOutcome = outcome
                    withAnimation(.spring(response: 0.6, dampingFraction: 0.8)) {
                        isShowingOutcome = true
                    }
                }
            } else {
                // Buscar outcome que coincida con las métricas actuales
                if let outcome = findBestMatchingOutcome() {
                    selectedOutcome = outcome
                    withAnimation(.spring(response: 0.6, dampingFraction: 0.8)) {
                        isShowingOutcome = true
                    }
                }
            }
        }
    }
    
    func style(for option: Capa4Option) -> OptionButton.Style {
        let total = option.deltaConnection + option.deltaRegulation + option.deltaLimit
        if total >= 3 { return .positive }
        if total <= -2 { return .caution }
        return .neutral
    }
    
    // MARK: - Evaluación de outcomes
    
    func findBestMatchingOutcome() -> Capa4Outcome? {
        guard currentSimulation != nil else { return nil }
        
        // Filtrar outcomes relevantes para esta simulación
        let relevantOutcomes = Capa4SimulationData.todosLosOutcomes.filter { outcome in
            // Aquí podrías filtrar por simulación si tienes esa relación en los datos
            return true
        }
        
        // Buscar el outcome que mejor coincida con las métricas actuales
        // Priorizar outcomes con umbrales más altos (mejores resultados)
        let sortedOutcomes = relevantOutcomes.sorted { outcome1, outcome2 in
            let score1 = outcome1.threshold.connection + outcome1.threshold.regulation + outcome1.threshold.limit
            let score2 = outcome2.threshold.connection + outcome2.threshold.regulation + outcome2.threshold.limit
            return score1 > score2
        }
        
        // Encontrar el primer outcome cuyos umbrales se cumplan
        return sortedOutcomes.first { outcome in
            let t = outcome.threshold
            return metrics.connectionScore >= t.connection &&
                   metrics.regulationScore >= t.regulation &&
                   metrics.limitScore >= t.limit
        }
    }
    
    // MARK: - UI Helpers
    
    var selectedOutcomeTitle: String {
        guard let outcome = selectedOutcome else { return "Resultado" }
        switch outcome.successLevel {
        case .excellent: return "¡Excelente!"
        case .good: return "Muy bien"
        case .acceptable: return "Bien"
        case .needsImprovement: return "Puedes mejorar"
        }
    }
    
    var selectedOutcomeSubtitle: String {
        if let outcome = selectedOutcome {
            return outcome.summary
        }
        return "Resumen del desenlace"
    }
    
    // MARK: - Reset y reinicio
    
    func resetSession() {
        guard let simulation = currentSimulation else { return }
        
        withAnimation(.spring(response: 0.5, dampingFraction: 0.9)) {
            resetMetrics()
            microFeedbackText = ""
            isShowingOutcome = false
            selectedOutcome = nil
        }
        
        // Cargar la escena inicial de la simulación actual
        if let initialScene = scenesById[simulation.startSceneId] {
            loadScene(initialScene)
        }
    }
}

// MARK: - Decision History View

private struct DecisionHistoryView: View {
    let metrics: Capa4ProgressMetrics
    let scenesById: [String: Capa4Scene]
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 16) {
                    // Resumen de métricas
                    MetricsSummaryView(metrics: metrics)
                    
                    // Historial de decisiones
                    if metrics.decisions.isEmpty {
                        Text("Aún no has tomado decisiones")
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                            .padding(.top, 40)
                    } else {
                        LazyVStack(spacing: 12) {
                            ForEach(Array(metrics.decisions.enumerated()), id: \.offset) { index, decision in
                                DecisionCardView(
                                    decision: decision,
                                    sceneIndex: index + 1,
                                    scene: scenesById[decision.sceneId]
                                )
                            }
                        }
                    }
                }
                .padding()
            }
            .navigationTitle("Historial de Decisiones")
            .navigationBarTitleDisplayMode(.large)
            .navigationBarBackButtonHidden(true)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Cerrar") {
                        dismiss()
                    }
                }
            }
        }
    }
    
    private struct MetricsSummaryView: View {
        let metrics: Capa4ProgressMetrics
        
        var body: some View {
            VStack(spacing: 12) {
                Text("Resumen de Métricas")
                    .font(.headline)
                    .foregroundColor(.primary)
                
                HStack(spacing: 16) {
                    MetricSummaryPill(
                        color: .blue,
                        title: "CONEXIÓN",
                        value: metrics.connectionScore,
                        icon: "heart.fill"
                    )
                    
                    MetricSummaryPill(
                        color: .teal,
                        title: "REGULACIÓN",
                        value: metrics.regulationScore,
                        icon: "brain.head.profile"
                    )
                    
                    MetricSummaryPill(
                        color: .orange,
                        title: "LÍMITES",
                        value: metrics.limitScore,
                        icon: "shield.fill"
                    )
                }
                
                Text("Total de decisiones: \(metrics.decisions.count)")
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
            .padding(16)
            .background(
                RoundedRectangle(cornerRadius: 16, style: .continuous)
                    .fill(Color(.secondarySystemBackground).opacity(0.8))
            )
        }
        
        private struct MetricSummaryPill: View {
            let color: Color
            let title: String
            let value: Int
            let icon: String
            
            var body: some View {
                VStack(spacing: 8) {
                    Image(systemName: icon)
                        .font(.title2)
                        .foregroundColor(color)
                    
                    Text(title)
                        .font(.caption2)
                        .fontWeight(.semibold)
                        .foregroundColor(.secondary)
                    
                    Text("\(value)")
                        .font(.title3)
                        .fontWeight(.bold)
                        .foregroundColor(color)
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 12)
                .background(
                    RoundedRectangle(cornerRadius: 12, style: .continuous)
                        .fill(color.opacity(0.1))
                        .overlay(
                            RoundedRectangle(cornerRadius: 12, style: .continuous)
                                .stroke(color.opacity(0.3), lineWidth: 1)
                        )
                )
            }
        }
    }
    
    private struct DecisionCardView: View {
        let decision: Capa4Decision
        let sceneIndex: Int
        let scene: Capa4Scene?
        
        var body: some View {
            VStack(alignment: .leading, spacing: 12) {
                HStack {
                    Text("Decisión #\(sceneIndex)")
                        .font(.headline)
                        .foregroundColor(.primary)
                    Spacer()
                    Text(timeAgo)
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
                
                if let scene = scene {
                    Text(scene.prompt)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                        .lineLimit(3)
                }
                
                // Impacto en métricas
                HStack(spacing: 16) {
                    MetricImpactBadge(
                        color: .blue,
                        title: "CON",
                        value: decision.deltaConnection,
                        icon: "heart"
                    )
                    
                    MetricImpactBadge(
                        color: .teal,
                        title: "REG",
                        value: decision.deltaRegulation,
                        icon: "brain"
                    )
                    
                    MetricImpactBadge(
                        color: .orange,
                        title: "LIM",
                        value: decision.deltaLimit,
                        icon: "shield"
                    )
                }
            }
            .padding(16)
            .background(
                RoundedRectangle(cornerRadius: 16, style: .continuous)
                    .fill(Color(.systemBackground).opacity(0.9))
                    .shadow(color: Color.black.opacity(0.05), radius: 4, x: 0, y: 2)
            )
        }
        
        private var timeAgo: String {
            let formatter = RelativeDateTimeFormatter()
            formatter.unitsStyle = .abbreviated
            return formatter.localizedString(for: decision.timestamp, relativeTo: Date())
        }
        
        private struct MetricImpactBadge: View {
            let color: Color
            let title: String
            let value: Int
            let icon: String
            
            var isPositive: Bool { value > 0 }
            var isNegative: Bool { value < 0 }
            
            var body: some View {
                VStack(spacing: 4) {
                    Image(systemName: icon)
                        .font(.caption)
                        .foregroundColor(badgeColor)
                    
                    Text(title)
                        .font(.caption2)
                        .fontWeight(.semibold)
                        .foregroundColor(.secondary)
                    
                    Text(isPositive ? "+\(value)" : "\(value)")
                        .font(.caption)
                        .fontWeight(.bold)
                        .foregroundColor(badgeColor)
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 8)
                .padding(.horizontal, 4)
                .background(
                    RoundedRectangle(cornerRadius: 8, style: .continuous)
                        .fill(badgeColor.opacity(0.1))
                )
            }
            
            private var badgeColor: Color {
                if isPositive { return color }
                if isNegative { return .red }
                return .secondary
            }
        }
    }
}

// MARK: - Recommended Tools View

private struct RecommendedToolsView: View {
    let tools: [String]
    let specificGuidance: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                Image(systemName: "wrench.and.screwdriver.fill")
                    .foregroundColor(.blue)
                Text("Herramientas Recomendadas")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundColor(.primary)
            }
            
            // Lista de herramientas
            LazyVStack(spacing: 8) {
                ForEach(tools, id: \.self) { toolId in
                    if let toolInfo = Capa4SimulationData.herramientaCapa3(por: toolId) {
                        ToolRecommendationCard(toolInfo: toolInfo)
                    }
                }
            }
            
            // Guía específica
            if !specificGuidance.isEmpty {
                VStack(alignment: .leading, spacing: 6) {
                    Text("Guía Específica")
                        .font(.caption)
                        .fontWeight(.semibold)
                        .foregroundColor(.primary)
                    
                    Text(specificGuidance)
                        .font(.caption)
                        .foregroundColor(.secondary)
                        .multilineTextAlignment(.leading)
                }
                .padding(12)
                .background(
                    RoundedRectangle(cornerRadius: 10, style: .continuous)
                        .fill(Color(.tertiarySystemBackground).opacity(0.8))
                )
            }
        }
        .padding(12)
        .background(
            RoundedRectangle(cornerRadius: 12, style: .continuous)
                .fill(Color.blue.opacity(0.08))
                .overlay(
                    RoundedRectangle(cornerRadius: 12, style: .continuous)
                        .stroke(Color.blue.opacity(0.2), lineWidth: 1)
                )
        )
    }
    
    private struct ToolRecommendationCard: View {
        let toolInfo: (nombre: String, icono: String, descripcion: String)
        
        var body: some View {
            HStack(spacing: 12) {
                // Icono de la herramienta
                Image(systemName: toolInfo.icono)
                    .font(.title3)
                    .foregroundColor(.blue)
                    .frame(width: 30, height: 30)
                    .background(
                        Circle()
                            .fill(Color.blue.opacity(0.1))
                    )
                
                // Información de la herramienta
                VStack(alignment: .leading, spacing: 4) {
                    Text(toolInfo.nombre)
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundColor(.primary)
                    
                    Text(toolInfo.descripcion)
                        .font(.caption)
                        .foregroundColor(.secondary)
                        .multilineTextAlignment(.leading)
                }
                
                Spacer()
                
                // Indicador de recomendación
                Image(systemName: "arrow.right.circle.fill")
                    .font(.caption)
                    .foregroundColor(.blue)
            }
            .padding(10)
            .background(
                RoundedRectangle(cornerRadius: 10, style: .continuous)
                    .fill(Color(.systemBackground).opacity(0.9))
                    .shadow(color: Color.black.opacity(0.05), radius: 2, x: 0, y: 1)
            )
        }
    }
}

#Preview {
    Capa4SimulacionesAvanzadasView()
}
