import SwiftUI

// MARK: - Capa 8: Mini-juegos Reguladores
// Mini-juegos para co-regulación emocional y entrenamiento de pausa
// Diseño limpio y eficiente, sin animaciones excesivas

struct RegulatorGameView: View {
    @State private var selectedGame: Capa8ActivityCategory = .brainEmotions
    @State private var gameStarted = false
    @State private var timeRemaining = 0
    
    var body: some View {
        VStack(spacing: 20) {
            // Header
            VStack(spacing: 8) {
                Text("Juegos Reguladores")
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(.primary)
                
                Text("Ejercicios para calmar y regular emociones")
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
            
            // Selector de juegos
            gameSelector
            
            // Contenido del juego
            gameContent
            
            Spacer()
        }
        .padding()
    }
    
    private var gameSelector: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 12) {
                ForEach(Capa8ActivityCategory.allCases, id: \.self) { gameType in
                    Button(action: {
                        selectedGame = gameType
                        gameStarted = false
                    }) {
                        VStack(spacing: 8) {
                            Image(systemName: gameType.icon)
                                .font(.title2)
                                .foregroundColor(selectedGame == gameType ? .white : gameType.color)
                            
                            Text(gameType.rawValue)
                                .font(.caption)
                                .fontWeight(.medium)
                                .foregroundColor(selectedGame == gameType ? .white : gameType.color)
                        }
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 12)
                                .fill(selectedGame == gameType ? gameType.color : Color.gray.opacity(0.1))
                        )
                    }
                }
            }
            .padding(.horizontal)
        }
    }
    
    @ViewBuilder
    private var gameContent: some View {
        VStack(spacing: 16) {
            switch selectedGame {
            case .brainEmotions:
                Text("Juegos del Cerebro y Emociones - Próximamente")
                    .font(.title3)
                    .foregroundColor(.secondary)
            case .languageAttachment:
                Text("Juegos de Lenguaje y Apego - Próximamente")
                    .font(.title3)
                    .foregroundColor(.secondary)
            case .emotionalRolePlay:
                Text("Dramatización Emocional - Próximamente")
                    .font(.title3)
                    .foregroundColor(.secondary)
            case .dailyConnection:
                Text("Vínculo Diario - Próximamente")
                    .font(.title3)
                    .foregroundColor(.secondary)
            case .guidedStories:
                Text("Cuentos Guiados - Próximamente")
                    .font(.title3)
                    .foregroundColor(.secondary)
            }
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(Color.white.opacity(0.8))
                .shadow(color: .black.opacity(0.1), radius: 4, x: 0, y: 2)
        )
    }
}

// MARK: - Juegos Individuales

struct BreathingGameView: View {
    @Binding var gameStarted: Bool
    @Binding var timeRemaining: Int
    @State private var isBreathing = false
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Ejercicio de Respiración")
                .font(.headline)
                .fontWeight(.semibold)
            
            Text("Inhala y exhala siguiendo el ritmo del círculo")
                .font(.body)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
            
            // Círculo de respiración simple
            ZStack {
                Circle()
                    .stroke(Color.blue.opacity(0.3), lineWidth: 4)
                    .frame(width: 150, height: 150)
                
                Circle()
                    .stroke(Color.blue, lineWidth: 8)
                    .frame(width: 100, height: 100)
                    .scaleEffect(isBreathing ? 1.2 : 0.8)
                    .animation(.easeInOut(duration: 4), value: isBreathing)
            }
            
            Button(action: {
                gameStarted.toggle()
                isBreathing = gameStarted
            }) {
                Text(gameStarted ? "Detener" : "Comenzar")
                    .font(.body)
                    .fontWeight(.medium)
                    .foregroundColor(.white)
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 12)
                            .fill(gameStarted ? Color.red : Color.blue)
                    )
            }
        }
    }
}

struct RhythmGameView: View {
    @Binding var gameStarted: Bool
    @Binding var timeRemaining: Int
    @State private var tapCount = 0
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Juego de Ritmo")
                .font(.headline)
                .fontWeight(.semibold)
            
            Text("Toca el botón siguiendo el ritmo de tu corazón")
                .font(.body)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
            
