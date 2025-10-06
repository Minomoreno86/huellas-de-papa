import Foundation

// MARK: - Estructuras de Datos para Capa 5: Aplicación en Casa

struct ActividadCasa: Identifiable, Codable {
    let id: UUID
    let titulo: String
    let descripcion: String // 200+ palabras
    let objetivoNeurocientifico: String // Objetivo específico basado en neurociencia
    let pasosActividad: [String] // 5-7 pasos detallados
    let edadRecomendada: String
    let duracionEstimada: String
    let materialesNecesarios: [String]
    let variaciones: [String] // 3-5 variaciones para diferentes edades
    let resultadosEsperados: String // Qué cambios neurobiológicos esperamos
    let baseCientifica: String // Fundamentos neurocientíficos
    let icono: String
    let color: String
    let nivelDificultad: NivelDificultadCasa
    let categoria: CategoriaActividadCasa
    let rangoEdad: RangoEdad
    
    init(titulo: String, descripcion: String, objetivoNeurocientifico: String, pasosActividad: [String], edadRecomendada: String, duracionEstimada: String, materialesNecesarios: [String], variaciones: [String], resultadosEsperados: String, baseCientifica: String, icono: String, color: String, nivelDificultad: NivelDificultadCasa, categoria: CategoriaActividadCasa, rangoEdad: RangoEdad) {
        self.id = UUID()
        self.titulo = titulo
        self.descripcion = descripcion
        self.objetivoNeurocientifico = objetivoNeurocientifico
        self.pasosActividad = pasosActividad
        self.edadRecomendada = edadRecomendada
        self.duracionEstimada = duracionEstimada
        self.materialesNecesarios = materialesNecesarios
        self.variaciones = variaciones
        self.resultadosEsperados = resultadosEsperados
        self.baseCientifica = baseCientifica
        self.icono = icono
        self.color = color
        self.nivelDificultad = nivelDificultad
        self.categoria = categoria
        self.rangoEdad = rangoEdad
    }
}

enum NivelDificultadCasa: String, CaseIterable, Codable {
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

enum CategoriaActividadCasa: String, CaseIterable, Codable {
    case rutinas = "Rutinas Diarias"
    case emociones = "Gestión Emocional"
    case aprendizaje = "Aprendizaje Activo"
    case conexion = "Conexión Familiar"
    case desarrollo = "Desarrollo Cerebral"
    case juego = "Juego Educativo"
    
    var icono: String {
        switch self {
        case .rutinas: return "clock.fill"
        case .emociones: return "heart.fill"
        case .aprendizaje: return "brain.head.profile"
        case .conexion: return "person.2.fill"
        case .desarrollo: return "chart.line.uptrend.xyaxis"
        case .juego: return "gamecontroller.fill"
        }
    }
    
    var color: String {
        switch self {
        case .rutinas: return "blue"
        case .emociones: return "red"
        case .aprendizaje: return "purple"
        case .conexion: return "green"
        case .desarrollo: return "orange"
        case .juego: return "yellow"
        }
    }
}

enum RangoEdad: String, CaseIterable, Codable {
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

struct Capa5AplicacionCasa: Identifiable, Codable {
    let id: UUID
    let actividades: [ActividadCasa]
    let introduccion: String
    let resumenIntegrador: String
    let progreso: Double
    
    init(actividades: [ActividadCasa], introduccion: String, resumenIntegrador: String, progreso: Double) {
        self.id = UUID()
        self.actividades = actividades
        self.introduccion = introduccion
        self.resumenIntegrador = resumenIntegrador
        self.progreso = progreso
    }
    
