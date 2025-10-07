import SwiftUI

// MARK: - Capa 8: Escena de Dramatización Guiada
// Permite practicar el rol invertido y el lenguaje validante
// Diseño limpio y eficiente, sin animaciones excesivas

struct RolePlayStageView: View {
    @State private var currentRolePlay: Capa8RolePlay?
    @State private var currentStep = 0
    @State private var isPlaying = false
    
    var body: some View {
        VStack(spacing: 20) {
            // Header
            VStack(spacing: 8) {
                Text("Dramatización Guiada")
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(.primary)
                
                Text("Practica el rol invertido y el lenguaje validante")
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
            
            if let rolePlay = currentRolePlay {
                rolePlayContent(rolePlay)
            } else {
                rolePlaySelection
            }
            
            Spacer()
        }
        .padding()
        .onAppear {
            loadSampleRolePlay()
        }
    }
    
    @ViewBuilder
    private var rolePlaySelection: some View {
        VStack(spacing: 16) {
            Text("Selecciona una dramatización")
                .font(.headline)
                .foregroundColor(.primary)
            
            Button(action: {
                loadSampleRolePlay()
            }) {
                HStack {
                    Image(systemName: "theatermasks.fill")
                        .foregroundColor(.white)
                    
                    Text("Soy pequeño y me da miedo la noche")
                        .foregroundColor(.white)
                        .fontWeight(.medium)
                }
                .padding()
                .background(Color.purple)
                .cornerRadius(12)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
    
    @ViewBuilder
    private func rolePlayContent(_ rolePlay: Capa8RolePlay) -> some View {
        VStack(spacing: 20) {
            // Título de la dramatización
            Text(rolePlay.title)
                .font(.headline)
                .fontWeight(.semibold)
                .foregroundColor(.primary)
                .multilineTextAlignment(.center)
            
            // Progreso
            HStack {
                ForEach(0..<rolePlay.scriptLines.count, id: \.self) { index in
                    Circle()
                        .fill(index <= currentStep ? Color.purple : Color.gray.opacity(0.3))
                        .frame(width: 8, height: 8)
                }
            }
            .padding(.vertical)
            
            // Contenido del paso actual
            if currentStep < rolePlay.scriptLines.count {
                VStack(spacing: 16) {
                    Text("Paso \(currentStep + 1) de \(rolePlay.scriptLines.count)")
                        .font(.caption)
                        .fontWeight(.semibold)
                        .foregroundColor(.secondary)
                    
                    Text("Frases que debes usar:")
                        .font(.subheadline)
                        .fontWeight(.medium)
                        .foregroundColor(.primary)
                    
                    Text(rolePlay.scriptLines[currentStep])
                        .font(.body)
                        .foregroundColor(.primary)
                        .multilineTextAlignment(.center)
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 12)
                                .fill(Color.purple.opacity(0.1))
                        )
                    
                    Text("Habilidad emocional: \(rolePlay.emotionalSkill)")
                        .font(.caption)
                        .foregroundColor(.secondary)
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 8)
                                .fill(Color.orange.opacity(0.1))
                        )
                }
            } else {
                // Fin de la dramatización
                VStack(spacing: 16) {
                    Text("¡Excelente trabajo!")
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(.green)
                    
                    Text("Consejo de reparación:")
                        .font(.subheadline)
                        .fontWeight(.medium)
                        .foregroundColor(.primary)
                    
                    Text(rolePlay.repairStep)
                        .font(.body)
                        .foregroundColor(.primary)
                        .multilineTextAlignment(.center)
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 12)
                                .fill(Color.green.opacity(0.1))
                        )
                }
            }
            
            // Controles
            HStack(spacing: 16) {
                if currentStep > 0 {
                    Button(action: {
                        currentStep -= 1
                    }) {
                        Text("Anterior")
                            .font(.body)
                            .fontWeight(.medium)
                            .foregroundColor(.primary)
                            .padding()
                            .background(
                                RoundedRectangle(cornerRadius: 12)
                                    .fill(Color.gray.opacity(0.2))
                            )
                    }
                }
                
                Spacer()
                
                if currentStep < rolePlay.scriptLines.count {
                    Button(action: {
                        currentStep += 1
                    }) {
                        Text("Siguiente")
                            .font(.body)
                            .fontWeight(.medium)
                            .foregroundColor(.white)
                            .padding()
                            .background(
                                RoundedRectangle(cornerRadius: 12)
                                    .fill(Color.purple)
                            )
                    }
                } else {
                    Button(action: {
                        currentStep = 0
                    }) {
                        Text("Repetir")
                            .font(.body)
                            .fontWeight(.medium)
                            .foregroundColor(.white)
                            .padding()
                            .background(
                                RoundedRectangle(cornerRadius: 12)
                                    .fill(Color.green)
                            )
                    }
                }
            }
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(Color.white.opacity(0.8))
                .shadow(color: .black.opacity(0.1), radius: 4, x: 0, y: 2)
        )
    }
    
    private func loadSampleRolePlay() {
        let sampleRolePlay = Capa8RolePlay(
            title: "Soy pequeño y me da miedo la noche",
            scenario: "Es hora de dormir pero el niño tiene miedo de la oscuridad",
            roles: ["Padre", "Niño"],
            scriptLines: [
                "Entiendo que tengas miedo. Es normal sentir miedo a la oscuridad.",
                "Estoy aquí contigo. No te va a pasar nada malo.",
                "¿Qué te ayudaría a sentirte más seguro? ¿Dejamos una luz tenue?"
            ],
            repairStep: "Después de calmar el miedo, puedes ofrecer un abrazo y recordarle que siempre estarás cerca si te necesita.",
            emotionalSkill: "Manejo del miedo"
        )
        
        currentRolePlay = sampleRolePlay
        currentStep = 0
    }
}

#Preview {
    RolePlayStageView()
}