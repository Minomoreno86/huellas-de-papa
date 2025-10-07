import Foundation

// MARK: - Módulo Disponible en la Home
struct ModuloDisponible: Identifiable, Hashable {
    let id: String
    let titulo: String
    let autor: String
    let tematica: String
    let enfoque: String
    let publico: String
    let icono: String
    let color: String
    let progreso: Double
    let medallasObtenidas: Int
    let medallasTotales: Int
    let estaCompletado: Bool
    let esFavorito: Bool
    let tiempoEstimado: String // "20-25 horas"
    let dificultad: NivelDificultad
    let categoria: CategoriaModulo
}

// MARK: - Enums de Clasificación
enum NivelDificultad: String, CaseIterable {
    case principiante = "principiante"
    case intermedio = "intermedio"
    case avanzado = "avanzado"
    
    var displayName: String {
        switch self {
        case .principiante: return "Principiante"
        case .intermedio: return "Intermedio"
        case .avanzado: return "Avanzado"
        }
    }
    
    var color: String {
        switch self {
        case .principiante: return "green"
        case .intermedio: return "orange"
        case .avanzado: return "red"
        }
    }
}

enum CategoriaModulo: String, CaseIterable, Codable {
    case neurociencia = "neurociencia"
    case gestionEmocional = "gestion-emocional"
    case imaginacion = "imaginacion"
    case herramientas = "herramientas"
    case relacionPadreHija = "relacion-padre-hija"
    case sueno = "sueno"
    case autoconoceimiento = "autoconoceimiento"
    
    var displayName: String {
        switch self {
        case .neurociencia: return "Neurociencia y Desarrollo Cerebral"
        case .gestionEmocional: return "Gestión Emocional y Apego"
        case .imaginacion: return "Imaginación y Juego"
        case .herramientas: return "Herramientas Prácticas"
        case .relacionPadreHija: return "Relación Padre-Hija"
        case .sueno: return "Sueño y Desarrollo Temprano"
        case .autoconoceimiento: return "Autoconocimiento y Reflexión"
        }
    }
    
    var icono: String {
        switch self {
        case .neurociencia: return "brain.head.profile"
        case .gestionEmocional: return "heart"
        case .imaginacion: return "paintbrush"
        case .herramientas: return "wrench.and.screwdriver"
        case .relacionPadreHija: return "figure.2.and.child.holdinghands"
        case .sueno: return "moon"
        case .autoconoceimiento: return "person.crop.circle"
        }
    }
    
    var color: String {
        switch self {
        case .neurociencia: return "blue"
        case .gestionEmocional: return "pink"
        case .imaginacion: return "purple"
        case .herramientas: return "orange"
        case .relacionPadreHija: return "red"
        case .sueno: return "indigo"
        case .autoconoceimiento: return "teal"
        }
    }
}

