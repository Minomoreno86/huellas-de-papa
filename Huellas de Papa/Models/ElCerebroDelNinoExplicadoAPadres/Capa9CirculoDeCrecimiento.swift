import Foundation
import SwiftUI

// MARK: - Capa 9: Círculo de Crecimiento - Sistema de Transformación Parental
// Basado en "El cerebro del niño explicado a los padres" de Álvaro Bilbao
// Propósito: Visualizar la evolución del padre desde la comprensión teórica hasta la práctica emocional

// MARK: - Etapas del Crecimiento
struct Capa9Stage: Codable, Identifiable {
    let id: UUID
    let title: String              // "Conexión", "Regulación", "Integración", "Presencia"
    let description: String
    let threshold: Int             // XP simbólico (no visible)
    let colorTheme: String         // gradiente de etapa
    let unlockedDate: Date?
    let isUnlocked: Bool
    
    init(id: UUID = UUID(), title: String, description: String, threshold: Int, colorTheme: String, unlockedDate: Date? = nil, isUnlocked: Bool = false) {
        self.id = id
        self.title = title
        self.description = description
        self.threshold = threshold
        self.colorTheme = colorTheme
        self.unlockedDate = unlockedDate
        self.isUnlocked = isUnlocked
    }
}

// MARK: - Misiones Semanales
struct Capa9Mission: Codable, Identifiable {
    let id: UUID
    let title: String              // "Semana de las Palabras que Calman"
    let description: String
    let actions: [String]
    let durationDays: Int
    let completed: Bool
    let startDate: Date?
    let endDate: Date?
    let category: Capa9MissionCategory
    
    init(id: UUID = UUID(), title: String, description: String, actions: [String], durationDays: Int, completed: Bool = false, startDate: Date? = nil, endDate: Date? = nil, category: Capa9MissionCategory) {
        self.id = id
        self.title = title
        self.description = description
        self.actions = actions
        self.durationDays = durationDays
        self.completed = completed
        self.startDate = startDate
        self.endDate = endDate
        self.category = category
    }
}

// MARK: - Badges Emocionales
struct Capa9Badge: Codable, Identifiable {
    let id: UUID
    let name: String               // "Escucha Activa"
    let meaning: String            // qué representa emocionalmente
    let unlockedDate: Date?
    let symbol: String             // ícono o ilustración simbólica
    let category: Capa9BadgeCategory
    let isUnlocked: Bool
    
    init(id: UUID = UUID(), name: String, meaning: String, unlockedDate: Date? = nil, symbol: String, category: Capa9BadgeCategory, isUnlocked: Bool = false) {
        self.id = id
        self.name = name
        self.meaning = meaning
        self.unlockedDate = unlockedDate
        self.symbol = symbol
        self.category = category
        self.isUnlocked = isUnlocked
    }
}

// MARK: - Árbol del Crecimiento
struct Capa9Tree: Codable {
    let stageLevel: Int
    let leavesCount: Int
    let lastGrowthDate: Date?
    let colorState: String
    let isBlooming: Bool
    
    init(stageLevel: Int = 1, leavesCount: Int = 0, lastGrowthDate: Date? = nil, colorState: String = "green", isBlooming: Bool = false) {
        self.stageLevel = stageLevel
        self.leavesCount = leavesCount
        self.lastGrowthDate = lastGrowthDate
        self.colorState = colorState
        self.isBlooming = isBlooming
    }
}

// MARK: - Progreso General
struct Capa9Progress: Codable {
    let totalSessions: Int
    let lastMissionCompleted: String?
    let currentStage: String
    let badgesUnlocked: Int
    let lastActivity: Date
    let totalConnectionMinutes: TimeInterval
    
    init(totalSessions: Int = 0, lastMissionCompleted: String? = nil, currentStage: String = "Conexión", badgesUnlocked: Int = 0, lastActivity: Date = Date(), totalConnectionMinutes: TimeInterval = 0) {
        self.totalSessions = totalSessions
        self.lastMissionCompleted = lastMissionCompleted
        self.currentStage = currentStage
        self.badgesUnlocked = badgesUnlocked
        self.lastActivity = lastActivity
        self.totalConnectionMinutes = totalConnectionMinutes
    }
}

