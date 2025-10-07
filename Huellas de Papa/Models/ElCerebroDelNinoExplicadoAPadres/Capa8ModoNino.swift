import Foundation
import SwiftUI

// MARK: - Capa 8: Modo Niño - Herramienta de Conexión Padre-Hijo
// Basado en "El cerebro del niño explicado a los padres" de Álvaro Bilbao
// Propósito: Conectar teoría con práctica mediante actividades guiadas

// MARK: - Actividades de Conexión
struct Capa8Game: Codable, Identifiable {
    let id: UUID
    let title: String              // "Detén al dragón"
    let category: Capa8ActivityCategory
    let goal: String               // Objetivo emocional o cognitivo
    let materials: [String]        // Objetos del hogar, si se requieren
    let steps: [String]            // Instrucciones paso a paso
    let durationMinutes: Int
    let principleLinked: UUID?     // vínculo con principio de Capa 2
    let recommendedAge: String
    let emotionalBenefit: String   // Beneficio emocional esperado
    
    init(id: UUID = UUID(), title: String, category: Capa8ActivityCategory, goal: String, materials: [String], steps: [String], durationMinutes: Int, principleLinked: UUID? = nil, recommendedAge: String, emotionalBenefit: String) {
        self.id = id
        self.title = title
        self.category = category
        self.goal = goal
        self.materials = materials
        self.steps = steps
        self.durationMinutes = durationMinutes
        self.principleLinked = principleLinked
        self.recommendedAge = recommendedAge
        self.emotionalBenefit = emotionalBenefit
    }
}

struct Capa8Story: Codable, Identifiable {
    let id: UUID
    let title: String              // "El oso que respiraba despacio"
    let summary: String
    let pages: [Capa8StoryPage]
    let keyMessage: String
    let principleLinked: UUID?
    let readingTime: Int           // minutos aproximados
    let emotionalTheme: String     // "Calma", "Valentía", "Empatía"
    
    init(id: UUID = UUID(), title: String, summary: String, pages: [Capa8StoryPage], keyMessage: String, principleLinked: UUID? = nil, readingTime: Int, emotionalTheme: String) {
        self.id = id
        self.title = title
        self.summary = summary
        self.pages = pages
        self.keyMessage = keyMessage
        self.principleLinked = principleLinked
        self.readingTime = readingTime
        self.emotionalTheme = emotionalTheme
    }
}

struct Capa8StoryPage: Codable, Identifiable {
    let id: UUID
    let text: String
    let narratorCue: String        // "Haz una pausa", "Pregunta al niño"
    let imageReference: String?
    let pageNumber: Int
    
    init(id: UUID = UUID(), text: String, narratorCue: String, imageReference: String? = nil, pageNumber: Int) {
        self.id = id
        self.text = text
        self.narratorCue = narratorCue
        self.imageReference = imageReference
        self.pageNumber = pageNumber
    }
}

struct Capa8RolePlay: Codable, Identifiable {
    let id: UUID
    let title: String
    let scenario: String           // "Mi hijo no quiere vestirse"
    let roles: [String]            // ["Padre", "Niño"]
    let scriptLines: [String]      // frases guía
    let repairStep: String         // cierre emocional
    let principleLinked: UUID?
    let emotionalSkill: String     // "Autocontrol", "Empatía", "Comunicación"
    
    init(id: UUID = UUID(), title: String, scenario: String, roles: [String], scriptLines: [String], repairStep: String, principleLinked: UUID? = nil, emotionalSkill: String) {
        self.id = id
        self.title = title
        self.scenario = scenario
        self.roles = roles
        self.scriptLines = scriptLines
        self.repairStep = repairStep
        self.principleLinked = principleLinked
        self.emotionalSkill = emotionalSkill
    }
}

struct Capa8ConnectionCircle: Codable, Identifiable {
    let id: UUID
    let title: String
    let action: String             // "Abraza y di esta frase"
    let time: Int                  // segundos sugeridos
    let feelingGenerated: String   // "Seguridad", "Calma", "Confianza"
    let instructions: [String]     // pasos específicos
    let principleLinked: UUID?
    
    init(id: UUID = UUID(), title: String, action: String, time: Int, feelingGenerated: String, instructions: [String], principleLinked: UUID? = nil) {
        self.id = id
        self.title = title
        self.action = action
        self.time = time
        self.feelingGenerated = feelingGenerated
        self.instructions = instructions
        self.principleLinked = principleLinked
    }
}

