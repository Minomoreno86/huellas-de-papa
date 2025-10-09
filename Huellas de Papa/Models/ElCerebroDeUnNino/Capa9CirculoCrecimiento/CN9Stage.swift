import Foundation

/// Etapas de maestría en integración cerebral
struct CN9Stage: Codable, Identifiable {
    let id: UUID
    let level: Int                      // 1-5
    let name: String
    let description: String
    let badgesRequired: Int             // Cuántas medallas para alcanzar
    let characteristics: [String]        // Características de un padre en esta etapa
    let nextStepGoal: String
    let icon: String
    let color: String
    
    init(level: Int, name: String, description: String, badgesRequired: Int, characteristics: [String], nextStepGoal: String, icon: String, color: String) {
        self.id = UUID()
        self.level = level
        self.name = name
        self.description = description
        self.badgesRequired = badgesRequired
        self.characteristics = characteristics
        self.nextStepGoal = nextStepGoal
        self.icon = icon
        self.color = color
    }
}

/// 5 Etapas de Maestría
let cn9Stages: [CN9Stage] = [
    CN9Stage(
        level: 1,
        name: "Padre Consciente",
        description: "Estás comenzando a ver el mundo con ojos de integración cerebral",
        badgesRequired: 0,
        characteristics: [
            "Reconoces cuando tu cerebro inferior se activa",
            "Empiezas a identificar hemisferio derecho vs. izquierdo en tu hijo",
            "Sabes las 12 estrategias intelectualmente",
            "A veces logras conectar antes de corregir",
            "Estás aprendiendo a tener expectativas realistas"
        ],
        nextStepGoal: "Practica 1-2 estrategias consistentemente hasta que se vuelvan automáticas. Empieza con Conecta y Redirige.",
        icon: "eye.fill",
        color: "blue"
    ),
    
    CN9Stage(
        level: 2,
        name: "Padre Practicante",
        description: "Aplicas estrategias regularmente con intencionalidad",
        badgesRequired: 3,
        characteristics: [
            "Conectas antes de corregir en la mayoría de situaciones",
            "Usas 3-4 estrategias fluidamente",
            "Reparas rupturas más consistentemente",
            "Notas cambios en respuestas de tu hijo",
            "Das opciones en lugar de órdenes frecuentemente"
        ],
        nextStepGoal: "Expande tu repertorio. Incorpora SIFT, Control Remoto Mental y Empatía activamente.",
        icon: "figure.walk",
        color: "green"
    ),
    
    CN9Stage(
        level: 3,
        name: "Padre Integrador",
        description: "Las estrategias se están volviendo segunda naturaleza",
        badgesRequired: 6,
        characteristics: [
            "Usas 6+ estrategias fluidamente según situación",
            "Puedes identificar estado cerebral de tu hijo y responder apropiadamente",
            "Modelas regulación emocional y reparación",
            "Tu hijo muestra señales de integración cerebral",
            "La crianza se siente más conectada y menos conflictiva"
        ],
        nextStepGoal: "Profundiza en estrategias avanzadas (SIFT, Memoria, Empatía). Ayuda a otros padres.",
        icon: "brain.head.profile",
        color: "purple"
    ),
    
    CN9Stage(
        level: 4,
        name: "Padre Maestro",
        description: "Dominas las estrategias y las adaptas creativamente",
        badgesRequired: 9,
        characteristics: [
            "Las 12 estrategias son automáticas en tu crianza",
            "Adaptas estrategias creativamente a situaciones únicas",
            "Tu hijo ha desarrollado habilidades sólidas de integración",
            "Eres referente para otros padres",
            "La crianza se siente como danza, no batalla"
        ],
        nextStepGoal: "Refina y profundiza. Comparte tu conocimiento. Sigue aprendiendo.",
        icon: "star.circle.fill",
        color: "orange"
    ),
    
    CN9Stage(
        level: 5,
        name: "Padre Sabio",
        description: "Has integrado profundamente las enseñanzas en tu ser",
        badgesRequired: 12,
        characteristics: [
            "La integración cerebral es parte de quién eres, no algo que 'haces'",
            "Respondes a desafíos con sabiduría y calma profunda",
            "Tu hijo ha desarrollado cerebro integrado y resiliente",
            "Modelas integración en todas tus relaciones",
            "Sigues creciendo y aprendiendo con humildad"
        ],
        nextStepGoal: "Continúa el viaje. La crianza consciente es camino de toda la vida. Comparte tu sabiduría.",
        icon: "crown.fill",
        color: "yellow"
    )
]