// MARK: - Categorías
enum Capa9MissionCategory: String, Codable, CaseIterable {
    case connection = "Conexión"
    case regulation = "Regulación"
    case communication = "Comunicación"
    case consistency = "Consistencia"
    case presence = "Presencia"
    
    var icon: String {
        switch self {
        case .connection: return "heart.circle.fill"
        case .regulation: return "brain.head.profile"
        case .communication: return "bubble.left.and.bubble.right.fill"
        case .consistency: return "repeat.circle.fill"
        case .presence: return "leaf.fill"
        }
    }
    
    var color: Color {
        switch self {
        case .connection: return .red
        case .regulation: return .blue
        case .communication: return .purple
        case .consistency: return .orange
        case .presence: return .green
        }
    }
}

enum Capa9BadgeCategory: String, Codable, CaseIterable {
    case empathy = "Empatía"
    case patience = "Paciencia"
    case wisdom = "Sabiduría"
    case love = "Amor"
    case growth = "Crecimiento"
    
    var icon: String {
        switch self {
        case .empathy: return "heart.fill"
        case .patience: return "clock.fill"
        case .wisdom: return "lightbulb.fill"
        case .love: return "heart.circle.fill"
        case .growth: return "leaf.fill"
        }
    }
    
    var color: Color {
        switch self {
        case .empathy: return .pink
        case .patience: return .green
        case .wisdom: return .yellow
        case .love: return .red
        case .growth: return .mint
        }
    }
}

// MARK: - Modelo Principal
struct Capa9CirculoDeCrecimiento: Identifiable, Codable {
    let id: UUID
    let titulo: String
    let descripcion: String
    let introduccion: String
    let stages: [Capa9Stage]
    let missions: [Capa9Mission]
    let badges: [Capa9Badge]
    let tree: Capa9Tree
    let progress: Capa9Progress
    
    init() {
        self.id = UUID()
        self.titulo = "Círculo de Crecimiento"
        self.descripcion = "Tu viaje de transformación como padre presente"
        self.introduccion = "El Círculo de Crecimiento representa el proceso de transformación parental. Cada acción empática, cada juego compartido, cada momento de conexión 'riega' un árbol simbólico que florece con calma, presencia y conciencia."
        self.stages = []
        self.missions = []
        self.badges = []
        self.tree = Capa9Tree()
        self.progress = Capa9Progress()
    }
}

// MARK: - Contenido Predefinido

extension Capa9CirculoDeCrecimiento {
    
    // MARK: - Etapas de Crecimiento
    static let predefinedStages: [Capa9Stage] = [
        Capa9Stage(
            title: "Conexión",
            description: "Aprendes a conectar emocionalmente con tu hijo",
            threshold: 0,
            colorTheme: "red"
        ),
        
        Capa9Stage(
            title: "Regulación",
            description: "Desarrollas habilidades de co-regulación emocional",
            threshold: 25,
            colorTheme: "blue"
        ),
        
        Capa9Stage(
            title: "Integración",
            description: "Integras teoría y práctica en tu crianza diaria",
            threshold: 50,
            colorTheme: "purple"
        ),
        
        Capa9Stage(
            title: "Presencia",
            description: "Alcanzas la presencia consciente y la sabiduría parental",
            threshold: 75,
            colorTheme: "green"
        )
    ]
    
