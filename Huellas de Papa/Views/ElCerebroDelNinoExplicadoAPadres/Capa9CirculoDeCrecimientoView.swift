import SwiftUI

struct Capa9CirculoDeCrecimientoView: View {
    @State private var circuloData = Capa9CirculoDeCrecimiento()
    @State private var selectedTab = 0
    
    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                // Header Motivacional
                headerView
                
                // Tab Selector
                tabSelector
                
                // Contenido Principal
                TabView(selection: $selectedTab) {
                    GrowthTreeView(tree: circuloData.tree, progress: circuloData.progress)
                        .tag(0)
                    
                    StageProgressView(stages: circuloData.stages, currentStage: circuloData.progress.currentStage)
                        .tag(1)
                    
                    MissionBoardView(missions: circuloData.missions)
                        .tag(2)
                    
                    BadgeGalleryView(badges: circuloData.badges)
                        .tag(3)
                    
                    EvolutionSummaryView(progress: circuloData.progress)
                        .tag(4)
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            }
            .navigationTitle("Círculo de Crecimiento")
            .navigationBarTitleDisplayMode(.large)
            .background(
                LinearGradient(
                    gradient: Gradient(colors: [Color.green.opacity(0.1), Color.mint.opacity(0.05)]),
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
            )
        }
    }
    
    private var headerView: some View {
        VStack(spacing: 12) {
            Text("Tu viaje de crecimiento continúa")
                .font(.title2)
                .fontWeight(.semibold)
                .foregroundColor(.primary)
            
            Text("Hoy cultivaste una nueva conexión de calma")
                .font(.subheadline)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
                .padding(.horizontal)
        }
        .padding(.vertical, 20)
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(Color.white.opacity(0.8))
                .shadow(color: .black.opacity(0.05), radius: 8, x: 0, y: 4)
        )
        .padding(.horizontal)
    }
    
    private var tabSelector: some View {
        HStack(spacing: 0) {
            ForEach(0..<5) { index in
                TabButton(
                    index: index,
                    selectedTab: $selectedTab,
                    icon: tabIcon(for: index),
                    title: tabTitle(for: index)
                )
            }
        }
        .padding(.horizontal)
        .padding(.bottom, 16)
    }
    
    private func tabIcon(for index: Int) -> String {
        switch index {
        case 0: return "tree.fill"
        case 1: return "chart.line.uptrend.xyaxis"
        case 2: return "target"
        case 3: return "star.fill"
        case 4: return "chart.pie.fill"
        default: return "circle.fill"
        }
    }
    
    private func tabTitle(for index: Int) -> String {
        switch index {
        case 0: return "Árbol"
        case 1: return "Etapas"
        case 2: return "Misiones"
        case 3: return "Logros"
        case 4: return "Resumen"
        default: return ""
        }
    }
}

// MARK: - Subcomponentes

struct TabButton: View {
    let index: Int
    @Binding var selectedTab: Int
    let icon: String
    let title: String
    
    var body: some View {
        Button(action: {
            withAnimation(.easeInOut(duration: 0.3)) {
                selectedTab = index
            }
        }) {
            VStack(spacing: 4) {
                Image(systemName: icon)
                    .font(.system(size: 20))
                    .foregroundColor(selectedTab == index ? .white : .secondary)
                
                Text(title)
                    .font(.caption2)
                    .fontWeight(.medium)
                    .foregroundColor(selectedTab == index ? .white : .secondary)
            }
            .frame(maxWidth: .infinity)
            .padding(.vertical, 12)
            .background(
                RoundedRectangle(cornerRadius: 12)
                    .fill(selectedTab == index ? 
                          AnyShapeStyle(LinearGradient(colors: [.green, .mint], startPoint: .leading, endPoint: .trailing)) : 
                          AnyShapeStyle(Color.clear)
                    )
            )
        }
        .buttonStyle(PlainButtonStyle())
    }
}

struct GrowthTreeView: View {
    let tree: Capa9Tree
    let progress: Capa9Progress
    