    static func contenidoCerebroDelNino() -> Capa5AplicacionCasa {
        return Capa5AplicacionCasa(
            actividades: Capa5AplicacionCasa.crearActividades(),
            introduccion: """
            La aplicación en casa representa la transformación práctica de todos los conocimientos neurocientíficos desarrollados por Álvaro Bilbao en experiencias cotidianas y significativas. Estas actividades están diseñadas para integrar los principios de la neurociencia del desarrollo en la vida diaria familiar, creando un ambiente que promueva el desarrollo cerebral óptimo del niño mientras fortalece los vínculos familiares. Cada actividad está fundamentada en la investigación neurocientífica y adaptada para ser implementada de manera natural en el hogar, convirtiendo cada momento en una oportunidad de desarrollo y conexión.
            """,
            resumenIntegrador: """
            Las actividades de aplicación en casa de "El cerebro del niño explicado a los padres" transforman el hogar en un laboratorio de desarrollo cerebral. A través de estas experiencias prácticas, los padres pueden aplicar directamente los principios de Álvaro Bilbao en situaciones cotidianas, creando un ambiente que promueva el desarrollo neurocientífico óptimo de sus hijos. Estas actividades no solo fortalecen el desarrollo cerebral del niño, sino que también profundizan la conexión familiar y crean recuerdos significativos que perdurarán toda la vida.
            """,
            progreso: 0.0
        )
    }
    
