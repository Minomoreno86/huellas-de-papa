import SwiftUI

/// Vista de desafíos semanales
struct BM9ChallengesView: View {
    @State private var challenges = challengesData
    @State private var selectedChallenge: BM9Challenge?
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                headerSection
                activeChallengeSection
                availableChallengesSection
            }
            .padding()
        }
        .background(Color(.systemGroupedBackground))
        .navigationTitle("Desafíos")
        .sheet(item: $selectedChallenge) { challenge in
            ChallengeDetailView(challenge: challenge)
        }
    }
    
    private var headerSection: some View {
        VStack(spacing: 12) {
            Image(systemName: "target")
                .font(.system(size: 50))
                .foregroundStyle(
                    LinearGradient(
                        colors: [.orange, .red],
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                )
            
            Text("Desafíos Semanales")
                .font(.title)
                .fontWeight(.bold)
            
            Text("Retos prácticos para fortalecer tu crianza con apego")
                .font(.subheadline)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
        }
        .padding()
    }
    
    private var activeChallengeSection: some View {
        Group {
            if let activeChallenge = challenges.first(where: { $0.isActive }) {
                VStack(alignment: .leading, spacing: 16) {
                    Label("Desafío Activo", systemImage: "flame.fill")
                        .font(.headline)
                        .foregroundColor(.orange)
                    
                    ActiveChallengeCard(challenge: activeChallenge)
                }
            } else {
                VStack(spacing: 12) {
                    Image(systemName: "target")
                        .font(.largeTitle)
                        .foregroundColor(.gray)
                    
                    Text("No tienes desafío activo")
                        .font(.headline)
                        .foregroundColor(.secondary)
                    
                    Text("Elige uno de abajo para comenzar")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 16)
                        .fill(Color(.systemBackground))
                )
            }
        }
    }
    
    private var availableChallengesSection: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Desafíos Disponibles")
                .font(.headline)
                .foregroundColor(.primary)
            
            ForEach(challenges.filter { !$0.isActive }) { challenge in
                Button(action: {
                    selectedChallenge = challenge
                }) {
                    BM9ChallengeCard(challenge: challenge)
                }
            }
        }
    }
}

// MARK: - BM9 Challenge Card
struct BM9ChallengeCard: View {
    let challenge: BM9Challenge
    @State private var isExpanded = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack(spacing: 16) {
                Image(systemName: challenge.icon)
                    .font(.system(size: 35))
                    .foregroundColor(colorFromString(challenge.color))
                    .frame(width: 60, height: 60)
                    .background(Circle().fill(colorFromString(challenge.color).opacity(0.2)))
                
                VStack(alignment: .leading, spacing: 8) {
                    Text(challenge.title)
                        .font(.headline)
                        .foregroundColor(.primary)
                    
                    Text(challenge.description)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                        .lineLimit(2)
                    
                    HStack {
                        Label(challenge.duration, systemImage: "clock")
                            .font(.caption)
                            .foregroundColor(.blue)
                        
                        Spacer()
                        
                        Label("\(challenge.reward) pts", systemImage: "star.fill")
                            .font(.caption)
                            .foregroundColor(.yellow)
                    }
                }
            }
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 18)
                .fill(Color(.systemBackground))
                .shadow(color: colorFromString(challenge.color).opacity(0.2), radius: 8)
        )
    }
    
    private func colorFromString(_ colorString: String) -> Color {
        switch colorString {
        case "orange": return .orange
        case "blue": return .blue
        case "mint": return .mint
        case "purple": return .purple
        case "pink": return .pink
        case "green": return .green
        default: return .orange
        }
    }
}

// MARK: - Active Challenge Card
struct ActiveChallengeCard: View {
    let challenge: BM9Challenge
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack {
                Image(systemName: challenge.icon)
                    .font(.system(size: 30))
                    .foregroundColor(colorFromString(challenge.color))
                
                VStack(alignment: .leading, spacing: 4) {
                    Text(challenge.title)
                        .font(.headline)
                        .fontWeight(.bold)
                    
                    Text(challenge.duration)
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
                
                Spacer()
            }
            
            // Progress
            VStack(alignment: .leading, spacing: 8) {
                HStack {
                    Text("Progreso")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                    Spacer()
                    Text("\(challenge.tasks.filter { $0.isCompleted }.count)/\(challenge.tasks.count)")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                }
                
                ProgressView(value: Double(challenge.tasks.filter { $0.isCompleted }.count), total: Double(challenge.tasks.count))
                    .tint(colorFromString(challenge.color))
            }
            
            // Tasks
            VStack(spacing: 8) {
                ForEach(challenge.tasks.prefix(3)) { task in
                    HStack {
                        Image(systemName: task.isCompleted ? "checkmark.circle.fill" : "circle")
                            .foregroundColor(task.isCompleted ? .green : .gray)
                        Text(task.description)
                            .font(.caption)
                            .foregroundColor(.primary)
                            .lineLimit(1)
                    }
                }
            }
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(
                    LinearGradient(
                        gradient: Gradient(colors: [
                            colorFromString(challenge.color).opacity(0.1),
                            colorFromString(challenge.color).opacity(0.05)
                        ]),
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                )
        )
    }
    
