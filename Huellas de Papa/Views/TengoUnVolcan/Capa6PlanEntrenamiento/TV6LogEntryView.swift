import SwiftUI
import SwiftData

/// Formulario para registrar un volcán
struct TV6LogEntryView: View {
    @Environment(\.modelContext) private var modelContext
    @Environment(\.dismiss) private var dismiss
    
    @State private var childName = ""
    @State private var selectedPhase = "Chispa Inicial"
    @State private var selectedButton = "Botón de Frustración"
    @State private var selectedContext = "En casa"
    @State private var thoughtPattern = ""
    @State private var toolUsed: String? = nil
    @State private var toolEffective: Bool? = nil
    @State private var notes = ""
    
    var body: some View {
        NavigationStack {
            Form {
                // Sección 1: Información básica
                Section("¿Qué pasó?") {
                    TextField("Nombre del niño/a", text: $childName)
                    
                    Picker("Fase del volcán", selection: $selectedPhase) {
                        ForEach(TV6Data.volcanoPhases, id: \.self) { phase in
                            Text(phase).tag(phase)
                        }
                    }
                    
                    Picker("Botón presionado", selection: $selectedButton) {
                        ForEach(TV6Data.triggerButtons, id: \.self) { button in
                            Text(button).tag(button)
                        }
                    }
                    
                    Picker("Dónde ocurrió", selection: $selectedContext) {
                        ForEach(TV6Data.contexts, id: \.self) { context in
                            Text(context).tag(context)
                        }
                    }
                }
                
                // Sección 2: Análisis
                Section("Análisis (Opcional)") {
                    TextField("¿Qué nube de humo apareció?", text: $thoughtPattern, axis: .vertical)
                        .lineLimit(2...4)
                }
                
                // Sección 3: Herramienta
                Section("¿Usaste alguna herramienta?") {
                    Picker("Herramienta", selection: $toolUsed) {
                        Text("Ninguna").tag(nil as String?)
                        ForEach(TV6Data.availableTools, id: \.self) { tool in
                            Text(tool).tag(tool as String?)
                        }
                    }
                    
                    if toolUsed != nil {
                        Picker("¿Fue efectiva?", selection: $toolEffective) {
                            Text("No sé").tag(nil as Bool?)
                            Text("Sí, funcionó").tag(true as Bool?)
                            Text("No funcionó").tag(false as Bool?)
                        }
                    }
                }
                
                // Sección 4: Notas
                Section("Notas (Opcional)") {
                    TextField("Observaciones adicionales", text: $notes, axis: .vertical)
                        .lineLimit(3...6)
                }
            }
            .navigationTitle("Registrar Volcán")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancelar") {
                        dismiss()
                    }
                }
                
                ToolbarItem(placement: .confirmationAction) {
                    Button("Guardar") {
                        saveLog()
                    }
                    .disabled(childName.isEmpty)
                }
            }
        }
    }
    
    private func saveLog() {
        let newLog = TV6VolcanoLog(
            childName: childName,
            volcanoPhase: selectedPhase,
            triggerButton: selectedButton,
            toolUsed: toolUsed,
            toolEffective: toolEffective,
            context: selectedContext,
            notes: notes.isEmpty ? nil : notes
        )
        
        if !thoughtPattern.isEmpty {
            newLog.thoughtPattern = thoughtPattern
        }
        
        modelContext.insert(newLog)
        dismiss()
    }
}

#Preview {
    TV6LogEntryView()
        .modelContainer(for: TV6VolcanoLog.self, inMemory: true)
}