    var body: some View {
        ScrollView {
            VStack(spacing: 24) {
                // Árbol Animado
                ZStack {
                    // Tronco
                    RoundedRectangle(cornerRadius: 8)
                        .fill(
                            LinearGradient(
                                colors: [.brown.opacity(0.8), .brown.opacity(0.6)],
                                startPoint: .top,
                                endPoint: .bottom
                            )
                        )
                        .frame(width: 40, height: 120)
                        .shadow(color: .brown.opacity(0.3), radius: 4, x: 0, y: 2)
                    
                    // Hojas según el progreso
                    ForEach(0..<tree.leavesCount, id: \.self) { index in
                        Circle()
                            .fill(
                                LinearGradient(
                                    colors: treeColor(for: index),
                                    startPoint: .topLeading,
                                    endPoint: .bottomTrailing
                                )
                            )
                            .frame(width: 16, height: 16)
                            .offset(
                                x: CGFloat.random(in: -60...60),
                                y: CGFloat.random(in: -80 ... -20)
                            )
                            .scaleEffect(tree.isBlooming ? 1.2 : 1.0)
                            .animation(
                                .spring(response: 0.6, dampingFraction: 0.8)
                                .delay(Double(index) * 0.1),
                                value: tree.isBlooming
                            )
                    }
                }
                .frame(height: 200)
                .padding()
                
                // Estado del Árbol
                VStack(spacing: 12) {
                    Text("Tu Árbol de Crecimiento")
                        .font(.title2)
                        .fontWeight(.semibold)
                    
                    Text("Cada conexión, cada momento de calma, cada validación emocional hace crecer tu árbol de sabiduría parental.")
                        .font(.body)
                        .foregroundColor(.secondary)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal)
                    
                    // Métricas del Árbol
                    HStack(spacing: 20) {
                        VStack {
                            Text("\(tree.leavesCount)")
                                .font(.title)
                                .fontWeight(.bold)
                                .foregroundColor(.green)
                            Text("Hojas")
                                .font(.caption)
                                .foregroundColor(.secondary)
                        }
                        
                        VStack {
                            Text("\(progress.totalSessions)")
                                .font(.title)
                                .fontWeight(.bold)
                                .foregroundColor(.blue)
                            Text("Sesiones")
                                .font(.caption)
                                .foregroundColor(.secondary)
                        }
                        
                        VStack {
                            Text("\(Int(progress.totalConnectionMinutes / 60))")
                                .font(.title)
                                .fontWeight(.bold)
                                .foregroundColor(.purple)
                            Text("Min. Conexión")
                                .font(.caption)
                                .foregroundColor(.secondary)
                        }
                    }
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 16)
                            .fill(Color.white.opacity(0.8))
                            .shadow(color: .black.opacity(0.05), radius: 8, x: 0, y: 4)
                    )
                }
            }
            .padding()
        }
    }
    
    private func treeColor(for index: Int) -> [Color] {
        let colors: [[Color]] = [
            [.green, .mint],
            [.mint, .cyan],
            [.cyan, .blue],
            [.blue, .purple],
            [.purple, .pink]
        ]
        return colors[index % colors.count]
    }
}

struct StageProgressView: View {
    let stages: [Capa9Stage]
    let currentStage: String
    
    var body: some View {
        ScrollView {
            VStack(spacing: 24) {
                Text("Camino del Aprendizaje")
                    .font(.title2)
                    .fontWeight(.semibold)
                
                Text("Tu evolución como padre a través de las etapas de crecimiento")
                    .font(.body)
                    .foregroundColor(.secondary)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
                
                // Mapa Circular de Etapas Simplificado
                CircularStagesView(stages: Capa9CirculoDeCrecimiento.predefinedStages)
                
                // Etapa Actual
                VStack(spacing: 12) {
                    Text("Etapa Actual")
                        .font(.headline)
                        .fontWeight(.semibold)
                    
                    Text(currentStage)
                        .font(.title3)
                        .fontWeight(.bold)
                        .foregroundColor(.green)
                    
                    Text("Continúa tu viaje de crecimiento y transformación")
                        .font(.body)
                        .foregroundColor(.secondary)
                        .multilineTextAlignment(.center)
                }
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 16)
                        .fill(Color.white.opacity(0.8))
                        .shadow(color: .black.opacity(0.05), radius: 8, x: 0, y: 4)
                )
                .padding(.horizontal)
            }
            .padding()
        }
    }
}

struct CircularStagesView: View {
    let stages: [Capa9Stage]
    
    var body: some View {
        ZStack {
            // Círculo base
            Circle()
                .stroke(Color.gray.opacity(0.2), lineWidth: 4)
                .frame(width: 280, height: 280)
            
            // Etapas como puntos en el círculo
            ForEach(Array(stages.enumerated()), id: \.offset) { index, stage in
                StagePointView(stage: stage, index: index)
            }
        }
        .frame(height: 320)
    }
}

struct StagePointView: View {
    let stage: Capa9Stage
    let index: Int
    
    private var angle: Double {
        Double(index) * 2 * .pi / Double(Capa9CirculoDeCrecimiento.predefinedStages.count) - .pi / 2
    }
    
