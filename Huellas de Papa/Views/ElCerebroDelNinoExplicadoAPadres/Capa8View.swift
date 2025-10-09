import SwiftUI

// MARK: - Capa 8: Modo Niño - Herramienta de Conexión Padre-Hijo
// Hub emocional para fortalecer el vínculo mediante actividades guiadas
// Basado en los principios de Álvaro Bilbao
// SuperDesign: Consistente con Capas 2-5

struct Capa8View: View {
    @State private var selectedCategory: Capa8ActivityCategory = .dailyConnection
    @State private var showingActivity = false
    @State private var selectedActivity: Any? = nil
    @State private var showingCategoryDetail = false
    @State private var animacionEntrada = false
    
    // MARK: - Configuración SuperDesign (consistente con otras capas)
    private let coloresCapa8 = (
        mintSuave: Color.mint.opacity(0.08),
        verdeSuave: Color.green.opacity(0.04),
        azulSuave: Color.blue.opacity(0.02),
        acentoRosa: Color.pink.opacity(0.8),
        acentoVerde: Color.green.opacity(0.8)
    )
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVStack(spacing: 24) {
                    // MARK: - Header Emocional
                    emotionalHeaderView
                        .opacity(animacionEntrada ? 1 : 0)
                        .offset(y: animacionEntrada ? 0 : -30)
                    
                    // MARK: - Mensaje de Conexión
                    connectionMessageView
                        .opacity(animacionEntrada ? 1 : 0)
                        .offset(y: animacionEntrada ? 0 : -20)
                    
                    // MARK: - Progreso de Conexión
                    connectionProgressView
                        .opacity(animacionEntrada ? 1 : 0)
                        .offset(y: animacionEntrada ? 0 : -10)
                    
                    // MARK: - Categorías de Actividades
                    activitiesGridView
                        .opacity(animacionEntrada ? 1 : 0)
                        .offset(y: animacionEntrada ? 0 : -10)
                    
                    // MARK: - Actividad del Día
                    dailyActivityView
                        .opacity(animacionEntrada ? 1 : 0)
                        .offset(y: animacionEntrada ? 0 : -10)
                }
                .padding(.horizontal, 20)
                .padding(.vertical, 16)
            }
            .background(
                LinearGradient(
                    gradient: Gradient(colors: [
                        coloresCapa8.mintSuave,
                        coloresCapa8.verdeSuave,
                        coloresCapa8.azulSuave
                    ]),
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
                .ignoresSafeArea()
            )
            .navigationTitle("Modo Niño")
            #if !os(macOS)
            .navigationBarTitleDisplayMode(.large)
            #endif
            .onAppear {
                withAnimation(.spring(response: 0.8, dampingFraction: 0.8)) {
                    animacionEntrada = true
                }
            }
        }
        .sheet(isPresented: $showingActivity) {
            if let activity = selectedActivity {
                Capa8ActivityDetailView(activity: activity)
            }
        }
        .sheet(isPresented: $showingCategoryDetail) {
            Capa8CategoryDetailView(category: selectedCategory)
        }
    }
    
    // MARK: - Header Emocional
    private var emotionalHeaderView: some View {
        VStack(spacing: 16) {
            HStack {
                VStack(alignment: .leading, spacing: 8) {
                    Text("🌱 Modo Niño")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.primary)
                    
                    Text("Hoy practicamos conexión jugando")
                        .font(.title3)
                        .foregroundColor(.secondary)
                        .fontWeight(.medium)
                }
                
                Spacer()
                
                VStack {
                    Image(systemName: "heart.circle.fill")
                        .font(.system(size: 40))
                        .foregroundColor(.pink)
                    
                    Text("Bilbao")
                        .font(.caption)
                        .foregroundColor(.secondary)
                        .fontWeight(.medium)
                }
            }
            
            // Mensaje inspirador
                Text("\"Jugar es la forma más seria de enseñar conexión\"")
                .font(.body)
                .italic()
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 12)
                        .fill(Color.pink.opacity(0.1))
                )
        }
        .padding(20)
        .background(
            RoundedRectangle(cornerRadius: 18, style: .continuous)
                .fill(Color(.secondarySystemBackground).opacity(0.9))
                .shadow(color: Color.black.opacity(0.08), radius: 8, x: 0, y: 4)
        )
    }
    
    // MARK: - Mensaje de Conexión
    private var connectionMessageView: some View {
        VStack(spacing: 12) {
            HStack {
                Image(systemName: "lightbulb.fill")
                    .font(.title3)
                    .foregroundColor(.yellow)
                Text("¿Sabías que...?")
                    .font(.headline)
                    .fontWeight(.semibold)
                    .foregroundColor(.primary)
            }
            
            Text("Cada actividad que haces con tu hijo no solo fortalece su cerebro, sino que también crea conexiones neuronales que durarán toda la vida. El amor construye el cerebro.")
                .font(.body)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
                .padding(.horizontal)
        }
        .padding(16)
        .background(
            RoundedRectangle(cornerRadius: 16, style: .continuous)
                .fill(Color.blue.opacity(0.08))
                .overlay(
                    RoundedRectangle(cornerRadius: 16, style: .continuous)
                        .stroke(Color.blue.opacity(0.2), lineWidth: 1)
                )
        )
    }
    
    // MARK: - Progreso de Conexión
    private var connectionProgressView: some View {
        VStack(spacing: 12) {
            HStack {
                HStack(spacing: 6) {
                    Image(systemName: "chart.line.uptrend.xyaxis")
                        .font(.title3)
                        .foregroundColor(.green)
                    Text("Tu Progreso de Conexión")
                        .font(.headline)
                        .fontWeight(.semibold)
                }
                
                Spacer()
                
                Text("Nivel: Iniciando")
                    .font(.caption)
                    .fontWeight(.medium)
                    .foregroundColor(.green)
                    .padding(.horizontal, 8)
                    .padding(.vertical, 4)
                    .background(
                        Capsule()
                            .fill(Color.green.opacity(0.2))
                    )
            }
            
            // Barra de progreso mejorada
            GeometryReader { geometry in
                ZStack(alignment: .leading) {
                    RoundedRectangle(cornerRadius: 8, style: .continuous)
                        .fill(Color(.systemGray5))
                        .frame(height: 12)
                    
                    RoundedRectangle(cornerRadius: 8, style: .continuous)
                        .fill(
                            LinearGradient(
                                colors: [.green, .mint],
                                startPoint: .leading,
                                endPoint: .trailing
                            )
                        )
                        .frame(width: geometry.size.width * 0.3, height: 12)
                }
            }
            .frame(height: 12)
            
            HStack {
                Image(systemName: "checkmark.circle.fill")
                    .font(.caption)
                    .foregroundColor(.green)
                Text("3 actividades completadas")
                    .font(.caption)
                    .foregroundColor(.secondary)
                
                Spacer()
                
                Image(systemName: "flame.fill")
                    .font(.caption)
                    .foregroundColor(.orange)
                Text("Racha: 2 días")
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
        }
        .padding(16)
        .background(
            RoundedRectangle(cornerRadius: 16, style: .continuous)
                .fill(Color(.secondarySystemBackground).opacity(0.8))
                .shadow(color: Color.black.opacity(0.05), radius: 6, x: 0, y: 3)
        )
    }
    
    // MARK: - Grid de Actividades
    private var activitiesGridView: some View {
        VStack(spacing: 16) {
            Text("🎯 Categorías de Conexión")
                .font(.headline)
                .fontWeight(.semibold)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 2), spacing: 16) {
                ForEach(Capa8ActivityCategory.allCases, id: \.self) { category in
                    CategoryCard(
                        category: category,
                        isSelected: selectedCategory == category,
                        action: {
                            selectedCategory = category
                            showingCategoryDetail = true
                        }
                    )
                }
            }
        }
    }
    
    // MARK: - Actividad del Día
    private var dailyActivityView: some View {
        VStack(spacing: 16) {
            Text("🌟 Actividad Recomendada para Hoy")
                .font(.headline)
                .fontWeight(.semibold)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            VStack(spacing: 12) {
                HStack {
                    Image(systemName: "heart.circle.fill")
                        .foregroundColor(.pink)
                        .font(.title2)
                    
                    VStack(alignment: .leading, spacing: 4) {
                        Text("Abrazo de Conexión")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                        
                        Text("5 minutos • Vínculo Diario")
                            .font(.caption)
                            .foregroundColor(.secondary)
                    }
                    
                    Spacer()
                    
                    Button("Comenzar") {
                        // Usar el primer círculo de conexión como actividad del día
                        selectedActivity = Capa8ModoNino.dailyConnectionCircles.first!
                        showingActivity = true
                    }
                    .font(.caption)
                    .fontWeight(.medium)
                    .foregroundColor(.white)
                    .padding(.horizontal, 12)
                    .padding(.vertical, 6)
                    .background(
                        RoundedRectangle(cornerRadius: 8)
                            .fill(Color.pink)
                    )
                }
                
                Text("Mira a tu hijo a los ojos, abrázalo y di: 'Eres muy importante para mí'. Repite tres veces.")
                    .font(.body)
                    .foregroundColor(.secondary)
                    .multilineTextAlignment(.leading)
            }
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 12)
                    .fill(Color.pink.opacity(0.1))
            )
        }
    }
}

