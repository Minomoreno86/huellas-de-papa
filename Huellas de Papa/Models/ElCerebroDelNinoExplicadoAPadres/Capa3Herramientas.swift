import Foundation
import SwiftUI

// MARK: - Capa 3: Herramientas Prácticas
// Esta capa traduce los principios neuropsicológicos (Capa 2) en herramientas prácticas
// aplicables y visualmente atractivas, basadas en el trabajo de Álvaro Bilbao.

// MARK: - Modelo Principal de Herramienta
/// Representa una herramienta práctica derivada de los principios de la Capa 2
struct Capa3Tool: Identifiable, Codable {
    let id: UUID
    let nombre: String
    let icono: String
    let color: String
    let propositoClinico: String
    let fundamentoTeorico: String
    let pasos: [Capa3ToolStep]
    let adaptacionesEdad: [Capa3ToolAgeVariant]
    let feedback: Capa3ToolFeedback
    let relaciones: [Capa3ToolRelation]
    let categoria: CategoriaHerramienta
    let tiempoEstimado: Int // en minutos
    let dificultad: NivelDificultadHerramienta
    let materialesNecesarios: [String]
    
    init(nombre: String, icono: String, color: String, propositoClinico: String, fundamentoTeorico: String, pasos: [Capa3ToolStep], adaptacionesEdad: [Capa3ToolAgeVariant], feedback: Capa3ToolFeedback, relaciones: [Capa3ToolRelation], categoria: CategoriaHerramienta, tiempoEstimado: Int, dificultad: NivelDificultadHerramienta, materialesNecesarios: [String]) {
        self.id = UUID()
        self.nombre = nombre
        self.icono = icono
        self.color = color
        self.propositoClinico = propositoClinico
        self.fundamentoTeorico = fundamentoTeorico
        self.pasos = pasos
        self.adaptacionesEdad = adaptacionesEdad
        self.feedback = feedback
        self.relaciones = relaciones
        self.categoria = categoria
        self.tiempoEstimado = tiempoEstimado
        self.dificultad = dificultad
        self.materialesNecesarios = materialesNecesarios
    }
}

// MARK: - Paso de Herramienta
/// Representa un paso específico dentro de una herramienta
struct Capa3ToolStep: Identifiable, Codable {
    let id: UUID
    let numero: Int
    let titulo: String
    let descripcion: String
    let instruccion: String
    let duracionEstimada: Int // en segundos
    let icono: String
    let esOpcional: Bool
    let consejosPracticos: [String]
    
    init(numero: Int, titulo: String, descripcion: String, instruccion: String, duracionEstimada: Int, icono: String, esOpcional: Bool = false, consejosPracticos: [String] = []) {
        self.id = UUID()
        self.numero = numero
        self.titulo = titulo
        self.descripcion = descripcion
        self.instruccion = instruccion
        self.duracionEstimada = duracionEstimada
        self.icono = icono
        self.esOpcional = esOpcional
        self.consejosPracticos = consejosPracticos
    }
}

// MARK: - Adaptación por Edad
/// Representa cómo adaptar una herramienta según la edad del niño
struct Capa3ToolAgeVariant: Identifiable, Codable {
    let id: UUID
    let rangoEdad: String
    let modificaciones: [String]
    let consideracionesEspeciales: [String]
    let variacionesLenguaje: [String]
    let duracionAjustada: Int // en minutos
    
    init(rangoEdad: String, modificaciones: [String], consideracionesEspeciales: [String], variacionesLenguaje: [String], duracionAjustada: Int) {
        self.id = UUID()
        self.rangoEdad = rangoEdad
        self.modificaciones = modificaciones
        self.consideracionesEspeciales = consideracionesEspeciales
        self.variacionesLenguaje = variacionesLenguaje
        self.duracionAjustada = duracionAjustada
    }
}

// MARK: - Feedback Post-Uso
/// Representa el sistema de feedback y reflexión después de usar una herramienta
struct Capa3ToolFeedback: Codable {
    let mensajesPositivos: [String]
    let preguntasReflexion: [String]
    let indicadoresExito: [String]
    let ajustesSugeridos: [String]
    let celebracionLogros: [String]
    
    init(mensajesPositivos: [String], preguntasReflexion: [String], indicadoresExito: [String], ajustesSugeridos: [String], celebracionLogros: [String]) {
        self.mensajesPositivos = mensajesPositivos
        self.preguntasReflexion = preguntasReflexion
        self.indicadoresExito = indicadoresExito
        self.ajustesSugeridos = ajustesSugeridos
        self.celebracionLogros = celebracionLogros
    }
}

// MARK: - Relación con Otras Capas
/// Conecta la herramienta con principios (Capa 2) y ejes (Capa 1)
struct Capa3ToolRelation: Identifiable, Codable {
    let id: UUID
    let tipoRelacion: TipoRelacion
    let elementoRelacionado: String
    let descripcionConexion: String
    let importancia: NivelImportancia
    
    init(tipoRelacion: TipoRelacion, elementoRelacionado: String, descripcionConexion: String, importancia: NivelImportancia) {
        self.id = UUID()
        self.tipoRelacion = tipoRelacion
        self.elementoRelacionado = elementoRelacionado
        self.descripcionConexion = descripcionConexion
        self.importancia = importancia
    }
}

