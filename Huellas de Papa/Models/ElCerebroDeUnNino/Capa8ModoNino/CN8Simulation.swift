import Foundation

/// Simulación para que el PADRE experimente estados cerebrales del niño
struct CN8Simulation: Codable, Identifiable {
    let id: UUID
    let title: String
    let description: String
    let scenario: String                // Situación que vivirá el padre
    let instructions: [String]          // Pasos de la simulación
    let whatYoullFeel: String           // Qué sentirá el padre
    let parallelToChild: String         // Cómo esto es paralelo a lo que vive el niño
    let insight: String                 // Insight final
    let icon: String
    let color: String
    
    init(title: String, description: String, scenario: String, instructions: [String], whatYoullFeel: String, parallelToChild: String, insight: String, icon: String, color: String) {
        self.id = UUID()
        self.title = title
        self.description = description
        self.scenario = scenario
        self.instructions = instructions
        self.whatYoullFeel = whatYoullFeel
        self.parallelToChild = insight
        self.insight = insight
        self.icon = icon
        self.color = color
    }
}

/// Simulaciones experienciales para padres
let cn8Simulations: [CN8Simulation] = [
    CN8Simulation(
        title: "Experimenta el Secuestro de la Amígdala",
        description: "Siente cómo es cuando tu cerebro inferior toma control total",
        scenario: "Imagina: Estás manejando y alguien se te cierra bruscamente. Casi chocas. Tu cuerpo reacciona INSTANTÁNEAMENTE.",
        instructions: [
            "Cierra los ojos. Recuerda vívidamente ese momento (o similar): casi accidente, susto grande, peligro súbito",
            "Observa tu cuerpo EN ESE MOMENTO: corazón acelerado, músculos tensos, respiración cortada, sudor",
            "Nota tus pensamientos: no hay razonamiento complejo, solo reacción",
            "¿Podrías razonar calmadamente en ese momento? ¿Podrías 'calmarte' si alguien te lo ordenara?",
            "Ahora abre los ojos. Esto es lo que vive tu hijo en berrinche."
        ],
        whatYoullFeel: "Sentirás que tu cuerpo está en control, no tu mente lógica. Que 'calmarte' no es simplemente decidirlo. Que razonar es IMPOSIBLE en ese estado. Que necesitas tiempo y regulación para que tu cerebro superior vuelva online.",
        parallelToChild: "Cuando tu hijo tiene berrinche, su amígdala está secuestrando su cerebro EXACTAMENTE como la tuya en ese susto. Decirle 'cálmate' es tan inútil como si alguien te lo dijera después del casi-accidente. Primero su sistema nervioso debe regularse. LUEGO puede razonar.",
        insight: "No puedes razonar con cerebro inferior activado - ni el tuyo ni el de tu hijo. Este entendimiento visceral (no solo intelectual) cambiará completamente cómo respondes a berrinches. Ya no dirás 'Cálmate'; dirás 'Estoy aquí' y ESPERARÁS.",
        icon: "bolt.trianglebadge.exclamationmark.fill",
        color: "red"
    ),
    
    CN8Simulation(
        title: "Vive un Día con Cerebro de 4 Años",
        description: "Experimenta limitaciones del cerebro preescolar",
        scenario: "Vas a vivir situaciones diarias pero SOLO puedes usar hemisferio derecho emocional (sin lógica adulta)",
        instructions: [
            "Durante 1 hora, responde a situaciones SOLO con emoción, sin razonar",
            "Si algo sale mal (café se derrama): NO razones 'no pasa nada'. SIENTE la frustración totalmente",
            "Si alguien te dice 'Date prisa': SIENTE la presión sin poder planificar eficientemente",
            "Si algo no sale como esperabas (calcetín equivocado): SIENTE la decepción como si fuera enorme",
            "Observa: sin acceso a razonamiento, TODO se siente más intenso",
            "Nota cuánto necesitas que alguien valide tu emoción vs. te diga 'no es gran cosa'"
        ],
        whatYoullFeel: "Te sentirás abrumado, irracional, emocionalmente intenso. Pequeñas cosas se sentirán grandes. Querrás que alguien ENTIENDA cómo te sientes, no que te explique por qué no deberías sentirlo.",
        parallelToChild: "Tu hijo de 4 años vive TODO con hemisferio derecho dominando. Por eso el sándwich cortado es tragedia. Por eso no encontrar el calcetín favorito es crisis. Para TI es irracional. Para ÉL es su realidad emocional completa. Necesita validación, no lógica.",
        insight: "Los berrinches 'irracionales' tienen sentido perfecto desde cerebro de niño pequeño. No está siendo difícil; está siendo dominado por hemisferio derecho. Tu empatía visceral (no solo intelectual) transformará tu paciencia.",
        icon: "figure.child.circle.fill",
        color: "pink"
    ),
    
    CN8Simulation(
        title: "Intenta Usar Solo Cerebro Superior Sin el Inferior",
        description: "Siente qué pasa cuando separas lógica de emoción/cuerpo",
        scenario: "Vas a intentar razonar sin acceso a intuición, emoción, o sensaciones corporales",
        instructions: [
            "Alguien te cuenta un problema emocional (amigo, pareja)",
            "Responde SOLO con lógica: datos, soluciones prácticas, pasos a seguir",
            "NO valides emoción, NO uses intuición, NO menciones cómo se siente",
            "Observa la reacción: ¿se sienten escuchados? ¿Conectados?",
            "Ahora invierte: solo valida emoción sin ofrecer solución",
            "¿Cuál se sintió más conectado?"
        ],
        whatYoullFeel: "Te sentirás desconectado cuando solo usas lógica. La otra persona se sentirá no escuchada. Cuando solo validas sin lógica, a veces es suficiente. La CONEXIÓN emocional es primaria; solución lógica es secundaria.",
        parallelToChild: "Cuando tu hijo está alterado y tú saltas a soluciones lógicas ('No llores, solo es...'), estás usando tu cerebro superior ignorando su cerebro derecho emocional. Primero necesita sentirse CONECTADO emocionalmente. LUEGO puede procesar lógica. Conexión antes que corrección.",
        insight: "Integración cerebral significa ambos trabajando juntos. Cuando vas directo a lógica con niño emocional, estás pidiendo solo cerebro superior cuando el suyo está offline. Primero conecta emocionalmente (activa su hemisferio derecho), luego lógica funciona.",
        icon: "brain.head.profile.fill",
        color: "purple"
    )
]