// MARK: - Categorías de Actividades
enum Capa8ActivityCategory: String, Codable, CaseIterable {
    case brainEmotions = "Cerebro y Emociones"
    case languageAttachment = "Lenguaje y Apego"
    case emotionalRolePlay = "Dramatización Emocional"
    case dailyConnection = "Vínculo Diario"
    case guidedStories = "Cuentos Guiados"
    
    var icon: String {
        switch self {
        case .brainEmotions: return "brain.head.profile"
        case .languageAttachment: return "heart.text.square"
        case .emotionalRolePlay: return "theatermasks.fill"
        case .dailyConnection: return "heart.circle.fill"
        case .guidedStories: return "book.pages.fill"
        }
    }
    
    var color: Color {
        switch self {
        case .brainEmotions: return .blue
        case .languageAttachment: return .green
        case .emotionalRolePlay: return .purple
        case .dailyConnection: return .orange
        case .guidedStories: return .pink
        }
    }
    
    var description: String {
        switch self {
        case .brainEmotions: return "Entrena autocontrol, turnos, atención y lenguaje emocional"
        case .languageAttachment: return "Fortalece vínculos mediante historias colaborativas"
        case .emotionalRolePlay: return "Practica resolución de conflictos emocionales"
        case .dailyConnection: return "Microactividades que fortalecen el vínculo diario"
        case .guidedStories: return "Cuentos interactivos con instrucciones de narración"
        }
    }
}

// MARK: - Modelo Principal
struct Capa8ModoNino: Identifiable, Codable {
    let id: UUID
    let titulo: String
    let descripcion: String
    let introduccion: String
    let games: [Capa8Game]
    let stories: [Capa8Story]
    let rolePlays: [Capa8RolePlay]
    let connectionCircles: [Capa8ConnectionCircle]
    let progreso: Capa8Progress
    
    init() {
        self.id = UUID()
        self.titulo = "Modo Niño"
        self.descripcion = "Herramienta de conexión padre-hijo"
        self.introduccion = "Convierte los principios de crianza en actividades prácticas que fortalecen el vínculo emocional y entrenan el cerebro del niño mediante el juego, la narración y la conexión."
        self.games = []
        self.stories = []
        self.rolePlays = []
        self.connectionCircles = []
        self.progreso = Capa8Progress()
    }
}

// MARK: - Sistema de Progreso
struct Capa8Progress: Codable {
    var gamesCompleted: Set<UUID> = []
    var storiesCompleted: Set<UUID> = []
    var rolePlaysCompleted: Set<UUID> = []
    var connectionsCompleted: Set<UUID> = []
    var timeSpent: TimeInterval = 0
    var connectionStreak: Int = 0 // días consecutivos de conexión
    
    var overallProgress: Double {
        let total = 20.0 // Total estimado de actividades
        let completed = Double(gamesCompleted.count + storiesCompleted.count + rolePlaysCompleted.count + connectionsCompleted.count)
        return min(completed / total, 1.0)
    }
    
    var connectionLevel: String {
        switch connectionStreak {
        case 0...2: return "Iniciando"
        case 3...7: return "Construyendo"
        case 8...14: return "Fortalecido"
        case 15...30: return "Sólido"
        default: return "Inquebrantable"
        }
    }
}

// MARK: - Contenido de Actividades Predefinidas

extension Capa8ModoNino {
    
