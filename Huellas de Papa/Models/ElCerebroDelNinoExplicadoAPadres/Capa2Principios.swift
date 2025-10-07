import Foundation

// MARK: - CAPA 2: PRINCIPIOS CLAVE BILBAO
// Modelos de datos para los principios neuropsicológicos de Álvaro Bilbao
// Basados en "El cerebro del niño explicado a los padres"

// MARK: - Modelo Principal del Principio
/// Representa un principio clave de la neurociencia aplicada a la crianza según Bilbao
struct Capa2Principio: Identifiable, Codable {
    let id: UUID
    let titulo: String
    let explicacionTeorica: String
    let ejemploPractico: String
    let aplicacionEmocional: String
    let erroresComunes: [String]
    let fraseGuia: String
    let baseNeurocientifica: String
    let icono: String
    let color: String
    let categoria: Capa2Categoria
    let vinculosCapa1: [String] // Referencias a fundamentos de Capa 1
    let vinculosCapa3: [String] // Referencias futuras a herramientas de Capa 3
    
    init(
        titulo: String,
        explicacionTeorica: String,
        ejemploPractico: String,
        aplicacionEmocional: String,
        erroresComunes: [String],
        fraseGuia: String,
        baseNeurocientifica: String,
        icono: String,
        color: String,
        categoria: Capa2Categoria,
        vinculosCapa1: [String] = [],
        vinculosCapa3: [String] = []
    ) {
        self.id = UUID()
        self.titulo = titulo
        self.explicacionTeorica = explicacionTeorica
        self.ejemploPractico = ejemploPractico
        self.aplicacionEmocional = aplicacionEmocional
        self.erroresComunes = erroresComunes
        self.fraseGuia = fraseGuia
        self.baseNeurocientifica = baseNeurocientifica
        self.icono = icono
        self.color = color
        self.categoria = categoria
        self.vinculosCapa1 = vinculosCapa1
        self.vinculosCapa3 = vinculosCapa3
    }
}

// MARK: - Categorías de Principios
/// Categorías temáticas para organizar los principios de Bilbao
enum Capa2Categoria: String, CaseIterable, Codable {
    case conexion = "Conexión"
    case regulacion = "Regulación"
    case limites = "Límites"
    case aprendizaje = "Aprendizaje"
    case desarrollo = "Desarrollo"
    case emociones = "Emociones"
    
    var descripcion: String {
        switch self {
        case .conexion:
            return "Principios sobre la conexión emocional y el vínculo"
        case .regulacion:
            return "Estrategias de autorregulación y calma"
        case .limites:
            return "Establecimiento de límites saludables"
        case .aprendizaje:
            return "Procesos de aprendizaje y neuroplasticidad"
        case .desarrollo:
            return "Desarrollo cerebral y ventanas de oportunidad"
        case .emociones:
            return "Manejo y comprensión emocional"
        }
    }
    
    var icono: String {
        switch self {
        case .conexion: return "heart.fill"
        case .regulacion: return "brain.head.profile"
        case .limites: return "shield.fill"
        case .aprendizaje: return "book.fill"
        case .desarrollo: return "leaf.fill"
        case .emociones: return "face.smiling.fill"
        }
    }
    
    var color: String {
        switch self {
        case .conexion: return "red"
        case .regulacion: return "blue"
        case .limites: return "orange"
        case .aprendizaje: return "green"
        case .desarrollo: return "purple"
        case .emociones: return "pink"
        }
    }
}

// MARK: - Grupo de Principios
/// Agrupa los principios por categoría y proporciona funcionalidades de gestión
struct Capa2GrupoPrincipios: Identifiable, Codable {
    let id: UUID
    let categoria: Capa2Categoria
    let principios: [Capa2Principio]
    let introduccion: String
    let resumen: String
    
    init(categoria: Capa2Categoria, principios: [Capa2Principio], introduccion: String, resumen: String) {
        self.id = UUID()
        self.categoria = categoria
        self.principios = principios
        self.introduccion = introduccion
        self.resumen = resumen
    }
}

// MARK: - Cita del Autor
/// Representa una cita específica de Álvaro Bilbao relacionada con un principio
struct Capa2CitaAutor: Identifiable, Codable {
    let id: UUID
    let texto: String
    let contexto: String
    let fuente: String
    let pagina: Int?
    
    init(texto: String, contexto: String, fuente: String, pagina: Int? = nil) {
        self.id = UUID()
        self.texto = texto
        self.contexto = contexto
        self.fuente = fuente
        self.pagina = pagina
    }
}