    private func colorFromString(_ colorString: String) -> Color {
        switch colorString {
        case "orange": return .orange
        case "blue": return .blue
        case "mint": return .mint
        case "purple": return .purple
        case "pink": return .pink
        case "green": return .green
        default: return .orange
        }
    }
}

// MARK: - Challenge Detail View
struct ChallengeDetailView: View {
    let challenge: BM9Challenge
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 24) {
                    // Header
                    VStack(spacing: 16) {
                        Image(systemName: challenge.icon)
                            .font(.system(size: 70))
                            .foregroundColor(colorFromString(challenge.color))
                        
                        Text(challenge.title)
                            .font(.title)
                            .fontWeight(.bold)
                            .multilineTextAlignment(.center)
                        
                        Text(challenge.description)
                            .font(.body)
                            .foregroundColor(.secondary)
                            .multilineTextAlignment(.center)
                    }
                    
                    // Duration and reward
                    HStack(spacing: 20) {
                        VStack {
                            Image(systemName: "clock")
                                .font(.title2)
                            Text(challenge.duration)
                                .font(.caption)
                        }
                        .foregroundColor(.blue)
                        
                        Divider()
                            .frame(height: 40)
                        
                        VStack {
                            Image(systemName: "star.fill")
                                .font(.title2)
                            Text("\(challenge.reward) pts")
                                .font(.caption)
                        }
                        .foregroundColor(.yellow)
                    }
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 12)
                            .fill(Color(.secondarySystemGroupedBackground))
                    )
                    
                    // Tasks
                    VStack(alignment: .leading, spacing: 12) {
                        Text("Tareas del Desafío")
                            .font(.headline)
                        
                        ForEach(challenge.tasks) { task in
                            HStack(alignment: .top, spacing: 12) {
                                Image(systemName: task.isCompleted ? "checkmark.circle.fill" : "circle")
                                    .foregroundColor(task.isCompleted ? .green : .gray)
                                    .font(.title3)
                                
                                Text(task.description)
                                    .font(.body)
                                    .foregroundColor(.primary)
                            }
                            .padding()
                            .background(
                                RoundedRectangle(cornerRadius: 12)
                                    .fill(Color(.secondarySystemGroupedBackground))
                            )
                        }
                    }
                    
                    // Action button
                    Button(action: {
                        // Activar desafío
                        dismiss()
                    }) {
                        Text("Comenzar Desafío")
                            .font(.headline)
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(
                                RoundedRectangle(cornerRadius: 12)
                                    .fill(
                                        LinearGradient(
                                            colors: [colorFromString(challenge.color), colorFromString(challenge.color).opacity(0.7)],
                                            startPoint: .leading,
                                            endPoint: .trailing
                                        )
                                    )
                            )
                    }
                }
                .padding()
            }
            .background(Color(.systemGroupedBackground))
            .navigationTitle("Desafío")
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
    
    private func colorFromString(_ colorString: String) -> Color {
        switch colorString {
        case "orange": return .orange
        case "blue": return .blue
        case "mint": return .mint
        case "purple": return .purple
        case "pink": return .pink
        case "green": return .green
        default: return .orange
        }
    }
}

