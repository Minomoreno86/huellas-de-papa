import SwiftUI

/// Vista principal de la Capa 2 (Principios) del módulo Bésame Mucho
/// Presenta los 12 principios fundamentales de la crianza con apego según Carlos González
struct BM2View: View {
    @State private var selectedBlock: PrincipleBlock? = nil
    
    var body: some View {
        ScrollView {
            VStack(spacing: 32) {
                // 1. Header
                headerSection
                
                // 2. Filtro por bloques
                blockFilterSection
                
                // 3. Grid de principios
                principlesGridSection
                
                // 4. Escenarios prácticos
                scenariosSection
                
                // 5. Ideas clave
                keyIdeasSection
                
                // 6. Frase final
                motivationalQuoteSection
            }
            .padding()
        }
        .background(Color(.systemGroupedBackground))
        .navigationTitle("Principios")
        .navigationBarTitleDisplayMode(.large)
    }
    
    // MARK: - 1. Header Section
    private var headerSection: some View {
        VStack(spacing: 16) {
            Text("12 Principios Fundamentales")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundStyle(
                    LinearGradient(
                        gradient: Gradient(colors: [.blue, .mint]),
                        startPoint: .leading,
                        endPoint: .trailing
                    )
                )
            
            Text("Comprendiendo por qué los niños se comportan como lo hacen")
                .font(.title3)
                .fontWeight(.medium)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
            
            Text("Basado en ciencia, biología y respeto")
                .font(.subheadline)
                .foregroundColor(.blue)
                .italic()
        }
        .padding(.vertical)
    }
    
