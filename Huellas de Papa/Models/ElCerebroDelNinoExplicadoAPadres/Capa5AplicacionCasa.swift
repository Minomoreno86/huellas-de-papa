import Foundation
import SwiftUI

// MARK: - Capa 5: Aplicación en Casa
// Transforma el conocimiento neurocientífico en rutinas diarias, actividades familiares y hábitos medibles
// Basado en "El cerebro del niño explicado a los padres" de Álvaro Bilbao

// MARK: - Modelo Principal de Capa 5
struct Capa5AplicacionCasa: Identifiable, Codable {
    let id: UUID
    let titulo: String
    let descripcion: String
    let introduccion: String
    let rutinas: [Capa5Routine]
    let habitos: [Capa5Habit]
    let desafios: [Capa5Challenge]
    let progreso: Capa5Progress
    
    init() {
        self.id = UUID()
        self.titulo = "Aplicación en Casa"
        self.descripcion = "Transforma tu hogar en un laboratorio de desarrollo cerebral"
        self.introduccion = "La aplicación en casa representa la transformación práctica de todos los conocimientos neurocientíficos en experiencias cotidianas y significativas."
        self.rutinas = Capa5AplicacionCasa.crearRutinasEjemplo()
        self.habitos = Capa5AplicacionCasa.crearHabitosEjemplo()
        self.desafios = Capa5AplicacionCasa.crearDesafiosEjemplo()
        self.progreso = Capa5Progress()
    }
    
