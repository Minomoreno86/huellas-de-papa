import SwiftUI

// Compatibilidad temporal con nuevos modelos Capa 4
typealias BrainSim = Capa4Simulation
typealias SimSessionState = Capa4ProgressMetrics
typealias SimNode = Capa4Scene
typealias SimOption = Capa4Option
typealias SimOutcome = Capa4Outcome
typealias SimContext = Capa4SimulationContext
typealias Threshold = Capa4Threshold
typealias SuccessLevel = Capa4SuccessLevel

// Estructura local para resultado, alineada a usos de esta vista
struct SimResult: Codable {
    let sessionId: String
    let brainSimId: String
    let finalScore: Double
    let outcome: SimOutcome
    let duration: TimeInterval
    let decisions: [Capa4Decision]
    let transferTip: String
    let completedAt: Date
}

// Extensiones de mapeo de nombres
extension Capa4SimulationContext {
    var childState: [String] { childStates }
    var parentStress: Int { parentStressLevel }
}

extension Capa4Simulation {
    // Provisiones vacías para mantener compatibilidad con la vista durante la migración
    var nodes: [SimNode] { [] }
    var outcomes: [SimOutcome] { [] }
}

struct BrainSimView: View {
    let simulacion: BrainSim
    @State private var sessionState: SimSessionState
    @State private var currentNode: SimNode?
    @State private var mostrarFeedback = false
    @State private var feedbackActual: String = ""
    @State private var explicacionNeuro: String = ""
    @State private var referenciaCapitulo: String = ""
    @State private var simulacionCompletada = false
    @State private var resultado: SimResult?
    @Environment(\.dismiss) private var dismiss
    
    init(simulacion: BrainSim) {
        self.simulacion = simulacion
        self._sessionState = State(initialValue: SimSessionState(
            connectionScore: 0,
            regulationScore: 0,
            limitScore: 0,
            currentSceneId: simulacion.startSceneId,
            decisions: []
        ))
    }
    
    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                // Header con puntuación
                HeaderSimulacionView(sessionState: sessionState)
                
                if simulacionCompletada {
                    ResultadoSimulacionView(
                        resultado: resultado,
                        simulacion: simulacion,
                        onCerrar: { dismiss() }
                    )
                } else {
                    // Contenido principal
                    ScrollView {
                        VStack(spacing: 20) {
                            // Contexto de la simulación
                            ContextoSimulacionView(context: simulacion.context)
                            
                            // Nodo actual (no disponible hasta integrar escenas nuevas)
                            if let node = currentNode {
                                NodoSimulacionView(
                                    node: node,
                                    onSeleccionarOpcion: seleccionarOpcion
                                )
                            }
                            
                            // Feedback
                            if mostrarFeedback {
                                FeedbackSimulacionView(
                                    feedback: feedbackActual,
                                    explicacionNeuro: explicacionNeuro,
                                    referenciaCapitulo: referenciaCapitulo
                                )
                                
                                // Botón Siguiente
                                Button(action: avanzarSiguiente) {
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
                                .padding(.top, 16)
                            }
                        }
                        .padding()
                    }
                }
            }
            .navigationTitle(simulacion.title)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Cerrar") {
                        dismiss()
                    }
                }
            }
            .onAppear {
                cargarNodoInicial()
            }
        }
    }
    
    private func cargarNodoInicial() {
        // Hasta integrar escenas reales, dejamos el nodo en nil para no romper
        currentNode = nil
    }
    
    private func seleccionarOpcion(_ opcion: SimOption) {
        // Actualizar puntuación (mapeo a métricas)
        sessionState.connectionScore += opcion.deltaConnection
        sessionState.regulationScore += opcion.deltaRegulation
        sessionState.limitScore += opcion.deltaLimit
        
        // Mostrar feedback
        feedbackActual = opcion.quickFeedback
        explicacionNeuro = opcion.neuroExplanation
        referenciaCapitulo = opcion.toolReference
        mostrarFeedback = true
        
        // Haptic feedback
        if opcion.deltaConnection > 0 || opcion.deltaRegulation > 0 || opcion.deltaLimit > 0 {
            let impactFeedback = UIImpactFeedbackGenerator(style: .medium)
            impactFeedback.impactOccurred()
        } else {
            let notificationFeedback = UINotificationFeedbackGenerator()
            notificationFeedback.notificationOccurred(.warning)
        }
    }
    
    private func avanzarSiguiente() {
        // Placeholder: hasta integrar escenas/outcomes nuevas
        completarSimulacion()
    }
    
    private func completarSimulacion() {
        // Determinar outcome mínimo (placeholder)
        let threshold = Threshold(connection: 0, regulation: 0, limit: 0)
        let outcome = SimOutcome(
            id: "placeholder",
            threshold: threshold,
            summary: "Resumen no disponible en esta vista (migración en progreso)",
            transferTip: "",
            successLevel: .acceptable,
            brainStateDescription: "",
            recommendedTools: [],
            specificGuidance: ""
        )
        
        // Crear resultado
        resultado = SimResult(
            sessionId: UUID().uuidString,
            brainSimId: simulacion.id,
            finalScore: Double((sessionState.connectionScore + sessionState.regulationScore + sessionState.limitScore) * 5),
            outcome: outcome,
            duration: 0,
            decisions: [],
            transferTip: outcome.transferTip,
            completedAt: Date()
        )
        
        simulacionCompletada = true
    }
}