            Text("Toques: \(tapCount)")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.green)
            
            Button(action: {
                tapCount += 1
            }) {
                Text("TOCAR")
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .frame(width: 120, height: 120)
                    .background(
                        Circle()
                            .fill(Color.green)
                    )
            }
            .disabled(!gameStarted)
            
            Button(action: {
                gameStarted.toggle()
                if !gameStarted {
                    tapCount = 0
                }
            }) {
                Text(gameStarted ? "Detener" : "Comenzar")
                    .font(.body)
                    .fontWeight(.medium)
                    .foregroundColor(.white)
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 12)
                            .fill(gameStarted ? Color.red : Color.green)
                    )
            }
        }
    }
}

struct PauseGameView: View {
    @Binding var gameStarted: Bool
    @Binding var timeRemaining: Int
    @State private var pauseTime = 30
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Ejercicio de Pausa")
                .font(.headline)
                .fontWeight(.semibold)
            
            Text("Simplemente... no hagas nada. Observa tu respiración")
                .font(.body)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
            
            Text("\(pauseTime)s")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(.purple)
            
            Button(action: {
                gameStarted.toggle()
                if gameStarted {
                    startTimer()
                }
            }) {
                Text(gameStarted ? "Detener" : "Comenzar Pausa")
                    .font(.body)
                    .fontWeight(.medium)
                    .foregroundColor(.white)
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 12)
                            .fill(gameStarted ? Color.red : Color.purple)
                    )
            }
        }
        .onReceive(Timer.publish(every: 1, on: .main, in: .common).autoconnect()) { _ in
            if gameStarted && pauseTime > 0 {
                pauseTime -= 1
            } else if pauseTime == 0 {
                gameStarted = false
                pauseTime = 30
            }
        }
    }
    
    private func startTimer() {
        pauseTime = 30
    }
}

struct ColorMatchGameView: View {
    @Binding var gameStarted: Bool
    @Binding var timeRemaining: Int
    @State private var selectedColor: Color?
    
    let colors: [(Color, String)] = [
        (.red, "Enojo"),
        (.blue, "Tristeza"),
        (.yellow, "Alegría"),
        (.green, "Calma")
    ]
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Colores y Emociones")
                .font(.headline)
                .fontWeight(.semibold)
            
            Text("Selecciona el color que representa cómo te sientes")
                .font(.body)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
            
            LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 2), spacing: 16) {
                ForEach(colors, id: \.1) { color, emotion in
                    Button(action: {
                        selectedColor = color
                    }) {
                        VStack(spacing: 8) {
                            Circle()
                                .fill(color)
                                .frame(width: 60, height: 60)
                                .overlay(
                                    Circle()
                                        .stroke(selectedColor == color ? Color.black : Color.clear, lineWidth: 3)
                                )
                            
                            Text(emotion)
                                .font(.caption)
                                .foregroundColor(.primary)
                        }
                    }
                }
            }
            
            if let selectedColor = selectedColor {
                Text("Has seleccionado: \(colors.first { $0.0 == selectedColor }?.1 ?? "")")
                    .font(.body)
                    .fontWeight(.medium)
                    .foregroundColor(.primary)
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 8)
                            .fill(selectedColor.opacity(0.2))
                    )
            }
        }
    }
}

struct SlowBlinkGameView: View {
    @Binding var gameStarted: Bool
    @Binding var timeRemaining: Int
    @State private var blinkCount = 0
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Parpadeo Lento")
                .font(.headline)
                .fontWeight(.semibold)
            
            Text("Parpadea lentamente para relajar tus ojos y mente")
                .font(.body)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
            
            Text("Parpadeos: \(blinkCount)")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.orange)
            
            Button(action: {
                blinkCount += 1
            }) {
                Text("PARPADEAR")
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 12)
                            .fill(Color.orange)
                    )
            }
            
            Button(action: {
                blinkCount = 0
            }) {
                Text("Reiniciar")
                    .font(.body)
                    .fontWeight(.medium)
                    .foregroundColor(.primary)
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 8)
                            .fill(Color.gray.opacity(0.2))
                    )
            }
        }
    }
}

#Preview {
    RegulatorGameView()
}