    static func crearActividades() -> [ActividadCasa] {
        return [
            ActividadCasa(
                titulo: "La Casa del Cerebro: Construcción Familiar",
                descripcion: """
                Esta actividad permite a toda la familia construir físicamente la metáfora de la "casa del cerebro" desarrollada por Álvaro Bilbao. Utilizando materiales cotidianos, la familia crea una representación visual de los tres pisos cerebrales, aprendiendo sobre la arquitectura cerebral mientras fortalece los vínculos familiares. Esta experiencia táctil y colaborativa activa múltiples áreas cerebrales simultáneamente, creando conexiones neuronales duraderas entre el conocimiento teórico y la comprensión práctica. La actividad incluye la construcción de cada piso con materiales específicos que representan las funciones cerebrales, permitiendo una comprensión profunda de cómo se desarrolla el cerebro infantil.
                """,
                objetivoNeurocientifico: "Activar la comprensión multisensorial de la arquitectura cerebral familiar, fortaleciendo las conexiones neuronales entre padres e hijos mientras se aprende sobre el desarrollo cerebral.",
                pasosActividad: [
                    "Reunir materiales: cartón, marcadores, imágenes de órganos, emociones y pensamientos",
                    "Construir el piso 1 (cerebro reptiliano): pegar imágenes de corazón, pulmones y reflejos",
                    "Construir el piso 2 (sistema límbico): dibujar y pegar caras emocionales",
                    "Construir el piso 3 (corteza prefrontal): crear símbolos de pensamiento y planificación",
                    "Practicar la 'navegación por pisos' con situaciones reales de la familia",
                    "Reflexionar sobre cómo cada piso se activa en diferentes momentos del día",
                    "Crear un plan familiar para 'conectar y redirigir' usando la casa"
                ],
                edadRecomendada: "Familias con niños de 3-12 años",
                duracionEstimada: "60-90 minutos",
                materialesNecesarios: ["Cartón o caja grande", "Marcadores de colores", "Imágenes de órganos", "Caras emocionales", "Símbolos de pensamiento", "Cinta adhesiva", "Tijeras"],
                variaciones: [
                    "Para familias con bebés: enfocarse en el desarrollo del piso 1 y 2",
                    "Para familias con preescolares: simular situaciones de rabietas",
                    "Para familias con escolares: practicar la integración de los tres pisos",
                    "Versión digital: usar aplicaciones de realidad aumentada",
                    "Versión portátil: crear una versión pequeña para viajes"
                ],
                resultadosEsperados: "Comprensión familiar profunda de la arquitectura cerebral, mejora en la capacidad de 'conectar y redirigir' como familia, y desarrollo de estrategias familiares de crianza basadas en neurociencia.",
                baseCientifica: "Arquitectura cerebral jerárquica, desarrollo cortical, integración hemisférica, neuroplasticidad, teoría del apego",
                icono: "house.fill",
                color: "blue",
                nivelDificultad: .basico,
                categoria: .desarrollo,
                rangoEdad: .familia
            ),
            
            ActividadCasa(
                titulo: "El Termómetro Emocional Familiar",
                descripcion: """
                Esta actividad transforma el hogar en un laboratorio de emociones donde toda la familia aprende a identificar, validar y regular emociones a través de un "termómetro emocional" personalizado. Los participantes practican la técnica de "nombrar para domar" desarrollada por Álvaro Bilbao, creando un ambiente de comprensión emocional mutua. La actividad incluye la creación de herramientas visuales para el reconocimiento emocional, la práctica de técnicas de respiración familiar y el desarrollo de estrategias de regulación emocional que toda la familia puede usar. Esta experiencia fortalece la inteligencia emocional familiar y crea un ambiente de apoyo mutuo.
                """,
                objetivoNeurocientifico: "Desarrollar la inteligencia emocional familiar y las habilidades de regulación emocional colectiva, creando un ambiente de calma y comprensión que promueva el desarrollo emocional saludable de todos los miembros de la familia.",
                pasosActividad: [
                    "Crear un espacio seguro y tranquilo para la actividad familiar",
                    "Construir un 'termómetro emocional' familiar con colores y números",
                    "Practicar la identificación de emociones básicas en familia",
                    "Simular situaciones emocionales reales y practicar la validación mutua",
                    "Aprender y practicar técnicas de respiración familiar",
                    "Crear un 'kit de calma' familiar con herramientas de regulación",
                    "Reflexionar sobre las emociones familiares y cómo manejarlas juntos"
                ],
                edadRecomendada: "Familias con niños de 4-12 años",
                duracionEstimada: "75-90 minutos",
                materialesNecesarios: ["Cartulina de colores", "Marcadores", "Pelotas antiestrés", "Música relajante", "Aromas calmantes", "Espejos pequeños", "Diario familiar"],
                variaciones: [
                    "Para familias con niños pequeños: enfocarse en emociones básicas (alegría, tristeza, enojo, miedo)",
                    "Para familias con preescolares: incluir emociones más complejas (frustración, orgullo, celos)",
                    "Para familias con escolares: trabajar con emociones sociales (empatía, compasión, gratitud)",
                    "Versión diaria: crear rutinas emocionales familiares",
                    "Versión digital: usar aplicaciones de mindfulness familiar"
                ],
                resultadosEsperados: "Mejora significativa en la inteligencia emocional familiar, desarrollo de estrategias efectivas de regulación emocional colectiva, y creación de un ambiente familiar más calmado y comprensivo.",
                baseCientifica: "Inteligencia emocional, regulación emocional, sistema límbico, corteza prefrontal, neuroplasticidad emocional, teoría del apego",
                icono: "heart.fill",
                color: "red",
                nivelDificultad: .intermedio,
                categoria: .emociones,
                rangoEdad: .familia
            ),
            
            ActividadCasa(
                titulo: "El Laboratorio de Juego Neurocientífico",
                descripcion: """
                Esta actividad permite a los padres experimentar directamente cómo el juego activa y fortalece las conexiones neuronales de sus hijos. Los participantes juegan diferentes tipos de juegos mientras aprenden sobre el proceso de formación de conexiones neuronales y el desarrollo cerebral. La actividad incluye juegos de diferentes categorías: sensoriales, motores, cognitivos, sociales y emocionales, mostrando cómo cada tipo de juego activa áreas cerebrales específicas. Los padres aprenden a diseñar experiencias de juego que maximicen el desarrollo cerebral de sus hijos mientras se divierten juntos.
                """,
                objetivoNeurocientifico: "Demostrar empíricamente cómo el juego activa la neuroplasticidad y desarrollar habilidades para diseñar experiencias de juego que maximicen el desarrollo cerebral infantil en el hogar.",
                pasosActividad: [
                    "Preparar diferentes tipos de juegos y actividades en casa",
                    "Jugar juegos sensoriales y observar la activación cerebral",
                    "Practicar juegos motores y su impacto en el cerebelo",
                    "Experimentar con juegos cognitivos y la activación prefrontal",
                    "Participar en juegos sociales y observar la activación del sistema de apego",
                    "Diseñar juegos personalizados basados en los principios aprendidos",
                    "Crear un plan de juego familiar para el desarrollo cerebral"
                ],
                edadRecomendada: "Familias con niños de 2-10 años",
                duracionEstimada: "90-120 minutos",
                materialesNecesarios: ["Juguetes sensoriales", "Materiales de arte", "Juegos de mesa", "Cronómetro", "Diario de observación", "Música", "Materiales de construcción"],
                variaciones: [
                    "Para familias con bebés: enfocarse en juegos sensoriales y motores básicos",
                    "Para familias con preescolares: incluir juegos simbólicos y de roles",
                    "Para familias con escolares: incorporar juegos de estrategia y cooperación",
                    "Versión digital: usar aplicaciones de juego educativo",
                    "Versión al aire libre: adaptar juegos para el patio o parque"
                ],
                resultadosEsperados: "Comprensión profunda del poder neuroplástico del juego, desarrollo de habilidades para diseñar experiencias de juego efectivas, y creación de un ambiente lúdico familiar que promueva el desarrollo cerebral óptimo.",
                baseCientifica: "Neuroplasticidad, desarrollo sensorial, integración cerebral, sistema de recompensa, desarrollo social, teoría del juego",
                icono: "gamecontroller.fill",
                color: "yellow",
                nivelDificultad: .intermedio,
                categoria: .juego,
                rangoEdad: .preescolares
            ),
            
            ActividadCasa(
                titulo: "La Zona de Seguridad Familiar",
                descripcion: """
                Esta actividad permite a los padres crear un ambiente protector en el hogar que prevenga el estrés tóxico y promueva el desarrollo cerebral saludable. Los participantes aprenden a identificar y eliminar fuentes de estrés tóxico mientras crean "zonas de seguridad" físicas y emocionales en el hogar. La actividad incluye la evaluación del ambiente familiar, la creación de espacios seguros y de apoyo, y el desarrollo de estrategias para proteger a todos los miembros de la familia del estrés tóxico. Esta experiencia empática permite a los padres comprender la importancia crítica de crear un ambiente seguro y de apoyo.
                """,
                objetivoNeurocientifico: "Desarrollar una comprensión profunda del impacto del estrés tóxico en el desarrollo cerebral y crear estrategias efectivas para proteger y apoyar a todos los miembros de la familia en el hogar.",
                pasosActividad: [
                    "Evaluar el ambiente familiar actual para identificar fuentes de estrés",
                    "Crear 'zonas de seguridad' físicas en diferentes áreas del hogar",
                    "Desarrollar estrategias de protección emocional para la familia",
                    "Practicar técnicas de regulación del estrés familiar",
                    "Crear rutinas familiares que promuevan la calma y la seguridad",
                    "Desarrollar estrategias de detección temprana de señales de estrés",
                    "Implementar un plan de protección familiar contra el estrés tóxico"
                ],
                edadRecomendada: "Familias con niños de todas las edades",
                duracionEstimada: "90-120 minutos",
                materialesNecesarios: ["Espacio tranquilo", "Música relajante", "Técnicas de respiración", "Materiales para crear zonas seguras", "Diario de reflexión familiar", "Aromas calmantes"],
                variaciones: [
                    "Para familias con bebés: enfocarse en la protección del estrés prenatal y postnatal",
                    "Para familias con preescolares: trabajar con el estrés de la separación",
                    "Para familias con escolares: manejar el estrés académico y social",
                    "Versión comunitaria: trabajar con otros padres para crear redes de apoyo",
                    "Versión digital: usar tecnología para monitorear el bienestar familiar"
                ],
                resultadosEsperados: "Comprensión profunda del impacto del estrés tóxico, desarrollo de habilidades de protección y regulación familiar, y creación de un ambiente hogareño seguro y de apoyo para todos los miembros de la familia.",
                baseCientifica: "Estrés tóxico, cortisol, desarrollo cerebral alterado, resiliencia, regulación del estrés, teoría del apego",
                icono: "shield.fill",
                color: "green",
                nivelDificultad: .avanzado,
                categoria: .desarrollo,
                rangoEdad: .familia
            ),
            
            ActividadCasa(
                titulo: "La Integración Cerebral Familiar",
                descripcion: """
                Esta actividad permite a toda la familia experimentar directamente la integración cerebral y aprender a promoverla en el hogar. Los participantes practican ejercicios que activan y conectan diferentes áreas cerebrales, experimentando la coherencia neural y la integración hemisférica en familia. La actividad incluye técnicas de mindfulness familiar, ejercicios de respiración colectiva, y actividades que promueven la integración entre el hemisferio izquierdo y derecho de todos los miembros de la familia. Los padres aprenden a crear experiencias que fomenten la integración cerebral en sus hijos mientras fortalecen los vínculos familiares.
                """,
                objetivoNeurocientifico: "Desarrollar la capacidad de promover la integración cerebral familiar en el hogar a través de experiencias que conecten diferentes áreas cerebrales y fomenten la coherencia neural colectiva.",
                pasosActividad: [
                    "Preparar un ambiente tranquilo y sin distracciones en casa",
                    "Practicar ejercicios de respiración para la coherencia neural familiar",
                    "Realizar actividades que conecten ambos hemisferios cerebrales en familia",
                    "Experimentar con técnicas de mindfulness familiar",
                    "Practicar ejercicios de integración sensorial colectiva",
                    "Desarrollar rutinas familiares que promuevan la integración cerebral",
                    "Crear un plan familiar de integración cerebral para el hogar"
                ],
                edadRecomendada: "Familias con niños de 5-15 años",
                duracionEstimada: "90-120 minutos",
                materialesNecesarios: ["Espacio tranquilo", "Música binaural", "Técnicas de respiración", "Materiales sensoriales", "Diario de práctica familiar", "Cronómetro"],
                variaciones: [
                    "Para familias con preescolares: enfocarse en la integración sensorial básica",
                    "Para familias con escolares: trabajar con la integración cognitiva y emocional",
                    "Para familias con adolescentes: promover la integración social y emocional",
                    "Versión diaria: crear rutinas de integración cerebral para el día a día",
                    "Versión digital: usar aplicaciones de mindfulness familiar"
                ],
                resultadosEsperados: "Desarrollo de habilidades para promover la integración cerebral familiar, creación de rutinas hogareñas que fomenten la coherencia neural, y mejora en la capacidad de criar hijos con desarrollo cerebral equilibrado en el hogar.",
                baseCientifica: "Integración cerebral, coherencia neural, conectividad funcional, desarrollo hemisférico, neuroplasticidad, mindfulness",
                icono: "brain.head.profile",
                color: "purple",
                nivelDificultad: .avanzado,
                categoria: .desarrollo,
                rangoEdad: .escolares
            ),
            
            ActividadCasa(
                titulo: "El Apego Seguro en el Hogar",
                descripcion: """
                Esta actividad permite a los padres fomentar el apego seguro en el hogar a través de interacciones cotidianas que promueven la conexión emocional y el desarrollo saludable. Los participantes practican diferentes tipos de interacciones que promueven o dificultan el apego seguro, experimentando directamente el impacto emocional y neurobiológico en el ambiente familiar. La actividad incluye la práctica de técnicas de conexión, validación emocional, y reparación de rupturas en la relación familiar. Los padres aprenden a crear un vínculo seguro y de apoyo que promueva el desarrollo emocional saludable de sus hijos en el hogar.
                """,
                objetivoNeurocientifico: "Desarrollar habilidades para fomentar el apego seguro en el hogar y crear relaciones familiares de apoyo que promuevan el desarrollo emocional y social saludable de todos los miembros de la familia.",
                pasosActividad: [
                    "Crear un ambiente seguro y de apoyo en el hogar",
                    "Practicar técnicas de conexión emocional familiar",
                    "Experimentar con diferentes estilos de interacción en familia",
                    "Aprender sobre la importancia de la consistencia en el apego familiar",
                    "Practicar la reparación de rupturas en las relaciones familiares",
                    "Desarrollar estrategias para mantener el apego seguro en el hogar",
                    "Crear un plan familiar de fortalecimiento del vínculo"
                ],
                edadRecomendada: "Familias con niños de todas las edades",
                duracionEstimada: "75-90 minutos",
                materialesNecesarios: ["Espacio privado y tranquilo", "Materiales para actividades de conexión", "Técnicas de comunicación", "Diario de reflexión familiar", "Música relajante"],
                variaciones: [
                    "Para familias con bebés: enfocarse en el apego temprano y la respuesta a las necesidades",
                    "Para familias con preescolares: trabajar con el apego durante la exploración",
                    "Para familias con escolares: mantener el apego durante la independencia",
                    "Versión terapéutica: trabajar con reparación de apego inseguro",
                    "Versión diaria: crear rutinas de conexión familiar"
                ],
                resultadosEsperados: "Desarrollo de habilidades para fomentar el apego seguro en el hogar, mejora en la calidad de las relaciones familiares, y creación de un ambiente familiar de apoyo que promueva el desarrollo emocional saludable de todos los miembros.",
                baseCientifica: "Apego seguro, oxitocina, desarrollo emocional, regulación del estrés, desarrollo social, teoría del apego",
                icono: "person.2.fill",
                color: "green",
                nivelDificultad: .intermedio,
                categoria: .conexion,
                rangoEdad: .familia
            ),
            
            ActividadCasa(
                titulo: "El Lenguaje como Software Cerebral Familiar",
                descripcion: """
                Esta actividad permite a los padres usar el lenguaje como herramienta de desarrollo cerebral en el hogar, creando un ambiente lingüístico rico que promueva el desarrollo cognitivo y emocional de toda la familia. Los participantes practican diferentes tipos de comunicación y observan su impacto en la activación cerebral familiar. La actividad incluye la práctica de técnicas de comunicación efectiva, el desarrollo del vocabulario emocional familiar, y el uso del lenguaje para promover el desarrollo cognitivo de todos los miembros de la familia. Los padres aprenden a crear un ambiente lingüístico rico que promueva el desarrollo cerebral óptimo de sus hijos en el hogar.
                """,
                objetivoNeurocientifico: "Desarrollar habilidades para usar el lenguaje como herramienta de desarrollo cerebral familiar, creando un ambiente lingüístico rico en el hogar que promueva el desarrollo cognitivo y emocional de todos los miembros de la familia.",
                pasosActividad: [
                    "Analizar el estilo de comunicación familiar actual",
                    "Practicar técnicas de comunicación efectiva en familia",
                    "Desarrollar vocabulario emocional rico para toda la familia",
                    "Aprender a usar el lenguaje para promover el pensamiento familiar",
                    "Practicar técnicas de narración y storytelling familiar",
                    "Crear un plan de desarrollo del lenguaje familiar",
                    "Reflexionar sobre el impacto del lenguaje en el desarrollo familiar"
                ],
                edadRecomendada: "Familias con niños de 0-12 años",
                duracionEstimada: "60-75 minutos",
                materialesNecesarios: ["Libros y materiales de lectura", "Técnicas de comunicación", "Vocabulario emocional", "Diario de práctica familiar", "Materiales de escritura"],
                variaciones: [
                    "Para familias con bebés: enfocarse en el desarrollo del lenguaje temprano",
                    "Para familias con preescolares: trabajar con el desarrollo del vocabulario",
                    "Para familias con escolares: promover el pensamiento crítico a través del lenguaje",
                    "Versión multilingüe: trabajar con el desarrollo en múltiples idiomas",
                    "Versión digital: usar tecnología para enriquecer el ambiente lingüístico familiar"
                ],
                resultadosEsperados: "Desarrollo de habilidades de comunicación efectiva familiar, creación de un ambiente lingüístico rico en el hogar, y promoción del desarrollo cognitivo y emocional de toda la familia a través del lenguaje.",
                baseCientifica: "Desarrollo del lenguaje, neuroplasticidad, procesamiento del lenguaje, desarrollo cognitivo, inteligencia emocional, comunicación familiar",
                icono: "book.fill",
                color: "blue",
                nivelDificultad: .intermedio,
                categoria: .aprendizaje,
                rangoEdad: .bebes
            ),
            
            ActividadCasa(
                titulo: "Las Rutinas Neurocientíficas Familiares",
                descripcion: """
                Esta actividad permite a los padres crear rutinas familiares basadas en neurociencia que promuevan el desarrollo cerebral óptimo de sus hijos mientras fortalecen los vínculos familiares. Los participantes aprenden a diseñar rutinas que integren los principios de Álvaro Bilbao en la vida diaria familiar, creando un ambiente que promueva el desarrollo cerebral saludable. La actividad incluye la creación de rutinas matutinas, vespertinas y de fin de semana que incorporen elementos de desarrollo cerebral, regulación emocional y conexión familiar. Los padres aprenden a adaptar estas rutinas a las necesidades específicas de su familia.
                """,
                objetivoNeurocientifico: "Desarrollar rutinas familiares basadas en neurociencia que promuevan el desarrollo cerebral óptimo de los hijos mientras fortalecen los vínculos familiares y crean un ambiente de apoyo y crecimiento en el hogar.",
                pasosActividad: [
                    "Evaluar las rutinas familiares actuales",
                    "Aprender sobre los principios neurocientíficos de las rutinas efectivas",
                    "Diseñar rutinas matutinas que promuevan el desarrollo cerebral",
                    "Crear rutinas vespertinas que fomenten la regulación emocional",
                    "Desarrollar rutinas de fin de semana que fortalezcan la conexión familiar",
                    "Adaptar las rutinas a las necesidades específicas de la familia",
                    "Implementar y ajustar las rutinas neurocientíficas familiares"
                ],
                edadRecomendada: "Familias con niños de todas las edades",
                duracionEstimada: "120-150 minutos",
                materialesNecesarios: ["Diario de rutinas familiares", "Cronómetro", "Materiales de planificación", "Técnicas de comunicación", "Materiales de seguimiento"],
                variaciones: [
                    "Para familias con bebés: enfocarse en rutinas de alimentación y sueño",
                    "Para familias con preescolares: incluir rutinas de juego y aprendizaje",
                    "Para familias con escolares: incorporar rutinas académicas y sociales",
                    "Versión digital: usar aplicaciones para gestionar rutinas familiares",
                    "Versión estacional: adaptar rutinas a diferentes épocas del año"
                ],
                resultadosEsperados: "Desarrollo de rutinas familiares basadas en neurociencia, mejora en el desarrollo cerebral de los hijos, fortalecimiento de los vínculos familiares, y creación de un ambiente hogareño que promueva el crecimiento y desarrollo óptimo de todos los miembros de la familia.",
                baseCientifica: "Rutinas neurocientíficas, desarrollo cerebral, regulación emocional, conexión familiar, neuroplasticidad, teoría del apego",
                icono: "clock.fill",
                color: "orange",
                nivelDificultad: .avanzado,
                categoria: .rutinas,
                rangoEdad: .familia
            )
        ]
    }
}