// MARK: - Componentes

struct CategoryCard: View {
    let category: Capa8ActivityCategory
    let isSelected: Bool
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            VStack(spacing: 12) {
                // Icono con animación
                Image(systemName: category.icon)
                    .font(.system(size: 28, weight: .semibold))
                    .foregroundColor(isSelected ? .white : category.color)
                    .scaleEffect(isSelected ? 1.1 : 1.0)
                    .animation(.spring(response: 0.5, dampingFraction: 0.7), value: isSelected)
                
                VStack(spacing: 6) {
                    Text(category.rawValue)
                        .font(.subheadline)
                        .fontWeight(.bold)
                        .foregroundColor(isSelected ? .white : .primary)
                        .multilineTextAlignment(.center)
                    
                    Text(category.description)
                        .font(.caption)
                        .foregroundColor(isSelected ? .white.opacity(0.9) : .secondary)
                        .multilineTextAlignment(.center)
                        .lineLimit(2)
                }
            }
            .padding(16)
            .frame(maxWidth: .infinity, minHeight: 130)
            .background(
                RoundedRectangle(cornerRadius: 16, style: .continuous)
                    .fill(
                        isSelected ? 
                        LinearGradient(
                            colors: [category.color, category.color.opacity(0.8)],
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        ) :
                        LinearGradient(
                            colors: [
                                Color(.secondarySystemBackground),
                                Color(.secondarySystemBackground).opacity(0.8)
                            ],
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                    )
                    .overlay(
                        RoundedRectangle(cornerRadius: 16, style: .continuous)
                            .stroke(
                                isSelected ? category.color : category.color.opacity(0.3),
                                lineWidth: isSelected ? 2 : 1
                            )
                    )
                    .shadow(
                        color: isSelected ? category.color.opacity(0.4) : Color.black.opacity(0.05),
                        radius: isSelected ? 12 : 6,
                        x: 0,
                        y: isSelected ? 6 : 3
                    )
            )
        }
        .buttonStyle(PlainButtonStyle())
        .scaleEffect(isSelected ? 1.05 : 1.0)
        .animation(.spring(response: 0.6, dampingFraction: 0.8), value: isSelected)
    }
}

