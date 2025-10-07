import SwiftUI
import Foundation

struct Capa7EvaluacionView: View {
    @StateObject private var progressManager = Capa7ProgressManager()
    @State private var capa7: Capa7Evaluacion?
    @State private var currentTest: Capa7ReflectionTest?
    @State private var currentScenario: Capa7Scenario?
    @State private var selectedOption: UUID?
    @State private var showingFeedback = false
    @State private var showingResults = false
    @State private var currentStep = 0
    @State private var testResponses: [UUID: UUID] = [:]
    @State private var scenarioResponses: [UUID: UUID] = [:]
    
    var body: some View {
        NavigationView {
            ZStack {
                // Fondo con gradiente respiratorio
                LinearGradient(
                    colors: [Color.blue.opacity(0.1), Color.green.opacity(0.1)],
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
                .ignoresSafeArea()
                
                if let capa7 = capa7 {
                    ScrollView {
                        VStack(spacing: 32) {
                            // Header con diseño emocional
                            EvaluacionHeaderView(capa7: capa7)
                            
                            // Progreso del estado cerebral
                            BrainStateView(brainState: progressManager.currentBrainState)
                            
                            // Contenido principal
                            if currentTest != nil {
                                ReflectionTestView(
                                    test: currentTest!,
                                    selectedOption: $selectedOption,
                                    showingFeedback: $showingFeedback,
                                    onComplete: completeReflectionTest
                                )
                            } else if currentScenario != nil {
                                ScenarioView(
                                    scenario: currentScenario!,
                                    selectedOption: $selectedOption,
                                    showingFeedback: $showingFeedback,
                                    onComplete: completeScenario
                                )
                            } else if showingResults {
                                ResultsView(
                                    progressManager: progressManager,
                                    onRestart: restartEvaluation
                                )
                            } else {
                                // Menú principal de evaluación
                                MainMenuView(
                                    capa7: capa7,
                                    onStartReflection: startReflectionTest,
                                    onStartScenario: startScenario
                                )
                            }
                        }
                        .padding()
                    }
                } else {
                    ProgressView("Preparando tu espacio de reflexión...")
                        .onAppear {
                            capa7 = Capa7Evaluacion.contenidoCerebroDelNino()
                        }
                }
            }
            .navigationTitle("Evaluación Reflexiva")
            .navigationBarTitleDisplayMode(.large)
        }
    }
    
    // MARK: - Funciones de Navegación
    
    private func startReflectionTest() {
        guard let capa7 = capa7 else { return }
        currentTest = capa7.reflectionTests.first
        currentScenario = nil
        selectedOption = nil
        showingFeedback = false
        showingResults = false
    }
    
    private func startScenario() {
        guard let capa7 = capa7 else { return }
        currentScenario = capa7.scenarios.first
        currentTest = nil
        selectedOption = nil
        showingFeedback = false
        showingResults = false
    }
    
    private func completeReflectionTest() {
        guard let test = currentTest,
              let selectedOption = selectedOption else { return }
        
        let selectedReflectionOption = test.questions.first?.options.first { $0.id == selectedOption }
        let brainLevel = selectedReflectionOption?.brainLevel ?? .amygdala
        
        progressManager.recordReflection(
            testId: test.id,
            responses: [selectedOption],
            brainLevel: brainLevel
        )
        
        testResponses[test.id] = selectedOption
        
        // Navegar al siguiente test o mostrar resultados
        if let currentIndex = capa7?.reflectionTests.firstIndex(where: { $0.id == test.id }),
           currentIndex < (capa7?.reflectionTests.count ?? 0) - 1 {
            self.currentTest = capa7?.reflectionTests[currentIndex + 1]
            self.selectedOption = nil
            self.showingFeedback = false
        } else {
            self.currentTest = nil
            self.showingResults = true
        }
    }
    
    private func completeScenario() {
        guard let scenario = currentScenario,
              let selectedOption = selectedOption else { return }
        
        let selectedScenarioOption = scenario.options.first { $0.id == selectedOption }
        let brainResponse = selectedScenarioOption?.brainResponse ?? .amygdala
        
        progressManager.recordScenario(
            scenarioId: scenario.id,
            selectedOption: selectedOption,
            brainResponse: brainResponse
        )
        
        scenarioResponses[scenario.id] = selectedOption
        
        // Navegar al siguiente escenario o mostrar resultados
        if let currentIndex = capa7?.scenarios.firstIndex(where: { $0.id == scenario.id }),
           currentIndex < (capa7?.scenarios.count ?? 0) - 1 {
            self.currentScenario = capa7?.scenarios[currentIndex + 1]
            self.selectedOption = nil
            self.showingFeedback = false
        } else {
            self.currentScenario = nil
            self.showingResults = true
        }
    }
    
    private func restartEvaluation() {
        currentTest = nil
        currentScenario = nil
        selectedOption = nil
        showingFeedback = false
        showingResults = false
        testResponses.removeAll()
        scenarioResponses.removeAll()
        progressManager.reflectionHistory.removeAll()
        progressManager.scenarioHistory.removeAll()
    }
}

// MARK: - Componentes de la Vista

struct EvaluacionHeaderView: View {
    let capa7: Capa7Evaluacion
    