    // MARK: - Juegos del Cerebro y Emociones
    static let brainEmotionGames: [Capa8Game] = [
        Capa8Game(
            title: "El Semáforo de Emociones",
            category: .brainEmotions,
            goal: "Identificar y regular emociones usando colores",
            materials: ["Tres círculos de colores (rojo, amarillo, verde)", "Una imagen de semáforo"],
            steps: [
                "Explica que el rojo significa 'PARAR y sentir la emoción fuerte'",
                "El amarillo es 'PENSAR qué hacer con esa emoción'",
                "El verde es 'ACTUAR de forma calmada y constructiva'",
                "Practica con diferentes emociones: enojo, tristeza, miedo",
                "Pregunta: '¿Qué color sientes ahora?'"
            ],
            durationMinutes: 5,
            principleLinked: nil,
            recommendedAge: "3-7 años",
            emotionalBenefit: "Desarrolla autocontrol y reconocimiento emocional"
        ),
        
        Capa8Game(
            title: "Detén al Dragón",
            category: .brainEmotions, 
            goal: "Entrenar autocontrol y co-regulación",
            materials: ["Ninguno - solo imaginación"],
            steps: [
                "Dile: 'Cuando sientas enojo, imagina que eres un dragón'",
                "'Pero tú puedes controlar al dragón con respiraciones lentas'",
                "Practica: 'Respira hondo... 1, 2, 3... y suelta el fuego suavemente'",
                "Si está calmado: '¡Excelente! Has domesticado al dragón'",
                "Repite cuando sienta frustración real"
            ],
            durationMinutes: 3,
            principleLinked: nil,
            recommendedAge: "4-8 años",
            emotionalBenefit: "Fortalece la co-regulación y el autocontrol"
        ),
        
        Capa8Game(
            title: "El Reloj de la Calma",
            category: .brainEmotions,
            goal: "Aprender a hacer pausas y respirar",
            materials: ["Un reloj o temporizador", "Una campana suave"],
            steps: [
                "Cuando sienta emociones fuertes, di: 'Hora del reloj de la calma'",
                "Pon el temporizador a 2 minutos",
                "Respiren juntos: 'Inhala... exhala...'",
                "Cuando suene la campana: '¿Cómo te sientes ahora?'",
                "Celebra si está más calmado"
            ],
            durationMinutes: 2,
            principleLinked: nil,
            recommendedAge: "3-10 años",
            emotionalBenefit: "Enseña técnicas de calma y pausa"
        ),
        
        Capa8Game(
            title: "Atrapa el Pensamiento",
            category: .brainEmotions,
            goal: "Entrenar atención y flexibilidad cognitiva",
            materials: ["Objetos pequeños de diferentes colores"],
            steps: [
                "Coloca 5-7 objetos en una mesa",
                "Dile: 'Vamos a atrapar pensamientos rápidos'",
                "Señala un objeto: 'Atrapa el rojo' - debe tocarlo rápido",
                "Cambia: 'Ahora atrapa el más pequeño'",
                "Aumenta velocidad gradualmente"
            ],
            durationMinutes: 4,
            principleLinked: nil,
            recommendedAge: "4-8 años",
            emotionalBenefit: "Mejora atención y flexibilidad mental"
        )
    ]
    
    // MARK: - Actividades de Lenguaje y Apego
    static let languageAttachmentActivities: [Capa8Game] = [
        Capa8Game(
            title: "Cuéntame un Recuerdo Feliz",
            category: .languageAttachment,
            goal: "Fortalecer vínculo mediante narrativa compartida",
            materials: ["Ninguno"],
            steps: [
                "Dile: 'Vamos a recordar algo muy feliz juntos'",
                "Empieza tú: 'Recuerdo cuando...'",
                "Pregúntale: '¿Y tú qué recuerdas que te hizo muy feliz?'",
                "Escucha atentamente y haz preguntas: '¿Cómo te sentiste?'",
                "Termina: 'Me encanta recordar contigo'"
            ],
            durationMinutes: 10,
            principleLinked: nil,
            recommendedAge: "3-12 años",
            emotionalBenefit: "Fortalece el vínculo emocional y la comunicación"
        ),
        
        Capa8Game(
            title: "Palabras Mágicas",
            category: .languageAttachment,
            goal: "Desarrollar lenguaje emocional y conexión",
            materials: ["Ninguno"],
            steps: [
                "Dile: 'Vamos a usar palabras mágicas que nos conectan'",
                "Enseña: 'Te amo', 'Eres especial', 'Me haces feliz'",
                "Practica: 'Dime una palabra mágica para mí'",
                "Responde con otra palabra mágica",
                "Crear un ritual: decir una palabra mágica cada día"
            ],
            durationMinutes: 5,
            principleLinked: nil,
            recommendedAge: "2-8 años",
            emotionalBenefit: "Desarrolla vocabulario emocional y autoestima"
        ),
        
        Capa8Game(
            title: "El Tesoro de las Emociones",
            category: .languageAttachment,
            goal: "Nombrar y validar emociones",
            materials: ["Una caja pequeña", "Papeles de colores"],
            steps: [
                "Dile: 'Esta caja guarda nuestros tesoros emocionales'",
                "Pregunta: '¿Qué emoción quieres guardar hoy?'",
                "Escriban juntos la emoción en un papel",
                "Colóquenla en la caja: 'Esta emoción es válida'",
                "Repitan con diferentes emociones durante la semana"
            ],
            durationMinutes: 8,
            principleLinked: nil,
            recommendedAge: "4-10 años",
            emotionalBenefit: "Valida emociones y enseña que todas son importantes"
        )
    ]
    
