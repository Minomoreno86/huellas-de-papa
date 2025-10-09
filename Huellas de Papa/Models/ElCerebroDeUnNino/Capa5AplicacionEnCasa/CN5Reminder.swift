import Foundation

/// Recordatorios rápidos para momentos específicos del día
struct CN5Reminder: Codable, Identifiable {
    let id: UUID
    let moment: String              // "Antes de salir", "Durante berrinche", etc.
    let reminder: String            // El recordatorio específico
    let strategy: Int               // Estrategia relacionada
    let quickAction: String         // Acción rápida que pueden hacer
    
    init(moment: String, reminder: String, strategy: Int, quickAction: String) {
        self.id = UUID()
        self.moment = moment
        self.reminder = reminder
        self.strategy = strategy
        self.quickAction = quickAction
    }
}

/// Recordatorios para momentos clave del día
let cn5Reminders: [CN5Reminder] = [
    CN5Reminder(
        moment: "Al despertar",
        reminder: "Conecta ANTES de demandar. Los primeros 5 minutos establecen el tono del día.",
        strategy: 1,
        quickAction: "Abrazo + 'Buenos días, mi amor' antes de cualquier orden"
    ),
    CN5Reminder(
        moment: "Durante berrinche",
        reminder: "No puedes razonar con cerebro inferior activado. Primero calma, luego habla.",
        strategy: 1,
        quickAction: "Arrodíllate, respira con él, presencia física calmada. ESPERA señales de calma."
    ),
    CN5Reminder(
        moment: "Antes de corregir",
        reminder: "Conecta primero (hemisferio derecho), redirige después (hemisferio izquierdo).",
        strategy: 1,
        quickAction: "PAUSA. Valida la emoción. LUEGO redirige el comportamiento."
    ),
    CN5Reminder(
        moment: "Cuando está abrumado",
        reminder: "Nombra para dominar. Poner palabras a la emoción reduce su intensidad.",
        strategy: 2,
        quickAction: "'Veo que estás muy [emoción]. Cuéntame qué pasó.' Escucha activamente."
    ),
    CN5Reminder(
        moment: "Al dar instrucciones",
        reminder: "Opciones involucran cerebro superior. Órdenes activan cerebro inferior.",
        strategy: 3,
        quickAction: "Transforma orden en opciones: '¿A o B?' en vez de 'Haz A ahora'"
    ),
    CN5Reminder(
        moment: "En transiciones",
        reminder: "El cerebro necesita preparación para cambios. Avisos anticipados activan corteza prefrontal.",
        strategy: 3,
        quickAction: "Aviso 5-10 min antes: 'En 5 minutos vamos a [actividad]. ¿Qué necesitas terminar?'"
    ),
    CN5Reminder(
        moment: "Cuando está frustrado",
        reminder: "Mover el cuerpo cambia el estado mental. Movimiento resetea química cerebral.",
        strategy: 5,
        quickAction: "'Bailemos 2 minutos' o 'Saltemos 10 veces juntos'"
    ),
    CN5Reminder(
        moment: "Después de experiencia difícil",
        reminder: "Memorias no procesadas se quedan como trauma implícito. Ayuda a contar la historia.",
        strategy: 7,
        quickAction: "'Cuéntame qué pasó. ¿Qué pasó primero? ¿Luego qué? ¿Y al final?'"
    ),
    CN5Reminder(
        moment: "En emociones intensas",
        reminder: "Las emociones son temporales como nubes. Vendrán y pasarán.",
        strategy: 8,
        quickAction: "'Esta emoción es una nube grande ahora. Vamos a respirar y ver cómo pasa.'"
    ),
    CN5Reminder(
        moment: "Después de conflicto",
        reminder: "Las rupturas son normales. Lo que importa es la reparación. SIEMPRE repara.",
        strategy: 12,
        quickAction: "Arrodíllate: 'Grité y eso estuvo mal. Lo siento. ¿Qué necesitabas?' Abraza."
    ),
    CN5Reminder(
        moment: "Antes de dormir",
        reminder: "Nunca dejes que el día termine con ruptura sin reparar. Cierra con conexión.",
        strategy: 12,
        quickAction: "'¿Tuvimos algún momento difícil hoy? Vamos a reparar.' + abrazo + 'Te amo'"
    ),
    CN5Reminder(
        moment: "Cuando TÚ estás frustrado",
        reminder: "No puedes co-regular si tú mismo estás desregulado. Primero calma TU cerebro.",
        strategy: 5,
        quickAction: "PAUSA. 5 respiraciones profundas. Movimiento si es necesario. LUEGO responde."
    )
]

