import Foundation
import SwiftUI

// MARK: - Modelo Principal de Capa 7

struct Capa7Evaluacion: Codable {
    let id: UUID
    let titulo: String
    let descripcion: String
    let introduccion: String
    let objetivos: [String]
    let reflectionTests: [Capa7ReflectionTest]
    let scenarios: [Capa7Scenario]
    let progreso: Double
    
    init(titulo: String, descripcion: String, introduccion: String, objetivos: [String], reflectionTests: [Capa7ReflectionTest], scenarios: [Capa7Scenario], progreso: Double) {
        self.id = UUID()
        self.titulo = titulo
        self.descripcion = descripcion
        self.introduccion = introduccion
        self.objetivos = objetivos
        self.reflectionTests = reflectionTests
        self.scenarios = scenarios
        self.progreso = progreso
    }
    
    static func contenidoCerebroDelNino() -> Capa7Evaluacion {
        return Capa7Evaluacion(
            titulo: "Evaluación Reflexiva y de Escenarios",
            descripcion: "Autoevaluación emocional y cognitiva basada en 'El cerebro de un niño explicado a los padres'",
            introduccion: """
            Esta evaluación te ayuda a darte cuenta de cómo reaccionas, sientes, piensas y actúas frente a las emociones y conductas de tu hijo.
            
            No hay respuestas correctas o incorrectas. Se trata de observarte con compasión y entender tu estado emocional actual para crecer como padre.
            """,
            objetivos: [
                "Autoconocimiento emocional y cognitivo",
                "Reflexión sobre patrones de respuesta",
                "Desarrollo de co-regulación",
                "Fortalecimiento de la conexión empática",
                "Aplicación consciente de herramientas"
            ],
            reflectionTests: generarTestsReflexivos(),
            scenarios: generarEscenariosInteractivos(),
            progreso: 0.0
        )
    }
}

// MARK: - Generación de Tests Reflexivos