    // MARK: - Datos de Ejemplo para Rutinas (Basadas en Álvaro Bilbao)
    static func crearRutinasEjemplo() -> [Capa5Routine] {
        return [
            // 1. Juego en Familia (Principio de Bilbao: Aprendizaje a través del juego)
            Capa5Routine(
                titulo: "Juego en Familia",
                descripcion: "Dedicar tiempo diario a jugar juntos, eligiendo actividades que todos disfruten. El cerebro del niño está diseñado para aprender a través del juego.",
                proposito: "Fomentar el aprendizaje natural a través del juego, activando la neuroplasticidad y fortaleciendo las conexiones neuronales en un entorno lúdico y afectivo.",
                pasos: [
                    "Elige un momento del día sin distracciones",
                    "Selecciona un juego que todos disfruten",
                    "Permite que el niño dirija la actividad",
                    "Observa y participa sin imponer reglas rígidas",
                    "Celebra los momentos de conexión y aprendizaje"
                ],
                frecuencia: .diaria,
                duracion: "20-30 minutos",
                vinculoPrincipios: ["Neuroplasticidad", "Aprendizaje Natural", "Conexión Emocional"],
                vinculoHerramientas: ["Juego Libre", "Observación Activa", "Participación Consciente"],
                icono: "gamecontroller.fill",
                color: "green",
                categoria: .matutina,
                edadRecomendada: .preescolares
            ),
            
            // 2. Lectura Compartida (Principio de Bilbao: Estimulación del lenguaje y vínculo afectivo)
            Capa5Routine(
                titulo: "Lectura Compartida",
                descripcion: "Leer un cuento o libro en voz alta cada noche antes de dormir, estimulando el desarrollo intelectual y emocional.",
                proposito: "Estimular el desarrollo del lenguaje, la imaginación y fortalecer el vínculo afectivo a través de la lectura compartida, activando las áreas del cerebro relacionadas con el lenguaje y la empatía.",
                pasos: [
                    "Elige un momento tranquilo antes de dormir",
                    "Selecciona un libro apropiado para la edad",
                    "Lee en voz alta con expresión y entusiasmo",
                    "Haz pausas para preguntar sobre la historia",
                    "Permite que el niño participe en la elección del libro"
                ],
                frecuencia: .diaria,
                duracion: "15-20 minutos",
                vinculoPrincipios: ["Desarrollo del Lenguaje", "Vínculo Afectivo", "Imaginación"],
                vinculoHerramientas: ["Lectura en Voz Alta", "Preguntas Abiertas", "Participación Activa"],
                icono: "book.fill",
                color: "blue",
                categoria: .vespertina,
                edadRecomendada: .preescolares
            ),
            
            // 3. Expresión Emocional (Principio de Bilbao: Desarrollo de la inteligencia emocional)
            Capa5Routine(
                titulo: "Expresión Emocional",
                descripcion: "Crear un espacio seguro donde cada miembro de la familia pueda compartir cómo se siente y por qué.",
                proposito: "Desarrollar la inteligencia emocional y la empatía, permitiendo que los niños aprendan a identificar y expresar sus emociones de manera saludable.",
                pasos: [
                    "Crea un momento diario para compartir emociones",
                    "Cada miembro expresa cómo se siente con una palabra",
                    "Escucha sin juzgar las emociones expresadas",
                    "Valida las emociones con frases como 'Entiendo que te sientas...'",
                    "Ayuda a encontrar estrategias para regular emociones intensas"
                ],
                frecuencia: .diaria,
                duracion: "10-15 minutos",
                vinculoPrincipios: ["Inteligencia Emocional", "Empatía", "Regulación Emocional"],
                vinculoHerramientas: ["Escucha Activa", "Validación Emocional", "Expresión Emocional"],
                icono: "heart.fill",
                color: "red",
                categoria: .emocional,
                edadRecomendada: .familia
            ),
            
            // 4. Tiempo al Aire Libre (Principio de Bilbao: Desarrollo físico y cognitivo)
            Capa5Routine(
                titulo: "Tiempo al Aire Libre",
                descripcion: "Realizar actividades físicas al aire libre, como paseos en bicicleta, caminatas o juegos en el parque.",
                proposito: "Promover el desarrollo físico y cognitivo, ya que el ejercicio físico juega un papel vital en el desarrollo del cerebro y la neuroplasticidad.",
                pasos: [
                    "Planifica una actividad al aire libre diaria",
                    "Elige actividades que involucren movimiento físico",
                    "Permite que el niño explore y descubra",
                    "Observa la naturaleza y comenta lo que ven",
                    "Disfruta del tiempo juntos sin distracciones"
                ],
                frecuencia: .diaria,
                duracion: "30-45 minutos",
                vinculoPrincipios: ["Desarrollo Físico", "Neuroplasticidad", "Exploración"],
                vinculoHerramientas: ["Actividad Física", "Observación", "Exploración Natural"],
                icono: "figure.walk",
                color: "green",
                categoria: .aprendizaje,
                edadRecomendada: .familia
            ),
            
            // 5. Rutina de Sueño Saludable (Principio de Bilbao: Descanso fundamental para el desarrollo cerebral)
            Capa5Routine(
                titulo: "Rutina de Sueño Saludable",
                descripcion: "Establecer y mantener horarios consistentes para acostarse y despertarse, asegurando un descanso adecuado.",
                proposito: "Asegurar un descanso adecuado, fundamental para el desarrollo cerebral y el bienestar emocional, permitiendo la consolidación de aprendizajes y la regeneración neuronal.",
                pasos: [
                    "Establece horarios consistentes para dormir",
                    "Crea una rutina relajante antes de dormir",
                    "Evita pantallas 1 hora antes de dormir",
                    "Lee un cuento o practica respiración juntos",
                    "Mantén el mismo horario los fines de semana"
                ],
                frecuencia: .diaria,
                duracion: "30 minutos (rutina) + 8-10 horas (sueño)",
                vinculoPrincipios: ["Desarrollo Cerebral", "Consolidación de Aprendizajes", "Regeneración Neuronal"],
                vinculoHerramientas: ["Rutina de Sueño", "Respiración Consciente", "Lectura"],
                icono: "moon.fill",
                color: "blue",
                categoria: .vespertina,
                edadRecomendada: .familia
            ),
            
            // 6. Participación en Decisiones Familiares (Principio de Bilbao: Autonomía y toma de decisiones)
            Capa5Routine(
                titulo: "Participación en Decisiones Familiares",
                descripcion: "Involucrar a los niños en decisiones apropiadas para su edad, como elegir la actividad del fin de semana o planificar una comida.",
                proposito: "Fomentar la autonomía y la toma de decisiones, equilibrando el establecimiento de límites con la libertad de elección, desarrollando la corteza prefrontal y la autorregulación.",
                pasos: [
                    "Identifica decisiones apropiadas para la edad del niño",
                    "Presenta opciones limitadas y claras",
                    "Permite que el niño elija entre las opciones",
                    "Respeta la decisión del niño cuando sea posible",
                    "Reflexiona sobre las consecuencias de las decisiones"
                ],
                frecuencia: .diaria,
                duracion: "5-10 minutos",
                vinculoPrincipios: ["Autonomía", "Toma de Decisiones", "Desarrollo de la Corteza Prefrontal"],
                vinculoHerramientas: ["Opciones Limitadas", "Respeto por las Decisiones", "Reflexión"],
                icono: "checkmark.circle.fill",
                color: "orange",
                categoria: .aprendizaje,
                edadRecomendada: .escolares
            )
        ]
    }
    
