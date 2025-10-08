import Foundation
import SwiftUI

// MARK: - Protocolo Base para Módulos
protocol ProtocoloModulo: Identifiable, Codable {
    var id: String { get }
    var titulo: String { get }
    var descripcion: String { get }
    var autor: String { get }
    var icono: String { get }
    var color: String { get }
    var categoria: CategoriaModulo { get }
    var enfoque: String { get }
    var publico: String { get }
    var capas: [TipoCapa] { get }
}

// MARK: - Protocolo Base para Capas
protocol ProtocoloCapa: Identifiable, Codable {
    var id: UUID { get }
    var titulo: String { get }
    var descripcion: String { get }
    var icono: String { get }
    var color: String { get }
    var orden: Int { get }
}

// MARK: - Factory para Crear Módulos
class FactoryModulos {
    static func crearModulo(porId id: String) -> (any ProtocoloModulo)? {
        switch id {
        case "cerebro-nino-explicado-padres":
            return ModuloCerebroDelNino()
        // Aquí se agregarán los otros 21 módulos
        default:
            return nil
        }
    }
    
    static func crearVistaCapa(paraModulo moduloId: String, capa: TipoCapa) -> AnyView {
        switch moduloId {
        case "cerebro-nino-explicado-padres":
            return crearVistaCapaCerebroDelNino(capa: capa)
        case "yes-brain":
            return crearVistaCapaYesBrain(capa: capa)
        // Aquí se agregarán las vistas de los otros módulos
        default:
            return AnyView(Text("Módulo no encontrado: \(moduloId)"))
        }
    }
    
    private static func crearVistaCapaCerebroDelNino(capa: TipoCapa) -> AnyView {
        print("🔍 DEBUG: Creando vista para capa: \(capa)")
        
        switch capa {
        case .fundamentos:
            print("🔍 DEBUG: Creando Capa1FundamentosView...")
            return AnyView(Capa1FundamentosView())
        case .principios:
            print("🔍 DEBUG: Creando Capa2PrincipiosView...")
            return AnyView(Capa2PrincipiosView())
        case .herramientas:
            print("🔍 DEBUG: Creando Capa3HerramientasView...")
            return AnyView(Capa3HerramientasView())
        case .simulaciones:
            print("🔍 DEBUG: Creando Capa4SimulacionesAvanzadasView...")
            return AnyView(Capa4SimulacionesAvanzadasView())
        case .aplicacionCasa:
            print("🔍 DEBUG: Creando Capa5AplicacionCasaView...")
            return AnyView(Capa5AplicacionCasaView())
        case .planEntrenamiento:
            print("🔍 DEBUG: Creando Capa6PlanEntrenamientoView...")
            return AnyView(Capa6PlanEntrenamientoView())
        case .reflexion:
            print("🔍 DEBUG: Creando Capa7EvaluacionView...")
            return AnyView(Capa7EvaluacionView())
        case .modoNino:
            print("🔍 DEBUG: Creando Capa8ModoNinoView...")
            return AnyView(Capa8ModoNinoView())
        case .gamificacion:
            print("🔍 DEBUG: Creando Capa9CirculoDeCrecimientoView...")
            return AnyView(Capa9CirculoDeCrecimientoView())
        }
    }
    
    private static func crearVistaCapaYesBrain(capa: TipoCapa) -> AnyView {
        print("🔍 DEBUG: Creando vista Yes Brain para capa: \(capa)")
        
        switch capa {
        case .fundamentos:
            print("🔍 DEBUG: Creando Capa1View de The Yes Brain...")
            return AnyView(Capa1View())
        case .principios:
            print("🔍 DEBUG: Creando Capa2View de The Yes Brain...")
            return AnyView(Capa2View())
        case .herramientas:
            print("🔍 DEBUG: Creando Capa3View de The Yes Brain...")
            return AnyView(Capa3View())
        case .simulaciones:
            print("🔍 DEBUG: Creando Capa4View de The Yes Brain...")
            return AnyView(Capa4View())
        case .aplicacionCasa:
            print("🔍 DEBUG: Creando Capa5View de The Yes Brain...")
            return AnyView(Capa5View())
        case .planEntrenamiento:
            print("🔍 DEBUG: Creando Capa6View de The Yes Brain...")
            return AnyView(Capa6View())
        case .reflexion:
            print("🔍 DEBUG: Creando Capa7View de The Yes Brain...")
            return AnyView(Capa7View())
        case .modoNino:
            print("🔍 DEBUG: Creando Capa8View de The Yes Brain...")
            return AnyView(Text("Capa 8 - Modo Niño (En desarrollo)"))
        case .gamificacion:
            print("🔍 DEBUG: Creando Capa9View de The Yes Brain...")
            return AnyView(Text("Capa 9 - Círculo de Crecimiento (En desarrollo)"))
        }
    }
}

// MARK: - Módulo Específico: El Cerebro del Niño
struct ModuloCerebroDelNino: ProtocoloModulo {
    let id: String
    let titulo: String
    let descripcion: String
    let autor: String
    let icono: String
    let color: String
    let categoria: CategoriaModulo
    let enfoque: String
    let publico: String
    let capas: [TipoCapa]
    
    init() {
        self.id = "cerebro-nino-explicado-padres"
        self.titulo = "El Cerebro del Niño explicado a los padres"
        self.descripcion = "Comprende el desarrollo cerebral de tu hijo y aprende estrategias basadas en neurociencia para una crianza más efectiva."
        self.autor = "Dr. Álvaro Bilbao"
        self.icono = "brain.head.profile"
        self.color = "007AFF"
        self.categoria = .neurociencia
        self.enfoque = "Científico"
        self.publico = "Padres"
        self.capas = TipoCapa.allCases
    }
}