    // MARK: - Misiones Semanales
    static let predefinedMissions: [Capa9Mission] = [
        Capa9Mission(
            title: "Semana de las Palabras que Calman",
            description: "Practica el uso de lenguaje que conecta y calma",
            actions: [
                "Usa 'Veo que estás...' en lugar de 'No hagas...'",
                "Valida una emoción cada día",
                "Respira antes de hablar cuando sientas tensión",
                "Dile 'Te amo' al menos una vez al día"
            ],
            durationDays: 7,
            category: .communication
        ),
        
        Capa9Mission(
            title: "Semana de la Conexión Pura",
            description: "Dedica tiempo sin distracciones a conectar con tu hijo",
            actions: [
                "15 minutos diarios sin pantallas",
                "Contacto visual durante las conversaciones",
                "Un abrazo largo cada día",
                "Escucha activa sin interrumpir"
            ],
            durationDays: 7,
            category: .connection
        ),
        
        Capa9Mission(
            title: "Semana de la Pausa Serena",
            description: "Practica la pausa antes de reaccionar",
            actions: [
                "Respira 3 veces antes de responder",
                "Cuenta hasta 5 cuando sientas enojo",
                "Usa la frase 'Necesito un momento'",
                "Practica la meditación de 2 minutos diarios"
            ],
            durationDays: 7,
            category: .regulation
        ),
        
        Capa9Mission(
            title: "Semana de la Presencia Consciente",
            description: "Desarrolla la presencia plena en cada momento",
            actions: [
                "Una actividad diaria con atención plena",
                "Observa sin juzgar las emociones de tu hijo",
                "Practica la gratitud antes de dormir",
                "Disfruta un momento de silencio compartido"
            ],
            durationDays: 7,
            category: .presence
        ),
        
        Capa9Mission(
            title: "Semana de la Constancia Amorosa",
            description: "Mantén límites con amor y consistencia",
            actions: [
                "Conexión antes que corrección",
                "Explica el por qué de cada límite",
                "Repara después de cada conflicto",
                "Celebra los esfuerzos, no solo los resultados"
            ],
            durationDays: 7,
            category: .consistency
        )
    ]
    
    // MARK: - Badge IDs (constantes para referencia)
    static let badgeEscuchaActivaId = "badge_escucha_activa"
    static let badgePausaSerenaId = "badge_pausa_serena"
    static let badgeValidacionId = "badge_validacion"
    static let badgeConexionProfundaId = "badge_conexion_profunda"
    static let badgeSabiduriaId = "badge_sabiduria"
    static let badgePresenciaId = "badge_presencia"
    static let badgeCoreguladorId = "badge_coregulador"
    static let badgeMaestroLimitesId = "badge_maestro_limites"
    
    // MARK: - Badges Emocionales (con IDs y criterios de desbloqueo)
    static let predefinedBadges: [Capa9Badge] = [
        Capa9Badge(
            name: "Escucha Activa",
            meaning: "Has desarrollado la capacidad de escuchar con el corazón",
            symbol: "ear.fill",
            category: .empathy
        ),
        
        Capa9Badge(
            name: "Pausa Serena",
            meaning: "Dominas el arte de la pausa antes de reaccionar",
            symbol: "pause.circle.fill",
            category: .patience
        ),
        
        Capa9Badge(
            name: "Validación Emocional",
            meaning: "Reconoces y validas todas las emociones de tu hijo",
            symbol: "checkmark.circle.fill",
            category: .love
        ),
        
        Capa9Badge(
            name: "Conexión Profunda",
            meaning: "Has creado un vínculo inquebrantable",
            symbol: "heart.circle.fill",
            category: .love
        ),
        
        Capa9Badge(
            name: "Sabiduría Parental",
            meaning: "Integras conocimiento y experiencia con amor",
            symbol: "lightbulb.fill",
            category: .wisdom
        ),
        
        Capa9Badge(
            name: "Presencia Consciente",
            meaning: "Estás presente en cada momento con tu hijo",
            symbol: "leaf.fill",
            category: .growth
        ),
        
        Capa9Badge(
            name: "Co-regulador",
            meaning: "Ayudas a tu hijo a regular sus emociones",
            symbol: "figure.2.and.child.holdinghands",
            category: .empathy
        ),
        
        Capa9Badge(
            name: "Maestro de Límites",
            meaning: "Estableces límites con amor y firmeza",
            symbol: "shield.fill",
            category: .wisdom
        ),
        
        Capa9Badge(
            name: "Jardín de Calma",
            meaning: "Creas espacios de paz y tranquilidad",
            symbol: "tree.fill",
            category: .growth
        ),
        
        Capa9Badge(
            name: "Círculo Completo",
            meaning: "Has completado tu transformación como padre",
            symbol: "circle.fill",
            category: .growth
        )
    ]
}