    // MARK: - Datos de Ejemplo para Hábitos
    static func crearHabitosEjemplo() -> [Capa5Habit] {
        return [
            // 1. Respiración Consciente
            Capa5Habit(
                titulo: "Respiración Consciente",
                descripcion: "3 respiraciones profundas al despertar y antes de dormir para activar el sistema nervioso parasimpático.",
                objetivo: "Activar el sistema nervioso parasimpático y promover la regulación emocional a través de la respiración consciente.",
                frecuencia: .diario,
                duracion: "2 minutos",
                baseCientifica: "La respiración consciente activa el nervio vago, promueve la liberación de oxitocina y reduce los niveles de cortisol, mejorando la regulación emocional y el bienestar general.",
                icono: "wind",
                color: "mint",
                categoria: .respiracion,
                edadRecomendada: .familia
            ),
            
            // 2. Gratitud Diaria
            Capa5Habit(
                titulo: "Gratitud Diaria",
                descripcion: "Escribe 3 cosas por las que estás agradecido cada día para fortalecer la neuroplasticidad positiva.",
                objetivo: "Desarrollar la neuroplasticidad positiva y fortalecer los vínculos familiares a través de la práctica de gratitud.",
                frecuencia: .diario,
                duracion: "5 minutos",
                baseCientifica: "La gratitud activa el sistema de recompensa del cerebro, libera dopamina y serotonina, y fortalece las conexiones neuronales asociadas con el bienestar y la resiliencia emocional.",
                icono: "heart.circle.fill",
                color: "pink",
                categoria: .gratitud,
                edadRecomendada: .familia
            ),
            
            // 3. Ejercicio Físico
            Capa5Habit(
                titulo: "Ejercicio Físico",
                descripcion: "15 minutos de actividad física diaria para promover la neurogénesis y el desarrollo cerebral óptimo.",
                objetivo: "Promover la neurogénesis, mejorar la función cognitiva y fortalecer el desarrollo cerebral a través del ejercicio físico regular.",
                frecuencia: .diario,
                duracion: "15 minutos",
                baseCientifica: "El ejercicio físico aumenta el BDNF (factor neurotrófico derivado del cerebro), promueve la neurogénesis en el hipocampo, mejora la función cognitiva y fortalece las conexiones neuronales.",
                icono: "figure.walk",
                color: "green",
                categoria: .ejercicio,
                edadRecomendada: .familia
            ),
            
            // 4. Lectura Familiar
            Capa5Habit(
                titulo: "Lectura Familiar",
                descripcion: "20 minutos de lectura en familia para desarrollar el lenguaje, la empatía y las conexiones neuronales.",
                objetivo: "Desarrollar el lenguaje, la empatía y las conexiones neuronales a través de la lectura compartida en familia.",
                frecuencia: .diario,
                duracion: "20 minutos",
                baseCientifica: "La lectura activa múltiples áreas cerebrales, desarrolla el lenguaje, fortalece las conexiones neuronales, promueve la empatía y mejora la función ejecutiva del cerebro.",
                icono: "book.fill",
                color: "blue",
                categoria: .lectura,
                edadRecomendada: .familia
            ),
            
            // 5. Meditación Mindfulness
            Capa5Habit(
                titulo: "Meditación Mindfulness",
                descripcion: "5 minutos de meditación diaria para desarrollar la atención plena y la regulación emocional.",
                objetivo: "Desarrollar la atención plena, la regulación emocional y la integración cerebral a través de la práctica de mindfulness.",
                frecuencia: .diario,
                duracion: "5 minutos",
                baseCientifica: "La meditación mindfulness fortalece la corteza prefrontal, mejora la regulación emocional, reduce la actividad de la amígdala y promueve la integración cerebral y la coherencia neural.",
                icono: "brain.head.profile",
                color: "purple",
                categoria: .meditacion,
                edadRecomendada: .escolares
            ),
            
            // 6. Conexión Familiar
            Capa5Habit(
                titulo: "Conexión Familiar",
                descripcion: "30 minutos de tiempo de calidad sin distracciones para fortalecer el apego seguro y los vínculos familiares.",
                objetivo: "Fortalecer el apego seguro, desarrollar la inteligencia emocional y crear vínculos familiares profundos a través de la conexión auténtica.",
                frecuencia: .diario,
                duracion: "30 minutos",
                baseCientifica: "La conexión familiar activa el sistema de apego, libera oxitocina, fortalece las conexiones neuronales del sistema límbico y promueve el desarrollo emocional saludable y la resiliencia.",
                icono: "person.2.fill",
                color: "orange",
                categoria: .conexion,
                edadRecomendada: .familia
            )
        ]
    }
    