// MARK: - Vínculo Neuro-Axial
/// Representa la conexión entre un principio y los fundamentos neuropsicológicos
struct Capa2VinculoNeuroAxial: Identifiable, Codable {
    let id: UUID
    let principioId: UUID
    let fundamentoNeuro: String
    let explicacionConexion: String
    let aplicacionPractica: String
    
    init(principioId: UUID, fundamentoNeuro: String, explicacionConexion: String, aplicacionPractica: String) {
        self.id = UUID()
        self.principioId = principioId
        self.fundamentoNeuro = fundamentoNeuro
        self.explicacionConexion = explicacionConexion
        self.aplicacionPractica = aplicacionPractica
    }
}

// MARK: - Gestor de Principios
/// Clase principal que gestiona todos los principios de la Capa 2
class Capa2GestorPrincipios: ObservableObject {
    @Published var principios: [Capa2Principio] = []
    @Published var grupos: [Capa2GrupoPrincipios] = []
    @Published var citas: [Capa2CitaAutor] = []
    @Published var vinculos: [Capa2VinculoNeuroAxial] = []
    
    init() {
        cargarPrincipiosBilbao()
        organizarEnGrupos()
        cargarCitasAutor()
        establecerVinculos()
    }
    
    /// Carga los principios clave de Álvaro Bilbao
    private func cargarPrincipiosBilbao() {
        self.principios = [
            // PRINCIPIO 1: El cerebro del niño no es un cerebro adulto pequeño
            Capa2Principio(
                titulo: "El cerebro del niño no es un cerebro adulto pequeño",
                explicacionTeorica: "Álvaro Bilbao explica que el cerebro infantil tiene características únicas: mayor neuroplasticidad, corteza prefrontal inmadura, y sistemas emocionales más reactivos. Comprender estas diferencias es fundamental para una crianza efectiva.",
                ejemploPractico: "Cuando un niño de 3 años tiene una rabieta en el supermercado, no es por capricho. Su corteza prefrontal (centro de autorregulación) aún no está desarrollada, por lo que necesita que actuemos como su 'cerebro de arriba' temporal.",
                aplicacionEmocional: "Esta comprensión transforma la frustración en empatía. En lugar de exigir autocontrol prematuro, ofrecemos regulación externa y paciencia mientras su cerebro madura naturalmente.",
                erroresComunes: [
                    "Esperar autorregulación emocional antes de tiempo",
                    "Comparar comportamientos con estándares adultos",
                    "Ignorar las necesidades específicas de cada edad"
                ],
                fraseGuia: "Cada edad tiene su cerebro, cada cerebro tiene su tiempo.",
                baseNeurocientifica: "Neuroplasticidad, maduración cortical, desarrollo prefrontal",
                icono: "brain.head.profile",
                color: "blue",
                categoria: .desarrollo,
                vinculosCapa1: ["Arquitectura cerebral", "Ventanas de desarrollo"],
                vinculosCapa3: ["Herramientas de regulación", "Estrategias de calma"]
            ),
            
            // PRINCIPIO 2: Primero conectar, luego corregir
            Capa2Principio(
                titulo: "Primero conectar, luego corregir",
                explicacionTeorica: "Cuando un niño está en crisis emocional, su sistema límbico (emociones) domina y desconecta temporalmente la corteza prefrontal (razón). Intentar corregir sin conectar emocionalmente es inútil.",
                ejemploPractico: "Tu hijo de 4 años pega a su hermana. En lugar de regañar inmediatamente, primero te acercas, lo abrazas y dices: 'Veo que estás muy enojado'. Solo después de conectarte emocionalmente, abordas el comportamiento.",
                aplicacionEmocional: "La conexión emocional activa el sistema de calma (parasimpático) y libera oxitocina. Esto permite que el niño acceda a su cerebro racional para procesar la corrección de manera efectiva.",
                erroresComunes: [
                    "Corregir sin conectar emocionalmente primero",
                    "Ignorar las emociones del niño",
                    "Usar castigos sin comprensión emocional"
                ],
                fraseGuia: "El amor abre la puerta al aprendizaje.",
                baseNeurocientifica: "Sistema nervioso parasimpático, oxitocina, regulación emocional",
                icono: "heart.fill",
                color: "red",
                categoria: .conexion,
                vinculosCapa1: ["Sistema límbico", "Corteza prefrontal"],
                vinculosCapa3: ["Técnicas de conexión", "Estrategias de disciplina"]
            ),
            
            // PRINCIPIO 3: El amor construye el cerebro
            Capa2Principio(
                titulo: "El amor construye el cerebro",
                explicacionTeorica: "Las experiencias de amor y conexión crean literalmente nuevas conexiones neuronales. El cerebro se desarrolla en respuesta a las relaciones significativas, especialmente durante los primeros años de vida.",
                ejemploPractico: "Cada abrazo, cada 'te amo', cada momento de conexión genuina fortalece las vías neuronales del amor, la confianza y la seguridad en tu hijo. Estas conexiones se convierten en la base de su bienestar emocional futuro.",
                aplicacionEmocional: "Comprender que el amor es neurobiológicamente constructivo nos motiva a priorizar la conexión emocional. Cada expresión de amor es una inversión en el desarrollo cerebral de nuestros hijos.",
                erroresComunes: [
                    "Priorizar la disciplina sobre la conexión",
                    "Creer que el amor 'malcría' a los niños",
                    "Ignorar la importancia del contacto físico"
                ],
                fraseGuia: "Cada abrazo construye neuronas, cada 'te amo' fortalece conexiones.",
                baseNeurocientifica: "Neuroplasticidad, oxitocina, desarrollo de conexiones neuronales",
                icono: "heart.circle.fill",
                color: "pink",
                categoria: .conexion,
                vinculosCapa1: ["Desarrollo temprano", "Neuroplasticidad"],
                vinculosCapa3: ["Rutinas de conexión", "Expresiones de amor"]
            ),
            
            // PRINCIPIO 4: Nombrar emociones ayuda a regularlas
            Capa2Principio(
                titulo: "Nombrar emociones ayuda a regularlas",
                explicacionTeorica: "Al nombrar una emoción, activamos la corteza prefrontal izquierda, que es responsable del procesamiento del lenguaje y la regulación emocional. Esto ayuda a calmar la amígdala y procesar la experiencia emocional.",
                ejemploPractico: "Cuando tu hijo está llorando por frustración, en lugar de decir 'no llores', dices: 'Veo que te sientes frustrado'. El acto de nombrar la emoción ayuda a su cerebro a procesarla y regularla.",
                aplicacionEmocional: "Nombrar emociones valida la experiencia del niño y le enseña que las emociones son normales y manejables. Esto construye inteligencia emocional y autorregulación.",
                erroresComunes: [
                    "Minimizar o ignorar las emociones del niño",
                    "Decir 'no te preocupes' en lugar de validar",
                    "No enseñar vocabulario emocional"
                ],
                fraseGuia: "Las emociones nombradas son emociones domadas.",
                baseNeurocientifica: "Corteza prefrontal izquierda, amígdala, procesamiento del lenguaje",
                icono: "mouth.fill",
                color: "green",
                categoria: .emociones,
                vinculosCapa1: ["Procesamiento emocional", "Desarrollo del lenguaje"],
                vinculosCapa3: ["Vocabulario emocional", "Técnicas de regulación"]
            ),
            
            // PRINCIPIO 5: El castigo sin comprensión no enseña
            Capa2Principio(
                titulo: "El castigo sin comprensión no enseña",
                explicacionTeorica: "Los castigos que no van acompañados de comprensión y enseñanza crean miedo y desconexión, pero no desarrollan las habilidades internas necesarias para el comportamiento apropiado.",
                ejemploPractico: "En lugar de simplemente castigar a un niño por mentir, primero exploramos por qué mintió (miedo, vergüenza), validamos sus emociones, y luego enseñamos alternativas más saludables.",
                aplicacionEmocional: "La comprensión crea un ambiente de seguridad donde el niño puede aprender de sus errores sin sentirse rechazado. Esto fortalece el vínculo mientras enseña valores.",
                erroresComunes: [
                    "Castigar sin entender la causa del comportamiento",
                    "Usar castigos que generan miedo",
                    "No enseñar alternativas al comportamiento inapropiado"
                ],
                fraseGuia: "La disciplina efectiva enseña, no solo castiga.",
                baseNeurocientifica: "Aprendizaje emocional, memoria traumática, desarrollo moral",
                icono: "shield.fill",
                color: "orange",
                categoria: .limites,
                vinculosCapa1: ["Aprendizaje emocional", "Desarrollo moral"],
                vinculosCapa3: ["Estrategias de disciplina", "Enseñanza de valores"]
            ),
            
            // PRINCIPIO 6: La calma del adulto es el molde del autocontrol
            Capa2Principio(
                titulo: "La calma del adulto es el molde del autocontrol",
                explicacionTeorica: "Los niños aprenden la autorregulación principalmente a través de la co-regulación con adultos calmados. Nuestro estado emocional actúa como un 'molde' para el desarrollo de su sistema nervioso.",
                ejemploPractico: "Cuando tu hijo tiene una rabieta, mantener tu propia calma (respirar profundo, hablar suavemente) le enseña a su sistema nervioso cómo regularse. Tu calma se convierte en su calma.",
                aplicacionEmocional: "Comprender que somos el modelo de regulación emocional nos motiva a trabajar en nuestra propia autorregulación. Nuestra paz interior se convierte en el regalo más valioso para nuestros hijos.",
                erroresComunes: [
                    "Reaccionar emocionalmente a las emociones del niño",
                    "No trabajar en la propia autorregulación",
                    "Esperar que el niño se calme sin modelo"
                ],
                fraseGuia: "Tu calma es su aprendizaje más valioso.",
                baseNeurocientifica: "Co-regulación, espejo neuronal, desarrollo del autocontrol",
                icono: "brain.head.profile",
                color: "purple",
                categoria: .regulacion,
                vinculosCapa1: ["Co-regulación", "Sistema nervioso"],
                vinculosCapa3: ["Técnicas de calma personal", "Co-regulación"]
            ),
            
            // PRINCIPIO 7: El juego es el lenguaje del aprendizaje
            Capa2Principio(
                titulo: "El juego es el lenguaje del aprendizaje",
                explicacionTeorica: "El cerebro infantil está diseñado para aprender mejor a través del juego. El juego activa múltiples áreas cerebrales simultáneamente, fortalece conexiones neuronales y promueve la integración cerebral.",
                ejemploPractico: "En lugar de enseñar matemáticas con hojas de trabajo, juega a contar objetos en la cocina, a clasificar juguetes por colores, o a hacer patrones con bloques. El aprendizaje se vuelve natural y placentero.",
                aplicacionEmocional: "El juego crea un ambiente de alegría y seguridad que optimiza el aprendizaje. Cuando los niños disfrutan aprendiendo, se desarrollan actitudes positivas hacia la educación.",
                erroresComunes: [
                    "Priorizar el aprendizaje estructurado sobre el juego libre",
                    "Creer que el juego es 'perder tiempo'",
                    "No participar activamente en el juego del niño"
                ],
                fraseGuia: "Jugar es la forma más inteligente de aprender.",
                baseNeurocientifica: "Neuroplasticidad, integración cerebral, desarrollo sensorial",
                icono: "gamecontroller.fill",
                color: "yellow",
                categoria: .aprendizaje,
                vinculosCapa1: ["Neuroplasticidad", "Desarrollo sensorial"],
                vinculosCapa3: ["Actividades de juego", "Aprendizaje lúdico"]
            ),
            
            // PRINCIPIO 8: La ventana de oportunidad de los primeros 6 años
            Capa2Principio(
                titulo: "La ventana de oportunidad de los primeros 6 años",
                explicacionTeorica: "Los primeros 6 años representan una ventana crítica para el desarrollo cerebral. Durante este período, el cerebro forma conexiones neuronales a una velocidad extraordinaria (hasta 1000 por segundo) y es extraordinariamente sensible a las experiencias del entorno.",
                ejemploPractico: "Un niño de 3 años que recibe estimulación rica y amorosa desarrollará más conexiones neuronales que uno que pasa horas frente a pantallas. Cada interacción, cada juego, cada muestra de afecto tiene un impacto multiplicador en su desarrollo futuro.",
                aplicacionEmocional: "Comprender esta ventana de oportunidad nos motiva a priorizar la calidad del tiempo que pasamos con nuestros hijos pequeños. Cada momento es una inversión en su futuro bienestar emocional y cognitivo.",
                erroresComunes: [
                    "Creer que 'ya aprenderá después' y posponer experiencias importantes",
                    "Sobrecargar al niño con actividades sin permitir juego libre",
                    "Ignorar la importancia de las experiencias sensoriales tempranas"
                ],
                fraseGuia: "Los primeros 6 años son la inversión más rentable en el futuro.",
                baseNeurocientifica: "Ventana de oportunidad, poda sináptica, desarrollo temprano",
                icono: "clock.fill",
                color: "orange",
                categoria: .desarrollo,
                vinculosCapa1: ["Desarrollo temprano", "Neuroplasticidad"],
                vinculosCapa3: ["Actividades de estimulación", "Plan de desarrollo"]
            ),
            
            // PRINCIPIO 9: El estrés tóxico daña el cerebro en desarrollo
            Capa2Principio(
                titulo: "El estrés tóxico daña el cerebro en desarrollo",
                explicacionTeorica: "El estrés tóxico se refiere a la activación prolongada del sistema de respuesta al estrés en ausencia de relaciones de apoyo. En los niños, esto puede alterar la arquitectura cerebral, afectando la memoria, la regulación emocional y la capacidad de aprendizaje.",
                ejemploPractico: "Un niño que vive en un ambiente constantemente estresante (gritos, peleas, inseguridad) puede desarrollar un sistema de alarma hiperactivo que le dificulte concentrarse, aprender y regular sus emociones, incluso cuando el estrés externo disminuya.",
                aplicacionEmocional: "Comprender esto nos motiva a crear ambientes de calma y seguridad. Nuestra presencia amorosa y consistente actúa como un 'amortiguador' que protege el cerebro en desarrollo de los efectos dañinos del estrés.",
                erroresComunes: [
                    "Minimizar el impacto del estrés en los niños",
                    "Creer que los niños 'no se dan cuenta' de las tensiones",
                    "No proporcionar apoyo emocional durante situaciones estresantes"
                ],
                fraseGuia: "Tu calma protege su cerebro, tu amor sana su sistema nervioso.",
                baseNeurocientifica: "Estrés tóxico, cortisol, hipocampo, desarrollo cerebral alterado",
                icono: "shield.fill",
                color: "red",
                categoria: .regulacion,
                vinculosCapa1: ["Sistema de respuesta al estrés", "Cortisol"],
                vinculosCapa3: ["Técnicas de calma", "Ambientes seguros"]
            ),
            
            // PRINCIPIO 10: La integración cerebral es la base de la salud mental
            Capa2Principio(
                titulo: "La integración cerebral es la base de la salud mental",
                explicacionTeorica: "La integración cerebral ocurre cuando las diferentes regiones del cerebro trabajan juntas de manera coordinada. Un cerebro integrado puede acceder tanto a las emociones como al pensamiento racional, permitiendo respuestas flexibles y adaptativas.",
                ejemploPractico: "Un niño con cerebro integrado puede sentir enojo (sistema límbico) pero también pensar en alternativas (corteza prefrontal) para resolver un conflicto, en lugar de simplemente explotar emocionalmente.",
                aplicacionEmocional: "Fomentar la integración cerebral significa ayudar al niño a conectar sus emociones con su pensamiento, su cuerpo con su mente, y su individualidad con su conexión con otros. Esto construye resiliencia y bienestar emocional.",
                erroresComunes: [
                    "Intentar suprimir las emociones en lugar de integrarlas",
                    "Separar completamente la razón de la emoción",
                    "No ayudar al niño a procesar experiencias emocionales complejas"
                ],
                fraseGuia: "Un cerebro integrado es un cerebro resiliente y feliz.",
                baseNeurocientifica: "Integración cerebral, cuerpo calloso, conectividad funcional",
                icono: "brain.head.profile",
                color: "purple",
                categoria: .desarrollo,
                vinculosCapa1: ["Conexiones neuronales", "Integración"],
                vinculosCapa3: ["Ejercicios de integración", "Mindfulness infantil"]
            ),
            
            // PRINCIPIO 11: Los límites con amor crean seguridad
            Capa2Principio(
                titulo: "Los límites con amor crean seguridad",
                explicacionTeorica: "Los límites claros y consistentes, establecidos con amor y comprensión, proporcionan la estructura que el cerebro en desarrollo necesita para sentirse seguro. Los límites no son restricciones, sino contenedores que permiten la exploración segura.",
                ejemploPractico: "En lugar de decir 'No puedes jugar con eso' sin explicación, decir 'Ese juguete es para niños más grandes, pero puedes jugar con estos que son perfectos para tu edad'. El límite está claro, pero se explica con amor.",
                aplicacionEmocional: "Los límites amorosos crean un ambiente predecible donde el niño puede explorar con confianza. Sabe que sus necesidades serán atendidas y que está en un entorno seguro y estructurado.",
                erroresComunes: [
                    "Establecer límites sin explicación o comprensión",
                    "Ser inconsistente con las reglas",
                    "Usar límites como castigo en lugar de guía"
                ],
                fraseGuia: "Los límites son abrazos invisibles que protegen y guían.",
                baseNeurocientifica: "Desarrollo de la corteza prefrontal, seguridad, estructura",
                icono: "shield.lefthalf.filled",
                color: "blue",
                categoria: .limites,
                vinculosCapa1: ["Desarrollo prefrontal", "Seguridad"],
                vinculosCapa3: ["Estrategias de límites", "Disciplina positiva"]
            ),
            
            // PRINCIPIO 12: La curiosidad es el motor del aprendizaje
            Capa2Principio(
                titulo: "La curiosidad es el motor del aprendizaje",
                explicacionTeorica: "La curiosidad activa el sistema de recompensa del cerebro, liberando dopamina que motiva la exploración y el aprendizaje. Los niños naturalmente curiosos desarrollan mejores habilidades de resolución de problemas y pensamiento crítico.",
                ejemploPractico: "Cuando tu hijo pregunta '¿Por qué el cielo es azul?', en lugar de dar una respuesta rápida, puedes decir '¡Qué pregunta tan interesante! Vamos a descubrirlo juntos'. Esto alimenta su curiosidad y le enseña a investigar.",
                aplicacionEmocional: "Fomentar la curiosidad significa validar las preguntas del niño y mostrar entusiasmo por su deseo de aprender. Esto construye una actitud positiva hacia el aprendizaje que durará toda la vida.",
                erroresComunes: [
                    "Ignorar o minimizar las preguntas del niño",
                    "Dar respuestas que maten la curiosidad",
                    "Forzar el aprendizaje sin despertar interés"
                ],
                fraseGuia: "Cada pregunta es una semilla de sabiduría que merece ser cultivada.",
                baseNeurocientifica: "Sistema de recompensa, dopamina, motivación intrínseca",
                icono: "lightbulb.fill",
                color: "green",
                categoria: .aprendizaje,
                vinculosCapa1: ["Sistema de recompensa", "Dopamina"],
                vinculosCapa3: ["Actividades de exploración", "Investigación guiada"]
            )
        ]
    }
    
