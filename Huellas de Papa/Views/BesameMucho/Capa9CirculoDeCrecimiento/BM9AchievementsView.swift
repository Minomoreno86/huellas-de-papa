import SwiftUI

/// Vista de logros/insignias
struct BM9AchievementsView: View {
    @State private var achievements = achievementsData
    @State private var selectedCategory: AchievementCategory? = nil
    @State private var showingUnlockedOnly = false
    
    var body: some View {
        ScrollView {
            VStack(spacing: 24) {
                headerSection
                statsSection
                filtersSection
                achievementsGridSection
            }
            .padding()
        }
        .background(Color(.systemGroupedBackground))
        .navigationTitle("Logros")
    }
    
    private var headerSection: some View {
        VStack(spacing: 12) {
            Image(systemName: "trophy.fill")
                .font(.system(size: 60))
                .foregroundStyle(
                    LinearGradient(
                        colors: [.yellow, .orange],
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                )
            
            Text("Insignias de Apego")
                .font(.title)
                .fontWeight(.bold)
            
            Text("20 logros que celebran tu crianza con amor")
                .font(.subheadline)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
        }
        .padding()
    }
    
    private var statsSection: some View {
        HStack(spacing: 20) {
            VStack {
                Text("\(achievements.filter { $0.isUnlocked }.count)")
                    .font(.system(size: 36, weight: .bold))
                    .foregroundColor(.yellow)
                Text("Desbloqueados")
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
            .frame(maxWidth: .infinity)
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 12)
                    .fill(Color(.systemBackground))
            )
            
            VStack {
                Text("\(achievements.filter { !$0.isUnlocked }.count)")
                    .font(.system(size: 36, weight: .bold))
                    .foregroundColor(.gray)
                Text("Por Desbloquear")
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
            .frame(maxWidth: .infinity)
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 12)
                    .fill(Color(.systemBackground))
            )
        }
    }
    
    private var filtersSection: some View {
        VStack(spacing: 12) {
            // Category filter
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 12) {
                    Button(action: { 
                        withAnimation { selectedCategory = nil }
                    }) {
                        Text("Todos")
                            .font(.subheadline)
                            .foregroundColor(selectedCategory == nil ? .white : .yellow)
                            .padding(.horizontal, 16)
                            .padding(.vertical, 8)
                            .background(Capsule().fill(selectedCategory == nil ? Color.yellow : Color.yellow.opacity(0.1)))
                    }
                    
                    ForEach([AchievementCategory.sleep, .feeding, .noViolence, .response, .defense, .general], id: \.self) { category in
                        Button(action: { 
                            withAnimation { selectedCategory = category }
                        }) {
                            HStack {
                                Image(systemName: category.icon)
                                Text(category.rawValue)
                            }
                            .font(.subheadline)
                            .foregroundColor(selectedCategory == category ? .white : .blue)
                            .padding(.horizontal, 16)
                            .padding(.vertical, 8)
                            .background(Capsule().fill(selectedCategory == category ? Color.blue : Color.blue.opacity(0.1)))
                        }
                    }
                }
            }
            
            // Show unlocked only toggle
            Toggle(isOn: $showingUnlockedOnly) {
                Text("Mostrar solo desbloqueados")
                    .font(.subheadline)
            }
            .tint(.yellow)
        }
    }
    
    private var achievementsGridSection: some View {
        LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 16) {
            ForEach(filteredAchievements) { achievement in
                BM9AchievementCard(achievement: achievement)
            }
        }
    }
    
    private var filteredAchievements: [BM9Achievement] {
        var filtered = achievements
        
        if let selectedCategory = selectedCategory {
            filtered = filtered.filter { $0.category == selectedCategory }
        }
        
        if showingUnlockedOnly {
            filtered = filtered.filter { $0.isUnlocked }
        }
        
        return filtered
    }
}

// MARK: - BM9 Achievement Card
struct BM9AchievementCard: View {
    let achievement: BM9Achievement
    @State private var showingDetail = false
    