// MARK: - Vista de Detalle de Actividad de Capa 8
struct Capa8ActivityDetailView: View {
    let activity: Any
    @Environment(\.dismiss) var dismiss
    @State private var currentStep = 0
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 24) {
                    // Header de la actividad
                    activityHeaderView
                    
                    // Contenido específico según el tipo
                    activityContentView
                    
                    // Controles de navegación (si aplica)
                    navigationControlsView
                }
                .padding()
            }
            .navigationTitle(activityTitle)
            #if !os(macOS)
            .navigationBarTitleDisplayMode(.inline)
            #endif
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Cerrar") {
                        dismiss()
                    }
                }
            }
        }
    }
    
    private var activityHeaderView: some View {
        VStack(spacing: 16) {
            Text(activityTitle)
                .font(.title2)
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
            
            Text(activityDescription)
                .font(.body)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
            
            HStack {
                Label(activityDuration, systemImage: "clock")
                    .font(.caption)
                    .foregroundColor(.secondary)
                
                if let game = activity as? Capa8Game {
                    Label(game.recommendedAge, systemImage: "person")
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
            }
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(Color.blue.opacity(0.1))
        )
    }
    
    @ViewBuilder
    private var activityContentView: some View {
        if let game = activity as? Capa8Game {
            gameContentView(game)
        } else if let story = activity as? Capa8Story {
            storyContentView(story)
        } else if let rolePlay = activity as? Capa8RolePlay {
            rolePlayContentView(rolePlay)
        } else if let circle = activity as? Capa8ConnectionCircle {
            circleContentView(circle)
        }
    }
    
    private func gameContentView(_ game: Capa8Game) -> some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("🎯 Objetivo")
                .font(.headline)
                .fontWeight(.semibold)
            
            Text(game.goal)
                .font(.body)
                .foregroundColor(.primary)
            
            Text("📦 Materiales Necesarios")
                .font(.headline)
                .fontWeight(.semibold)
            
            ForEach(game.materials, id: \.self) { material in
                HStack {
                    Text("•")
                        .foregroundColor(.blue)
                    Text(material)
                        .font(.body)
                }
            }
            
            Text("📋 Pasos a Seguir")
                .font(.headline)
                .fontWeight(.semibold)
            
            ForEach(Array(game.steps.enumerated()), id: \.offset) { index, step in
                VStack(alignment: .leading, spacing: 8) {
                    HStack {
                        Text("\(index + 1)")
                            .font(.caption)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .frame(width: 24, height: 24)
                            .background(Circle().fill(Color.blue))
                        
                        Text(step)
                            .font(.body)
                            .foregroundColor(.primary)
                    }
                }
                .padding(.vertical, 4)
            }
            
            if !game.emotionalBenefit.isEmpty {
                Text("💝 Beneficio Emocional")
                    .font(.headline)
                    .fontWeight(.semibold)
                
                Text(game.emotionalBenefit)
                    .font(.body)
                    .foregroundColor(.green)
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 12)
                            .fill(Color.green.opacity(0.1))
                    )
            }
        }
    }
    
    private func storyContentView(_ story: Capa8Story) -> some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("📖 Resumen")
                .font(.headline)
                .fontWeight(.semibold)
            
            Text(story.summary)
                .font(.body)
                .foregroundColor(.primary)
            
            if currentStep < story.pages.count {
                let page = story.pages[currentStep]
                
                Text("Página \(page.pageNumber) de \(story.pages.count)")
                    .font(.caption)
                    .foregroundColor(.secondary)
                
                Text(page.text)
                    .font(.body)
                    .foregroundColor(.primary)
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 12)
                            .fill(Color.pink.opacity(0.1))
                    )
                
                Text("💡 Instrucción para el narrador:")
                    .font(.caption)
                    .fontWeight(.semibold)
                    .foregroundColor(.orange)
                
                Text(page.narratorCue)
                    .font(.caption)
                    .foregroundColor(.orange)
                    .italic()
                    .padding(.horizontal, 12)
                    .padding(.vertical, 8)
                    .background(
                        RoundedRectangle(cornerRadius: 8)
                            .fill(Color.orange.opacity(0.1))
                    )
            }
            
            Text("💡 Mensaje Clave")
                .font(.headline)
                .fontWeight(.semibold)
            
            Text(story.keyMessage)
                .font(.body)
                .foregroundColor(.blue)
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 12)
                        .fill(Color.blue.opacity(0.1))
                )
        }
    }
    
    private func rolePlayContentView(_ rolePlay: Capa8RolePlay) -> some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("🎭 Escenario")
                .font(.headline)
                .fontWeight(.semibold)
            
            Text(rolePlay.scenario)
                .font(.body)
                .foregroundColor(.primary)
            
            Text("🎬 Guión Paso a Paso")
                .font(.headline)
                .fontWeight(.semibold)
            
            if currentStep < rolePlay.scriptLines.count {
                let line = rolePlay.scriptLines[currentStep]
                
                Text("Paso \(currentStep + 1) de \(rolePlay.scriptLines.count)")
                    .font(.caption)
                    .foregroundColor(.secondary)
                
                Text(line)
                    .font(.body)
                    .foregroundColor(.primary)
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 12)
                            .fill(Color.purple.opacity(0.1))
                    )
            }
            
            Text("🔧 Habilidad Emocional")
                .font(.headline)
                .fontWeight(.semibold)
            
            Text(rolePlay.emotionalSkill)
                .font(.body)
                .foregroundColor(.purple)
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 12)
                        .fill(Color.purple.opacity(0.1))
                )
            
            Text("💝 Paso de Reparación")
                .font(.headline)
                .fontWeight(.semibold)
            
            Text(rolePlay.repairStep)
                .font(.body)
                .foregroundColor(.green)
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 12)
                        .fill(Color.green.opacity(0.1))
                )
        }
    }
    
    private func circleContentView(_ circle: Capa8ConnectionCircle) -> some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("⏱️ Duración")
                .font(.headline)
                .fontWeight(.semibold)
            
            Text("\(circle.time) segundos")
                .font(.title2)
                .fontWeight(.bold)
                .foregroundColor(.orange)
            
            Text("💝 Sentimiento que Genera")
                .font(.headline)
                .fontWeight(.semibold)
            
            Text(circle.feelingGenerated)
                .font(.body)
                .foregroundColor(.green)
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 12)
                        .fill(Color.green.opacity(0.1))
                )
            
            Text("📋 Instrucciones Paso a Paso")
                .font(.headline)
                .fontWeight(.semibold)
            
            ForEach(Array(circle.instructions.enumerated()), id: \.offset) { index, instruction in
                HStack(alignment: .top, spacing: 12) {
                    Text("\(index + 1)")
                        .font(.caption)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .frame(width: 24, height: 24)
                        .background(Circle().fill(Color.orange))
                    
                    Text(instruction)
                        .font(.body)
                        .foregroundColor(.primary)
                }
                .padding(.vertical, 4)
            }
        }
    }
    
    @ViewBuilder
    private var navigationControlsView: some View {
        if let story = activity as? Capa8Story {
            if currentStep < story.pages.count - 1 {
                Button("Siguiente Página") {
                    currentStep += 1
                }
                .font(.headline)
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(12)
            } else {
                Button("Volver al Inicio") {
                    currentStep = 0
                }
                .font(.headline)
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.green)
                .foregroundColor(.white)
                .cornerRadius(12)
            }
        } else if let rolePlay = activity as? Capa8RolePlay {
            if currentStep < rolePlay.scriptLines.count - 1 {
                Button("Siguiente Paso") {
                    currentStep += 1
                }
                .font(.headline)
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.purple)
                .foregroundColor(.white)
                .cornerRadius(12)
            } else {
                Button("Repetir") {
                    currentStep = 0
                }
                .font(.headline)
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.green)
                .foregroundColor(.white)
                .cornerRadius(12)
            }
        }
    }
    
    // MARK: - Propiedades Computadas
    private var activityTitle: String {
        if let game = activity as? Capa8Game {
            return game.title
        } else if let story = activity as? Capa8Story {
            return story.title
        } else if let rolePlay = activity as? Capa8RolePlay {
            return rolePlay.title
        } else if let circle = activity as? Capa8ConnectionCircle {
            return circle.title
        }
        return "Actividad"
    }
    
    private var activityDescription: String {
        if let game = activity as? Capa8Game {
            return game.goal
        } else if let story = activity as? Capa8Story {
            return story.summary
        } else if let rolePlay = activity as? Capa8RolePlay {
            return rolePlay.scenario
        } else if let circle = activity as? Capa8ConnectionCircle {
            return circle.action
        }
        return "Descripción de la actividad"
    }
    
    private var activityDuration: String {
        if let game = activity as? Capa8Game {
            return "\(game.durationMinutes) minutos"
        } else if let story = activity as? Capa8Story {
            return "\(story.readingTime) minutos"
        } else if let circle = activity as? Capa8ConnectionCircle {
            return "\(circle.time) segundos"
        }
        return "Duración variable"
    }
}

