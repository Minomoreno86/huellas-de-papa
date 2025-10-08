import SwiftUI
import SwiftData

/// Vista principal de la Capa 9 - Círculo de Crecimiento
struct C9View: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var trees: [C9GrowthTree]
    @Query private var progress: [C9Progress]
    @Query private var badges: [C9Badge]
    @State private var missions: [C9Mission] = C9Data.createMissions()
    @State private var showingReward = false
    @State private var lastGrowthEvent = ""
    
    var currentTree: C9GrowthTree {
        trees.first ?? C9GrowthTree()
    }
    
    var currentProgress: C9Progress {
        progress.first ?? C9Progress()
    }
    
    var activeMission: C9Mission? {
        missions.first { $0.active }
    }
    
    var unlockedBadges: [C9Badge] {
        badges.filter { $0.unlockedAt != nil }
    }
    
    var body: some View {
        ScrollView {
            VStack(spacing: 32) {
                // Header
                headerSection
                
                // Growth Tree
                YB9GrowthTreeView(tree: currentTree)
                
                // Mission Board
                missionBoardSection
                
                // Badge Gallery
                badgeGallerySection
                
                // Evolution Summary
                evolutionSummarySection
            }
            .padding()
        }
        .background(Color(.systemGroupedBackground).ignoresSafeArea())
        #if !os(macOS)
        .navigationBarTitleDisplayMode(.inline)
        #endif
        .sheet(isPresented: $showingReward) {
            C9SoftRewardModal(
                event: lastGrowthEvent,
                onDismiss: { showingReward = false }
            )
        }
        .onAppear {
            initializeDataIfNeeded()
        }
    }
    
    // MARK: - Header
    private var headerSection: some View {
        VStack(spacing: 16) {
            Image(systemName: "leaf.circle.fill")
                .font(.system(size: 50))
                .foregroundStyle(
                    LinearGradient(
                        colors: [.blue, .mint],
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                )
            
            Text("Círculo de Crecimiento")
                .font(.largeTitle)
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
                .foregroundStyle(
                    LinearGradient(
                        gradient: Gradient(colors: [.blue, .mint]),
                        startPoint: .leading,
                        endPoint: .trailing
                    )
                )
            
            Text("Tu crecimiento continúa")
                .font(.title3)
                .fontWeight(.medium)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
            
            if let mantra = getCurrentMantra() {
                Text(mantra)
                    .font(.subheadline)
                    .foregroundColor(.blue)
                    .italic()
                    .multilineTextAlignment(.center)
            }
        }
        .padding(.vertical)
    }
    
    // MARK: - Mission Board
    private var missionBoardSection: some View {
        VStack(alignment: .leading, spacing: 16) {
            Label("Misión semanal", systemImage: "target")
                .font(.title2)
                .fontWeight(.semibold)
                .foregroundColor(.primary)
            
            if let mission = activeMission {
                C9MissionCard(
                    mission: mission,
                    onObjectiveComplete: { objectiveIndex in
                        markObjectiveComplete(mission: mission, index: objectiveIndex)
                    }
                )
            } else {
                Button(action: {
                    activateNextMission()
                }) {
                    HStack {
                        Image(systemName: "plus.circle.fill")
                        Text("Activar nueva misión")
                            .fontWeight(.semibold)
                    }
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 16)
                            .fill(
                                LinearGradient(
                                    colors: [.blue, .mint],
                                    startPoint: .leading,
                                    endPoint: .trailing
                                )
                            )
                    )
                }
            }
        }
    }
    
    // MARK: - Badge Gallery
    private var badgeGallerySection: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack {
                Label("Insignias emocionales", systemImage: "seal.fill")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .foregroundColor(.primary)
                
                Spacer()
                
                Text("\(unlockedBadges.count)/\(badges.count)")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
            
            C9BadgeGalleryView(badges: badges)
        }
    }
    
    // MARK: - Evolution Summary
    private var evolutionSummarySection: some View {
        C9EvolutionSummaryView(
            progress: currentProgress,
            tree: currentTree
        )
    }
    
    // MARK: - Helpers
    private func initializeDataIfNeeded() {
        // Inicializar badges si no existen
        if badges.isEmpty {
            for badge in C9Data.createBadges() {
                modelContext.insert(badge)
            }
            try? modelContext.save()
        }
        
        // Activar primera misión si no hay ninguna activa
        if missions.first(where: { $0.active }) == nil {
            missions[0].active = true
        }
    }
    
    private func getCurrentMantra() -> String? {
        let stages = C9Data.createStages()
        let currentStage = stages.first { $0.name == currentProgress.currentStage }
        return currentStage?.mantra
    }
    
    private func markObjectiveComplete(mission: C9Mission, index: Int) {
        mission.progress += 1
        
        // Registrar crecimiento
        C9GrowthManager.registerGrowth(
            fromLayer: "Capa9",
            refId: mission.id,
            pillar: mission.pillar,
            event: "seed",
            context: modelContext
        )
        
        // Si completó la misión
        if mission.progress >= mission.objectives.count {
            lastGrowthEvent = "blossom"
            showingReward = true
            mission.active = false
            
            // Registrar hito mayor
            C9GrowthManager.registerGrowth(
                fromLayer: "Capa9",
                refId: mission.id,
                pillar: mission.pillar,
                event: "blossom",
                context: modelContext
            )
        }
    }
    
    private func activateNextMission() {
        if let nextMission = missions.first(where: { !$0.active && $0.progress == 0 }) {
            nextMission.active = true
            nextMission.progress = 0
        }
    }
}

// MARK: - Preview
struct C9View_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            C9View()
                .modelContainer(for: [C9GrowthTree.self, C9Progress.self, C9Badge.self, C9Links.self])
        }
    }
}