    /// Organiza los principios en grupos por categoría
    private func organizarEnGrupos() {
        var gruposTemporales: [Capa2Categoria: [Capa2Principio]] = [:]
        
        // Agrupar principios por categoría
        for principio in principios {
            if gruposTemporales[principio.categoria] == nil {
                gruposTemporales[principio.categoria] = []
            }
            gruposTemporales[principio.categoria]?.append(principio)
        }
        
        // Crear grupos estructurados
        self.grupos = gruposTemporales.map { categoria, principios in
            Capa2GrupoPrincipios(
                categoria: categoria,
                principios: principios.sorted { $0.titulo < $1.titulo },
                introduccion: introduccionPorCategoria(categoria),
                resumen: resumenPorCategoria(categoria)
            )
        }.sorted { $0.categoria.rawValue < $1.categoria.rawValue }
    }
    
    /// Proporciona introducción específica para cada categoría
    private func introduccionPorCategoria(_ categoria: Capa2Categoria) -> String {
        switch categoria {
        case .conexion:
            return "Los principios de conexión se centran en el vínculo emocional como base del desarrollo saludable. La conexión segura es el cimiento sobre el cual se construye todo el bienestar emocional del niño."
        case .regulacion:
            return "La regulación emocional es una habilidad fundamental que se desarrolla a través de la co-regulación con adultos calmados. Estos principios enseñan cómo ser el modelo de calma que nuestros hijos necesitan."
        case .limites:
            return "Los límites saludables proporcionan estructura y seguridad. Cuando se establecen con amor y comprensión, ayudan a los niños a desarrollar autodisciplina y respeto por los demás."
        case .aprendizaje:
            return "El aprendizaje óptimo ocurre cuando el cerebro está en un estado de curiosidad y juego. Estos principios muestran cómo crear ambientes que maximicen el potencial de aprendizaje natural."
        case .desarrollo:
            return "Comprender las etapas del desarrollo cerebral nos permite ajustar nuestras expectativas y estrategias. Cada edad tiene necesidades y capacidades específicas que debemos respetar."
        case .emociones:
            return "Las emociones son información valiosa sobre las necesidades del niño. Aprender a nombrar, validar y regular las emociones construye inteligencia emocional y resiliencia."
        }
    }
    
