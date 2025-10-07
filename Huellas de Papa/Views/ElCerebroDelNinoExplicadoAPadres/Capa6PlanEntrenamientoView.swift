import SwiftUI
import UserNotifications

// MARK: - CAPA 6: PLAN DE ENTRENAMIENTO VIEW - SuperDesign
/// Vista principal del Plan de Entrenamiento de 28 días con SuperDesign y micro-interacciones
struct Capa6PlanEntrenamientoView: View {
    @EnvironmentObject private var progresoManager: ProgresoManager
    @StateObject private var trainingProgressManager = TrainingProgressManager()
    @State private var trainingPlan: Capa6PlanEntrenamiento?
    @State private var showReflection = false
    @State private var showReward = false
    @State private var currentReward: RewardType?
    @State private var showPhaseOverview = false
    @State private var selectedPhase = 0
    @State private var showStats = false
    
    var currentDay: Int {
        trainingProgressManager.userProgress.currentDay
    }
    
    var progress: Double {
        trainingProgressManager.userProgress.totalProgress
    }
    
    var streak: Int {
        trainingProgressManager.userProgress.streak
    }
    
    var currentObjective: Capa6Objective? {
        guard let plan = trainingPlan else { return nil }
        let allObjectives = plan.trainingPlan.phases.flatMap { $0.objectives }
        return allObjectives.first { $0.dayNumber == currentDay }
    }
    
    var currentPhase: Capa6Phase? {
        guard let plan = trainingPlan else { return nil }
        return plan.trainingPlan.phases.first { phase in
            phase.objectives.contains { $0.dayNumber == currentDay }
        }
    }
    
    var body: some View {
        VStack(spacing: 0) {
            // Training Header con progreso animado
            TrainingHeader(
                progress: progress,
                currentDay: currentDay,
                streak: streak,
                phase: currentPhase,
                onStatsTap: {
                    showStats = true
                }
            )
            
            ScrollView {
                    VStack(spacing: 20) {
                    // Training Day Card con animaciones
                    if let objective = currentObjective {
                        TrainingDayCard(
                            objective: objective,
                            onComplete: {
                                completeDay()
                            }
                        )
                        .transition(.asymmetric(
                            insertion: .scale.combined(with: .opacity),
                            removal: .opacity
                        ))
                    }
                    
                    // Fases Overview
                    PhasesOverview(
                        phases: trainingPlan?.trainingPlan.phases ?? [],
                        currentPhase: selectedPhase,
                        onPhaseSelect: { phase in
                            selectedPhase = phase
                            showPhaseOverview = true
                        }
                    )
                    
                    // Motivational Quote
                    MotivationalQuote(day: currentDay)
                        }
                        .padding()
            }
            
            // Bottom Action Button
            VStack(spacing: 12) {
                if let objective = currentObjective {
                    Button(action: {
                        showReflection.toggle()
                    }) {
                        HStack {
                            Image(systemName: "brain.head.profile")
                            Text("Reflexionar")
                        }
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(
                            LinearGradient(
                                colors: [Color.blue, Color.purple],
                                startPoint: .leading,
                                endPoint: .trailing
                            )
                        )
                        .cornerRadius(16)
                    }
                    .buttonStyle(MainButtonStyle())
                }
            }
            .padding()
        }
        .sheet(isPresented: $showReflection) {
            if let objective = currentObjective {
                ReflectionPrompt(
                    objective: objective,
                    onComplete: { reflection in
                        saveReflection(reflection)
                    }
                )
            }
        }
        .sheet(isPresented: $showPhaseOverview) {
            PhaseDetailView(
                phase: trainingPlan?.trainingPlan.phases[selectedPhase],
                onClose: {
                    showPhaseOverview = false
                }
            )
        }
        .sheet(isPresented: $showStats) {
            TrainingStatsView(
                progressManager: trainingProgressManager,
                onClose: {
                    showStats = false
                }
            )
        }
        .overlay(
            // Reward Modal
            Group {
                if showReward, let reward = currentReward {
                    RewardModal(
                        rewardType: reward,
                        onDismiss: {
                            showReward = false
                            currentReward = nil
                        }
                    )
                }
            }
        )
        .animation(.spring(response: 0.35, dampingFraction: 0.8), value: currentDay)
        .animation(.spring(response: 0.35, dampingFraction: 0.8), value: progress)
        .onAppear {
            loadTrainingPlan()
            playSoftIntroSound()
        }
    }
    
