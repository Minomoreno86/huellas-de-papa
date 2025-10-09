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
        case "cerebro-nino-siegel":
            return ModuloElCerebroDeUnNino()
        case "te-amo-cuando-enojado":
            return ModuloTeAmoCuandoEstasEnojado()
        // Aquí se agregarán los otros 21 módulos
        default:
            return nil
        }
    }
    
    static func crearVistaCapa(paraModulo moduloId: String, capa: TipoCapa) -> AnyView {
        switch moduloId {
        case "cerebro-nino-explicado-padres":
            return crearVistaCapaCerebroDelNino(capa: capa)
        case "cerebro-nino-siegel":
            return crearVistaCapaElCerebroDeUnNino(capa: capa)
        case "yes-brain":
            return crearVistaCapaYesBrain(capa: capa)
        case "tengo-volcan":
            return crearVistaCapaTengoUnVolcan(capa: capa)
        case "te-amo-cuando-enojado":
            return crearVistaCapaTeAmoCuandoEstasEnojado(capa: capa)
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
            return AnyView(YB8ModoNinoView())
        case .gamificacion:
            print("🔍 DEBUG: Creando Capa9View de The Yes Brain...")
            return AnyView(C9View())
        }
    }
    
    private static func crearVistaCapaTengoUnVolcan(capa: TipoCapa) -> AnyView {
        print("🔍 DEBUG: Creando vista Tengo un Volcán para capa: \(capa)")
        
        switch capa {
        case .fundamentos:
            print("🔍 DEBUG: Creando TV1View de Tengo un Volcán...")
            return AnyView(TV1View())
        case .principios:
            print("🔍 DEBUG: Creando TV2View de Tengo un Volcán...")
            return AnyView(TV2View())
        case .herramientas:
            print("🔍 DEBUG: Creando TV3View de Tengo un Volcán...")
            return AnyView(TV3View())
        case .simulaciones:
            print("🔍 DEBUG: Creando TV4View de Tengo un Volcán...")
            return AnyView(TV4View())
        case .aplicacionCasa:
            print("🔍 DEBUG: Creando TV5View de Tengo un Volcán...")
            return AnyView(TV5View())
        case .planEntrenamiento:
            print("🔍 DEBUG: Creando TV6View de Tengo un Volcán...")
            return AnyView(TV6View())
        case .reflexion:
            print("🔍 DEBUG: Creando TV7View de Tengo un Volcán...")
            return AnyView(TV7View())
        case .modoNino:
            print("🔍 DEBUG: Creando TV8View de Tengo un Volcán...")
            return AnyView(TV8View())
        case .gamificacion:
            print("🔍 DEBUG: Creando TV9View de Tengo un Volcán...")
            return AnyView(TV9View())
        }
    }
    
    private static func crearVistaCapaElCerebroDeUnNino(capa: TipoCapa) -> AnyView {
        print("🔍 DEBUG: Creando vista El Cerebro de Un Niño para capa: \(capa)")
        
        switch capa {
        case .fundamentos:
            print("🔍 DEBUG: Creando CN1View de El Cerebro de Un Niño...")
            return AnyView(CN1View())
        case .principios:
            print("🔍 DEBUG: Creando CN2View de El Cerebro de Un Niño...")
            return AnyView(CN2View())
        case .herramientas:
            print("🔍 DEBUG: Creando CN3View de El Cerebro de Un Niño...")
            return AnyView(CN3View())
        case .simulaciones:
            print("🔍 DEBUG: Creando CN4View de El Cerebro de Un Niño...")
            return AnyView(CN4View())
        case .aplicacionCasa:
            print("🔍 DEBUG: Creando CN5View de El Cerebro de Un Niño...")
            return AnyView(CN5View())
        case .planEntrenamiento:
            print("🔍 DEBUG: Creando CN6View de El Cerebro de Un Niño...")
            return AnyView(CN6View())
        case .reflexion:
            print("🔍 DEBUG: Creando CN7View de El Cerebro de Un Niño...")
            return AnyView(CN7View())
        case .modoNino:
            print("🔍 DEBUG: Creando CN8View de El Cerebro de Un Niño...")
            return AnyView(CN8View())
        case .gamificacion:
            print("🔍 DEBUG: Creando CN9View de El Cerebro de Un Niño...")
            return AnyView(CN9View())
        }
    }
    
    private static func crearVistaCapaTeAmoCuandoEstasEnojado(capa: TipoCapa) -> AnyView {
        print("🔍 DEBUG: Creando vista Te Amo Cuando Estás Enojado para capa: \(capa)")
        
        switch capa {
        case .fundamentos:
            print("🔍 DEBUG: Creando TA1View de Te Amo Cuando Estás Enojado...")
            return AnyView(TA1View())
        case .principios:
            print("🔍 DEBUG: Creando TA2View de Te Amo Cuando Estás Enojado...")
            return AnyView(TA2View())
        case .herramientas:
            print("🔍 DEBUG: Creando TA3View de Te Amo Cuando Estás Enojado...")
            return AnyView(TA3View())
        case .simulaciones:
            print("🔍 DEBUG: Creando TA4View de Te Amo Cuando Estás Enojado...")
            return AnyView(TA4View())
        case .aplicacionCasa:
            print("🔍 DEBUG: Creando TA5View de Te Amo Cuando Estás Enojado...")
            return AnyView(Text("Capa 5 - En desarrollo"))
        case .planEntrenamiento:
            print("🔍 DEBUG: Creando TA6View de Te Amo Cuando Estás Enojado...")
            return AnyView(Text("Capa 6 - En desarrollo"))
        case .reflexion:
            print("🔍 DEBUG: Creando TA7View de Te Amo Cuando Estás Enojado...")
            return AnyView(Text("Capa 7 - En desarrollo"))
        case .modoNino:
            print("🔍 DEBUG: Creando TA8View de Te Amo Cuando Estás Enojado...")
            return AnyView(Text("Capa 8 - En desarrollo"))
        case .gamificacion:
            print("🔍 DEBUG: Creando TA9View de Te Amo Cuando Estás Enojado...")
            return AnyView(Text("Capa 9 - En desarrollo"))
        }
    }
}

// MARK: - Módulo Específico: El Cerebro de Un Niño (Daniel Siegel)
struct ModuloElCerebroDeUnNino: ProtocoloModulo {
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
        self.id = "cerebro-nino-siegel"
        self.titulo = "El cerebro del niño"
        self.autor = "Daniel J. Siegel"
        self.descripcion = "12 estrategias revolucionarias para cultivar la mente en desarrollo de tu hijo."
        self.icono = "brain.head.profile"
        self.color = "007AFF"
        self.categoria = .neurociencia
        self.enfoque = "Integración cerebral"
        self.publico = "Padres de 0-18 años"
        self.capas = TipoCapa.allCases
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

// MARK: - Módulo Específico: Te Amo Cuando Estás Enojado
struct ModuloTeAmoCuandoEstasEnojado: ProtocoloModulo {
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
        self.id = "te-amo-cuando-enojado"
        self.titulo = "Te amo cuando estás enojado"
        self.descripcion = "Cuento infantil sobre el amor incondicional a través de todas las emociones. Aprende a mantener el vínculo emocional con tu hijo incluso en momentos difíciles."
        self.autor = "Erin Winters"
        self.icono = "heart"
        self.color = "FF69B4"
        self.categoria = .gestionEmocional
        self.enfoque = "Vínculo emocional"
        self.publico = "Padres de 0-6 años"
        self.capas = TipoCapa.allCases
    }
}