// MARK: - Vista de Detalle de Categoría
struct Capa8CategoryDetailView: View {
    let category: Capa8ActivityCategory
    @Environment(\.dismiss) var dismiss
    @State private var selectedActivity: Any? = nil
    @State private var showingActivityDetail = false
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 20) {
                    // Header de la categoría
                    categoryHeaderView
                    
                    // Lista de actividades
                    activitiesListView
                }
                .padding()
            }
            .navigationTitle(category.rawValue)
            #if !os(macOS)
            .navigationBarTitleDisplayMode(.inline)
            #endif
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Cerrar") {
                        dismiss()
                    }
                }
            }
        }
        .sheet(isPresented: $showingActivityDetail) {
            if let activity = selectedActivity {
                Capa8ActivityDetailView(activity: activity)
            }
        }
    }
    
    private var categoryHeaderView: some View {
        VStack(spacing: 16) {
            Image(systemName: category.icon)
                .font(.system(size: 60))
                .foregroundColor(category.color)
            
            Text(category.description)
                .font(.body)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
                .padding(.horizontal)
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(category.color.opacity(0.1))
        )
    }
    
    private var activitiesListView: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Actividades Disponibles")
                .font(.title2)
                .fontWeight(.bold)
            
            ForEach(Array(activitiesForCategory.enumerated()), id: \.offset) { index, activity in
                ActivityRowView(activity: activity) {
                    selectedActivity = activity
                    showingActivityDetail = true
                }
            }
        }
    }
    
    private var activitiesForCategory: [Any] {
        switch category {
        case .brainEmotions:
            return Capa8ModoNino.brainEmotionGames
        case .languageAttachment:
            return Capa8ModoNino.languageAttachmentActivities
        case .emotionalRolePlay:
            return Capa8ModoNino.emotionalRolePlays
        case .dailyConnection:
            return Capa8ModoNino.dailyConnectionCircles
        case .guidedStories:
            return Capa8ModoNino.guidedStories
        }
    }
}

