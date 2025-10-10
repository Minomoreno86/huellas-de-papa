import SwiftUI

/// Vista principal de la Capa 4 (Simulaciones Avanzadas) del módulo Bésame Mucho
/// Presenta 10 simulaciones interactivas para practicar decisiones según el libro
struct BM4View: View {
    @State private var selectedCategory: SimulationCategory? = nil
    
    var body: some View {
        ScrollView {
            VStack(spacing: 32) {
                // 1. Header
                headerSection
                
                // 2. Instrucciones
                instructionsSection
                
                // 3. Filtro por categorías
                categoryFilterSection
                
                // 4. Grid de simulaciones
                simulationsGridSection
                
                // 5. Frase final
                motivationalQuoteSection
            }
            .padding()
        }
        .background(Color(.systemGroupedBackground))
        .navigationTitle("Simulaciones")
        .navigationBarTitleDisplayMode(.large)
    }
    
    // MARK: - 1. Header
    private var headerSection: some View {
        VStack(spacing: 16) {
            Text("Simulaciones Interactivas")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundStyle(
                    LinearGradient(
                        gradient: Gradient(colors: [.blue, .mint]),
                        startPoint: .leading,
                        endPoint: .trailing
                    )
                )
            
            Text("Practica tus decisiones en situaciones reales")
                .font(.title3)
                .fontWeight(.medium)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
            
            Text("Basadas en casos del libro de Carlos González")
                .font(.subheadline)
                .foregroundColor(.blue)
                .italic()
        }
        .padding(.vertical)
    }
    
    // MARK: - 2. Instructions
    private var instructionsSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            Label("Cómo usar las simulaciones", systemImage: "info.circle.fill")
                .font(.headline)
                .foregroundColor(.blue)
            