// MARK: - Datos de Módulos Disponibles
extension ModuloDisponible {
    static func todosLosModulos() -> [ModuloDisponible] {
        return [
            // NEUROCIENCIA Y DESARROLLO CEREBRAL
            ModuloDisponible(
                id: "cerebro-nino-explicado-padres",
                titulo: "El cerebro del niño explicado a los padres",
                autor: "Álvaro Bilbao",
                tematica: "Neurociencia práctica de crianza",
                enfoque: "Desarrollo cerebral infantil",
                publico: "Padres de 0-12 años",
                icono: "brain.head.profile",
                color: "blue",
                progreso: 0.0,
                medallasObtenidas: 0,
                medallasTotales: 12,
                estaCompletado: false,
                esFavorito: false,
                tiempoEstimado: "20-25 horas",
                dificultad: .intermedio,
                categoria: .neurociencia
            ),
            
            ModuloDisponible(
                id: "cerebro-nino-siegel",
                titulo: "El cerebro del niño",
                autor: "Daniel J. Siegel",
                tematica: "Desarrollo cerebral y educación emocional",
                enfoque: "Integración cerebral",
                publico: "Padres de 0-18 años",
                icono: "brain.head.profile",
                color: "blue",
                progreso: 0.0,
                medallasObtenidas: 0,
                medallasTotales: 12,
                estaCompletado: false,
                esFavorito: false,
                tiempoEstimado: "20-25 horas",
                dificultad: .avanzado,
                categoria: .neurociencia
            ),
            
            ModuloDisponible(
                id: "yes-brain",
                titulo: "The Yes Brain",
                autor: "Daniel J. Siegel & Tina Payne Bryson",
                tematica: "Fomentar mentalidad abierta y resiliente",
                enfoque: "Neuroplasticidad positiva",
                publico: "Padres de 3-12 años",
                icono: "brain.head.profile",
                color: "blue",
                progreso: 0.0,
                medallasObtenidas: 0,
                medallasTotales: 12,
                estaCompletado: false,
                esFavorito: false,
                tiempoEstimado: "20-25 horas",
                dificultad: .intermedio,
                categoria: .neurociencia
            ),
            
            // GESTIÓN EMOCIONAL Y APEGO
            ModuloDisponible(
                id: "tengo-volcan",
                titulo: "Tengo un volcán",
                autor: "Mireia Canals",
                tematica: "Regulación de ira y emociones fuertes en niños",
                enfoque: "Autocontrol emocional",
                publico: "Padres de 3-8 años",
                icono: "heart",
                color: "pink",
                progreso: 0.0,
                medallasObtenidas: 0,
                medallasTotales: 12,
                estaCompletado: false,
                esFavorito: false,
                tiempoEstimado: "20-25 horas",
                dificultad: .principiante,
                categoria: .gestionEmocional
            ),
            
            ModuloDisponible(
                id: "te-amo-cuando-enojado",
                titulo: "Te amo cuando estás enojado",
                autor: "Mireia Canals",
                tematica: "Amor incondicional, apego seguro",
                enfoque: "Vínculo emocional",
                publico: "Padres de 0-6 años",
                icono: "heart",
                color: "pink",
                progreso: 0.0,
                medallasObtenidas: 0,
                medallasTotales: 12,
                estaCompletado: false,
                esFavorito: false,
                tiempoEstimado: "20-25 horas",
                dificultad: .principiante,
                categoria: .gestionEmocional
            ),
            
            ModuloDisponible(
                id: "besame-mucho",
                titulo: "Bésame mucho",
                autor: "Carlos González",
                tematica: "Crianza con apego y respeto",
                enfoque: "Apego seguro",
                publico: "Padres de 0-3 años",
                icono: "heart",
                color: "pink",
                progreso: 0.0,
                medallasObtenidas: 0,
                medallasTotales: 12,
                estaCompletado: false,
                esFavorito: false,
                tiempoEstimado: "20-25 horas",
                dificultad: .principiante,
                categoria: .gestionEmocional
            ),
            
            ModuloDisponible(
                id: "berrinches-herramientas",
                titulo: "Berrinches, herramientas para una crianza emocional",
                autor: "Mireia Canals",
                tematica: "Gestión de rabietas",
                enfoque: "Regulación emocional",
                publico: "Padres de 2-6 años",
                icono: "heart",
                color: "pink",
                progreso: 0.0,
                medallasObtenidas: 0,
                medallasTotales: 12,
                estaCompletado: false,
                esFavorito: false,
                tiempoEstimado: "20-25 horas",
                dificultad: .intermedio,
                categoria: .gestionEmocional
            ),
            
            ModuloDisponible(
                id: "confianza-100-expectativa-0",
                titulo: "Confianza 100, expectativa 0",
                autor: "Mireia Canals",
                tematica: "Criar desde la aceptación y confianza",
                enfoque: "Aceptación incondicional",
                publico: "Padres de 0-12 años",
                icono: "heart",
                color: "pink",
                progreso: 0.0,
                medallasObtenidas: 0,
                medallasTotales: 12,
                estaCompletado: false,
                esFavorito: false,
                tiempoEstimado: "20-25 horas",
                dificultad: .intermedio,
                categoria: .gestionEmocional
            ),
            
            // IMAGINACIÓN Y JUEGO
            ModuloDisponible(
                id: "cola-dragon",
                titulo: "La cola del dragón",
                autor: "Mireia Canals",
                tematica: "Manejo de miedos y fantasía infantil",
                enfoque: "Gestión de miedos",
                publico: "Padres de 3-8 años",
                icono: "paintbrush",
                color: "purple",
                progreso: 0.0,
                medallasObtenidas: 0,
                medallasTotales: 12,
                estaCompletado: false,
                esFavorito: false,
                tiempoEstimado: "20-25 horas",
                dificultad: .principiante,
                categoria: .imaginacion
            ),
            
            ModuloDisponible(
                id: "donde-viven-monstruos",
                titulo: "Donde viven los monstruos",
                autor: "Maurice Sendak",
                tematica: "Imaginación, juego simbólico y validación emocional",
                enfoque: "Desarrollo creativo",
                publico: "Padres de 3-10 años",
                icono: "paintbrush",
                color: "purple",
                progreso: 0.0,
                medallasObtenidas: 0,
                medallasTotales: 12,
                estaCompletado: false,
                esFavorito: false,
                tiempoEstimado: "20-25 horas",
                dificultad: .principiante,
                categoria: .imaginacion
            ),
            
            ModuloDisponible(
                id: "leon-dentro-mi",
                titulo: "Un león dentro de mí",
                autor: "Mireia Canals",
                tematica: "Autoestima, valentía y resiliencia",
                enfoque: "Fortaleza emocional",
                publico: "Padres de 4-10 años",
                icono: "paintbrush",
                color: "purple",
                progreso: 0.0,
                medallasObtenidas: 0,
                medallasTotales: 12,
                estaCompletado: false,
                esFavorito: false,
                tiempoEstimado: "20-25 horas",
                dificultad: .intermedio,
                categoria: .imaginacion
            ),
            
            // HERRAMIENTAS PRÁCTICAS
            ModuloDisponible(
                id: "lo-que-necesito-cuando-enfado",
                titulo: "Lo que necesito cuando me enfado",
                autor: "Mireia Canals",
                tematica: "Herramientas prácticas de autocontrol",
                enfoque: "Técnicas de regulación",
                publico: "Padres de 3-8 años",
                icono: "wrench.and.screwdriver",
                color: "orange",
                progreso: 0.0,
                medallasObtenidas: 0,
                medallasTotales: 12,
                estaCompletado: false,
                esFavorito: false,
                tiempoEstimado: "20-25 horas",
                dificultad: .principiante,
                categoria: .herramientas
            ),
            
            ModuloDisponible(
                id: "disciplina-sin-lagrimas",
                titulo: "Disciplina sin lágrimas",
                autor: "Daniel J. Siegel & Tina Payne Bryson",
                tematica: "Disciplina positiva y sin violencia",
                enfoque: "Límites respetuosos",
                publico: "Padres de 2-12 años",
                icono: "wrench.and.screwdriver",
                color: "orange",
                progreso: 0.0,
                medallasObtenidas: 0,
                medallasTotales: 12,
                estaCompletado: false,
                esFavorito: false,
                tiempoEstimado: "20-25 horas",
                dificultad: .intermedio,
                categoria: .herramientas
            ),
            
            ModuloDisponible(
                id: "disciplina-positiva",
                titulo: "Disciplina positiva",
                autor: "Jane Nelsen",
                tematica: "Modelo de educación democrática",
                enfoque: "Crianza democrática",
                publico: "Padres de 3-18 años",
                icono: "wrench.and.screwdriver",
                color: "orange",
                progreso: 0.0,
                medallasObtenidas: 0,
                medallasTotales: 12,
                estaCompletado: false,
                esFavorito: false,
                tiempoEstimado: "20-25 horas",
                dificultad: .avanzado,
                categoria: .herramientas
            ),
            
            ModuloDisponible(
                id: "como-hablar-ninos-escuchen",
                titulo: "Cómo hablar para que los niños escuchen…",
                autor: "Adele Faber & Elaine Mazlish",
                tematica: "Comunicación efectiva",
                enfoque: "Habilidades comunicativas",
                publico: "Padres de 2-18 años",
                icono: "wrench.and.screwdriver",
                color: "orange",
                progreso: 0.0,
                medallasObtenidas: 0,
                medallasTotales: 12,
                estaCompletado: false,
                esFavorito: false,
                tiempoEstimado: "20-25 horas",
                dificultad: .intermedio,
                categoria: .herramientas
            ),
            
            // RELACIÓN PADRE-HIJA
            ModuloDisponible(
                id: "se-papa-ella-necesita",
                titulo: "Sé el papá que ella necesita",
                autor: "Meg Meeker",
                tematica: "Vínculo especial padre-hija",
                enfoque: "Relación padre-hija",
                publico: "Padres de hijas 0-18 años",
                icono: "figure.2.and.child.holdinghands",
                color: "red",
                progreso: 0.0,
                medallasObtenidas: 0,
                medallasTotales: 12,
                estaCompletado: false,
                esFavorito: false,
                tiempoEstimado: "20-25 horas",
                dificultad: .intermedio,
                categoria: .relacionPadreHija
            ),
            
            ModuloDisponible(
                id: "educar-hijas-fuertes",
                titulo: "Educar hijas fuertes en sociedad líquida",
                autor: "Meg Meeker",
                tematica: "Resiliencia femenina",
                enfoque: "Fortaleza femenina",
                publico: "Padres de hijas 8-18 años",
                icono: "figure.2.and.child.holdinghands",
                color: "red",
                progreso: 0.0,
                medallasObtenidas: 0,
                medallasTotales: 12,
                estaCompletado: false,
                esFavorito: false,
                tiempoEstimado: "20-25 horas",
                dificultad: .avanzado,
                categoria: .relacionPadreHija
            ),
            
            ModuloDisponible(
                id: "padres-fuertes-hijas-felices",
                titulo: "Padres fuertes, hijas felices",
                autor: "Meg Meeker",
                tematica: "Seguridad y autoestima en niñas",
                enfoque: "Autoestima femenina",
                publico: "Padres de hijas 6-18 años",
                icono: "figure.2.and.child.holdinghands",
                color: "red",
                progreso: 0.0,
                medallasObtenidas: 0,
                medallasTotales: 12,
                estaCompletado: false,
                esFavorito: false,
                tiempoEstimado: "20-25 horas",
                dificultad: .intermedio,
                categoria: .relacionPadreHija
            ),
            
            // SUEÑO Y DESARROLLO TEMPRANO
            ModuloDisponible(
                id: "dormir-sin-lagrimas",
                titulo: "Dormir sin lágrimas",
                autor: "Rosa Jové",
                tematica: "Sueño respetuoso",
                enfoque: "Higiene del sueño",
                publico: "Padres de 0-5 años",
                icono: "moon",
                color: "indigo",
                progreso: 0.0,
                medallasObtenidas: 0,
                medallasTotales: 12,
                estaCompletado: false,
                esFavorito: false,
                tiempoEstimado: "20-25 horas",
                dificultad: .principiante,
                categoria: .sueno
            ),
            
            ModuloDisponible(
                id: "bebe-mamifero",
                titulo: "El bebé es un mamífero",
                autor: "Michel Odent",
                tematica: "Crianza natural, lactancia y apego",
                enfoque: "Crianza natural",
                publico: "Padres de 0-2 años",
                icono: "moon",
                color: "indigo",
                progreso: 0.0,
                medallasObtenidas: 0,
                medallasTotales: 12,
                estaCompletado: false,
                esFavorito: false,
                tiempoEstimado: "20-25 horas",
                dificultad: .principiante,
                categoria: .sueno
            ),
            
            // AUTOCONOCIMIENTO Y REFLEXIÓN
            ModuloDisponible(
                id: "tu-hijo-tu-espejo",
                titulo: "Tu hijo, tu espejo",
                autor: "Martha Alicia Chávez",
                tematica: "Autoconocimiento a través de la crianza",
                enfoque: "Reflexión personal",
                publico: "Padres de 0-18 años",
                icono: "person.crop.circle",
                color: "teal",
                progreso: 0.0,
                medallasObtenidas: 0,
                medallasTotales: 12,
                estaCompletado: false,
                esFavorito: false,
                tiempoEstimado: "20-25 horas",
                dificultad: .avanzado,
                categoria: .autoconoceimiento
            ),
            
            ModuloDisponible(
                id: "ni-agresivos-ni-sumisos",
                titulo: "Ni agresivos ni sumisos",
                autor: "Martha Alicia Chávez",
                tematica: "Crianza equilibrada en el carácter",
                enfoque: "Equilibrio emocional",
                publico: "Padres de 3-12 años",
                icono: "person.crop.circle",
                color: "teal",
                progreso: 0.0,
                medallasObtenidas: 0,
                medallasTotales: 12,
                estaCompletado: false,
                esFavorito: false,
                tiempoEstimado: "20-25 horas",
                dificultad: .intermedio,
                categoria: .autoconoceimiento
            ),
            
            // NUEVOS MÓDULOS SOLICITADOS
            
            ModuloDisponible(
                id: "nino-dejo-desastre",
                titulo: "El niño que dejó de ser un desastre",
                autor: "Daniel J. Siegel & Tina Payne Bryson",
                tematica: "Transformación y cambio positivo en niños",
                enfoque: "Neuroplasticidad y desarrollo",
                publico: "Padres de 3-12 años",
                icono: "brain.head.profile",
                color: "blue",
                progreso: 0.0,
                medallasObtenidas: 0,
                medallasTotales: 12,
                estaCompletado: false,
                esFavorito: false,
                tiempoEstimado: "20-25 horas",
                dificultad: .intermedio,
                categoria: .neurociencia
            ),
            
            ModuloDisponible(
                id: "caballero-creyo-si-mismo",
                titulo: "El caballero que creyó en sí mismo",
                autor: "Mireia Canals",
                tematica: "Autoestima y confianza en niños",
                enfoque: "Desarrollo de la confianza",
                publico: "Padres de 4-10 años",
                icono: "paintbrush",
                color: "purple",
                progreso: 0.0,
                medallasObtenidas: 0,
                medallasTotales: 12,
                estaCompletado: false,
                esFavorito: false,
                tiempoEstimado: "20-25 horas",
                dificultad: .principiante,
                categoria: .imaginacion
            ),
            
            ModuloDisponible(
                id: "siempre-seras-chico-especial",
                titulo: "Siempre serás un chico especial",
                autor: "Mireia Canals",
                tematica: "Valoración personal y amor incondicional",
                enfoque: "Autoestima y vínculo",
                publico: "Padres de 3-8 años",
                icono: "heart",
                color: "pink",
                progreso: 0.0,
                medallasObtenidas: 0,
                medallasTotales: 12,
                estaCompletado: false,
                esFavorito: false,
                tiempoEstimado: "20-25 horas",
                dificultad: .principiante,
                categoria: .gestionEmocional
            ),
            
            ModuloDisponible(
                id: "caballero-armadura-oxidada",
                titulo: "El caballero de la armadura oxidada",
                autor: "Robert Fisher",
                tematica: "Autoconocimiento y crecimiento personal",
                enfoque: "Reflexión y transformación",
                publico: "Padres y adultos",
                icono: "person.crop.circle",
                color: "teal",
                progreso: 0.0,
                medallasObtenidas: 0,
                medallasTotales: 12,
                estaCompletado: false,
                esFavorito: false,
                tiempoEstimado: "20-25 horas",
                dificultad: .avanzado,
                categoria: .autoconoceimiento
            ),
            
            ModuloDisponible(
                id: "tragate-sapo",
                titulo: "Trágate el sapo",
                autor: "Brian Tracy",
                tematica: "Productividad y gestión del tiempo",
                enfoque: "Herramientas de organización",
                publico: "Padres ocupados",
                icono: "wrench.and.screwdriver",
                color: "orange",
                progreso: 0.0,
                medallasObtenidas: 0,
                medallasTotales: 12,
                estaCompletado: false,
                esFavorito: false,
                tiempoEstimado: "20-25 horas",
                dificultad: .intermedio,
                categoria: .herramientas
            ),
            
            ModuloDisponible(
                id: "juanita-cosmos",
                titulo: "Juanita en el cosmos",
                autor: "Mireia Canals",
                tematica: "Imaginación, aventura y creatividad",
                enfoque: "Desarrollo creativo",
                publico: "Padres de 4-10 años",
                icono: "paintbrush",
                color: "purple",
                progreso: 0.0,
                medallasObtenidas: 0,
                medallasTotales: 12,
                estaCompletado: false,
                esFavorito: false,
                tiempoEstimado: "20-25 horas",
                dificultad: .principiante,
                categoria: .imaginacion
            ),
            
            ModuloDisponible(
                id: "primer-libro-educacion-financiera",
                titulo: "Mi primer libro de educación financiera",
                autor: "Floren Verdú",
                tematica: "Educación financiera para niños",
                enfoque: "Habilidades financieras básicas",
                publico: "Padres de 6-12 años",
                icono: "wrench.and.screwdriver",
                color: "orange",
                progreso: 0.0,
                medallasObtenidas: 0,
                medallasTotales: 12,
                estaCompletado: false,
                esFavorito: false,
                tiempoEstimado: "20-25 horas",
                dificultad: .intermedio,
                categoria: .herramientas
            )
        ]
    }
}