    // MARK: - Datos de Ejemplo para Desafíos (Basados en Álvaro Bilbao)
    static func crearDesafiosEjemplo() -> [Capa5Challenge] {
        return [
            // 1. Semana de Juego en Familia (Principio de Bilbao: Aprendizaje a través del juego)
            Capa5Challenge(
                titulo: "Semana de Juego en Familia",
                descripcion: "Durante una semana completa, dedica tiempo diario a jugar juntos, eligiendo actividades que todos disfruten y que fomenten el aprendizaje natural.",
                objetivo: "Fomentar el aprendizaje natural a través del juego, activando la neuroplasticidad y fortaleciendo las conexiones neuronales en un entorno lúdico y afectivo, tal como recomienda Bilbao.",
                duracion: "1 semana",
                pasos: [
                    "Elige un momento del día sin distracciones",
                    "Selecciona un juego que todos disfruten",
                    "Permite que el niño dirija la actividad",
                    "Observa y participa sin imponer reglas rígidas",
                    "Celebra los momentos de conexión y aprendizaje"
                ],
                criteriosExito: [
                    "Jugar al menos 20 minutos diarios",
                    "Permitir que el niño dirija la actividad",
                    "Completar 7 días consecutivos de juego",
                    "Observar al menos 3 momentos de aprendizaje natural"
                ],
                recompensa: "Medalla de Aprendizaje Natural + 50 puntos",
                icono: "gamecontroller.fill",
                color: "green",
                categoria: .cognitivo,
                edadRecomendada: .preescolares
            ),
            
            // 2. Mes de Lectura Compartida (Principio de Bilbao: Estimulación del lenguaje y vínculo afectivo)
            Capa5Challenge(
                titulo: "Mes de Lectura Compartida",
                descripcion: "Durante un mes completo, lee un cuento o libro en voz alta cada noche antes de dormir, estimulando el desarrollo intelectual y emocional.",
                objetivo: "Estimular el desarrollo del lenguaje, la imaginación y fortalecer el vínculo afectivo a través de la lectura compartida, activando las áreas del cerebro relacionadas con el lenguaje y la empatía, como recomienda Bilbao.",
                duracion: "1 mes",
                pasos: [
                    "Elige un momento tranquilo antes de dormir",
                    "Selecciona un libro apropiado para la edad",
                    "Lee en voz alta con expresión y entusiasmo",
                    "Haz pausas para preguntar sobre la historia",
                    "Permite que el niño participe en la elección del libro"
                ],
                criteriosExito: [
                    "Leer al menos 15 minutos diarios",
                    "Completar 30 días de lectura compartida",
                    "Leer al menos 5 libros diferentes",
                    "Hacer preguntas sobre la historia cada día"
                ],
                recompensa: "Medalla de Desarrollo del Lenguaje + 100 puntos",
                icono: "book.fill",
                color: "blue",
                categoria: .cognitivo,
                edadRecomendada: .preescolares
            ),
            
            // 3. Semana de Expresión Emocional (Principio de Bilbao: Desarrollo de la inteligencia emocional)
            Capa5Challenge(
                titulo: "Semana de Expresión Emocional",
                descripcion: "Durante una semana completa, crea un espacio seguro donde cada miembro de la familia pueda compartir cómo se siente y por qué.",
                objetivo: "Desarrollar la inteligencia emocional y la empatía, permitiendo que los niños aprendan a identificar y expresar sus emociones de manera saludable, tal como recomienda Bilbao.",
                duracion: "1 semana",
                pasos: [
                    "Crea un momento diario para compartir emociones",
                    "Cada miembro expresa cómo se siente con una palabra",
                    "Escucha sin juzgar las emociones expresadas",
                    "Valida las emociones con frases como 'Entiendo que te sientas...'",
                    "Ayuda a encontrar estrategias para regular emociones intensas"
                ],
                criteriosExito: [
                    "Compartir emociones 7 días consecutivos",
                    "Practicar escucha activa en cada conversación",
                    "Validar al menos 3 emociones diferentes por día",
                    "Ayudar a regular emociones intensas al menos 2 veces"
                ],
                recompensa: "Medalla de Inteligencia Emocional + 75 puntos",
                icono: "heart.fill",
                color: "red",
                categoria: .emocional,
                edadRecomendada: .familia
            ),
            
            // 4. Mes de Tiempo al Aire Libre (Principio de Bilbao: Desarrollo físico y cognitivo)
            Capa5Challenge(
                titulo: "Mes de Tiempo al Aire Libre",
                descripcion: "Durante un mes completo, realiza actividades físicas al aire libre, como paseos en bicicleta, caminatas o juegos en el parque.",
                objetivo: "Promover el desarrollo físico y cognitivo, ya que el ejercicio físico juega un papel vital en el desarrollo del cerebro y la neuroplasticidad, tal como recomienda Bilbao.",
                duracion: "1 mes",
                pasos: [
                    "Planifica una actividad al aire libre diaria",
                    "Elige actividades que involucren movimiento físico",
                    "Permite que el niño explore y descubra",
                    "Observa la naturaleza y comenta lo que ven",
                    "Disfruta del tiempo juntos sin distracciones"
                ],
                criteriosExito: [
                    "Completar 30 días de actividad al aire libre",
                    "Realizar al menos 30 minutos diarios",
                    "Explorar al menos 5 entornos diferentes",
                    "Observar y comentar sobre la naturaleza cada día"
                ],
                recompensa: "Medalla de Desarrollo Físico + 100 puntos",
                icono: "figure.walk",
                color: "green",
                categoria: .cognitivo,
                edadRecomendada: .familia
            ),
            
            // 5. Semana de Rutina de Sueño Saludable (Principio de Bilbao: Descanso fundamental para el desarrollo cerebral)
            Capa5Challenge(
                titulo: "Semana de Rutina de Sueño Saludable",
                descripcion: "Durante una semana completa, establece y mantén horarios consistentes para acostarse y despertarse, asegurando un descanso adecuado.",
                objetivo: "Asegurar un descanso adecuado, fundamental para el desarrollo cerebral y el bienestar emocional, permitiendo la consolidación de aprendizajes y la regeneración neuronal, tal como recomienda Bilbao.",
                duracion: "1 semana",
                pasos: [
                    "Establece horarios consistentes para dormir",
                    "Crea una rutina relajante antes de dormir",
                    "Evita pantallas 1 hora antes de dormir",
                    "Lee un cuento o practica respiración juntos",
                    "Mantén el mismo horario los fines de semana"
                ],
                criteriosExito: [
                    "Mantener horarios consistentes 7 días consecutivos",
                    "Completar la rutina de sueño cada noche",
                    "Evitar pantallas 1 hora antes de dormir",
                    "Dormir al menos 8 horas cada noche"
                ],
                recompensa: "Medalla de Descanso Saludable + 75 puntos",
                icono: "moon.fill",
                color: "blue",
                categoria: .cognitivo,
                edadRecomendada: .familia
            ),
            
            // 6. Mes de Participación en Decisiones Familiares (Principio de Bilbao: Autonomía y toma de decisiones)
            Capa5Challenge(
                titulo: "Mes de Participación en Decisiones Familiares",
                descripcion: "Durante un mes completo, involucra a los niños en decisiones apropiadas para su edad, como elegir la actividad del fin de semana o planificar una comida.",
                objetivo: "Fomentar la autonomía y la toma de decisiones, equilibrando el establecimiento de límites con la libertad de elección, desarrollando la corteza prefrontal y la autorregulación, tal como recomienda Bilbao.",
                duracion: "1 mes",
                pasos: [
                    "Identifica decisiones apropiadas para la edad del niño",
                    "Presenta opciones limitadas y claras",
                    "Permite que el niño elija entre las opciones",
                    "Respeta la decisión del niño cuando sea posible",
                    "Reflexiona sobre las consecuencias de las decisiones"
                ],
                criteriosExito: [
                    "Involucrar al niño en decisiones 30 días consecutivos",
                    "Presentar opciones limitadas cada día",
                    "Respetar la decisión del niño al menos 20 veces",
                    "Reflexionar sobre las consecuencias cada semana"
                ],
                recompensa: "Medalla de Autonomía + 100 puntos",
                icono: "checkmark.circle.fill",
                color: "orange",
                categoria: .cognitivo,
                edadRecomendada: .escolares
            )
        ]
    }
}

