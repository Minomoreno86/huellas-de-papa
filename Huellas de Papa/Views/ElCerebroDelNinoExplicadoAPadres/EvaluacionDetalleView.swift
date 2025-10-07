import SwiftUI
import Foundation

struct EvaluacionDetalleView: View {
    let tipo: TipoEvaluacion
    let items: [EvalItem]
    @ObservedObject var adaptiveSystem: EvaluationAdaptiveSystem
    
    @State private var itemActual: EvalItem?
    @State private var respuestaSeleccionada: Int?
    @State private var mostrarFeedback = false
    @State private var sesionCompletada = false
    @State private var tiempoInicio = Date()
    @Environment(\.dismiss) private var dismiss
    
    var itemsFiltrados: [EvalItem] {
        switch tipo {
        case .conocimiento:
            return items.filter { $0.type == .mcq || $0.type == .multi }
        case .habilidad:
            return items.filter { $0.type == .branch }
        case .consistencia:
            return items.filter { $0.type == .microReto }
        case .transferencia:
            return items.filter { $0.type == .transfer }
        case .completa:
            return items
        }
    }
    
    var body: some View {
        NavigationView {
            VStack {
                if sesionCompletada {
                    ResultadosEvaluacionView(
                        tipo: tipo,
                        adaptiveSystem: adaptiveSystem,
                        tiempoTotal: Date().timeIntervalSince(tiempoInicio)
                    )
                } else if let item = itemActual {
                    ItemEvaluacionView(
                        item: item,
                        respuestaSeleccionada: $respuestaSeleccionada,
                        mostrarFeedback: $mostrarFeedback,
                        onResponder: responderItem
                    )
                } else {
                    ProgressView("Preparando evaluación...")
                }
            }
            .navigationTitle(tipo.rawValue)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cerrar") {
                        dismiss()
                    }
                }
            }
            .onAppear {
                cargarSiguienteItem()
            }
        }
    }
    
    private func cargarSiguienteItem() {
        itemActual = adaptiveSystem.nextItem(from: itemsFiltrados)
        respuestaSeleccionada = nil
        mostrarFeedback = false
    }
    
    private func responderItem() {
        guard let item = itemActual,
              let respuesta = respuestaSeleccionada else { return }
        
        // Registrar respuesta
        let (deltaK, deltaH) = adaptiveSystem.registerMCQ(
            answer: respuesta,
            correct: item.correct?.first ?? 0,
            difficulty: item.difficulty
        )
        
        adaptiveSystem.updateScores(deltaK: deltaK, deltaH: deltaH)
        
        // Marcar como completado
        adaptiveSystem.sessionState.itemsCompleted.append(item.id)
        
        // Mostrar feedback
        mostrarFeedback = true
        
        // Verificar si hay más items
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            if adaptiveSystem.nextItem(from: itemsFiltrados) == nil {
                sesionCompletada = true
            } else {
                cargarSiguienteItem()
            }
        }
    }
}

struct ItemEvaluacionView: View {
    let item: EvalItem
    @Binding var respuestaSeleccionada: Int?
    @Binding var mostrarFeedback: Bool
    let onResponder: () -> Void
    