    // MARK: - Dramatizaciones Emocionales
    static let emotionalRolePlays: [Capa8RolePlay] = [
        Capa8RolePlay(
            title: "Soy Pequeño y Tengo Miedo",
            scenario: "Es hora de dormir pero el niño tiene miedo de la oscuridad",
            roles: ["Padre", "Niño"],
            scriptLines: [
                "Entiendo que tengas miedo. Es normal sentir miedo a la oscuridad.",
                "Estoy aquí contigo. No te va a pasar nada malo.",
                "¿Qué te ayudaría a sentirte más seguro? ¿Dejamos una luz tenue?",
                "Vamos a respirar juntos para calmarnos.",
                "Te amo y siempre estaré cerca si me necesitas."
            ],
            repairStep: "Después de calmar el miedo, ofrece un abrazo y recuérdale que siempre estarás cerca si te necesita.",
            principleLinked: nil,
            emotionalSkill: "Manejo del miedo nocturno"
        ),
        
        Capa8RolePlay(
            title: "Mi Hermano Me Molesta",
            scenario: "El niño se siente frustrado porque su hermano no para de molestarlo",
            roles: ["Padre", "Niño"],
            scriptLines: [
                "Veo que estás muy molesto. Es difícil cuando alguien te molesta.",
                "Tu enojo es válido. Es normal sentirse así.",
                "¿Qué podrías hacer para sentirte mejor?",
                "¿Quieres que hablemos de cómo resolverlo juntos?",
                "Recuerda que te amo, aunque estés molesto."
            ],
            repairStep: "Ayuda a encontrar una solución práctica y refuerza que sus emociones son válidas.",
            principleLinked: nil,
            emotionalSkill: "Resolución de conflictos entre hermanos"
        ),
        
        Capa8RolePlay(
            title: "No Quiero Vestirme",
            scenario: "Es hora de ir al colegio pero el niño se resiste a vestirse",
            roles: ["Padre", "Niño"],
            scriptLines: [
                "Veo que no quieres vestirte. ¿Qué te molesta de la ropa?",
                "Entiendo tu frustración. A veces es difícil hacer cosas que no queremos.",
                "¿Qué podemos hacer para que sea más fácil?",
                "¿Quieres elegir tu ropa o prefieres que te ayude?",
                "Vamos paso a paso, juntos."
            ],
            repairStep: "Ofrece opciones limitadas y celebra cada paso completado.",
            principleLinked: nil,
            emotionalSkill: "Manejo de rutinas y cooperación"
        )
    ]
    
    // MARK: - Círculos de Conexión Diaria
    static let dailyConnectionCircles: [Capa8ConnectionCircle] = [
        Capa8ConnectionCircle(
            title: "Mirada de Conexión",
            action: "Mírame a los ojos y respiremos juntos",
            time: 30,
            feelingGenerated: "Seguridad y calma",
            instructions: [
                "Mira a tu hijo a los ojos",
                "Respiren juntos lentamente",
                "Dile: 'Me encanta verte'",
                "Mantén la mirada por 30 segundos",
                "Termina con un abrazo"
            ],
            principleLinked: nil
        ),
        
        Capa8ConnectionCircle(
            title: "Abrazo de Reparación",
            action: "Abraza y valida las emociones",
            time: 60,
            feelingGenerated: "Reconocimiento y amor incondicional",
            instructions: [
                "Si tu hijo está molesto, acércate sin juzgar",
                "Dile: 'Está bien sentirse así'",
                "Ofrece un abrazo sin forzar",
                "Si acepta, abrázalo firmemente",
                "Dile: 'Te amo, aunque estés molesto'"
            ],
            principleLinked: nil
        ),
        
        Capa8ConnectionCircle(
            title: "Ritual de Gratitud",
            action: "Comparte algo por lo que estés agradecido",
            time: 120,
            feelingGenerated: "Positividad y conexión",
            instructions: [
                "Antes de dormir, siéntense juntos",
                "Dile: 'Hoy estoy agradecido por...'",
                "Comparte algo específico sobre él",
                "Pregúntale: '¿Por qué estás agradecido hoy?'",
                "Escucha y celebra sus respuestas"
            ],
            principleLinked: nil
        ),
        
        Capa8ConnectionCircle(
            title: "El Momento de Pausa",
            action: "Hagan una pausa juntos en silencio",
            time: 45,
            feelingGenerated: "Calma y presencia",
            instructions: [
                "Dile: 'Vamos a hacer una pausa juntos'",
                "Siéntense cómodamente, espalda con espalda",
                "Respiren en silencio por 45 segundos",
                "Al final, abrácense sin hablar",
                "Continúen con el día con más calma"
            ],
            principleLinked: nil
        )
    ]
    
