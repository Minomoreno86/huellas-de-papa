import Foundation

// MARK: - Estructura Base del Módulo
struct ModuloBase {
    let id: String
    let nombre: String
    let libro: LibroInfo
    let capas: [CapaBase]
    let validacion: ValidacionModulo
}

struct LibroInfo {
    let titulo: String
    let autor: String
    let tematica: String
    let enfoque: String
    let publico: String
}

struct ValidacionModulo {
    let tiempoTotal: Int // 20-25 horas
    let palabrasTotales: Int // 15,000-20,000
    let actividadesInteractivas: Int // 10+
    let medallas: Int // 12 exactas
}

// MARK: - Estructura Base de Capas
protocol CapaBase {
    var id: String { get }
    var nombre: String { get }
    var completada: Bool { get set }
    var progreso: Double { get set }
}

// MARK: - Enums para Tipos de Capas
enum TipoCapa: String, CaseIterable {
    case fundamentos = "fundamentos"
    case principios = "principios"
    case herramientas = "herramientas"
    case simulaciones = "simulaciones"
    case aplicacionCasa = "aplicacion-casa"
    case planEntrenamiento = "plan-entrenamiento"
    case reflexion = "reflexion"
    case modoNino = "modo-nino"
    case gamificacion = "gamificacion"
    
    var displayName: String {
        switch self {
        case .fundamentos: return "Fundamentos del Libro"
        case .principios: return "Principios Clave"
        case .herramientas: return "Herramientas Prácticas"
        case .simulaciones: return "Simulaciones Avanzadas"
        case .aplicacionCasa: return "Aplicación en Casa"
        case .planEntrenamiento: return "Plan de Entrenamiento"
        case .reflexion: return "Reflexión Profunda"
        case .modoNino: return "Modo Niño"
        case .gamificacion: return "Gamificación"
        }
    }
    
    var iconName: String {
        switch self {
        case .fundamentos: return "brain.head.profile"
        case .principios: return "target"
        case .herramientas: return "wrench.and.screwdriver"
        case .simulaciones: return "theatermasks"
        case .aplicacionCasa: return "house"
        case .planEntrenamiento: return "calendar"
        case .reflexion: return "book.pages"
        case .modoNino: return "figure.child"
        case .gamificacion: return "trophy"
        }
    }
}

// MARK: - Sistema de Progreso
class ProgresoManager: ObservableObject {
    @Published var progresoGeneral: Double = 0.0
    @Published var capasCompletadas: Set<String> = []
    @Published var puntosTotales: Int = 0
    @Published var medallasObtenidas: Set<String> = []
    
    func actualizarProgreso(capaId: String, completada: Bool) {
        if completada {
            capasCompletadas.insert(capaId)
        } else {
            capasCompletadas.remove(capaId)
        }
        calcularProgresoGeneral()
    }
    
    private func calcularProgresoGeneral() {
        let totalCapas = TipoCapa.allCases.count
        let capasCompletadasCount = capasCompletadas.count
        progresoGeneral = Double(capasCompletadasCount) / Double(totalCapas)
    }
    
    func agregarPuntos(_ puntos: Int) {
        puntosTotales += puntos
    }
    
    func obtenerMedalla(_ medallaId: String) {
        medallasObtenidas.insert(medallaId)
    }
}
