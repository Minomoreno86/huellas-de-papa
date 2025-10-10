import SwiftUI

/// Vista principal de la Capa 1 (Fundamentos) del módulo Bésame Mucho
/// Forma al padre en los fundamentos de la crianza con apego según Carlos González
struct BM1View: View {
    @State private var selectedApproach: ParentingApproach = .attachment
    
    var body: some View {
        ScrollView {
            VStack(spacing: 32) {
                // 1. Header animado — título + subtítulo
                headerSection
                
                // 2. Sección Conceptos - scroll horizontal con tarjetas limpias
                theoreticalSectionsScrollView
                
                // 3. Comparador interactivo (Autoritaria/Con Apego Toggle)
                comparisonSection
                
                // 4. Bloque Pilares (grid 2×2)
                pillarsGridSection
                
                // 5. Escenas clínicas (slide horizontal)
                clinicalExamplesSection
                
                // 6. Frase final motivacional
                motivationalQuoteSection
            }
            .padding()
        }
        .background(Color(.systemGroupedBackground))
        .navigationTitle("Fundamentos")
        .navigationBarTitleDisplayMode(.large)
    }
    
    // MARK: - 1. Header Section
    private var headerSection: some View {
        VStack(spacing: 16) {
            Text("Bésame Mucho")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundStyle(
                    LinearGradient(
                        gradient: Gradient(colors: [.blue, .mint]),
                        startPoint: .leading,
                        endPoint: .trailing
                    )
                )
            
            Text("Fundamentos de la Crianza con Apego")
                .font(.title3)
                .fontWeight(.medium)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
                .lineLimit(nil)
            
            Text("Cómo criar a tus hijos con amor siguiendo su naturaleza biológica")
                .font(.subheadline)
                .foregroundColor(.blue)
                .multilineTextAlignment(.center)
                .italic()
        }
        .padding(.vertical)
    }
    