    // MARK: - Funciones de Acción
    
    private func loadTrainingPlan() {
        trainingPlan = Capa6PlanEntrenamiento.contenidoCerebroDelNino()
        
        // Si es la primera vez, inicializar el entrenamiento
        if trainingProgressManager.isFirstTime {
            trainingProgressManager.startTraining()
        }
    }
    
    private func completeDay() {
        guard let objective = currentObjective else { return }
        
        // Marcar día como completado usando el manager de persistencia
        trainingProgressManager.completeDay(currentDay)
        
        // Crear y guardar recompensa
        let reward = RewardEarned(
            dayNumber: currentDay,
            rewardType: objective.rewardType,
            message: "¡Día \(currentDay) completado! \(objective.title)"
        )
        trainingProgressManager.addReward(reward)
        
        // Mostrar recompensa
        currentReward = objective.rewardType
        showReward = true
        
        // Vibración de éxito
        #if os(iOS)
        let impactFeedback = UIImpactFeedbackGenerator(style: .medium)
        impactFeedback.impactOccurred()
        #endif
        
        // Avanzar al siguiente día
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            if currentDay < 28 {
                trainingProgressManager.userProgress.currentDay += 1
                trainingProgressManager.saveProgress()
            }
        }
    }
    
    private func saveReflection(_ reflection: String) {
        guard let objective = currentObjective else { return }
        
        // Crear reflexión con datos del día
        let dayReflection = DayReflection(
            dayNumber: currentDay,
            reflectionText: reflection,
            moodRating: 4 // Valor por defecto, se puede mejorar con un slider
        )
        
        // Guardar reflexión usando el manager de persistencia
        trainingProgressManager.addReflection(dayReflection)
        showReflection = false
    }
    
    private func playSoftIntroSound() {
        // Reproducir sonido suave de introducción
        // Implementar con AVAudioPlayer si es necesario
    }
}

// MARK: - Componentes SuperDesign

// MARK: - Training Header
struct TrainingHeader: View {
    let progress: Double
    let currentDay: Int
    let streak: Int
    let phase: Capa6Phase?
    let onStatsTap: () -> Void
    