func generarTestsReflexivos() -> [Capa7ReflectionTest] {
    return [
        // Test 1: "Mi Calma Interior"
        Capa7ReflectionTest(
            id: UUID(),
            title: "Mi Calma Interior",
            questions: [
                ReflectionQuestion(
                    id: UUID(),
                    prompt: "Cuando mi hijo se frustra, suelo mantener la calma antes de hablar.",
                    options: [
                        ReflectionOption(
                            id: UUID(),
                            text: "Siempre",
                            feedback: "Tu calma está creciendo. La corteza prefrontal se entrena cuando logras pausar antes de reaccionar.",
                            brainLevel: .prefrontal
                        ),
                        ReflectionOption(
                            id: UUID(),
                            text: "Casi siempre",
                            feedback: "Estás desarrollando autorregulación. Cada pausa fortalece las conexiones neuronales de calma.",
                            brainLevel: .bridge
                        ),
                        ReflectionOption(
                            id: UUID(),
                            text: "A veces",
                            feedback: "Es normal tener días difíciles. La práctica de la respiración consciente te ayudará.",
                            brainLevel: .bridge
                        ),
                        ReflectionOption(
                            id: UUID(),
                            text: "Me cuesta mucho",
                            feedback: "Reconocer esto es el primer paso. La co-regulación se aprende paso a paso.",
                            brainLevel: .amygdala
                        )
                    ]
                ),
                ReflectionQuestion(
                    id: UUID(),
                    prompt: "Cuando mi hijo llora, mi primera reacción es...",
                    options: [
                        ReflectionOption(
                            id: UUID(),
                            text: "Abrazarlo y validar su emoción",
                            feedback: "Perfecto. La validación emocional construye seguridad y conexión.",
                            brainLevel: .prefrontal
                        ),
                        ReflectionOption(
                            id: UUID(),
                            text: "Preguntarle qué le pasa",
                            feedback: "Bien, pero primero la conexión emocional, luego las palabras.",
                            brainLevel: .bridge
                        ),
                        ReflectionOption(
                            id: UUID(),
                            text: "Decirle que no llore",
                            feedback: "Las emociones necesitan ser sentidas. La represión no ayuda.",
                            brainLevel: .amygdala
                        ),
                        ReflectionOption(
                            id: UUID(),
                            text: "Ignorarlo hasta que se calme",
                            feedback: "El niño necesita tu presencia emocional para autorregularse.",
                            brainLevel: .amygdala
                        )
                    ]
                ),
                ReflectionQuestion(
                    id: UUID(),
                    prompt: "Antes de establecer un límite, suelo...",
            options: [
                        ReflectionOption(
                            id: UUID(),
                            text: "Conectarme emocionalmente con mi hijo",
                            feedback: "Excelente. Conexión antes que corrección es la base del desarrollo cerebral.",
                            brainLevel: .prefrontal
                        ),
                        ReflectionOption(
                            id: UUID(),
                            text: "Explicar por qué es importante",
                            feedback: "Bueno, pero primero la conexión emocional, luego la explicación.",
                            brainLevel: .bridge
                        ),
                        ReflectionOption(
                            id: UUID(),
                            text: "Ser firme inmediatamente",
                            feedback: "La firmeza sin conexión puede activar el sistema de defensa del niño.",
                            brainLevel: .amygdala
                        ),
                        ReflectionOption(
                            id: UUID(),
                            text: "Amenazar con consecuencias",
                            feedback: "El miedo no enseña autorregulación. La conexión sí.",
                            brainLevel: .amygdala
                        )
                    ]
                )
            ]
        ),
        
        // Test 2: "Lenguaje que Educa"
        Capa7ReflectionTest(
            id: UUID(),
            title: "Lenguaje que Educa",
            questions: [
                ReflectionQuestion(
                    id: UUID(),
                    prompt: "Cuando mi hijo hace algo que no me gusta, suelo decir...",
                    options: [
                        ReflectionOption(
                            id: UUID(),
                            text: "Veo que estás molesto, pero necesitamos...",
                            feedback: "Perfecto. Validar la emoción y luego establecer el límite.",
                            brainLevel: .prefrontal
                        ),
                        ReflectionOption(
                            id: UUID(),
                            text: "No está bien lo que hiciste",
                            feedback: "Es mejor enfocarse en la emoción que en la conducta.",
                            brainLevel: .bridge
                        ),
                        ReflectionOption(
                            id: UUID(),
                            text: "Eres malo cuando haces eso",
                            feedback: "Separar la conducta de la persona es fundamental.",
                            brainLevel: .amygdala
                        ),
                        ReflectionOption(
                            id: UUID(),
                            text: "Ya no te quiero",
                            feedback: "El amor incondicional es la base de la seguridad emocional.",
                            brainLevel: .amygdala
                        )
                    ]
                ),
                ReflectionQuestion(
                    id: UUID(),
                    prompt: "Cuando mi hijo logra algo, mi respuesta típica es...",
            options: [
                        ReflectionOption(
                            id: UUID(),
                            text: "Me alegra ver tu esfuerzo y dedicación",
                            feedback: "Excelente. Enfocarse en el proceso fortalece la motivación intrínseca.",
                            brainLevel: .prefrontal
                        ),
                        ReflectionOption(
                            id: UUID(),
                            text: "¡Qué inteligente eres!",
                            feedback: "Es mejor elogiar el esfuerzo que la inteligencia fija.",
                            brainLevel: .bridge
                        ),
                        ReflectionOption(
                            id: UUID(),
                            text: "Finalmente lo hiciste bien",
                            feedback: "El lenguaje positivo construye autoestima.",
                            brainLevel: .amygdala
                        ),
                        ReflectionOption(
                            id: UUID(),
                            text: "Era hora de que lo lograras",
                            feedback: "La validación del esfuerzo es más importante que el resultado.",
                            brainLevel: .amygdala
                        )
                    ]
                )
            ]
        ),
        
        // Test 3: "Cuando pierdo el control"
        Capa7ReflectionTest(
            id: UUID(),
            title: "Cuando pierdo el control",
            questions: [
                ReflectionQuestion(
                    id: UUID(),
                    prompt: "¿Qué situaciones me hacen perder la calma más fácilmente?",
                    options: [
                        ReflectionOption(
                            id: UUID(),
                            text: "Cuando mi hijo no me escucha",
                            feedback: "La desobediencia activa nuestro sistema de amenaza. Respira y conecta.",
                            brainLevel: .amygdala
                        ),
                        ReflectionOption(
                            id: UUID(),
                            text: "Cuando hay mucho ruido y desorden",
                            feedback: "El caos sensorial puede sobrecargar el sistema nervioso. Busca espacios de calma.",
                            brainLevel: .amygdala
                        ),
                        ReflectionOption(
                            id: UUID(),
                            text: "Cuando estoy cansado o estresado",
                            feedback: "El autocuidado es fundamental para la co-regulación.",
                            brainLevel: .bridge
                        ),
                        ReflectionOption(
                            id: UUID(),
                            text: "Cuando siento que no tengo control",
                            feedback: "La necesidad de control puede activar la amígdala. Practica la aceptación.",
                            brainLevel: .amygdala
                        )
                    ]
                ),
                ReflectionQuestion(
                    id: UUID(),
                    prompt: "Cuando pierdo el control, mi primera reacción es...",
            options: [
                        ReflectionOption(
                            id: UUID(),
                            text: "Respirar profundamente y pedir disculpas",
                            feedback: "Excelente. La reparación fortalece la conexión y enseña autorregulación.",
                            brainLevel: .prefrontal
                        ),
                        ReflectionOption(
                            id: UUID(),
                            text: "Alejarme para calmarme",
                            feedback: "Bien, pero comunica tu necesidad de calma al niño.",
                            brainLevel: .bridge
                        ),
                        ReflectionOption(
                            id: UUID(),
                            text: "Seguir discutiendo",
                            feedback: "La escalada emocional no resuelve conflictos.",
                            brainLevel: .amygdala
                        ),
                        ReflectionOption(
                            id: UUID(),
                            text: "Culpar a mi hijo",
                            feedback: "La responsabilidad emocional es clave para el desarrollo.",
                            brainLevel: .amygdala
                        )
                    ]
                )
            ]
        ),
        
        // Test 4: "La mirada del niño"
        Capa7ReflectionTest(
            id: UUID(),
            title: "La mirada del niño",
            questions: [
                ReflectionQuestion(
                    id: UUID(),
                    prompt: "¿Cómo crees que se siente mi hijo cuando estoy estresado?",
                    options: [
                        ReflectionOption(
                            id: UUID(),
                            text: "Se siente seguro porque sabe que lo amo",
                            feedback: "El amor incondicional es la base, pero la co-regulación es clave.",
                            brainLevel: .prefrontal
                        ),
                        ReflectionOption(
                            id: UUID(),
                            text: "Se siente confundido y ansioso",
                            feedback: "Los niños son esponjas emocionales. Tu calma es su calma.",
                            brainLevel: .bridge
                        ),
                        ReflectionOption(
                            id: UUID(),
                            text: "No se da cuenta de mi estado",
                            feedback: "Los niños perciben todo. Son expertos en leer emociones.",
                            brainLevel: .amygdala
                        ),
                        ReflectionOption(
                            id: UUID(),
                            text: "Se siente culpable",
                            feedback: "Los niños pueden internalizar el estrés de los padres.",
                            brainLevel: .amygdala
                        )
                    ]
                ),
                ReflectionQuestion(
                    id: UUID(),
                    prompt: "¿Qué necesita mi hijo de mí cuando está molesto?",
            options: [
                        ReflectionOption(
                            id: UUID(),
                            text: "Mi presencia calmada y empática",
                            feedback: "Perfecto. La co-regulación es el regalo más valioso.",
                            brainLevel: .prefrontal
                        ),
                        ReflectionOption(
                            id: UUID(),
                            text: "Que le diga qué hacer",
                            feedback: "Primero la conexión emocional, luego la guía.",
                            brainLevel: .bridge
                        ),
                        ReflectionOption(
                            id: UUID(),
                            text: "Que lo deje solo",
                            feedback: "Los niños necesitan acompañamiento emocional.",
                            brainLevel: .amygdala
                        ),
                        ReflectionOption(
                            id: UUID(),
                            text: "Que le dé lo que quiere",
                            feedback: "Las emociones necesitan validación, no satisfacción inmediata.",
                            brainLevel: .amygdala
                        )
                    ]
                )
            ]
        ),
        
        // Test 5: "Mi progreso invisible"
        Capa7ReflectionTest(
            id: UUID(),
            title: "Mi progreso invisible",
            questions: [
                ReflectionQuestion(
                    id: UUID(),
                    prompt: "¿Qué he notado diferente en mi relación con mi hijo últimamente?",
                    options: [
                        ReflectionOption(
                            id: UUID(),
                            text: "Me siento más conectado y presente",
                            feedback: "La presencia consciente transforma las relaciones.",
                            brainLevel: .prefrontal
                        ),
                        ReflectionOption(
                            id: UUID(),
                            text: "Puedo mantener la calma más tiempo",
                            feedback: "La autorregulación se desarrolla con la práctica.",
                            brainLevel: .bridge
                        ),
                        ReflectionOption(
                            id: UUID(),
                            text: "Entiendo mejor sus emociones",
                            feedback: "La empatía se fortalece con la observación consciente.",
                            brainLevel: .bridge
                        ),
                        ReflectionOption(
                            id: UUID(),
                            text: "Aún me cuesta, pero sigo intentando",
                            feedback: "El crecimiento es un proceso. Cada intento cuenta.",
                            brainLevel: .amygdala
                        )
                    ]
                ),
                ReflectionQuestion(
                    id: UUID(),
                    prompt: "¿Qué herramienta me ha resultado más útil?",
            options: [
                        ReflectionOption(
                            id: UUID(),
                            text: "La respiración consciente",
                            feedback: "La respiración es la base de la autorregulación.",
                            brainLevel: .prefrontal
                        ),
                        ReflectionOption(
                            id: UUID(),
                            text: "Validar las emociones",
                            feedback: "La validación construye conexión y seguridad.",
                            brainLevel: .bridge
                        ),
                        ReflectionOption(
                            id: UUID(),
                            text: "Establecer límites con amor",
                            feedback: "Los límites con conexión enseñan autorregulación.",
                            brainLevel: .bridge
                        ),
                        ReflectionOption(
                            id: UUID(),
                            text: "Todavía estoy aprendiendo",
                            feedback: "El aprendizaje es un viaje. Cada paso importa.",
                            brainLevel: .amygdala
                        )
                    ]
                )
            ]
        )
    ]
}