    var body: some View {
        VStack(spacing: 20) {
            // Icono y título
            HStack(spacing: 16) {
                Image(systemName: "heart.circle.fill")
                    .font(.system(size: 50))
                    .foregroundStyle(
                        LinearGradient(
                            colors: [.blue, .green],
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                    )
                
                VStack(alignment: .leading, spacing: 8) {
                    Text(capa7.titulo)
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(.primary)
                    
                    Text(capa7.descripcion)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
            }
            
            // Mensaje inspirador
            Text("No estás evaluándote, estás observándote")
                .font(.headline)
                .foregroundColor(.blue)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 20)
                .padding(.vertical, 12)
                .background(
                    RoundedRectangle(cornerRadius: 20)
                        .fill(Color.blue.opacity(0.1))
                )
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 24)
                .fill(Color(.systemBackground))
                .shadow(color: .black.opacity(0.1), radius: 12, x: 0, y: 6)
        )
    }
}

struct BrainStateView: View {
    let brainState: BrainIntegrationLevel
    
    var body: some View {
        VStack(spacing: 12) {
            HStack {
                Image(systemName: brainStateIcon)
                    .foregroundColor(brainStateColor)
                    .font(.title2)
                
                Text("Tu Estado Cerebral Actual")
                    .font(.headline)
                    .fontWeight(.semibold)
                
                Spacer()
            }
            
            Text(brainStateDescription)
                .font(.subheadline)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.leading)
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(brainStateColor.opacity(0.1))
                .overlay(
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(brainStateColor.opacity(0.3), lineWidth: 2)
                )
        )
    }
    
    private var brainStateIcon: String {
        switch brainState {
        case .prefrontal: return "brain.head.profile"
        case .bridge: return "arrow.triangle.2.circlepath"
        case .amygdala: return "heart.fill"
        }
    }
    
    private var brainStateColor: Color {
        switch brainState {
        case .prefrontal: return .green
        case .bridge: return .orange
        case .amygdala: return .red
        }
    }
    
    private var brainStateDescription: String {
        switch brainState {
        case .prefrontal: return "Estás fortaleciendo tu calma interior y desarrollando respuestas conscientes."
        case .bridge: return "Estás en proceso de integración. Algunas respuestas son conscientes, otras aún reactivas."
        case .amygdala: return "Aún reaccionas desde la emoción, pero reconocer esto es el primer paso hacia el crecimiento."
        }
    }
}

struct MainMenuView: View {
    let capa7: Capa7Evaluacion
    let onStartReflection: () -> Void
    let onStartScenario: () -> Void
    