// MARK: - Componente de Fila de Actividad (SuperDesign)
struct ActivityRowView: View {
    let activity: Any
    let action: () -> Void
    @State private var isPressed = false
    
    var body: some View {
        Button(action: {
            withAnimation(.spring(response: 0.3, dampingFraction: 0.7)) {
                isPressed = true
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                isPressed = false
            }
            action()
        }) {
            HStack(spacing: 16) {
                // Icono con fondo circular
                ZStack {
                    Circle()
                        .fill(activityColor.opacity(0.15))
                        .frame(width: 50, height: 50)
                    
                    Image(systemName: activityIcon)
                        .font(.system(size: 22, weight: .semibold))
                        .foregroundColor(activityColor)
                }
                
                VStack(alignment: .leading, spacing: 8) {
                    Text(activityTitle)
                        .font(.headline)
                        .fontWeight(.semibold)
                        .foregroundColor(.primary)
                        .multilineTextAlignment(.leading)
                    
                    Text(activityDescription)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                        .multilineTextAlignment(.leading)
                        .lineLimit(2)
                    
                    HStack(spacing: 12) {
                        HStack(spacing: 4) {
                            Image(systemName: "clock")
                                .font(.caption2)
                            Text(activityDuration)
                                .font(.caption)
                        }
                        .foregroundColor(.secondary)
                        
                        HStack(spacing: 4) {
                            Image(systemName: "person.2")
                                .font(.caption2)
                            Text(activityAge)
                                .font(.caption)
                        }
                        .foregroundColor(.secondary)
                    }
                }
                
                Spacer()
                
                Image(systemName: "chevron.right")
                    .font(.system(size: 14, weight: .semibold))
                    .foregroundColor(activityColor)
            }
            .padding(16)
            .background(
                RoundedRectangle(cornerRadius: 16, style: .continuous)
                    .fill(Color(.secondarySystemBackground).opacity(0.9))
                    .overlay(
                        RoundedRectangle(cornerRadius: 16, style: .continuous)
                            .stroke(activityColor.opacity(0.3), lineWidth: 1)
                    )
                    .shadow(
                        color: isPressed ? activityColor.opacity(0.2) : Color.black.opacity(0.05),
                        radius: isPressed ? 4 : 8,
                        x: 0,
                        y: isPressed ? 2 : 4
                    )
            )
        }
        .buttonStyle(PlainButtonStyle())
        .scaleEffect(isPressed ? 0.98 : 1.0)
        .animation(.spring(response: 0.3, dampingFraction: 0.7), value: isPressed)
    }
    