    /// Proporciona resumen específico para cada categoría
    private func resumenPorCategoria(_ categoria: Capa2Categoria) -> String {
        switch categoria {
        case .conexion:
            return "La conexión emocional es el ingrediente más poderoso para el desarrollo saludable. Cada momento de conexión genuina fortalece el vínculo y construye seguridad emocional."
        case .regulacion:
            return "La co-regulación es el proceso mediante el cual los niños aprenden a autorregularse. Nuestra calma se convierte en el modelo que ellos internalizan."
        case .limites:
            return "Los límites con amor crean seguridad y enseñan valores. La disciplina efectiva se enfoca en enseñar, no solo en controlar el comportamiento."
        case .aprendizaje:
            return "El juego y la curiosidad son los motores naturales del aprendizaje. Cuando respetamos estos procesos, el aprendizaje se vuelve natural y placentero."
        case .desarrollo:
            return "Cada etapa del desarrollo tiene características únicas. Respetar el ritmo natural del desarrollo permite que los niños florezcan en su tiempo."
        case .emociones:
            return "Las emociones son mensajeras importantes. Aprender a escucharlas, nombrarlas y regularlas construye las bases de la inteligencia emocional."
        }
    }
    
    /// Carga las citas específicas del autor
    private func cargarCitasAutor() {
        // Las citas se implementarán en el siguiente paso
        self.citas = []
    }
    