    var body: some View {
        VStack(spacing: 16) {
            // Progreso circular animado
            ZStack {
                Circle()
                    .stroke(Color.gray.opacity(0.3), lineWidth: 8)
                    .frame(width: 120, height: 120)
                
                Circle()
                    .trim(from: 0, to: progress)
                    .stroke(
                        LinearGradient(
                            colors: [Color.blue, Color.purple],
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        ),
                        style: StrokeStyle(lineWidth: 8, lineCap: .round)
                    )
                    .frame(width: 120, height: 120)
                    .rotationEffect(.degrees(-90))
                    .animation(.easeInOut(duration: 1.0), value: progress)
                
                VStack(spacing: 4) {
                    Text("Día \(currentDay)")
                        .font(.title2)
                        .fontWeight(.bold)
                                    .foregroundColor(.primary)
                                
                    Text("de 28")
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
            }
            
            // Información de la fase actual
            if let phase = phase {
                HStack(spacing: 12) {
                    Text(phase.visualSymbol)
                        .font(.title)
                    
                    VStack(alignment: .leading, spacing: 4) {
                        Text(phase.title)
                                    .font(.headline)
                                    .foregroundColor(.primary)
                            
                        Text(phase.description)
                            .font(.caption)
                                .foregroundColor(.secondary)
                            .multilineTextAlignment(.leading)
                    }
                                
                                Spacer()
                            }
                        .padding()
                .background(
                    RoundedRectangle(cornerRadius: 12)
                        .fill(Color(phase.themeColor).opacity(0.1))
                )
            }
            
            // Streak counter y botón de estadísticas
            HStack {
                HStack(spacing: 8) {
                    Image(systemName: "flame.fill")
                        .foregroundColor(.orange)
                    
                    Text("\(streak) días consecutivos")
                            .font(.subheadline)
                        .fontWeight(.medium)
                        .foregroundColor(.primary)
                }
                .padding(.horizontal, 16)
                .padding(.vertical, 8)
                .background(
                    Capsule()
                        .fill(Color.orange.opacity(0.1))
                )
                
                Spacer()
                
                Button(action: onStatsTap) {
                    HStack(spacing: 4) {
                        Image(systemName: "chart.bar.fill")
                        Text("Estadísticas")
                    }
                    .font(.caption)
                    .foregroundColor(.blue)
                    .padding(.horizontal, 12)
                    .padding(.vertical, 6)
                    .background(
                        Capsule()
                            .fill(Color.blue.opacity(0.1))
                    )
                }
            }
        }
        .padding()
        .background(
            LinearGradient(
                colors: [Color.blue.opacity(0.05), Color.purple.opacity(0.05)],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
        )
    }
}

// MARK: - Training Day Card
struct TrainingDayCard: View {
    let objective: Capa6Objective
    let onComplete: () -> Void
    @State private var isCompleted = false
    @State private var showActivity = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            // Header del día
                HStack {
                    VStack(alignment: .leading, spacing: 4) {
                    Text("Día \(objective.dayNumber)")
                            .font(.caption)
                        .fontWeight(.semibold)
                            .foregroundColor(.secondary)
                    
                    Text(objective.title)
                        .font(.title2)
                        .fontWeight(.bold)
                                .foregroundColor(.primary)
                    }
                    
                    Spacer()
                    
                // Icono de la actividad
                Image(systemName: objective.activity.type.icon)
                    .font(.title2)
                    .foregroundColor(.blue)
                }
                
                // Descripción
            Text(objective.description)
                                .font(.body)
                                .foregroundColor(.secondary)
                                .lineLimit(nil)
                
            // Información de la actividad
                HStack(spacing: 16) {
                    HStack(spacing: 4) {
                        Image(systemName: "clock")
                            .font(.caption)
                    Text("\(objective.activity.durationMinutes) min")
                            .font(.caption)
                    }
                    .foregroundColor(.secondary)
                    
                    HStack(spacing: 4) {
                    Image(systemName: "brain.head.profile")
                            .font(.caption)
                    Text(objective.activity.type.displayName)
                            .font(.caption)
                    }
                    .foregroundColor(.secondary)
                    
                Spacer()
            }
            
            // Botón de actividad
            Button(action: {
                showActivity.toggle()
            }) {
                HStack {
                    Image(systemName: "play.circle.fill")
                    Text("Comenzar Actividad")
                }
                .font(.headline)
                .foregroundColor(.white)
                .frame(maxWidth: .infinity)
                        .padding()
                .background(
                    LinearGradient(
                        colors: [Color.blue, Color.purple],
                        startPoint: .leading,
                        endPoint: .trailing
                    )
                )
                        .cornerRadius(12)
        }
        .buttonStyle(ScaleButtonStyle())
        }
        .padding()
                .background(
                    RoundedRectangle(cornerRadius: 16)
                        .fill(Color(.systemBackground))
                        .shadow(color: .black.opacity(0.1), radius: 8, x: 0, y: 4)
                )
        .sheet(isPresented: $showActivity) {
            ActivityDetailView(
                objective: objective,
                onComplete: {
                    isCompleted = true
                    onComplete()
                }
            )
        }
    }
}

// MARK: - Phases Overview
struct PhasesOverview: View {
    let phases: [Capa6Phase]
    let currentPhase: Int
    let onPhaseSelect: (Int) -> Void
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Fases del Plan")
                .font(.headline)
                .fontWeight(.bold)
                .foregroundColor(.primary)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 12) {
                    ForEach(0..<phases.count, id: \.self) { index in
                        PhaseCard(
                            phase: phases[index],
                            isCurrent: index == currentPhase,
                            onTap: {
                                onPhaseSelect(index)
                            }
                        )
                    }
                }
                .padding(.horizontal)
            }
        }
    }
}

// MARK: - Phase Card
struct PhaseCard: View {
    let phase: Capa6Phase
    let isCurrent: Bool
    let onTap: () -> Void
    
