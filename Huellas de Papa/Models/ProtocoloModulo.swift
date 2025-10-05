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
        do {
            switch moduloId {
            case "cerebro-nino-explicado-padres":
                return crearVistaCapaCerebroDelNino(capa: capa)
            // Aquí se agregarán las vistas de los otros módulos
            default:
                return AnyView(Text("Módulo no encontrado: \(moduloId)"))
            }
        } catch {
            return AnyView(
                VStack {
                    Image(systemName: "exclamationmark.triangle")
                        .font(.largeTitle)
                        .foregroundColor(.red)
                    Text("Error al cargar la capa")
                        .font(.headline)
                    Text("Por favor, intenta de nuevo")
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
                .padding()
            )
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
            print("🔍 DEBUG: Creando Capa4SimulacionesView...")
            return AnyView(Capa4SimulacionesView())
        case .aplicacionCasa:
            print("🔍 DEBUG: Creando Capa5AplicacionCasaView...")
            return AnyView(Capa5AplicacionCasaView())
        case .planEntrenamiento:
            print("🔍 DEBUG: Creando Capa6PlanEntrenamientoView...")
            return AnyView(Capa6PlanEntrenamientoView())
        case .reflexion:
            print("🔍 DEBUG: Creando Capa7ReflexionView...")
            return AnyView(Capa7ReflexionView())
        case .modoNino:
            print("🔍 DEBUG: Creando Capa8ModoNinoView...")
            return AnyView(Capa8ModoNinoView())
        case .gamificacion:
            print("🔍 DEBUG: Creando Capa9GamificacionView...")
            return AnyView(Capa9GamificacionView())
        }
    }
}

// MARK: - Módulo Específico: El Cerebro del Niño
struct ModuloCerebroDelNino: ProtocoloModulo {
    let id = "cerebro-nino-explicado-padres"
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