    var body: some View {
        ScrollView {
            VStack(spacing: 24) {
                // Header del item
                VStack(alignment: .leading, spacing: 12) {
                    HStack {
                        Image(systemName: tipoIcono)
                            .foregroundColor(tipoColor)
                        
                        Text(tipoTexto)
                            .font(.caption)
                            .fontWeight(.medium)
                            .foregroundColor(tipoColor)
                        
                        Spacer()
                        
                        Text("Dificultad: \(item.difficulty)/5")
                            .font(.caption)
                            .foregroundColor(.secondary)
                    }
                    
                    Text(item.prompt)
                        .font(.headline)
                        .fontWeight(.medium)
                }
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 16)
                        .fill(Color(.systemBackground))
                        .shadow(color: .black.opacity(0.1), radius: 8, x: 0, y: 4)
                )
                
                // Opciones de respuesta
                if let options = item.options {
                    VStack(spacing: 12) {
                        ForEach(Array(options.enumerated()), id: \.offset) { index, option in
                            Button(action: {
                                respuestaSeleccionada = index
                            }) {
                                HStack {
                                    Text(option)
                                        .font(.subheadline)
                                        .foregroundColor(.primary)
                                        .multilineTextAlignment(.leading)
                                    
                                    Spacer()
                                    
                                    if respuestaSeleccionada == index {
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
                                        .fill(respuestaSeleccionada == index ? Color.blue.opacity(0.1) : Color(.systemGray6))
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 12)
                                                .stroke(respuestaSeleccionada == index ? Color.blue : Color.clear, lineWidth: 2)
                                        )
                                )
                            }
                            .buttonStyle(PlainButtonStyle())
                        }
                    }
                } else if let branches = item.branches {
                    // Mostrar opciones de simulación ramificada
                    VStack(spacing: 12) {
                        ForEach(Array(branches.enumerated()), id: \.offset) { index, branch in
                            Button(action: {
                                respuestaSeleccionada = index
                            }) {
                                HStack {
                                    Text(branch.optionText)
                                        .font(.subheadline)
                                        .foregroundColor(.primary)
                                        .multilineTextAlignment(.leading)
                                    
                                    Spacer()
                                    
                                    if respuestaSeleccionada == index {
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
                                        .fill(respuestaSeleccionada == index ? Color.green.opacity(0.1) : Color(.systemGray6))
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 12)
                                                .stroke(respuestaSeleccionada == index ? Color.green : Color.clear, lineWidth: 2)
                                        )
                                )
                            }
                            .buttonStyle(PlainButtonStyle())
                        }
                    }
                } else if item.type == .microReto {
                    // Mostrar micro-reto con botón de completar
                    VStack(spacing: 16) {
                        HStack {
                            Image(systemName: "target")
                                .foregroundColor(.orange)
                            Text("Micro-Reto de 24h")
                                .font(.headline)
                                .fontWeight(.semibold)
                                .foregroundColor(.orange)
                        }
                        
                        Text("Hoy practica esta actividad con tu hijo:")
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                        
                        Text(item.prompt)
                            .font(.body)
                            .foregroundColor(.primary)
                            .multilineTextAlignment(.leading)
                            .padding()
                            .background(
                                RoundedRectangle(cornerRadius: 12)
                                    .fill(Color.orange.opacity(0.1))
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 12)
                                            .stroke(Color.orange.opacity(0.3), lineWidth: 1)
                                    )
                            )
                        
                        Button(action: {
                            respuestaSeleccionada = 0 // Marcar como completado
                        }) {
                            HStack {
                                Image(systemName: respuestaSeleccionada == 0 ? "checkmark.circle.fill" : "circle")
                                    .foregroundColor(respuestaSeleccionada == 0 ? .green : .orange)
                                Text(respuestaSeleccionada == 0 ? "Completado" : "Marcar como Completado")
                                    .font(.headline)
                                    .foregroundColor(respuestaSeleccionada == 0 ? .green : .orange)
                            }
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(
                                RoundedRectangle(cornerRadius: 12)
                                    .fill(respuestaSeleccionada == 0 ? Color.green.opacity(0.1) : Color.orange.opacity(0.1))
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 12)
                                            .stroke(respuestaSeleccionada == 0 ? Color.green : Color.orange, lineWidth: 2)
                                    )
                            )
                        }
                        .buttonStyle(PlainButtonStyle())
                    }
                } else if item.type == .transfer {
                    // Mostrar transfer test con campos de texto
                    VStack(spacing: 16) {
                        HStack {
                            Image(systemName: "house.fill")
                                .foregroundColor(.purple)
                            Text("Transfer Test - Vida Real")
                                .font(.headline)
                                .fontWeight(.semibold)
                                .foregroundColor(.purple)
                        }
                        
                        Text("Reflexiona sobre tu experiencia reciente:")
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                        
                        Text(item.prompt)
                            .font(.body)
                            .foregroundColor(.primary)
                            .multilineTextAlignment(.leading)
                            .padding()
                            .background(
                                RoundedRectangle(cornerRadius: 12)
                                    .fill(Color.purple.opacity(0.1))
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 12)
                                            .stroke(Color.purple.opacity(0.3), lineWidth: 1)
                                    )
                            )
                        
                        VStack(alignment: .leading, spacing: 12) {
                            Text("¿Qué técnica aplicaste?")
                                .font(.subheadline)
                                .fontWeight(.medium)
                            TextField("Describe la técnica que usaste...", text: .constant(""))
                                .textFieldStyle(.roundedBorder)
                            
                            Text("¿Qué tan efectiva fue? (1-5)")
                                .font(.subheadline)
                                .fontWeight(.medium)
                            HStack {
                                ForEach(1...5, id: \.self) { rating in
                                    Button(action: {
                                        respuestaSeleccionada = rating
                                    }) {
                                        Image(systemName: respuestaSeleccionada == rating ? "star.fill" : "star")
                                            .foregroundColor(respuestaSeleccionada == rating ? .yellow : .gray)
                                    }
                                    .buttonStyle(PlainButtonStyle())
                                }
                            }
                        }
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 12)
                                .fill(Color.purple.opacity(0.05))
                        )
                    }
                }
                
                // Botón de respuesta
                if respuestaSeleccionada != nil {
                    Button(action: onResponder) {
                        Text("Responder")
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
                
                // Feedback
                if mostrarFeedback {
                    if let branches = item.branches, let respuesta = respuestaSeleccionada, respuesta < branches.count {
                        // Feedback para simulaciones ramificadas
                        VStack(alignment: .leading, spacing: 12) {
                            HStack {
                                Image(systemName: "info.circle.fill")
                                    .foregroundColor(.blue)
                                
                                Text("Feedback")
                                    .font(.headline)
                                    .fontWeight(.semibold)
                                    .foregroundColor(.blue)
                            }
                            
                            Text(branches[respuesta].feedback)
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                            
                            if !item.chapterReference.isEmpty {
                                HStack {
                                    Image(systemName: "book")
                                        .foregroundColor(.blue)
                                    
                                    Text(item.chapterReference)
                                        .font(.caption)
                                        .foregroundColor(.blue)
                                }
                                .padding(.top, 8)
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
                        .transition(.scale.combined(with: .opacity))
                    } else if item.type == .microReto {
                        // Feedback para micro-retos
                        VStack(alignment: .leading, spacing: 12) {
                            HStack {
                                Image(systemName: "checkmark.circle.fill")
                                    .foregroundColor(.green)
                                
                                Text("¡Micro-Reto Completado!")
                                    .font(.headline)
                                    .fontWeight(.semibold)
                                    .foregroundColor(.green)
                            }
                            
                            Text(item.explanation)
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                            
                            if !item.chapterReference.isEmpty {
                                HStack {
                                    Image(systemName: "book")
                                        .foregroundColor(.green)
                                    
                                    Text(item.chapterReference)
                                        .font(.caption)
                                        .foregroundColor(.green)
                                }
                                .padding(.top, 8)
                            }
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
                        .transition(.scale.combined(with: .opacity))
                    } else if item.type == .transfer {
                        // Feedback para transfer tests
                        VStack(alignment: .leading, spacing: 12) {
                            HStack {
                                Image(systemName: "house.circle.fill")
                                    .foregroundColor(.purple)
                                
                                Text("Transferencia Registrada")
                                    .font(.headline)
                                    .fontWeight(.semibold)
                                    .foregroundColor(.purple)
                            }
                            
                            Text(item.explanation)
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                            
                            if !item.chapterReference.isEmpty {
                                HStack {
                                    Image(systemName: "book")
                                        .foregroundColor(.purple)
                                    
                                    Text(item.chapterReference)
                                        .font(.caption)
                                        .foregroundColor(.purple)
                                }
                                .padding(.top, 8)
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
                    } else {
                        // Feedback para preguntas normales
                        FeedbackView(
                            item: item,
                            respuesta: respuestaSeleccionada,
                            correcta: item.correct?.contains(respuestaSeleccionada ?? -1) ?? false
                        )
                    }
                }
            }
            .padding()
        }
    }
    
    var tipoIcono: String {
        switch item.type {
        case .mcq, .multi: return "questionmark.circle"
        case .branch: return "flowchart"
        case .microReto: return "target"
        case .transfer: return "house"
        case .journaling: return "book"
        case .order: return "list.number"
        }
    }
    
    var tipoColor: Color {
        switch item.type {
        case .mcq, .multi: return .blue
        case .branch: return .green
        case .microReto: return .orange
        case .transfer: return .purple
        case .journaling: return .indigo
        case .order: return .teal
        }
    }
    
    var tipoTexto: String {
        switch item.type {
        case .mcq: return "Pregunta de opción múltiple"
        case .multi: return "Selección múltiple"
        case .branch: return "Simulación"
        case .microReto: return "Micro-reto"
        case .transfer: return "Transferencia"
        case .journaling: return "Reflexión"
        case .order: return "Ordenar"
        }
    }
}

struct FeedbackView: View {
    let item: EvalItem
    let respuesta: Int?
    let correcta: Bool
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                Image(systemName: correcta ? "checkmark.circle.fill" : "xmark.circle.fill")
                    .foregroundColor(correcta ? .green : .red)
                
                Text(correcta ? "¡Correcto!" : "Incorrecto")
                    .font(.headline)
                    .fontWeight(.semibold)
                    .foregroundColor(correcta ? .green : .red)
            }
            
            Text(item.explanation)
                .font(.subheadline)
                .foregroundColor(.secondary)
            
            if !item.chapterReference.isEmpty {
                HStack {
                    Image(systemName: "book")
                        .foregroundColor(.blue)
                    
                    Text(item.chapterReference)
                        .font(.caption)
                        .foregroundColor(.blue)
                }
                .padding(.top, 8)
            }
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(correcta ? Color.green.opacity(0.1) : Color.red.opacity(0.1))
                .overlay(
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(correcta ? Color.green.opacity(0.3) : Color.red.opacity(0.3), lineWidth: 1)
                )
        )
        .transition(.scale.combined(with: .opacity))
    }
}