    // MARK: - 2. Block Filter Section
    private var blockFilterSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Bloques Temáticos")
                .font(.headline)
                .foregroundColor(.primary)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 12) {
                    // Botón "Todos"
                    Button(action: {
                        triggerHaptic()
                        withAnimation(.spring(response: 0.3, dampingFraction: 0.7)) {
                            selectedBlock = nil
                        }
                    }) {
                        Text("Todos")
                            .font(.subheadline)
                            .fontWeight(.medium)
                            .foregroundColor(selectedBlock == nil ? .white : .blue)
                            .padding(.horizontal, 16)
                            .padding(.vertical, 8)
                            .background(
                                Capsule()
                                    .fill(selectedBlock == nil ? Color.blue : Color.blue.opacity(0.1))
                            )
                    }
                    
                    ForEach([PrincipleBlock.biologicalNeeds, .communicationResponse, .developmentAutonomy, .respectfulParenting], id: \.self) { block in
                        Button(action: {
                            triggerHaptic()
                            withAnimation(.spring(response: 0.3, dampingFraction: 0.7)) {
                                selectedBlock = block
                            }
                        }) {
                            HStack(spacing: 6) {
                                Image(systemName: block.icon)
                                Text(block.rawValue)
                            }
                            .font(.subheadline)
                            .fontWeight(.medium)
                            .foregroundColor(selectedBlock == block ? .white : colorForBlock(block))
                            .padding(.horizontal, 16)
                            .padding(.vertical, 8)
                            .background(
                                Capsule()
                                    .fill(selectedBlock == block ? colorForBlock(block) : colorForBlock(block).opacity(0.1))
                            )
                        }
                    }
                }
                .padding(.horizontal, 4)
            }
        }
    }
    
    // MARK: - 3. Principles Grid Section
    private var principlesGridSection: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Los 12 Principios")
                .font(.title2)
                .fontWeight(.semibold)
                .foregroundColor(.primary)
            
            LazyVGrid(columns: [GridItem(.flexible())], spacing: 16) {
                ForEach(filteredPrinciples) { principle in
                    BM2PrincipleCard(principle: principle)
                }
            }
        }
    }
    
    // MARK: - 4. Scenarios Section
    private var scenariosSection: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Aplicación en Situaciones Reales")
                .font(.title2)
                .fontWeight(.semibold)
                .foregroundColor(.primary)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 16) {
                    ForEach(practicalScenarios) { scenario in
                        BM2ScenarioCard(scenario: scenario)
                    }
                }
                .padding(.horizontal, 4)
            }
        }
    }
    
    // MARK: - 5. Key Ideas Section
    private var keyIdeasSection: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Ideas Clave para Recordar")
                .font(.title2)
                .fontWeight(.semibold)
                .foregroundColor(.primary)
            
            VStack(spacing: 12) {
                ForEach(keyIdeas) { idea in
                    HStack(alignment: .top, spacing: 12) {
                        Image(systemName: "quote.bubble.fill")
                            .foregroundColor(.blue)
                            .font(.title3)
                        
                        VStack(alignment: .leading, spacing: 6) {
                            Text(idea.quote)
                                .font(.body)
                                .fontWeight(.semibold)
                                .foregroundColor(.primary)
                                .italic()
                            
                            Text(idea.context)
                                .font(.caption)
                                .foregroundColor(.secondary)
                        }
                    }
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 12)
                            .fill(Color(.systemBackground))
                            .shadow(color: Color.blue.opacity(0.1), radius: 4, x: 0, y: 2)
                    )
                }
            }
        }
    }
    
    // MARK: - 6. Motivational Quote Section
    private var motivationalQuoteSection: some View {
        VStack(spacing: 20) {
            Text("💙 Mensaje Final")
                .font(.headline)
                .fontWeight(.semibold)
                .foregroundColor(.primary)
            
            VStack(spacing: 12) {
                Text("\"Los días más felices de tu hijo dependen de ti. Dale todo el amor que puedas, porque el amor nunca sobra.\"")
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
    private var filteredPrinciples: [BM2Principle] {
        if let selectedBlock = selectedBlock {
            return allPrinciples.filter { $0.block == selectedBlock }
        }
        return allPrinciples
    }
    
    // MARK: - Data
    private var allPrinciples: [BM2Principle] {
        [
            // BLOQUE 1: Necesidades Biológicas (1-4)
            BM2Principle(
                number: 1,
                title: "Por Qué No Quieren Quedarse Solos",
                concept: "La angustia de separación es protectora, no manipulación",
                explanation: "Los bebés humanos están programados evolutivamente para necesitar contacto constante. En la naturaleza, un bebé solo es un bebé muerto. La angustia que sienten al quedarse solos no es capricho ni manipulación: es su sistema de alarma biológico funcionando correctamente. Los bebés que lloraban cuando se quedaban solos alertaban a sus madres y sobrevivían.",
                practicalApplication: "Responde a su necesidad de cercanía sin culpa. No es que 'se acostumbre mal', es que necesita tu presencia para sentirse seguro.",
                scientificBasis: "La angustia de separación es una respuesta normal y saludable que aparece alrededor de los 8 meses y es señal de apego seguro.",
                block: .biologicalNeeds
            ),
            BM2Principle(
                number: 2,
                title: "Por Qué Siempre Quieren Brazos",
                concept: "El porteo continuo es nuestra biología",
                explanation: "Los bebés humanos nacen esperando ser portados constantemente, como los simios. No para quedarse solos en cunas. Su reflejo de agarre (heredado de cuando nos agarrábamos del pelo de nuestras madres), su llanto ante la separación, su necesidad de contacto, son adaptaciones evolutivas. Somos primates portadores.",
                practicalApplication: "Usa portabebés, da brazos sin límite. No se va a malcriar. Sus brazos son su hábitat natural.",
                scientificBasis: "El contacto físico regula la temperatura, el ritmo cardíaco y las emociones del bebé. Es una necesidad biológica, no un lujo.",
                block: .biologicalNeeds
            ),
            BM2Principle(
                number: 3,
                title: "Por Qué No Quieren Dormir Solos",
                concept: "El colecho es natural y seguro",
                explanation: "Dormir solos es antinatural para mamíferos. Los bebés necesitan la cercanía nocturna por seguridad, regulación térmica y facilitar la lactancia. El colecho ha sido la norma en la humanidad durante 200,000 años. Las cunas en habitaciones separadas son un invento reciente y occidental.",
                practicalApplication: "El colecho es una opción válida, no un problema. Practicado con seguridad (sin alcohol, drogas, sofás) es beneficioso.",
                scientificBasis: "El colecho facilita la lactancia nocturna, sincroniza los ciclos de sueño madre-bebé y reduce el estrés del bebé.",
                block: .biologicalNeeds
            ),
            BM2Principle(
                number: 4,
                title: "Por Qué Llaman Nuestra Atención",
                concept: "Llamar la atención es supervivencia, no manipulación",
                explanation: "Los bebés NECESITAN atención constante para sobrevivir. No pueden alimentarse, moverse, regular su temperatura ni defenderse solos. Llamar la atención de sus cuidadores es su instinto de supervivencia, no un capricho. Los bebés que 'llamaban mucho la atención' eran los que sobrevivían.",
                practicalApplication: "Responde a sus llamadas, no ignores su necesidad. Tu respuesta le enseña que el mundo es seguro y que puede confiar.",
                scientificBasis: "Los bebés ignorados sufren estrés tóxico que afecta el desarrollo cerebral. La respuesta consistente crea apego seguro.",
                block: .biologicalNeeds
            ),
            
            // BLOQUE 2: Comunicación y Respuesta (5-7)
            BM2Principle(
                number: 5,
                title: "El Llanto Es Comunicación",
                concept: "El llanto es su única forma de hablar",
                explanation: "El llanto es la única herramienta de comunicación del bebé. No es manipulación, es necesidad real. Los bebés que lloraban cuando se separaban de sus madres o tenían hambre eran los que sobrevivían. Por selección natural, TODOS descendemos de bebés que lloraban intensamente.",
                practicalApplication: "Responde siempre al llanto. Tu bebé no sabe 'manipular', solo sabe comunicar que te necesita.",
                scientificBasis: "Ignorar el llanto genera cortisol (hormona del estrés) que en niveles altos y prolongados daña el cerebro en desarrollo.",
                block: .communicationResponse
            ),
            BM2Principle(
                number: 6,
                title: "La Respuesta a la Separación",
                concept: "La angustia al separarse es señal de salud",
                explanation: "Los niños con apego seguro lloran cuando sus padres se van. Los que NO lloran pueden tener problemas de apego. La angustia de separación no es un problema a resolver, es una señal de que el vínculo es sano. El niño que llora está diciendo 'te necesito, no te vayas'.",
                practicalApplication: "Despedidas cariñosas, no huidas rápidas. Valida su emoción: 'Sé que es difícil, voy a volver'.",
                scientificBasis: "La angustia de separación es un indicador de vínculo sano. Los niños con apego inseguro pueden no mostrar angustia (se han resignado).",
                block: .communicationResponse
            ),
            BM2Principle(
                number: 7,
                title: "Contra el Llanto Terapéutico",
                concept: "Dejar llorar NO es terapéutico, es abandono",
                explanation: "Los métodos para 'enseñar a dormir' dejando llorar al bebé son crueles y contraproducentes. El bebé no 'aprende' a dormir, se RESIGNA porque nadie viene. Genera trauma, no aprendizaje. El silencio no significa que esté bien, significa que ha perdido la esperanza de que alguien responda.",
                practicalApplication: "Nunca dejes llorar a tu bebé solo. Si llora, es porque te necesita.",
                scientificBasis: "El llanto prolongado sin respuesta genera niveles tóxicos de cortisol que dañan el hipocampo (memoria y aprendizaje).",
                block: .communicationResponse
            ),
            
            // BLOQUE 3: Desarrollo y Autonomía (8-10)
            BM2Principle(
                number: 8,
                title: "Cuándo Se Hará Independiente",
                concept: "La independencia es resultado del apego, no de la separación",
                explanation: "Paradójicamente, los niños más 'dependidos' (con apego seguro) se vuelven MÁS independientes. Los separados prematuramente quedan inseguros y dependientes emocionalmente toda su vida. La independencia no se enseña forzando separaciones, se CONSIGUE dando todo el apego que el niño necesita.",
                practicalApplication: "Cada niño tiene su ritmo para dejar el pecho, dormir solo, etc. No lo forces. Llegará cuando esté preparado.",
                scientificBasis: "El apego seguro (conseguido con respuesta y cercanía) es la base de la autonomía futura y la salud mental.",
                block: .developmentAutonomy
            ),
            BM2Principle(
                number: 9,
                title: "Control de Esfínteres sin Presión",
                concept: "El control de esfínteres no se enseña, se espera",
                explanation: "Forzar el control de esfínteres antes de que el niño esté maduro neurológicamente causa problemas (infecciones, estreñimiento, enuresis). Cada niño controla a su tiempo, entre los 2 y 4 años generalmente. No hay prisa. Los pañales no son un problema, la presión sí lo es.",
                practicalApplication: "Espera las señales de madurez (avisa cuando está mojado, pide el baño), no impongas fechas arbitrarias.",
                scientificBasis: "El control de esfínteres requiere madurez neurológica de los nervios que controlan la vejiga y el intestino. No se puede acelerar.",
                block: .developmentAutonomy
            ),
            BM2Principle(
                number: 10,
                title: "Respeto a Sus Ritmos Naturales",
                concept: "Cada niño es único, no hay normas universales",
                explanation: "Dejar el pecho, dormir solo, caminar, hablar, controlar esfínteres... todo tiene su momento para cada niño. Comparar y presionar solo genera estrés. Los hitos del desarrollo tienen rangos amplios de normalidad. Tu hijo no está 'atrasado', está en SU tiempo.",
                practicalApplication: "No compares con otros niños. Respeta su ritmo individual. Llegará a todo cuando esté preparado.",
                scientificBasis: "El desarrollo es un proceso biológico que sigue su curso. No se puede acelerar, solo se puede respetar o entorpecer.",
                block: .developmentAutonomy
            ),
            
            // BLOQUE 4: Crianza Respetuosa (11-12)
            BM2Principle(
                number: 11,
                title: "Su Hijo Es Buena Persona",
                concept: "Los niños nacen buenos, no hay que domarlos",
                explanation: "Los niños son naturalmente: desinteresados (comparten), generosos (dan), ecuánimes (perdonan), valientes (afrontan miedos), sinceros (dicen la verdad), sociables (buscan compañía), comprensivos (entienden). No necesitan ser domados ni disciplinados duramente. Necesitan ser AMADOS y GUIADOS con respeto.",
                practicalApplication: "Confía en la bondad natural de tu hijo. No es tu enemigo, es tu aliado.",
                scientificBasis: "La empatía y la cooperación son innatas en humanos. Los bebés de 18 meses ya muestran conductas altruistas.",
                block: .respectfulParenting
            ),
            BM2Principle(
                number: 12,
                title: "Contra el Castigo y la Violencia",
                concept: "Ni una bofetada, ni un castigo",
                explanation: "El castigo físico y emocional (bofetadas, azotes, gritos, humillaciones) daña el vínculo, la autoestima y enseña que la violencia es aceptable. Los niños educados con violencia aprenden violencia. NO funciona para educar, solo para dominar mediante el miedo. Existen alternativas respetuosas.",
                practicalApplication: "Educa con amor y límites respetuosos, nunca con dolor. Los límites pueden ser firmes sin ser violentos.",
                scientificBasis: "El castigo físico se asocia con peor salud mental, mayor agresividad y problemas de conducta a largo plazo.",
                block: .respectfulParenting
            )
        ]
    }
    
    private var practicalScenarios: [BM2Scenario] {
        [
            BM2Scenario(
                principleNumber: 1,
                situation: "No quiere quedarse solo ni un segundo",
                commonMistake: "\"Tiene que acostumbrarse. Déjalo solo un rato, que llore si quiere. Así aprenderá.\"",
                besameMuchoResponse: "\"Es normal que no quiera estar solo. Es su instinto de supervivencia. Lléva­lo contigo cuando puedas, o déjale algo tuyo (una prenda que huela a ti).\"",
                expectedOutcome: "Bebé que confía en que sus necesidades serán atendidas. Menor ansiedad a largo plazo."
            ),
            BM2Scenario(
                principleNumber: 2,
                situation: "Pide brazos constantemente, no puedo hacer nada",
                commonMistake: "\"Lo estás malcriando. Si sigues cogiéndolo tanto, nunca se va a despegar de ti.\"",
                besameMuchoResponse: "\"Usa un portabebés. Así tiene el contacto que necesita y tú tienes las manos libres. No se malcría, se cría.\"",
                expectedOutcome: "Bebé seguro y regulado. Madre con movilidad. Vínculo fortalecido."
            ),
            BM2Scenario(
                principleNumber: 3,
                situation: "No duerme en su cuna, solo conmigo",
                commonMistake: "\"Tiene que dormir en su cuna desde el principio o nunca saldrá de tu cama. Es un mal hábito.\"",
                besameMuchoResponse: "\"El colecho es normal y saludable. Duerme donde todos duerman mejor. Ya dormirá solo cuando esté preparado.\"",
                expectedOutcome: "Noches más tranquilas. Lactancia facilitada. Bebé y padres más descansados."
            ),
            BM2Scenario(
                principleNumber: 4,
                situation: "Llora cada vez que intento hacer algo sin él",
                commonMistake: "\"Está llamando la atención. Si le haces caso, lo vas a mal acostumbrar.\"",
                besameMuchoResponse: "\"Necesita tu presencia. Mientras es bebé, llévalo contigo o háblale para que sepa que estás cerca.\"",
                expectedOutcome: "Bebé que sabe que puede contar contigo. Menos estrés para ambos."
            ),
            BM2Scenario(
                principleNumber: 5,
                situation: "Llora 'por nada' según mi familia",
                commonMistake: "\"Déjalo llorar, está manipulando. Si corres cada vez que llora, te va a tomar el pelo.\"",
                besameMuchoResponse: "\"Los bebés no manipulan, comunican. Si llora, es porque te necesita. Responde siempre.\"",
                expectedOutcome: "Bebé que confía en que será atendido. Desarrollo de apego seguro."
            ),
            BM2Scenario(
                principleNumber: 6,
                situation: "Llora desesperadamente cuando me voy al trabajo",
                commonMistake: "\"Vete rápido sin que te vea, así no sufre. Si te quedas consolándolo, empeora.\"",
                besameMuchoResponse: "\"Despídete siempre con amor. Dile que vas a volver. Su llanto es normal y sano, significa que te quiere.\"",
                expectedOutcome: "Niño que aprende que las separaciones son temporales y que siempre vuelves."
            ),
            BM2Scenario(
                principleNumber: 7,
                situation: "Me aconsejan dejarlo llorar para que 'aprenda' a dormir",
                commonMistake: "\"Déjalo llorar 5 minutos, luego 10, luego 15. En unos días dormirá solo.\"",
                besameMuchoResponse: "\"Nunca dejes llorar a tu bebé. Si llora, es porque te necesita. Acompáñalo hasta que se duerma.\"",
                expectedOutcome: "Bebé que asocia el sueño con seguridad, no con abandono. Mejor salud emocional."
            ),
            BM2Scenario(
                principleNumber: 8,
                situation: "¿Cuándo será menos dependiente? Ya tiene 2 años",
                commonMistake: "\"Ya es muy grande para brazos/pecho/tu cama. Tienes que ponerle límites o nunca se hará independiente.\"",
                besameMuchoResponse: "\"La independencia llegará sola. Mientras más satisfagas sus necesidades ahora, más seguro será después.\"",
                expectedOutcome: "Niño que se independiza gradualmente y con confianza, a su propio ritmo."
            ),
            BM2Scenario(
                principleNumber: 9,
                situation: "Presión familiar para que quite el pañal 'ya'",
                commonMistake: "\"Ya cumplió 2 años, es hora de quitarle el pañal. Ponlo en el baño cada hora hasta que aprenda.\"",
                besameMuchoResponse: "\"Esperaré a que muestre señales de estar listo. Forzarlo solo causa problemas. Cada niño tiene su tiempo.\"",
                expectedOutcome: "Control de esfínteres sin traumas, sin infecciones, sin regresiones."
            ),
            BM2Scenario(
                principleNumber: 10,
                situation: "Aún toma pecho a los 2 años, me dicen que lo quite",
                commonMistake: "\"Ya es muy grande para el pecho. Le va a hacer daño. Debes quitárselo ya.\"",
                besameMuchoResponse: "\"La OMS recomienda lactancia hasta los 2 años o más. Lo dejaremos cuando ambos estemos preparados, sin prisa.\"",
                expectedOutcome: "Destete natural, respetuoso y sin traumas emocionales."
            ),
            BM2Scenario(
                principleNumber: 11,
                situation: "Me dicen que lo estoy malcriando con tanto amor",
                commonMistake: "\"Lo estás haciendo débil. Tiene que aprender que no siempre puede tener lo que quiere.\"",
                besameMuchoResponse: "\"El amor nunca malcría. Los niños que reciben más amor son los más seguros y equilibrados.\"",
                expectedOutcome: "Niño con alta autoestima, seguro emocionalmente y capaz de amar."
            ),
            BM2Scenario(
                principleNumber: 12,
                situation: "Me aconsejan 'una nalgada a tiempo' para que obedezca",
                commonMistake: "\"Una bofetada a tiempo no le hace daño a nadie. Así aprenden rápido.\"",
                besameMuchoResponse: "\"Nunca pegaré a mi hijo. Los límites pueden ser firmes sin ser violentos. El respeto se enseña con respeto.\"",
                expectedOutcome: "Niño que aprende a resolver conflictos sin violencia. Vínculo sano con los padres."
            )
        ]
    }
    
    private var keyIdeas: [BM2KeyIdea] {
        [
            BM2KeyIdea(
                quote: "La independencia no se enseña, se consigue",
                context: "Los niños se vuelven independientes cuando tienen todo el apego que necesitan, no cuando se les fuerza a serlo"
            ),
            BM2KeyIdea(
                quote: "Los niños no se acostumbran a llorar solos, se resignan",
                context: "El silencio después de llorar no es aprendizaje, es resignación y trauma"
            ),
            BM2KeyIdea(
                quote: "El colecho no crea dependencia, crea seguridad",
                context: "Dormir con los padres es lo natural. La independencia llegará cuando el niño esté preparado"
            ),
            BM2KeyIdea(
                quote: "Tus brazos son su hábitat natural",
                context: "Los bebés humanos están diseñados para ser portados constantemente como los primates"
            ),
            BM2KeyIdea(
                quote: "No existe el 'mal hábito' de mamar por la noche",
                context: "La lactancia nocturna es normal, necesaria y beneficiosa para bebé y madre"
            ),
            BM2KeyIdea(
                quote: "La angustia de separación es señal de apego sano",
                context: "Los niños que lloran cuando sus padres se van tienen un vínculo fuerte y saludable"
            )
        ]
    }
    
    private func colorForBlock(_ block: PrincipleBlock) -> Color {
        switch block {
        case .biologicalNeeds: return .blue
        case .communicationResponse: return .mint
        case .developmentAutonomy: return .purple
        case .respectfulParenting: return .pink
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
struct BM2View_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            BM2View()
        }
    }
}