    var body: some View {
        Button(action: onTap) {
            VStack(spacing: 12) {
                Text(phase.visualSymbol)
                                .font(.title)
                    
                    VStack(alignment: .leading, spacing: 4) {
                    Text(phase.title)
                            .font(.headline)
                                    .fontWeight(.bold)
                            .foregroundColor(.primary)
                            .multilineTextAlignment(.leading)
                        
                    Text(phase.description)
                            .font(.caption)
                            .foregroundColor(.secondary)
                        .multilineTextAlignment(.leading)
                        .lineLimit(2)
                }
            }
            .padding()
            .frame(width: 140)
            .background(
                RoundedRectangle(cornerRadius: 12)
                    .fill(isCurrent ? Color(phase.themeColor).opacity(0.2) : Color(.systemGray6))
                    .overlay(
                        RoundedRectangle(cornerRadius: 12)
                            .stroke(
                                isCurrent ? Color(phase.themeColor) : Color.clear,
                                lineWidth: 2
                            )
                    )
            )
        }
        .buttonStyle(ScaleButtonStyle())
    }
}

// MARK: - Motivational Quote
struct MotivationalQuote: View {
    let day: Int
    
    var quotes: [String] = [
        "Tú puedes formar el cerebro que deseas acompañar",
        "La conexión emocional es la base del desarrollo",
        "Cada día es una oportunidad de crecer juntos",
        "La calma es contagiosa, la paz se transmite",
        "El amor es el mejor nutriente para el cerebro"
    ]
    
    var body: some View {
        VStack(spacing: 12) {
            Text("💡")
                .font(.title)
            
            Text(quotes[day % quotes.count])
                .font(.headline)
                .fontWeight(.medium)
                .foregroundColor(.primary)
                .multilineTextAlignment(.center)
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 12)
                        .fill(Color.yellow.opacity(0.1))
                )
        }
    }
}

// MARK: - Activity Detail View
struct ActivityDetailView: View {
    let objective: Capa6Objective
    let onComplete: () -> Void
    @Environment(\.dismiss) private var dismiss
    @State private var currentStep = 0
    @State private var isCompleted = false
    
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                // Header
                VStack(spacing: 12) {
                    Text(objective.title)
                        .font(.title2)
                        .fontWeight(.bold)
                        .multilineTextAlignment(.center)
                    
                    Text(objective.description)
                    .font(.body)
                    .foregroundColor(.secondary)
                        .multilineTextAlignment(.center)
                    }
                    .padding()
                
                // Instrucciones
                VStack(alignment: .leading, spacing: 16) {
                    Text("Instrucciones")
                            .font(.headline)
                        .fontWeight(.bold)
                        
                    Text(objective.activity.instruction)
                            .font(.body)
                    .foregroundColor(.secondary)
                    
                    // Materiales necesarios
                    if !objective.activity.materials.isEmpty {
                        VStack(alignment: .leading, spacing: 8) {
                            Text("Materiales necesarios:")
                                .font(.subheadline)
                                .fontWeight(.semibold)
                            
                            ForEach(objective.activity.materials, id: \.self) { material in
                                HStack(spacing: 8) {
                                    Image(systemName: "checkmark.circle.fill")
                                        .foregroundColor(.green)
                                    Text(material)
                                        .font(.body)
                                }
                            }
                        }
                    }
                    }
                    .padding()
                .background(
                    RoundedRectangle(cornerRadius: 12)
                        .fill(Color(.systemGray6))
                )
                    
                    Spacer()
                
                // Botón de completar
                Button(action: {
                    isCompleted = true
                    onComplete()
                    dismiss()
                }) {
                    HStack {
                        Image(systemName: "checkmark.circle.fill")
                        Text("Completar Actividad")
                    }
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
            .padding()
                    .background(
                        LinearGradient(
                            colors: [Color.green, Color.blue],
                            startPoint: .leading,
                            endPoint: .trailing
                        )
                    )
            .cornerRadius(12)
        }
        .buttonStyle(ScaleButtonStyle())
            }
            .padding()
            .navigationTitle("Actividad")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Cerrar") {
                        dismiss()
                    }
                }
            }
        }
    }
}