struct ResultadosEvaluacionView: View {
    let tipo: TipoEvaluacion
    @ObservedObject var adaptiveSystem: EvaluationAdaptiveSystem
    let tiempoTotal: TimeInterval
    
    var body: some View {
        ScrollView {
            VStack(spacing: 24) {
                // Header de resultados
                VStack(spacing: 16) {
                    Image(systemName: "trophy.fill")
                        .font(.largeTitle)
                        .foregroundColor(.yellow)
                    
                    Text("¡Evaluación Completada!")
                        .font(.title2)
                        .fontWeight(.bold)
                    
                    Text("Tiempo: \(formatearTiempo(tiempoTotal))")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 16)
                        .fill(Color(.systemBackground))
                        .shadow(color: .black.opacity(0.1), radius: 8, x: 0, y: 4)
                )
                
                // Puntuación actual
                VStack(alignment: .leading, spacing: 16) {
                    Text("Tu Puntuación")
                        .font(.headline)
                        .fontWeight(.semibold)
                    
                    HStack {
                        VStack(alignment: .leading) {
                            Text("Conocimiento (K)")
                                .font(.subheadline)
                            Text("\(Int(adaptiveSystem.moduleScore.K))/100")
                                .font(.title3)
                                .fontWeight(.bold)
                                .foregroundColor(.blue)
                        }
                        
                        Spacer()
                        
                        VStack(alignment: .leading) {
                            Text("Habilidad (H)")
                                .font(.subheadline)
                            Text("\(Int(adaptiveSystem.moduleScore.H))/100")
                                .font(.title3)
                                .fontWeight(.bold)
                                .foregroundColor(.green)
                        }
                    }
                    
                    HStack {
                        VStack(alignment: .leading) {
                            Text("Consistencia (C)")
                                .font(.subheadline)
                            Text("\(Int(adaptiveSystem.moduleScore.C))/100")
                                .font(.title3)
                                .fontWeight(.bold)
                                .foregroundColor(.orange)
                        }
                        
                        Spacer()
                        
                        VStack(alignment: .leading) {
                            Text("Transferencia (T)")
                                .font(.subheadline)
                            Text("\(Int(adaptiveSystem.moduleScore.T))/100")
                                .font(.title3)
                                .fontWeight(.bold)
                                .foregroundColor(.purple)
                        }
                    }
                    
                    Divider()
                    
                    HStack {
                        Text("Puntuación Total")
                            .font(.headline)
                            .fontWeight(.semibold)
                        
                        Spacer()
                        
                        Text("\(Int(adaptiveSystem.moduleScore.totalScore))/100")
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundColor(adaptiveSystem.moduleScore.level.color)
                    }
                    
                    Text("Nivel: \(adaptiveSystem.moduleScore.level.rawValue)")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 16)
                        .fill(Color(.systemBackground))
                        .shadow(color: .black.opacity(0.05), radius: 4, x: 0, y: 2)
                )
                
                // Recomendaciones
                RecomendacionesView(moduleScore: adaptiveSystem.moduleScore)
            }
            .padding()
        }
    }
    
    private func formatearTiempo(_ tiempo: TimeInterval) -> String {
        let minutos = Int(tiempo) / 60
        let segundos = Int(tiempo) % 60
        return String(format: "%d:%02d", minutos, segundos)
    }
}