    var body: some View {
        VStack(spacing: 24) {
            // Introducción
            VStack(alignment: .leading, spacing: 16) {
                Text("Introducción")
                    .font(.headline)
                    .fontWeight(.semibold)
                
                Text(capa7.introduccion)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 16)
                    .fill(Color(.systemBackground))
                    .shadow(color: .black.opacity(0.05), radius: 4, x: 0, y: 2)
            )
            
            // Objetivos
            VStack(alignment: .leading, spacing: 16) {
                Text("Objetivos")
                    .font(.headline)
                    .fontWeight(.semibold)
                
                ForEach(capa7.objetivos, id: \.self) { objetivo in
                    HStack(alignment: .top, spacing: 12) {
                        Image(systemName: "heart.fill")
                            .foregroundColor(.pink)
                            .font(.caption)
                        
                        Text(objetivo)
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                    }
                }
            }
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 16)
                    .fill(Color(.systemBackground))
                    .shadow(color: .black.opacity(0.05), radius: 4, x: 0, y: 2)
            )
            
            // Opciones de evaluación
            VStack(spacing: 16) {
                Text("Elige tu tipo de reflexión")
                    .font(.headline)
                    .fontWeight(.semibold)
                
                VStack(spacing: 12) {
                    // Autoevaluación Reflexiva
                    Button(action: onStartReflection) {
                        HStack {
                            Image(systemName: "brain.head.profile")
                                .font(.title2)
                                .foregroundColor(.blue)
                            
                            VStack(alignment: .leading) {
                                Text("Autoevaluación Reflexiva")
                                    .font(.headline)
                                    .fontWeight(.semibold)
                                    .foregroundColor(.primary)
                                
                                Text("Preguntas con escala emocional")
                                    .font(.subheadline)
                                    .foregroundColor(.secondary)
                            }
                            
                            Spacer()
                            
                            Image(systemName: "arrow.right.circle.fill")
                                .foregroundColor(.blue)
                        }
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 16)
                                .fill(Color.blue.opacity(0.1))
                                .overlay(
                                    RoundedRectangle(cornerRadius: 16)
                                        .stroke(Color.blue.opacity(0.3), lineWidth: 2)
                                )
                        )
                    }
                    .buttonStyle(PlainButtonStyle())
                    
                    // Escenarios Interactivos
                    Button(action: onStartScenario) {
                        HStack {
                            Image(systemName: "play.circle.fill")
                                .font(.title2)
                                .foregroundColor(.green)
                            
                            VStack(alignment: .leading) {
                                Text("Escenarios Interactivos")
                                    .font(.headline)
                                    .fontWeight(.semibold)
                                    .foregroundColor(.primary)
                                
                                Text("Simulaciones de la vida real")
                                    .font(.subheadline)
                                    .foregroundColor(.secondary)
                            }
                            
                            Spacer()
                            
                            Image(systemName: "arrow.right.circle.fill")
                                .foregroundColor(.green)
                        }
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 16)
                                .fill(Color.green.opacity(0.1))
                                .overlay(
                                    RoundedRectangle(cornerRadius: 16)
                                        .stroke(Color.green.opacity(0.3), lineWidth: 2)
                                )
                        )
                    }
                    .buttonStyle(PlainButtonStyle())
                }
            }
        }
    }
}

struct ReflectionTestView: View {
    let test: Capa7ReflectionTest
    @Binding var selectedOption: UUID?
    @Binding var showingFeedback: Bool
    let onComplete: () -> Void
    
