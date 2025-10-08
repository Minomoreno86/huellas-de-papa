import SwiftUI

/// Vista de juego interactivo para niños
struct TV8GameView: View {
    let game: TV8Game
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        ScrollView {
            VStack(spacing: 32) {
                // Header del juego
                headerSection
                
                // Descripción
                descriptionSection
                
                // Instrucciones
                instructionsSection
                
                // Botón de jugar
                playButton
            }
            .padding()
        }
        .navigationTitle(game.title)
        .navigationBarTitleDisplayMode(.large)
        .background(
            LinearGradient(
                gradient: Gradient(colors: [gameColor.opacity(0.1), gameColor.opacity(0.05)]),
                startPoint: .top,
                endPoint: .bottom
            )
        )
    }
    
    // MARK: - Header
    private var headerSection: some View {
        VStack(spacing: 20) {
            ZStack {
                Circle()
                    .fill(gameColor.opacity(0.3))
                    .frame(width: 120, height: 120)
                
                Image(systemName: game.iconName)
                    .font(.system(size: 60))
                    .foregroundColor(gameColor)
            }
            
            Text("📚 Del libro")
                .font(.caption)
                .fontWeight(.semibold)
                .foregroundColor(.orange)
                .padding(.horizontal, 12)
                .padding(.vertical, 6)
                .background(
                    Capsule()
                        .fill(Color.orange.opacity(0.1))
                )
            
            HStack(spacing: 16) {
                Label("\(game.durationMinutes) min", systemImage: "clock.fill")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                
                Label(game.ageRange, systemImage: "person.2.fill")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
        }
        .frame(maxWidth: .infinity)
    }
    
    // MARK: - Description
    private var descriptionSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                Image(systemName: "info.circle.fill")
                    .foregroundColor(.blue)
                
                Text("¿De Qué Trata?")
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundColor(.primary)
            }
            
            Text(game.description)
                .font(.title3)
                .foregroundColor(.primary)
                .fixedSize(horizontal: false, vertical: true)
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(Color(.systemBackground))
                .shadow(color: Color.black.opacity(0.1), radius: 8, x: 0, y: 2)
        )
    }
    
    // MARK: - Instructions
    private var instructionsSection: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack {
                Image(systemName: "list.number")
                    .foregroundColor(gameColor)
                
                Text("Cómo Jugar")
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundColor(.primary)
            }
            
            VStack(alignment: .leading, spacing: 16) {
                ForEach(Array(game.instructions.enumerated()), id: \.offset) { index, instruction in
                    HStack(alignment: .top, spacing: 12) {
                        Text("\(index + 1)")
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .frame(width: 40, height: 40)
                            .background(
                                Circle()
                                    .fill(gameColor)
                            )
                        
                        Text(instruction)
                            .font(.title3)
                            .foregroundColor(.primary)
                            .fixedSize(horizontal: false, vertical: true)
                    }
                }
            }
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(Color(.systemBackground))
                .shadow(color: Color.black.opacity(0.1), radius: 8, x: 0, y: 2)
        )
    }
    
    // MARK: - Play Button
    private var playButton: some View {
        VStack(spacing: 16) {
            Text("¡Pídele a mamá o papá que juegue contigo!")
                .font(.title3)
                .fontWeight(.semibold)
                .foregroundColor(.primary)
                .multilineTextAlignment(.center)
            
            Button {
                // Aquí podrías agregar una acción futura (timer, etc.)
                dismiss()
            } label: {
                HStack {
                    Image(systemName: "play.fill")
                        .font(.title2)
                    
                    Text("¡Listo para Jugar!")
                        .font(.title3)
                        .fontWeight(.bold)
                }
                .foregroundColor(.white)
                .frame(maxWidth: .infinity)
                .padding(20)
                .background(
                    RoundedRectangle(cornerRadius: 16)
                        .fill(gameColor)
                )
            }
        }
        .padding()
    }
    
    // MARK: - Helper
    private var gameColor: Color {
        switch game.color {
        case "purple": return .purple
        case "red": return .red
        case "mint": return .mint
        case "green": return .green
        default: return .blue
        }
    }
}

#Preview {
    NavigationStack {
        TV8GameView(game: TV8Data.games[0])
    }
}