// MARK: - Enums de Soporte
enum CategoriaHerramienta: String, CaseIterable, Codable {
    case regulacionEmocional = "Regulación Emocional"
    case comunicacion = "Comunicación"
    case disciplina = "Disciplina Positiva"
    case juego = "Juego Terapéutico"
    case mindfulness = "Mindfulness"
    case creatividad = "Creatividad"
    case socializacion = "Socialización"
    case aprendizaje = "Aprendizaje"
    case vínculo = "Vínculo Emocional"
    case autorregulacion = "Autorregulación"
}

enum NivelDificultadHerramienta: String, CaseIterable, Codable {
    case facil = "Fácil"
    case intermedio = "Intermedio"
    case avanzado = "Avanzado"
}

enum TipoRelacion: String, CaseIterable, Codable {
    case principio = "Principio (Capa 2)"
    case eje = "Eje Cerebral (Capa 1)"
    case herramienta = "Otra Herramienta"
}

enum NivelImportancia: String, CaseIterable, Codable {
    case alta = "Alta"
    case media = "Media"
    case baja = "Baja"
}

// MARK: - Contenedor Principal
/// Contiene todas las herramientas de la Capa 3
struct Capa3Herramientas: Identifiable, Codable {
    let id: UUID
    let herramientas: [Capa3Tool]
    let introduccion: String
    let objetivosGenerales: [String]
    let metodologia: String
    
    init(herramientas: [Capa3Tool], introduccion: String, objetivosGenerales: [String], metodologia: String) {
        self.id = UUID()
        self.herramientas = herramientas
        self.introduccion = introduccion
        self.objetivosGenerales = objetivosGenerales
        self.metodologia = metodologia
    }
    