            VStack(alignment: .leading, spacing: 8) {
                instructionRow(number: 1, text: "Lee la situación completa")
                instructionRow(number: 2, text: "Considera las presiones externas")
                instructionRow(number: 3, text: "Elige tu decisión")
                instructionRow(number: 4, text: "Descubre las consecuencias según el libro")
                instructionRow(number: 5, text: "Aprende alternativas si es necesario")
            }
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(Color(.systemBackground))
                .shadow(color: Color.blue.opacity(0.1), radius: 4, x: 0, y: 2)
        )
    }
    
    private func instructionRow(number: Int, text: String) -> some View {
        HStack(spacing: 12) {
            Text("\(number)")
                .font(.caption)
                .fontWeight(.bold)
                .foregroundColor(.white)
                .frame(width: 24, height: 24)
                .background(Circle().fill(Color.blue))
            
            Text(text)
                .font(.body)
                .foregroundColor(.primary)
        }
    }
    
    // MARK: - 3. Category Filter
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
                    
                    ForEach([SimulationCategory.sleep, .feeding, .separation, .discipline, .development, .externalPressure], id: \.self) { category in
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
    
    // MARK: - 4. Simulations Grid
    private var simulationsGridSection: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("10 Simulaciones Reales")
                .font(.title2)
                .fontWeight(.semibold)
                .foregroundColor(.primary)
            
            LazyVGrid(columns: [GridItem(.flexible())], spacing: 16) {
                ForEach(filteredSimulations) { simulation in
                    BM4SimulationCard(simulation: simulation)
                }
            }
        }
    }
    
    // MARK: - 5. Motivational Quote
    private var motivationalQuoteSection: some View {
        VStack(spacing: 20) {
            Text("💙 Reflexión")
                .font(.headline)
                .fontWeight(.semibold)
                .foregroundColor(.primary)
            
            VStack(spacing: 12) {
                Text("\"En la crianza no hay fórmulas mágicas. Hay amor, paciencia y respeto a las necesidades reales de cada niño.\"")
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
    private var filteredSimulations: [BM4Simulation] {
        if let selectedCategory = selectedCategory {
            return allSimulations.filter { $0.category == selectedCategory }
        }
        return allSimulations
    }
    
    // MARK: - Data: LAS 10 SIMULACIONES COMPLETAS
    private var allSimulations: [BM4Simulation] {
        [
            // SIMULACIÓN 1: Primera Noche en Casa
            BM4Simulation(
                number: 1,
                title: "Primera Noche en Casa con el Bebé",
                context: "Acabas de llegar del hospital. Son las 2 AM y es tu primera noche como madre/padre.",
                initialSituation: "Acabas de llegar del hospital con tu bebé recién nacido. Son las 2 de la madrugada y el bebé llora sin parar desde hace una hora. Has intentado darle el pecho pero parece que no se engancha bien. Estás agotada, adolorida del parto y empiezas a dudar de ti misma. ¿Será que no tengo suficiente leche? ¿Estará enfermo? ¿Qué hago mal?",
                externalPressures: [
                    "Tu pareja, también agotada, te sugiere: 'Déjalo llorar un poco para que aprenda que es de noche'",
                    "Tu suegra (que se quedó a ayudar) dice: 'Dale un biberón de fórmula aunque tomes pecho, así duerme más. Yo siempre di biberón'",
                    "Recuerdas las palabras del pediatra: 'Cada 3 horas, no más de 15 minutos por pecho'"
                ],
                decisions: [
                    BM4Decision(
                        text: "Seguir intentando darle pecho a demanda, ignorando el reloj y las recomendaciones de horarios",
                        alignment: .high,
                        shortTermImpact: "El bebé eventualmente se engancha y mama. Se calma. Tú también te calmas. Ambos descansan un poco. El bebé puede pedir de nuevo en 1-2 horas (es normal). Te sientes cansada pero conectada con tu bebé.",
                        longTermImpact: "Establecimiento exitoso de la lactancia. Producción de leche adecuada por oferta-demanda. Bebé con apego seguro. Confianza en tu capacidad de maternar. Lactancia duradera y exitosa.",
                        bookExplanation: "Carlos González explica que los horarios son totalmente arbitrarios. La leche materna se digiere rápido (90 min). Los primeros días el bebé necesita mamar MUCHO para que suba la leche. No existe 'demasiadas veces'. La producción se establece por demanda: cuanto más mame, más leche producirás. Los primeros días son cruciales para establecer buena producción.",
                        suggestedAlternatives: nil
                    ),
                    BM4Decision(
                        text: "Darle un biberón de fórmula 'por esta vez' para que duerma y tú puedas descansar",
                        alignment: .low,
                        shortTermImpact: "El bebé toma el biberón y duerme unas horas (la fórmula se digiere más lento). Tú descansas. Pero tus pechos se congestionan dolorosamente. Al despertar el bebé está menos interesado en el pecho. Tu producción de leche disminuye.",
                        longTermImpact: "Interferencia con establecimiento de lactancia. Menor producción de leche (no hubo demanda esa noche). Posible preferencia del bebé por el biberón (es más fácil). Mayor probabilidad de abandono de lactancia. Pérdida de confianza en tu capacidad.",
                        bookExplanation: "Carlos González advierte que los primeros días son CRUCIALES para establecer la lactancia. Cada biberón que das es una toma menos que demanda leche de tu pecho. La producción se establece por oferta-demanda. Dar fórmula 'por esta vez' suele ser el principio del fin de la lactancia. Además, la fórmula no es inocua: aumenta riesgo de alergias, obesidad y enfermedades.",
                        suggestedAlternatives: [
                            "Si necesitas descanso, practica colecho seguro y amamanta acostada",
                            "Pide ayuda con otras tareas (cocinar, limpiar) pero no con amamantar",
                            "Recuerda que las primeras semanas son las más duras, mejorará"
                        ]
                    ),
                    BM4Decision(
                        text: "Dejarlo llorar 'solo 5 minutos' a ver si se calma solo como sugirió tu pareja",
                        alignment: .low,
                        shortTermImpact: "El bebé no se calma, llora más intensamente. Tú sufres escuchándolo. Tu pareja se siente mal. Los 5 minutos se hacen eternos. Finalmente lo coges, pero está muy alterado. Tarda más en calmarse. Todos están más estresados.",
                        longTermImpact: "Bebé aprende que sus llamadas no siempre tienen respuesta. Puede desarrollar llanto más intenso (debe gritar MÁS para que vengan). Posible daño al apego seguro. Generación de cortisol (estrés tóxico). Inicio de desconfianza.",
                        bookExplanation: "Carlos González es categórico: NUNCA dejar llorar a un bebé. El llanto es su única forma de comunicación. Un recién nacido NO puede 'manipular' ni 'aprender' lecciones. Solo puede sentir necesidad y obtener respuesta o no obtenerla. Los bebés ignorados sufren estrés tóxico que daña el cerebro. No 'aprenden', se resignan.",
                        suggestedAlternatives: [
                            "Responde SIEMPRE al llanto, especialmente en un recién nacido",
                            "Llévalo en brazos, ofrece pecho, mécelo",
                            "Pide a tu pareja que te apoye emocionalmente, no que te aconseje ignorar al bebé"
                        ]
                    ),
                    BM4Decision(
                        text: "Llevarlo a tu cama, practicar colecho seguro y amamantar acostada",
                        alignment: .high,
                        shortTermImpact: "Acomodas al bebé en tu cama de forma segura. Le das el pecho acostada. Ambos se relajan. El bebé mama tranquilo y se duerme. Tú también descansas mientras amamantas. Todos duermen mejor. El bebé se despierta para mamar pero no llora (te siente cerca).",
                        longTermImpact: "Establecimiento exitoso de lactancia. Todos descansan mejor. Vínculo fortalecido. Lactancia nocturna facilitada (crucial para la producción). Bebé seguro. Madre descansada. Patrón saludable de sueño compartido.",
                        bookExplanation: "Carlos González defiende el colecho como lo más natural y beneficioso. Facilita la lactancia nocturna (las tomas de noche son cruciales para mantener producción). La madre descansa más (no se levanta 5-8 veces). El bebé llora menos. Practicado con seguridad, el colecho es la opción ideal. En culturas donde se practica, las madres dicen que sus bebés 'duermen bien' porque NO se despiertan llorando (al sentir a la madre cerca, simplemente maman y siguen durmiendo).",
                        suggestedAlternatives: nil
                    )
                ],
                category: .feeding,
                difficulty: .beginner
            ),
            
            // SIMULACIÓN 2: Bebé que no duerme
            BM4Simulation(
                number: 2,
                title: "Tu Bebé de 4 Meses No Duerme 'Como Debería'",
                context: "Despertares nocturnos frecuentes y la presión para aplicar métodos conductistas.",
                initialSituation: "Tu bebé de 4 meses se despierta 6-8 veces cada noche. Estás exhausta. En la última revisión, el pediatra te dio fotocopias del método 'Duérmete Niño' diciendo que es 'muy efectivo'. Tu familia insiste en que 'lo estás malcriando', 'tiene que aprender a dormir solo', 'a esta edad ya deberían dormir toda la noche'. Tienes dudas: ¿Estaré haciendo algo mal? ¿Será que mi hijo tiene un problema de sueño?",
                externalPressures: [
                    "El pediatra: 'Aplica el método. Déjalo llorar 5 minutos, luego 10, luego 15. En 3 días dormirá de corrido'",
                    "Tu madre: 'A ti te dejé llorar y mira qué bien saliste. No pasa nada'",
                    "Amigas: 'Mi bebé duerme 12 horas seguidas desde los 2 meses. ¿Qué le das de cenar?'",
                    "Tu pareja: 'Ya no puedo más, necesito dormir para trabajar'"
                ],
                decisions: [
                    BM4Decision(
                        text: "Aplicar el método 'Duérmete Niño' como recomienda el pediatra",
                        alignment: .low,
                        shortTermImpact: "Primera noche: el bebé llora 45 minutos sin parar antes de 'rendirse'. Tú lloras también escuchándolo. Segunda noche: 30 minutos de llanto. Tercera noche: 15 minutos. Parece que 'funciona', el bebé ya no llora... pero tampoco llama cuando se despierta. Se queda despierto en silencio.",
                        longTermImpact: "El bebé no ha 'aprendido' a dormir, se ha RESIGNADO. Ha aprendido que nadie viene cuando necesita ayuda. Posible desarrollo de apego inseguro. Puede desarrollar terrores nocturnos, pesadillas, ansiedad. Daño al vínculo. El libro reporta casos de niños con traumas por estos métodos. A largo plazo: problemas de sueño, no soluciones.",
                        bookExplanation: "Carlos González dedica un capítulo completo a criticar estos métodos. El título 'llanto terapéutico' lo usa irónicamente: no hay NADA terapéutico en abandonar a un bebé llorando. El bebé no aprende a dormir (el sueño es biológico, no se enseña). Solo aprende que nadie viene. El silencio no es éxito, es resignación. Los despertares nocturnos son NORMALES hasta los 3-5 años. No son un problema a 'solucionar', son biología.",
                        suggestedAlternatives: [
                            "Acepta que los despertares son normales a esta edad",
                            "Practica colecho para descansar más",
                            "Comparte noches con tu pareja (turnos si no hay lactancia)",
                            "Busca apoyo de grupos pro-apego, no de métodos conductistas"
                        ]
                    ),
                    BM4Decision(
                        text: "Seguir respondiendo a cada despertar, ignorando las críticas",
                        alignment: .high,
                        shortTermImpact: "Sigues cansada (los despertares continúan), pero tu bebé se calma rápido cuando lo atiendes. Si practicas colecho y amamantas acostada, descansas más. Ignoras los comentarios críticos. Confías en que estás haciendo lo correcto aunque sea duro.",
                        longTermImpact: "Bebé con apego seguro. Confianza básica establecida. Los despertares irán disminuyendo NATURALMENTE con la edad. A los 2-3 años dormirá más seguido. A largo plazo: niño sin problemas de sueño, sin traumas, con vínculo sano. Tú habrás sobrevivido una etapa dura pero con tu vínculo intacto.",
                        bookExplanation: "Carlos González confirma: los despertares nocturnos son NORMALES. Los bebés de 4 meses NO duermen 'toda la noche' (8-12 horas). Los que sí lo hacen son la excepción, no la norma. Responder a los despertares no crea 'malos hábitos', crea seguridad. Los bebés eventualmente dormirán más (cada uno a su tiempo). La solución es TIEMPO y PACIENCIA, no métodos crueles.",
                        suggestedAlternatives: nil
                    ),
                    BM4Decision(
                        text: "Intentar 'término medio': responder pero sin cogerlo, solo palmaditas",
                        alignment: .medium,
                        shortTermImpact: "El bebé llora durante más tiempo antes de calmarse (las palmaditas no son suficiente consuelo). Eventualmente tienes que cogerlo porque no para. Has prolongado su sufrimiento intentando el término medio. Todos terminan más frustrados.",
                        longTermImpact: "El bebé aprende que tiene que llorar MÁS intensamente para conseguir lo que necesita (ser cogido). No creas un 'mal hábito' cogiéndolo directamente, creas confusión no haciéndolo. A largo plazo: bebé que necesita llorar más para ser atendido.",
                        bookExplanation: "Carlos González explica que los 'términos medios' en respuesta al llanto no funcionan. O respondes (coges, consuelas, atiendes) o no respondes. Las medias tintas solo prolongan el sufrimiento del bebé y la ansiedad de los padres. Si va a terminar cogiéndolo (que es lo correcto), hazlo desde el principio. Ahorras sufrimiento a ambos.",
                        suggestedAlternatives: [
                            "Responde completamente: cógelo, consuélalo, ofrece pecho",
                            "No tengas miedo de 'malcriar' por responder a sus necesidades",
                            "El bebé no llora 'por nada', llora porque te necesita"
                        ]
                    ),
                    BM4Decision(
                        text: "Buscar segunda opinión médica pro-apego y grupo de apoyo",
                        alignment: .high,
                        shortTermImpact: "Encuentras un pediatra que te dice que los despertares son normales. Te sientes validada. Te unes a un grupo de apoyo a la lactancia donde otras madres viven lo mismo. Ya no te sientes sola o 'mala madre'. Comprendes que estás haciendo bien.",
                        longTermImpact: "Red de apoyo que te sostiene en momentos difíciles. Información basada en evidencia, no en mitos. Confianza en tu maternidad. Evitas métodos dañinos. Tu bebé se beneficia de tus decisiones informadas. Lactancia exitosa a largo plazo.",
                        bookExplanation: "Carlos González enfatiza la importancia de buscar profesionales que apoyen la crianza respetuosa. No todos los pediatras están actualizados en lactancia y sueño infantil. Los grupos de apoyo (La Liga de la Leche, grupos de crianza con apego) son fundamentales para sentirse acompañada y obtener información correcta. Rodearte de personas que validen tu crianza respetuosa es clave para mantenerla ante presiones externas.",
                        suggestedAlternatives: nil
                    )
                ],
                category: .sleep,
                difficulty: .beginner
            ),
            
            // SIMULACIÓN 3: Presión Familiar para Destetar
            BM4Simulation(
                number: 3,
                title: "Presión Familiar para Destetar",
                context: "Tu hijo de 18 meses aún toma pecho y la familia critica constantemente.",
                initialSituation: "Tu hijo tiene 18 meses y aún toma pecho varias veces al día y por la noche. Estás en una comida familiar. Cuando tu hijo pide 'teta', varios parientes empiezan con los comentarios: 'Ya es muy grande para eso', 'Le vas a hacer daño', 'Se va a quedar pegado a ti para siempre', 'Qué vergüenza, ya tiene dientes', 'A esta edad deberían darle comida de verdad, no teta'. Tu hijo escucha todo esto. Tú te sientes juzgada y empiezas a dudar.",
                externalPressures: [
                    "Tu madre: 'Yo te desteté a los 6 meses y estás perfecta. ¿Para qué sigues?'",
                    "Tu suegra: 'Le estás quitando nutrientes a tu cuerpo, te vas a enfermar'",
                    "Tu cuñada: 'Eso es casi incesto, ya es un niño grande'",
                    "Un tío: 'Ese niño te está tomando el pelo, ponle límites'"
                ],
                decisions: [
                    BM4Decision(
                        text: "Destetar inmediatamente para que la familia deje de criticar",
                        alignment: .low,
                        shortTermImpact: "Desteteas abruptamente. Tu hijo llora inconsolable durante días pidiendo 'teta'. No entiende por qué se la niegas. Se siente rechazado y confundido. Tú desarrollas mastitis por corte abrupto. Ambos sufren. La familia dice 'ya era hora' pero el sufrimiento es real.",
                        longTermImpact: "Destete traumático para ambos. Tu hijo puede desarrollar problemas de sueño, ansiedad, apego inseguro. Siente que lo has traicionado. Tú te sientes culpable. La lactancia termina en trauma en lugar de amor. Posible impacto en la relación a largo plazo. El niño recuerda el rechazo.",
                        bookExplanation: "Carlos González advierte contra el destete forzado por presión social. Es violento e innecesario. Los comentarios externos NO son razón válida para destetar. La OMS recomienda lactancia mínimo 2 años. A los 18 meses es totalmente normal y saludable seguir amamantando. El destete debe ser decisión de la díada madre-hijo, no de la familia extendida. Un destete traumático puede dañar la relación.",
                        suggestedAlternatives: [
                            "Educa a tu familia sobre beneficios de lactancia prolongada",
                            "Establece límites: 'Esta decisión es nuestra, no tuya'",
                            "Desteta solo cuando AMBOS estéis preparados"
                        ]
                    ),
                    BM4Decision(
                        text: "Defender tu decisión de seguir con lactancia, educar a tu familia",
                        alignment: .high,
                        shortTermImpact: "Respondes con calma pero firmeza: 'La OMS recomienda lactancia hasta los 2 años o más. Es beneficioso para él y para mí. Esta es nuestra decisión'. Algunos familiares se sorprenden. Otros siguen criticando. Pero has marcado un límite claro. Te sientes empoderada.",
                        longTermImpact: "La familia aprende a respetar tus decisiones de crianza. Estableces que TÚ eres la madre/padre, no ellos. Tu hijo se beneficia de lactancia prolongada. Destetar cuando sea el momento adecuado para AMBOS, sin presión. Relación sana con tu familia basada en límites claros.",
                        bookExplanation: "Carlos González enfatiza la importancia de defender tus decisiones de crianza ante presión externa. La lactancia prolongada NO hace daño, es beneficiosa. Los comentarios negativos reflejan ignorancia o prejuicios culturales, no ciencia. Educar respetuosamente a la familia es importante. Si no respetan, es válido limitar el contacto o poner reglas ('no se comenta sobre la lactancia').",
                        suggestedAlternatives: nil
                    ),
                    BM4Decision(
                        text: "Mentir y decir que ya lo vas a dejar pronto para evitar conflictos",
                        alignment: .medium,
                        shortTermImpact: "Dices 'Sí, ya casi lo dejo' aunque no es cierto. La familia se calma momentáneamente. Evitas el conflicto inmediato. Pero te sientes mal por mentir. Y sabes que volverán a preguntar 'ya lo dejó?' en la próxima visita.",
                        longTermImpact: "Perpetúas la presión. La familia seguirá preguntando e insistiendo. No estableces límites claros. Puede que termines destentando por presión aunque no quieras. No resuelves el problema de fondo. Sentimiento de no defender a tu hijo.",
                        bookExplanation: "Carlos González no recomienda mentir, pero entiende que a veces es una forma de supervivencia social. Sin embargo, es mejor establecer límites claros. La mentira no resuelve el problema, solo lo pospone. La familia seguirá presionando. Es preferible una conversación honesta y límites firmes.",
                        suggestedAlternatives: [
                            "Di la verdad con firmeza: 'Seguiremos hasta que ambos estemos preparados'",
                            "Establece límite: 'No voy a hablar más de este tema'",
                            "Educa: 'La OMS recomienda 2 años, estamos dentro de lo recomendado'"
                        ]
                    ),
                    BM4Decision(
                        text: "Ignorar comentarios y seguir tu instinto sin dar explicaciones",
                        alignment: .high,
                        shortTermImpact: "Simplemente cambias de tema cuando critican. O dices 'Es nuestra decisión' y no elaboras más. La familia se da cuenta de que no logran nada con sus comentarios. Algunos se resignan, otros siguen intentando pero con menos intensidad.",
                        longTermImpact: "Proteges tu lactancia y a tu hijo. No gastas energía defendiéndote constantemente. La familia eventualmente acepta (o al menos deja de comentar). Tu hijo sigue beneficiándose de la lactancia. Destetar cuando sea el momento natural, sin presión.",
                        bookExplanation: "Carlos González valida que no siempre es necesario educar o convencer a todos. A veces es suficiente con ser claro y firme: 'Esta es nuestra decisión'. No debes justificarte constantemente. Proteger tu lactancia y tu paz mental es prioridad. Si la familia no respeta, puedes limitar visitas o tiempo con ellos hasta que aprendan.",
                        suggestedAlternatives: nil
                    )
                ],
                category: .externalPressure,
                difficulty: .intermediate
            ),
            
            // SIMULACIÓN 4: Horarios Rígidos del Pediatra
            BM4Simulation(
                number: 4,
                title: "El Pediatra Recomienda Horarios Rígidos",
                context: "Conflicto entre las indicaciones médicas y la lactancia a demanda.",
                initialSituation: "En la revisión del mes, el pediatra te entrega un papel impreso con instrucciones: 'Cada 3 horas exactas, máximo 10 minutos por pecho, después agua o infusiones'. Tu bebé actualmente pide cada 1-2 horas y a veces mama 30-40 minutos. Cuando mencionas esto, el pediatra dice: 'Está usando el pecho como chupete, tienes que poner orden o te va a manipular'. Te vas confundida: ¿Seguir mi instinto o las indicaciones del profesional?",
                externalPressures: [
                    "El pediatra: 'Soy médico, sé lo que te digo. Sigue estas indicaciones al pie de la letra'",
                    "El papel impreso: 'Horarios estrictos para bebés sanos'",
                    "Tu duda interna: '¿Y si el médico tiene razón y yo estoy equivocada?'",
                    "Tu pareja: 'Mejor hagamos caso al doctor, para eso estudiaron'"
                ],
                decisions: [
                    BM4Decision(
                        text: "Seguir las indicaciones del pediatra al pie de la letra",
                        alignment: .low,
                        shortTermImpact: "Intentas seguir los horarios. El bebé llora de hambre antes de las 3 horas. Lo haces esperar. Llora más. Cuando llega la hora, está tan alterado que no se engancha bien. Tú estás estresada mirando el reloj. El bebé no queda satisfecho en 10 minutos. Tu producción de leche empieza a bajar (menos estimulación = menos leche).",
                        longTermImpact: "Posible fallo de lactancia por baja producción. Bebé con ganancia insuficiente de peso. Estrés extremo para ambos. Probable introducción de fórmula (que reducirá más la producción). Abandono de lactancia. Bebé y madre frustrados. Oportunidad perdida de lactancia exitosa.",
                        bookExplanation: "Carlos González critica duramente estos horarios arbitrarios. Son un invento sin base científica. La leche materna se digiere en 90 minutos, no en 3 horas. Limitar el tiempo al pecho impide que el bebé tome la leche del final (la más grasa y nutritiva). La producción se regula por oferta-demanda: menos tomas = menos leche. Estos 'consejos' son la causa número uno de fracaso de lactancia. Son totalmente contraproducentes.",
                        suggestedAlternatives: [
                            "Ignora los horarios, practica lactancia a demanda",
                            "Busca otro pediatra actualizado en lactancia",
                            "Contacta con asesora de lactancia certificada",
                            "Confía en tu bebé: él sabe cuándo necesita mamar"
                        ]
                    ),
                    BM4Decision(
                        text: "Cuestionar las indicaciones y pedir explicación científica",
                        alignment: .high,
                        shortTermImpact: "Preguntas al pediatra: '¿Por qué cada 3 horas? ¿Por qué solo 10 minutos? ¿Dónde está la evidencia científica?'. Algunos pediatras reflexionan y admiten que es lo que siempre han dicho. Otros se molestan. Pero TÚ obtienes claridad: no hay base científica sólida.",
                        longTermImpact: "Tomas decisión informada de ignorar horarios arbitrarios. Sigues lactancia a demanda. Lactancia exitosa. Bebé satisfecho y con buen crecimiento. Aprendes a cuestionar 'consejos' sin evidencia. Desarrollas criterio propio.",
                        bookExplanation: "Carlos González anima a cuestionar recomendaciones sin base científica, incluso de profesionales. No todos los pediatras están actualizados en lactancia. Muchos repiten lo que aprendieron hace décadas. Es válido y necesario pedir evidencia. Un buen profesional aceptará preguntas. Uno dogmático se molestará. La lactancia a demanda tiene TODA la evidencia científica a favor.",
                        suggestedAlternatives: nil
                    ),
                    BM4Decision(
                        text: "Ignorar los horarios y seguir lactancia a demanda sin decir nada",
                        alignment: .high,
                        shortTermImpact: "Decides en silencio ignorar las indicaciones. Sigues dando pecho a demanda. En la próxima revisión, cuando el pediatra pregunta, simplemente dices 'Sí, todo bien'. No entras en detalles. El bebé está ganando peso perfecto. El pediatra no insiste.",
                        longTermImpact: "Lactancia exitosa mantenida. Bebé sano y feliz. Evitas conflictos innecesarios. Aprendes que no tienes que justificar cada decisión. Los resultados (bebé sano) hablan por sí mismos. Confianza en tu instinto maternal.",
                        bookExplanation: "Carlos González valida esta opción: a veces no vale la pena discutir. Si el bebé está bien, los resultados hablan por sí mismos. No es mentir, es no entrar en detalles innecesarios. Proteges tu lactancia sin gastar energía en convencer a quien no quiere escuchar. Si el bebé gana peso y está sano, el pediatra no debería objetar (aunque no sepa que sigues lactancia a demanda).",
                        suggestedAlternatives: nil
                    )
                ],
                category: .feeding,
                difficulty: .intermediate
            ),
            
            // SIMULACIÓN 5: Control de Esfínteres Forzado
            BM4Simulation(
                number: 5,
                title: "Presión para Quitar el Pañal",
                context: "El colegio exige control de esfínteres pero tu hijo no está listo.",
                initialSituation: "Faltan 2 meses para que tu hijo de 2 años y medio empiece el colegio. El colegio tiene una norma estricta: 'Solo admitimos niños sin pañal'. Tu hijo no muestra señales de estar listo (no avisa cuando está mojado, no pide el baño, no parece interesado). La directora te presiona: 'Tiene 2 meses para aprenderlo o no puede entrar'. Tu madre dice: 'A ti te quité el pañal a los 18 meses en una semana, es cuestión de voluntad'. Te planteas: ¿Lo entreno intensivamente aunque no esté preparado? ¿Busco otro colegio? ¿Es posible que esté listo en 2 meses?",
                externalPressures: [
                    "Directora del colegio: 'Es nuestra norma, no hacemos excepciones'",
                    "Tu madre: 'Pónselo difícil, en 3 días lo consigues. No le pongas el pañal y ya'",
                    "Pediatra: 'A los 2 años y medio debería controlar, siéntalo cada hora'",
                    "Otras madres: 'El mío controló a los 2 años, es fácil si eres constante'"
                ],
                decisions: [
                    BM4Decision(
                        text: "Entrenamiento intensivo forzado: quitarle el pañal y sentarlo cada hora aunque llore",
                        alignment: .low,
                        shortTermImpact: "Le quitas el pañal. Se hace pipí encima 10 veces al día. Llora cada vez que lo sientas en el baño. Desarrolla retención (aguanta para no sentarse). Aparecen accidentes fecales. Está estresado, irritable. Tú estás frustrada. La casa huele a orina. Después de 2 semanas, sigue sin controlar.",
                        longTermImpact: "Posibles infecciones urinarias por retener. Estreñimiento crónico. Enuresis nocturna hasta edad avanzada (por trauma). Ansiedad relacionada con el baño. Baja autoestima ('no puedo hacerlo'). Regresiones frecuentes. El problema se agrava en lugar de resolverse. Trauma que puede durar años.",
                        bookExplanation: "Carlos González dedica un capítulo al control de esfínteres. Explica que NO se puede enseñar, solo esperar madurez. Forzarlo antes de que el niño esté preparado neurológicamente causa MÚLTIPLES problemas: infecciones, estreñimiento, enuresis, traumas. Los métodos 'rápidos' de quitar el pañal son crueles. El control llega entre 2-4 años generalmente. 2.5 años puede ser demasiado pronto para algunos niños (especialmente niños).",
                        suggestedAlternatives: [
                            "Habla con el colegio, pide excepción o plazo",
                            "Busca un colegio que acepte niños en proceso",
                            "Espera señales de madurez antes de intentarlo",
                            "Cada niño tiene su tiempo, no lo forces"
                        ]
                    ),
                    BM4Decision(
                        text: "Explicar al colegio que no está listo, pedir excepción o esperar un año más",
                        alignment: .high,
                        shortTermImpact: "Hablas con la directora. Explicas que tu hijo no muestra señales de madurez. Pides excepción o retraso de entrada. Dos escenarios: (A) Aceptan haciendo excepción - genial. (B) No aceptan - buscas otro colegio o esperas al siguiente curso.",
                        longTermImpact: "Priorizas el bienestar de tu hijo sobre la presión institucional. Tu hijo controla esfínteres cuando está maduro (sin traumas). Proceso natural, sin problemas. Entra al colegio cuando está preparado. Vínculo intacto. Autoestima preservada.",
                        bookExplanation: "Carlos González apoya totalmente defender las necesidades de tu hijo. Un colegio que no acepta niños en proceso de control (2-3 años) está siendo inflexible e ignorante del desarrollo infantil. Es válido buscar otro colegio más respetuoso. También es válido esperar un año más. La escolarización temprana NO es obligatoria ni siempre beneficiosa. Prioriza a tu hijo sobre instituciones rígidas.",
                        suggestedAlternatives: nil
                    ),
                    BM4Decision(
                        text: "Buscar otro colegio que acepte niños en proceso de control",
                        alignment: .high,
                        shortTermImpact: "Investigas otros colegios. Encuentras uno que acepta niños con pañal o en proceso. Se adaptan al ritmo individual. Te sientes aliviada. Tu hijo no será forzado. Puede que sea más caro o más lejos, pero vale la pena.",
                        longTermImpact: "Tu hijo está en un entorno que respeta su desarrollo. Control de esfínteres natural y sin traumas. Colegio más alineado con tu filosofía de crianza. Relación positiva con la institución educativa. Hijo feliz y sin presión.",
                        bookExplanation: "Carlos González valora enormemente encontrar instituciones (colegios, guarderías) que respeten el desarrollo infantil. No todos los colegios son iguales. Invertir tiempo en buscar uno respetuoso vale la pena. Un colegio rígido con el control de esfínteres probablemente será rígido en otras áreas. El entorno educativo debe respetar y apoyar a los niños, no forzarlos.",
                        suggestedAlternatives: nil
                    )
                ],
                category: .development,
                difficulty: .intermediate
            ),
            
            // SIMULACIÓN 6: Rabieta en Público
            BM4Simulation(
                number: 6,
                title: "Rabieta Épica en el Supermercado",
                context: "Cómo manejar rabietas en público bajo la mirada crítica de extraños.",
                initialSituation: "Estás en el supermercado con tu hijo de 3 años. Pasa por el pasillo de juguetes y ve uno que le encanta. 'Mami/papi, ¿me lo compras?' le dices que no, que hoy no toca. El niño insiste. Vuelves a decir que no. Entonces se tira al suelo gritando 'LO QUIERO, LO QUIERO'. La gente se para a mirar. Una señora mayor comenta en voz alta: 'A ese niño le falta una buena bofetada'. Otra dice: 'Qué malcriado'. Tu hijo grita más fuerte. La cajera te mira con desaprobación. Sientes todas las miradas sobre ti. Tu instinto es agacharte y abrazarlo, pero te da vergüenza. ¿Qué haces?",
                externalPressures: [
                    "Señora mayor: 'A ese niño le falta mano dura'",
                    "Otra compradora: 'Si fuera mío, ya le habría dado una nalgada'",
                    "La cajera te mira con cara de 'controla a tu hijo'",
                    "Tu voz interna: 'Todo el mundo me está juzgando, esto es humillante'"
                ],
                decisions: [
                    BM4Decision(
                        text: "Comprarle el juguete para que se calle y poder salir de ahí",
                        alignment: .low,
                        shortTermImpact: "Compras el juguete. El niño se calma instantáneamente. La gente deja de mirar. Sales del supermercado rápido. Pero te sientes mal: has cedido por vergüenza, no por convicción. Y sabes que has enviado un mensaje: 'Si gritas lo suficiente en público, consigues lo que quieres'.",
                        longTermImpact: "El niño aprende que las rabietas públicas funcionan. Las rabietas se multiplicarán (especialmente en público donde tienes más presión). No aprende a gestionar frustración. No aprende que no siempre puede tener todo. Problemas de conducta futuros. Límites cada vez más difíciles de establecer.",
                        bookExplanation: "Carlos González advierte contra ceder por vergüenza social. Entendiendo que es difícil, pero ceder ante rabietas enseña exactamente lo contrario de lo que quieres enseñar. El niño aprende: 'Si armo un escándalo público, consigo lo que quiero'. Las rabietas son normales a los 3 años (aún no regulan bien), pero ceder las perpetúa. Los límites deben mantenerse, incluso (especialmente) en público.",
                        suggestedAlternatives: [
                            "Mantén el límite aunque sea difícil",
                            "Valida su emoción pero mantén el 'no'",
                            "Sal del supermercado si es necesario, pero no cedas",
                            "Ignora las miradas, estás educando a tu hijo"
                        ]
                    ),
                    BM4Decision(
                        text: "Darle una bofetada 'para que aprenda' como sugiere la señora",
                        alignment: .low,
                        shortTermImpact: "Le das una bofetada. El niño se calla de golpe... de shock. Te mira con ojos llorosos, confundido y traicionado. La gente alrededor asiente con aprobación. Sales del super con tu hijo en silencio. Pero ese silencio es de trauma, no de aprendizaje. Tú te sientes horrible.",
                        longTermImpact: "TRAUMA. El niño aprende que quien más lo ama (tú) le pega. Aprende que la violencia es aceptable. Daño al vínculo (posiblemente irreparable). Miedo a ti, no respeto. Mayor probabilidad de que él sea violento con otros. Problemas de conducta, no soluciones. Baja autoestima. Posible perpetuación del ciclo de violencia.",
                        bookExplanation: "Carlos González dedica un capítulo completo a explicar por qué NUNCA hay que pegar a un niño. Ni una bofetada, ni un azote. El castigo físico: (1) Daña el vínculo, (2) Enseña violencia, (3) No enseña razonamiento moral, (4) Genera miedo, no comprensión, (5) Baja la autoestima, (6) Es contraproducente a largo plazo. NO existe la 'bofetada a tiempo'. Solo existe el maltrato infantil disfrazado de educación.",
                        suggestedAlternatives: [
                            "NUNCA pegues a tu hijo por ninguna razón",
                            "Acompáñalo emocionalmente aunque sea difícil",
                            "Los límites pueden ser firmes sin violencia",
                            "Busca ayuda profesional si sientes que vas a perder el control"
                        ]
                    ),
                    BM4Decision(
                        text: "Agacharte a su nivel, validar su emoción y acompañar la rabieta con calma",
                        alignment: .high,
                        shortTermImpact: "Te agachas, ignorando las miradas. Le dices: 'Entiendo que quieras el juguete. Es frustrante no poder tenerlo. Puedes estar enfadado, estoy aquí contigo'. El niño sigue llorando (la emoción necesita salir) pero se siente acompañado. En 5-10 minutos se calma. Algunas personas te miran con aprobación, otras con desaprobación. No importa.",
                        longTermImpact: "El niño aprende: (1) Sus emociones son válidas, (2) Mamá/papá lo acompaña incluso cuando está enfadado, (3) Puede sentir frustración y sobrevivirá, (4) Los límites se mantienen pero con amor. A largo plazo: mejor gestión emocional, menos rabietas (se siente comprendido), relación basada en respeto mutuo.",
                        bookExplanation: "Carlos González explica que las rabietas son NORMALES a los 2-4 años. El cerebro aún no regula bien emociones. No son manipulación, son falta de control. La respuesta correcta es validación emocional + límite firme: 'Entiendo que estés enfadado (validación) Y no vamos a comprar el juguete (límite)'. Acompañar la rabieta enseña gestión emocional. Castigarla enseña represión. Ceder enseña que funciona. Solo acompañar enseña lo correcto.",
                        suggestedAlternatives: nil
                    ),
                    BM4Decision(
                        text: "Gritarle que se levante inmediatamente y amenazarlo con castigo",
                        alignment: .low,
                        shortTermImpact: "Le gritas: '¡LEVÁNTATE YA! ¡Si no te levantas, no hay parque esta tarde!'. El niño se asusta y se levanta... pero sigue llorando, ahora también asustado. Sale del super en shock. La rabieta 'terminó' pero a base de miedo y amenaza.",
                        longTermImpact: "El niño aprende a obedecerte por miedo, no por comprensión. No aprende gestión emocional, aprende represión. Puede desarrollar conductas de evitación (esconde emociones por miedo). Daño a la autoestima. Relación basada en miedo, no en respeto. Problemas emocionales futuros.",
                        bookExplanation: "Carlos González critica los castigos y amenazas. No enseñan nada útil. El niño obedece por miedo, no porque entienda. Gritar y amenazar daña el vínculo. Las rabietas no desaparecen (el niño aún no regula), solo se reprimen por miedo. Esto no es educación, es dominación. Un niño que obedece por miedo no ha desarrollado moral, solo ha desarrollado temor.",
                        suggestedAlternatives: [
                            "Mantén la calma aunque sea difícil (respira hondo)",
                            "Valida la emoción, mantén el límite, acompaña",
                            "La vergüenza pública pasa, el trauma no",
                            "Estás educando para el largo plazo, no para la galería"
                        ]
                    )
                ],
                category: .discipline,
                difficulty: .advanced
            ),
            
            // SIMULACIÓN 7: Colecho vs Intimidad de Pareja
            BM4Simulation(
                number: 7,
                title: "Presión para que el Niño Duerma Solo",
                context: "Balance entre necesidades del niño y vida de pareja.",
                initialSituation: "Tu hijo de 3 años duerme contigo desde que nació. Tu pareja está cansada de no tener 'espacio propio' en la cama y quiere 'recuperar la intimidad'. Has intentado varias veces pasarlo a su cama pero llora desesperadamente. Tu pediatra dice que 'ya es hora de que duerma solo, es muy grande'. Una amiga te cuenta que ella aplicó el método 'dejarlo llorar' y funcionó en 3 noches. Te sientes dividida: ¿Priorizo las necesidades de mi pareja? ¿Las de mi hijo? ¿Existe un balance?",
                externalPressures: [
                    "Tu pareja: 'Necesito dormir sin patadas, necesito intimidad contigo'",
                    "Pediatra: 'A los 3 años ya debería dormir solo en su habitación'",
                    "Tu amiga: '3 noches de llanto y ya, funciona. Luego duerme como un ángel'",
                    "Tu voz interna: '¿Estoy siendo egoísta con mi pareja? ¿O con mi hijo?'"
                ],
                decisions: [
                    BM4Decision(
                        text: "Aplicar método conductista: dejarlo llorar en su habitación hasta que se resigne",
                        alignment: .low,
                        shortTermImpact: "Primera noche: llora 1 hora antes de quedarse en silencio (no dormido, resignado). Segunda noche: 45 minutos. Tercera noche: 20 minutos. Parece que 'funciona'. Pero desarrolla terrores nocturnos. Se despierta gritando. Cuando vas, no quiere que te vayas. Está más pegajoso de día.",
                        longTermImpact: "Trauma relacionado con el sueño. Posible desarrollo de pesadillas, terrores nocturnos, insomnio. Sensación de abandono ('lloré y nadie vino'). Daño al apego seguro. Paradójicamente, puede volverse MÁS dependiente (inseguridad). Problemas de sueño en adolescencia. Recuerdo traumático de la infancia.",
                        bookExplanation: "Carlos González critica duramente estos métodos. El silencio NO es éxito, es resignación aprendida ('lloré tanto que me rendí'). El niño no ha aprendido a dormir, ha aprendido que sus llamadas no importan. Los terrores nocturnos son frecuentes tras estos métodos (ansiedad reprimida que sale de noche). La 'efectividad' es aparente: el niño duerme solo pero a base de trauma, no de madurez.",
                        suggestedAlternatives: [
                            "Transición gradual si el niño está listo (acompañarlo en SU cama)",
                            "Colchón en el suelo de tu habitación como paso intermedio",
                            "Buscar intimidad en otros momentos/lugares, no a costa del niño",
                            "Cada niño duerme solo cuando está listo, generalmente 4-7 años"
                        ]
                    ),
                    BM4Decision(
                        text: "Transición gradual: acompañarlo a dormir en SU cama, luego irte cuando esté dormido",
                        alignment: .medium,
                        shortTermImpact: "Intentas la transición. Algunas noches funciona (se duerme acompañado y sigue dormido). Otras noches se despierta y viene a tu cama (lo aceptas). Es proceso lento, irregular. Requiere paciencia. Algunos avances, algunas regresiones. Puede llevar meses.",
                        longTermImpact: "Si el niño ESTÁ listo (alrededor de 4-5 años), eventualmente acepta dormir solo. Si NO está listo, seguirá viniendo a tu cama (señal de que necesita más tiempo). Proceso gradual sin traumas. Respetas su ritmo. Cuando finalmente duerme solo, es por madurez, no por resignación.",
                        bookExplanation: "Carlos González apoya las transiciones graduales SOLO si el niño muestra señales de estar preparado. Señales: acepta quedarse en su cama, no llora desesperadamente, puede consolarse solo. Si el niño llora intensamente, NO está listo. No hay prisa. Forzar una transición para la que no está preparado generará problemas. Mejor esperar unos meses más.",
                        suggestedAlternatives: [
                            "Si vuelve a tu cama cada noche, aún no está preparado",
                            "Espera unos meses más y vuelve a intentar",
                            "No es fracaso que necesite más tiempo, es respetar su desarrollo"
                        ]
                    ),
                    BM4Decision(
                        text: "Explicar a tu pareja que cada niño tiene su tiempo, buscar intimidad en otros momentos",
                        alignment: .high,
                        shortTermImpact: "Hablas honestamente con tu pareja. Explicas que tu hijo aún necesita cercanía nocturna. Propones: intimidad antes de que el niño se duerma, o en otros momentos del día, o dormir juntos en la sala una vez por semana. Tu pareja puede sentirse frustrada inicialmente, pero si ama al niño, entenderá.",
                        longTermImpact: "Pareja que comprende y apoya (o conflicto que revela incompatibilidad en valores de crianza). Tu hijo mantiene seguridad nocturna. Dormirá solo cuando esté listo (4-7 años generalmente). Vínculo intacto. Sin traumas. Relación de pareja basada en comunicación honesta.",
                        bookExplanation: "Carlos González reconoce que el colecho puede generar tensión en la pareja. Pero defiende que las necesidades del niño no deben sacrificarse por comodidad adulta. Los niños necesitan cercanía nocturna. Es temporal (aunque parezca eterno). La intimidad de pareja puede adaptarse. Si la pareja no acepta, es un problema de pareja, no del niño. Conversación honesta y búsqueda de soluciones creativas es la clave.",
                        suggestedAlternatives: nil
                    ),
                    BM4Decision(
                        text: "Mantener el colecho hasta que él esté listo, priorizando su necesidad",
                        alignment: .high,
                        shortTermImpact: "Decides que tu hijo es la prioridad. Explicas a tu pareja que es temporal, que todos los niños eventualmente duermen solos. Buscas formas creativas de mantener intimidad. Tu pareja acepta o no (lo cual revelaría mucho). Tu hijo sigue sintiendo seguridad nocturna.",
                        longTermImpact: "Tu hijo dormirá solo cuando esté preparado (sin fecha fija, cada niño es diferente). Proceso natural, sin traumas. Apego seguro. Cuando sea adulto recordará que sus necesidades fueron respetadas. Relación de pareja que sobrevive si hay amor y comprensión real.",
                        bookExplanation: "Carlos González defiende priorizar las necesidades del niño. El colecho es temporal (aunque algunos lo vivan durante años). TODOS los niños eventualmente duermen solos. Forzar la independencia no la acelera, la retrasa. Los niños más 'dependidos' (con apego seguro) se vuelven los más independientes. Es paradójico pero real. Confía en el proceso natural.",
                        suggestedAlternatives: nil
                    )
                ],
                category: .sleep,
                difficulty: .advanced
            ),
            
            // SIMULACIÓN 8: Celos del Hermano
            BM4Simulation(
                number: 8,
                title: "Celos Intensos del Hermano Mayor",
                context: "Manejo de celos tras nacimiento de segundo hijo.",
                initialSituation: "Acabas de tener tu segundo bebé hace 3 semanas. Tu hijo mayor de 4 años ha cambiado completamente: se hace pipí encima (ya controlaba), pega al bebé cuando no miras, llora por todo, pide constantemente que lo cargues (justo cuando estás amamantando al bebé). Esta mañana le dijo al bebé 'Devuélvelo al hospital, ya no lo quiero'. Tu familia dice: 'Es un consentido, déjalo llorar un poco, tiene que aprender que ya no es el único'.",
                externalPressures: [
                    "Tu madre: 'Le das demasiada atención, por eso está celoso. Ignóralo'",
                    "Tu suegra: 'Cuando pega al bebé, castígalo fuerte para que aprenda'",
                    "Una tía: 'Esos son celos, es normal. Ya se le pasará. No le hagas tanto caso'",
                    "Tu culpa interna: '¿Estoy descuidando a mi hijo mayor?'"
                ],
                decisions: [
                    BM4Decision(
                        text: "Castigarlo cada vez que pega al bebé o muestra celos",
                        alignment: .low,
                        shortTermImpact: "Castigas severamente cada agresión al bebé (gritos, rincón de pensar, quitar privilegios). El niño deja de pegar... delante de ti. Pero lo hace cuando no miras. Los celos se intensifican (ahora también tiene resentimiento hacia ti). Se retrae, deja de expresar sus emociones.",
                        longTermImpact: "Celos reprimidos pero no resueltos. Relación dañada con el hermano (resentimiento duradero). Sensación de haber sido 'reemplazado' y castigado por sentir. Baja autoestima. Posibles problemas de conducta futuros. Relación tensa con los padres. El problema empeora, no mejora.",
                        bookExplanation: "Carlos González explica que los celos son NORMALES y SANOS. Son una muestra de amor ('te quiero tanto que no quiero compartirte'). Castigar los celos no los elimina, los reprime. El niño necesita MÁS atención, no menos. MÁS amor, no castigos. Los celos son un problema emocional, no de conducta. Se resuelven con amor y atención individual, no con castigos.",
                        suggestedAlternatives: [
                            "Dale atención individual exclusiva cada día",
                            "Valida sus celos: 'Entiendo que sea difícil compartir a mamá/papá'",
                            "Protege al bebé sin castigar al mayor (redirige, supervisa)",
                            "Recuérdale que lo amas, que hay amor para ambos"
                        ]
                    ),
                    BM4Decision(
                        text: "Darle atención individual exclusiva, validar sus celos, reforzar que lo amas",
                        alignment: .high,
                        shortTermImpact: "Reservas 30 minutos diarios SOLO para él (mientras alguien cuida al bebé). Juegas, lees cuentos, le das atención plena. Validas: 'Es difícil compartir a mamá, ¿verdad? Te entiendo'. Le recuerdas: 'Te amo igual que siempre'. El niño se calma. Las agresiones disminuyen. Vuelve a sonreír.",
                        longTermImpact: "Los celos normales disminuyen. Relación sana con el hermano. El niño se siente seguro del amor parental. Entiende que puede haber amor para ambos. Desarrollo emocional sano. Hermanos que pueden ser amigos. Familia armoniosa.",
                        bookExplanation: "Carlos González enfatiza: los celos se curan con AMOR, no con castigos. El niño necesita sentirse especial, amado, único. Darle atención individual exclusiva (aunque sea 30 min diarios) es crucial. Validar sus emociones ('Es normal que tengas celos') le ayuda a procesarlas. Reforzar que lo amas tanto como siempre es fundamental. Los celos pasarán cuando se sienta seguro del amor parental.",
                        suggestedAlternatives: nil
                    ),
                    BM4Decision(
                        text: "Involucrarle en el cuidado del bebé como 'hermano mayor importante'",
                        alignment: .high,
                        shortTermImpact: "Le das tareas simples: 'Tráeme un pañal', 'Cántale mientras lo cambio'. Lo haces sentir importante y útil. Elogias su ayuda. El niño se siente orgulloso. Los celos disminuyen al sentirse incluido, no reemplazado. Se interesa por el bebé de forma positiva.",
                        longTermImpact: "Relación positiva con el hermano desde el inicio. El niño se siente importante y útil (no reemplazado). Desarrollo de empatía y responsabilidad. Hermanos con vínculo fuerte. El niño recuerda que lo hiciste sentir especial durante esta transición difícil.",
                        bookExplanation: "Carlos González sugiere involucrar al hermano mayor en el cuidado del bebé (tareas apropiadas para su edad). Esto lo hace sentir importante, no desplazado. 'Eres el hermano mayor, eres especial, el bebé te necesita'. Esto no elimina todos los celos (son normales) pero ayuda mucho. Combinado con atención individual, es muy efectivo.",
                        suggestedAlternatives: nil
                    )
                ],
                category: .separation,
                difficulty: .advanced
            ),
            
            // SIMULACIÓN 9: Malcriado con Amor
            BM4Simulation(
                number: 9,
                title: "Te Dicen que lo Estás Malcriando",
                context: "Defendiendo tu crianza con apego ante críticas constantes.",
                initialSituation: "Tu bebé de 8 meses pide brazos constantemente (lo porteas), duerme contigo (colecho), toma pecho a demanda. Cada visita familiar termina igual: 'Lo estás malcriando', 'Nunca va a ser independiente', 'Te está tomando el pelo', 'Ese niño es un tirano', 'Le estás creando malos hábitos'. Empiezas a dudar: ¿Y si tienen razón? ¿Y si lo estoy haciendo mal? ¿Debo ser más 'dura'?",
                externalPressures: [
                    "Tu abuela: 'En mis tiempos dejábamos a los bebés en la cuna y listos. Y todos salimos bien'",
                    "Tu cuñado: 'Ese niño te manipula. Cuando llora, déjalo. Que se acostumbre'",
                    "Una vecina: 'Mi hijo dormía solo, en su cuna, sin brazos. Y es independiente'",
                    "Tu inseguridad: '¿Estaré equivocada? ¿Todos no pueden estar equivocados?'"
                ],
                decisions: [
                    BM4Decision(
                        text: "Empezar a dejarlo llorar y forzar independencia para 'no malcriarlo'",
                        alignment: .low,
                        shortTermImpact: "Decides cambiar tu crianza. Cuando pide brazos, lo dejas en el suelo ('que juegue solo'). Cuando llora, esperas antes de responder. Lo pasas a su cuna (llora 40 minutos antes de dormirse). Cada cambio es trauma. El bebé está confundido: ¿Qué pasó con mamá? Llora más intensamente. Tú sufres pero te dices 'es por su bien'.",
                        longTermImpact: "Daño al apego seguro que habías construido. Bebé más inseguro, no más independiente. Paradójicamente, se vuelve más demandante (por inseguridad). No aprende independencia, aprende desconfianza. Posibles problemas emocionales futuros. Tú pierdes la conexión que tenías. Todos pierden.",
                        bookExplanation: "Carlos González explica que es IMPOSIBLE malcriar con amor. El amor NUNCA sobra. Los bebés que reciben MÁS amor, MÁS brazos, MÁS respuesta se vuelven MÁS seguros y MÁS independientes (paradoja del apego). Los bebés privados se vuelven inseguros y dependientes emocionalmente. Ceder a la presión social y cambiar una crianza que estaba funcionando es el verdadero error. Confía en tu instinto, que estaba correcto.",
                        suggestedAlternatives: [
                            "Vuelve a tu crianza con apego que estaba funcionando",
                            "El problema no es tu crianza, es la presión externa",
                            "Educa a tu familia o limita contacto si no respetan",
                            "Busca apoyo en grupos de crianza con apego"
                        ]
                    ),
                    BM4Decision(
                        text: "Defender tu crianza con argumentos científicos y del libro",
                        alignment: .high,
                        shortTermImpact: "Explicas: 'El apego seguro es la base de la independencia futura. La OMS recomienda esto que estoy haciendo. Los estudios dicen...'. Algunos familiares escuchan. Otros revierten los ojos. Pero has defendido tu posición. Te sientes empoderada. Tu bebé sigue recibiendo el amor que necesita.",
                        longTermImpact: "La familia aprende (o al menos deja de comentar). Tu hijo se beneficia de crianza con apego. Desarrollo de apego seguro. Independencia natural cuando llegue su momento (2-5 años). Adulto seguro y sano. Relación familiar basada en respeto a tus decisiones parentales.",
                        bookExplanation: "Carlos González anima a educar a la familia con datos y ciencia. Muchas críticas vienen de ignorancia, no de maldad. Explicar que la crianza con apego tiene respaldo científico (OMS, estudios de apego, neurociencia) puede cambiar opiniones. Si no cambian, al menos has dejado claro que no es 'idea tuya', es ciencia. Defender tu crianza es defender a tu hijo.",
                        suggestedAlternatives: nil
                    ),
                    BM4Decision(
                        text: "Evitar visitas familiares que te critican, proteger tu paz mental",
                        alignment: .high,
                        shortTermImpact: "Reduces visitas a la familia crítica. Te rodeas de personas que apoyan tu crianza (amigas con hijos, grupos de apego, tu pareja si te apoya). Hay algo de tensión familiar ('¿Por qué no vienes?') pero tu salud mental mejora. Tu bebé no escucha críticas constantes sobre cómo lo crías.",
                        longTermImpact: "Salud mental protegida. Crianza sin presión constante. Tu hijo crece en ambiente positivo. La familia eventualmente entiende que tienen que respetar o no te verán. Estableces límites saludables. Cuando tu hijo sea mayor y la crianza no sea tan cuestionada, podrás retomar relaciones.",
                        bookExplanation: "Carlos González valida totalmente proteger tu salud mental y la de tu hijo. Si las visitas familiares son constante crítica, es válido limitarlas. No es 'portarse mal', es autocuidado. Los bebés absorben la tensión. Un ambiente crítico es dañino. Es preferible menos contacto familiar pero en paz, que contacto frecuente pero tóxico. Tu prioridad es tu hijo, no complacer a familiares críticos.",
                        suggestedAlternatives: nil
                    )
                ],
                category: .externalPressure,
                difficulty: .advanced
            ),
            
            // SIMULACIÓN 10: Decisión sobre Guardería
            BM4Simulation(
                number: 10,
                title: "Decisión sobre Guardería a los 4 Meses",
                context: "Balance entre necesidad económica y necesidades del bebé.",
                initialSituation: "Tu baja maternal termina en 2 semanas. Tu bebé tiene 4 meses. Tienes que decidir YA qué hacer. Opciones: (A) Guardería 8h/día - lo más económico, (B) Cuidadora en casa - más caro pero el bebé en su entorno, (C) Reducción de jornada - cobras menos pero más tiempo con bebé, (D) Excedencia sin sueldo - riesgo económico pero tiempo completo. La presión económica es real. La renta no espera. Pero tu bebé te mira y llora cada vez que lo dejas 2 minutos. ¿Cómo decides?",
                externalPressures: [
                    "Tu jefe: 'O vuelves a tiempo completo o perdemos tu puesto'",
                    "Tu pareja: 'Necesitamos dos sueldos para la hipoteca'",
                    "Amigas: 'La guardería es buena para ellos, socializan y aprenden'",
                    "Tu culpa: 'Si no trabajo, no pago la casa. Si trabajo, abandono a mi bebé'"
                ],
                decisions: [
                    BM4Decision(
                        text: "Guardería 8 horas/día (es lo más económico y 'todos lo hacen')",
                        alignment: .low,
                        shortTermImpact: "Llevas al bebé a guardería. Llora desesperadamente cuando te vas. Tú también lloras en el coche. Te llaman 2 veces: 'No come', 'No para de llorar'. La lactancia disminuye (sin demanda diurna). Sacarte leche en el trabajo es complicado. Cuando lo recoges, está agotado y enfermo (virus de la guardería).",
                        longTermImpact: "Separación de 8-10 horas diarias es muy larga para un bebé de 4 meses. Probable fin de la lactancia (difícil de mantener sin demanda). Bebés en guardería enferman 1-2 veces al mes el primer año. Menos tiempo de crianza (solo 2-3 horas diarias con él despierto). Posible impacto en el vínculo. Estrés para todos.",
                        bookExplanation: "Carlos González critica la separación temprana (antes de 12 meses). Reconoce que es una realidad económica para muchas familias, no siempre una elección. Pero es importante ser honestos: NO es 'bueno para el bebé'. No 'socializa' mejor (a los 4 meses no socializa). Sí hay impacto en el vínculo y la lactancia. No es catastrófico, pero tampoco es ideal. Si es INEVITABLE por economía, buscar formas de minimizar impacto (reducir horas, cuidadora en casa).",
                        suggestedAlternatives: [
                            "Si es inevitable, elige guardería pequeña, familiar",
                            "Intenta media jornada si es posible",
                            "Mantén lactancia con tomas nocturnas intensas",
                            "Compensa con mucho contacto en tiempo juntos"
                        ]
                    ),
                    BM4Decision(
                        text: "Reducción de jornada (cobras menos pero más tiempo con el bebé)",
                        alignment: .high,
                        shortTermImpact: "Negocias media jornada. Cobras 60% pero ves a tu bebé 4 horas más al día. Ajustas gastos (menos restaurantes, menos lujos). El presupuesto es justo pero alcanza. Tu bebé solo está 4 horas en cuidados (en lugar de 8-10). La lactancia se mantiene mejor. Tú estás más cansada (trabajas + cuidas) pero más conectada.",
                        longTermImpact: "Balance entre ingresos y crianza. Lactancia mantenida. Más tiempo de calidad con tu bebé. Crianza más presente. Cuando sea mayor recordarás este tiempo juntos. Gastos ajustados pero familia unida. A largo plazo: no te arrepentirás de haber priorizado tiempo sobre dinero.",
                        bookExplanation: "Carlos González reconoce que no todas las familias pueden permitirse excedencia. Pero una reducción de jornada (si es viable económicamente) es un balance razonable. Mantienes ingresos (aunque menores) pero ganas TIEMPO (que nunca recuperarás). Los primeros años son únicos. El tiempo de calidad es real, pero el tiempo de CANTIDAD también importa. 4 horas diarias con tu bebé vs. 2 horas hace diferencia.",
                        suggestedAlternatives: nil
                    ),
                    BM4Decision(
                        text: "Excedencia (sin sueldo) para criar tiempo completo",
                        alignment: .high,
                        shortTermImpact: "Pides excedencia. Dejas de cobrar. El presupuesto familiar se reduce a un solo sueldo. Hay que ajustar mucho (nada de lujos, gastos mínimos). Es duro económicamente. Pero tienes TODO el tiempo con tu bebé. Lactancia plena. Colecho. Porteo. Crianza 100% presente. Tu bebé está feliz y seguro.",
                        longTermImpact: "Crianza con máxima presencia en años cruciales (0-3). Vínculo fortísimo. Lactancia exitosa prolongada. Desarrollo óptimo del bebé. Cuando vuelvas al trabajo (o no), no tendrás remordimientos ('estuve ahí'). Puede que económicamente sea duro, pero emocionalmente es riqueza. A largo plazo: relación madre/padre-hijo excepcional.",
                        bookExplanation: "Carlos González respeta profundamente a quienes eligen reducir ingresos para criar presentes. Reconoce que es un sacrificio económico y profesional real. La sociedad no valora ni apoya esta decisión (incluso critica: 'tiempo de calidad, no cantidad'). Pero defiende que criar a tus hijos es el trabajo más importante. Si puedes permitírtelo (aunque sea justo), el tiempo con tus hijos pequeños es inversión en su salud emocional futura.",
                        suggestedAlternatives: nil
                    ),
                    BM4Decision(
                        text: "Cuidadora en casa (más caro pero bebé en su entorno)",
                        alignment: .medium,
                        shortTermImpact: "Contratas cuidadora para casa. Es más caro que guardería pero el bebé está en su entorno, con una sola persona, sin virus constantes. La lactancia se mantiene mejor (la cuidadora puede traértelo a trabajar para mamar si trabajas cerca, o le das cuando llegas). Menos estrés que guardería.",
                        longTermImpact: "Balance entre trabajo y crianza. Bebé en entorno seguro. Menos enfermedades. Lactancia mantenible. Es más caro pero hay beneficios. Cuando sea mayor (2-3 años) puede ir a guardería para socializar (a esa edad ya es más apropiado). Primeros meses críticos pasados con más cercanía.",
                        bookExplanation: "Carlos González considera que cuidado individual en casa es preferible a guardería (si es viable económicamente). El bebé está con UNA persona (no 15), en SU entorno (menos estrés), sin exposición a virus constantes. No es la madre idealmente, pero es mucho mejor que guardería masiva. Si puedes permitírtelo, es buena opción para primeros meses.",
                        suggestedAlternatives: nil
                    )
                ],
                category: .separation,
                difficulty: .advanced
            )
        ]
    }
    
    private func colorForCategory(_ category: SimulationCategory) -> Color {
        switch category {
        case .sleep: return .indigo
        case .feeding: return .pink
        case .separation: return .blue
        case .discipline: return .orange
        case .development: return .purple
        case .externalPressure: return .red
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
struct BM4View_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            BM4View()
        }
    }
}

