import Foundation

/// Datos de evaluación para la Capa 7
/// Basado en "The Yes Brain" de Daniel J. Siegel y Tina Payne Bryson
struct YB7EvaluationData {
    
    static func createQuestions() -> [YB7Question] {
        return [
            // BALANCE (10 preguntas)
            YB7Question(
                pillar: "Balance",
                text: "Respiro profundo antes de intervenir cuando mi hijo está alterado",
                type: "scale",
                weight: 1.0,
                order: 1
            ),
            YB7Question(
                pillar: "Balance",
                text: "Mantengo un tono de voz calmado incluso en momentos de tensión",
                type: "scale",
                weight: 1.0,
                order: 2
            ),
            YB7Question(
                pillar: "Balance",
                text: "Puedo pausar y pensar antes de reaccionar emocionalmente",
                type: "scale",
                weight: 1.0,
                order: 3
            ),
            YB7Question(
                pillar: "Balance",
                text: "Ayudo a mi hijo a nombrar sus emociones sin juzgarlas",
                type: "scale",
                weight: 1.0,
                order: 4
            ),
            YB7Question(
                pillar: "Balance",
                text: "Uso el contacto físico (abrazos, mano en hombro) para regular momentos difíciles",
                type: "scale",
                weight: 1.0,
                order: 5
            ),
            YB7Question(
                pillar: "Balance",
                text: "Practico respiración consciente con mi hijo cuando se siente abrumado",
                type: "scale",
                weight: 1.0,
                order: 6
            ),
            YB7Question(
                pillar: "Balance",
                text: "Dedico tiempo diario sin distracciones (sin pantallas) con mi hijo",
                type: "scale",
                weight: 1.0,
                order: 7
            ),
            YB7Question(
                pillar: "Balance",
                text: "Al final del día, reviso las emociones del día con mi hijo",
                type: "scale",
                weight: 1.0,
                order: 8
            ),
            YB7Question(
                pillar: "Balance",
                text: "Reconozco mis propias señales de desregulación y tomo pausas",
                type: "scale",
                weight: 1.0,
                order: 9
            ),
            YB7Question(
                pillar: "Balance",
                text: "Modelo calma y autorregulación con mi propio comportamiento",
                type: "scale",
                weight: 1.0,
                order: 10
            ),
            
            // RESILIENCIA (10 preguntas)
            YB7Question(
                pillar: "Resiliencia",
                text: "Veo los errores de mi hijo como oportunidades de aprendizaje",
                type: "scale",
                weight: 1.0,
                order: 11
            ),
            YB7Question(
                pillar: "Resiliencia",
                text: "Cuando mi hijo se frustra, acompaño sin resolver inmediatamente",
                type: "scale",
                weight: 1.0,
                order: 12
            ),
            YB7Question(
                pillar: "Resiliencia",
                text: "Practico la reparación emocional después de conflictos",
                type: "scale",
                weight: 1.0,
                order: 13
            ),
            YB7Question(
                pillar: "Resiliencia",
                text: "Uso la palabra 'todavía' para cultivar mentalidad de crecimiento",
                type: "scale",
                weight: 1.0,
                order: 14
            ),
            YB7Question(
                pillar: "Resiliencia",
                text: "Divido tareas grandes en pasos pequeños y alcanzables",
                type: "scale",
                weight: 1.0,
                order: 15
            ),
            YB7Question(
                pillar: "Resiliencia",
                text: "Comparto historias de superación familiar con mi hijo",
                type: "scale",
                weight: 1.0,
                order: 16
            ),
            YB7Question(
                pillar: "Resiliencia",
                text: "Celebro el esfuerzo de mi hijo, no solo los resultados",
                type: "scale",
                weight: 1.0,
                order: 17
            ),
            YB7Question(
                pillar: "Resiliencia",
                text: "Permito que mi hijo experimente frustración controlada para aprender",
                type: "scale",
                weight: 1.0,
                order: 18
            ),
            YB7Question(
                pillar: "Resiliencia",
                text: "Modelo resiliencia reconociendo mis propios errores y aprendizajes",
                type: "scale",
                weight: 1.0,
                order: 19
            ),
            YB7Question(
                pillar: "Resiliencia",
                text: "Confío en la capacidad de mi hijo para superar dificultades",
                type: "scale",
                weight: 1.0,
                order: 20
            ),
            
            // INSIGHT (10 preguntas)
            YB7Question(
                pillar: "Insight",
                text: "Ayudo a mi hijo a identificar sensaciones corporales asociadas a emociones",
                type: "scale",
                weight: 1.0,
                order: 21
            ),
            YB7Question(
                pillar: "Insight",
                text: "Enseño a mi hijo a observar sus pensamientos sin juzgarlos",
                type: "scale",
                weight: 1.0,
                order: 22
            ),
            YB7Question(
                pillar: "Insight",
                text: "Reflejo las emociones de mi hijo para que se vea a sí mismo",
                type: "scale",
                weight: 1.0,
                order: 23
            ),
            YB7Question(
                pillar: "Insight",
                text: "Mantenemos un diario emocional o momento de reflexión diaria",
                type: "scale",
                weight: 1.0,
                order: 24
            ),
            YB7Question(
                pillar: "Insight",
                text: "Hago pausas de 'chequeo interno' con mi hijo durante el día",
                type: "scale",
                weight: 1.0,
                order: 25
            ),
            YB7Question(
                pillar: "Insight",
                text: "Ayudo a mi hijo a conectar causas con consecuencias emocionales",
                type: "scale",
                weight: 1.0,
                order: 26
            ),
            YB7Question(
                pillar: "Insight",
                text: "Reconozco y nombro mis propias emociones frente a mi hijo",
                type: "scale",
                weight: 1.0,
                order: 27
            ),
            YB7Question(
                pillar: "Insight",
                text: "Pregunto a mi hijo '¿Cómo te sientes?' y escucho sin juzgar",
                type: "scale",
                weight: 1.0,
                order: 28
            ),
            YB7Question(
                pillar: "Insight",
                text: "Practico autoconciencia de mis propios estados emocionales",
                type: "scale",
                weight: 1.0,
                order: 29
            ),
            YB7Question(
                pillar: "Insight",
                text: "Uso metáforas y cuentos para ayudar a mi hijo a comprender sus emociones",
                type: "scale",
                weight: 1.0,
                order: 30
            ),
            
            // EMPATÍA (10 preguntas)
            YB7Question(
                pillar: "Empatía",
                text: "Me pongo en los zapatos de mi hijo antes de reaccionar",
                type: "scale",
                weight: 1.0,
                order: 31
            ),
            YB7Question(
                pillar: "Empatía",
                text: "Escucho activamente a mi hijo sin saltar a soluciones",
                type: "scale",
                weight: 1.0,
                order: 32
            ),
            YB7Question(
                pillar: "Empatía",
                text: "Valido las emociones de mi hijo incluso cuando corrijo su conducta",
                type: "scale",
                weight: 1.0,
                order: 33
            ),
            YB7Question(
                pillar: "Empatía",
                text: "Expreso amor de formas tangibles y específicas diariamente",
                type: "scale",
                weight: 1.0,
                order: 34
            ),
            YB7Question(
                pillar: "Empatía",
                text: "Pido perdón con humildad cuando me equivoco",
                type: "scale",
                weight: 1.0,
                order: 35
            ),
            YB7Question(
                pillar: "Empatía",
                text: "Practicamos rituales de gratitud mutua en familia",
                type: "scale",
                weight: 1.0,
                order: 36
            ),
            YB7Question(
                pillar: "Empatía",
                text: "Conecto emocionalmente antes de establecer límites",
                type: "scale",
                weight: 1.0,
                order: 37
            ),
            YB7Question(
                pillar: "Empatía",
                text: "Pregunto a mi hijo si necesita ayuda o solo ser escuchado",
                type: "scale",
                weight: 1.0,
                order: 38
            ),
            YB7Question(
                pillar: "Empatía",
                text: "Creo momentos especiales de conexión uno a uno con mi hijo",
                type: "scale",
                weight: 1.0,
                order: 39
            ),
            YB7Question(
                pillar: "Empatía",
                text: "Modelo empatía mostrando compasión hacia otros en presencia de mi hijo",
                type: "scale",
                weight: 1.0,
                order: 40
            )
        ]
    }
    
