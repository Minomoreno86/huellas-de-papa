import SwiftUI

/// Vista principal de la Capa 3 (Herramientas) del módulo Bésame Mucho
/// Presenta 10 herramientas prácticas detalladas para aplicar la crianza con apego
struct BM3View: View {
    @State private var selectedCategory: ToolCategory? = nil
    
    var body: some View {
        ScrollView {
            VStack(spacing: 32) {
                // 1. Header
                headerSection
                
                // 2. Filtro por categorías
                categoryFilterSection
                
                // 3. Grid de herramientas
                toolsGridSection
                
                // 4. Banco de frases
                phraseBankSection
                
                // 5. Errores comunes
                commonMistakesSection
                
                // 6. Frase final
                motivationalQuoteSection
            }
            .padding()
        }
        .background(Color(.systemGroupedBackground))
        .navigationTitle("Herramientas")
        .navigationBarTitleDisplayMode(.large)
    }
    
    // MARK: - 1. Header Section
    private var headerSection: some View {
        VStack(spacing: 16) {
            Text("10 Herramientas Prácticas")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundStyle(
                    LinearGradient(
                        gradient: Gradient(colors: [.blue, .mint]),
                        startPoint: .leading,
                        endPoint: .trailing
                    )
                )
            
            Text("De la teoría a la acción en la crianza con apego")
                .font(.title3)
                .fontWeight(.medium)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
            
            Text("Instrucciones detalladas paso a paso")
                .font(.subheadline)
                .foregroundColor(.blue)
                .italic()
        }
        .padding(.vertical)
    }
    
