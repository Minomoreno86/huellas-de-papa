import Foundation

// MARK: - Estructuras de Datos para Capa 6: Plan de Entrenamiento

struct PlanEntrenamiento: Identifiable, Codable {
    let id: UUID
    let titulo: String
    let descripcion: String // 200+ palabras
    let objetivoNeurocientifico: String // Objetivo específico basado en neurociencia
    let duracionSemanas: Int
    let frecuenciaSemanal: Int
    let duracionSesion: String
    let actividades: [String] // 5-8 actividades por plan
    let progresion: [String] // 3-4 niveles de progresión
    let materialesNecesarios: [String]
    let indicadoresProgreso: [String] // 4-6 indicadores
    let adaptaciones: [String] // 3-5 adaptaciones para diferentes edades
    let ejemplosPracticos: [String] // 3-5 ejemplos concretos de aplicación
    let resultadosEsperados: String
    let baseCientifica: String
    let icono: String
    let color: String
    let nivelDificultad: NivelDificultadPlan
    let categoria: CategoriaPlan
    let edadRecomendada: RangoEdadPlan
    
    init(titulo: String, descripcion: String, objetivoNeurocientifico: String, duracionSemanas: Int, frecuenciaSemanal: Int, duracionSesion: String, actividades: [String], progresion: [String], materialesNecesarios: [String], indicadoresProgreso: [String], adaptaciones: [String], ejemplosPracticos: [String], resultadosEsperados: String, baseCientifica: String, icono: String, color: String, nivelDificultad: NivelDificultadPlan, categoria: CategoriaPlan, edadRecomendada: RangoEdadPlan) {
        self.id = UUID()
        self.titulo = titulo
        self.descripcion = descripcion
        self.objetivoNeurocientifico = objetivoNeurocientifico
        self.duracionSemanas = duracionSemanas
        self.frecuenciaSemanal = frecuenciaSemanal
        self.duracionSesion = duracionSesion
        self.actividades = actividades
        self.progresion = progresion
        self.materialesNecesarios = materialesNecesarios
        self.indicadoresProgreso = indicadoresProgreso
        self.adaptaciones = adaptaciones
        self.ejemplosPracticos = ejemplosPracticos
        self.resultadosEsperados = resultadosEsperados
        self.baseCientifica = baseCientifica
        self.icono = icono
        self.color = color
        self.nivelDificultad = nivelDificultad
        self.categoria = categoria
        self.edadRecomendada = edadRecomendada
    }
}

enum NivelDificultadPlan: String, CaseIterable, Codable {
    case basico = "Básico"
    case intermedio = "Intermedio"
    case avanzado = "Avanzado"
    
    var color: String {
        switch self {
        case .basico: return "green"
        case .intermedio: return "orange"
        case .avanzado: return "red"
        }
    }
}

enum CategoriaPlan: String, CaseIterable, Codable {
    case desarrollo = "Desarrollo Cerebral"
    case emocional = "Regulación Emocional"
    case social = "Habilidades Sociales"
    case cognitivo = "Desarrollo Cognitivo"
    case motor = "Desarrollo Motor"
    case integracion = "Integración Cerebral"
    
    var icono: String {
        switch self {
        case .desarrollo: return "brain.head.profile"
        case .emocional: return "heart.fill"
        case .social: return "person.2.fill"
        case .cognitivo: return "lightbulb.fill"
        case .motor: return "figure.walk"
        case .integracion: return "arrow.triangle.merge"
        }
    }
    
    var color: String {
        switch self {
        case .desarrollo: return "blue"
        case .emocional: return "red"
        case .social: return "green"
        case .cognitivo: return "yellow"
        case .motor: return "orange"
        case .integracion: return "purple"
        }
    }
}

enum RangoEdadPlan: String, CaseIterable, Codable {
    case bebes = "0-2 años"
    case preescolares = "3-5 años"
    case escolares = "6-12 años"
    case adolescentes = "13-18 años"
    case familia = "Toda la familia"
    