    /// Establece vínculos con fundamentos neuropsicológicos de Capa 1
    private func establecerVinculos() {
        self.vinculos = [
            // Vínculo 1: Arquitectura cerebral
            Capa2VinculoNeuroAxial(
                principioId: principios.first { $0.titulo.contains("cerebro del niño no es") }?.id ?? UUID(),
                fundamentoNeuro: "Arquitectura cerebral de 3 pisos",
                explicacionConexion: "La metáfora de los 3 pisos del cerebro (tronco cerebral, sistema límbico, corteza prefrontal) explica por qué el cerebro infantil es único y requiere enfoques específicos.",
                aplicacionPractica: "Usar la metáfora de los pisos para explicar comportamientos y adaptar expectativas según el desarrollo cortical."
            ),
            
            // Vínculo 2: Conexión emocional
            Capa2VinculoNeuroAxial(
                principioId: principios.first { $0.titulo.contains("conectar, luego corregir") }?.id ?? UUID(),
                fundamentoNeuro: "Sistema nervioso parasimpático y oxitocina",
                explicacionConexion: "La conexión emocional activa el sistema de calma y libera oxitocina, permitiendo el acceso al cerebro racional.",
                aplicacionPractica: "Priorizar la conexión emocional antes de cualquier corrección para optimizar el aprendizaje."
            ),
            
            // Vínculo 3: Neuroplasticidad
            Capa2VinculoNeuroAxial(
                principioId: principios.first { $0.titulo.contains("amor construye") }?.id ?? UUID(),
                fundamentoNeuro: "Neuroplasticidad y desarrollo de conexiones",
                explicacionConexion: "Las experiencias de amor y conexión crean literalmente nuevas conexiones neuronales durante la primera infancia.",
                aplicacionPractica: "Cada momento de conexión genuina es una inversión en el desarrollo cerebral del niño."
            ),
            
            // Vínculo 4: Procesamiento del lenguaje
            Capa2VinculoNeuroAxial(
                principioId: principios.first { $0.titulo.contains("Nombrar emociones") }?.id ?? UUID(),
                fundamentoNeuro: "Corteza prefrontal izquierda y amígdala",
                explicacionConexion: "Nombrar emociones activa la corteza prefrontal izquierda, ayudando a calmar la amígdala y procesar la experiencia emocional.",
                aplicacionPractica: "Enseñar vocabulario emocional para desarrollar inteligencia emocional y autorregulación."
            ),
            
            // Vínculo 5: Co-regulación
            Capa2VinculoNeuroAxial(
                principioId: principios.first { $0.titulo.contains("calma del adulto") }?.id ?? UUID(),
                fundamentoNeuro: "Espejo neuronal y co-regulación",
                explicacionConexion: "Los niños aprenden la autorregulación a través de la co-regulación con adultos calmados, activando el sistema nervioso parasimpático.",
                aplicacionPractica: "Ser modelo de calma para enseñar autorregulación a través del ejemplo."
            ),
            
            // Vínculo 6: Neuroplasticidad del juego
            Capa2VinculoNeuroAxial(
                principioId: principios.first { $0.titulo.contains("juego es el lenguaje") }?.id ?? UUID(),
                fundamentoNeuro: "Neuroplasticidad y activación multisensorial",
                explicacionConexion: "El juego activa múltiples áreas cerebrales simultáneamente, fortaleciendo conexiones neuronales y promoviendo la integración cerebral.",
                aplicacionPractica: "Usar el juego como herramienta principal de aprendizaje y desarrollo cerebral."
            ),
            
            // Vínculo 7: Ventana de oportunidad
            Capa2VinculoNeuroAxial(
                principioId: principios.first { $0.titulo.contains("ventana de oportunidad") }?.id ?? UUID(),
                fundamentoNeuro: "Ventana de oportunidad y poda sináptica",
                explicacionConexion: "Los primeros 6 años representan un período crítico donde las conexiones neuronales se forman a máxima velocidad y las no utilizadas se eliminan.",
                aplicacionPractica: "Maximizar experiencias positivas y estimulación durante la primera infancia."
            ),
            
            // Vínculo 8: Estrés tóxico
            Capa2VinculoNeuroAxial(
                principioId: principios.first { $0.titulo.contains("estrés tóxico") }?.id ?? UUID(),
                fundamentoNeuro: "Sistema de respuesta al estrés y cortisol",
                explicacionConexion: "El estrés crónico sin apoyo altera la arquitectura cerebral, especialmente el hipocampo y la amígdala, afectando la memoria y regulación emocional.",
                aplicacionPractica: "Crear ambientes seguros y predecibles que actúen como amortiguadores del estrés."
            ),
            
            // Vínculo 9: Integración cerebral
            Capa2VinculoNeuroAxial(
                principioId: principios.first { $0.titulo.contains("integración cerebral") }?.id ?? UUID(),
                fundamentoNeuro: "Conectividad funcional y cuerpo calloso",
                explicacionConexion: "La integración cerebral permite que diferentes regiones trabajen coordinadamente, facilitando respuestas adaptativas y bienestar emocional.",
                aplicacionPractica: "Fomentar actividades que integren emociones, pensamiento y sensaciones corporales."
            ),
            
            // Vínculo 10: Límites con amor
            Capa2VinculoNeuroAxial(
                principioId: principios.first { $0.titulo.contains("límites con amor") }?.id ?? UUID(),
                fundamentoNeuro: "Desarrollo prefrontal y sensación de seguridad",
                explicacionConexion: "Los límites consistentes y amorosos ayudan al desarrollo de la corteza prefrontal y crean una sensación de seguridad que permite la exploración.",
                aplicacionPractica: "Establecer límites claros con explicaciones amorosas que fomenten la comprensión."
            ),
            
            // Vínculo 11: Curiosidad
            Capa2VinculoNeuroAxial(
                principioId: principios.first { $0.titulo.contains("curiosidad es el motor") }?.id ?? UUID(),
                fundamentoNeuro: "Sistema de recompensa y dopamina",
                explicacionConexion: "La curiosidad activa el sistema de recompensa, liberando dopamina que motiva la exploración y facilita el aprendizaje y la memoria.",
                aplicacionPractica: "Alimentar la curiosidad natural del niño en lugar de suprimirla o forzar el aprendizaje."
            )
        ]
    }
    