// MARK: - Rutinas Familiares
/// Rutinas diarias basadas en neurociencia que promueven el desarrollo cerebral
struct Capa5Routine: Identifiable, Codable {
    let id: UUID
    let titulo: String
    let descripcion: String
    let proposito: String // Objetivo neurocientífico específico
    let pasos: [String] // 5-7 pasos detallados
    let frecuencia: FrecuenciaRutina
    let duracion: String // Duración estimada
    let vinculoPrincipios: [String] // Principios de capas anteriores que aplica
    let vinculoHerramientas: [String] // Herramientas de capas anteriores que usa
    let icono: String
    let color: String
    let categoria: CategoriaRutina
    let edadRecomendada: RangoEdad
    let completada: Bool
    let fechaCreacion: Date
    let ultimaEjecucion: Date?
    
    init(titulo: String, descripcion: String, proposito: String, pasos: [String], frecuencia: FrecuenciaRutina, duracion: String, vinculoPrincipios: [String], vinculoHerramientas: [String], icono: String, color: String, categoria: CategoriaRutina, edadRecomendada: RangoEdad) {
        self.id = UUID()
        self.titulo = titulo
        self.descripcion = descripcion
        self.proposito = proposito
        self.pasos = pasos
        self.frecuencia = frecuencia
        self.duracion = duracion
        self.vinculoPrincipios = vinculoPrincipios
        self.vinculoHerramientas = vinculoHerramientas
        self.icono = icono
        self.color = color
        self.categoria = categoria
        self.edadRecomendada = edadRecomendada
        self.completada = false
        self.fechaCreacion = Date()
        self.ultimaEjecucion = nil
    }
}