    // MARK: - 2. Theoretical Sections Scroll View
    private var theoreticalSectionsScrollView: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Conceptos Fundamentales")
                .font(.title2)
                .fontWeight(.semibold)
                .foregroundColor(.primary)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 16) {
                    ForEach(theoreticalSections) { section in
                        BM1SectionCard(section: section)
                    }
                }
                .padding(.horizontal, 4)
            }
        }
    }
    
    // MARK: - 3. Comparison Section
    private var comparisonSection: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Dos Visiones de la Crianza")
                .font(.title2)
                .fontWeight(.semibold)
                .foregroundColor(.primary)
            
            BM1ComparisonToggle(selectedApproach: $selectedApproach)
        }
    }
    
    // MARK: - 4. Pillars Grid Section
    private var pillarsGridSection: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Los Cuatro Pilares del Apego")
                .font(.title2)
                .fontWeight(.semibold)
                .foregroundColor(.primary)
            
            LazyVGrid(columns: [
                GridItem(.flexible()),
                GridItem(.flexible())
            ], spacing: 16) {
                ForEach(attachmentPillars) { pillar in
                    BM1PillarCard(pillar: pillar)
                }
            }
        }
    }
    
    // MARK: - 5. Clinical Examples Section
    private var clinicalExamplesSection: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Situaciones Reales")
                .font(.title2)
                .fontWeight(.semibold)
                .foregroundColor(.primary)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 16) {
                    ForEach(clinicalExamples) { example in
                        BM1ExampleCard(example: example)
                    }
                }
                .padding(.horizontal, 4)
            }
        }
    }
    
    // MARK: - 6. Motivational Quote Section
    private var motivationalQuoteSection: some View {
        VStack(spacing: 20) {
            Text("💙 Mensaje de Carlos González")
                .font(.headline)
                .fontWeight(.semibold)
                .foregroundColor(.primary)
            
            VStack(spacing: 12) {
                Text("\"Amar a tus hijos no los malcría. Los hace seguros, felices y capaces de amar.\"")
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
            .shadow(
                color: Color.blue.opacity(0.1),
                radius: 8,
                x: 0,
                y: 4
            )
        }
    }
    
    // MARK: - Data Properties
    private var theoreticalSections: [BM1Section] {
        [
            BM1Section(
                title: "El Niño Bueno y el Niño Malo",
                subtitle: "Dos visiones antagónicas de la infancia",
                description: "Existen dos concepciones radicalmente opuestas sobre la naturaleza infantil que determinan cómo educamos a nuestros hijos:\n\n• VISIÓN 1 - El niño como ser amoroso: El niño es tierno, frágil, desvalido, cariñoso, inocente. Necesita nuestra atención y cuidados para convertirse en un adulto encantador. Esta visión ve al niño como amigo.\n\n• VISIÓN 2 - El niño como ser manipulador: El niño es egoísta, malvado, hostil, cruel, calculador, manipulador. Solo si doblegamos su voluntad desde el principio y le imponemos una rígida disciplina podremos convertirlo en un hombre de provecho. Esta visión ve al niño como enemigo.\n\nEstas dos visiones impregnan los consejos de familiares, educadores y profesionales. Carlos González defiende que los niños SON buenos, sus necesidades son reales y merecen ser satisfechas con amor y respeto.",
                keyIdea: "Los niños no manipulan, necesitan"
            ),
            BM1Section(
                title: "Selección Natural y Comportamiento",
                subtitle: "La biología evolutiva del apego humano",
                description: "La evolución explica científicamente por qué los bebés humanos se comportan como lo hacen:\n\n• NACEN INMADUROS: Los humanos nacemos más indefensos que cualquier otro mamífero. Nuestro cerebro grande requiere que nazcamos prematuros para poder pasar por el canal del parto.\n\n• ESTRATEGIA DE SUPERVIVENCIA: En la sabana africana hace 200,000 años, los bebés que lloraban al quedarse solos alertaban a sus madres y sobrevivían. Los bebés silenciosos morían comidos por depredadores. Por selección natural, TODOS descendemos de bebés que lloraban.\n\n• PORTEO CONTINUO: Los bebés humanos están diseñados para ser portados constantemente, como los simios. No para quedarse solos en cunas. Su reflejo de agarre, su llanto ante la separación, su necesidad de contacto, son adaptaciones evolutivas, NO caprichos.\n\n• BASE CIENTÍFICA: La neurociencia moderna confirma que el contacto físico, la respuesta inmediata y el colecho son necesidades biológicas reales del bebé humano.",
                keyIdea: "Sus necesidades son biológicas, no caprichos"
            ),
            BM1Section(
                title: "La Puericultura Elástica",
                subtitle: "Contra las normas rígidas y autoritarias",
                description: "Carlos González critica duramente la 'puericultura fascista' que impone reglas arbitrarias y rígidas:\n\n• NO HAY NORMAS UNIVERSALES: Cada niño es único, cada familia es diferente, cada cultura tiene sus costumbres. Lo que funciona para una familia puede no funcionar para otra.\n\n• CONTRA LOS HORARIOS: Los horarios rígidos de alimentación (cada 3 horas, 10 minutos por pecho) son arbitrarios e innecesarios. Los bebés saben cuándo tienen hambre. La lactancia a demanda es lo natural.\n\n• CONTRA EL CONDUCTISMO: Los métodos para 'enseñar a dormir' dejando llorar al bebé son crueles y contraproducentes. Generan estrés tóxico y dañan el vínculo.\n\n• FLEXIBILIDAD Y ADAPTACIÓN: La puericultura debe adaptarse a las necesidades reales de cada niño y las posibilidades de cada familia. No al revés. El bebé no debe adaptarse a normas arbitrarias de un libro.\n\n• CONFÍA EN TU INSTINTO: Las madres y padres saben instintivamente lo que su hijo necesita. Los 'expertos' que contradicen ese instinto suelen estar equivocados.",
                keyIdea: "Tu hijo sabe lo que necesita"
            ),
            BM1Section(
                title: "Amor Incondicional: Imposible Malcriar",
                subtitle: "El mito del niño mimado",
                description: "Uno de los mensajes centrales del libro es que DAR AMOR NUNCA MALCRÍA:\n\n• EL GRAN MITO: Existe la creencia errónea de que si coges mucho a tu bebé, duermes con él, lo amamantas a demanda o respondes a su llanto, lo 'malcriarás' y se volverá dependiente y manipulador.\n\n• LA VERDAD CIENTÍFICA: Lo contrario es cierto. Los niños que reciben amor incondicional, contacto físico abundante y respuesta inmediata a sus necesidades se vuelven MÁS seguros, MÁS independientes y MÁS capaces de amar.\n\n• APEGO SEGURO: El apego seguro (conseguido mediante la crianza con amor y respuesta) es la base de la salud mental. Los niños con apego seguro tienen mejor autoestima, mejores relaciones sociales y menos problemas de conducta.\n\n• NUNCA ES SUFICIENTE: No existe tal cosa como 'demasiado amor'. Los niños necesitan TODO el amor que podamos darles. El amor nunca sobra, nunca estorba, nunca malcría.\n\n• INVERSIÓN A LARGO PLAZO: Los niños 'mimados' con amor en la infancia se convierten en adultos seguros, felices y capaces de amar. Los niños privados de amor se convierten en adultos inseguros con problemas emocionales.",
                keyIdea: "El amor nunca sobra, nunca malcría"
            )
        ]
    }
    
    private var attachmentPillars: [BM1Pillar] {
        [
            BM1Pillar(
                name: "Contacto Físico",
                definition: "Brazos, porteo, colecho",
                parentalExample: "Dale brazos siempre que los pida. No se va a malcriar por recibir el contacto que necesita. Los bebés necesitan estar en brazos tanto como necesitan comer.",
                biologicalBasis: "Los bebés humanos nacen inmaduros y necesitan ser portados constantemente. Es nuestra estrategia evolutiva como especie."
            ),
            BM1Pillar(
                name: "Lactancia Prolongada",
                definition: "A demanda, sin horarios",
                parentalExample: "Amamanta cuando tu bebé lo pida, no según el reloj. La lactancia es alimento, consuelo, vínculo y amor. No tiene horarios.",
                biologicalBasis: "La leche materna cambia su composición según las necesidades del bebé. La lactancia a demanda es lo natural y saludable."
            ),
            BM1Pillar(
                name: "Respuesta al Llanto",
                definition: "El llanto es comunicación",
                parentalExample: "Responde siempre al llanto de tu bebé. Es su única forma de comunicarse. Cuando llora, te necesita de verdad.",
                biologicalBasis: "Dejar llorar a un bebé genera estrés tóxico. Responder al llanto fortalece el vínculo y la seguridad emocional."
            ),
            BM1Pillar(
                name: "Respeto al Ritmo",
                definition: "Sin forzar etapas",
                parentalExample: "Cada niño tiene su propio tiempo para dormir solo, dejar el pecho, controlar esfínteres. No hay prisa. Respeta su ritmo.",
                biologicalBasis: "El desarrollo no se puede acelerar. Forzar etapas genera inseguridad y problemas. Cada niño madura a su tiempo."
            )
        ]
    }
    
    private var clinicalExamples: [BM1Example] {
        [
            BM1Example(
                scenario: "No quiere dormir solo",
                authoritarianApproach: "Déjalo llorar en su cuna, aprenderá a dormir solo. Si cedes, nunca se independizará.",
                attachmentApproach: "El colecho es natural y seguro. Los niños dormirán solos cuando estén preparados, no antes.",
                clinicalInsight: "Los niños pequeños necesitan cercanía nocturna por supervivencia. La angustia que sienten al estar solos por la noche es real y protectora."
            ),
            BM1Example(
                scenario: "Siempre quiere brazos",
                authoritarianApproach: "No lo cojas tanto o lo vas a malcriar. Tiene que aprender a estar solo.",
                attachmentApproach: "Los bebés necesitan ser portados. Es una necesidad biológica, no un capricho. Dale todos los brazos que pida.",
                clinicalInsight: "Los bebés humanos nacen esperando ser portados constantemente, como los simios. El contacto físico es vital para su desarrollo."
            ),
            BM1Example(
                scenario: "Llora cuando te vas",
                authoritarianApproach: "Ignóralo y vete rápido. Si te quedas consolándolo, empeorará. Se tiene que acostumbrar.",
                attachmentApproach: "La angustia de separación es normal y saludable. Significa que el vínculo es fuerte. Despídete con amor.",
                clinicalInsight: "La angustia de separación es una respuesta evolutiva que protege al niño. Los niños que no la muestran pueden tener problemas de apego."
            ),
            BM1Example(
                scenario: "Quiere mamar muy seguido",
                authoritarianApproach: "Ponle horarios: cada 3 horas, 15 minutos cada pecho. Así aprenderá disciplina.",
                attachmentApproach: "Amamanta a demanda, siempre que tu bebé lo pida. La lactancia no tiene horarios.",
                clinicalInsight: "La leche materna se digiere rápido. Los bebés necesitan mamar frecuentemente. Los horarios son arbitrarios y contraproducentes."
            )
        ]
    }
    
    // MARK: - Haptic Feedback
    private func triggerHaptic() {
        let impactFeedback = UIImpactFeedbackGenerator(style: .light)
        impactFeedback.impactOccurred()
    }
}

// MARK: - Preview
struct BM1View_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            BM1View()
        }
    }
}