// MARK: - Reflection Prompt
struct ReflectionPrompt: View {
    let objective: Capa6Objective
    let onComplete: (String) -> Void
    @Environment(\.dismiss) private var dismiss
    @State private var reflection = ""
    @State private var useTextField = false
    
    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                // Header fijo
                VStack(spacing: 16) {
                    Text("📝 Reflexión del Día")
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(.primary)
                    
                    Text(objective.title)
                        .font(.headline)
                        .foregroundColor(.secondary)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal)
                }
                .padding()
                .background(Color(.systemBackground))
                
                ScrollView {
                    VStack(spacing: 24) {
                        // Prompt de reflexión
                        VStack(alignment: .leading, spacing: 16) {
                            HStack {
                                Image(systemName: "lightbulb.fill")
                                    .foregroundColor(.orange)
                                
                                Text("Pregunta de reflexión:")
                                    .font(.headline)
                                    .fontWeight(.semibold)
                                    .foregroundColor(.primary)
                            }
                            
                            Text(objective.reflectionPrompt)
                                .font(.body)
                                .foregroundColor(.secondary)
                                .padding(16)
                                .background(
                                    RoundedRectangle(cornerRadius: 12)
                                        .fill(Color(.systemGray6))
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 12)
                                                .stroke(Color.orange.opacity(0.3), lineWidth: 1)
                                        )
                                )
                        }
                        .padding(.horizontal)
                        
                        // Campo de texto con opciones
                        VStack(alignment: .leading, spacing: 16) {
                            HStack {
                                Image(systemName: "pencil.and.outline")
                                    .foregroundColor(.blue)
                                
                                Text("Tu reflexión:")
                                    .font(.headline)
                                    .fontWeight(.semibold)
                                    .foregroundColor(.primary)
                                
                                Spacer()
                                
                                // Toggle entre TextEditor y TextField
                                Button(action: {
                                    useTextField.toggle()
                                }) {
                                    HStack(spacing: 4) {
                                        Image(systemName: useTextField ? "textformat" : "textformat.abc")
                                        Text(useTextField ? "Cambiar a TextEditor" : "Cambiar a TextField")
                                    }
                                    .font(.caption)
                                    .foregroundColor(.blue)
                                    .padding(.horizontal, 8)
                                    .padding(.vertical, 4)
                                    .background(
                                        Capsule()
                                            .fill(Color.blue.opacity(0.1))
                                    )
                                }
                            }
                            
                            if useTextField {
                                // TextField multilínea
                                VStack(spacing: 8) {
                                    TextField("Escribe tu reflexión aquí...", text: $reflection, axis: .vertical)
                                        .textFieldStyle(RoundedBorderTextFieldStyle())
                                        .lineLimit(5...10)
                                        .frame(minHeight: 120)
                                    
                                    Text("Usando TextField - Puedes escribir múltiples líneas")
                                        .font(.caption)
                                        .foregroundColor(.green)
                                }
                            } else {
                                // TextEditor con fondo visible
                                ZStack(alignment: .topLeading) {
                                    // Fondo visible
                                    RoundedRectangle(cornerRadius: 12)
                                        .fill(Color(.systemBackground))
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 12)
                                                .stroke(Color.blue.opacity(0.5), lineWidth: 2)
                                        )
                                        .frame(minHeight: 150)
                                    
                                    // TextEditor
                                    TextEditor(text: $reflection)
                                        .frame(minHeight: 150)
                                        .padding(12)
                                        .background(Color.clear)
                                        .cornerRadius(12)
                                        .overlay(
                                            // Placeholder visible
                                            Group {
                                                if reflection.isEmpty {
                                                    VStack {
                                                        HStack {
                                                            Text("Escribe tu reflexión aquí...")
                                                                .foregroundColor(.secondary)
                                                                .font(.body)
                                                                .allowsHitTesting(false)
                                                            Spacer()
                                                        }
                                                        Spacer()
                                                    }
                                                    .padding(.horizontal, 16)
                                                    .padding(.vertical, 20)
                                                }
                                            }
                                        )
                                }
                                
                                Text("Usando TextEditor - Área de texto principal")
                                    .font(.caption)
                                    .foregroundColor(.blue)
                            }
                            
                            // Contador de caracteres
                            HStack {
                                Text("\(reflection.count) caracteres")
                                    .font(.caption)
                                    .foregroundColor(.secondary)
                                
                                Spacer()
                                
                                if !reflection.isEmpty {
                                    Text("✓ Texto guardado")
                                        .font(.caption)
                                        .foregroundColor(.green)
                                }
                            }
                        }
                        .padding(.horizontal)
                        
                        // Botón de guardar
                        VStack(spacing: 16) {
                            Button(action: {
                                onComplete(reflection)
                            }) {
                                HStack(spacing: 12) {
                                    Image(systemName: "book.fill")
                                        .font(.title3)
                                    
                                    Text("Guardar Reflexión")
                                        .font(.headline)
                                        .fontWeight(.semibold)
                                }
                                .foregroundColor(.white)
                                .frame(maxWidth: .infinity)
                                .padding(.vertical, 16)
                                .background(
                                    LinearGradient(
                                        colors: reflection.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty ? 
                                            [Color.gray, Color.gray] : [Color.purple, Color.blue],
                                        startPoint: .leading,
                                        endPoint: .trailing
                                    )
                                )
                                .cornerRadius(16)
                                .shadow(
                                    color: reflection.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty ? 
                                        .clear : .purple.opacity(0.3),
                                    radius: 8,
                                    x: 0,
                                    y: 4
                                )
                            }
                            .buttonStyle(ScaleButtonStyle())
                            .disabled(reflection.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty)
                            
                            // Texto de ayuda
                            Text("Escribe al menos unas palabras para guardar tu reflexión")
                                .font(.caption)
                                .foregroundColor(.secondary)
                                .multilineTextAlignment(.center)
                        }
                        .padding(.horizontal)
                        .padding(.bottom, 20)
                    }
                }
            }
            .navigationTitle("Reflexión")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Cerrar") {
                        dismiss()
                    }
                    .foregroundColor(.blue)
                }
            }
        }
    }
}