// MARK: - Hábitos Medibles
/// Hábitos diarios con seguimiento de progreso y streaks
struct Capa5Habit: Identifiable, Codable {
    let id: UUID
    let titulo: String
    let descripcion: String
    let objetivo: String // Objetivo neurocientífico
    let frecuencia: FrecuenciaHabito
    let duracion: String
    let baseCientifica: String // Fundamentos neurocientíficos
    let icono: String
    let color: String
    let categoria: CategoriaHabito
    let edadRecomendada: RangoEdad
    let activo: Bool
    let streak: Int // Racha actual
    let streakMaximo: Int // Racha máxima alcanzada
    let fechaInicio: Date
    let ultimaEjecucion: Date?
    let totalEjecuciones: Int
    
    init(titulo: String, descripcion: String, objetivo: String, frecuencia: FrecuenciaHabito, duracion: String, baseCientifica: String, icono: String, color: String, categoria: CategoriaHabito, edadRecomendada: RangoEdad) {
        self.id = UUID()
        self.titulo = titulo
        self.descripcion = descripcion
        self.objetivo = objetivo
        self.frecuencia = frecuencia
        self.duracion = duracion
        self.baseCientifica = baseCientifica
        self.icono = icono
        self.color = color
        self.categoria = categoria
        self.edadRecomendada = edadRecomendada
        self.activo = true
        self.streak = 0
        self.streakMaximo = 0
        self.fechaInicio = Date()
        self.ultimaEjecucion = nil
        self.totalEjecuciones = 0
    }
}

