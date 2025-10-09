import SwiftUI

/// Vista principal de la Capa 9 (Círculo de Crecimiento)
/// Sistema de gamificación con medallas, etapas y progreso
struct CN9View: View {
    @State private var progress = CN9Progress()
    @State private var selectedBadge: CN9Badge?
    @State private var showingBadgeDetail = false
    
    var currentStage: CN9Stage? {
        cn9Stages.first { $0.level == progress.currentStageLevel }
    }
    
    var body: some View {
        ScrollView {
            VStack(spacing: 32) {
                // Header
                headerSection
                
                // Progress Overview
                progressSection
                
                // Current Stage
                currentStageSection
                
                // Badges
                badgesSection
                
                // Next Steps
                nextStepsSection
            }
            .padding()
        }
        .background(Color(.systemGroupedBackground))
        .navigationTitle("Círculo de Crecimiento")
        .navigationBarTitleDisplayMode(.large)
        .sheet(isPresented: $showingBadgeDetail) {
            if let badge = selectedBadge {
                CN9BadgeDetailView(badge: badge)
            }
        }
    }
    
    // MARK: - Header
    private var headerSection: some View {
        VStack(spacing: 16) {
            Text("🌳")
                .font(.system(size: 70))
            
            Text("Tu Viaje de Crecimiento")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundStyle(
                    LinearGradient(
                        colors: [.blue, .mint],
                        startPoint: .leading,
                        endPoint: .trailing
                    )
                )
            
            Text("Celebra tu progreso en dominar las 12 estrategias")
                .font(.title3)
                .fontWeight(.medium)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
        }
        .padding(.vertical)
    }
    
    // MARK: - Progress Section
    private var progressSection: some View {
        VStack(spacing: 20) {
            ZStack {
                Circle()
                    .stroke(Color.gray.opacity(0.2), lineWidth: 20)
                    .frame(width: 200, height: 200)
                
                Circle()
                    .trim(from: 0, to: progress.progressPercentage() / 100)
                    .stroke(
                        LinearGradient(
                            colors: [.blue, .mint],
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        ),
                        style: StrokeStyle(lineWidth: 20, lineCap: .round)
                    )
                    .frame(width: 200, height: 200)
                    .rotationEffect(.degrees(-90))
                    .animation(.spring(), value: progress.progressPercentage())
                
                VStack(spacing: 8) {
                    Text("\(progress.badgesUnlocked.count)")
                        .font(.system(size: 50, weight: .bold))
                        .foregroundColor(.blue)
                    
                    Text("de 12 medallas")
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
            }
            
            Text("\(Int(progress.progressPercentage()))% completado")
                .font(.title3)
                .fontWeight(.semibold)
                .foregroundColor(.blue)
        }
        .padding(24)
        .background(
            RoundedRectangle(cornerRadius: 20)
                .fill(
                    LinearGradient(
                        colors: [Color.blue.opacity(0.1), Color.mint.opacity(0.05)],
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                )
        )
    }
    
    // MARK: - Current Stage
    private var currentStageSection: some View {
        Group {
            if let stage = currentStage {
                VStack(alignment: .leading, spacing: 16) {
                    HStack {
                        Image(systemName: stage.icon)
                            .font(.system(size: 40))
                            .foregroundColor(colorFromString(stage.color))
                        
                        VStack(alignment: .leading, spacing: 4) {
                            Text("Nivel \(stage.level)")
                                .font(.caption)
                                .foregroundColor(.secondary)
                            
                            Text(stage.name)
                                .font(.title2)
                                .fontWeight(.bold)
                        }
                        
                        Spacer()
                    }
                    
                    Text(stage.description)
                        .font(.body)
                        .foregroundColor(.secondary)
                    
                    Divider()
                    
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Tus Características:")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                        
                        ForEach(stage.characteristics, id: \.self) { characteristic in
                            HStack(spacing: 8) {
                                Image(systemName: "checkmark.circle.fill")
                                    .foregroundColor(.green)
                                Text(characteristic)
                                    .font(.caption)
                            }
                        }
                    }
                }
                .padding(20)
                .background(
                    RoundedRectangle(cornerRadius: 16)
                        .fill(Color(.systemBackground))
                        .shadow(radius: 4)
                )
            }
        }
    }
    
    // MARK: - Badges Section
    private var badgesSection: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Las 12 Medallas de Maestría")
                .font(.title2)
                .fontWeight(.semibold)
            
            Text("Una por cada estrategia del libro de Daniel Siegel")
                .font(.subheadline)
                .foregroundColor(.secondary)
            
            LazyVGrid(columns: [
                GridItem(.flexible()),
                GridItem(.flexible()),
                GridItem(.flexible())
            ], spacing: 16) {
                ForEach(cn9Badges) { badge in
                    CN9BadgeCard(badge: badge, isUnlocked: progress.badgesUnlocked.contains(badge.id))
                        .onTapGesture {
                            selectedBadge = badge
                            showingBadgeDetail = true
                        }
                }
            }
        }
    }
    
    // MARK: - Next Steps
    private var nextStepsSection: some View {
        VStack(alignment: .leading, spacing: 16) {
            Label("Próximo Paso en Tu Viaje", systemImage: "arrow.right.circle.fill")
                .font(.headline)
                .fontWeight(.semibold)
                .foregroundColor(.blue)
            
            if let stage = currentStage {
                Text(stage.nextStepGoal)
                    .font(.body)
                    .foregroundColor(.primary)
            }
            
            Text("Recuerda: el objetivo no es perfección, sino progreso intencional. Cada paso cuenta.")
                .font(.caption)
                .foregroundColor(.secondary)
                .italic()
        }
        .padding(16)
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(Color.blue.opacity(0.1))
        )
    }
    
    private func colorFromString(_ colorName: String) -> Color {
        switch colorName {
        case "blue": return .blue
        case "green": return .green
        case "purple": return .purple
        case "orange": return .orange
        case "yellow": return .yellow
        default: return .blue
        }
    }
}