// MARK: - Reward Modal
struct RewardModal: View {
    let rewardType: RewardType
    let onDismiss: () -> Void
    @State private var showAnimation = false
    
    var body: some View {
        ZStack {
            Color.black.opacity(0.4)
                .ignoresSafeArea()
                .onTapGesture {
                    onDismiss()
                }
            
            VStack(spacing: 20) {
                // Icono de recompensa
                Image(systemName: rewardType.icon)
                    .font(.system(size: 60))
                    .foregroundColor(.blue)
                    .scaleEffect(showAnimation ? 1.2 : 0.8)
                    .animation(.spring(response: 0.6, dampingFraction: 0.8), value: showAnimation)
                
                VStack(spacing: 8) {
                    Text("¡Bien hecho!")
                        .font(.title2)
                        .fontWeight(.bold)
                            .foregroundColor(.primary)
                        
                    Text(rewardType.displayName)
                        .font(.headline)
                        .foregroundColor(.secondary)
                }
                
                // Mensaje motivacional
                Text("Has completado otro día de tu plan de entrenamiento. ¡Sigue así!")
                    .font(.body)
                    .foregroundColor(.secondary)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
            }
            .padding(30)
            .background(
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color(.systemBackground))
                    .shadow(color: .black.opacity(0.3), radius: 20, x: 0, y: 10)
            )
            .scaleEffect(showAnimation ? 1.0 : 0.8)
            .animation(.spring(response: 0.6, dampingFraction: 0.8), value: showAnimation)
        }
        .onAppear {
            showAnimation = true
        }
    }
}