// MARK: - Header de Simulación

struct HeaderSimulacionView: View {
    let sessionState: SimSessionState
    
    var body: some View {
        VStack(spacing: 12) {
            // Chips de puntuación
            HStack(spacing: 16) {
                ChipView(title: "CON", value: sessionState.connectionScore, color: .blue)
                ChipView(title: "REG", value: sessionState.regulationScore, color: .green)
                ChipView(title: "LIM", value: sessionState.limitScore, color: .orange)
                
                Spacer()
                
                VStack(alignment: .trailing, spacing: 4) {
                    Text("Nivel")
                        .font(.caption)
                        .fontWeight(.semibold)
                        .foregroundColor(.primary)
                    
                    Text("\((sessionState.connectionScore + sessionState.regulationScore + sessionState.limitScore) * 5)/100")
                        .font(.title3)
                        .fontWeight(.bold)
                        .foregroundColor(.blue)
                }
            }
            
            // Barra de progreso
            ProgressView(value: Double(sessionState.connectionScore + sessionState.regulationScore + sessionState.limitScore) / 20.0)
                .progressViewStyle(LinearProgressViewStyle(tint: .blue))
                .scaleEffect(x: 1, y: 2, anchor: .center)
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(Color(.systemGray6))
        )
        .padding(.horizontal)
    }
}

// MARK: - Chip de Puntuación

struct ChipView: View {
    let title: String
    let value: Int
    let color: Color
    
    var body: some View {
        HStack(spacing: 6) {
            Text(title)
                .font(.caption)
                .fontWeight(.medium)
                .foregroundColor(color)
            
            Text("\(value)")
                .font(.headline)
                .fontWeight(.bold)
                .foregroundColor(.primary)
        }
        .padding(.horizontal, 12)
        .padding(.vertical, 8)
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(color.opacity(0.1))
                .overlay(
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(color.opacity(0.3), lineWidth: 1)
                )
        )
    }
}

// MARK: - Contexto de Simulación

struct ContextoSimulacionView: View {
    let context: SimContext
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                Image(systemName: "info.circle")
                    .foregroundColor(.blue)
                Text("Contexto de la Situación")
                    .font(.headline)
                    .fontWeight(.semibold)
                    .foregroundColor(.blue)
            }
            
            VStack(alignment: .leading, spacing: 8) {
                HStack {
                    Image(systemName: "location")
                    Text("Lugar: \(context.place)")
                        .font(.subheadline)
                        .foregroundColor(.primary)
                }
                
                HStack {
                    Image(systemName: "clock")
                    Text("Hora: \(context.timeOfDay)")
                        .font(.subheadline)
                        .foregroundColor(.primary)
                }
                
                if !context.childState.isEmpty {
                    HStack {
                        Image(systemName: "person")
                        Text("Estado del niño: \(context.childState.joined(separator: ", "))")
                            .font(.subheadline)
                            .foregroundColor(.primary)
                    }
                }
                
                HStack {
                    Image(systemName: "gauge")
                    Text("Tu nivel de estrés: \(context.parentStress)/5")
                        .font(.subheadline)
                        .foregroundColor(.primary)
                }
            }
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(Color.blue.opacity(0.1))
                .overlay(
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(Color.blue.opacity(0.3), lineWidth: 1)
                )
        )
    }
}

// MARK: - Nodo de Simulación