    var body: some View {
        VStack(spacing: 24) {
            // Título del test
            VStack(spacing: 12) {
                Text(test.title)
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(.blue)
                
                Text("Reflexiona sobre tu experiencia")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
            
            // Preguntas del test
            ForEach(test.questions) { question in
                VStack(alignment: .leading, spacing: 16) {
                    Text(question.prompt)
                        .font(.headline)
                        .fontWeight(.medium)
                        .foregroundColor(.primary)
                    
                    VStack(spacing: 12) {
                        ForEach(question.options) { option in
                            Button(action: {
                                selectedOption = option.id
                                showingFeedback = true
                            }) {
                                HStack {
                                    Text(option.text)
                                        .font(.subheadline)
                                        .foregroundColor(.primary)
                                        .multilineTextAlignment(.leading)
                                    
                                    Spacer()
                                    
                                    if selectedOption == option.id {
                                        Image(systemName: "checkmark.circle.fill")
                                            .foregroundColor(.blue)
                                    } else {
                                        Image(systemName: "circle")
                                            .foregroundColor(.secondary)
                                    }
                                }
                                .padding()
                                .background(
                                    RoundedRectangle(cornerRadius: 12)
                                        .fill(selectedOption == option.id ? Color.blue.opacity(0.1) : Color(.systemGray6))
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 12)
                                                .stroke(selectedOption == option.id ? Color.blue : Color.clear, lineWidth: 2)
                                        )
                                )
                            }
                            .buttonStyle(PlainButtonStyle())
                        }
                    }
                }
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 16)
                        .fill(Color(.systemBackground))
                        .shadow(color: .black.opacity(0.05), radius: 4, x: 0, y: 2)
                )
            }
            
            // Feedback
            if showingFeedback, let selectedOption = selectedOption {
                if let question = test.questions.first,
                   let selectedReflectionOption = question.options.first(where: { $0.id == selectedOption }) {
                    VStack(alignment: .leading, spacing: 12) {
                        HStack {
                            Image(systemName: "lightbulb.fill")
                                .foregroundColor(.yellow)
                            
                            Text("Insight")
                                .font(.headline)
                                .fontWeight(.semibold)
                                .foregroundColor(.yellow)
                        }
                        
                        Text(selectedReflectionOption.feedback)
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                        
                        HStack {
                            Image(systemName: "brain.head.profile")
                                .foregroundColor(brainLevelColor(selectedReflectionOption.brainLevel))
                            
                            Text(selectedReflectionOption.brainLevel.rawValue)
                                .font(.caption)
                                .fontWeight(.medium)
                                .foregroundColor(brainLevelColor(selectedReflectionOption.brainLevel))
                        }
                        .padding(.top, 8)
                    }
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 16)
                            .fill(Color.yellow.opacity(0.1))
                            .overlay(
                                RoundedRectangle(cornerRadius: 16)
                                    .stroke(Color.yellow.opacity(0.3), lineWidth: 1)
                            )
                    )
                    .transition(.scale.combined(with: .opacity))
                }
            }
            
            // Botón de continuar
            if selectedOption != nil {
                Button(action: onComplete) {
                    Text("Continuar")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 12)
                                .fill(Color.blue)
                        )
                }
                .buttonStyle(PlainButtonStyle())
            }
        }
    }
    
    private func brainLevelColor(_ level: BrainIntegrationLevel) -> Color {
        switch level {
        case .prefrontal: return .green
        case .bridge: return .orange
        case .amygdala: return .red
        }
    }
}

struct ScenarioView: View {
    let scenario: Capa7Scenario
    @Binding var selectedOption: UUID?
    @Binding var showingFeedback: Bool
    let onComplete: () -> Void
    
    var body: some View {
        VStack(spacing: 24) {
            // Contexto del escenario
            VStack(alignment: .leading, spacing: 16) {
                Text("Escenario")
                    .font(.headline)
                    .fontWeight(.semibold)
                    .foregroundColor(.green)
                
                Text(scenario.context)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                
                Text(scenario.situation)
                    .font(.body)
                    .fontWeight(.medium)
                    .foregroundColor(.primary)
            }
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 16)
                    .fill(Color.green.opacity(0.1))
                    .overlay(
                        RoundedRectangle(cornerRadius: 16)
                            .stroke(Color.green.opacity(0.3), lineWidth: 1)
                    )
            )
            
            // Opciones de respuesta
            VStack(spacing: 12) {
                ForEach(scenario.options) { option in
                    Button(action: {
                        selectedOption = option.id
                        showingFeedback = true
                    }) {
                        HStack {
                            Text(option.text)
                                .font(.subheadline)
                                .foregroundColor(.primary)
                                .multilineTextAlignment(.leading)
                            
                            Spacer()
                            
                            if selectedOption == option.id {
                                Image(systemName: "checkmark.circle.fill")
                                    .foregroundColor(.green)
                            } else {
                                Image(systemName: "circle")
                                    .foregroundColor(.secondary)
                            }
                        }
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 12)
                                .fill(selectedOption == option.id ? Color.green.opacity(0.1) : Color(.systemGray6))
                                .overlay(
                                    RoundedRectangle(cornerRadius: 12)
                                        .stroke(selectedOption == option.id ? Color.green : Color.clear, lineWidth: 2)
                                )
                        )
                    }
                    .buttonStyle(PlainButtonStyle())
                }
            }
            
            // Feedback
            if showingFeedback, let selectedOption = selectedOption {
                if let selectedScenarioOption = scenario.options.first(where: { $0.id == selectedOption }) {
                    VStack(alignment: .leading, spacing: 12) {
                        HStack {
                            Image(systemName: "brain.head.profile")
                                .foregroundColor(brainResponseColor(selectedScenarioOption.brainResponse))
                            
                            Text("Reflexión")
                                .font(.headline)
                                .fontWeight(.semibold)
                                .foregroundColor(brainResponseColor(selectedScenarioOption.brainResponse))
                        }
                        
                        Text(selectedScenarioOption.reflection)
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                        
                        HStack {
                            Image(systemName: "heart.fill")
                                .foregroundColor(brainResponseColor(selectedScenarioOption.brainResponse))
                            
                            Text(selectedScenarioOption.brainResponse.rawValue)
                                .font(.caption)
                                .fontWeight(.medium)
                                .foregroundColor(brainResponseColor(selectedScenarioOption.brainResponse))
                        }
                        .padding(.top, 8)
                    }
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 16)
                            .fill(brainResponseColor(selectedScenarioOption.brainResponse).opacity(0.1))
                            .overlay(
                                RoundedRectangle(cornerRadius: 16)
                                    .stroke(brainResponseColor(selectedScenarioOption.brainResponse).opacity(0.3), lineWidth: 1)
                            )
                    )
                    .transition(.scale.combined(with: .opacity))
                }
            }
            
            // Botón de continuar
            if selectedOption != nil {
                Button(action: onComplete) {
                    Text("Continuar")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 12)
                                .fill(Color.green)
                        )
                }
                .buttonStyle(PlainButtonStyle())
            }
        }
    }
    
    private func brainResponseColor(_ response: BrainIntegrationLevel) -> Color {
        switch response {
        case .prefrontal: return .green
        case .bridge: return .orange
        case .amygdala: return .red
        }
    }
}

