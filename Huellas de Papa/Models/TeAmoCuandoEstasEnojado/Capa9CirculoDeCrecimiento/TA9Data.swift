import Foundation

/// Datos de la Capa 9 - Círculo de Crecimiento
/// Celebración final del viaje en amor incondicional
/// Basado en el libro de Erin Winters

extension TA9Badge {
    static func createAllBadges() -> [TA9Badge] {
        [
            TA9Badge(
                title: "Explorador de Fundamentos",
                badgeDescription: "Completaste la Capa 1 - Fundamentos",
                requirement: "Explorar los 4 pilares del amor incondicional",
                iconName: "book.fill",
                color: "pink",
                bookQuote: "Te amo cuando estás enojado"
            ),
            TA9Badge(
                title: "Maestro de Principios",
                badgeDescription: "Completaste la Capa 2 - Principios",
                requirement: "Dominar los 4 principios clave",
                iconName: "heart.text.square.fill",
                color: "mint",
                bookQuote: "Mi amor persiste ahora y para siempre"
            ),
            TA9Badge(
                title: "Artesano de Herramientas",
                badgeDescription: "Completaste la Capa 3 - Herramientas",
                requirement: "Aprender las 8 herramientas prácticas",
                iconName: "wrench.and.screwdriver.fill",
                color: "orange",
                bookQuote: "Hablar de las emociones con alguien de confianza puede ayudar"
            ),
            TA9Badge(
                title: "Simulador Experto",
                badgeDescription: "Completaste la Capa 4 - Simulaciones",
                requirement: "Practicar las 5 simulaciones",
                iconName: "theatermasks.fill",
                color: "purple",
                bookQuote: "El amor permanece constante"
            ),
            TA9Badge(
                title: "Aplicador en Casa",
                badgeDescription: "Completaste la Capa 5 - Aplicación en Casa",
                requirement: "Implementar actividades y rutinas",
                iconName: "house.fill",
                color: "blue",
                bookQuote: "Palabras dulces antes de dormir"
            ),
            TA9Badge(
                title: "Guerrero en Entrenamiento",
                badgeDescription: "Completaste la Capa 6 - Plan de Entrenamiento",
                requirement: "Avanzar a través de los 5 niveles",
                iconName: "figure.strengthtraining.traditional",
                color: "red",
                bookQuote: "El amor incondicional se entrena"
            ),
            TA9Badge(
                title: "Evaluador Honesto",
                badgeDescription: "Completaste la Capa 7 - Evaluaciones",
                requirement: "Auto-evaluar con honestidad",
                iconName: "chart.bar.fill",
                color: "green",
                bookQuote: "Aprender sobre nuestras emociones es clave"
            ),
            TA9Badge(
                title: "Contador de Historias",
                badgeDescription: "Completaste la Capa 8 - Modo Niño",
                requirement: "Leer los 6 cuentos con tu hijo",
                iconName: "book.pages.fill",
                color: "indigo",
                bookQuote: "Los días difíciles terminan"
            ),
            TA9Badge(
                title: "Validador de 100 Emociones",
                badgeDescription: "Validaste 100 emociones en total",
                requirement: "Usar frases del libro 100 veces",
                iconName: "100.circle.fill",
                color: "yellow",
                bookQuote: "Te amo en todas tus emociones"
            ),
            TA9Badge(
                title: "Guardián Nocturno",
                badgeDescription: "30 noches de palabras dulces",
                requirement: "Ritual nocturno 30 veces",
                iconName: "moon.stars.fill",
                color: "indigo",
                bookQuote: "El consuelo se encuentra en las palabras dulces"
            ),
            TA9Badge(
                title: "Maestro de la Permanencia",
                badgeDescription: "Validaste en tus 20 momentos difíciles",
                requirement: "Amor visible cuando tú estás enfadado",
                iconName: "infinity.circle.fill",
                color: "purple",
                bookQuote: "Te amo incluso cuando yo estoy cansada"
            ),
            TA9Badge(
                title: "Campeón del Amor Incondicional",
                badgeDescription: "¡Completaste TODO el módulo!",
                requirement: "Completar las 9 capas",
                iconName: "crown.fill",
                color: "gold",
                bookQuote: "Ahora y para siempre"
            )
        ]
    }
}

extension TA9Milestone {
    static let allMilestones: [TA9Milestone] = [
        TA9Milestone(
            title: "Primer Paso en el Viaje",
            milestoneDescription: "Comenzaste el módulo 'Te amo cuando estás enojado'",
            celebration: "¡Decidiste aprender sobre amor incondicional!",
            iconName: "figure.walk"
        ),
        TA9Milestone(
            title: "Primera Validación Auténtica",
            milestoneDescription: "Dijiste 'Te amo cuando estás [emoción]' de corazón",
            celebration: "Sentiste la diferencia entre decirlo automáticamente y sentirlo",
            iconName: "heart.fill"
        ),
        TA9Milestone(
            title: "Primera Noche de Palabras Dulces",
            milestoneDescription: "Completaste tu primer ritual nocturno",
            celebration: "Reparaste la conexión del día antes de dormir",
            iconName: "moon.stars.fill"
        ),
        TA9Milestone(
            title: "Validación en Tu Momento Difícil",
            milestoneDescription: "Validaste a tu hijo incluso cuando tú estabas enfadado",
            celebration: "Modelaste que el amor trasciende nuestras propias emociones",
            iconName: "bolt.heart.fill"
        ),
        TA9Milestone(
            title: "Primer Cuento Compartido",
            milestoneDescription: "Leíste un cuento de la Capa 8 con tu hijo",
            celebration: "Conectaron a través de la historia",
            iconName: "book.fill"
        ),
        TA9Milestone(
            title: "Maestría Completa",
            milestoneDescription: "Completaste todas las capas del módulo",
            celebration: "¡Eres un Maestro del Amor Incondicional!",
            iconName: "crown.fill"
        )
    ]
}