// MARK: - Phase Detail View
struct PhaseDetailView: View {
    let phase: Capa6Phase?
    let onClose: () -> Void
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 20) {
                    if let phase = phase {
                        // Header de la fase
                        VStack(spacing: 16) {
                            Text(phase.visualSymbol)
                                .font(.system(size: 60))
                            
                            Text(phase.title)
                                .font(.title)
                                    .fontWeight(.bold)
                                .multilineTextAlignment(.center)
                                
                            Text(phase.description)
                                    .font(.body)
                                    .foregroundColor(.secondary)
                                .multilineTextAlignment(.center)
                        }
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 16)
                                .fill(Color(phase.themeColor).opacity(0.1))
                        )
                        
                        // Objetivos de la fase
                        VStack(alignment: .leading, spacing: 16) {
                            Text("Objetivos de esta fase:")
                                .font(.headline)
                                .fontWeight(.bold)
                            
                            ForEach(phase.objectives) { objective in
                                ObjectiveRow(objective: objective)
                            }
                        }
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 12)
                                .fill(Color(.systemGray6))
                        )
                        }
                    }
                    .padding()
            }
            .navigationTitle("Detalle de Fase")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Cerrar") {
                        onClose()
                        dismiss()
                    }
                }
            }
        }
    }
}

// MARK: - Objective Row
struct ObjectiveRow: View {
    let objective: Capa6Objective
    
    var body: some View {
        HStack(spacing: 12) {
            Text("Día \(objective.dayNumber)")
                                    .font(.caption)
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                                    .frame(width: 40, height: 20)
                .background(Color.blue)
                                    .cornerRadius(10)
                                
            VStack(alignment: .leading, spacing: 4) {
                Text(objective.title)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundColor(.primary)
                
                Text(objective.description)
                    .font(.caption)
                                    .foregroundColor(.secondary)
                    .lineLimit(2)
            }
                                
                                Spacer()
                            }
        .padding(.vertical, 4)
    }
}

// MARK: - Button Styles
struct MainButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .scaleEffect(configuration.isPressed ? 0.95 : 1.0)
            .animation(.easeInOut(duration: 0.1), value: configuration.isPressed)
    }
}


// MARK: - Training Stats View
struct TrainingStatsView: View {
    @ObservedObject var progressManager: TrainingProgressManager
    let onClose: () -> Void
    @Environment(\.dismiss) private var dismiss
    
    var stats: TrainingStats {
        progressManager.getTrainingStats()
    }
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 24) {
                    // Header con progreso general
                    VStack(spacing: 16) {
                        Text("📊 Estadísticas del Entrenamiento")
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundColor(.primary)
                        
                        // Progreso circular
                        ZStack {
                            Circle()
                                .stroke(Color.gray.opacity(0.3), lineWidth: 12)
                                .frame(width: 120, height: 120)
                            
                            Circle()
                                .trim(from: 0, to: stats.completionPercentage)
                                .stroke(
                                    LinearGradient(
                                        colors: [Color.blue, Color.purple],
                                        startPoint: .topLeading,
                                        endPoint: .bottomTrailing
                                    ),
                                    style: StrokeStyle(lineWidth: 12, lineCap: .round)
                                )
                                .frame(width: 120, height: 120)
                                .rotationEffect(.degrees(-90))
                                .animation(.easeInOut(duration: 1.0), value: stats.completionPercentage)
                            
                            VStack(spacing: 4) {
                                Text("\(Int(stats.completionPercentage * 100))%")
                                    .font(.title)
                                    .fontWeight(.bold)
                                    .foregroundColor(.primary)
                                
                                Text("Completado")
                                        .font(.caption)
                                        .foregroundColor(.secondary)
                            }
                        }
                    }
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 16)
                            .fill(Color(.systemGray6))
                    )
                    
                    // Estadísticas principales
                    LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 2), spacing: 16) {
                        StatCard(
                            title: "Días Completados",
                            value: "\(stats.totalDaysCompleted)",
                            subtitle: "de 28 días",
                            icon: "calendar.badge.checkmark",
                            color: .green
                        )
                        
                        StatCard(
                            title: "Racha Actual",
                            value: "\(stats.currentStreak)",
                            subtitle: "días consecutivos",
                            icon: "flame.fill",
                            color: .orange
                        )
                        
                        StatCard(
                            title: "Reflexiones",
                            value: "\(stats.totalReflections)",
                            subtitle: "en el diario",
                            icon: "book.fill",
                            color: .blue
                        )
                        
                        StatCard(
                            title: "Recompensas",
                            value: "\(stats.totalRewards)",
                            subtitle: "ganadas",
                            icon: "medal.fill",
                            color: .purple
                        )
                    }
                    
                    // Progreso por fases
                    VStack(alignment: .leading, spacing: 16) {
                        Text("Progreso por Fases")
                            .font(.headline)
                            .fontWeight(.bold)
                            .foregroundColor(.primary)
                        
                        ForEach(1...4, id: \.self) { phaseNumber in
                            PhaseProgressRow(
                                phaseNumber: phaseNumber,
                                progress: progressManager.getPhaseProgress(phaseNumber),
                                phaseName: getPhaseName(phaseNumber)
                            )
                        }
                    }
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 12)
                            .fill(Color(.systemGray6))
                    )
                    
                    // Configuraciones
                    VStack(alignment: .leading, spacing: 16) {
                        Text("Configuraciones")
                            .font(.headline)
                                        .fontWeight(.bold)
                            .foregroundColor(.primary)
                                    
                        VStack(spacing: 12) {
                            HStack {
                                Text("Notificaciones")
                                        .font(.body)
                                    .foregroundColor(.primary)
                                    
                                    Spacer()
                                
                                Toggle("", isOn: $progressManager.notificationsEnabled)
                                    .onChange(of: progressManager.notificationsEnabled) { enabled in
                                        progressManager.toggleNotifications(enabled)
                                    }
                            }
                            
                            if progressManager.notificationsEnabled {
                                HStack {
                                    Text("Hora de recordatorio")
                                        .font(.body)
                            .foregroundColor(.primary)
                        
                                    Spacer()
                                    
                                    DatePicker("", selection: $progressManager.reminderTime, displayedComponents: .hourAndMinute)
                                        .onChange(of: progressManager.reminderTime) { time in
                                            progressManager.updateReminderTime(time)
                                        }
                                }
                            }
                        }
                    }
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 12)
                            .fill(Color(.systemGray6))
                    )
                }
                .padding()
            }
            .navigationTitle("Estadísticas")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Cerrar") {
                        onClose()
                        dismiss()
                    }
                }
            }
        }
        .onAppear {
            progressManager.requestNotificationPermission()
        }
    }
    
    private func getPhaseName(_ phaseNumber: Int) -> String {
        switch phaseNumber {
        case 1: return "Conecta"
        case 2: return "Regula"
        case 3: return "Guía"
        case 4: return "Integra"
        default: return "Desconocida"
        }
    }
}