    var icono: String {
        switch self {
        case .bebes: return "baby.fill"
        case .preescolares: return "child.fill"
        case .escolares: return "student.fill"
        case .adolescentes: return "person.fill"
        case .familia: return "house.fill"
        }
    }
    
    var color: String {
        switch self {
        case .bebes: return "pink"
        case .preescolares: return "blue"
        case .escolares: return "green"
        case .adolescentes: return "orange"
        case .familia: return "purple"
        }
    }
}

struct Capa6PlanEntrenamiento: Identifiable, Codable {
    let id: UUID
    let planes: [PlanEntrenamiento]
    let introduccion: String
    let resumenIntegrador: String
    let progreso: Double
    
    init(planes: [PlanEntrenamiento], introduccion: String, resumenIntegrador: String, progreso: Double) {
        self.id = UUID()
        self.planes = planes
        self.introduccion = introduccion
        self.resumenIntegrador = resumenIntegrador
        self.progreso = progreso
    }
    
    static func contenidoCerebroDelNino() -> Capa6PlanEntrenamiento {
        return Capa6PlanEntrenamiento(
            planes: Capa6PlanEntrenamiento.crearPlanes(),
            introduccion: """
            Los planes de entrenamiento representan la aplicación sistemática y estructurada de los principios neurocientíficos desarrollados por Álvaro Bilbao en programas de desarrollo cerebral específicos. Estos planes están diseñados para crear cambios duraderos en la arquitectura cerebral del niño a través de la práctica repetida y progresiva de actividades basadas en neurociencia. Cada plan está fundamentado en la investigación sobre neuroplasticidad, desarrollo cerebral y los principios de "El cerebro del niño explicado a los padres", proporcionando una guía estructurada para el desarrollo óptimo del cerebro infantil.
            """,
            resumenIntegrador: """
            Los planes de entrenamiento de "El cerebro del niño explicado a los padres" ofrecen una metodología estructurada para aplicar los principios neurocientíficos de Álvaro Bilbao en el desarrollo cerebral del niño. A través de programas sistemáticos y progresivos, los padres pueden crear cambios duraderos en la arquitectura cerebral de sus hijos, fortaleciendo las conexiones neuronales y promoviendo el desarrollo integral. Estos planes transforman el conocimiento teórico en práctica sistemática, creando un camino claro hacia el desarrollo cerebral óptimo.
            """,
            progreso: 0.0
        )
    }
    
