import Foundation

/// Datos de la Capa 6 - Plan de Entrenamiento
/// Sistema de niveles progresivos para entrenar al padre en amor incondicional
/// Basado 100% en el libro de Erin Winters

extension TA6Badge {
    static let allBadges: [TA6Badge] = [
        // Badges por dominio de frases
        TA6Badge(
            name: "Validador Novato",
            description: "Usaste frases de validación del libro 10 veces",
            requirement: "10 validaciones registradas",
            bookQuote: "Te amo cuando estás [emoción]",
            icon: "star.fill",
            color: "pink"
        ),
        TA6Badge(
            name: "Maestro de Palabras Dulces",
            description: "Completaste 7 rituales nocturnos consecutivos",
            requirement: "7 noches seguidas con palabras dulces",
            bookQuote: "El consuelo se encuentra en las palabras dulces antes de dormir",
            icon: "moon.stars.fill",
            color: "indigo"
        ),
        TA6Badge(
            name: "Guardián de la Permanencia",
            description: "Validaste emociones incluso cuando tú estabas enfadado/cansado",
            requirement: "5 validaciones en tus propios momentos difíciles",
            bookQuote: "Te amo incluso cuando yo estoy cansada o me enfado",
            icon: "infinity.circle.fill",
            color: "purple"
        ),
        TA6Badge(
            name: "Respetador del Espacio",
            description: "Respetaste la necesidad de soledad de tu hijo",
            requirement: "Validar 'me encanta tu tiempo a solas' 3 veces",
            bookQuote: "Me encanta tu tiempo a solas",
            icon: "door.left.hand.closed",
            color: "blue"
        ),
        TA6Badge(
            name: "Validador de lo Molesto",
            description: "Validaste expresiones molestas sin criticar",
            requirement: "Validar suspiros, quejas o expresiones molestas 5 veces",
            bookQuote: "Te amo incluso con ese suspiro molesto",
            icon: "wind",
            color: "gray"
        ),
        TA6Badge(
            name: "Maestro de la Humanidad Compartida",
            description: "Reconociste días difíciles mutuos con compasión",
            requirement: "Validar agotamiento mutuo 3 veces",
            bookQuote: "Te amo cuando ambos estamos derrotados",
            icon: "person.2.fill",
            color: "orange"
        ),
        TA6Badge(
            name: "Campeón del Espectro Emocional",
            description: "Validaste todas las 8 emociones del libro",
            requirement: "Validar: enojado, triste, alegre, melancólico, apasionado, tranquilo, frustrado, cansado",
            bookQuote: "Te amo en todas tus emociones",
            icon: "rainbow",
            color: "purple"
        ),
        TA6Badge(
            name: "Maestro del Amor Incondicional",
            description: "Completaste todos los niveles del entrenamiento",
            requirement: "Completar niveles 1-5",
            bookQuote: "Ahora y para siempre",
            icon: "crown.fill",
            color: "yellow"
        )
    ]
}

// MARK: - Datos de Niveles
struct TA6LevelData {
    static func createLevel1() -> TA6Level {
        TA6Level(
            levelNumber: 1,
            title: "Aprendiz de Validación",
            description: "Aprende a usar las frases básicas del libro de forma auténtica",
            mission: "Dominar las frases de validación emocional del libro en situaciones cotidianas",
            dailyChallenge: "Usa 'Te amo cuando estás [emoción]' al menos 5 veces al día con autenticidad",
            reflectionQuestion: "¿Lo dije automáticamente o realmente lo sentí? ¿Noté cambios en mi hijo?",
            bookReference: "Te amo cuando estás enojado, triste, alegre, melancólico, apasionado, tranquilo",
            estimatedDays: "3-5 días",
            icon: "1.circle.fill",
            color: "pink"
        )
    }
    
    static func createLevel2() -> TA6Level {
        TA6Level(
            levelNumber: 2,
            title: "Guardián de la Permanencia",
            description: "Mantén el amor visible incluso en TUS momentos difíciles",
            mission: "Practicar validación cuando TÚ estás enojado, cansado o frustrado",
            dailyChallenge: "Cuando sientas ira/cansancio, pausa, regula, y valida igual. Di: 'Estoy cansado/enfadado Y te amo'",
            reflectionQuestion: "¿Proyecté mi emoción en mi hijo o la regulé primero? ¿Mantuve el amor visible?",
            bookReference: "Te amo incluso cuando yo estoy cansada o me enfado",
            estimatedDays: "3-5 días",
            icon: "2.circle.fill",
            color: "purple"
        )
    }
    
    static func createLevel3() -> TA6Level {
        TA6Level(
            levelNumber: 3,
            title: "Maestro del Espacio",
            description: "Aprende a respetar la necesidad de soledad y espacio de tu hijo",
            mission: "Validar la necesidad de espacio personal sin invadirla ni resentirla",
            dailyChallenge: "Cuando tu hijo necesite espacio, di: 'Te amo cuando necesitas estar solo. Me encanta tu tiempo a solas'",
            reflectionQuestion: "¿Respeté su espacio genuinamente o me sentí rechazado? ¿Forcé interacción?",
            bookReference: "Te amo cuando te escondes en tu habitación, me encanta tu tiempo a solas",
            estimatedDays: "3-5 días",
            icon: "3.circle.fill",
            color: "blue"
        )
    }
    
    static func createLevel4() -> TA6Level {
        TA6Level(
            levelNumber: 4,
            title: "Sanador de Noches",
            description: "Domina el ritual de 'palabras dulces' antes de dormir",
            mission: "Establecer el ritual nocturno de cierre emocional del día",
            dailyChallenge: "Cada noche: repasa emociones del día, valida cada una, ofrece palabras dulces y abrazo",
            reflectionQuestion: "¿Reparé la conexión antes de dormir? ¿Lo hice incluso en días difíciles?",
            bookReference: "El consuelo se encuentra en el abrazo y las palabras dulces antes de dormir. Los días difíciles terminan",
            estimatedDays: "5-7 días",
            icon: "4.circle.fill",
            color: "indigo"
        )
    }
    
    static func createLevel5() -> TA6Level {
        TA6Level(
            levelNumber: 5,
            title: "Maestro del Amor Incondicional",
            description: "Integración total: todas las habilidades en acción simultánea",
            mission: "Aplicar todas las lecciones del libro de forma natural y auténtica",
            dailyChallenge: "Integrar validación en momentos difíciles + ritual nocturno + respeto del espacio + humanidad compartida",
            reflectionQuestion: "¿El amor incondicional se ha vuelto mi respuesta natural? ¿Qué ha cambiado en mi hijo?",
            bookReference: "Ahora y para siempre, en todas las emociones",
            estimatedDays: "Permanente",
            icon: "crown.fill",
            color: "yellow"
        )
    }
}