struct ResultsView: View {
    @ObservedObject var progressManager: Capa7ProgressManager
    let onRestart: () -> Void
    
    var body: some View {
        VStack(spacing: 24) {
            // Header de resultados
            VStack(spacing: 16) {
                Image(systemName: "heart.circle.fill")
                    .font(.system(size: 60))
                    .foregroundStyle(
                        LinearGradient(
                            colors: [.blue, .green],
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                    )
                
                Text("¡Reflexión Completada!")
                    .font(.title2)
                    .fontWeight(.bold)
                
                Text("La mejora comienza cuando te ves con compasión")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                    .multilineTextAlignment(.center)
            }
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color(.systemBackground))
                    .shadow(color: .black.opacity(0.1), radius: 8, x: 0, y: 4)
            )
            
            // Resumen del progreso
            VStack(alignment: .leading, spacing: 16) {
                Text("Tu Estado Emocional Actual")
                    .font(.headline)
                    .fontWeight(.semibold)
                
                Text(progressManager.getProgressSummary())
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                
                // Visualización del estado cerebral
                HStack {
                    Image(systemName: brainStateIcon)
                        .foregroundColor(brainStateColor)
                        .font(.title2)
                    
                    VStack(alignment: .leading) {
                        Text(progressManager.currentBrainState.rawValue)
                            .font(.headline)
                            .fontWeight(.semibold)
                            .foregroundColor(brainStateColor)
                        
                        Text(brainStateDescription)
                            .font(.caption)
                            .foregroundColor(.secondary)
                    }
                    
                    Spacer()
                }
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 12)
                        .fill(brainStateColor.opacity(0.1))
                        .overlay(
                            RoundedRectangle(cornerRadius: 12)
                                .stroke(brainStateColor.opacity(0.3), lineWidth: 1)
                        )
                )
            }
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 16)
                    .fill(Color(.systemBackground))
                    .shadow(color: .black.opacity(0.05), radius: 4, x: 0, y: 2)
            )
            
            // Botón de reiniciar
            Button(action: onRestart) {
                Text("Nueva Reflexión")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 12)
                            .fill(Color.blue)
                    )
            }
            .buttonStyle(PlainButtonStyle())
        }
    }
    
    private var brainStateIcon: String {
        switch progressManager.currentBrainState {
        case .prefrontal: return "brain.head.profile"
        case .bridge: return "arrow.triangle.2.circlepath"
        case .amygdala: return "heart.fill"
        }
    }
    
    private var brainStateColor: Color {
        switch progressManager.currentBrainState {
        case .prefrontal: return .green
        case .bridge: return .orange
        case .amygdala: return .red
        }
    }
    
    private var brainStateDescription: String {
        switch progressManager.currentBrainState {
        case .prefrontal: return "Respuestas conscientes y empáticas"
        case .bridge: return "Proceso de integración en curso"
        case .amygdala: return "Reconocimiento del crecimiento necesario"
        }
    }
}

// MARK: - Preview

#Preview {
    Capa7EvaluacionView()
}