    // MARK: - Contenido de Ejemplo
    /// Crea herramientas de ejemplo basadas en los principios de Álvaro Bilbao
    static func contenidoCerebroDelNino() -> Capa3Herramientas {
        let herramientas: [Capa3Tool] = [
            // Herramienta 1: "Name it to tame it"
            Capa3Tool(
                nombre: "Name it to tame it",
                icono: "heart.text.square",
                color: "FF6B6B",
                propositoClinico: "Ayudar al niño a nombrar y regular sus emociones intensas mediante la identificación verbal.",
                fundamentoTeorico: "Basado en la neurociencia afectiva, nombrar emociones activa la corteza prefrontal y reduce la activación de la amígdala, facilitando la regulación emocional.",
                pasos: [
                    Capa3ToolStep(
                        numero: 1,
                        titulo: "Detectar la emoción",
                        descripcion: "Observa las señales físicas y comportamentales del niño",
                        instruccion: "Cuando veas que tu hijo está experimentando una emoción intensa, detente y observa: ¿cómo se ve su cara? ¿cómo está su cuerpo? ¿qué está haciendo?",
                        duracionEstimada: 30,
                        icono: "eye.fill",
                        consejosPracticos: ["Mantén la calma", "No juzgues la emoción", "Observa sin intervenir inmediatamente"]
                    ),
                    Capa3ToolStep(
                        numero: 2,
                        titulo: "Nombrar la emoción",
                        descripcion: "Ayuda al niño a identificar qué emoción está sintiendo",
                        instruccion: "Di algo como: 'Veo que estás muy enojado' o 'Parece que te sientes triste'. Usa un tono calmado y empático.",
                        duracionEstimada: 45,
                        icono: "mouth.fill",
                        consejosPracticos: ["Usa palabras simples", "Sé específico", "Valida la emoción"]
                    ),
                    Capa3ToolStep(
                        numero: 3,
                        titulo: "Explorar juntos",
                        descripcion: "Ayuda al niño a entender qué causó la emoción",
                        instruccion: "Pregunta: '¿Qué pasó que te hizo sentir así?' Escucha sin interrumpir y sin dar consejos inmediatamente.",
                        duracionEstimada: 60,
                        icono: "questionmark.circle.fill",
                        consejosPracticos: ["Escucha activamente", "No minimices", "Ayuda a conectar causa-efecto"]
                    ),
                    Capa3ToolStep(
                        numero: 4,
                        titulo: "Validar y normalizar",
                        descripcion: "Asegúrate de que el niño sepa que sus emociones son válidas",
                        instruccion: "Dile: 'Es normal sentirse así cuando...' o 'Entiendo por qué te sientes así'.",
                        duracionEstimada: 30,
                        icono: "checkmark.circle.fill",
                        consejosPracticos: ["Normaliza la emoción", "Muestra comprensión", "Evita frases como 'no es para tanto'"]
                    ),
                    Capa3ToolStep(
                        numero: 5,
                        titulo: "Buscar soluciones juntos",
                        descripcion: "Una vez calmado, exploren qué hacer con esa emoción",
                        instruccion: "Pregunta: '¿Qué te ayudaría a sentirte mejor?' o '¿Qué podemos hacer juntos?'",
                        duracionEstimada: 45,
                        icono: "lightbulb.fill",
                        consejosPracticos: ["Involucra al niño en la solución", "Ofrece opciones", "Practica estrategias de regulación"]
                    )
                ],
                adaptacionesEdad: [
                    Capa3ToolAgeVariant(
                        rangoEdad: "2-4 años",
                        modificaciones: ["Usa palabras muy simples", "Enfócate en emociones básicas (feliz, triste, enojado)", "Usa gestos y expresiones faciales"],
                        consideracionesEspeciales: ["El niño puede no tener vocabulario emocional", "Necesita más tiempo para procesar"],
                        variacionesLenguaje: ["'Estás enojado'", "'Te sientes triste'", "'Estás feliz'"],
                        duracionAjustada: 5
                    ),
                    Capa3ToolAgeVariant(
                        rangoEdad: "5-8 años",
                        modificaciones: ["Introduce emociones más complejas", "Ayuda a conectar pensamientos y emociones", "Usa ejemplos de su vida"],
                        consideracionesEspeciales: ["Puede tener más vocabulario emocional", "Puede entender mejor las causas"],
                        variacionesLenguaje: ["'Te sientes frustrado porque...'", "'Parece que te sientes decepcionado'"],
                        duracionAjustada: 8
                    ),
                    Capa3ToolAgeVariant(
                        rangoEdad: "9-12 años",
                        modificaciones: ["Explora emociones complejas", "Ayuda a identificar patrones", "Conecta con valores familiares"],
                        consideracionesEspeciales: ["Puede ser más reflexivo", "Puede tener sus propias estrategias"],
                        variacionesLenguaje: ["'Veo que estás experimentando...'", "'¿Cómo describirías lo que sientes?'"],
                        duracionAjustada: 10
                    )
                ],
                feedback: Capa3ToolFeedback(
                    mensajesPositivos: [
                        "¡Excelente trabajo ayudando a tu hijo a nombrar sus emociones!",
                        "Has creado un espacio seguro para que tu hijo exprese lo que siente.",
                        "La validación emocional que proporcionas fortalece el vínculo con tu hijo."
                    ],
                    preguntasReflexion: [
                        "¿Cómo se sintió tu hijo después de nombrar su emoción?",
                        "¿Qué estrategias funcionaron mejor para calmarlo?",
                        "¿Cómo te sentiste tú durante el proceso?"
                    ],
                    indicadoresExito: [
                        "El niño puede nombrar sus emociones con más facilidad",
                        "Las crisis emocionales duran menos tiempo",
                        "El niño busca activamente ayuda para regularse"
                    ],
                    ajustesSugeridos: [
                        "Si el niño se resiste, intenta con emociones más básicas",
                        "Practica en momentos calmados para que sea más natural",
                        "Adapta el lenguaje según la edad y personalidad del niño"
                    ],
                    celebracionLogros: [
                        "¡Has dominado una herramienta fundamental de la crianza consciente!",
                        "Tu hijo ahora tiene mejores herramientas para manejar sus emociones.",
                        "Has fortalecido la comunicación emocional en tu familia."
                    ]
                ),
                relaciones: [
                    Capa3ToolRelation(
                        tipoRelacion: .principio,
                        elementoRelacionado: "Regulación Emocional",
                        descripcionConexion: "Esta herramienta aplica directamente el principio de regulación emocional al ayudar al niño a procesar y nombrar sus emociones.",
                        importancia: .alta
                    ),
                    Capa3ToolRelation(
                        tipoRelacion: .eje,
                        elementoRelacionado: "Sistema Límbico",
                        descripcionConexion: "Trabaja directamente con el sistema límbico para facilitar la regulación emocional.",
                        importancia: .alta
                    )
                ],
                categoria: .regulacionEmocional,
                tiempoEstimado: 10,
                dificultad: .facil,
                materialesNecesarios: ["Ninguno"]
            ),
            
            // Herramienta 2: "Respiración del Semáforo"
            Capa3Tool(
                nombre: "Respiración del Semáforo",
                icono: "trafficlight",
                color: "FFD93D",
                propositoClinico: "Enseñar al niño una técnica de respiración estructurada usando los colores del semáforo para regular emociones intensas.",
                fundamentoTeorico: "La respiración controlada activa el sistema nervioso parasimpático, reduciendo la activación del sistema de lucha-huida y facilitando la calma.",
                pasos: [
                    Capa3ToolStep(
                        numero: 1,
                        titulo: "Preparar el espacio",
                        descripcion: "Crear un ambiente calmado para la práctica",
                        instruccion: "Busca un lugar tranquilo donde tú y tu hijo puedan sentarse cómodamente. Elimina distracciones.",
                        duracionEstimada: 30,
                        icono: "house.fill",
                        consejosPracticos: ["Apaga la TV", "Silencia el teléfono", "Asegúrate de que ambos estén cómodos"]
                    ),
                    Capa3ToolStep(
                        numero: 2,
                        titulo: "Explicar el semáforo",
                        descripcion: "Introducir el concepto de los tres colores",
                        instruccion: "Explica: 'Vamos a usar los colores del semáforo para calmarnos. Rojo = parar, Amarillo = respirar, Verde = continuar calmado'.",
                        duracionEstimada: 60,
                        icono: "lightbulb.fill",
                        consejosPracticos: ["Usa ejemplos visuales", "Haz que sea divertido", "Practica cuando esté calmado"]
                    ),
                    Capa3ToolStep(
                        numero: 3,
                        titulo: "Practicar Rojo (Parar)",
                        descripcion: "Enseñar a detenerse cuando sienta emociones intensas",
                        instruccion: "Dile: 'Cuando sientas emociones fuertes, di ROJO y para. No hagas nada, solo para.'",
                        duracionEstimada: 45,
                        icono: "stop.circle.fill",
                        consejosPracticos: ["Practica en momentos calmados", "Hazlo divertido", "Celebra cuando lo haga bien"]
                    ),
                    Capa3ToolStep(
                        numero: 4,
                        titulo: "Practicar Amarillo (Respirar)",
                        descripcion: "Enseñar la técnica de respiración",
                        instruccion: "Dile: 'Ahora di AMARILLO y respira profundo. Inhala por la nariz, cuenta hasta 4, exhala por la boca.'",
                        duracionEstimada: 90,
                        icono: "wind",
                        consejosPracticos: ["Cuenta junto con él", "Hazlo lento y calmado", "Repite varias veces"]
                    ),
                    Capa3ToolStep(
                        numero: 5,
                        titulo: "Practicar Verde (Continuar)",
                        descripcion: "Enseñar a continuar de manera calmada",
                        instruccion: "Dile: 'Ahora di VERDE y continúa con lo que estabas haciendo, pero más calmado.'",
                        duracionEstimada: 60,
                        icono: "play.circle.fill",
                        consejosPracticos: ["Refuerza el comportamiento calmado", "Celebra el éxito", "Practica regularmente"]
                    )
                ],
                adaptacionesEdad: [
                    Capa3ToolAgeVariant(
                        rangoEdad: "3-5 años",
                        modificaciones: ["Usa gestos con las manos", "Hazlo muy visual", "Practica por períodos cortos"],
                        consideracionesEspeciales: ["Puede necesitar más repetición", "Usa juegos para hacerlo divertido"],
                        variacionesLenguaje: ["'Rojo como el fuego'", "'Amarillo como el sol'", "'Verde como la hierba'"],
                        duracionAjustada: 5
                    ),
                    Capa3ToolAgeVariant(
                        rangoEdad: "6-8 años",
                        modificaciones: ["Puede entender mejor la secuencia", "Introduce variaciones", "Practica en situaciones reales"],
                        consideracionesEspeciales: ["Puede ser más independiente", "Puede enseñar a otros"],
                        variacionesLenguaje: ["'Rojo: para y piensa'", "'Amarillo: respira y cuenta'", "'Verde: continúa calmado'"],
                        duracionAjustada: 8
                    )
                ],
                feedback: Capa3ToolFeedback(
                    mensajesPositivos: [
                        "¡Has enseñado a tu hijo una herramienta poderosa para la autorregulación!",
                        "La respiración del semáforo le dará a tu hijo control sobre sus emociones.",
                        "Has creado una estrategia que tu hijo puede usar independientemente."
                    ],
                    preguntasReflexion: [
                        "¿En qué situaciones tu hijo usa más esta técnica?",
                        "¿Cómo se siente tu hijo después de usar la respiración del semáforo?",
                        "¿Qué ajustes necesitas hacer para que funcione mejor?"
                    ],
                    indicadoresExito: [
                        "El niño usa la técnica independientemente",
                        "Las crisis emocionales se resuelven más rápido",
                        "El niño puede explicar la técnica a otros"
                    ],
                    ajustesSugeridos: [
                        "Si no funciona, intenta con diferentes colores o conceptos",
                        "Practica más en momentos calmados",
                        "Adapta la duración según la edad del niño"
                    ],
                    celebracionLogros: [
                        "¡Tu hijo ahora tiene una herramienta de por vida para manejar el estrés!",
                        "Has equipado a tu hijo con habilidades de autorregulación valiosas.",
                        "La respiración del semáforo es una herramienta que tu hijo puede usar en cualquier momento."
                    ]
                ),
                relaciones: [
                    Capa3ToolRelation(
                        tipoRelacion: .principio,
                        elementoRelacionado: "Autorregulación",
                        descripcionConexion: "Esta herramienta desarrolla directamente la capacidad de autorregulación del niño.",
                        importancia: .alta
                    ),
                    Capa3ToolRelation(
                        tipoRelacion: .eje,
                        elementoRelacionado: "Sistema Nervioso Autónomo",
                        descripcionConexion: "Trabaja directamente con el sistema nervioso autónomo para inducir calma.",
                        importancia: .alta
                    )
                ],
                categoria: .autorregulacion,
                tiempoEstimado: 8,
                dificultad: .facil,
                materialesNecesarios: ["Ninguno"]
            ),
            
            // Herramienta 3: "La Pausa del Adulto"
            Capa3Tool(
                nombre: "La Pausa del Adulto",
                icono: "pause.circle.fill",
                color: "4ECDC4",
                propositoClinico: "Enseñar al adulto a regularse emocionalmente antes de responder al comportamiento del niño, modelando autorregulación.",
                fundamentoTeorico: "Los niños aprenden a regularse observando a los adultos. Cuando el adulto se autorregula, activa los espejos neuronales del niño, facilitando su propio desarrollo de autorregulación.",
                pasos: [
                    Capa3ToolStep(
                        numero: 1,
                        titulo: "Detectar la activación",
                        descripcion: "Reconocer las señales físicas de estrés o frustración en ti mismo",
                        instruccion: "Cuando sientas que tu hijo te está desafiando o frustrando, detente y observa: ¿cómo se siente tu cuerpo? ¿qué emociones estás experimentando?",
                        duracionEstimada: 30,
                        icono: "heart.fill",
                        consejosPracticos: ["Reconoce tus propias emociones", "No juzgues tus sentimientos", "Observa sin actuar inmediatamente"]
                    ),
                    Capa3ToolStep(
                        numero: 2,
                        titulo: "Tomar la pausa",
                        descripcion: "Hacer una pausa física y emocional antes de responder",
                        instruccion: "Di algo como: 'Necesito un momento para pensar' o 'Déjame respirar un poco'. Aléjate físicamente si es necesario.",
                        duracionEstimada: 60,
                        icono: "pause.circle.fill",
                        consejosPracticos: ["Usa frases simples", "Sé honesto sobre tu necesidad", "No lo uses como castigo"]
                    ),
                    Capa3ToolStep(
                        numero: 3,
                        titulo: "Respirar y centrarse",
                        descripcion: "Usar técnicas de respiración para calmar el sistema nervioso",
                        instruccion: "Respira profundamente 3-5 veces. Inhala por la nariz contando hasta 4, mantén 2 segundos, exhala por la boca contando hasta 6.",
                        duracionEstimada: 90,
                        icono: "wind",
                        consejosPracticos: ["Hazlo visible para el niño", "Cuenta en voz alta", "Explica que te ayuda a calmarte"]
                    ),
                    Capa3ToolStep(
                        numero: 4,
                        titulo: "Reflexionar sobre la situación",
                        descripcion: "Analizar qué está pasando desde la perspectiva del niño",
                        instruccion: "Pregúntate: '¿Qué necesita mi hijo en este momento?' '¿Qué está tratando de comunicar?' '¿Cómo puedo ayudarle mejor?'",
                        duracionEstimada: 120,
                        icono: "brain.head.profile",
                        consejosPracticos: ["Considera la edad del niño", "Piensa en sus necesidades", "Recuerda que el comportamiento es comunicación"]
                    ),
                    Capa3ToolStep(
                        numero: 5,
                        titulo: "Responder con calma",
                        descripcion: "Volver a la situación con una respuesta regulada y empática",
                        instruccion: "Regresa y di algo como: 'Ahora puedo escucharte mejor' o 'Estoy listo para ayudarte'. Mantén un tono calmado y empático.",
                        duracionEstimada: 60,
                        icono: "person.wave.2.fill",
                        consejosPracticos: ["Mantén el contacto visual", "Usa un tono suave", "Muestra que te importa"]
                    )
                ],
                adaptacionesEdad: [
                    Capa3ToolAgeVariant(
                        rangoEdad: "2-4 años",
                        modificaciones: ["Explica que necesitas un momento", "Usa gestos simples", "Mantén la pausa corta"],
                        consideracionesEspeciales: ["El niño puede no entender completamente", "Necesita ver que regresas"],
                        variacionesLenguaje: ["'Mamá necesita un momento'", "'Voy a respirar un poco'"],
                        duracionAjustada: 3
                    ),
                    Capa3ToolAgeVariant(
                        rangoEdad: "5-8 años",
                        modificaciones: ["Puedes explicar más sobre la pausa", "Involucra al niño en el proceso", "Enséñale la técnica"],
                        consideracionesEspeciales: ["Puede entender mejor el concepto", "Puede aprender a hacerlo también"],
                        variacionesLenguaje: ["'Necesito calmarme antes de ayudarte'", "'Vamos a respirar juntos'"],
                        duracionAjustada: 5
                    ),
                    Capa3ToolAgeVariant(
                        rangoEdad: "9-12 años",
                        modificaciones: ["Puedes ser más directo", "Explica la neurociencia básica", "Modela estrategias avanzadas"],
                        consideracionesEspeciales: ["Puede entender mejor la complejidad", "Puede aplicar la técnica independientemente"],
                        variacionesLenguaje: ["'Necesito regular mi sistema nervioso'", "'Vamos a usar nuestra corteza prefrontal'"],
                        duracionAjustada: 7
                    )
                ],
                feedback: Capa3ToolFeedback(
                    mensajesPositivos: [
                        "¡Excelente trabajo modelando la autorregulación para tu hijo!",
                        "Has demostrado que es posible calmarse antes de actuar.",
                        "Tu hijo está aprendiendo estrategias valiosas observándote."
                    ],
                    preguntasReflexion: [
                        "¿Cómo se sintió tu hijo cuando te viste tomando la pausa?",
                        "¿Qué estrategias funcionaron mejor para calmarte?",
                        "¿Cómo cambió la dinámica de la situación?"
                    ],
                    indicadoresExito: [
                        "Tu hijo imita la técnica de pausa",
                        "Las situaciones conflictivas se resuelven más rápido",
                        "Tu hijo busca activamente tu ayuda para regularse"
                    ],
                    ajustesSugeridos: [
                        "Si la pausa es muy larga, acórtala gradualmente",
                        "Practica la técnica en momentos calmados",
                        "Adapta el lenguaje según la edad del niño"
                    ],
                    celebracionLogros: [
                        "¡Has dominado una de las herramientas más poderosas de la crianza!",
                        "Tu hijo ahora tiene un modelo de autorregulación en casa.",
                        "La pausa del adulto es una herramienta que transforma toda la dinámica familiar."
                    ]
                ),
                relaciones: [
                    Capa3ToolRelation(
                        tipoRelacion: .principio,
                        elementoRelacionado: "Modelado de Autorregulación",
                        descripcionConexion: "Esta herramienta aplica directamente el principio de modelado al demostrar autorregulación al niño.",
                        importancia: .alta
                    ),
                    Capa3ToolRelation(
                        tipoRelacion: .eje,
                        elementoRelacionado: "Corteza Prefrontal",
                        descripcionConexion: "Trabaja directamente con la corteza prefrontal para facilitar la regulación emocional.",
                        importancia: .alta
                    )
                ],
                categoria: .autorregulacion,
                tiempoEstimado: 5,
                dificultad: .intermedio,
                materialesNecesarios: ["Ninguno"]
            ),
            
            // Herramienta 4: "El Ritual de Conexión"
            Capa3Tool(
                nombre: "El Ritual de Conexión",
                icono: "heart.circle.fill",
                color: "FF8E8E",
                propositoClinico: "Crear un momento diario de conexión emocional profunda entre padre/madre e niño para fortalecer el vínculo y la seguridad emocional.",
                fundamentoTeorico: "La conexión emocional activa el sistema de apego seguro, liberando oxitocina y reduciendo cortisol. Esto fortalece la relación y facilita la cooperación del niño.",
                pasos: [
                    Capa3ToolStep(
                        numero: 1,
                        titulo: "Preparar el espacio",
                        descripcion: "Crear un ambiente libre de distracciones para la conexión",
                        instruccion: "Apaga dispositivos, encuentra un lugar cómodo, y asegúrate de que ambos estén disponibles emocionalmente.",
                        duracionEstimada: 30,
                        icono: "house.fill",
                        consejosPracticos: ["Elimina distracciones", "Crea un ambiente acogedor", "Asegúrate de estar presente"]
                    ),
                    Capa3ToolStep(
                        numero: 2,
                        titulo: "Iniciar con contacto físico",
                        descripcion: "Establecer conexión física segura y reconfortante",
                        instruccion: "Abraza a tu hijo, tócalo suavemente, o simplemente siéntate cerca. El contacto físico libera oxitocina.",
                        duracionEstimada: 60,
                        icono: "hand.raised.fill",
                        consejosPracticos: ["Respeta los límites del niño", "Usa un toque suave", "Observa sus señales"]
                    ),
                    Capa3ToolStep(
                        numero: 3,
                        titulo: "Escuchar activamente",
                        descripcion: "Dedicar atención completa a lo que el niño quiere compartir",
                        instruccion: "Pregunta: '¿Cómo te sientes hoy?' o '¿Qué quieres contarme?' Escucha sin interrumpir, juzgar o dar consejos inmediatamente.",
                        duracionEstimada: 180,
                        icono: "ear.fill",
                        consejosPracticos: ["Mantén contacto visual", "Asiente y muestra interés", "No interrumpas"]
                    ),
                    Capa3ToolStep(
                        numero: 4,
                        titulo: "Validar emociones",
                        descripcion: "Reconocer y validar las emociones y experiencias del niño",
                        instruccion: "Di cosas como: 'Entiendo por qué te sientes así' o 'Es normal sentir eso'. Refleja sus emociones sin minimizarlas.",
                        duracionEstimada: 90,
                        icono: "checkmark.circle.fill",
                        consejosPracticos: ["No minimices sus sentimientos", "Usa lenguaje empático", "Muestra comprensión"]
                    ),
                    Capa3ToolStep(
                        numero: 5,
                        titulo: "Expresar amor incondicional",
                        descripcion: "Comunicar amor y aceptación incondicional",
                        instruccion: "Dile: 'Te amo tal como eres' o 'Estoy aquí para ti siempre'. Asegúrate de que sepa que tu amor no depende de su comportamiento.",
                        duracionEstimada: 60,
                        icono: "heart.fill",
                        consejosPracticos: ["Sé específico sobre lo que amas", "Usa palabras que resuenen con él", "Repítelo regularmente"]
                    )
                ],
                adaptacionesEdad: [
                    Capa3ToolAgeVariant(
                        rangoEdad: "2-4 años",
                        modificaciones: ["Usa contacto físico más frecuente", "Habla en términos simples", "Usa juegos para conectar"],
                        consideracionesEspeciales: ["Puede tener períodos de atención cortos", "Necesita más contacto físico"],
                        variacionesLenguaje: ["'Te amo mucho'", "'Eres muy especial'"],
                        duracionAjustada: 5
                    ),
                    Capa3ToolAgeVariant(
                        rangoEdad: "5-8 años",
                        modificaciones: ["Puede compartir más detalles", "Introduce preguntas más profundas", "Puede durar más tiempo"],
                        consideracionesEspeciales: ["Puede ser más verbal", "Puede tener más que compartir"],
                        variacionesLenguaje: ["'Cuéntame sobre tu día'", "'¿Qué fue lo mejor de hoy?'"],
                        duracionAjustada: 10
                    ),
                    Capa3ToolAgeVariant(
                        rangoEdad: "9-12 años",
                        modificaciones: ["Puede ser más reflexivo", "Puede compartir preocupaciones", "Puede necesitar más privacidad"],
                        consideracionesEspeciales: ["Puede ser más selectivo sobre qué compartir", "Puede necesitar más espacio"],
                        variacionesLenguaje: ["'¿Cómo te sientes sobre...?'", "'¿Hay algo que te preocupa?'"],
                        duracionAjustada: 15
                    )
                ],
                feedback: Capa3ToolFeedback(
                    mensajesPositivos: [
                        "¡Has creado un momento sagrado de conexión con tu hijo!",
                        "El vínculo emocional que estás construyendo es invaluable.",
                        "Tu hijo se siente amado y seguro gracias a estos momentos."
                    ],
                    preguntasReflexion: [
                        "¿Qué aprendiste sobre tu hijo en este momento?",
                        "¿Cómo se sintió tu hijo durante la conexión?",
                        "¿Qué cambios notas en su comportamiento después?"
                    ],
                    indicadoresExito: [
                        "Tu hijo busca activamente estos momentos",
                        "Se siente más seguro y confiado",
                        "Las crisis emocionales disminuyen"
                    ],
                    ajustesSugeridos: [
                        "Si tu hijo se resiste, empieza con momentos más cortos",
                        "Adapta el momento según su personalidad",
                        "Sé consistente con el horario"
                    ],
                    celebracionLogros: [
                        "¡Has fortalecido el vínculo más importante de la vida de tu hijo!",
                        "Estos momentos de conexión son la base de una relación sólida.",
                        "Tu hijo ahora tiene un refugio emocional seguro en ti."
                    ]
                ),
                relaciones: [
                    Capa3ToolRelation(
                        tipoRelacion: .principio,
                        elementoRelacionado: "Vínculo Emocional",
                        descripcionConexion: "Esta herramienta fortalece directamente el vínculo emocional entre padre/madre e hijo.",
                        importancia: .alta
                    ),
                    Capa3ToolRelation(
                        tipoRelacion: .eje,
                        elementoRelacionado: "Sistema de Apego",
                        descripcionConexion: "Trabaja directamente con el sistema de apego para crear seguridad emocional.",
                        importancia: .alta
                    )
                ],
                categoria: .vínculo,
                tiempoEstimado: 15,
                dificultad: .facil,
                materialesNecesarios: ["Ninguno"]
            ),
            
            // Herramienta 5: "El Juego como Canal de Aprendizaje"
            Capa3Tool(
                nombre: "El Juego como Canal de Aprendizaje",
                icono: "gamecontroller.fill",
                color: "6BCF7F",
                propositoClinico: "Utilizar el juego como vehículo para enseñar habilidades sociales, emocionales y cognitivas de manera natural y divertida.",
                fundamentoTeorico: "El juego activa múltiples áreas cerebrales simultáneamente, facilitando el aprendizaje y la consolidación de habilidades. Es la forma natural del cerebro de procesar información compleja.",
                pasos: [
                    Capa3ToolStep(
                        numero: 1,
                        titulo: "Observar el juego natural",
                        descripcion: "Identificar qué tipo de juego prefiere el niño y sus intereses",
                        instruccion: "Observa a tu hijo jugando libremente. ¿Qué tipo de juegos prefiere? ¿Qué temas le interesan? ¿Cómo se expresa a través del juego?",
                        duracionEstimada: 120,
                        icono: "eye.fill",
                        consejosPracticos: ["No interrumpas su juego", "Observa sin juzgar", "Toma notas mentales"]
                    ),
                    Capa3ToolStep(
                        numero: 2,
                        titulo: "Unirse al juego",
                        descripcion: "Participar en el juego del niño siguiendo su liderazgo",
                        instruccion: "Pregunta: '¿Puedo jugar contigo?' Únete a su juego siguiendo sus reglas y su imaginación. No dirijas, solo participa.",
                        duracionEstimada: 180,
                        icono: "person.2.fill",
                        consejosPracticos: ["Sigue su liderazgo", "No cambies las reglas", "Disfruta genuinamente"]
                    ),
                    Capa3ToolStep(
                        numero: 3,
                        titulo: "Introducir elementos de aprendizaje",
                        descripcion: "Incorporar sutilmente habilidades o conceptos dentro del juego",
                        instruccion: "Dentro del juego, introduce naturalmente elementos como: '¿Qué pasaría si...?' o '¿Cómo se sentiría el personaje si...?'",
                        duracionEstimada: 240,
                        icono: "lightbulb.fill",
                        consejosPracticos: ["Hazlo natural", "No fuerces el aprendizaje", "Mantén la diversión"]
                    ),
                    Capa3ToolStep(
                        numero: 4,
                        titulo: "Reflexionar sobre el juego",
                        descripcion: "Ayudar al niño a procesar lo que aprendió a través del juego",
                        instruccion: "Después del juego, pregunta: '¿Qué fue lo más divertido?' o '¿Qué aprendiste jugando?' Conecta el juego con la vida real.",
                        duracionEstimada: 120,
                        icono: "brain.head.profile",
                        consejosPracticos: ["Haz preguntas abiertas", "Conecta con experiencias reales", "Celebra los aprendizajes"]
                    ),
                    Capa3ToolStep(
                        numero: 5,
                        titulo: "Aplicar a situaciones reales",
                        descripcion: "Ayudar al niño a transferir las habilidades del juego a la vida cotidiana",
                        instruccion: "Cuando surja una situación similar en la vida real, recuerda: '¿Recuerdas cuando jugamos...?' Ayúdale a aplicar lo aprendido.",
                        duracionEstimada: 90,
                        icono: "arrow.right.circle.fill",
                        consejosPracticos: ["Haz conexiones claras", "Refuerza positivamente", "Practica regularmente"]
                    )
                ],
                adaptacionesEdad: [
                    Capa3ToolAgeVariant(
                        rangoEdad: "2-4 años",
                        modificaciones: ["Usa juegos sensoriales", "Enfócate en emociones básicas", "Usa mucho contacto físico"],
                        consideracionesEspeciales: ["Puede tener períodos de atención cortos", "Necesita juegos muy simples"],
                        variacionesLenguaje: ["'¿Cómo se siente el oso?'", "'¿Qué hace el oso cuando está triste?'"],
                        duracionAjustada: 10
                    ),
                    Capa3ToolAgeVariant(
                        rangoEdad: "5-8 años",
                        modificaciones: ["Introduce juegos de roles", "Explora emociones más complejas", "Usa juegos de mesa simples"],
                        consideracionesEspeciales: ["Puede entender reglas más complejas", "Puede jugar por más tiempo"],
                        variacionesLenguaje: ["'¿Qué pasaría si fuéramos superhéroes?'", "'¿Cómo resolveríamos este problema?'"],
                        duracionAjustada: 20
                    ),
                    Capa3ToolAgeVariant(
                        rangoEdad: "9-12 años",
                        modificaciones: ["Usa juegos estratégicos", "Explora temas más profundos", "Introduce juegos colaborativos"],
                        consideracionesEspeciales: ["Puede ser más competitivo", "Puede necesitar más desafío"],
                        variacionesLenguaje: ["'¿Cómo manejaríamos esta situación?'", "'¿Qué estrategia usaríamos?'"],
                        duracionAjustada: 30
                    )
                ],
                feedback: Capa3ToolFeedback(
                    mensajesPositivos: [
                        "¡Has transformado el aprendizaje en diversión!",
                        "Tu hijo está aprendiendo habilidades valiosas mientras se divierte.",
                        "El juego es la forma más natural y efectiva de aprender."
                    ],
                    preguntasReflexion: [
                        "¿Qué habilidades observaste en tu hijo durante el juego?",
                        "¿Cómo se sintió tu hijo durante el juego?",
                        "¿Qué conexiones pudiste hacer con la vida real?"
                    ],
                    indicadoresExito: [
                        "Tu hijo aplica habilidades del juego en situaciones reales",
                        "Busca activamente jugar contigo",
                        "Muestra mayor creatividad y resolución de problemas"
                    ],
                    ajustesSugeridos: [
                        "Si tu hijo se resiste, empieza con juegos que le gusten",
                        "Adapta el nivel de complejidad según su edad",
                        "Sé consistente con el tiempo de juego"
                    ],
                    celebracionLogros: [
                        "¡Has dominado la forma más poderosa de enseñar a los niños!",
                        "El juego es la herramienta de aprendizaje más efectiva que existe.",
                        "Tu hijo ahora ve el aprendizaje como algo divertido y emocionante."
                    ]
                ),
                relaciones: [
                    Capa3ToolRelation(
                        tipoRelacion: .principio,
                        elementoRelacionado: "Aprendizaje Natural",
                        descripcionConexion: "Esta herramienta aplica el principio de aprendizaje natural a través del juego.",
                        importancia: .alta
                    ),
                    Capa3ToolRelation(
                        tipoRelacion: .eje,
                        elementoRelacionado: "Sistema de Recompensa",
                        descripcionConexion: "Trabaja con el sistema de recompensa para hacer el aprendizaje placentero.",
                        importancia: .alta
                    )
                ],
                categoria: .juego,
                tiempoEstimado: 20,
                dificultad: .intermedio,
                materialesNecesarios: ["Juguetes o materiales de juego", "Imaginación", "Tiempo dedicado"]
            )
        ]
        
        return Capa3Herramientas(
            herramientas: herramientas,
            introduccion: "La Capa 3, 'Herramientas Prácticas', traduce los principios neuropsicológicos en técnicas concretas y aplicables que los padres pueden implementar inmediatamente. Cada herramienta está diseñada para abordar desafíos específicos de la crianza, desde la regulación emocional hasta la comunicación efectiva, basándose en la neurociencia y el trabajo de Álvaro Bilbao.",
            objetivosGenerales: [
                "Proporcionar herramientas prácticas basadas en neurociencia",
                "Facilitar la implementación inmediata de estrategias de crianza",
                "Desarrollar habilidades de autorregulación en los niños",
                "Fortalecer el vínculo padre-hijo a través de la práctica consciente",
                "Crear un repertorio de estrategias adaptables a diferentes edades"
            ],
            metodologia: "Cada herramienta sigue una metodología estructurada: fundamento teórico, pasos guiados, adaptaciones por edad, feedback reflexivo y conexión con principios neuropsicológicos. El enfoque es práctico, empático y basado en evidencia científica."
        )
    }
}