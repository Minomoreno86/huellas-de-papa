import SwiftUI

/// Vista principal de la Capa 1 (Fundamentos) del módulo The Yes Brain
/// Forma al padre en los fundamentos neuroemocionales del cerebro receptivo
struct Capa1View: View {
    @State private var selectedToggle: YesNoState = .yes
    @State private var showingClinicalTransition = false
    
    var body: some View {
        ScrollView {
            VStack(spacing: 32) {
                // 1. Header animado — título + subtítulo
                headerSection
                
                // 2. Sección Conceptos - scroll horizontal con tarjetas limpias
                theoreticalSectionsScrollView
                
                // 3. Comparador interactivo (Yes/No Toggle)
                yesNoComparisonSection
                
                // 4. Bloque Pilares (grid 2×2)
                pillarsGridSection
                
                // 5. Escenas clínicas (slide horizontal)
                clinicalExamplesSection
                
                // 6. Frase final motivacional
                motivationalQuoteSection
            }
            .padding()
        }
        .navigationTitle("Fundamentos del Yes Brain")
        .navigationBarTitleDisplayMode(.large)
    }
    
    // MARK: - 1. Header Section
    private var headerSection: some View {
        VStack(spacing: 16) {
            Text("The Yes Brain")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundStyle(
                    LinearGradient(
                        gradient: Gradient(colors: [.blue, .mint]),
                        startPoint: .leading,
                        endPoint: .trailing
                    )
                )
            
            Text("Formación en fundamentos neuroemocionales del cerebro receptivo")
                .font(.title3)
                .fontWeight(.medium)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
                .lineLimit(nil)
            
            Text("Cómo se genera biológicamente la apertura, cooperación, curiosidad y empatía")
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
            Text("Bloques Teóricos Clave")
                .font(.title2)
                .fontWeight(.semibold)
                .foregroundColor(.primary)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 16) {
                    ForEach(theoreticalSections) { section in
                        TheoreticalSectionCard(section: section)
                    }
                }
                .padding(.horizontal)
            }
        }
    }
    
    // MARK: - 3. Yes/No Comparison Section
    private var yesNoComparisonSection: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Cerebro Sí vs. Cerebro No")
                .font(.title2)
                .fontWeight(.semibold)
                .foregroundColor(.primary)
            
            YesNoToggleView(selectedState: $selectedToggle)
        }
    }
    
    // MARK: - 4. Pillars Grid Section
    private var pillarsGridSection: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Los Cuatro Pilares del Yes Brain")
                .font(.title2)
                .fontWeight(.semibold)
                .foregroundColor(.primary)
            
            LazyVGrid(columns: [
                GridItem(.flexible()),
                GridItem(.flexible())
            ], spacing: 16) {
                ForEach(yesBrainPillars) { pillar in
                    PillarCard(pillar: pillar)
                }
            }
        }
    }
    
    // MARK: - 5. Clinical Examples Section
    private var clinicalExamplesSection: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Escenas Clínicas")
                .font(.title2)
                .fontWeight(.semibold)
                .foregroundColor(.primary)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 16) {
                    ForEach(clinicalExamples) { example in
                        ClinicalExampleCard(example: example)
                    }
                }
                .padding(.horizontal)
            }
        }
    }
    
    // MARK: - 6. Motivational Quote Section
    private var motivationalQuoteSection: some View {
        VStack(spacing: 20) {
            Text("💡 Recordatorio Clave")
                .font(.headline)
                .fontWeight(.semibold)
                .foregroundColor(.primary)
            
            VStack(spacing: 12) {
                Text("\"Educar es esculpir el cerebro con cada mirada.\"")
                    .font(.title3)
                    .fontWeight(.medium)
                    .foregroundColor(.primary)
                    .multilineTextAlignment(.center)
                    .italic()
                
                Text("— Daniel J. Siegel")
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
    private var theoreticalSections: [Capa1Section] {
        [
            Capa1Section(
                title: "Arquitectura del Cerebro",
                subtitle: "Sí y No",
                description: "Sistemas cerebrales implicados: amígdala, corteza PFC, cuerpo calloso, sistema de recompensa. Por qué el niño reacciona o coopera según el estado emocional del adulto.",
                keyIdea: "Tu calma regula su cerebro"
            ),
            Capa1Section(
                title: "Neurointegración",
                subtitle: "Estados de Apertura",
                description: "Integración vertical, horizontal y relacional. Cómo la calma del adulto regula la neuroconectividad del niño.",
                keyIdea: "Conexión antes que corrección"
            ),
            Capa1Section(
                title: "El Lenguaje",
                subtitle: "Puente Neural",
                description: "Efecto del tono, ritmo, contacto visual y palabras. Cada frase activa o bloquea el PFC del niño.",
                keyIdea: "Las palabras construyen circuitos"
            ),
            Capa1Section(
                title: "Neuroplasticidad",
                subtitle: "Del Vínculo",
                description: "Cada interacción modela circuitos de calma, curiosidad y conexión. Convertir la relación en gimnasio neuronal.",
                keyIdea: "Cada mirada es una sinapsis"
            )
        ]
    }
    
    private var yesBrainPillars: [Capa1Pillar] {
        [
            Capa1Pillar(
                name: "Equilibrio",
                definition: "Regular emociones y cuerpo",
                parentalExample: "\"Respiramos juntos antes de hablar.\"",
                brainPathway: "Corteza orbitofrontal ↔ amígdala"
            ),
            Capa1Pillar(
                name: "Resiliencia",
                definition: "Volver al equilibrio tras el error",
                parentalExample: "\"No pasa nada, inténtalo otra vez.\"",
                brainPathway: "Cíngulo anterior ↔ dopamina"
            ),
            Capa1Pillar(
                name: "Insight",
                definition: "Conocer y nombrar el mundo interno",
                parentalExample: "\"¿Qué sintió tu corazón cuando...?\"",
                brainPathway: "Corteza medial prefrontal"
            ),
            Capa1Pillar(
                name: "Empatía",
                definition: "Sintonizar con la emoción del otro",
                parentalExample: "\"Puedo imaginar cómo te sentiste.\"",
                brainPathway: "Circuitos espejo + conexión"
            )
        ]
    }
    
    private var clinicalExamples: [Capa1Example] {
        [
            Capa1Example(
                scenario: "No quiere vestirse para la escuela",
                reactionNo: "\"¡Vístete YA! ¡Vamos a llegar tarde!\"",
                reactionYes: "\"Veo que te cuesta trabajo vestirte. ¿Qué necesitas para sentirte cómodo?\"",
                clinicalInsight: "La conexión antes que la corrección activa el Yes Brain"
            ),
            Capa1Example(
                scenario: "Tiene una rabieta en el supermercado",
                reactionNo: "\"¡Para ya! ¡Me estás avergonzando!\"",
                reactionYes: "\"Veo que estás muy molesto. Estoy aquí contigo.\"",
                clinicalInsight: "La validación emocional calma el sistema nervioso"
            ),
            Capa1Example(
                scenario: "No quiere hacer la tarea",
                reactionNo: "\"¡Si no haces la tarea, no hay videojuegos!\"",
                reactionYes: "\"Entiendo que la tarea puede ser difícil. ¿Cómo puedo ayudarte?\"",
                clinicalInsight: "El apoyo reduce la resistencia y facilita el aprendizaje"
            )
        ]
    }
    
    // MARK: - Haptic Feedback
    private func triggerHaptic() {
        let impactFeedback = UIImpactFeedbackGenerator(style: .light)
        impactFeedback.impactOccurred()
    }
}

// MARK: - Supporting Types
enum YesNoState {
    case yes, no
}

// MARK: - Preview
struct Capa1View_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            Capa1View()
        }
    }
}
