import Foundation

/// Datos iniciales de la Capa 9 - Círculo de Crecimiento
struct C9Data {
    
    // MARK: - Stages
    static func createStages() -> [C9Stage] {
        return [
            C9Stage(
                name: "Conexión",
                threshold: 10,
                colorTheme: "blue",
                mantra: "Tu presencia construye cerebros seguros",
                order: 1
            ),
            C9Stage(
                name: "Regulación",
                threshold: 25,
                colorTheme: "green",
                mantra: "Tu calma enseña autorregulación",
                order: 2
            ),
            C9Stage(
                name: "Integración",
                threshold: 50,
                colorTheme: "orange",
                mantra: "Comprendes el mundo interior de tu hijo",
                order: 3
            ),
            C9Stage(
                name: "Presencia",
                threshold: 100,
                colorTheme: "pink",
                mantra: "Has integrado el cerebro Sí en tu vida",
                order: 4
            )
        ]
    }
    
    // MARK: - Missions
    static func createMissions() -> [C9Mission] {
        return [
            C9Mission(
                title: "Semana de la Pausa Consciente",
                missionDescription: "Practica respirar antes de reaccionar en momentos de tensión",
                objectives: [
                    "Respira profundo 3 veces antes de intervenir",
                    "Mantén tono de voz suave en conflictos",
                    "Observa tu estado interno antes de actuar"
                ],
                pillar: "Balance",
                icon: "wind",
                color: "blue"
            ),
            C9Mission(
                title: "Semana del Error que Enseña",
                missionDescription: "Reencuadra los errores como oportunidades de aprendizaje",
                objectives: [
                    "Di 'Los errores ayudan a crecer' cuando tu hijo se equivoque",
                    "Comparte un error propio y qué aprendiste",
                    "Celebra el esfuerzo, no solo el resultado"
                ],
                pillar: "Resiliencia",
                icon: "arrow.triangle.2.circlepath",
                color: "green"
            ),
            C9Mission(
                title: "Semana del Espejo Emocional",
                missionDescription: "Ayuda a tu hijo a verse y comprenderse emocionalmente",
                objectives: [
                    "Refleja sus emociones: 'Veo que estás frustrado'",
                    "Pregunta diariamente: '¿Cómo te sientes?'",
                    "Compartan el diario emocional antes de dormir"
                ],
                pillar: "Insight",
                icon: "eye.circle.fill",
                color: "orange"
            ),
            C9Mission(
                title: "Semana de la Conexión Profunda",
                missionDescription: "Practica escucha y validación sin arreglar",
                objectives: [
                    "Escucha 5 minutos sin interrumpir ni dar soluciones",
                    "Valida emociones antes de corregir conductas",
                    "Expresa amor específico diariamente"
                ],
                pillar: "Empatía",
                icon: "heart.circle.fill",
                color: "pink"
            )
        ]
    }
    
    // MARK: - Badges
    static func createBadges() -> [C9Badge] {
        return [
            // Balance
            C9Badge(
                name: "Pausa Serena",
                meaning: "Has cultivado el hábito de respirar antes de reaccionar",
                symbol: "wind",
                pillar: "Balance",
                color: "blue"
            ),
            C9Badge(
                name: "Voz que Calma",
                meaning: "Tu tono suave regula el sistema nervioso de tu hijo",
                symbol: "waveform",
                pillar: "Balance",
                color: "blue"
            ),
            
            // Resiliencia
            C9Badge(
                name: "Error que Enseña",
                meaning: "Transformas los errores en oportunidades de crecimiento",
                symbol: "lightbulb.fill",
                pillar: "Resiliencia",
                color: "green"
            ),
            C9Badge(
                name: "Reparador de Vínculos",
                meaning: "Practicas la reparación emocional con humildad",
                symbol: "heart.text.square.fill",
                pillar: "Resiliencia",
                color: "green"
            ),
            
            // Insight
            C9Badge(
                name: "Veo por Dentro",
                meaning: "Ayudas a tu hijo a comprender su mundo interior",
                symbol: "eye.circle.fill",
                pillar: "Insight",
                color: "orange"
            ),
            C9Badge(
                name: "Espejo Empático",
                meaning: "Reflejas las emociones de tu hijo con claridad amorosa",
                symbol: "person.circle.fill",
                pillar: "Insight",
                color: "orange"
            ),
            
            // Empatía
            C9Badge(
                name: "Estoy Contigo",
                meaning: "Tu presencia emocional es constante y genuina",
                symbol: "heart.fill",
                pillar: "Empatía",
                color: "pink"
            ),
            C9Badge(
                name: "Escucha Profunda",
                meaning: "Escuchas sin juzgar, arreglar ni interrumpir",
                symbol: "ear.fill",
                pillar: "Empatía",
                color: "pink"
            )
        ]
    }
}