// MARK: - Desafíos Familiares
/// Retos semanales o mensuales para aplicar conocimientos
struct Capa5Challenge: Identifiable, Codable {
    let id: UUID
    let titulo: String
    let descripcion: String
    let objetivo: String
    let duracion: String // "1 semana", "1 mes", etc.
    let pasos: [String]
    let criteriosExito: [String]
    let recompensa: String // Recompensa por completar
    let icono: String
    let color: String
    let categoria: CategoriaDesafio
    let edadRecomendada: RangoEdad
    let activo: Bool
    let completado: Bool
    let fechaInicio: Date?
    let fechaFin: Date?
    let progreso: Double // 0.0 a 1.0
    
    init(titulo: String, descripcion: String, objetivo: String, duracion: String, pasos: [String], criteriosExito: [String], recompensa: String, icono: String, color: String, categoria: CategoriaDesafio, edadRecomendada: RangoEdad) {
        self.id = UUID()
        self.titulo = titulo
        self.descripcion = descripcion
        self.objetivo = objetivo
        self.duracion = duracion
        self.pasos = pasos
        self.criteriosExito = criteriosExito
        self.recompensa = recompensa
        self.icono = icono
        self.color = color
        self.categoria = categoria
        self.edadRecomendada = edadRecomendada
        self.activo = false
        self.completado = false
        self.fechaInicio = nil
        self.fechaFin = nil
        self.progreso = 0.0
    }
}

// MARK: - Reflexiones Diarias
/// Registro de aprendizajes y sensaciones del día
struct Capa5Reflection: Identifiable, Codable {
    let id: UUID
    let fecha: Date
    let titulo: String
    let contenido: String
    let emociones: [EmocionReflexion]
    let aprendizajes: [String]
    let gratitud: [String] // 3 cosas por las que estar agradecido
    let vinculoRutina: UUID? // ID de rutina relacionada
    let vinculoHabito: UUID? // ID de hábito relacionado
    let vinculoDesafio: UUID? // ID de desafío relacionado
    
    init(titulo: String, contenido: String, emociones: [EmocionReflexion], aprendizajes: [String], gratitud: [String], vinculoRutina: UUID? = nil, vinculoHabito: UUID? = nil, vinculoDesafio: UUID? = nil) {
        self.id = UUID()
        self.fecha = Date()
        self.titulo = titulo
        self.contenido = contenido
        self.emociones = emociones
        self.aprendizajes = aprendizajes
        self.gratitud = gratitud
        self.vinculoRutina = vinculoRutina
        self.vinculoHabito = vinculoHabito
        self.vinculoDesafio = vinculoDesafio
    }
}

// MARK: - Progreso General
/// Seguimiento del progreso familiar y recompensas
struct Capa5Progress: Codable {
    let rutinasCompletadas: Int
    let habitosActivos: Int
    let desafiosCompletados: Int
    let reflexionesEscritas: Int
    let streakGeneral: Int // Racha general de la familia
    let puntos: Int // Sistema de puntos
    let nivel: Int // Nivel de progreso
    let medallas: [String] // Medallas obtenidas
    let fechaInicio: Date
    let ultimaActividad: Date?
    
    init() {
        self.rutinasCompletadas = 0
        self.habitosActivos = 0
        self.desafiosCompletados = 0
        self.reflexionesEscritas = 0
        self.streakGeneral = 0
        self.puntos = 0
        self.nivel = 1
        self.medallas = []
        self.fechaInicio = Date()
        self.ultimaActividad = nil
    }
}

// MARK: - Enums de Clasificación

enum FrecuenciaRutina: String, CaseIterable, Codable {
    case diaria = "Diaria"
    case semanal = "Semanal"
    case mensual = "Mensual"
    case personalizada = "Personalizada"
    
    var icono: String {
        switch self {
        case .diaria: return "sun.max.fill"
        case .semanal: return "calendar"
        case .mensual: return "calendar.badge.clock"
        case .personalizada: return "slider.horizontal.3"
        }
    }
    
    var color: String {
        switch self {
        case .diaria: return "orange"
        case .semanal: return "blue"
        case .mensual: return "purple"
        case .personalizada: return "gray"
        }
    }
}

