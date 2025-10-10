import SwiftUI

// MARK: - ACTIVIDADES RÁPIDAS Y RECORDATORIOS
extension BM5View {
    var quickActivities: [BM5Activity] {
        [
            BM5Activity(
                title: "Tiempo de Brazos sin Objetivo",
                description: "30 minutos de simplemente cargar y abrazar a tu bebé sin hacer nada más. Solo contacto, presencia, amor.",
                duration: "30 minutos",
                steps: [
                    "Siéntate cómodamente con tu bebé en brazos",
                    "Apaga el móvil, desconecta",
                    "Solo abraza, mece suavemente, habla",
                    "No hagas nada 'productivo', solo estar",
                    "Disfruta el momento presente"
                ],
                benefits: [
                    "Fortalece vínculo inmediatamente",
                    "Bebé se siente amado y seguro",
                    "Tú te conectas emocionalmente",
                    "Reduce estrés de ambos"
                ],
                ageRange: "0-3 años",
                category: .contact
            ),
            BM5Activity(
                title: "Lectura en el Regazo",
                description: "Leer cuentos con el niño en tu regazo, contacto físico constante, voz tranquila.",
                duration: "15-30 minutos",
                steps: [
                    "Elige 2-3 cuentos que le gusten",
                    "Siéntate cómodamente, niño en tu regazo",
                    "Lee con calma, señala dibujos",
                    "Contacto físico durante toda la lectura",
                    "Pregúntale, interactúa, disfruta"
                ],
                benefits: [
                    "Contacto + estimulación cognitiva",
                    "Asocia lectura con amor y cercanía",
                    "Desarrollo del lenguaje",
                    "Momento de conexión especial"
                ],
                ageRange: "1-6 años",
                category: .contact
            ),
            BM5Activity(
                title: "Masaje Infantil con Aceite",
                description: "Masaje relajante con contacto amoroso, especialmente bueno antes de dormir.",
                duration: "20 minutos",
                steps: [
                    "Aceite tibio (coco, almendras)",
                    "Ambiente cálido, música suave",
                    "Masaje suave en piernas, brazos, espalda",
                    "Contacto visual, hablar/cantar",
                    "Finalizar con abrazo"
                ],
                benefits: [
                    "Relajación profunda",
                    "Contacto piel con piel",
                    "Facilita el sueño posterior",
                    "Vínculo fortalecido"
                ],
                ageRange: "0-2 años",
                category: .contact
            ),
            BM5Activity(
                title: "Baño Compartido Relajante",
                description: "Bañarse juntos, juego acuático, contacto en ambiente relajado.",
                duration: "20-30 minutos",
                steps: [
                    "Agua tibia, luces tenues",
                    "Entra con el bebé en tus brazos",
                    "Juega, chapotea, lava con cariño",
                    "Contacto piel con piel en agua",
                    "Salir juntos, secar con calma"
                ],
                benefits: [
                    "Contacto piel con piel relajante",
                    "Bebé disfruta agua con seguridad",
                    "Momento de juego compartido",
                    "Prepara para sueño"
                ],
                ageRange: "0-4 años",
                category: .contact
            ),
            BM5Activity(
                title: "Juego Libre en el Suelo",
                description: "30-60 minutos de juego sin agenda, siguiendo la iniciativa del niño.",
                duration: "30-60 minutos",
                steps: [
                    "Baja al suelo con tu hijo",
                    "Sin pantallas, sin distracciones",
                    "Sigue SU iniciativa de juego",
                    "Contacto físico frecuente (abrazos, cosquillas)",
                    "Risas, diversión, presencia plena"
                ],
                benefits: [
                    "Atención plena del adulto",
                    "Niño se siente valioso e importante",
                    "Desarrollo de imaginación",
                    "Vínculo fortalecido mediante juego"
                ],
                ageRange: "1-6 años",
                category: .contact
            ),
            BM5Activity(
                title: "Toma de Pecho como Consuelo",
                description: "Usar la lactancia no solo como alimento sino como herramienta de consuelo ante cualquier malestar.",
                duration: "10-20 minutos",
                steps: [
                    "Ante llanto/malestar: ofrece pecho",
                    "No solo cuando 'toca' comer",
                    "Pecho por: dolor, susto, tristeza, aburrimiento",
                    "Todo es válido, no hay 'mal uso'",
                    "El pecho es alimento Y consuelo"
                ],
                benefits: [
                    "Calma inmediata ante malestares",
                    "Niño aprende a autorregularse",
                    "Vínculo reforzado",
                    "Menos estrés para ambos"
                ],
                ageRange: "0-3 años",
                category: .feeding
            )
        ]
    }
    
    var reminders: [BM5Reminder] {
        [
            BM5Reminder(
                quote: "Si llora, es porque me necesita (no manipula)",
                context: "Para recordar cuando dudes si responder"
            ),
            BM5Reminder(
                quote: "El amor nunca malcría",
                context: "Para contrarrestar críticas externas"
            ),
            BM5Reminder(
                quote: "Cada niño tiene su ritmo",
                context: "Para no comparar ni presionar"
            ),
            BM5Reminder(
                quote: "Mis brazos son su hábitat natural",
                context: "Para no sentir culpa al cargarlo"
            ),
            BM5Reminder(
                quote: "El colecho es normal y seguro",
                context: "Para validar tu decisión de dormir juntos"
            ),
            BM5Reminder(
                quote: "La lactancia no tiene horarios",
                context: "Para ignorar relojes y consejos rígidos"
            ),
            BM5Reminder(
                quote: "La independencia se consigue, no se enseña",
                context: "Para no forzar separaciones"
            ),
            BM5Reminder(
                quote: "Los niños no se acostumbran, se resignan",
                context: "Para no dejar llorar"
            )
        ]
    }
}

