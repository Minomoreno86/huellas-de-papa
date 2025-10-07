import SwiftUI

// MARK: - Vista de Juegos de Conexión
// Juegos para hacer juntos padre-hijo basados en principios de Álvaro Bilbao

struct ConnectionGamesView: View {
    @State private var selectedGame: Capa8Game? = nil
    @State private var showingGameDetail = false
    
    // Juegos de ejemplo basados en principios de Bilbao
    private let sampleGames: [Capa8Game] = [
        Capa8Game(
            title: "Detén al Dragón",
            category: .brainEmotions,
            goal: "Entrenar autocontrol y co-regulación emocional",
            materials: ["Ninguno - solo imaginación"],
            steps: [
                "Pide a tu hijo que imagine que está muy enojado como un dragón",
                "Dile: 'Cuando seas un dragón, yo seré tu entrenador de calma'",
                "Cuando 'respire fuego', tú respira profundamente y dile que te copie",
                "Después de 3 respiraciones, celebra: '¡Dragón calmado!'"
            ],
            durationMinutes: 5,
            recommendedAge: "3-8 años",
            emotionalBenefit: "Desarrolla autocontrol y enseña técnicas de calma"
        ),
        Capa8Game(
            title: "Semáforo de Emociones",
            category: .brainEmotions,
            goal: "Identificar y regular emociones básicas",
            materials: ["Papel rojo, amarillo y verde (opcional)"],
            steps: [
                "Explícale: 'Rojo = muy enojado, Amarillo = un poco molesto, Verde = feliz y calmado'",
                "Haz gestos de cada emoción y pídele que adivine el color",
                "Pregúntale: '¿En qué color estás ahora?'",
                "Si está rojo o amarillo, practiquen respiraciones para llegar al verde"
            ],
            durationMinutes: 8,
            recommendedAge: "4-10 años",
            emotionalBenefit: "Mejora la conciencia emocional y autorregulación"
        ),
        Capa8Game(
            title: "Misión Astronauta",
            category: .languageAttachment,
            goal: "Practicar turnos, cooperación y comunicación",
            materials: ["Cohetes de juguete o cajas (opcional)"],
            steps: [
                "Digan: 'Somos astronautas en una misión especial'",
                "Tomen turnos para 'hablar con la base': 'Base, aquí astronauta [nombre]'",
                "Cada uno debe escuchar antes de responder",
                "Al final celebren: '¡Misión completada!'"
            ],
            durationMinutes: 10,
            recommendedAge: "3-7 años",
            emotionalBenefit: "Fortalece habilidades de comunicación y paciencia"
        )
    ]
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                // Header
                VStack(spacing: 12) {
                    HStack {
                        Image(systemName: "brain.head.profile")
                            .font(.title)
                            .foregroundColor(.blue)
                        
                        VStack(alignment: .leading, spacing: 4) {
                            Text("Juegos de Conexión")
                                .font(.title2)
                                .fontWeight(.bold)
                            
                            Text("Entrena el cerebro jugando juntos")
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                        }
                        
                        Spacer()
                    }
                    
                    Text("Estos juegos están diseñados para fortalecer las conexiones neuronales de tu hijo mientras fortaleces vuestro vínculo emocional.")
                        .font(.body)
                        .foregroundColor(.secondary)
                        .multilineTextAlignment(.leading)
                }
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 12)
                        .fill(Color.blue.opacity(0.1))
                )
                
                // Lista de juegos
                LazyVStack(spacing: 16) {
                    ForEach(sampleGames) { game in
                        GameCard(game: game) {
                            selectedGame = game
                            showingGameDetail = true
                        }
                    }
                }
            }
            .padding()
        }
        .navigationTitle("Juegos")
        .navigationBarTitleDisplayMode(.inline)
        .sheet(isPresented: $showingGameDetail) {
            if let game = selectedGame {
                GameDetailView(game: game)
            }
        }
    }
}