    var body: some View {
        Button(action: {
            showingDetail = true
        }) {
            VStack(spacing: 12) {
                Image(systemName: achievement.icon)
                    .font(.system(size: 40))
                    .foregroundColor(achievement.isUnlocked ? achievement.color.swiftUIColor : .gray)
                    .opacity(achievement.isUnlocked ? 1.0 : 0.3)
                
                Text(achievement.title)
                    .font(.headline)
                    .fontWeight(.semibold)
                    .foregroundColor(.primary)
                    .multilineTextAlignment(.center)
                    .lineLimit(2)
                    .fixedSize(horizontal: false, vertical: true)
                
                if achievement.isUnlocked {
                    HStack(spacing: 4) {
                        Image(systemName: "checkmark.circle.fill")
                            .foregroundColor(.green)
                        Text("\(achievement.points) pts")
                            .font(.caption)
                            .foregroundColor(.secondary)
                    }
                } else {
                    Text(achievement.requirement)
                        .font(.caption2)
                        .foregroundColor(.secondary)
                        .multilineTextAlignment(.center)
                        .lineLimit(3)
                        .fixedSize(horizontal: false, vertical: true)
                }
            }
            .padding()
            .frame(maxWidth: .infinity, minHeight: 180)
            .background(
                RoundedRectangle(cornerRadius: 16)
                    .fill(Color(.systemBackground))
                    .shadow(color: achievement.isUnlocked ? achievement.color.swiftUIColor.opacity(0.3) : Color.gray.opacity(0.1), radius: 8)
            )
        }
        .sheet(isPresented: $showingDetail) {
            AchievementDetailView(achievement: achievement)
        }
    }
}

// MARK: - Achievement Detail View
struct AchievementDetailView: View {
    let achievement: BM9Achievement
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 30) {
                    // Icon
                    Image(systemName: achievement.icon)
                        .font(.system(size: 100))
                        .foregroundColor(achievement.isUnlocked ? achievement.color.swiftUIColor : .gray)
                        .padding(50)
                        .background(
                            Circle()
                                .fill(achievement.isUnlocked ? achievement.color.swiftUIColor.opacity(0.2) : Color.gray.opacity(0.1))
                        )
                    
                    // Title
                    Text(achievement.title)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.primary)
                        .multilineTextAlignment(.center)
                    
                    // Status
                    if achievement.isUnlocked {
                        VStack(spacing: 8) {
                            HStack {
                                Image(systemName: "checkmark.seal.fill")
                                    .foregroundColor(.green)
                                Text("¡Desbloqueado!")
                                    .fontWeight(.semibold)
                                    .foregroundColor(.green)
                            }
                            .font(.headline)
                            
                            if let date = achievement.unlockedDate {
                                Text("Obtenido el \(date, style: .date)")
                                    .font(.caption)
                                    .foregroundColor(.secondary)
                            }
                        }
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 12)
                                .fill(Color.green.opacity(0.1))
                        )
                    } else {
                        VStack(spacing: 8) {
                            HStack {
                                Image(systemName: "lock.fill")
                                    .foregroundColor(.gray)
                                Text("Bloqueado")
                                    .fontWeight(.semibold)
                                    .foregroundColor(.gray)
                            }
                            .font(.headline)
                        }
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 12)
                                .fill(Color.gray.opacity(0.1))
                        )
                    }
                    
                    // Description
                    VStack(alignment: .leading, spacing: 12) {
                        Label("Descripción", systemImage: "text.alignleft")
                            .font(.headline)
                            .foregroundColor(.blue)
                        
                        Text(achievement.description)
                            .font(.body)
                            .foregroundColor(.primary)
                    }
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(
                        RoundedRectangle(cornerRadius: 16)
                            .fill(Color(.secondarySystemGroupedBackground))
                    )
                    
                    // Requirement
                    VStack(alignment: .leading, spacing: 12) {
                        Label("Cómo Desbloquearlo", systemImage: "key.fill")
                            .font(.headline)
                            .foregroundColor(.orange)
                        
                        Text(achievement.requirement)
                            .font(.body)
                            .foregroundColor(.primary)
                    }
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(
                        RoundedRectangle(cornerRadius: 16)
                            .fill(Color(.secondarySystemGroupedBackground))
                    )
                    
                    // Points
                    VStack(alignment: .leading, spacing: 12) {
                        Label("Recompensa", systemImage: "star.fill")
                            .font(.headline)
                            .foregroundColor(.yellow)
                        
                        HStack {
                            Text("\(achievement.points)")
                                .font(.system(size: 40, weight: .bold))
                                .foregroundColor(.yellow)
                            Text("puntos")
                                .font(.title3)
                                .foregroundColor(.secondary)
                        }
                    }
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(
                        RoundedRectangle(cornerRadius: 16)
                            .fill(Color.yellow.opacity(0.1))
                    )
                }
                .padding()
            }
            .background(Color(.systemGroupedBackground))
            .navigationTitle("Logro")
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

