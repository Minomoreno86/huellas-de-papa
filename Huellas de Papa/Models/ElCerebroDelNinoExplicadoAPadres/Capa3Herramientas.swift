import Foundation
import SwiftUI

// MARK: - Capa 3: Herramientas Prácticas
struct HerramientaPractica: Identifiable, Codable {
    let id = UUID()
    let titulo: String
    let descripcion: String
    let icono: String
    let color: String
    let categoria: CategoriaHerramienta
    let instrucciones: [String]
    let materialesNecesarios: [String]
    let tiempoEstimado: String
    let dificultad: NivelDificultadHerramienta
    let edadRecomendada: String
    let beneficios: [String]
    let variaciones: [String]
    let consejosPracticos: [String]
}

enum CategoriaHerramienta: String, CaseIterable, Codable {
    case regulacionEmocional = "Regulación Emocional"
    case comunicacion = "Comunicación"
    case disciplina = "Disciplina Positiva"
    case juego = "Juego Terapéutico"
    case mindfulness = "Mindfulness"
    case creatividad = "Creatividad"
    case socializacion = "Socialización"
    case aprendizaje = "Aprendizaje"
}

enum NivelDificultadHerramienta: String, CaseIterable, Codable {
    case facil = "Fácil"
    case intermedio = "Intermedio"
    case avanzado = "Avanzado"
}

struct Capa3Herramientas: Identifiable, Codable {
    let id = UUID()
    let herramientas: [HerramientaPractica]
    let resumenIntroduccion: String
    