struct GameCard: View {
    let game: Capa8Game
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            VStack(alignment: .leading, spacing: 12) {
                HStack {
                    VStack(alignment: .leading, spacing: 4) {
                        Text(game.title)
                            .font(.headline)
                            .fontWeight(.semibold)
                            .foregroundColor(.primary)
                        
                        Text(game.goal)
                            .font(.body)
                            .foregroundColor(.secondary)
                            .multilineTextAlignment(.leading)
                    }
                    
                    Spacer()
                    
                    VStack(spacing: 4) {
                        Image(systemName: "clock")
                            .font(.caption)
                            .foregroundColor(.secondary)
                        
                        Text("\(game.durationMinutes) min")
                            .font(.caption)
                            .fontWeight(.medium)
                            .foregroundColor(.secondary)
                    }
                }
                
                HStack {
                    VStack(alignment: .leading, spacing: 2) {
                        Text("Edad: \(game.recommendedAge)")
                            .font(.caption)
                            .foregroundColor(.secondary)
                        
                        Text("Beneficio: \(game.emotionalBenefit)")
                            .font(.caption)
                            .foregroundColor(.blue)
                    }
                    
                    Spacer()
                    
                    Image(systemName: "play.circle.fill")
                        .font(.title2)
                        .foregroundColor(.blue)
                }
            }
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 12)
                    .fill(Color.white.opacity(0.8))
                    .shadow(color: .black.opacity(0.1), radius: 4, x: 0, y: 2)
            )
        }
        .buttonStyle(PlainButtonStyle())
    }
}

struct GameDetailView: View {
    let game: Capa8Game
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 24) {
                    // Header del juego
                    VStack(spacing: 16) {
                        HStack {
                            Image(systemName: "brain.head.profile")
                                .font(.largeTitle)
                                .foregroundColor(.blue)
                            
                            VStack(alignment: .leading, spacing: 4) {
                                Text(game.title)
                                    .font(.title2)
                                    .fontWeight(.bold)
                                
                                Text(game.goal)
                                    .font(.body)
                                    .foregroundColor(.secondary)
                            }
                            
                            Spacer()
                        }
                        
                        // Información del juego
                        HStack(spacing: 20) {
                            InfoChip(icon: "clock", text: "\(game.durationMinutes) min")
                            InfoChip(icon: "person", text: game.recommendedAge)
                            InfoChip(icon: "heart", text: game.category.rawValue)
                        }
                    }
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 16)
                            .fill(Color.blue.opacity(0.1))
                    )
                    
                    // Materiales necesarios
                    VStack(alignment: .leading, spacing: 12) {
                        Text("📦 Materiales Necesarios")
                            .font(.headline)
                            .fontWeight(.semibold)
                        
                        ForEach(game.materials, id: \.self) { material in
                            HStack {
                                Image(systemName: "checkmark.circle.fill")
                                    .foregroundColor(.green)
                                
                                Text(material)
                                    .font(.body)
                            }
                        }
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 12)
                            .fill(Color.green.opacity(0.1))
                    )
                    
                    // Pasos del juego
                    VStack(alignment: .leading, spacing: 16) {
                        Text("🎯 Cómo Jugar")
                            .font(.headline)
                            .fontWeight(.semibold)
                        
                        ForEach(Array(game.steps.enumerated()), id: \.offset) { index, step in
                            HStack(alignment: .top, spacing: 12) {
                                Text("\(index + 1)")
                                    .font(.headline)
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                                    .frame(width: 24, height: 24)
                                    .background(
                                        Circle()
                                            .fill(Color.blue)
                                    )
                                
                                Text(step)
                                    .font(.body)
                                    .foregroundColor(.primary)
                            }
                        }
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 12)
                            .fill(Color.white.opacity(0.8))
                            .shadow(color: .black.opacity(0.1), radius: 4, x: 0, y: 2)
                    )
                    
                    // Beneficio emocional
                    VStack(alignment: .leading, spacing: 12) {
                        Text("💡 Beneficio Emocional")
                            .font(.headline)
                            .fontWeight(.semibold)
                        
                        Text(game.emotionalBenefit)
                            .font(.body)
                            .foregroundColor(.secondary)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 12)
                            .fill(Color.orange.opacity(0.1))
                    )
                    
                    // Botón de acción
                    Button(action: {
                        // Marcar como completado
                        dismiss()
                    }) {
                        HStack {
                            Image(systemName: "checkmark.circle.fill")
                            Text("¡Juguemos Juntos!")
                        }
                        .font(.headline)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 12)
                                .fill(Color.blue)
                        )
                    }
                }
                .padding()
            }
            .navigationTitle("Juego")
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

struct InfoChip: View {
    let icon: String
    let text: String
    
    var body: some View {
        HStack(spacing: 4) {
            Image(systemName: icon)
                .font(.caption)
                .foregroundColor(.secondary)
            
            Text(text)
                .font(.caption)
                .fontWeight(.medium)
                .foregroundColor(.secondary)
        }
        .padding(.horizontal, 8)
        .padding(.vertical, 4)
        .background(
            RoundedRectangle(cornerRadius: 8)
                .fill(Color.white.opacity(0.8))
        )
    }
}

#Preview {
    ConnectionGamesView()
}

