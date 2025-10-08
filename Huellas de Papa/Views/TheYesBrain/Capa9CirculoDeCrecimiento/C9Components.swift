import SwiftUI

// MARK: - Growth Tree View
struct YB9GrowthTreeView: View {
    let tree: C9GrowthTree
    @State private var animate = false
    
    var body: some View {
        VStack(spacing: 16) {
            ZStack {
                // Background circles
                ForEach(0..<3) { index in
                    Circle()
                        .stroke(
                            LinearGradient(
                                colors: [.blue.opacity(0.2), .mint.opacity(0.1)],
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            ),
                            lineWidth: 2
                        )
                        .frame(width: CGFloat(120 + index * 40), height: CGFloat(120 + index * 40))
                        .scaleEffect(animate ? 1.0 : 0.95)
                        .animation(
                            .easeInOut(duration: 2.0 + Double(index) * 0.5)
                            .repeatForever(autoreverses: true),
                            value: animate
                        )
                }
                
                // Center tree
                VStack(spacing: 8) {
                    Image(systemName: tree.blossoms > 0 ? "leaf.fill" : "leaf")
                        .font(.system(size: 50))
                        .foregroundStyle(
                            LinearGradient(
                                colors: [.green, .mint],
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            )
                        )
                        .scaleEffect(animate ? 1.1 : 1.0)
                    
                    Text("Nivel \(tree.level)")
                        .font(.caption)
                        .fontWeight(.semibold)
                        .foregroundColor(.secondary)
                }
            }
            .frame(height: 200)
            .onAppear {
                animate = true
            }
            
            // Stats
            HStack(spacing: 24) {
                statItem(icon: "leaf.fill", value: tree.leaves, label: "Hojas", color: .green)
                statItem(icon: "flower.fill", value: tree.blossoms, label: "Flores", color: .pink)
            }
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 16)
                    .fill(Color(.systemBackground))
            )
        }
    }
    
    private func statItem(icon: String, value: Int, label: String, color: Color) -> some View {
        VStack(spacing: 8) {
            Image(systemName: icon)
                .font(.title2)
                .foregroundColor(color)
            
            Text("\(value)")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.primary)
            
            Text(label)
                .font(.caption)
                .foregroundColor(.secondary)
        }
    }
}

// MARK: - Mission Card
struct C9MissionCard: View {
    let mission: C9Mission
    let onObjectiveComplete: (Int) -> Void
    @State private var completedObjectives: Set<Int> = []
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack {
                Image(systemName: mission.icon)
                    .font(.title2)
                    .foregroundColor(missionColor)
                
                VStack(alignment: .leading, spacing: 4) {
                    Text(mission.title)
                        .font(.headline)
                        .foregroundColor(.primary)
                    
                    Text(mission.pillar)
                        .font(.caption)
                        .foregroundColor(missionColor)
                }
                
                Spacer()
            }
            
            Text(mission.missionDescription)
                .font(.subheadline)
                .foregroundColor(.secondary)
            
            Divider()
            
            VStack(alignment: .leading, spacing: 12) {
                Text("Objetivos")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                
                ForEach(mission.objectives.indices, id: \.self) { index in
                    objectiveRow(index: index)
                }
            }
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(Color(.systemBackground))
                .overlay(
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(missionColor.opacity(0.3), lineWidth: 2)
                )
        )
    }
    
    private func objectiveRow(index: Int) -> some View {
        Button(action: {
            if !completedObjectives.contains(index) {
                completedObjectives.insert(index)
                onObjectiveComplete(index)
                #if !os(macOS)
                UIImpactFeedbackGenerator(style: .light).impactOccurred()
                #endif
            }
        }) {
            HStack(spacing: 12) {
                Image(systemName: completedObjectives.contains(index) ? "checkmark.circle.fill" : "circle")
                    .foregroundColor(completedObjectives.contains(index) ? missionColor : .secondary)
                
                Text(mission.objectives[index])
                    .font(.subheadline)
                    .foregroundColor(completedObjectives.contains(index) ? .secondary : .primary)
                    .strikethrough(completedObjectives.contains(index))
                    .multilineTextAlignment(.leading)
            }
        }
        .buttonStyle(PlainButtonStyle())
    }
    
    private var missionColor: Color {
        switch mission.color {
        case "blue": return .blue
        case "green": return .green
        case "orange": return .orange
        case "pink": return .pink
        default: return .blue
        }
    }
}

// MARK: - Badge Gallery View
struct C9BadgeGalleryView: View {
    let badges: [C9Badge]
    
    var body: some View {
        LazyVGrid(columns: [
            GridItem(.flexible()),
            GridItem(.flexible())
        ], spacing: 16) {
            ForEach(badges, id: \.id) { badge in
                badgeCard(badge)
            }
        }
    }
    
    private func badgeCard(_ badge: C9Badge) -> some View {
        VStack(spacing: 12) {
            ZStack {
                Circle()
                    .fill(badge.unlockedAt != nil ? badgeColor(badge.color) : Color(.systemGray5))
                    .frame(width: 60, height: 60)
                
                Image(systemName: badge.symbol)
                    .font(.title2)
                    .foregroundColor(badge.unlockedAt != nil ? .white : .secondary)
            }
            
            Text(badge.name)
                .font(.caption)
                .fontWeight(.semibold)
                .foregroundColor(badge.unlockedAt != nil ? .primary : .secondary)
                .multilineTextAlignment(.center)
                .lineLimit(2)
            
            if badge.unlockedAt == nil {
                Text("Bloqueada")
                    .font(.caption2)
                    .foregroundColor(.secondary)
            }
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(Color(.systemBackground))
                .overlay(
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(
                            badge.unlockedAt != nil ? badgeColor(badge.color).opacity(0.3) : Color(.systemGray5),
                            lineWidth: 2
                        )
                )
        )
        .opacity(badge.unlockedAt != nil ? 1.0 : 0.5)
    }
    