    // MARK: - Helpers
    
    static func calculateScore(for responses: [YB7Response], questions: [YB7Question]) -> Double {
        guard !responses.isEmpty else { return 0.0 }
        let totalScore = responses.reduce(0.0) { sum, response in
            if let question = questions.first(where: { $0.id == response.questionId }) {
                return sum + (response.score * question.weight)
            }
            return sum
        }
        let totalWeight = responses.compactMap { response in
            questions.first(where: { $0.id == response.questionId })?.weight
        }.reduce(0.0, +)
        
        return totalWeight > 0 ? (totalScore / totalWeight) : 0.0
    }
    
    static func determineLevel(score: Double) -> String {
        switch score {
        case 0..<40:
            return "Inicial"
        case 40..<70:
            return "Progresando"
        case 70...100:
            return "Integrado"
        default:
            return "Inicial"
        }
    }
    
    static func generateFeedback(for pillar: String, score: Double) -> String {
        let level = determineLevel(score: score)
        
        switch (pillar, level) {
        case ("Balance", "Inicial"):
            return "Estás comenzando a construir tu capacidad de regulación emocional. La pausa consciente es el primer paso."
        case ("Balance", "Progresando"):
            return "Tu capacidad de mantener la calma está creciendo. Continúa practicando la respiración y el tono regulado."
        case ("Balance", "Integrado"):
            return "Has desarrollado una sólida capacidad de autorregulación. Eres un modelo de calma para tu hijo."
            
        case ("Resiliencia", "Inicial"):
            return "Estás aprendiendo a ver los errores como oportunidades. La paciencia contigo mismo es clave."
        case ("Resiliencia", "Progresando"):
            return "Tu enfoque hacia el error y la frustración está evolucionando. Sigue modelando persistencia."
        case ("Resiliencia", "Integrado"):
            return "Has integrado la resiliencia en tu crianza. Tu hijo aprende de ti que el crecimiento viene del esfuerzo."
            
        case ("Insight", "Inicial"):
            return "Estás comenzando el viaje del autoconocimiento. Observar tus emociones es el primer paso."
        case ("Insight", "Progresando"):
            return "Tu conciencia emocional está creciendo. Continúa practicando la reflexión diaria."
        case ("Insight", "Integrado"):
            return "Tienes una profunda comprensión de tu mundo interior. Enseñas autoconciencia con tu ejemplo."
            
        case ("Empatía", "Inicial"):
            return "Estás aprendiendo a conectar emocionalmente. Escuchar sin juzgar es un regalo poderoso."
        case ("Empatía", "Progresando"):
            return "Tu capacidad empática está floreciendo. Sigue validando las emociones de tu hijo."
        case ("Empatía", "Integrado"):
            return "Has desarrollado una empatía profunda y genuina. Tu conexión emocional es el corazón de tu crianza."
            
        default:
            return "Continúa practicando y observando tu evolución."
        }
    }
    
    static func generateRecommendations(results: [YB7Result]) -> [String] {
        var recommendations: [String] = []
        
        for result in results {
            if result.score < 70 {
                switch result.pillar {
                case "Balance":
                    recommendations.append("Practica respiración consciente diaria (Capa 3: Herramientas de Balance)")
                case "Resiliencia":
                    recommendations.append("Revisa las simulaciones de manejo de errores (Capa 4: Escenarios de Resiliencia)")
                case "Insight":
                    recommendations.append("Implementa el diario emocional compartido (Capa 5: Rutinas de Insight)")
                case "Empatía":
                    recommendations.append("Practica escucha activa sin arreglar (Capa 6: Día 23 - Escucha sin arreglar)")
                default:
                    break
                }
            }
        }
        
        if recommendations.isEmpty {
            recommendations.append("¡Excelente trabajo! Continúa con el Plan de Entrenamiento para mantener tu crecimiento.")
            recommendations.append("Considera compartir tu experiencia con otros padres para reforzar tu aprendizaje.")
        }
        
        return recommendations
    }
}