// MARK: - ACHIEVEMENTS DATA (20 logros desbloqueables)
let achievementsData: [BM9Achievement] = [
    // CATEGORÍA: COLECHO (3 logros)
    BM9Achievement(
        number: 1,
        title: "Primera Noche Juntos",
        description: "Has dado el primer paso hacia el colecho seguro. Esta primera noche juntos marca el inicio de una conexión nocturna profunda y natural.",
        icon: "moon.stars.fill",
        color: .blue,
        category: .sleep,
        points: 10,
        requirement: "Dormir una noche completa practicando colecho seguro"
    ),
    
    BM9Achievement(
        number: 2,
        title: "Semana de Sueño Compartido",
        description: "Has completado 7 noches consecutivas de colecho. Tu hijo está aprendiendo que la noche es segura porque tú estás ahí. Eso construye apego seguro profundo.",
        icon: "bed.double.fill",
        color: .blue,
        category: .sleep,
        points: 25,
        requirement: "7 noches consecutivas de colecho"
    ),
    
    BM9Achievement(
        number: 3,
        title: "Maestro del Colecho",
        description: "30 días de colecho exitoso. Has demostrado que dormir juntos es sostenible, natural y beneficioso para toda la familia. ¡Eres un ejemplo del libro!",
        icon: "calendar.badge.checkmark",
        color: .gold,
        category: .sleep,
        points: 50,
        requirement: "30 días de colecho consistente"
    ),
    
    // CATEGORÍA: LACTANCIA (3 logros)
    BM9Achievement(
        number: 4,
        title: "Primera Semana a Demanda",
        description: "Has dado el pecho completamente a demanda durante 7 días: sin reloj, sin horarios, sin límites. Tu bebé y tu cuerpo establecen la danza perfecta.",
        icon: "heart.circle.fill",
        color: .pink,
        category: .feeding,
        points: 20,
        requirement: "7 días de lactancia a demanda total (sin mirar reloj)"
    ),
    
    BM9Achievement(
        number: 5,
        title: "Noches de Conexión Láctea",
        description: "Has respondido a todas las tomas nocturnas durante 30 días. Las tomas de noche no solo alimentan, mantienen tu producción y fortalecen el vínculo.",
        icon: "moon.fill",
        color: .pink,
        category: .feeding,
        points: 30,
        requirement: "30 días respondiendo a todas las tomas nocturnas"
    ),
    
    BM9Achievement(
        number: 6,
        title: "Guerrera de la Lactancia Prolongada",
        description: "Has continuado amamantando más allá del primer año, desafiando presiones sociales. Estás dando a tu hijo el regalo de inmunidad, nutrición y apego extendido. ¡Eres heroína!",
        icon: "star.fill",
        color: .gold,
        category: .feeding,
        points: 100,
        requirement: "Continuar lactancia más allá de los 12 meses"
    ),
    
    // CATEGORÍA: SIN VIOLENCIA (3 logros)
    BM9Achievement(
        number: 7,
        title: "Semana de Calma",
        description: "7 días sin gritar. Has mantenido tu voz calmada incluso en momentos difíciles. Eso requiere autocontrol y consciencia enorme. Tu hijo aprende regulación de TI.",
        icon: "speaker.slash.fill",
        color: .mint,
        category: .noViolence,
        points: 30,
        requirement: "7 días consecutivos sin gritar a tu hijo"
    ),
    
    BM9Achievement(
        number: 8,
        title: "Mes de Límites Respetuosos",
        description: "30 días poniendo límites firmes pero sin castigos, gritos ni violencia. Has demostrado que firmeza y respeto pueden coexistir. Estás criando desde el amor, no el miedo.",
        icon: "shield.fill",
        color: .mint,
        category: .noViolence,
        points: 50,
        requirement: "30 días de límites sin castigos ni gritos"
    ),
    
    BM9Achievement(
        number: 9,
        title: "Maestro de la Disciplina Positiva",
        description: "Has dominado el arte de poner límites con calma, redirigir con amor y enseñar con paciencia. Tu hijo aprende autodisciplina, no obediencia ciega.",
        icon: "hand.raised.fill",
        color: .gold,
        category: .noViolence,
        points: 75,
        requirement: "Consistencia comprobada en límites respetuosos (evaluación 85%+)"
    ),
    
    // CATEGORÍA: RESPUESTA (3 logros)
    BM9Achievement(
        number: 10,
        title: "Siempre Presente",
        description: "Has respondido inmediatamente a cada llanto durante una semana completa. Tu hijo está aprendiendo que su voz importa, que puede confiar, que no está solo.",
        icon: "figure.2.arms.open",
        color: .orange,
        category: .response,
        points: 20,
        requirement: "7 días de respuesta inmediata a cada llanto (menos de 1 minuto)"
    ),
    
    BM9Achievement(
        number: 11,
        title: "Experto en Validación Emocional",
        description: "Has validado todas las emociones de tu hijo sin minimizar, sin juzgar, sin reprimir. Le enseñas que todos sus sentimientos son legítimos y bienvenidos.",
        icon: "face.smiling.fill",
        color: .orange,
        category: .response,
        points: 30,
        requirement: "Validar consistentemente todas las emociones durante 30 días"
    ),
    
    BM9Achievement(
        number: 12,
        title: "Abrazos Sin Límite",
        description: "Has ofrecido contacto físico ilimitado: brazos cuando pide, porteo regular, masajes, caricias. Tu hijo tiene su tanque de contacto LLENO. Eso es crianza óptima.",
        icon: "heart.fill",
        color: .gold,
        category: .response,
        points: 40,
        requirement: "Contacto físico abundante y consistente documentado"
    ),
    
    // CATEGORÍA: DEFENSA (3 logros)
    BM9Achievement(
        number: 13,
        title: "Primer Límite Valiente",
        description: "Has establecido tu primer límite claro con alguien que criticaba tu crianza. Dijiste 'no' con respeto pero firmeza. Eso protege a tu hijo y tu decisión.",
        icon: "exclamationmark.shield.fill",
        color: .purple,
        category: .defense,
        points: 25,
        requirement: "Establecer límite claro con persona crítica de tu crianza"
    ),
    
    BM9Achievement(
        number: 14,
        title: "Defensor Inquebrantable",
        description: "Has defendido tu crianza con apego consistentemente ante múltiples críticas. Con datos, con amor, con firmeza. Tu convicción protege a tu familia.",
        icon: "figure.stand",
        color: .purple,
        category: .defense,
        points: 50,
        requirement: "Defender tu crianza ante críticas en múltiples ocasiones"
    ),
    
    BM9Achievement(
        number: 15,
        title: "Has Encontrado Tu Tribu",
        description: "Te has unido a un grupo de apoyo de crianza con apego. Ya no estás solo/a en este camino. Tienes comunidad que te entiende, te apoya y te sostiene.",
        icon: "person.3.fill",
        color: .gold,
        category: .defense,
        points: 30,
        requirement: "Unirte activamente a grupo de apoyo pro-apego"
    ),
    
    // CATEGORÍA: GENERAL (8 logros)
    BM9Achievement(
        number: 16,
        title: "Lector Completo",
        description: "Has leído 'Bésame Mucho' de principio a fin. Ahora tienes el conocimiento completo de Carlos González. Eso cambia perspectivas para siempre.",
        icon: "book.fill",
        color: .blue,
        category: .general,
        points: 50,
        requirement: "Completar lectura del libro 'Bésame Mucho'"
    ),
    
    BM9Achievement(
        number: 17,
        title: "Explorador de Todas las Capas",
        description: "Has visitado y explorado las 9 capas completas del módulo. Conoces la teoría, las herramientas, las simulaciones, todo. Estás equipado completamente.",
        icon: "checkmark.seal.fill",
        color: .mint,
        category: .general,
        points: 75,
        requirement: "Visitar y revisar todas las 9 capas del módulo"
    ),
    
    BM9Achievement(
        number: 18,
        title: "Maestro del Apego Certificado",
        description: "Has obtenido 85% o más en TODAS las evaluaciones. Tu alineación con el libro es casi perfecta. Eres ejemplo viviente de crianza con apego.",
        icon: "star.circle.fill",
        color: .gold,
        category: .general,
        points: 100,
        requirement: "Obtener 85%+ en los 8 cuestionarios de evaluación"
    ),
    
    BM9Achievement(
        number: 19,
        title: "Familia Transformada",
        description: "Has documentado reflexiones profundas sobre el impacto del apego en tu familia. Ves los resultados: un hijo más seguro, más feliz, más conectado. La teoría se volvió realidad.",
        icon: "sparkles",
        color: .gold,
        category: .general,
        points: 100,
        requirement: "Completar 30 entradas de diario de reflexión profundas"
    ),
    
    BM9Achievement(
        number: 20,
        title: "Racha de Fuego: 30 Días",
        description: "Has practicado crianza con apego conscientemente durante 30 días consecutivos sin fallar. Esta racha demuestra compromiso, dedicación y amor profundo. ¡Increíble!",
        icon: "flame.fill",
        color: .gold,
        category: .general,
        points: 150,
        requirement: "Registrar prácticas de apego 30 días consecutivos"
    )
]

