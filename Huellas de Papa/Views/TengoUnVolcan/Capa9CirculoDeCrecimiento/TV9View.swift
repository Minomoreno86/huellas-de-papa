import SwiftUI
import SwiftData

/// Vista principal de la Capa 9 (Círculo de Crecimiento)
/// Resumen de logros y progreso en el módulo
struct TV9View: View {
    @Query private var badges: [TV9Badge]
    @Query private var progress: [TV9Progress]
    
    var body: some View {
        ScrollView {
            VStack(spacing: 32) {
                // Header
                headerSection
                
                // Progreso general
                overallProgressSection
                
                // Insignias/Logros
                badgesSection
                
                // Resumen del viaje
                journeySummarySection
                
                // Mensaje final
                finalMessageSection
            }
            .padding()
        }
        .navigationTitle("Tu Crecimiento")
        .navigationBarTitleDisplayMode(.large)
        .background(Color(.systemGroupedBackground))
    }
    
    // MARK: - Header
    private var headerSection: some View {
        VStack(spacing: 16) {
            ZStack {
                Circle()
                    .fill(
                        LinearGradient(
                            gradient: Gradient(colors: [.yellow.opacity(0.8), .orange.opacity(0.4)]),
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                    )
                    .frame(width: 120, height: 120)
                
                Image(systemName: "trophy.fill")
                    .font(.system(size: 60))
                    .foregroundColor(.white)
            }
            
            Text("Círculo de Crecimiento")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundStyle(
                    LinearGradient(
                        gradient: Gradient(colors: [.blue, .mint]),
                        startPoint: .leading,
                        endPoint: .trailing
                    )
                )
            
            Text("Tu viaje como domador de volcanes")
                .font(.title3)
                .fontWeight(.medium)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
        }
        .padding(.vertical)
    }
    
    // MARK: - Overall Progress
    private var overallProgressSection: some View {
        VStack(spacing: 20) {
            Text("Progreso en el Módulo")
                .font(.title2)
                .fontWeight(.semibold)
            
            // Círculo de progreso
            ZStack {
                Circle()
                    .stroke(Color.gray.opacity(0.2), lineWidth: 20)
                    .frame(width: 180, height: 180)
                
                Circle()
                    .trim(from: 0, to: currentProgress.progressPercentage)
                    .stroke(
                        LinearGradient(
                            gradient: Gradient(colors: [.green, .mint]),
                            startPoint: .top,
                            endPoint: .bottom
                        ),
                        style: StrokeStyle(lineWidth: 20, lineCap: .round)
                    )
                    .frame(width: 180, height: 180)
                    .rotationEffect(.degrees(-90))
                    .animation(.spring(), value: currentProgress.progressPercentage)
                
                VStack {
                    Text("\(Int(currentProgress.progressPercentage * 100))%")
                        .font(.system(size: 50))
                        .fontWeight(.bold)
                        .foregroundColor(.primary)
                    
                    Text("Completado")
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
            }
            
            // Stats
            HStack(spacing: 16) {
                statPill("\(currentProgress.capasCompletadas.count)/8", label: "Capas", icon: "books.vertical.fill", color: .blue)
                statPill("\(unlockedBadges.count)/12", label: "Logros", icon: "star.fill", color: .yellow)
            }
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 20)
                .fill(Color(.systemBackground))
                .shadow(color: Color.black.opacity(0.1), radius: 10, x: 0, y: 4)
        )
    }
    
    private func statPill(_ value: String, label: String, icon: String, color: Color) -> some View {
        VStack(spacing: 8) {
            Image(systemName: icon)
                .foregroundColor(color)
                .font(.title3)
            
            Text(value)
                .font(.title2)
                .fontWeight(.bold)
                .foregroundColor(.primary)
            
            Text(label)
                .font(.caption)
                .foregroundColor(.secondary)
        }
        .frame(maxWidth: .infinity)
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(color.opacity(0.1))
        )
    }
    
    // MARK: - Badges
    private var badgesSection: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Tus Logros")
                .font(.title2)
                .fontWeight(.semibold)
            
            LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 16) {
                ForEach(sortedBadges, id: \.title) { badge in
                    badgeCard(badge)
                }
            }
        }
    }
    
    private func badgeCard(_ badge: TV9Data.BadgeTemplate) -> some View {
        VStack(spacing: 12) {
            ZStack {
                Circle()
                    .fill(badgeColor(badge.color).opacity(isUnlocked(badge) ? 0.3 : 0.1))
                    .frame(width: 70, height: 70)
                
                Image(systemName: badge.iconName)
                    .font(.system(size: 35))
                    .foregroundColor(badgeColor(badge.color))
                    .opacity(isUnlocked(badge) ? 1.0 : 0.3)
            }
            
            Text(badge.title)
                .font(.caption)
                .fontWeight(.semibold)
                .foregroundColor(.primary)
                .multilineTextAlignment(.center)
                .lineLimit(2)
                .frame(height: 32)
            
            if isUnlocked(badge) {
                Image(systemName: "checkmark.seal.fill")
                    .foregroundColor(.green)
                    .font(.title3)
            } else {
                Image(systemName: "lock.fill")
                    .foregroundColor(.gray)
                    .font(.caption)
            }
        }
        .frame(maxWidth: .infinity)
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(Color(.systemBackground))
                .shadow(color: Color.black.opacity(0.1), radius: 6, x: 0, y: 2)
            )
            .overlay(
                RoundedRectangle(cornerRadius: 16)
                    .stroke(isUnlocked(badge) ? badgeColor(badge.color) : Color.clear, lineWidth: 2)
            )
    }
    
    // MARK: - Journey Summary
    private var journeySummarySection: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Tu Viaje")
                .font(.title2)
                .fontWeight(.semibold)
            
            ForEach(1...8, id: \.self) { capaNumber in
                capaRow(number: capaNumber)
            }
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(Color(.systemBackground))
                .shadow(color: Color.black.opacity(0.1), radius: 8, x: 0, y: 2)
        )
    }
    
    private func capaRow(number: Int) -> some View {
        let isCompleted = currentProgress.capasCompletadas.contains(number)
        
        return HStack(spacing: 12) {
            Image(systemName: isCompleted ? "checkmark.circle.fill" : "circle")
                .foregroundColor(isCompleted ? .green : .gray)
                .font(.title3)
            
            Text("Capa \(number): \(capaName(number))")
                .font(.subheadline)
                .foregroundColor(.primary)
                .strikethrough(isCompleted)
            
            Spacer()
        }
    }
    
    private func capaName(_ number: Int) -> String {
        switch number {
        case 1: return "Fundamentos"
        case 2: return "Principios"
        case 3: return "Herramientas"
        case 4: return "Simulaciones"
        case 5: return "Aplicación en Casa"
        case 6: return "Seguimiento"
        case 7: return "Autoevaluación"
        case 8: return "Modo Niño"
        default: return ""
        }
    }
    
    // MARK: - Final Message
    private var finalMessageSection: some View {
        VStack(spacing: 16) {
            Image(systemName: "heart.circle.fill")
                .font(.system(size: 60))
                .foregroundColor(.pink)
            
            Text("Mensaje del Hada del Volcán")
                .font(.title2)
                .fontWeight(.bold)
                .foregroundColor(.primary)
            
            if let randomMessage = TV9Data.motivationalMessages.randomElement() {
                Text(randomMessage)
                    .font(.title3)
                    .foregroundColor(.primary)
                    .italic()
                    .multilineTextAlignment(.center)
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 16)
                            .fill(Color.pink.opacity(0.1))
                    )
            }
            
            Text("Cada volcán gestionado es un paso hacia la fortaleza emocional. Sigue acompañando a tu hijo con amor y paciencia.")
                .font(.body)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
                .lineSpacing(6)
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 20)
                .fill(Color(.systemBackground))
                .shadow(color: Color.black.opacity(0.1), radius: 10, x: 0, y: 4)
        )
    }
    
    // MARK: - Helpers
    private var currentProgress: TV9Progress {
        progress.first ?? TV9Progress()
    }
    
    private var unlockedBadges: [TV9Data.BadgeTemplate] {
        TV9Data.badgeTemplates.filter { isUnlocked($0) }
    }
    
    private var sortedBadges: [TV9Data.BadgeTemplate] {
        TV9Data.badgeTemplates.sorted { isUnlocked($0) && !isUnlocked($1) }
    }
    
    private func isUnlocked(_ badge: TV9Data.BadgeTemplate) -> Bool {
        // Lógica simplificada - en producción verificaría contra datos reales
        switch badge.title {
        case "Conocedor del Volcán":
            return currentProgress.capasCompletadas.contains(1)
        case "Cazador de Nubes":
            return currentProgress.capasCompletadas.contains(2)
        case "Guardián de Herramientas":
            return currentProgress.capasCompletadas.contains(3)
        case "Domador de Volcanes":
            return currentProgress.capasCompletadas.count == 8
        default:
            return false
        }
    }
    
    private func badgeColor(_ colorName: String) -> Color {
        switch colorName {
        case "blue": return .blue
        case "purple": return .purple
        case "orange": return .orange
        case "mint": return .mint
        case "green": return .green
        case "pink": return .pink
        case "yellow": return .yellow
        default: return .blue
        }
    }
}

#Preview {
    NavigationStack {
        TV9View()
            .modelContainer(for: [TV9Badge.self, TV9Progress.self], inMemory: true)
    }
}