    // MARK: - 2. Category Filter
    private var categoryFilterSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Filtrar por categoría")
                .font(.headline)
                .foregroundColor(.primary)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 12) {
                    Button(action: {
                        triggerHaptic()
                        withAnimation {
                            selectedCategory = nil
                        }
                    }) {
                        Text("Todas")
                            .font(.subheadline)
                            .fontWeight(.medium)
                            .foregroundColor(selectedCategory == nil ? .white : .blue)
                            .padding(.horizontal, 16)
                            .padding(.vertical, 8)
                            .background(
                                Capsule()
                                    .fill(selectedCategory == nil ? Color.blue : Color.blue.opacity(0.1))
                            )
                    }
                    
                    ForEach([ToolCategory.sleep, .feeding, .contact, .communication, .development, .limits], id: \.self) { category in
                        Button(action: {
                            triggerHaptic()
                            withAnimation {
                                selectedCategory = category
                            }
                        }) {
                            HStack(spacing: 6) {
                                Image(systemName: category.icon)
                                Text(category.rawValue)
                            }
                            .font(.subheadline)
                            .fontWeight(.medium)
                            .foregroundColor(selectedCategory == category ? .white : colorForCategory(category))
                            .padding(.horizontal, 16)
                            .padding(.vertical, 8)
                            .background(
                                Capsule()
                                    .fill(selectedCategory == category ? colorForCategory(category) : colorForCategory(category).opacity(0.1))
                            )
                        }
                    }
                }
                .padding(.horizontal, 4)
            }
        }
    }
    
    // MARK: - 3. Tools Grid
    private var toolsGridSection: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text(selectedCategory == nil ? "Todas las Herramientas" : selectedCategory!.rawValue)
                .font(.title2)
                .fontWeight(.semibold)
                .foregroundColor(.primary)
            
            LazyVGrid(columns: [GridItem(.flexible())], spacing: 16) {
                ForEach(filteredTools) { tool in
                    BM3ToolCard(tool: tool)
                }
            }
        }
    }
    
    // MARK: - 4. Phrase Bank
    private var phraseBankSection: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Banco de Frases Útiles")
                .font(.title2)
                .fontWeight(.semibold)
                .foregroundColor(.primary)
            
            ForEach([PhraseCategory.crying, .tantrums, .externalPressure, .settingLimits, .emotionalValidation], id: \.self) { category in
                VStack(alignment: .leading, spacing: 12) {
                    Label(category.rawValue, systemImage: category.icon)
                        .font(.headline)
                        .foregroundColor(.blue)
                    
                    ForEach(phrasesFor(category: category)) { phrase in
                        VStack(alignment: .leading, spacing: 6) {
                            Text("\"\(phrase.phrase)\"")
                                .font(.body)
                                .fontWeight(.medium)
                                .foregroundColor(.primary)
                                .italic()
                            
                            Text(phrase.context)
                                .font(.caption)
                                .foregroundColor(.secondary)
                        }
                        .padding()
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .background(
                            RoundedRectangle(cornerRadius: 12)
                                .fill(Color.blue.opacity(0.05))
                        )
                    }
                }
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 16)
                        .fill(Color(.systemBackground))
                        .shadow(color: Color.blue.opacity(0.1), radius: 4, x: 0, y: 2)
                )
            }
        }
    }
    
    // MARK: - 5. Common Mistakes
    private var commonMistakesSection: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Errores Comunes a Evitar")
                .font(.title2)
                .fontWeight(.semibold)
                .foregroundColor(.primary)
            
            VStack(spacing: 12) {
                ForEach(commonMistakes) { mistake in
                    VStack(alignment: .leading, spacing: 12) {
                        HStack(alignment: .top, spacing: 12) {
                            Image(systemName: "xmark.circle.fill")
                                .foregroundColor(.red.opacity(0.7))
                                .font(.title3)
                            
                            Text(mistake.mistake)
                                .font(.body)
                                .fontWeight(.semibold)
                                .foregroundColor(.primary)
                        }
                        
                        Text(mistake.whyItsWrong)
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                        
                        Divider()
                        
                        HStack(alignment: .top, spacing: 12) {
                            Image(systemName: "checkmark.circle.fill")
                                .foregroundColor(.mint)
                                .font(.title3)
                            
                            VStack(alignment: .leading, spacing: 4) {
                                Text("Alternativa correcta:")
                                    .font(.caption)
                                    .fontWeight(.medium)
                                    .foregroundColor(.secondary)
                                
                                Text(mistake.correctAlternative)
                                    .font(.body)
                                    .foregroundColor(.primary)
                            }
                        }
                    }
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 12)
                            .fill(Color(.systemBackground))
                            .shadow(color: Color.red.opacity(0.1), radius: 4, x: 0, y: 2)
                    )
                }
            }
        }
    }
    
    // MARK: - 6. Motivational Quote
    private var motivationalQuoteSection: some View {
        VStack(spacing: 20) {
            Text("💙 Recuerda")
                .font(.headline)
                .fontWeight(.semibold)
                .foregroundColor(.primary)
            
            VStack(spacing: 12) {
                Text("\"No hay que enseñar a los niños, hay que amarlos. Lo demás viene solo.\"")
                    .font(.title3)
                    .fontWeight(.medium)
                    .foregroundColor(.primary)
                    .multilineTextAlignment(.center)
                    .italic()
                
                Text("— Carlos González")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
            .padding(.vertical, 24)
            .padding(.horizontal, 20)
            .background(
                RoundedRectangle(cornerRadius: 16)
                    .fill(
                        LinearGradient(
                            gradient: Gradient(colors: [
                                Color.blue.opacity(0.1),
                                Color.mint.opacity(0.05)
                            ]),
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                    )
                    .overlay(
                        RoundedRectangle(cornerRadius: 16)
                            .stroke(
                                LinearGradient(
                                    gradient: Gradient(colors: [
                                        Color.blue.opacity(0.3),
                                        Color.mint.opacity(0.2)
                                    ]),
                                    startPoint: .topLeading,
                                    endPoint: .bottomTrailing
                                ),
                                lineWidth: 1
                            )
                    )
            )
            .shadow(color: Color.blue.opacity(0.1), radius: 8, x: 0, y: 4)
        }
    }
    
    // MARK: - Computed Properties
    private var filteredTools: [BM3Tool] {
        if let selectedCategory = selectedCategory {
            return allTools.filter { $0.category == selectedCategory }
        }
        return allTools
    }
    
    private func phrasesFor(category: PhraseCategory) -> [BM3Phrase] {
        return allPhrases.filter { $0.situation == category }
    }
    
    // MARK: - Data: LAS 10 HERRAMIENTAS COMPLETAS
    private var allTools: [BM3Tool] {
        [
            // HERRAMIENTA 1: Colecho Seguro
            BM3Tool(
                number: 1,
                title: "Cómo Practicar el Colecho Seguro",
                whatItIs: "El colecho es dormir con tu bebé en la misma cama. Carlos González explica que es la práctica más natural y común en la humanidad durante 200,000 años. Las cunas en habitaciones separadas son un invento reciente de los últimos 100-200 años en países occidentales ricos.",
                whyItWorks: "Los bebés regulan su temperatura corporal con el calor de la madre • Se sincronizan los ciclos de sueño madre-bebé • La lactancia nocturna es más fácil sin levantarse • El bebé se despierta menos porque siente la presencia materna • La madre detecta problemas rápidamente (fiebre, dificultad respiratoria) • Reduce el riesgo de muerte súbita cuando se practica correctamente",
                howToSteps: [
                    "PREPARAR LA CAMA: Colchón firme (no blando ni hundido), sin almohadas cerca del bebé, sin edredones pesados, bebé entre la madre y la pared (nunca entre ambos padres al principio), espacio suficiente para todos",
                    "CONDICIONES DE SEGURIDAD: NUNCA si la madre ha bebido alcohol, NUNCA si ha consumido drogas o medicamentos que den sueño, NUNCA si alguno fuma (aumenta riesgo muerte súbita), NUNCA en sofás, sillones o camas de agua, no sobrecalentar la habitación",
                    "POSICIÓN DEL BEBÉ: Boca arriba siempre, a la altura del pecho de la madre, sin ropa excesiva (no sobrecalentarlo), cabeza despejada sin almohadas cerca",
                    "OBSERVAR Y AJUSTAR: Comprobar que el bebé respira bien, que tiene espacio, que no está muy tapado, que la temperatura es adecuada"
                ],
                specificBenefits: [
                    "Madre descansa más (no se levanta 5-8 veces por noche)",
                    "Bebé llora menos",
                    "Lactancia más exitosa y prolongada",
                    "Mejor regulación térmica del bebé",
                    "Menor riesgo de depresión postparto en la madre",
                    "Vínculo fortalecido"
                ],
                mythsDebunked: [
                    "El colecho causa muerte súbita → FALSO. Bien practicado la reduce",
                    "Nunca saldrá de tu cama → FALSO. Todos se independizan eventualmente",
                    "Arruinará tu vida sexual → FALSO. Hay otros momentos y lugares",
                    "Lo estás malcriando → FALSO. Es una necesidad biológica"
                ],
                whenToApply: "Desde el nacimiento hasta que el niño decida dormir solo (usualmente entre 2-5 años, cada niño es diferente).",
                category: .sleep
            ),
            
            // HERRAMIENTA 2: Lactancia a Demanda
            BM3Tool(
                number: 2,
                title: "Lactancia a Demanda sin Horarios",
                whatItIs: "Amamantar cuando el bebé lo pide, las veces que lo pida, el tiempo que quiera. Carlos González critica duramente los horarios rígidos (cada 3 horas, 10 minutos por pecho) como arbitrarios, innecesarios y contraproducentes.",
                whyItWorks: "La leche materna se digiere en 90 minutos (más rápido que la fórmula) • La composición de la leche cambia durante la toma (al inicio más aguada, al final más grasa) • La producción se regula por oferta-demanda: más tomas = más leche • Los bebés maman por hambre, sed, sueño, dolor, aburrimiento, miedo... todo es válido • No hay 'malas costumbres', hay necesidades reales",
                howToSteps: [
                    "RECONOCER SEÑALES DE HAMBRE (NO esperar al llanto): Busca con la boca, chupa sus manos, mueve la cabeza de lado a lado, hace ruiditos, se lleva las manos a la boca. El llanto es la ÚLTIMA señal, no la primera.",
                    "DURANTE LA TOMA: Deja que mame el tiempo que quiera del primer pecho (puede ser 5, 20 o 40 minutos). No cuentes minutos. Cuando suelte, ofrece el otro pecho. Si no quiere el segundo, no pasa nada. Puede querer solo un pecho, o ambos, o volver al primero.",
                    "FRECUENCIA SIN LÍMITES: Puede ser cada hora, cada 2 horas, o 10 veces en 2 horas. De día Y de noche (las tomas nocturnas son especialmente importantes). No hay 'demasiadas veces'. En brotes de crecimiento puede mamar casi constantemente.",
                    "DURACIÓN DE LA LACTANCIA TOTAL: OMS recomienda mínimo 2 años. Puedes seguir años si ambos queréis. 'Lactancia prolongada' no existe, lo normal es prolongada. El destete es cuando AMBOS estéis preparados."
                ],
                specificBenefits: [
                    "Mejor ganancia de peso del bebé",
                    "Mayor producción de leche",
                    "Menos mastitis y obstrucciones",
                    "Lactancia más duradera",
                    "Bebé más satisfecho",
                    "Menos ansiedad materna"
                ],
                mythsDebunked: [
                    "Cada 3 horas, 10 minutos por pecho → Totalmente arbitrario",
                    "Despertarlo para darle de mamar → Innecesario si gana peso",
                    "No dar por la noche tras los 6 meses → Las tomas nocturnas son importantes",
                    "Usa el pecho como chupete → El chupete imita el pecho, no al revés",
                    "Ya no alimenta tras el año → Sigue siendo nutritiva años después"
                ],
                whenToApply: "Durante TODA la lactancia, sin cambiar a horarios.",
                category: .feeding
            ),
            
            // HERRAMIENTA 3: Porteo
            BM3Tool(
                number: 3,
                title: "Porteo: Cómo Llevar a Tu Bebé Encima",
                whatItIs: "Llevar al bebé en contacto corporal constante usando un portabebés. Carlos González explica que los humanos somos 'primates portadores': nuestros bebés nacen esperando ser llevados en brazos 24/7, como los simios que se agarran del pelo materno.",
                whyItWorks: "El reflejo de agarre del bebé (heredado de cuando nos agarrábamos del pelo) • La posición fetal en brazos es la natural • El movimiento constante calma (como en el útero) • El contacto regula temperatura, respiración, ritmo cardíaco • El bebé se siente seguro en su 'hábitat natural' • No es un capricho, es una necesidad biológica",
                howToSteps: [
                    "ELEGIR EL PORTABEBÉS: Fular elástico (0-6 meses, muy adaptable), Fular rígido (0-3 años, más soporte), Mochila ergonómica (desde 4-6 meses), Mei tai (intermedio, versátil). EVITAR mochilas no ergonómicas (colgantes, sin soporte).",
                    "POSICIÓN ERGONÓMICA CORRECTA: Posición 'ranita' con piernas en M (rodillas más altas que el culo), espalda en C ligeramente redondeada (no recta), cara visible SIEMPRE para poder verla, vías respiratorias libres (barbilla separada del pecho), a 'altura de beso' (cabeza cerca para poder besarla).",
                    "CUÁNDO PORTEAR: Durante las siestas (duerme en el portabebés), haciendo tareas domésticas, saliendo a pasear, cuando llora y necesita consuelo, prácticamente todo el tiempo si quieres y puedes.",
                    "SEGURIDAD: Comprobar que respira bien (oyes/ves respiración), no cocinar con fuego llevándolo, cuidado con puertas y obstáculos (sobresale), ajustar bien el portabebés."
                ],
                specificBenefits: [
                    "Bebé llora menos (o nada)",
                    "Mejor regulación emocional",
                    "Facilita la digestión (menos cólicos)",
                    "Estimulación vestibular (equilibrio)",
                    "Madre/padre con manos libres",
                    "Mejor desarrollo de la cadera (posición ranita)",
                    "Favorece el vínculo"
                ],
                mythsDebunked: [
                    "Se acostumbrará mal a los brazos → Ya está acostumbrado, es su naturaleza",
                    "Le hará daño a la espalda → Al contrario, la posición es ergonómica",
                    "Tiene que aprender a estar solo → Lo aprenderá cuando esté preparado",
                    "No se desarrollará bien → Se desarrolla MEJOR en contacto"
                ],
                whenToApply: "Desde el nacimiento, tanto tiempo como bebé y porteador necesiten.",
                category: .contact
            ),
            
            // HERRAMIENTA 4: Responder al Llanto
            BM3Tool(
                number: 4,
                title: "Responder al Llanto Siempre y Rápido",
                whatItIs: "Acudir inmediatamente cuando el bebé llora, sin dejarlo llorar 'para que aprenda'. Carlos González explica que el llanto es la ÚNICA herramienta de comunicación del bebé, no es manipulación.",
                whyItWorks: "El llanto es selección natural: los bebés que lloraban sobrevivían • Es un sistema de alarma, no un capricho • Dejar llorar genera cortisol (hormona del estrés) en niveles tóxicos • El bebé que no obtiene respuesta se resigna, no 'aprende' • La respuesta rápida crea apego seguro y confianza básica • Los bebés cuyas necesidades se atienden lloran MENOS, no más",
                howToSteps: [
                    "RESPONDER INMEDIATAMENTE: No esperes 'a ver si se calma solo', no cuentes minutos, acude tan rápido como puedas, tu presencia YA es consuelo.",
                    "IDENTIFICAR LA NECESIDAD: Llanto de hambre (rítmico, insistente, busca con la boca) → Ofrece pecho/biberón. Llanto de sueño (bosteza, se frota ojos, irritable) → Ayúdale a dormir. Llanto de malestar (agudo, repentino) → Revisar pañal, gases, temperatura. Llanto de contacto/miedo (cuando está solo) → Cogerlo, estar cerca. Llanto de aburrimiento (gimoteo) → Cambio de escenario, brazos.",
                    "CÓMO CONSOLAR: Coger en brazos, hablar con voz suave, contacto piel con piel, mecerlo, ofrecer pecho (aunque no tenga hambre, consuela), caminar llevándolo, cantar.",
                    "QUÉ NO HACER: No dejarlo llorar 'para que se acostumbre', no ignorar su llanto, no seguir métodos tipo 'Duérmete niño', no pensar que te está 'manipulando'."
                ],
                specificBenefits: [
                    "Bebé más seguro emocionalmente",
                    "Llora menos a largo plazo (confía en que será atendido)",
                    "Mejor desarrollo cerebral (menos cortisol)",
                    "Apego seguro",
                    "Menos estrés familiar",
                    "Mejor autorregulación futura"
                ],
                mythsDebunked: [
                    "Llorar fortalece los pulmones → FALSO, genera estrés tóxico",
                    "Te está manipulando → FALSO, los bebés no manipulan",
                    "Aprenderá a dormirse solo → FALSO, solo aprende que nadie viene",
                    "Si respondes siempre llorará más → FALSO, llorará menos"
                ],
                whenToApply: "SIEMPRE. Cada vez que tu bebé llore, durante toda su infancia.",
                category: .communication
            ),
            
            // HERRAMIENTA 5: Destete Respetuoso
            BM3Tool(
                number: 5,
                title: "Destete Respetuoso y Natural",
                whatItIs: "Dejar la lactancia cuando ambos (madre y niño) estéis preparados, sin presión externa ni fechas arbitrarias. Carlos González defiende que no existe edad 'demasiado mayor' para mamar. El destete forzado es violento e innecesario.",
                whyItWorks: "La OMS recomienda lactancia mínimo 2 años • La leche sigue siendo nutritiva años después • El destete natural ocurre entre 2-7 años generalmente • Forzar el destete causa trauma emocional y físico (mastitis) • Cada díada madre-hijo tiene su tiempo • La presión social no es razón válida para destetar",
                howToSteps: [
                    "ESPERAR SEÑALES DE PREPARACIÓN: El niño pide menos frecuentemente, acepta otras formas de consuelo, está interesado en otros alimentos, puede expresarse verbalmente, muestra independencia creciente.",
                    "REDUCIR GRADUALMENTE: No cortar de golpe (causa mastitis y trauma), elimina primero las tomas menos importantes para el niño, mantén las de consuelo (antes de dormir) hasta el final, reduce una toma cada varios días/semanas.",
                    "OFRECER ALTERNATIVAS DE CONSUELO: Más abrazos, cuentos, canciones, juegos, tiempo de calidad, atención individual, pero sin sustituir el pecho forzadamente.",
                    "RESPETAR SI NO ESTÁ LISTO: Si el niño lo pasa mal, es que no está preparado, no hay prisa, la lactancia no hace daño a ninguna edad, ignora comentarios externos ('ya es muy mayor').",
                    "CUIDAR TU SALUD: Si tú necesitas destetar (nueva medicación, embarazo complicado), hazlo gradualmente, explícale al niño con cariño, ofrece alternativas, pide ayuda a la pareja."
                ],
                specificBenefits: [
                    "Sin traumas emocionales para el niño",
                    "Sin mastitis para la madre",
                    "Transición suave y natural",
                    "Vínculo mantiene su fuerza",
                    "Niño con recuerdos positivos de la lactancia",
                    "Madre sin culpa ni presión"
                ],
                mythsDebunked: [
                    "Al año hay que quitarlo → FALSO, la OMS dice mínimo 2 años",
                    "Si no lo quitas ahora, nunca lo dejará → FALSO, todos se destetan",
                    "Ya no alimenta después del año → FALSO, sigue siendo nutritiva",
                    "Le hará dependiente → FALSO, crea independencia segura"
                ],
                whenToApply: "Cuando decidáis madre e hijo, sin presión externa. Cada díada tiene su tiempo.",
                category: .feeding
            ),
            
            // HERRAMIENTA 6: Control de Esfínteres
            BM3Tool(
                number: 6,
                title: "Control de Esfínteres sin Presión",
                whatItIs: "Esperar a que el niño esté maduro neurológicamente para controlar esfínteres, sin forzar ni presionar. Carlos González critica los métodos de 'entrenamiento' que fuerzan al niño antes de tiempo.",
                whyItWorks: "El control de esfínteres requiere madurez neurológica de los nervios que controlan vejiga e intestino • No se puede acelerar, es un proceso biológico • Forzarlo antes de tiempo causa infecciones urinarias, estreñimiento, enuresis nocturna • La presión genera ansiedad y regresiones • Cada niño controla entre 2-4 años generalmente, dentro de ese rango TODO es normal",
                howToSteps: [
                    "ESPERAR SEÑALES DE MADUREZ: Avisa cuando está mojado/sucio, permanece seco 2+ horas seguidas, pide ir al baño o muestra interés, puede subir/bajar pantalones, entiende instrucciones simples. Si NO muestra estas señales, NO está preparado.",
                    "OFRECER SIN OBLIGAR: Pon orinal disponible, ofrécelo en momentos clave (después de comer, antes de dormir), si dice que no, respétalo sin insistir, NUNCA lo sientes a la fuerza, NUNCA lo dejes sentado hasta que haga.",
                    "ACEPTAR ACCIDENTES SIN CASTIGOS: Los 'accidentes' son normales durante meses, no regañes, no castigues, no hagas drama, simplemente limpia y sigue, pueden haber regresiones (viajes, hermano nuevo, cambios) - son normales.",
                    "NO COMPARAR: 'El hijo de X ya no usa pañal' → Irrelevante, cada niño tiene su tiempo, la presión por comparación causa problemas, tu hijo controlará cuando esté listo, no antes.",
                    "MANTENER CALMA Y PACIENCIA: Puede llevar meses, no semanas, algunas noches tardan años en estar secas (es normal hasta los 5-7 años), el control diurno viene antes que el nocturno."
                ],
                specificBenefits: [
                    "Sin estrés para el niño",
                    "Sin regresiones",
                    "Sin infecciones urinarias por retener",
                    "Sin estreñimiento por miedo a hacer",
                    "Control conseguido más rápido que forzando",
                    "Autoestima intacta"
                ],
                mythsDebunked: [
                    "A los 2 años hay que quitarlo → FALSO, cada niño tiene su tiempo",
                    "El pañal le hace vago → FALSO, es cuestión de madurez",
                    "Sentarlo cada hora hasta que haga → Contraproducente y estresante",
                    "Si no lo entrenas nunca aprenderá → FALSO, todos aprenden"
                ],
                whenToApply: "Entre 2-4 años, según señales de madurez de TU hijo, sin presión externa.",
                category: .development
            ),
            
            // HERRAMIENTA 7: Límites sin Violencia
            BM3Tool(
                number: 7,
                title: "Límites sin Castigos ni Violencia",
                whatItIs: "Establecer normas y límites necesarios con firmeza pero sin violencia física ni emocional. Carlos González dedica un capítulo completo a explicar por qué el castigo (físico y psicológico) es ineficaz y dañino.",
                whyItWorks: "Los límites son necesarios pero el castigo no • El castigo genera miedo, no comprensión • Un niño que obedece por miedo no ha aprendido, solo teme • El castigo físico enseña que la violencia es aceptable • El castigo emocional (humillaciones, gritos) daña la autoestima • Los límites pueden ser firmes sin ser violentos",
                howToSteps: [
                    "EXPLICAR EL POR QUÉ: No solo digas 'no', explica 'porque X puede pasar', adapta la explicación a su edad, repite las veces necesarias (los niños pequeños necesitan MUCHAS repeticiones), usa frases positivas ('camina' en vez de 'no corras').",
                    "OFRECER ALTERNATIVAS: 'Eso no se puede, pero puedes hacer esto otro', 'No puedes tirar la comida, pero puedes jugar con estos juguetes', redirige en lugar de solo prohibir, dale opciones aceptables.",
                    "SER FIRME PERO AMABLE: Voz tranquila pero seria, contacto visual, mensaje claro: 'Esto no', no grites, no pegues, no humilles, mantén la calma (respira hondo si es necesario).",
                    "CONSECUENCIAS NATURALES (cuando sea seguro): Si no se pone el abrigo, sentirá frío (y aprenderá), si rompe un juguete, no tendrá ese juguete, las consecuencias naturales enseñan sin castigos, NUNCA consecuencias que pongan en peligro.",
                    "SER CONSISTENTE: Los límites importantes deben mantenerse, no cambies las normas según tu humor, la pareja debe estar de acuerdo en límites importantes, explica de nuevo si es necesario."
                ],
                specificBenefits: [
                    "Niño que entiende, no que teme",
                    "Vínculo intacto",
                    "Aprende el razonamiento detrás de las normas",
                    "Desarrolla autocontrol real, no solo obediencia",
                    "No aprende que la violencia resuelve problemas",
                    "Autoestima sana"
                ],
                mythsDebunked: [
                    "Una bofetada a tiempo no hace daño → SÍ hace daño emocional y enseña violencia",
                    "Sin castigos será un tirano → FALSO, límites ≠ castigos",
                    "Hay que domarlos → FALSO, no son animales salvajes",
                    "Si no le pegas no te respetará → FALSO, el respeto se gana con respeto"
                ],
                whenToApply: "Siempre que haya que poner límites. NUNCA usar violencia.",
                category: .limits
            ),
            
            // HERRAMIENTA 8: Acompañar el Sueño
            BM3Tool(
                number: 8,
                title: "Acompañar el Sueño con Presencia",
                whatItIs: "Estar presente y acompañar al niño hasta que se duerma, sin dejarlo llorar solo. Carlos González critica duramente los métodos de 'enseñar a dormir' que implican dejar al niño solo y llorando.",
                whyItWorks: "El sueño es un proceso biológico, no se enseña • Dejar llorar no enseña a dormir, genera resignación y trauma • Los niños necesitan sentirse seguros para poder relajarse y dormir • La presencia parental facilita la transición vigilia-sueño • Quedarse dormido acompañado crea asociación positiva con el sueño • Los despertares nocturnos son normales hasta los 3-5 años",
                howToSteps: [
                    "CREAR RUTINA RELAJANTE: Baño con agua tibia (20:00h aprox), luces tenues después del baño, cena ligera o última toma (20:30h), cuento o canción suave (20:45h), momento tranquilo, sin pantallas 1 hora antes. Los horarios son orientativos, adapta a tu familia.",
                    "ACOMPAÑAR HASTA QUE SE DUERMA: Acuéstate con él o siéntate cerca, contacto físico si lo pide (abrazarlo, acariciarlo), voz suave si habla, paciencia si tarda, NO te escapes cuando esté dormido (lo notará y se despertará asustado).",
                    "RESPONDER A DESPERTARES NOCTURNOS: Los despertares son normales y saludables, acude rápido cuando llame, ofrece pecho/consuelo, acompaña de nuevo hasta que se duerma, NO dejes llorar 'para que aprenda'.",
                    "AJUSTAR SEGÚN EDAD: Bebés: necesitan mucha ayuda (brazos, movimiento, pecho), 1-3 años: acompañar en cama, 3+ años: puede que aún necesite presencia, algunos niños necesitan más tiempo que otros (es normal).",
                    "DESPEDIDAS SI SALES: Si necesitas salir una vez dormido, avísale antes: 'Me voy cuando estés dormido, estaré cerca', no desaparezcas sin avisar, vuelve si te llama."
                ],
                specificBenefits: [
                    "Niño que asocia sueño con seguridad, no con abandono",
                    "Menos despertares angustiados",
                    "Duerme más tranquilo",
                    "No traumas relacionados con el sueño",
                    "Transiciones más suaves",
                    "Mejor calidad de sueño"
                ],
                mythsDebunked: [
                    "Hay que enseñarle a dormir solo → FALSO, el sueño es biológico",
                    "Si lo acompañas nunca se dormirá solo → FALSO, lo hará cuando esté listo",
                    "Dejarlo llorar lo enseña → FALSO, solo lo resigna",
                    "Los despertares nocturnos son anormales → FALSO, son normales hasta 3-5 años"
                ],
                whenToApply: "Todas las noches, todas las siestas. Hasta que el niño pueda y quiera dormirse solo.",
                category: .sleep
            ),
            
            // HERRAMIENTA 9: Validación Emocional
            BM3Tool(
                number: 9,
                title: "Validación Emocional Constante",
                whatItIs: "Reconocer, aceptar y acompañar las emociones del niño sin juzgar, minimizar o negar. Carlos González explica que todas las emociones son válidas, incluso las que nos incomodan (rabia, tristeza, celos).",
                whyItWorks: "Los niños necesitan que sus emociones sean validadas • Negar o minimizar emociones enseña a reprimir (nocivo) • 'No llores', 'No pasa nada', 'No estés triste' invalidan su experiencia • La validación ayuda al niño a entender y gestionar sus emociones • Un niño cuyas emociones son validadas desarrolla inteligencia emocional • Sentir emociones intensas es normal y sano",
                howToSteps: [
                    "NOMBRAR LA EMOCIÓN: 'Veo que estás enfadado/triste/frustrado/asustado', 'Parece que te sientes X', usa vocabulario emocional rico, ayuda a identificar y nombrar lo que siente.",
                    "NO MINIMIZAR: NUNCA digas 'No llores', 'No pasa nada', 'No es para tanto', 'Los niños grandes no lloran', estas frases invalidan su experiencia, en su lugar: 'Entiendo que X te haga sentir así'.",
                    "ACOMPAÑAR SIN JUZGAR: 'Puedes estar enfadado, yo te acompaño', 'Es normal sentirse así', 'Estoy aquí contigo', no intentes alegrarle inmediatamente, permite que sienta y procese, tu presencia YA es consuelo.",
                    "NO BUSCAR SOLUCIÓN INMEDIATA: Primero valida, luego (cuando esté calmado) habla de soluciones, no digas 'ya, pero...' (invalida), permite el desahogo emocional, no todas las emociones necesitan solución, a veces solo necesitan ser sentidas.",
                    "MODELAR GESTIÓN EMOCIONAL: Nombra tus propias emociones: 'Mamá está cansada', 'Papá se siente frustrado', muestra cómo gestionas emociones sanamente, pide disculpas si pierdes la calma."
                ],
                specificBenefits: [
                    "Niño emocionalmente inteligente",
                    "Sabe identificar y nombrar emociones",
                    "No reprime emociones (previene problemas futuros)",
                    "Mejor autoestima",
                    "Más empatía con otros",
                    "Menos rabietas (porque se siente comprendido)"
                ],
                mythsDebunked: [
                    "Hay que distraerlo cuando está triste → FALSO, hay que acompañarlo",
                    "Si lo consuelas llorará más → FALSO, llorará lo que necesita",
                    "Los niños no deberían enfadarse → FALSO, el enfado es válido",
                    "Darle la razón lo malcría → FALSO, validar ≠ darle la razón"
                ],
                whenToApply: "Ante cualquier emoción intensa (positiva o negativa), siempre.",
                category: .communication
            ),
            
            // HERRAMIENTA 10: Crianza sin Comparaciones
            BM3Tool(
                number: 10,
                title: "Crianza sin Comparaciones",
                whatItIs: "Respetar el ritmo único y individual de tu hijo sin compararlo con hermanos u otros niños. Carlos González dedica varias secciones a explicar que cada niño se desarrolla a su propio tiempo y que las comparaciones son dañinas.",
                whyItWorks: "Cada niño es único genéticamente • Los hitos del desarrollo tienen rangos AMPLIOS de normalidad • Comparar genera ansiedad en padres e hijos • La presión por alcanzar hitos antes no acelera el desarrollo, lo entorpece • Caminar, hablar, controlar esfínteres, dejar pañal/pecho... todo tiene su momento INDIVIDUAL • Tu hijo no está 'atrasado', está en SU tiempo",
                howToSteps: [
                    "NO COMPARAR CON OTROS NIÑOS: 'El hijo de X ya camina/habla/controla' → Irrelevante, no es una carrera, cada niño tiene su tiempo, los 'premios' en desarrollo no existen, lo importante es que tu hijo esté sano y feliz.",
                    "NO COMPARAR CON HERMANOS: 'Tu hermano a tu edad ya...' → Muy dañino para autoestima, cada hijo es diferente, las comparaciones generan rivalidad y resentimiento, celebra logros individuales sin comparar.",
                    "CELEBRAR SIN PRESIONAR: Alégrate de sus logros cuando lleguen, no presiones para que lleguen antes, 'Ya caminarás cuando estés listo' (no 'A ver cuándo caminas'), confía en su desarrollo natural.",
                    "IGNORAR COMENTARIOS EXTERNOS: Familia/amigos que comparan o preguntan '¿Todavía no...?' → Respuesta: 'Cada niño tiene su tiempo, estamos tranquilos', no justifiques ni te pongas a la defensiva, confía en tu hijo.",
                    "OBSERVAR SIN ANGUSTIA: Observa el desarrollo de tu hijo, si hay verdadera preocupación (no avanza en NADA) consulta pediatra, pero si avanza en su propio ritmo, relájate, la ansiedad parental se transmite al niño."
                ],
                specificBenefits: [
                    "Niño sin presión ni estrés",
                    "Autoestima sana (no se siente 'menos')",
                    "Desarrollo a su ritmo óptimo",
                    "Padres más relajados",
                    "Sin rivalidad entre hermanos",
                    "Relación familiar más sana"
                ],
                mythsDebunked: [
                    "Si no presiono se quedará atrás → FALSO, se desarrollará mejor sin presión",
                    "Hay que estimular para acelerar → FALSO, la estimulación forzada estresa",
                    "Los hitos tempranos indican más inteligencia → FALSO, no hay correlación",
                    "Mi hijo debe ser como el hijo de X → FALSO, debe ser él mismo"
                ],
                whenToApply: "Siempre. En cada etapa del desarrollo de tu hijo.",
                category: .development
            )
        ]
    }
    
    // MARK: - Data: Frases Útiles
    private var allPhrases: [BM3Phrase] {
        [
            // Ante el llanto
            BM3Phrase(phrase: "Estoy aquí contigo", situation: .crying, context: "Para que sepa que no está solo"),
            BM3Phrase(phrase: "Veo que algo te molesta", situation: .crying, context: "Validando su malestar"),
            BM3Phrase(phrase: "Te escucho", situation: .crying, context: "Mostrando disponibilidad"),
            BM3Phrase(phrase: "Puedes llorar todo lo que necesites", situation: .crying, context: "Dando permiso para expresar"),
            
            // Ante rabietas
            BM3Phrase(phrase: "Entiendo que estés enfadado", situation: .tantrums, context: "Validando su emoción"),
            BM3Phrase(phrase: "Es difícil cuando no puedes tener lo que quieres", situation: .tantrums, context: "Mostrando empatía"),
            BM3Phrase(phrase: "Puedes estar enfadado, yo te acompaño", situation: .tantrums, context: "Aceptando la emoción"),
            BM3Phrase(phrase: "Cuando estés más calmado, hablamos", situation: .tantrums, context: "Dando tiempo y espacio"),
            
            // Ante presión externa
            BM3Phrase(phrase: "Cada familia decide cómo criar", situation: .externalPressure, context: "Marcando límites con otros"),
            BM3Phrase(phrase: "Mi hijo y yo estamos bien así", situation: .externalPressure, context: "Confianza en tu decisión"),
            BM3Phrase(phrase: "Gracias por tu opinión, pero seguimos nuestro instinto", situation: .externalPressure, context: "Respuesta educada pero firme"),
            BM3Phrase(phrase: "No necesito consejos ahora, gracias", situation: .externalPressure, context: "Cortando consejos no solicitados"),
            
            // Para poner límites
            BM3Phrase(phrase: "Eso no se puede, pero puedes hacer esto otro", situation: .settingLimits, context: "Redirigiendo conducta"),
            BM3Phrase(phrase: "Entiendo que quieras X, pero no es seguro/posible", situation: .settingLimits, context: "Validando deseo, poniendo límite"),
            BM3Phrase(phrase: "Te ayudo a hacerlo de esta manera segura", situation: .settingLimits, context: "Ofreciendo alternativa"),
            BM3Phrase(phrase: "Cuando X, entonces Y", situation: .settingLimits, context: "Consecuencia natural clara"),
            
            // Validación emocional
            BM3Phrase(phrase: "Todas tus emociones son válidas", situation: .emotionalValidation, context: "Aceptación total"),
            BM3Phrase(phrase: "Es normal sentirse así", situation: .emotionalValidation, context: "Normalizando la emoción"),
            BM3Phrase(phrase: "No tienes que sentirte de otra manera", situation: .emotionalValidation, context: "Sin presión para cambiar"),
            BM3Phrase(phrase: "Estoy aquí para lo que necesites", situation: .emotionalValidation, context: "Disponibilidad total")
        ]
    }
    
    // MARK: - Data: Errores Comunes
    private var commonMistakes: [BM3CommonMistake] {
        [
            BM3CommonMistake(
                mistake: "Dejar llorar para que 'aprenda' a dormirse solo",
                whyItsWrong: "El bebé no aprende, se resigna. Genera cortisol tóxico que daña el cerebro. Crea trauma y ansiedad relacionada con el sueño. El libro lo llama 'llanto terapéutico' irónicamente: no hay nada terapéutico en abandonar a un bebé llorando.",
                correctAlternative: "Acompañar siempre hasta que se duerma. Responder a despertares nocturnos. El sueño no se enseña, es un proceso biológico que madura con el tiempo."
            ),
            BM3CommonMistake(
                mistake: "Horarios rígidos de lactancia (cada 3 horas, 10 minutos por pecho)",
                whyItsWrong: "Totalmente arbitrarios e innecesarios. La leche se digiere en 90 minutos. Los bebés necesitan mamar a demanda, no según el reloj. Los horarios reducen la producción de leche y estresan a madre e hijo.",
                correctAlternative: "Lactancia a demanda total: cuando el bebé quiera, las veces que quiera, el tiempo que quiera, de día y de noche, sin contar."
            ),
            BM3CommonMistake(
                mistake: "Separar al bebé de la madre 'para que no se acostumbre mal'",
                whyItsWrong: "Los bebés están diseñados para estar CON su madre constantemente. La separación genera angustia y estrés. 'Acostumbrarse' al contacto no es malo, es su necesidad biológica.",
                correctAlternative: "Contacto constante: colecho, porteo, brazos sin límite. El bebé se independizará cuando esté preparado, no antes."
            ),
            BM3CommonMistake(
                mistake: "Castigos físicos o emocionales (bofetadas, gritos, humillaciones)",
                whyItsWrong: "Daña el vínculo, la autoestima y enseña violencia. El castigo genera miedo, no comprensión moral. Es ineficaz para educar y nocivo para el desarrollo emocional.",
                correctAlternative: "Límites firmes pero respetuosos: explicar, redirigir, ofrecer alternativas, ser consistente, NUNCA violencia física ni emocional."
            ),
            BM3CommonMistake(
                mistake: "Comparar con otros niños ('el hijo de X ya...')",
                whyItsWrong: "Genera ansiedad en padres e hijos. Cada niño tiene su ritmo individual. Los rangos de normalidad son AMPLIOS. La comparación no acelera el desarrollo, lo entorpece.",
                correctAlternative: "Respetar el ritmo único de tu hijo. Confiar en su desarrollo natural. Ignorar comparaciones externas. Celebrar sus logros sin presión."
            ),
            BM3CommonMistake(
                mistake: "Presionar para logros tempranos (control de esfínteres, caminar, hablar)",
                whyItsWrong: "Los hitos del desarrollo no se pueden acelerar, solo respetar. Presionar causa estrés, ansiedad y a veces regresiones. Cada niño madura a su tiempo.",
                correctAlternative: "Esperar señales de madurez. No forzar. Acompañar el proceso natural. Los logros tempranos no indican mayor inteligencia."
            ),
            BM3CommonMistake(
                mistake: "Quitarle el pecho antes de tiempo por presión social",
                whyItsWrong: "La OMS recomienda mínimo 2 años. La leche sigue siendo nutritiva años después. El destete forzado causa trauma emocional y físico (mastitis). La presión externa no es razón válida.",
                correctAlternative: "Destetar cuando AMBOS estéis preparados. Ignorar comentarios externos. Destete gradual y respetuoso cuando sea el momento."
            ),
            BM3CommonMistake(
                mistake: "Pensar que el bebé 'manipula' o 'toma el pelo'",
                whyItsWrong: "Los bebés no tienen capacidad cognitiva para manipular. Sus necesidades son reales. El llanto es comunicación, no manipulación. Esta creencia lleva a ignorar necesidades reales.",
                correctAlternative: "Confiar en que las necesidades del bebé son reales. Responder siempre. Entender que los bebés no manipulan, comunican."
            )
        ]
    }
    
    private func colorForCategory(_ category: ToolCategory) -> Color {
        switch category {
        case .sleep: return .indigo
        case .feeding: return .pink
        case .contact: return .blue
        case .communication: return .mint
        case .development: return .purple
        case .limits: return .orange
        }
    }
    
    private func triggerHaptic() {
        #if !os(macOS)
        let impactFeedback = UIImpactFeedbackGenerator(style: .light)
        impactFeedback.impactOccurred()
        #endif
    }
}

// MARK: - Preview
struct BM3View_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            BM3View()
        }
    }
}