    private var radius: CGFloat { 120 }
    
    private var x: CGFloat { cos(angle) * radius }
    private var y: CGFloat { sin(angle) * radius }
    
    var body: some View {
        VStack(spacing: 4) {
            Circle()
                .fill(
                    LinearGradient(
                        colors: [stageColor(for: stage.colorTheme), stageColor(for: stage.colorTheme).opacity(0.6)],
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                )
                .frame(width: 40, height: 40)
                .overlay(
                    Image(systemName: stageIcon(for: index))
                        .font(.system(size: 16, weight: .semibold))
                        .foregroundColor(.white)
                )
                .shadow(color: stageColor(for: stage.colorTheme).opacity(0.3), radius: 8, x: 0, y: 4)
            
            Text(stage.title)
                .font(.caption)
                .fontWeight(.medium)
                .foregroundColor(.primary)
                .multilineTextAlignment(.center)
        }
        .offset(x: x, y: y)
    }
    
    private func stageColor(for colorTheme: String) -> Color {
        switch colorTheme {
        case "red": return .red
        case "blue": return .blue
        case "purple": return .purple
        case "green": return .green
        default: return .gray
        }
    }
    
    private func stageIcon(for index: Int) -> String {
        let icons = ["heart.fill", "brain.head.profile", "link.circle.fill", "leaf.fill"]
        return icons[index % icons.count]
    }
}

struct MissionBoardView: View {
    let missions: [Capa9Mission]
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                Text("Misiones de Conexión")
                    .font(.title2)
                    .fontWeight(.semibold)
                
                Text("Retos semanales basados en práctica real de conexión y crianza")
                    .font(.body)
                    .foregroundColor(.secondary)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
                
                // Misiones como tarjetas vivas
                ForEach(Capa9CirculoDeCrecimiento.predefinedMissions) { mission in
                    MissionCardView(mission: mission)
                }
            }
            .padding()
        }
    }
}

struct MissionCardView: View {
    let mission: Capa9Mission
    @State private var isExpanded = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                Image(systemName: mission.category.icon)
                    .font(.title2)
                    .foregroundColor(mission.category.color)
                
                VStack(alignment: .leading, spacing: 4) {
                    Text(mission.title)
                        .font(.headline)
                        .fontWeight(.semibold)
                    
                    Text(mission.description)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
                
                Spacer()
                
                Button(action: {
                    withAnimation(.spring(response: 0.5, dampingFraction: 0.8)) {
                        isExpanded.toggle()
                    }
                }) {
                    Image(systemName: isExpanded ? "chevron.up" : "chevron.down")
                        .font(.system(size: 14, weight: .semibold))
                        .foregroundColor(.secondary)
                }
            }
            
            if isExpanded {
                VStack(alignment: .leading, spacing: 8) {
                    Text("Acciones:")
                        .font(.subheadline)
                        .fontWeight(.medium)
                    
                    ForEach(mission.actions, id: \.self) { action in
                        HStack(alignment: .top, spacing: 8) {
                            Image(systemName: "checkmark.circle.fill")
                                .font(.caption)
                                .foregroundColor(.green)
                                .padding(.top, 2)
                            
                            Text(action)
                                .font(.caption)
                                .foregroundColor(.secondary)
                        }
                    }
                    
                    HStack {
                        Spacer()
                        Text("\(mission.durationDays) días")
                            .font(.caption)
                            .fontWeight(.medium)
                            .foregroundColor(.white)
                            .padding(.horizontal, 12)
                            .padding(.vertical, 6)
                            .background(
                                Capsule()
                                    .fill(mission.category.color)
                            )
                    }
                }
                .transition(.asymmetric(
                    insertion: .opacity.combined(with: .move(edge: .top)),
                    removal: .opacity.combined(with: .move(edge: .top))
                ))
            }
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(Color.white.opacity(0.8))
                .shadow(color: .black.opacity(0.05), radius: 8, x: 0, y: 4)
        )
    }
}

struct BadgeGalleryView: View {
    let badges: [Capa9Badge]
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                Text("Galería de Logros")
                    .font(.title2)
                    .fontWeight(.semibold)
                
                Text("Cada logro representa un momento de crecimiento y conexión")
                    .font(.body)
                    .foregroundColor(.secondary)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
                
                // Grid de badges
                LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 2), spacing: 16) {
                    ForEach(Capa9CirculoDeCrecimiento.predefinedBadges) { badge in
                        BadgeCardView(badge: badge)
                    }
                }
            }
            .padding()
        }
    }
}