// MARK: - CHALLENGES DATA (12 desafíos semanales)
let challengesData: [BM9Challenge] = [
    BM9Challenge(
        number: 1,
        title: "Semana del Contacto Infinito",
        description: "Portear, cargar o mantener contacto físico al menos 2 horas diarias con tu hijo",
        icon: "figure.and.child.holdinghands",
        color: "blue",
        duration: "7 días consecutivos",
        tasks: [
            ChallengeTask(description: "Día 1: Mínimo 2 horas de contacto físico directo"),
            ChallengeTask(description: "Día 2: Mínimo 2 horas de contacto físico directo"),
            ChallengeTask(description: "Día 3: Mínimo 2 horas de contacto físico directo"),
            ChallengeTask(description: "Día 4: Mínimo 2 horas de contacto físico directo"),
            ChallengeTask(description: "Día 5: Mínimo 2 horas de contacto físico directo"),
            ChallengeTask(description: "Día 6: Mínimo 2 horas de contacto físico directo"),
            ChallengeTask(description: "Día 7: Mínimo 2 horas de contacto físico directo")
        ],
        reward: 50
    ),
    
    BM9Challenge(
        number: 2,
        title: "7 Días de Voz Calmada",
        description: "No gritar ni una sola vez durante una semana completa, manteniendo voz calmada incluso en momentos difíciles",
        icon: "speaker.slash.fill",
        color: "mint",
        duration: "7 días consecutivos",
        tasks: [
            ChallengeTask(description: "Día 1: Cero gritos, solo voz calmada"),
            ChallengeTask(description: "Día 2: Cero gritos, solo voz calmada"),
            ChallengeTask(description: "Día 3: Cero gritos, solo voz calmada"),
            ChallengeTask(description: "Día 4: Cero gritos, solo voz calmada"),
            ChallengeTask(description: "Día 5: Cero gritos, solo voz calmada"),
            ChallengeTask(description: "Día 6: Cero gritos, solo voz calmada"),
            ChallengeTask(description: "Día 7: Cero gritos, solo voz calmada")
        ],
        reward: 75
    ),
    
    BM9Challenge(
        number: 3,
        title: "Semana de Validación Total",
        description: "Validar todas las emociones de tu hijo sin minimizar, sin juzgar, sin decir 'no es para tanto'",
        icon: "heart.fill",
        color: "pink",
        duration: "7 días",
        tasks: [
            ChallengeTask(description: "Día 1: Validar todas las emociones expresadas"),
            ChallengeTask(description: "Día 2: Validar todas las emociones expresadas"),
            ChallengeTask(description: "Día 3: Validar todas las emociones expresadas"),
            ChallengeTask(description: "Día 4: Validar todas las emociones expresadas"),
            ChallengeTask(description: "Día 5: Validar todas las emociones expresadas"),
            ChallengeTask(description: "Día 6: Validar todas las emociones expresadas"),
            ChallengeTask(description: "Día 7: Validar todas las emociones expresadas")
        ],
        reward: 60
    ),
    
    BM9Challenge(
        number: 4,
        title: "Semana de Colecho Sagrado",
        description: "Dormir juntos todas las noches, celebrando el sueño compartido como lo natural y beneficioso que es",
        icon: "bed.double.fill",
        color: "purple",
        duration: "7 noches",
        tasks: [
            ChallengeTask(description: "Noche 1: Dormir juntos toda la noche"),
            ChallengeTask(description: "Noche 2: Dormir juntos toda la noche"),
            ChallengeTask(description: "Noche 3: Dormir juntos toda la noche"),
            ChallengeTask(description: "Noche 4: Dormir juntos toda la noche"),
            ChallengeTask(description: "Noche 5: Dormir juntos toda la noche"),
            ChallengeTask(description: "Noche 6: Dormir juntos toda la noche"),
            ChallengeTask(description: "Noche 7: Dormir juntos toda la noche")
        ],
        reward: 50
    ),
    
    BM9Challenge(
        number: 5,
        title: "Noches de Respuesta Inmediata",
        description: "Responder a todas las tomas nocturnas y llantos nocturnos sin demora durante una semana",
        icon: "moon.stars.fill",
        color: "orange",
        duration: "7 noches",
        tasks: [
            ChallengeTask(description: "Noche 1: Responder inmediatamente a cada llamado"),
            ChallengeTask(description: "Noche 2: Responder inmediatamente a cada llamado"),
            ChallengeTask(description: "Noche 3: Responder inmediatamente a cada llamado"),
            ChallengeTask(description: "Noche 4: Responder inmediatamente a cada llamado"),
            ChallengeTask(description: "Noche 5: Responder inmediatamente a cada llamado"),
            ChallengeTask(description: "Noche 6: Responder inmediatamente a cada llamado"),
            ChallengeTask(description: "Noche 7: Responder inmediatamente a cada llamado")
        ],
        reward: 60
    ),
    
    BM9Challenge(
        number: 6,
        title: "Defensa Valiente",
        description: "Establecer límites claros con 3 personas diferentes que critican tu crianza con apego",
        icon: "shield.fill",
        color: "green",
        duration: "Esta semana",
        tasks: [
            ChallengeTask(description: "Establecer límite claro y respetuoso con persona crítica #1"),
            ChallengeTask(description: "Establecer límite claro y respetuoso con persona crítica #2"),
            ChallengeTask(description: "Establecer límite claro y respetuoso con persona crítica #3")
        ],
        reward: 100
    )
]

private func colorFromString(_ colorString: String) -> Color {
    switch colorString {
    case "orange": return .orange
    case "blue": return .blue
    case "mint": return .mint
    case "purple": return .purple
    case "pink": return .pink
    case "green": return .green
    default: return .orange
    }
}