    // MARK: - Cuentos Guiados
    static let guidedStories: [Capa8Story] = [
        Capa8Story(
            title: "La Calma del Oso",
            summary: "Un cuento para aprender a respirar y encontrar la calma",
            pages: [
                Capa8StoryPage(
                    text: "Había una vez un osito que sentía su corazón latir muy rápido cuando se asustaba.",
                    narratorCue: "Lee con voz suave y haz una pausa después de 'rápido'",
                    pageNumber: 1
                ),
                Capa8StoryPage(
                    text: "Su mamá osa le enseñó a respirar como si oliera una flor y soplara una vela.",
                    narratorCue: "Invita a tu hijo a imitar la respiración del oso",
                    pageNumber: 2
                ),
                Capa8StoryPage(
                    text: "Poco a poco, el corazón del osito volvía a la calma. ¡Qué bien se sentía!",
                    narratorCue: "Pregunta a tu hijo: '¿Qué hace tu cuerpo cuando se calma?'",
                    pageNumber: 3
                )
            ],
            keyMessage: "Respirar nos ayuda a calmarnos cuando sentimos emociones fuertes",
            principleLinked: nil,
            readingTime: 5,
            emotionalTheme: "Calma y regulación emocional"
        ),
        
        Capa8Story(
            title: "El Niño Valiente",
            summary: "Una historia sobre enfrentar miedos con apoyo",
            pages: [
                Capa8StoryPage(
                    text: "Había un niño que tenía miedo de la oscuridad, pero sabía que no estaba solo.",
                    narratorCue: "Haz una pausa y pregunta: '¿Alguna vez has tenido miedo?'",
                    pageNumber: 1
                ),
                Capa8StoryPage(
                    text: "Su papá le dijo: 'Los valientes no son los que no tienen miedo, sino los que actúan a pesar del miedo'.",
                    narratorCue: "Pregunta: '¿Qué significa ser valiente para ti?'",
                    pageNumber: 2
                ),
                Capa8StoryPage(
                    text: "El niño aprendió que tener miedo está bien, y que puede pedir ayuda cuando lo necesite.",
                    narratorCue: "Pregunta: '¿A quién puedes pedirle ayuda cuando tienes miedo?'",
                    pageNumber: 3
                )
            ],
            keyMessage: "Es valiente pedir ayuda cuando tenemos miedo",
            principleLinked: nil,
            readingTime: 6,
            emotionalTheme: "Valentía y apoyo emocional"
        ),
        
        Capa8Story(
            title: "El Amigo Imaginario",
            summary: "Un cuento sobre la empatía y la comprensión",
            pages: [
                Capa8StoryPage(
                    text: "Había una niña que tenía un amigo imaginario que siempre estaba triste.",
                    narratorCue: "Pregunta: '¿Alguna vez has tenido un amigo imaginario?'",
                    pageNumber: 1
                ),
                Capa8StoryPage(
                    text: "La niña le preguntó: '¿Por qué estás triste?' Y él respondió: 'Porque nadie me entiende'.",
                    narratorCue: "Pregunta: '¿Cómo te sientes cuando nadie te entiende?'",
                    pageNumber: 2
                ),
                Capa8StoryPage(
                    text: "La niña le dijo: 'Te entiendo perfectamente' y su amigo imaginario sonrió por primera vez.",
                    narratorCue: "Pregunta: '¿Cómo te sientes cuando alguien te entiende?'",
                    pageNumber: 3
                )
            ],
            keyMessage: "Entender a los demás los hace sentirse mejor",
            principleLinked: nil,
            readingTime: 5,
            emotionalTheme: "Empatía y comprensión"
        )
    ]
}