    /// Filtra principios por categoría
    func principiosPorCategoria(_ categoria: Capa2Categoria) -> [Capa2Principio] {
        return principios.filter { $0.categoria == categoria }
    }
    
    /// Busca principios por texto
    func buscarPrincipios(_ texto: String) -> [Capa2Principio] {
        return principios.filter { 
            $0.titulo.localizedCaseInsensitiveContains(texto) ||
            $0.explicacionTeorica.localizedCaseInsensitiveContains(texto) ||
            $0.fraseGuia.localizedCaseInsensitiveContains(texto)
        }
    }
}

// MARK: - Extensión para datos de ejemplo (será removida en producción)
extension Capa2GestorPrincipios {
    /// Genera datos de ejemplo para desarrollo y testing
    func generarDatosEjemplo() -> [Capa2Principio] {
        return [
            Capa2Principio(
                titulo: "El cerebro del niño no es un cerebro adulto pequeño",
                explicacionTeorica: "La neurociencia del desarrollo muestra que el cerebro infantil tiene características únicas y procesos de maduración específicos que requieren enfoques adaptados.",
                ejemploPractico: "Cuando un niño de 3 años tiene una rabieta, su corteza prefrontal aún no está desarrollada para la autorregulación emocional.",
                aplicacionEmocional: "Comprender esto nos permite ser más empáticos y usar estrategias apropiadas para cada etapa del desarrollo.",
                erroresComunes: [
                    "Esperar autorregulación emocional prematura",
                    "Comparar con estándares adultos",
                    "Ignorar las necesidades de desarrollo específicas"
                ],
                fraseGuia: "Cada edad tiene su cerebro, cada cerebro tiene su tiempo.",
                baseNeurocientifica: "Neuroplasticidad, desarrollo cortical, maduración prefrontal",
                icono: "brain.head.profile",
                color: "blue",
                categoria: .desarrollo,
                vinculosCapa1: ["Arquitectura cerebral", "Ventanas de desarrollo"],
                vinculosCapa3: ["Herramientas de regulación", "Estrategias de calma"]
            )
        ]
    }
}