struct RecomendacionesView: View {
    let moduleScore: ModuleScore
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Recomendaciones")
                .font(.headline)
                .fontWeight(.semibold)
            
            if moduleScore.K < 50 {
                RecomendacionCard(
                    icono: "brain.head.profile",
                    titulo: "Fortalece tu Conocimiento",
                    descripcion: "Revisa los fundamentos teóricos del desarrollo cerebral infantil",
                    color: .blue
                )
            }
            
            if moduleScore.H < 50 {
                RecomendacionCard(
                    icono: "hand.raised.fill",
                    titulo: "Practica las Habilidades",
                    descripcion: "Participa en más simulaciones para mejorar tu aplicación práctica",
                    color: .green
                )
            }
            
            if moduleScore.C < 50 {
                RecomendacionCard(
                    icono: "calendar.badge.clock",
                    titulo: "Mantén la Consistencia",
                    descripcion: "Completa los micro-retos diarios para desarrollar hábitos",
                    color: .orange
                )
            }
            
            if moduleScore.T < 50 {
                RecomendacionCard(
                    icono: "house.fill",
                    titulo: "Aplica en Casa",
                    descripcion: "Practica las técnicas en situaciones reales con tu familia",
                    color: .purple
                )
            }
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(Color(.systemBackground))
                .shadow(color: .black.opacity(0.05), radius: 4, x: 0, y: 2)
        )
    }
}

struct RecomendacionCard: View {
    let icono: String
    let titulo: String
    let descripcion: String
    let color: Color
    
    var body: some View {
        HStack(spacing: 12) {
            Image(systemName: icono)
                .font(.title2)
                .foregroundColor(color)
                .frame(width: 30)
            
            VStack(alignment: .leading, spacing: 4) {
                Text(titulo)
                    .font(.subheadline)
                    .fontWeight(.medium)
                
                Text(descripcion)
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
            
            Spacer()
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(color.opacity(0.1))
        )
    }
}

#Preview {
    EvaluacionDetalleView(
        tipo: TipoEvaluacion.conocimiento,
        items: [],
        adaptiveSystem: EvaluationAdaptiveSystem()
    )
}