struct NodoSimulacionView: View {
    let node: SimNode
    let onSeleccionarOpcion: (SimOption) -> Void
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            // Prompt de la situación
            Text(node.prompt)
                .font(.title3)
                .fontWeight(.medium)
                .foregroundColor(.primary)
                .multilineTextAlignment(.leading)
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 16)
                        .fill(Color(.systemGray6))
                )
            
            // Opciones de respuesta
            VStack(spacing: 12) {
                ForEach(node.options) { opcion in
                    Button(action: {
                        onSeleccionarOpcion(opcion)
                    }) {
                        HStack {
                            Text(opcion.text)
                                .font(.subheadline)
                                .foregroundColor(.primary)
                                .multilineTextAlignment(.leading)
                            
                            Spacer()
                        }
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 12)
                                .fill(Color(.systemBackground))
                                .shadow(color: .black.opacity(0.1), radius: 4, x: 0, y: 2)
                        )
                    }
                    .buttonStyle(PlainButtonStyle())
                }
            }
        }
    }
}

// MARK: - Feedback de Simulación

struct FeedbackSimulacionView: View {
    let feedback: String
    let explicacionNeuro: String
    let referenciaCapitulo: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack {
                Image(systemName: "brain.head.profile")
                    .foregroundColor(.purple)
                Text("Feedback Neurocientífico")
                    .font(.headline)
                    .fontWeight(.semibold)
                    .foregroundColor(.purple)
            }
            
            VStack(alignment: .leading, spacing: 12) {
                Text(feedback)
                    .font(.subheadline)
                    .foregroundColor(.primary)
                    .multilineTextAlignment(.leading)
                
                if !explicacionNeuro.isEmpty {
                    VStack(alignment: .leading, spacing: 8) {
                        Text("¿Por qué?")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .foregroundColor(.secondary)
                        
                        Text(explicacionNeuro)
                            .font(.caption)
                            .foregroundColor(.secondary)
                            .multilineTextAlignment(.leading)
                    }
                }
                
                if !referenciaCapitulo.isEmpty {
                    HStack {
                        Image(systemName: "book")
                            .foregroundColor(.blue)
                        Text(referenciaCapitulo)
                            .font(.caption)
                            .foregroundColor(.blue)
                    }
                }
            }
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(Color.purple.opacity(0.1))
                .overlay(
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(Color.purple.opacity(0.3), lineWidth: 1)
                )
        )
        .transition(.scale.combined(with: .opacity))
    }
}

// MARK: - Resultado de Simulación

struct ResultadoSimulacionView: View {
    let resultado: SimResult?
    let simulacion: BrainSim
    let onCerrar: () -> Void
    
    var body: some View {
        VStack(spacing: 24) {
            // Header del resultado
            VStack(spacing: 16) {
                Image(systemName: resultado?.outcome.successLevel == .excellent ? "checkmark.circle.fill" : "exclamationmark.circle.fill")
                    .font(.system(size: 60))
                    .foregroundColor(resultado?.outcome.successLevel == .excellent ? .green : .orange)
                
                Text("Simulación Completada")
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(.primary)
                
                if let resultado = resultado {
                    Text("Puntuación: \(Int(resultado.finalScore))/100")
                        .font(.title3)
                        .fontWeight(.semibold)
                        .foregroundColor(.blue)
                }
            }
            
            // Resumen del resultado
            if let resultado = resultado {
                VStack(alignment: .leading, spacing: 16) {
                    Text("Resultado")
                        .font(.headline)
                        .fontWeight(.semibold)
                        .foregroundColor(.primary)
                    
                    Text(resultado.outcome.summary)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                        .multilineTextAlignment(.leading)
                    
                    Text("Estado Cerebral")
                        .font(.headline)
                        .fontWeight(.semibold)
                        .foregroundColor(.primary)
                    
                    Text(resultado.outcome.brainStateDescription)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                        .multilineTextAlignment(.leading)
                }
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 16)
                        .fill(Color(.systemGray6))
                )
            }
            
            // Transfer tip
            if let resultado = resultado {
                VStack(alignment: .leading, spacing: 12) {
                    HStack {
                        Image(systemName: "house")
                            .foregroundColor(.green)
                        Text("Reto para Casa")
                            .font(.headline)
                            .fontWeight(.semibold)
                            .foregroundColor(.green)
                    }
                    
                    Text(resultado.transferTip)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                        .multilineTextAlignment(.leading)
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
            }
            
            // Botón de cerrar
            Button(action: onCerrar) {
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
        .padding()
    }
}

#if DEBUG && false
#Preview {
    // Desactivado temporalmente por migración de modelos Capa 4
    EmptyView()
}
#endif