    static func contenidoCerebroDelNino() -> Capa3Herramientas {
        let herramientas: [HerramientaPractica] = [
            HerramientaPractica(
                titulo: "La Respiración del Dragón",
                descripcion: "Técnica de respiración profunda para ayudar a los niños a calmarse cuando están ansiosos o enojados.",
                icono: "wind",
                color: "FF6B6B",
                categoria: .regulacionEmocional,
                instrucciones: [
                    "Siéntate cómodamente con tu hijo",
                    "Pide que inhale profundamente por la nariz",
                    "Mantenga el aire por 3 segundos",
                    "Exhale lentamente por la boca haciendo sonido de dragón",
                    "Repita 3-5 veces"
                ],
                materialesNecesarios: ["Ninguno"],
                tiempoEstimado: "5-10 minutos",
                dificultad: .facil,
                edadRecomendada: "3-12 años",
                beneficios: [
                    "Reduce la ansiedad",
                    "Mejora la concentración",
                    "Desarrolla autocontrol",
                    "Fortalece el vínculo padre-hijo"
                ],
                variaciones: [
                    "Respiración con conteo",
                    "Respiración con música",
                    "Respiración en movimiento"
                ],
                consejosPracticos: [
                    "Practica primero tú para modelar",
                    "Hazlo divertido con sonidos",
                    "Usa cuando veas señales de estrés",
                    "Celebra los intentos, no la perfección"
                ]
            ),
            HerramientaPractica(
                titulo: "El Semáforo de las Emociones",
                descripcion: "Sistema visual para que los niños identifiquen y regulen sus emociones usando los colores del semáforo.",
                icono: "trafficlight",
                color: "FFD93D",
                categoria: .regulacionEmocional,
                instrucciones: [
                    "Crea un semáforo con cartulina",
                    "Rojo: Parar y respirar",
                    "Amarillo: Pensar en soluciones",
                    "Verde: Actuar de manera positiva",
                    "Practica con situaciones reales"
                ],
                materialesNecesarios: ["Cartulina", "Colores", "Tijeras", "Pegamento"],
                tiempoEstimado: "15-20 minutos",
                dificultad: .facil,
                edadRecomendada: "4-10 años",
                beneficios: [
                    "Desarrolla inteligencia emocional",
                    "Mejora la autorregulación",
                    "Facilita la comunicación",
                    "Reduce conflictos"
                ],
                variaciones: [
                    "Semáforo digital",
                    "Semáforo con personajes",
                    "Semáforo familiar"
                ],
                consejosPracticos: [
                    "Colócalo en un lugar visible",
                    "Usa lenguaje simple",
                    "Practica en momentos calmados",
                    "Refuerza positivamente"
                ]
            ),
            HerramientaPractica(
                titulo: "La Caja de la Calma",
                descripcion: "Kit de herramientas para que los niños se autorregulen cuando sienten emociones intensas.",
                icono: "shippingbox",
                color: "6BCF7F",
                categoria: .regulacionEmocional,
                instrucciones: [
                    "Consigue una caja pequeña",
                    "Llénala con objetos calmantes",
                    "Incluye: pelota antiestrés, música, libros",
                    "Enséñale a usarla cuando esté molesto",
                    "Practica su uso regularmente"
                ],
                materialesNecesarios: ["Caja pequeña", "Pelota antiestrés", "Música relajante", "Libros", "Lápices de colores"],
                tiempoEstimado: "30 minutos",
                dificultad: .facil,
                edadRecomendada: "3-12 años",
                beneficios: [
                    "Desarrolla estrategias de afrontamiento",
                    "Mejora la autonomía emocional",
                    "Reduce berrinches",
                    "Fortalece la autoestima"
                ],
                variaciones: [
                    "Caja temática por emociones",
                    "Caja portátil",
                    "Caja familiar compartida"
                ],
                consejosPracticos: [
                    "Personaliza según sus intereses",
                    "Renueva contenido regularmente",
                    "Enséñale a usarla independientemente",
                    "Celebra su uso exitoso"
                ]
            ),
            HerramientaPractica(
                titulo: "El Tiempo de Conexión",
                descripcion: "Momento diario dedicado exclusivamente a conectar emocionalmente con tu hijo sin distracciones.",
                icono: "heart.fill",
                color: "FF8E8E",
                categoria: .comunicacion,
                instrucciones: [
                    "Reserva 10-15 minutos diarios",
                    "Elimina todas las distracciones",
                    "Déjale elegir la actividad",
                    "Mantén contacto visual y físico",
                    "Escucha activamente sin juzgar"
                ],
                materialesNecesarios: ["Ninguno"],
                tiempoEstimado: "10-15 minutos diarios",
                dificultad: .facil,
                edadRecomendada: "Todas las edades",
                beneficios: [
                    "Fortalece el vínculo emocional",
                    "Mejora la comunicación",
                    "Reduce problemas de comportamiento",
                    "Desarrolla confianza"
                ],
                variaciones: [
                    "Tiempo de conexión temático",
                    "Conexión a través del juego",
                    "Conexión durante rutinas"
                ],
                consejosPracticos: [
                    "Sé consistente con el horario",
                    "Evita dar consejos o corregir",
                    "Disfruta del momento presente",
                    "Adapta la duración a su edad"
                ]
            ),
            HerramientaPractica(
                titulo: "El Rincón de la Reflexión",
                descripcion: "Espacio físico donde el niño puede ir a calmarse y reflexionar sobre sus acciones y emociones.",
                icono: "house.fill",
                color: "A8E6CF",
                categoria: .disciplina,
                instrucciones: [
                    "Designa un rincón tranquilo en casa",
                    "Coloca cojines y objetos calmantes",
                    "Enséñale que es un lugar para calmarse",
                    "No lo uses como castigo",
                    "Practica ir allí en momentos calmados"
                ],
                materialesNecesarios: ["Cojines", "Libros", "Música relajante", "Objetos calmantes"],
                tiempoEstimado: "5-15 minutos",
                dificultad: .facil,
                edadRecomendada: "3-12 años",
                beneficios: [
                    "Desarrolla autorregulación",
                    "Reduce conflictos",
                    "Mejora la reflexión",
                    "Fortalece la autonomía"
                ],
                variaciones: [
                    "Rincón portátil",
                    "Rincón temático",
                    "Rincón familiar"
                ],
                consejosPracticos: [
                    "Hazlo atractivo y cómodo",
                    "No lo uses como castigo",
                    "Enséñale a usarlo voluntariamente",
                    "Refuerza su uso positivo"
                ]
            )
        ]
        
        return Capa3Herramientas(
            herramientas: herramientas,
            resumenIntroduccion: """
            La Capa 3, "Herramientas Prácticas", proporciona un arsenal de técnicas concretas y aplicables que los padres pueden implementar inmediatamente en su vida diaria. Estas herramientas están diseñadas específicamente para abordar los desafíos más comunes de la crianza, desde berrinches y conflictos hasta la comunicación y el vínculo emocional.

            Cada herramienta incluye instrucciones paso a paso, materiales necesarios, tiempo estimado, nivel de dificultad y variaciones para adaptarse a diferentes edades y personalidades. Estas no son solo técnicas aisladas, sino estrategias integradas que trabajan en conjunto para crear un entorno de crianza más consciente y efectivo.

            Desde la "Respiración del Dragón" para la regulación emocional hasta el "Tiempo de Conexión" para fortalecer vínculos, estas herramientas están respaldadas por la neurociencia y diseñadas para ser fáciles de implementar, divertidas para los niños y efectivas para los padres.
            """
        )
    }
}
