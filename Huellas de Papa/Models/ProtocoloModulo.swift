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
        case "cerebro-del-nino":
            return ModuloCerebroDelNino()
        // Aquí se agregarán los otros 21 módulos
        default:
            return nil
        }
    }
    
    static func crearVistaCapa(paraModulo moduloId: String, capa: TipoCapa) -> AnyView {
        switch moduloId {
        case "cerebro-del-nino":
            return crearVistaCapaCerebroDelNino(capa: capa)
        // Aquí se agregarán las vistas de los otros módulos
        default:
            return AnyView(Text("Módulo no encontrado"))
        }
    }
    
    private static func crearVistaCapaCerebroDelNino(capa: TipoCapa) -> AnyView {
        switch capa {
        case .fundamentos:
            return AnyView(Capa1FundamentosView())
        case .principios:
            return AnyView(Capa2PrincipiosView())
        case .herramientas:
            return AnyView(Capa3HerramientasView())
        case .simulaciones:
            return AnyView(Capa4SimulacionesView())
        case .aplicacionCasa:
            return AnyView(Capa5AplicacionCasaView())
        case .planEntrenamiento:
            return AnyView(Capa6PlanEntrenamientoView())
        case .reflexion:
            return AnyView(Capa7ReflexionView())
        case .modoNino:
            return AnyView(Capa8ModoNinoView())
        case .gamificacion:
            return AnyView(Capa9GamificacionView())
        }
    }
}

// MARK: - Módulo Específico: El Cerebro del Niño
struct ModuloCerebroDelNino: ProtocoloModulo {
    let id = "cerebro-del-nino"
    let titulo = "El Cerebro del Niño explicado a los padres"
    let descripcion = "Comprende el desarrollo cerebral de tu hijo y aprende estrategias basadas en neurociencia para una crianza más efectiva."
    let autor = "Dr. Álvaro Bilbao"
    let icono = "brain.head.profile"
    let color = "007AFF"
    let categoria = CategoriaModulo.neurociencia
    let enfoque = "Científico"
    let publico = "Padres"
    let capas: [TipoCapa] = TipoCapa.allCases
}