// MARK: - Stat Card
struct StatCard: View {
    let title: String
    let value: String
    let subtitle: String
    let icon: String
    let color: Color
    
    var body: some View {
        VStack(spacing: 8) {
            Image(systemName: icon)
                .font(.title2)
                .foregroundColor(color)
            
            Text(value)
                .font(.title2)
                .fontWeight(.bold)
                .foregroundColor(.primary)
            
            Text(title)
                .font(.caption)
                .fontWeight(.semibold)
                .foregroundColor(.primary)
                .multilineTextAlignment(.center)
            
            Text(subtitle)
                .font(.caption2)
                .foregroundColor(.secondary)
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(Color(.systemBackground))
                .shadow(color: .black.opacity(0.1), radius: 4, x: 0, y: 2)
        )
    }
}

// MARK: - Phase Progress Row
struct PhaseProgressRow: View {
    let phaseNumber: Int
    let progress: Double
    let phaseName: String
    
    var body: some View {
        HStack {
            Text("Fase \(phaseNumber)")
                .font(.subheadline)
                .fontWeight(.semibold)
                .foregroundColor(.primary)
            
            Text(phaseName)
                .font(.caption)
                .foregroundColor(.secondary)
            
            Spacer()
            
            HStack(spacing: 8) {
                ProgressView(value: progress)
                    .progressViewStyle(LinearProgressViewStyle(tint: getPhaseColor(phaseNumber)))
                    .frame(width: 100)
                
                Text("\(Int(progress * 100))%")
                .font(.caption)
                .fontWeight(.medium)
                    .foregroundColor(.secondary)
            }
        }
    }
    
    private func getPhaseColor(_ phaseNumber: Int) -> Color {
        switch phaseNumber {
        case 1: return .blue
        case 2: return .green
        case 3: return .orange
        case 4: return .purple
        default: return .gray
        }
    }
}

#Preview {
    Capa6PlanEntrenamientoView()
        .environmentObject(ProgresoManager())
}