    static func crearPlanes() -> [PlanEntrenamiento] {
        return [
            PlanEntrenamiento(
                titulo: "Plan de Desarrollo de la Corteza Prefrontal",
                descripcion: """
                Este plan de entrenamiento está diseñado para fortalecer específicamente la corteza prefrontal del niño, el área cerebral responsable del control ejecutivo, la planificación, la toma de decisiones y la regulación emocional. Basado en los principios de Álvaro Bilbao sobre el desarrollo cerebral jerárquico, este plan utiliza actividades progresivas que activan y fortalecen las conexiones neuronales en esta región crítica. El programa incluye ejercicios de atención, memoria de trabajo, flexibilidad cognitiva y control inhibitorio, todos fundamentados en la investigación neurocientífica sobre el desarrollo de la función ejecutiva en la infancia.
                """,
                objetivoNeurocientifico: "Fortalecer las conexiones neuronales en la corteza prefrontal para mejorar el control ejecutivo, la regulación emocional y las habilidades de planificación del niño.",
                duracionSemanas: 12,
                frecuenciaSemanal: 4,
                duracionSesion: "20-30 minutos",
                actividades: [
                    "Ejercicios de atención sostenida con juegos de concentración",
                    "Actividades de memoria de trabajo con secuencias y patrones",
                    "Juegos de flexibilidad cognitiva y cambio de reglas",
                    "Ejercicios de control inhibitorio y espera",
                    "Actividades de planificación y organización",
                    "Juegos de resolución de problemas complejos",
                    "Ejercicios de autorregulación emocional",
                    "Actividades de metacognición y autoconocimiento"
                ],
                progresion: [
                    "Nivel 1: Actividades básicas de atención y concentración (semanas 1-3)",
                    "Nivel 2: Introducción de memoria de trabajo y control inhibitorio (semanas 4-6)",
                    "Nivel 3: Desarrollo de flexibilidad cognitiva y planificación (semanas 7-9)",
                    "Nivel 4: Integración de habilidades ejecutivas complejas (semanas 10-12)"
                ],
                materialesNecesarios: ["Cronómetro", "Tarjetas de memoria", "Juegos de mesa", "Materiales de arte", "Música relajante", "Diario de progreso"],
                indicadoresProgreso: [
                    "Mejora en la capacidad de atención sostenida",
                    "Incremento en la memoria de trabajo",
                    "Mayor flexibilidad en el cambio de tareas",
                    "Mejor control de impulsos y espera",
                    "Habilidades de planificación más desarrolladas",
                    "Mayor autorregulación emocional"
                ],
                adaptaciones: [
                    "Para bebés: enfocarse en actividades sensoriales y de atención básica",
                    "Para preescolares: usar juegos simples y actividades lúdicas",
                    "Para escolares: incorporar desafíos cognitivos más complejos",
                    "Para adolescentes: incluir proyectos de planificación a largo plazo",
                    "Para toda la familia: actividades colaborativas de desarrollo ejecutivo"
                ],
                ejemplosPracticos: [
                    "Ejemplo 1: 'El Juego del Semáforo' - El niño debe parar (rojo), esperar (amarillo) y continuar (verde) según las instrucciones, desarrollando control inhibitorio y atención sostenida.",
                    "Ejemplo 2: 'Planificación de la Merienda' - El niño debe planificar qué necesita para preparar su merienda favorita, escribiendo una lista y organizando los pasos en orden lógico.",
                    "Ejemplo 3: 'El Juego de la Memoria de Secuencias' - Mostrar al niño una secuencia de 4-6 objetos, luego ocultarlos y pedirle que los recuerde en orden, aumentando gradualmente la dificultad.",
                    "Ejemplo 4: 'Resolución de Problemas Familiares' - Presentar al niño un problema familiar (ej: '¿Cómo organizamos el cuarto para que todos tengamos espacio?') y guiarlo para encontrar soluciones creativas.",
                    "Ejemplo 5: 'El Juego del Cambio de Reglas' - Jugar un juego donde las reglas cambian cada 5 minutos (ej: primero solo números pares, luego solo números impares), desarrollando flexibilidad cognitiva."
                ],
                resultadosEsperados: "Desarrollo significativo de las funciones ejecutivas, mejora en la capacidad de autorregulación, mayor control de impulsos, y habilidades de planificación y organización más desarrolladas.",
                baseCientifica: "Desarrollo de la corteza prefrontal, funciones ejecutivas, neuroplasticidad, control inhibitorio, memoria de trabajo, regulación emocional",
                icono: "brain.head.profile",
                color: "blue",
                nivelDificultad: .avanzado,
                categoria: .desarrollo,
                edadRecomendada: .escolares
            ),
            
            PlanEntrenamiento(
                titulo: "Plan de Regulación Emocional Familiar",
                descripcion: """
                Este plan de entrenamiento está diseñado para desarrollar las habilidades de regulación emocional en toda la familia, basándose en los principios de Álvaro Bilbao sobre la importancia del apego seguro y la regulación emocional en el desarrollo cerebral. El programa incluye actividades que fortalecen el sistema límbico y las conexiones con la corteza prefrontal, promoviendo la capacidad de identificar, expresar y regular emociones de manera saludable. Las actividades están fundamentadas en la investigación sobre el desarrollo emocional y la neurociencia del apego.
                """,
                objetivoNeurocientifico: "Desarrollar las habilidades de regulación emocional familiar fortaleciendo las conexiones entre el sistema límbico y la corteza prefrontal para promover la inteligencia emocional y el bienestar familiar.",
                duracionSemanas: 8,
                frecuenciaSemanal: 3,
                duracionSesion: "25-35 minutos",
                actividades: [
                    "Identificación y etiquetado de emociones familiares",
                    "Técnicas de respiración y relajación familiar",
                    "Juegos de expresión emocional segura",
                    "Actividades de validación emocional mutua",
                    "Ejercicios de resolución de conflictos familiares",
                    "Práctica de empatía y comprensión emocional",
                    "Rutinas de calma y conexión familiar",
                    "Actividades de reparación emocional"
                ],
                progresion: [
                    "Nivel 1: Identificación básica de emociones (semanas 1-2)",
                    "Nivel 2: Técnicas de regulación emocional (semanas 3-4)",
                    "Nivel 3: Resolución de conflictos emocionales (semanas 5-6)",
                    "Nivel 4: Integración de habilidades emocionales (semanas 7-8)"
                ],
                materialesNecesarios: ["Termómetro emocional", "Música relajante", "Materiales de arte", "Libros sobre emociones", "Diario emocional familiar", "Técnicas de respiración"],
                indicadoresProgreso: [
                    "Mayor capacidad de identificar emociones propias y ajenas",
                    "Mejora en las técnicas de regulación emocional",
                    "Reducción en la intensidad de las rabietas",
                    "Mayor empatía y comprensión familiar",
                    "Mejor resolución de conflictos emocionales",
                    "Incremento en la conexión emocional familiar"
                ],
                adaptaciones: [
                    "Para bebés: enfocarse en la regulación a través del apego",
                    "Para preescolares: usar juegos emocionales simples",
                    "Para escolares: incorporar estrategias cognitivas de regulación",
                    "Para adolescentes: trabajar con emociones complejas y sociales",
                    "Para toda la familia: crear un ambiente emocional seguro"
                ],
                ejemplosPracticos: [
                    "Ejemplo 1: 'El Termómetro Emocional Familiar' - Cada miembro de la familia dibuja su estado emocional en un termómetro (1-10) y comparte qué lo hace sentir así, practicando identificación y expresión emocional.",
                    "Ejemplo 2: 'La Respiración de la Tortuga' - Cuando alguien se siente frustrado, toda la familia hace el ejercicio de la tortuga: inhalar contando hasta 4, sostener 4 segundos, exhalar 4 segundos, creando calma colectiva.",
                    "Ejemplo 3: 'El Rincón de las Emociones' - Crear un espacio en casa donde cada persona puede ir cuando necesita regularse, con materiales como música relajante, libros, o actividades calmantes.",
                    "Ejemplo 4: 'Las Cartas de la Empatía' - Escribir cartas anónimas expresando cómo se siente cada uno y qué necesita del otro, luego leerlas en familia para fomentar la comprensión mutua.",
                    "Ejemplo 5: 'El Ritual de Reparación' - Cuando hay conflictos, implementar un ritual donde cada persona expresa su sentimiento, escucha al otro, y juntos buscan una solución que satisfaga a todos."
                ],
                resultadosEsperados: "Desarrollo de inteligencia emocional familiar, mejora en la regulación emocional, mayor conexión y empatía familiar, y creación de un ambiente emocional seguro y de apoyo.",
                baseCientifica: "Regulación emocional, sistema límbico, apego seguro, inteligencia emocional, neuroplasticidad emocional, desarrollo social",
                icono: "heart.fill",
                color: "red",
                nivelDificultad: .intermedio,
                categoria: .emocional,
                edadRecomendada: .familia
            ),
            
            PlanEntrenamiento(
                titulo: "Plan de Integración Cerebral Hemisférica",
                descripcion: """
                Este plan de entrenamiento está diseñado para promover la integración entre los hemisferios cerebrales del niño, basándose en los principios de Álvaro Bilbao sobre la importancia de la integración cerebral para el desarrollo óptimo. El programa incluye actividades que activan y conectan ambos hemisferios, promoviendo la comunicación interhemisférica y la coherencia neural. Las actividades están fundamentadas en la investigación sobre la integración cerebral y el desarrollo de la conectividad funcional en la infancia.
                """,
                objetivoNeurocientifico: "Promover la integración hemisférica y la conectividad funcional entre ambos hemisferios cerebrales para optimizar el desarrollo cognitivo, emocional y social del niño.",
                duracionSemanas: 10,
                frecuenciaSemanal: 3,
                duracionSesion: "30-40 minutos",
                actividades: [
                    "Ejercicios de cruce de línea media corporal",
                    "Actividades de coordinación bilateral",
                    "Juegos de integración sensorial",
                    "Ejercicios de respiración y mindfulness",
                    "Actividades de movimiento rítmico",
                    "Juegos de coordinación ojo-mano",
                    "Ejercicios de equilibrio y propiocepción",
                    "Actividades de integración auditiva-visual"
                ],
                progresion: [
                    "Nivel 1: Actividades básicas de cruce de línea media (semanas 1-2)",
                    "Nivel 2: Coordinación bilateral y movimiento (semanas 3-4)",
                    "Nivel 3: Integración sensorial compleja (semanas 5-6)",
                    "Nivel 4: Integración cognitiva y emocional (semanas 7-8)",
                    "Nivel 5: Coherencia neural y mindfulness (semanas 9-10)"
                ],
                materialesNecesarios: ["Pelotas de diferentes tamaños", "Cuerdas y aros", "Música rítmica", "Materiales de equilibrio", "Técnicas de respiración", "Diario de integración"],
                indicadoresProgreso: [
                    "Mejora en la coordinación bilateral",
                    "Mayor integración sensorial",
                    "Mejor equilibrio y propiocepción",
                    "Incremento en la atención y concentración",
                    "Mayor fluidez en el movimiento",
                    "Mejor integración cognitiva y emocional"
                ],
                adaptaciones: [
                    "Para bebés: enfocarse en movimientos básicos de integración",
                    "Para preescolares: usar juegos de movimiento y coordinación",
                    "Para escolares: incorporar actividades más complejas",
                    "Para adolescentes: incluir mindfulness y meditación",
                    "Para toda la familia: actividades de integración grupal"
                ],
                ejemplosPracticos: [
                    "Ejemplo 1: 'El Juego del Espejo' - El niño y un adulto se sientan frente a frente y uno hace movimientos que el otro debe imitar exactamente, desarrollando coordinación bilateral y atención.",
                    "Ejemplo 2: 'La Marcha Cruzada' - Caminar tocando la rodilla derecha con la mano izquierda y viceversa, alternando cada paso, fortaleciendo la integración hemisférica.",
                    "Ejemplo 3: 'El Dibujo con Ambas Manos' - Dibujar simultáneamente con ambas manos (ej: círculos en direcciones opuestas), activando ambos hemisferios cerebrales al mismo tiempo.",
                    "Ejemplo 4: 'El Juego de los Patrones Rítmicos' - Crear patrones rítmicos con el cuerpo (palmadas, pasos, chasquidos) que el niño debe seguir y luego crear sus propios patrones.",
                    "Ejemplo 5: 'La Meditación del Cuerpo Completo' - Guiar al niño a sentir cada parte de su cuerpo desde los dedos de los pies hasta la cabeza, promoviendo conciencia corporal e integración."
                ],
                resultadosEsperados: "Desarrollo de la integración hemisférica, mejora en la coordinación y equilibrio, mayor atención y concentración, y optimización del desarrollo cognitivo y emocional.",
                baseCientifica: "Integración hemisférica, conectividad funcional, neuroplasticidad, desarrollo sensorial, coordinación bilateral, coherencia neural",
                icono: "arrow.triangle.merge",
                color: "purple",
                nivelDificultad: .avanzado,
                categoria: .integracion,
                edadRecomendada: .preescolares
            ),
            
            PlanEntrenamiento(
                titulo: "Plan de Desarrollo de Habilidades Sociales",
                descripcion: """
                Este plan de entrenamiento está diseñado para desarrollar las habilidades sociales del niño, basándose en los principios de Álvaro Bilbao sobre la importancia del desarrollo social en el desarrollo cerebral. El programa incluye actividades que fortalecen las áreas cerebrales relacionadas con la cognición social, la empatía y la comunicación. Las actividades están fundamentadas en la investigación sobre el desarrollo social y la neurociencia de las relaciones interpersonales en la infancia.
                """,
                objetivoNeurocientifico: "Desarrollar las habilidades sociales del niño fortaleciendo las áreas cerebrales relacionadas con la cognición social, la empatía y la comunicación interpersonal.",
                duracionSemanas: 6,
                frecuenciaSemanal: 4,
                duracionSesion: "20-25 minutos",
                actividades: [
                    "Juegos de roles y dramatización social",
                    "Actividades de empatía y perspectiva",
                    "Ejercicios de comunicación no verbal",
                    "Juegos de cooperación y trabajo en equipo",
                    "Actividades de resolución de conflictos sociales",
                    "Ejercicios de escucha activa y comprensión",
                    "Juegos de habilidades conversacionales",
                    "Actividades de inclusión y diversidad"
                ],
                progresion: [
                    "Nivel 1: Habilidades básicas de comunicación (semanas 1-2)",
                    "Nivel 2: Empatía y perspectiva social (semanas 3-4)",
                    "Nivel 3: Resolución de conflictos y cooperación (semanas 5-6)"
                ],
                materialesNecesarios: ["Juegos de mesa cooperativos", "Materiales de dramatización", "Libros sobre emociones sociales", "Técnicas de comunicación", "Diario social", "Actividades grupales"],
                indicadoresProgreso: [
                    "Mejora en la comunicación interpersonal",
                    "Mayor empatía y comprensión social",
                    "Mejor resolución de conflictos",
                    "Incremento en la cooperación y trabajo en equipo",
                    "Mayor inclusión y aceptación de la diversidad",
                    "Mejor habilidades conversacionales"
                ],
                adaptaciones: [
                    "Para bebés: enfocarse en la interacción social básica",
                    "Para preescolares: usar juegos simples de cooperación",
                    "Para escolares: incorporar actividades de grupo más complejas",
                    "Para adolescentes: trabajar con habilidades sociales avanzadas",
                    "Para toda la familia: actividades de conexión social familiar"
                ],
                ejemplosPracticos: [
                    "Ejemplo 1: 'El Teatro de las Emociones' - Crear pequeñas obras de teatro donde el niño debe interpretar diferentes emociones y situaciones sociales, desarrollando empatía y expresión.",
                    "Ejemplo 2: 'El Juego del Detective Social' - Observar a otras personas en el parque o supermercado y adivinar cómo se sienten basándose en su lenguaje corporal, practicando lectura social.",
                    "Ejemplo 3: 'La Mesa de la Paz' - Crear un espacio especial donde el niño puede resolver conflictos con hermanos o amigos, practicando escucha activa y negociación.",
                    "Ejemplo 4: 'El Club de Conversación' - Organizar reuniones familiares donde cada persona comparte algo de su día y los demás practican escuchar sin interrumpir y hacer preguntas empáticas.",
                    "Ejemplo 5: 'El Juego de los Roles Familiares' - Intercambiar roles en la familia por un día (el niño es el papá, la mamá es el niño), desarrollando perspectiva y comprensión mutua."
                ],
                resultadosEsperados: "Desarrollo de habilidades sociales, mejora en la comunicación interpersonal, mayor empatía y comprensión social, y mejor capacidad de trabajo en equipo y resolución de conflictos.",
                baseCientifica: "Desarrollo social, cognición social, empatía, comunicación interpersonal, habilidades sociales, neuroplasticidad social",
                icono: "person.2.fill",
                color: "green",
                nivelDificultad: .intermedio,
                categoria: .social,
                edadRecomendada: .escolares
            ),
            
            PlanEntrenamiento(
                titulo: "Plan de Desarrollo Motor y Sensorial",
                descripcion: """
                Este plan de entrenamiento está diseñado para desarrollar las habilidades motoras y sensoriales del niño, basándose en los principios de Álvaro Bilbao sobre la importancia del desarrollo sensorial y motor en el desarrollo cerebral. El programa incluye actividades que fortalecen las conexiones neuronales entre las áreas motoras y sensoriales del cerebro. Las actividades están fundamentadas en la investigación sobre el desarrollo motor y la integración sensorial en la infancia.
                """,
                objetivoNeurocientifico: "Desarrollar las habilidades motoras y sensoriales del niño fortaleciendo las conexiones neuronales entre las áreas motoras y sensoriales del cerebro para promover el desarrollo integral.",
                duracionSemanas: 8,
                frecuenciaSemanal: 3,
                duracionSesion: "25-30 minutos",
                actividades: [
                    "Ejercicios de motricidad gruesa y fina",
                    "Actividades de integración sensorial",
                    "Juegos de equilibrio y coordinación",
                    "Ejercicios de propiocepción y conciencia corporal",
                    "Actividades de desarrollo de la lateralidad",
                    "Juegos de coordinación ojo-mano",
                    "Ejercicios de ritmo y secuenciación",
                    "Actividades de desarrollo de la fuerza muscular"
                ],
                progresion: [
                    "Nivel 1: Desarrollo básico de motricidad (semanas 1-2)",
                    "Nivel 2: Integración sensorial y equilibrio (semanas 3-4)",
                    "Nivel 3: Coordinación y lateralidad (semanas 5-6)",
                    "Nivel 4: Habilidades motoras complejas (semanas 7-8)"
                ],
                materialesNecesarios: ["Pelotas de diferentes tamaños", "Cuerdas y aros", "Materiales de equilibrio", "Instrumentos musicales", "Materiales de arte", "Equipos de ejercicio"],
                indicadoresProgreso: [
                    "Mejora en la motricidad gruesa y fina",
                    "Mayor equilibrio y coordinación",
                    "Mejor integración sensorial",
                    "Incremento en la conciencia corporal",
                    "Mayor desarrollo de la lateralidad",
                    "Mejor coordinación ojo-mano"
                ],
                adaptaciones: [
                    "Para bebés: enfocarse en movimientos básicos y exploración sensorial",
                    "Para preescolares: usar juegos de movimiento y coordinación",
                    "Para escolares: incorporar actividades deportivas y de coordinación",
                    "Para adolescentes: incluir actividades de fitness y deportes",
                    "Para toda la familia: actividades físicas familiares"
                ],
                ejemplosPracticos: [
                    "Ejemplo 1: 'El Circuito Sensorial' - Crear un recorrido en casa con diferentes texturas (alfombra, baldosas, arena) donde el niño camina descalzo, desarrollando integración sensorial.",
                    "Ejemplo 2: 'El Juego del Equilibrio' - Caminar sobre una línea de cinta en el suelo, luego sobre un banco, progresando a caminar con un objeto en la cabeza, fortaleciendo el equilibrio.",
                    "Ejemplo 3: 'La Danza de los Animales' - Imitar movimientos de diferentes animales (saltar como conejo, gatear como gato, volar como pájaro), desarrollando coordinación y creatividad motora.",
                    "Ejemplo 4: 'El Juego de los Obstáculos' - Crear un circuito con cojines, sillas y cuerdas que el niño debe atravesar sin tocar, mejorando la planificación motora y el control corporal.",
                    "Ejemplo 5: 'La Masa Sensorial' - Hacer masa de pan o arcilla donde el niño amasa, estira y moldea, fortaleciendo la motricidad fina y la integración sensorial táctil."
                ],
                resultadosEsperados: "Desarrollo de habilidades motoras y sensoriales, mejora en la coordinación y equilibrio, mayor conciencia corporal, y optimización del desarrollo físico y sensorial.",
                baseCientifica: "Desarrollo motor, integración sensorial, neuroplasticidad motora, coordinación, equilibrio, desarrollo de la lateralidad",
                icono: "figure.walk",
                color: "orange",
                nivelDificultad: .basico,
                categoria: .motor,
                edadRecomendada: .bebes
            ),
            
            PlanEntrenamiento(
                titulo: "Plan de Desarrollo Cognitivo y Aprendizaje",
                descripcion: """
                Este plan de entrenamiento está diseñado para desarrollar las habilidades cognitivas y de aprendizaje del niño, basándose en los principios de Álvaro Bilbao sobre la importancia del desarrollo cognitivo en el desarrollo cerebral. El programa incluye actividades que fortalecen las áreas cerebrales relacionadas con el pensamiento, la memoria, la atención y el aprendizaje. Las actividades están fundamentadas en la investigación sobre el desarrollo cognitivo y la neurociencia del aprendizaje en la infancia.
                """,
                objetivoNeurocientifico: "Desarrollar las habilidades cognitivas y de aprendizaje del niño fortaleciendo las áreas cerebrales relacionadas con el pensamiento, la memoria, la atención y el procesamiento de información.",
                duracionSemanas: 10,
                frecuenciaSemanal: 4,
                duracionSesion: "20-30 minutos",
                actividades: [
                    "Ejercicios de memoria y retención de información",
                    "Actividades de atención y concentración",
                    "Juegos de pensamiento lógico y razonamiento",
                    "Ejercicios de resolución de problemas",
                    "Actividades de creatividad e innovación",
                    "Juegos de categorización y clasificación",
                    "Ejercicios de secuenciación y patrones",
                    "Actividades de metacognición y estrategias de aprendizaje"
                ],
                progresion: [
                    "Nivel 1: Desarrollo básico de atención y memoria (semanas 1-2)",
                    "Nivel 2: Pensamiento lógico y razonamiento (semanas 3-4)",
                    "Nivel 3: Resolución de problemas y creatividad (semanas 5-6)",
                    "Nivel 4: Estrategias de aprendizaje y metacognición (semanas 7-8)",
                    "Nivel 5: Integración de habilidades cognitivas (semanas 9-10)"
                ],
                materialesNecesarios: ["Juegos de memoria", "Puzzles y rompecabezas", "Materiales de arte", "Libros educativos", "Técnicas de estudio", "Diario de aprendizaje"],
                indicadoresProgreso: [
                    "Mejora en la memoria y retención",
                    "Mayor atención y concentración",
                    "Mejor pensamiento lógico y razonamiento",
                    "Incremento en la resolución de problemas",
                    "Mayor creatividad e innovación",
                    "Mejor estrategias de aprendizaje"
                ],
                adaptaciones: [
                    "Para bebés: enfocarse en la exploración sensorial y atención básica",
                    "Para preescolares: usar juegos simples de memoria y lógica",
                    "Para escolares: incorporar desafíos cognitivos más complejos",
                    "Para adolescentes: incluir estrategias de estudio y metacognición",
                    "Para toda la familia: actividades de aprendizaje colaborativo"
                ],
                ejemplosPracticos: [
                    "Ejemplo 1: 'El Juego de la Memoria Visual' - Mostrar al niño 10 objetos durante 30 segundos, luego ocultarlos y pedirle que liste todos los que recuerda, aumentando gradualmente la cantidad.",
                    "Ejemplo 2: 'La Categorización Creativa' - Dar al niño una caja de objetos diversos y pedirle que los agrupe de diferentes maneras (por color, tamaño, función, material), desarrollando pensamiento flexible.",
                    "Ejemplo 3: 'El Detective de Patrones' - Crear secuencias de colores, formas o números que el niño debe completar, luego crear sus propias secuencias para que otros las resuelvan.",
                    "Ejemplo 4: 'El Planificador de Proyectos' - Elegir un proyecto familiar (ej: organizar una fiesta) y guiar al niño para planificar pasos, materiales, tiempo y responsabilidades, desarrollando pensamiento estratégico.",
                    "Ejemplo 5: 'El Juego de las Preguntas Inteligentes' - Después de leer un cuento o ver una película, hacer preguntas que requieran análisis, síntesis y evaluación (¿Por qué crees que...? ¿Qué pasaría si...?)."
                ],
                resultadosEsperados: "Desarrollo de habilidades cognitivas, mejora en la memoria y atención, mayor capacidad de pensamiento lógico, y optimización de las estrategias de aprendizaje.",
                baseCientifica: "Desarrollo cognitivo, neuroplasticidad, memoria, atención, pensamiento lógico, metacognición, estrategias de aprendizaje",
                icono: "lightbulb.fill",
                color: "yellow",
                nivelDificultad: .intermedio,
                categoria: .cognitivo,
                edadRecomendada: .escolares
            )
        ]
    }
}
