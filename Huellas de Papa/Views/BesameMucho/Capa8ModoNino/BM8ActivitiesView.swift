import SwiftUI

/// Vista de actividades para hacer con niños
struct BM8ActivitiesView: View {
    let activities = activitiesData + activitiesData2
    @State private var selectedActivity: BM8Activity?
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                ForEach(activities) { activity in
                    Button(action: {
                        selectedActivity = activity
                    }) {
                        BM8ActivityCard(activity: activity)
                    }
                }
            }
            .padding()
        }
        .background(Color(.systemGroupedBackground))
        .navigationTitle("Actividades")
        .sheet(item: $selectedActivity) { activity in
            BM8ActivityDetailView(activity: activity)
        }
    }
}

// MARK: - BM8 Activity Card
struct BM8ActivityCard: View {
    let activity: BM8Activity
    
    var body: some View {
        HStack(spacing: 16) {
            Image(systemName: activity.icon)
                .font(.system(size: 35))
                .foregroundColor(.white)
                .frame(width: 70, height: 70)
                .background(
                    RoundedRectangle(cornerRadius: 14)
                        .fill(colorFromString(activity.color))
                )
            
            VStack(alignment: .leading, spacing: 8) {
                Text(activity.title)
                    .font(.headline)
                    .fontWeight(.semibold)
                    .foregroundColor(.primary)
                    .lineLimit(2)
                
                Text(activity.description)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                    .lineLimit(2)
                
                HStack {
                    Label(activity.duration, systemImage: "clock")
                        .font(.caption)
                        .foregroundColor(.blue)
                    
                    Spacer()
                    
                    Label(activity.ageRange, systemImage: "person.fill")
                        .font(.caption)
                        .foregroundColor(.orange)
                }
            }
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 18)
                .fill(Color(.systemBackground))
                .shadow(color: colorFromString(activity.color).opacity(0.2), radius: 8, x: 0, y: 4)
        )
    }
    
    private func colorFromString(_ colorString: String) -> Color {
        switch colorString {
        case "blue": return .blue
        case "pink": return .pink
        case "mint": return .mint
        case "orange": return .orange
        case "purple": return .purple
        case "green": return .green
        default: return .blue
        }
    }
}

// MARK: - BM8 Activity Detail View
struct BM8ActivityDetailView: View {
    let activity: BM8Activity
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 24) {
                    // Header
                    HStack {
                        Image(systemName: activity.icon)
                            .font(.system(size: 50))
                            .foregroundColor(colorFromString(activity.color))
                        
                        VStack(alignment: .leading, spacing: 4) {
                            Text(activity.title)
                                .font(.title2)
                                .fontWeight(.bold)
                            
                            HStack {
                                Label(activity.duration, systemImage: "clock")
                                    .font(.caption)
                                Label(activity.ageRange, systemImage: "person.fill")
                                    .font(.caption)
                            }
                            .foregroundColor(.secondary)
                        }
                    }
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(
                        RoundedRectangle(cornerRadius: 16)
                            .fill(colorFromString(activity.color).opacity(0.1))
                    )
                    
                    // Description
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Descripción")
                            .font(.headline)
                        Text(activity.description)
                            .font(.body)
                            .foregroundColor(.secondary)
                    }
                    
                    // Materials
                    VStack(alignment: .leading, spacing: 12) {
                        Text("Materiales")
                            .font(.headline)
                        ForEach(activity.materials, id: \.self) { material in
                            HStack {
                                Image(systemName: "checkmark.circle.fill")
                                    .foregroundColor(.green)
                                Text(material)
                                    .font(.body)
                            }
                        }
                    }
                    
                    // Steps
                    VStack(alignment: .leading, spacing: 16) {
                        Text("Pasos")
                            .font(.headline)
                        ForEach(activity.steps) { step in
                            VStack(alignment: .leading, spacing: 8) {
                                HStack(alignment: .top, spacing: 12) {
                                    Text("\(step.stepNumber)")
                                        .font(.title3)
                                        .fontWeight(.bold)
                                        .foregroundColor(.white)
                                        .frame(width: 32, height: 32)
                                        .background(Circle().fill(colorFromString(activity.color)))
                                    
                                    VStack(alignment: .leading, spacing: 4) {
                                        Text(step.instruction)
                                            .font(.body)
                                            .foregroundColor(.primary)
                                        
                                        if let tip = step.tip {
                                            Text("💡 \(tip)")
                                                .font(.caption)
                                                .foregroundColor(.blue)
                                                .italic()
                                        }
                                    }
                                }
                            }
                            .padding()
                            .background(
                                RoundedRectangle(cornerRadius: 12)
                                    .fill(Color(.secondarySystemGroupedBackground))
                            )
                        }
                    }
                }
                .padding()
            }
            .background(Color(.systemGroupedBackground))
            .navigationTitle("Actividad")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Cerrar") {
                        dismiss()
                    }
                }
            }
        }
    }
    
    private func colorFromString(_ colorString: String) -> Color {
        switch colorString {
        case "blue": return .blue
        case "pink": return .pink
        case "mint": return .mint
        case "orange": return .orange
        case "purple": return .purple
        case "green": return .green
        default: return .blue
        }
    }
}