struct BadgeCardView: View {
    let badge: Capa9Badge
    @State private var isGlowing = false
    
    var body: some View {
        VStack(spacing: 12) {
            ZStack {
                Circle()
                    .fill(
                        LinearGradient(
                            colors: badge.isUnlocked ? 
                                [badge.category.color, badge.category.color.opacity(0.6)] :
                                [Color.gray.opacity(0.3), Color.gray.opacity(0.1)],
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                    )
                    .frame(width: 60, height: 60)
                    .overlay(
                        Image(systemName: badge.symbol)
                            .font(.system(size: 24, weight: .semibold))
                            .foregroundColor(badge.isUnlocked ? .white : .gray)
                    )
                    .shadow(
                        color: badge.isUnlocked ? badge.category.color.opacity(0.3) : .clear,
                        radius: isGlowing ? 12 : 4,
                        x: 0,
                        y: 4
                    )
                    .scaleEffect(isGlowing ? 1.1 : 1.0)
                    .animation(
                        .easeInOut(duration: 2.0).repeatForever(autoreverses: true),
                        value: isGlowing
                    )
                    .onAppear {
                        if badge.isUnlocked {
                            isGlowing = true
                        }
                    }
                
                if badge.isUnlocked {
                    Image(systemName: "checkmark.circle.fill")
                        .font(.system(size: 20))
                        .foregroundColor(.white)
                        .background(
                            Circle()
                                .fill(badge.category.color)
                                .frame(width: 24, height: 24)
                        )
                        .offset(x: 25, y: -25)
                }
            }
            
            VStack(spacing: 4) {
                Text(badge.name)
                    .font(.headline)
                    .fontWeight(.semibold)
                    .foregroundColor(badge.isUnlocked ? .primary : .secondary)
                
                Text(badge.meaning)
                    .font(.caption)
                    .foregroundColor(.secondary)
                    .multilineTextAlignment(.center)
                    .lineLimit(2)
            }
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(Color.white.opacity(0.8))
                .shadow(color: .black.opacity(0.05), radius: 8, x: 0, y: 4)
        )
    }
}

struct EvolutionSummaryView: View {
    let progress: Capa9Progress
    
    var body: some View {
        ScrollView {
            VStack(spacing: 24) {
                Text("Resumen de Evolución")
                    .font(.title2)
                    .fontWeight(.semibold)
                
                Text("Tu transformación como padre presente")
                    .font(.body)
                    .foregroundColor(.secondary)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
                
                // Métricas Visuales
                VStack(spacing: 16) {
                    MetricCardView(
                        title: "Sesiones Completadas",
                        value: "\(progress.totalSessions)",
                        icon: "checkmark.circle.fill",
                        color: .green
                    )
                    
                    MetricCardView(
                        title: "Tiempo de Conexión",
                        value: "\(Int(progress.totalConnectionMinutes / 60)) min",
                        icon: "clock.fill",
                        color: .blue
                    )
                    
                    MetricCardView(
                        title: "Logros Desbloqueados",
                        value: "\(progress.badgesUnlocked)",
                        icon: "star.fill",
                        color: .yellow
                    )
                    
                    MetricCardView(
                        title: "Etapa Actual",
                        value: progress.currentStage,
                        icon: "chart.line.uptrend.xyaxis",
                        color: .purple
                    )
                }
                
                // Frase Motivacional
                VStack(spacing: 12) {
                    Text("💫")
                        .font(.system(size: 40))
                    
                    Text("Cada momento de conexión es una semilla de amor que florece en el corazón de tu hijo")
                        .font(.body)
                        .italic()
                        .foregroundColor(.secondary)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal)
                }
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 16)
                        .fill(
                            LinearGradient(
                                colors: [.mint.opacity(0.1), .green.opacity(0.1)],
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            )
                        )
                )
            }
            .padding()
        }
    }
}

struct MetricCardView: View {
    let title: String
    let value: String
    let icon: String
    let color: Color
    
    var body: some View {
        HStack(spacing: 16) {
            Image(systemName: icon)
                .font(.system(size: 24))
                .foregroundColor(color)
                .frame(width: 40, height: 40)
                .background(
                    Circle()
                        .fill(color.opacity(0.1))
                )
            
            VStack(alignment: .leading, spacing: 4) {
                Text(title)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                
                Text(value)
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(.primary)
            }
            
            Spacer()
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(Color.white.opacity(0.8))
                .shadow(color: .black.opacity(0.05), radius: 8, x: 0, y: 4)
        )
    }
}

#Preview {
    Capa9CirculoDeCrecimientoView()
}