enum FrecuenciaHabito: String, CaseIterable, Codable {
    case diario = "Diario"
    case semanal = "Semanal"
    case mensual = "Mensual"
    
    var icono: String {
        switch self {
        case .diario: return "repeat"
        case .semanal: return "calendar"
        case .mensual: return "calendar.badge.clock"
        }
    }
}

enum CategoriaRutina: String, CaseIterable, Codable {
    case matutina = "Rutina Matutina"
    case vespertina = "Rutina Vespertina"
    case conexion = "Conexión Familiar"
    case emocional = "Regulación Emocional"
    case aprendizaje = "Aprendizaje Activo"
    case juego = "Juego Educativo"
    
    var icono: String {
        switch self {
        case .matutina: return "sunrise.fill"
        case .vespertina: return "moon.fill"
        case .conexion: return "person.2.fill"
        case .emocional: return "heart.fill"
        case .aprendizaje: return "brain.head.profile"
        case .juego: return "gamecontroller.fill"
        }
    }
    
    var color: String {
        switch self {
        case .matutina: return "orange"
        case .vespertina: return "blue"
        case .conexion: return "green"
        case .emocional: return "red"
        case .aprendizaje: return "purple"
        case .juego: return "yellow"
        }
    }
}

enum CategoriaHabito: String, CaseIterable, Codable {
    case respiracion = "Respiración Consciente"
    case gratitud = "Gratitud"
    case ejercicio = "Ejercicio Físico"
    case lectura = "Lectura"
    case meditacion = "Meditación"
    case conexion = "Conexión Familiar"
    
    var icono: String {
        switch self {
        case .respiracion: return "wind"
        case .gratitud: return "heart.circle.fill"
        case .ejercicio: return "figure.walk"
        case .lectura: return "book.fill"
        case .meditacion: return "brain.head.profile"
        case .conexion: return "person.2.fill"
        }
    }
    
    var color: String {
        switch self {
        case .respiracion: return "mint"
        case .gratitud: return "pink"
        case .ejercicio: return "green"
        case .lectura: return "blue"
        case .meditacion: return "purple"
        case .conexion: return "orange"
        }
    }
}

enum CategoriaDesafio: String, CaseIterable, Codable {
    case emocional = "Desarrollo Emocional"
    case social = "Habilidades Sociales"
    case cognitivo = "Desarrollo Cognitivo"
    case fisico = "Desarrollo Físico"
    case familiar = "Conexión Familiar"
    case creativo = "Creatividad"
    
    var icono: String {
        switch self {
        case .emocional: return "heart.fill"
        case .social: return "person.2.fill"
        case .cognitivo: return "brain.head.profile"
        case .fisico: return "figure.walk"
        case .familiar: return "house.fill"
        case .creativo: return "paintbrush.fill"
        }
    }
    
    var color: String {
        switch self {
        case .emocional: return "red"
        case .social: return "blue"
        case .cognitivo: return "purple"
        case .fisico: return "green"
        case .familiar: return "orange"
        case .creativo: return "yellow"
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

enum EmocionReflexion: String, CaseIterable, Codable {
    case alegria = "Alegría"
    case tristeza = "Tristeza"
    case enojo = "Enojo"
    case miedo = "Miedo"
    case calma = "Calma"
    case gratitud = "Gratitud"
    case amor = "Amor"
    case frustracion = "Frustración"
    case orgullo = "Orgullo"
    case esperanza = "Esperanza"
    
    var icono: String {
        switch self {
        case .alegria: return "face.smiling"
        case .tristeza: return "face.dashed"
        case .enojo: return "face.dashed.fill"
        case .miedo: return "exclamationmark.triangle"
        case .calma: return "leaf"
        case .gratitud: return "heart.fill"
        case .amor: return "heart.circle.fill"
        case .frustracion: return "exclamationmark"
        case .orgullo: return "star.fill"
        case .esperanza: return "sun.max.fill"
        }
    }
    
    var color: String {
        switch self {
        case .alegria: return "yellow"
        case .tristeza: return "blue"
        case .enojo: return "red"
        case .miedo: return "purple"
        case .calma: return "mint"
        case .gratitud: return "pink"
        case .amor: return "red"
        case .frustracion: return "orange"
        case .orgullo: return "green"
        case .esperanza: return "yellow"
        }
    }
}