    private var activityTitle: String {
        if let game = activity as? Capa8Game {
            return game.title
        } else if let story = activity as? Capa8Story {
            return story.title
        } else if let rolePlay = activity as? Capa8RolePlay {
            return rolePlay.title
        } else if let circle = activity as? Capa8ConnectionCircle {
            return circle.title
        }
        return "Actividad"
    }
    
    private var activityDescription: String {
        if let game = activity as? Capa8Game {
            return game.goal
        } else if let story = activity as? Capa8Story {
            return story.summary
        } else if let rolePlay = activity as? Capa8RolePlay {
            return rolePlay.scenario
        } else if let circle = activity as? Capa8ConnectionCircle {
            return circle.action
        }
        return "Descripción de la actividad"
    }
    
    private var activityDuration: String {
        if let game = activity as? Capa8Game {
            return "\(game.durationMinutes) min"
        } else if let story = activity as? Capa8Story {
            return "\(story.readingTime) min"
        } else if let circle = activity as? Capa8ConnectionCircle {
            return "\(circle.time) seg"
        }
        return "Duración"
    }
    
    private var activityAge: String {
        if let game = activity as? Capa8Game {
            return game.recommendedAge
        }
        return "Todas las edades"
    }
    
    private var activityColor: Color {
        if activity is Capa8Game {
            return .blue
        } else if activity is Capa8Story {
            return .purple
        } else if activity is Capa8RolePlay {
            return .orange
        } else if activity is Capa8ConnectionCircle {
            return .pink
        }
        return .green
    }
    
    private var activityIcon: String {
        if activity is Capa8Game {
            return "gamecontroller.fill"
        } else if activity is Capa8Story {
            return "book.fill"
        } else if activity is Capa8RolePlay {
            return "theatermasks.fill"
        } else if activity is Capa8ConnectionCircle {
            return "heart.circle.fill"
        }
        return "star.fill"
    }
}

    #Preview {
        Capa8View()
    }