    private func badgeColor(_ color: String) -> Color {
        switch color {
        case "blue": return .blue
        case "green": return .green
        case "orange": return .orange
        case "pink": return .pink
        default: return .blue
        }
    }
}

// MARK: - Evolution Summary View
struct C9EvolutionSummaryView: View {
    let progress: C9Progress
    let tree: C9GrowthTree
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Label("Tu evolución", systemImage: "chart.line.uptrend.xyaxis")
                .font(.title2)
                .fontWeight(.semibold)
                .foregroundColor(.primary)
            
            VStack(spacing: 12) {
                summaryRow(
                    icon: "calendar",
                    label: "Sesiones completadas",
                    value: "\(progress.totalSessions)",
                    color: .blue
                )
                
                if let dominant = progress.dominantPillar {
                    summaryRow(
                        icon: "star.fill",
                        label: "Pilar dominante",
                        value: dominant,
                        color: pillarColor(dominant)
                    )
                }
                
                summaryRow(
                    icon: "seal.fill",
                    label: "Insignias desbloqueadas",
                    value: "\(progress.badgesUnlocked)",
                    color: .green
                )
            }
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 16)
                    .fill(Color(.systemBackground))
            )
            
            Text("Sigue cultivando el cerebro Sí cada día. Tu constancia construye cerebros resilientes.")
                .font(.subheadline)
                .italic()
                .foregroundColor(.secondary)
                .multilineTextAlignment(.leading)
        }
    }
    
    private func summaryRow(icon: String, label: String, value: String, color: Color) -> some View {
        HStack {
            Image(systemName: icon)
                .foregroundColor(color)
            
            Text(label)
                .font(.subheadline)
                .foregroundColor(.secondary)
            
            Spacer()
            
            Text(value)
                .font(.subheadline)
                .fontWeight(.semibold)
                .foregroundColor(.primary)
        }
    }
    
    private func pillarColor(_ pillar: String) -> Color {
        switch pillar {
        case "Balance": return .blue
        case "Resiliencia": return .green
        case "Insight": return .orange
        case "Empatía": return .pink
        default: return .blue
        }
    }
}

// MARK: - Soft Reward Modal
struct C9SoftRewardModal: View {
    let event: String
    let onDismiss: () -> Void
    @State private var showContent = false
    
    var body: some View {
        ZStack {
            Color.black.opacity(0.4).ignoresSafeArea()
            
            VStack(spacing: 24) {
                Spacer()
                
                Image(systemName: eventIcon)
                    .font(.system(size: 80))
                    .foregroundStyle(
                        LinearGradient(
                            colors: [.green, .mint],
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                    )
                    .scaleEffect(showContent ? 1.0 : 0.0)
                    .animation(.spring(response: 0.6, dampingFraction: 0.6), value: showContent)
                
                if showContent {
                    VStack(spacing: 12) {
                        Text(eventTitle)
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(.primary)
                        
                        Text(eventMessage)
                            .font(.body)
                            .foregroundColor(.secondary)
                            .multilineTextAlignment(.center)
                    }
                    .transition(.opacity.combined(with: .move(edge: .bottom)))
                }
                
                Spacer()
                
                if showContent {
                    Button(action: onDismiss) {
                        Text("Continuar")
                            .font(.headline)
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(
                                RoundedRectangle(cornerRadius: 16)
                                    .fill(
                                        LinearGradient(
                                            colors: [.green, .mint],
                                            startPoint: .leading,
                                            endPoint: .trailing
                                        )
                                    )
                            )
                    }
                    .padding(.horizontal)
                    .transition(.opacity)
                }
            }
            .padding()
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                withAnimation {
                    showContent = true
                }
            }
            #if !os(macOS)
            UINotificationFeedbackGenerator().notificationOccurred(.success)
            #endif
        }
    }
    
    private var eventIcon: String {
        switch event {
        case "seed": return "sparkle"
        case "leaf": return "leaf.fill"
        case "blossom": return "flower.fill"
        default: return "leaf.fill"
        }
    }
    
    private var eventTitle: String {
        switch event {
        case "seed": return "Semilla plantada"
        case "leaf": return "Nueva hoja creció"
        case "blossom": return "¡Flor florecida!"
        default: return "Crecimiento"
        }
    }
    
    private var eventMessage: String {
        switch event {
        case "seed": return "Hoy elegiste conexión. Tu cerebro Sí está creciendo."
        case "leaf": return "Tu práctica constante fortalece el cerebro receptivo."
        case "blossom": return "Has alcanzado un hito importante. Tu familia crece contigo."
        default: return "Continúa cultivando el cerebro Sí."
        }
    }
}

// MARK: - Preview
struct YB9GrowthTreeView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            YB9GrowthTreeView(tree: C9GrowthTree(level: 3, leaves: 12, blossoms: 2))
        }
        .padding()
        .background(Color(.systemGroupedBackground))
    }
}