// MARK: - Generación de Escenarios Interactivos

func generarEscenariosInteractivos() -> [Capa7Scenario] {
    return [
        Capa7Scenario(
            id: UUID(),
            context: "Es la hora de dormir y tu hijo de 4 años no quiere irse a la cama.",
            situation: "Tu hijo lanza un juguete cuando le dices que apague la tablet.",
            options: [
                ScenarioOption(
                    id: UUID(),
                    text: "Le quito la tablet inmediatamente",
                    reflection: "Estableces el límite pero sin conexión emocional. El niño puede sentirse desconectado.",
                    brainResponse: .amygdala
                ),
                ScenarioOption(
                    id: UUID(),
                    text: "Le digo 'Ya te dije que no, y punto'",
                    reflection: "La firmeza sin empatía puede activar el sistema de defensa del niño.",
                    brainResponse: .amygdala
                ),
                ScenarioOption(
                    id: UUID(),
                    text: "Le miro y digo: 'Veo que estás muy molesto, respiremos juntos'",
                    reflection: "¡Perfecto! La co-regulación enseña al cerebro del niño a calmarse observando tu calma.",
                    brainResponse: .prefrontal
                ),
                ScenarioOption(
                    id: UUID(),
                    text: "Ignoro y me voy",
                    reflection: "El niño necesita tu presencia emocional para autorregularse.",
                    brainResponse: .amygdala
                )
            ]
        ),
        
        Capa7Scenario(
            id: UUID(),
            context: "Tu hijo de 6 años tiene una rabieta en el supermercado porque no le compras un dulce.",
            situation: "La gente te está mirando y te sientes juzgado.",
            options: [
                ScenarioOption(
                    id: UUID(),
                    text: "Le compro el dulce para que se calme",
                    reflection: "Funciona a corto plazo, pero no enseña autorregulación. Es mejor la co-regulación.",
                    brainResponse: .amygdala
                ),
                ScenarioOption(
                    id: UUID(),
                    text: "Le grito que se calme",
                    reflection: "El miedo no enseña autorregulación. La calma se enseña con calma.",
                    brainResponse: .amygdala
                ),
                ScenarioOption(
                    id: UUID(),
                    text: "Me agacho a su altura y respiro con él",
                    reflection: "Excelente. La co-regulación en público es valiente y efectiva.",
                    brainResponse: .prefrontal
                ),
                ScenarioOption(
                    id: UUID(),
                    text: "Lo saco del supermercado inmediatamente",
                    reflection: "Bueno para evitar sobreestimulación, pero primero intenta la co-regulación.",
                    brainResponse: .bridge
                )
            ]
        ),
        
        Capa7Scenario(
            id: UUID(),
            context: "Tus hijos de 5 y 7 años están peleando por un juguete.",
            situation: "El mayor le quita el juguete al menor y este empieza a llorar.",
            options: [
                ScenarioOption(
                    id: UUID(),
                    text: "Le doy el juguete al mayor porque es más responsable",
                    reflection: "Esto puede crear resentimiento. Es mejor enseñarles a resolver juntos.",
                    brainResponse: .amygdala
                ),
                ScenarioOption(
                    id: UUID(),
                    text: "Les quito el juguete a ambos",
                    reflection: "Evita el conflicto pero no enseña resolución de problemas.",
                    brainResponse: .bridge
                ),
                ScenarioOption(
                    id: UUID(),
                    text: "Les digo 'Veo que ambos quieren el juguete. ¿Cómo podemos solucionarlo juntos?'",
                    reflection: "¡Perfecto! Validaste ambas emociones y los involucraste en la solución.",
                    brainResponse: .prefrontal
                ),
                ScenarioOption(
                    id: UUID(),
                    text: "Los dejo que se peleen hasta que se cansen",
                    reflection: "Los conflictos no resueltos pueden escalar. La mediación es importante.",
                    brainResponse: .amygdala
                )
            ]
        ),
        
        Capa7Scenario(
            id: UUID(),
            context: "Tu hijo de 8 años se niega a hacer la tarea después de 2 horas de intentar convencerlo.",
            situation: "Ya es tarde y necesitas que se acueste pronto.",
            options: [
                ScenarioOption(
                    id: UUID(),
                    text: "Le quito todos sus privilegios",
                    reflection: "Los castigos pueden crear resistencia. Es mejor la conexión y colaboración.",
                    brainResponse: .amygdala
                ),
                ScenarioOption(
                    id: UUID(),
                    text: "Le digo 'Entiendo que es difícil. Tienes 10 minutos más, luego la guardamos juntos'",
                    reflection: "¡Excelente! Validaste su emoción, estableciste el límite y ofreciste colaboración.",
                    brainResponse: .prefrontal
                ),
                ScenarioOption(
                    id: UUID(),
                    text: "Hago la tarea por él",
                    reflection: "Aunque es tentador, no enseña responsabilidad ni autorregulación.",
                    brainResponse: .amygdala
                ),
                ScenarioOption(
                    id: UUID(),
                    text: "Le grito que la haga ahora mismo",
                    reflection: "El miedo no enseña motivación intrínseca. La conexión sí.",
                    brainResponse: .amygdala
                )
            ]
        ),
        
        Capa7Scenario(
            id: UUID(),
            context: "Tu hijo de 3 años tiene una rabieta porque no quiere ponerse el abrigo para salir.",
            situation: "Tienes prisa y necesitas salir en 5 minutos.",
            options: [
                ScenarioOption(
                    id: UUID(),
                    text: "Le pongo el abrigo a la fuerza",
                    reflection: "La fuerza física puede activar el sistema de defensa del niño.",
                    brainResponse: .amygdala
                ),
                ScenarioOption(
                    id: UUID(),
                    text: "Le digo 'Veo que no quieres el abrigo. ¿Te ayudo a ponértelo o prefieres hacerlo tú?'",
                    reflection: "¡Perfecto! Validaste su resistencia y le diste opciones dentro del límite.",
                    brainResponse: .prefrontal
                ),
                ScenarioOption(
                    id: UUID(),
                    text: "Le prometo un premio si se pone el abrigo",
                    reflection: "Los premios externos no enseñan autorregulación. Es mejor la conexión.",
                    brainResponse: .bridge
                ),
                ScenarioOption(
                    id: UUID(),
                    text: "Me voy sin él",
                    reflection: "El abandono no es una opción. Los niños necesitan tu presencia.",
                    brainResponse: .amygdala
                )
            ]
        )
    ]
}