// MARK: - Badge Card
struct CN9BadgeCard: View {
    let badge: CN9Badge
    let isUnlocked: Bool
    
    var body: some View {
        VStack(spacing: 12) {
            ZStack {
                Circle()
                    .fill(isUnlocked ? colorFromString(badge.color) : Color.gray.opacity(0.3))
                    .frame(width: 70, height: 70)
                
                Image(systemName: badge.icon)
                    .font(.system(size: 30))
                    .foregroundColor(.white)
                    .opacity(isUnlocked ? 1.0 : 0.3)
            }
            
            VStack(spacing: 4) {
                Text("#\(badge.strategyNumber)")
                    .font(.caption2)
                    .fontWeight(.bold)
                    .foregroundColor(isUnlocked ? colorFromString(badge.color) : .gray)
                
                Text(badge.name)
                    .font(.caption)
                    .fontWeight(.semibold)
                    .foregroundColor(.primary)
                    .multilineTextAlignment(.center)
                    .lineLimit(2)
                    .fixedSize(horizontal: false, vertical: true)
            }
        }
        .padding(12)
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(Color(.systemBackground))
                .opacity(isUnlocked ? 1.0 : 0.7)
        )
    }
    
    private func colorFromString(_ colorName: String) -> Color {
        switch colorName {
        case "pink": return .pink
        case "blue": return .blue
        case "purple": return .purple
        case "indigo": return .indigo
        case "green": return .green
        case "cyan": return .cyan
        case "teal": return .teal
        case "yellow": return .yellow
        default: return .blue
        }
    }
}

/// Vista de detalle de medalla
struct CN9BadgeDetailView: View {
    let badge: CN9Badge
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 24) {
                    // Badge Icon
                    VStack(spacing: 16) {
                        ZStack {
                            Circle()
                                .fill(colorFromString(badge.color))
                                .frame(width: 120, height: 120)
                            
                            Image(systemName: badge.icon)
                                .font(.system(size: 50))
                                .foregroundColor(.white)
                        }
                        
                        Text("Estrategia #\(badge.strategyNumber)")
                            .font(.caption)
                            .foregroundColor(.secondary)
                        
                        Text(badge.name)
                            .font(.title)
                            .fontWeight(.bold)
                            .multilineTextAlignment(.center)
                    }
                    .padding(.vertical)
                    
                    // Description
                    VStack(alignment: .leading, spacing: 12) {
                        Label("Descripción", systemImage: "text.quote")
                            .font(.headline)
                        
                        Text(badge.description)
                            .font(.body)
                    }
                    .padding(16)
                    .background(
                        RoundedRectangle(cornerRadius: 12)
                            .fill(Color(.systemBackground))
                    )
                    
                    // Criteria
                    VStack(alignment: .leading, spacing: 12) {
                        Label("Cómo Desbloquear", systemImage: "flag.checkered")
                            .font(.headline)
                            .foregroundColor(colorFromString(badge.color))
                        
                        Text(badge.criteria)
                            .font(.body)
                    }
                    .padding(16)
                    .background(
                        RoundedRectangle(cornerRadius: 12)
                            .fill(colorFromString(badge.color).opacity(0.1))
                    )
                    
                    // Meaning
                    VStack(alignment: .leading, spacing: 12) {
                        Label("Significado", systemImage: "star.fill")
                            .font(.headline)
                            .foregroundColor(.orange)
                        
                        Text(badge.meaning)
                            .font(.body)
                            .fontWeight(.medium)
                    }
                    .padding(16)
                    .background(
                        RoundedRectangle(cornerRadius: 12)
                            .fill(Color.orange.opacity(0.1))
                    )
                }
                .padding()
            }
            .background(Color(.systemGroupedBackground))
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
    
    private func colorFromString(_ colorName: String) -> Color {
        switch colorName {
        case "pink": return .pink
        case "blue": return .blue
        case "purple": return .purple
        case "indigo": return .indigo
        case "green": return .green
        case "cyan": return .cyan
        case "teal": return .teal
        case "yellow": return .yellow
        default: return .blue
        }
    }
}

// MARK: - Preview
struct CN9View_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            CN9View()
        }
    }
}