// MARK: - ACTIVITIES DATA
let activitiesData: [BM8Activity] = [
    BM8Activity(
        number: 1,
        title: "Libro de Abrazos Familiar",
        icon: "book.closed.fill",
        color: "blue",
        description: "Crear un álbum especial que celebra los momentos de apego y conexión de tu familia",
        materials: [
            "Cuaderno grande o álbum de fotos (puede ser uno simple)",
            "Fotos impresas de momentos familiares (10-15 fotos)",
            "Pegamento o cinta adhesiva",
            "Colores, marcadores o crayones",
            "Stickers bonitos (opcional pero divertido)",
            "Brillantina o calcomanías de corazones (opcional)"
        ],
        steps: [
            ActivityStep(
                stepNumber: 1,
                instruction: "Busca fotos especiales donde estén abrazados, en colecho, en brazos, amamantando, jugando juntos. No necesitan ser fotos 'perfectas' de estudio. Las mejores son las espontáneas, las reales",
                tip: "Revisa tu celular. Seguro tienes muchas fotos cotidianas hermosas que normalmente ignoras"
            ),
            ActivityStep(
                stepNumber: 2,
                instruction: "Imprime 10-15 fotos (puedes hacerlo en cualquier tienda o en casa). Si no tienes impresora, incluso puedes dibujar los momentos especiales",
                tip: "Si tu hijo es muy pequeño, las fotos grandes son mejores (más fáciles de ver)"
            ),
            ActivityStep(
                stepNumber: 3,
                instruction: "Siéntate con tu hijo en un momento tranquilo. Muéstrale el cuaderno vacío y dile: 'Vamos a hacer algo muy especial juntos. Un libro de todos los abrazos y momentos de amor de nuestra familia'",
                tip: "Usa un tono emocionado. Tu entusiasmo es contagioso"
            ),
            ActivityStep(
                stepNumber: 4,
                instruction: "Pega una foto en cada página. Mientras lo hacen, pregúntale: '¿Te acuerdas de este día? ¿Qué sentías aquí? ¿Estabas feliz?'. Escucha sus respuestas sin apurar",
                tip: "Esto activa la memoria afectiva positiva. Está recordando momentos felices"
            ),
            ActivityStep(
                stepNumber: 5,
                instruction: "Debajo de cada foto, escribe (o que él dicte) una frase corta sobre ese momento. Ejemplo: 'Aquí papá me abraza fuerte' o 'Este día dormimos juntos toda la noche'",
                tip: "Si tu hijo no sabe escribir, que dibuje corazones o lo que quiera alrededor"
            ),
            ActivityStep(
                stepNumber: 6,
                instruction: "Decoren juntos cada página. Corazones, estrellas, arcoíris, brillantina. Dejen que tu hijo sea creativo. No corrijas su 'técnica'. El proceso importa más que el resultado",
                tip: "Si se sale de las líneas, si usa muchos colores juntos, ¡perfecto! Es SU libro"
            ),
            ActivityStep(
                stepNumber: 7,
                instruction: "Cuando terminen el libro (puede ser en una sesión o en varios días), creen una página final especial. Peguen una foto reciente de ustedes y escriban: 'Nuestra familia se ama con abrazos, besos y mucho contacto. Y eso está BIEN'",
                tip: "Esta página final es la moraleja del 'libro'"
            ),
            ActivityStep(
                stepNumber: 8,
                instruction: "Pongan el libro en un lugar especial accesible para tu hijo. Léanlo juntos regularmente, especialmente cuando él necesite reconexión o cuando tú necesites recordar por qué haces crianza con apego",
                tip: "En días difíciles, abrir este libro recuerda a ambos el amor que se tienen"
            )
        ],
        ageRange: "3-8 años",
        duration: "45-60 min (puede dividirse en sesiones)",
        category: .crafts
    ),
    
    BM8Activity(
        number: 2,
        title: "Termómetro de Emociones",
        icon: "thermometer.medium",
        color: "orange",
        description: "Herramienta visual para que tu hijo identifique, nombre y exprese sus emociones diarias",
        materials: [
            "Cartulina blanca grande (tamaño carta o más grande)",
            "Marcadores de colores (verde, amarillo, naranja, rojo, azul)",
            "Fotos pequeñas de tu hijo con diferentes expresiones (o dibujen caritas)",
            "Una pinza para ropa o clip grande",
            "Regla (para dibujar recto)",
            "Cinta adhesiva o velcro para pegar en la pared"
        ],
        steps: [
            ActivityStep(
                stepNumber: 1,
                instruction: "Dibuja un termómetro grande y vertical en el centro de la cartulina. Hazlo ancho (unos 8-10 cm) para que quede espacio para decorar",
                tip: "No tiene que ser perfecto. Incluso puedes pedirle a tu hijo que te ayude a dibujarlo"
            ),
            ActivityStep(
                stepNumber: 2,
                instruction: "Divide el termómetro en 5 secciones de arriba hacia abajo: 1-Muy Feliz (verde), 2-Contento (amarillo), 3-Normal (naranja claro), 4-Triste (azul), 5-Muy Enojado (rojo). Pinta cada sección con su color",
                tip: "Los colores ayudan a los niños a asociar visualmente las emociones"
            ),
            ActivityStep(
                stepNumber: 3,
                instruction: "En cada sección, pega o dibuja una carita que represente esa emoción. Puedes usar fotos de tu hijo haciendo esas caras (¡súper efectivo!) o dibujar caritas simples",
                tip: "Usar fotos reales de tu hijo hace que se identifique más con las emociones"
            ),
            ActivityStep(
                stepNumber: 4,
                instruction: "Escribe al lado de cada sección palabras que describan esa emoción. Ejemplo: En 'Muy Feliz' escribe: alegre, emocionado, saltarín. En 'Muy Enojado': frustrado, molesto, furioso",
                tip: "Esto expande el vocabulario emocional de tu hijo"
            ),
            ActivityStep(
                stepNumber: 5,
                instruction: "Decoren el termómetro juntos. Agreguen dibujos alrededor: soles, nubes, corazones, rayos. Que sea colorido y atractivo. Déjalo que ponga su toque personal",
                tip: "Mientras decoran, hablen sobre las emociones: '¿Cuándo te has sentido muy feliz?'"
            ),
            ActivityStep(
                stepNumber: 6,
                instruction: "Coloca el termómetro en un lugar muy visible: la cocina, su habitación, o la sala. Debe estar a su altura para que pueda verlo y tocarlo fácilmente",
                tip: "Si está a su altura, él mismo puede mover la pinza sin ayuda"
            ),
            ActivityStep(
                stepNumber: 7,
                instruction: "Cada día, idealmente en 2 momentos (mañana y noche), pregúntale: '¿Cómo te sientes hoy?' y dejen que mueva la pinza a la emoción correspondiente. Pregunta: '¿Por qué te sientes así?'",
                tip: "Tú también mueve tu propia pinza. Modela la expresión emocional saludable"
            ),
            ActivityStep(
                stepNumber: 8,
                instruction: "Si está en una emoción 'negativa' (triste, enojado), NO intentes cambiarlo. Solo valida: 'Veo que hoy estás triste. Está bien. ¿Quieres contarme qué pasó?'. Las emociones negativas son VÁLIDAS",
                tip: "El objetivo NO es que esté siempre feliz, sino que identifique y exprese lo que siente"
            ),
            ActivityStep(
                stepNumber: 9,
                instruction: "Usa el termómetro como herramienta de comunicación. En lugar de preguntar '¿cómo estás?', pregunta '¿en qué parte del termómetro estás?'. Para niños pequeños es más fácil señalar que verbalizar",
                tip: "Es especialmente útil cuando está muy alterado y no puede hablar"
            )
        ],
        ageRange: "3-7 años",
        duration: "30-40 min creación + uso diario",
        category: .crafts
    ),
    
    BM8Activity(
        number: 3,
        title: "Canción de Nuestra Familia",
        icon: "music.note",
        color: "purple",
        description: "Crear una canción única y especial para el ritual de dormir o momentos de conexión",
        materials: [
            "Solo necesitas tu voz, tu creatividad y tiempo con tu hijo",
            "Opcional: grabadora del celular para guardar la canción"
        ],
        steps: [
            ActivityStep(
                stepNumber: 1,
                instruction: "Elige un momento tranquilo, idealmente antes de dormir cuando están en la cama juntos. La luz tenue y el ambiente relajado ayudan a la creatividad",
                tip: "Apaga pantallas. Este es tiempo sagrado de conexión"
            ),
            ActivityStep(
                stepNumber: 2,
                instruction: "Pregúntale a tu hijo: '¿Qué cosas te hacen sentir seguro cuando vas a dormir?'. Escucha sus respuestas. Pueden ser: mamá, papá, la cama grande, los abrazos, la oscuridad, su peluche favorito",
                tip: "Anota mentalmente sus respuestas. Esas palabras irán en la canción"
            ),
            ActivityStep(
                stepNumber: 3,
                instruction: "Pregúntale también: '¿Qué es lo que más te gusta de nuestra familia?'. Puede decir: que jugamos, que nos abrazamos, que dormimos juntos, que mamá me da leche (teta)",
                tip: "No juzgues sus respuestas. Todo es válido"
            ),
            ActivityStep(
                stepNumber: 4,
                instruction: "Ahora creen la canción juntos. Puede ser con una melodía conocida (como 'Estrellita dónde estás' o 'Arroz con leche') o inventada. Empieza tú con un verso usando sus palabras: 'En nuestra cama grande, dormimos los tres...'",
                tip: "No tiene que rimar perfectamente. Lo importante es que incluya SUS palabras"
            ),
            ActivityStep(
                stepNumber: 5,
                instruction: "Deja que tu hijo agregue versos también. Puede decir cosas como: 'Papá me abraza fuerte' o 'Mamá me da besitos'. Repite su verso cantando. Celebra su creatividad",
                tip: "Aunque no tenga sentido 'poético', si es de su corazón, es perfecto"
            ),
            ActivityStep(
                stepNumber: 6,
                instruction: "Canten la canción completa juntos varias veces hasta que se la aprendan. Pueden ser 4-6 versos cortos. Nada complicado. Simple y dulce",
                tip: "Graba la canción en tu celular para no olvidarla"
            ),
            ActivityStep(
                stepNumber: 7,
                instruction: "Conviertan esta canción en su RITUAL de cada noche. Antes de dormir, cántenla juntos. Puede ser en voz alta o en susurros. Acurrucados en la cama grande",
                tip: "La repetición crea seguridad. Sabrá que después de la canción viene dormir seguro"
            ),
            ActivityStep(
                stepNumber: 8,
                instruction: "Con el tiempo, pueden ir agregando versos nuevos según vayan creciendo o cambiando cosas en la familia. La canción evoluciona con ustedes",
                tip: "Años después, tu hijo recordará esta canción con amor. Es un regalo para siempre"
            )
        ],
        ageRange: "2-6 años",
        duration: "15-20 min + uso diario",
        category: .music
    ),
    
    BM8Activity(
        number: 4,
        title: "Masaje del Amor Infinito",
        icon: "hand.raised.fill",
        color: "mint",
        description: "Técnica de masaje infantil para fortalecer el vínculo físico y emocional con tu hijo",
        materials: [
            "Aceite de bebé, de almendras o crema hidratante (sin perfume fuerte)",
            "Lugar cómodo y cálido (cama, alfombra con manta)",
            "Toalla suave",
            "Música relajante de fondo (opcional)",
            "15-20 minutos sin interrupciones"
        ],
        steps: [
            ActivityStep(
                stepNumber: 1,
                instruction: "Elige el momento ideal: después del baño, antes de dormir, o cuando tu hijo esté tranquilo. NO cuando esté cansado o con hambre. Pregúntale: '¿Quieres un masaje especial de papá/mamá?'",
                tip: "El CONSENTIMIENTO es crucial. Si dice no, respeta. Ofrece otro día"
            ),
            ActivityStep(
                stepNumber: 2,
                instruction: "Prepara el ambiente: temperatura agradable (ni frío ni calor), luz tenue, sin ruidos fuertes. Pon una toalla donde se va a acostar. Quítale la ropa (deja pañal/ropa interior si prefiere)",
                tip: "El ambiente tranquilo ayuda a la relajación de ambos"
            ),
            ActivityStep(
                stepNumber: 3,
                instruction: "Calienta tus manos frotándolas entre sí por 10 segundos. Luego pon un poco de aceite en tus palmas y frótalas de nuevo. Las manos deben estar tibias, nunca frías",
                tip: "Manos frías pueden asustar al bebé. Siempre calentar primero"
            ),
            ActivityStep(
                stepNumber: 4,
                instruction: "Comienza por las piernitas. Con movimientos suaves pero firmes, masajea desde el muslo hasta el pie. Primero una pierna, luego la otra. Habla mientras lo haces: 'Estas son las piernitas de mi bebé. Te amo tanto'",
                tip: "La presión debe ser gentil pero presente. Muy suave puede hacer cosquillas"
            ),
            ActivityStep(
                stepNumber: 5,
                instruction: "Continúa con los bracitos. Desde el hombro hasta las manitas. Masajea cada dedito con cuidado. Di cosas como: 'Con estas manitas me abrazas. Con estas manitas juegas. Qué manitas tan especiales'",
                tip: "El masaje + palabras amorosas es doblemente poderoso"
            ),
            ActivityStep(
                stepNumber: 6,
                instruction: "Masajea suavemente la pancita haciendo círculos en dirección de las agujas del reloj (ayuda con la digestión). Luego la espalda con movimientos largos de arriba abajo",
                tip: "Si tu hijo tiene gases o estreñimiento, el masaje de pancita ayuda mucho"
            ),
            ActivityStep(
                stepNumber: 7,
                instruction: "Termina con caricias suaves en la carita y la cabecita. Pasa tus dedos suavemente por su frente, mejillas, orejas. Muchos bebés se duermen en esta parte",
                tip: "Si tu hijo cierra los ojos y respira profundo, está totalmente relajado. ¡Éxito!"
            ),
            ActivityStep(
                stepNumber: 8,
                instruction: "Finaliza con un abrazo largo. Envuélvelo en la toalla o manta suave y abrázalo. Dile al oído: 'Te amo infinito. Eres lo más importante para mí. Gracias por dejarme hacer este masaje contigo'",
                tip: "Hazlo rutina: 2-3 veces por semana. Se convertirá en un momento que ambos esperan"
            )
        ],
        ageRange: "0-8 años",
        duration: "15-25 minutos",
        category: .movement
    ),
    
    BM8Activity(
        number: 5,
        title: "Dibujo: Mi Familia y Yo",
        icon: "pencil.tip.crop.circle.fill",
        color: "pink",
        description: "Actividad de arte que permite a tu hijo expresar cómo percibe el vínculo familiar",
        materials: [
            "Papel grande (mientras más grande, mejor - tamaño A3 ideal)",
            "Colores, crayones, pinturas o marcadores",
            "Opcional: stickers, brillantina, recortes de revistas",
            "Un lugar cómodo para dibujar (mesa o suelo)"
        ],
        steps: [
            ActivityStep(
                stepNumber: 1,
                instruction: "Invita a tu hijo a dibujar. No le des instrucciones específicas todavía. Solo di: 'Vamos a dibujar algo especial juntos'. Preparen el lugar con todos los materiales a la vista",
                tip: "Deja que elija los materiales. Esa elección ya es parte de su expresión"
            ),
            ActivityStep(
                stepNumber: 2,
                instruction: "Cuando estén listos, pídele: 'Dibuja a nuestra familia haciendo algo que te guste'. Nada más. No digas cómo, no corrijas, no sugieras. Deja que su creatividad fluya libremente",
                tip: "OBSERVA qué dibuja. Es una ventana a cómo percibe la familia"
            ),
            ActivityStep(
                stepNumber: 3,
                instruction: "Mientras dibuja, tú también dibuja (tu propia versión de la familia). Trabajen lado a lado. Esto es tiempo de calidad, no solo una actividad para mantenerlo ocupado",
                tip: "Dibujar juntos crea conexión. No importa que tu dibujo sea 'feo'"
            ),
            ActivityStep(
                stepNumber: 4,
                instruction: "Cuando termine su dibujo, NO lo evalúes ('qué bonito', 'qué feo'). En lugar de eso, hazle preguntas: '¿Me cuentas sobre tu dibujo? ¿Qué están haciendo? ¿Cómo se sienten aquí? ¿Quién es quién?'",
                tip: "Las respuestas te dirán MUCHO sobre cómo se siente en la familia"
            ),
            ActivityStep(
                stepNumber: 5,
                instruction: "Observa detalles importantes: ¿Se dibujó a sí mismo cerca o lejos de ti? ¿Se ve feliz? ¿Dibujó a todos tocándose (tomados de mano, abrazados)? ¿O separados? ¿A quién dibujó más grande?",
                tip: "Los niños expresan MUCHO en sus dibujos. Es lenguaje simbólico"
            ),
            ActivityStep(
                stepNumber: 6,
                instruction: "Ahora viene la parte mágica. Pídele: 'Vamos a agregar corazones en todos los lugares donde hay amor en tu dibujo'. Déjale que dibuje corazones donde quiera. Observa DÓNDE los pone",
                tip: "Los lugares con más corazones son donde él siente más amor"
            ),
            ActivityStep(
                stepNumber: 7,
                instruction: "Pregúntale si quiere agregar algo más: palabras, más colores, más personas, mascotas. Es SU dibujo. Debe reflejar SU visión de la familia, no la tuya",
                tip: "Si dibuja cosas 'raras', no corrijas. Pregunta qué significan"
            ),
            ActivityStep(
                stepNumber: 8,
                instruction: "Cuando termine completamente, pregúntale: '¿Dónde quieres que pongamos este dibujo?'. Cuélguenlo juntos en ese lugar especial. Puede ser la refrigeradora, su cuarto, la sala. Donde él elija",
                tip: "Colgar su dibujo es validar su expresión. Le dice: 'Lo que creaste es valioso'"
            ),
            ActivityStep(
                stepNumber: 9,
                instruction: "De vez en cuando, señala el dibujo y di: 'Me encanta este dibujo que hiciste. Me gusta que nos dibujaste juntos'. Esto refuerza su percepción positiva de la familia",
                tip: "Repite esta actividad cada 2-3 meses. Compara los dibujos. Verás evolución"
            )
        ],
        ageRange: "3-8 años",
        duration: "30-45 minutos",
        category: .drawing
    )
]
