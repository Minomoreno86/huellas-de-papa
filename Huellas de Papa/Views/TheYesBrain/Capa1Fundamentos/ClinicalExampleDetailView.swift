import SwiftUI

/// Vista detallada que muestra información completa de un ejemplo clínico del Yes Brain
/// Se abre en una nueva pantalla para proporcionar más espacio
struct ClinicalExampleDetailView: View {
    let example: Capa1Example
    @State private var isPressed = false
    @State private var showingTransition = false
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 24) {
                // Header principal
                headerSection
                
                // Escenario detallado
                scenarioSection
                
                // Transición No Brain → Yes Brain
                transitionSection
                
                // Insight clínico detallado
                insightSection
                
                // Información del libro
                bookInformationSection
                
                // Consejos de aplicación
                applicationTipsSection
                
                // Reflexión personal
                reflectionSection
                
                // Espaciado final
                Spacer(minLength: 50)
            }
            .padding()
        }
        .navigationTitle("Escenario Clínico")
        .navigationBarTitleDisplayMode(.large)
        .background(Color(.systemGroupedBackground))
    }
    
    // MARK: - Header Section
    private var headerSection: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack {
                Image(systemName: "stethoscope")
                    .font(.largeTitle)
                    .foregroundColor(.blue)
                
                VStack(alignment: .leading, spacing: 4) {
                    Text("Escenario Clínico")
                        .font(.title3)
                        .fontWeight(.semibold)
                        .foregroundColor(.secondary)
                    
                    Text("The Yes Brain")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.blue)
                }
                
                Spacer()
            }
            
            Text(example.scenario)
                .font(.title2)
                .fontWeight(.medium)
                .foregroundColor(.primary)
                .multilineTextAlignment(.leading)
                .lineLimit(nil)
        }
        .padding(.vertical)
    }
    
    // MARK: - Scenario Section
    private var scenarioSection: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack {
                Image(systemName: "person.circle.fill")
                    .foregroundColor(.purple)
                    .font(.title2)
                
                Text("Situación Real")
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundColor(.primary)
            }
            
            Text(scenarioDescription)
                .font(.body)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.leading)
                .lineLimit(nil)
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(Color(.systemBackground))
                .overlay(
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(Color.purple.opacity(0.2), lineWidth: 1)
                )
        )
        .shadow(color: .purple.opacity(0.1), radius: 8, x: 0, y: 4)
    }
    
    // MARK: - Transition Section
    private var transitionSection: some View {
        VStack(alignment: .leading, spacing: 20) {
            HStack {
                Image(systemName: "arrow.left.arrow.right.circle.fill")
                    .foregroundColor(.orange)
                    .font(.title2)
                
                Text("Transición No Brain → Yes Brain")
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundColor(.primary)
            }
            
            // Botón para mostrar/ocultar transición
            Button(action: {
                withAnimation(.spring(response: 0.4, dampingFraction: 0.8)) {
                    showingTransition.toggle()
                    triggerHaptic()
                }
            }) {
                HStack {
                    Image(systemName: showingTransition ? "eye.slash.fill" : "eye.fill")
                        .font(.title3)
                    
                    Text(showingTransition ? "Ocultar transición" : "Ver transición completa")
                        .font(.headline)
                        .fontWeight(.semibold)
                }
                .foregroundColor(.white)
                .padding(.horizontal, 24)
                .padding(.vertical, 12)
                .background(
                    RoundedRectangle(cornerRadius: 16)
                        .fill(
                            LinearGradient(
                                gradient: Gradient(colors: [.orange, .red]),
                                startPoint: .leading,
                                endPoint: .trailing
                            )
                        )
                )
            }
            .buttonStyle(PlainButtonStyle())
            
            // Contenido de la transición
            if showingTransition {
                VStack(spacing: 20) {
                    // Reacción No Brain
                    reactionCard(
                        title: "Reacción No Brain",
                        content: example.reactionNo,
                        color: .red,
                        icon: "xmark.circle.fill",
                        description: "Respuesta reactiva que activa el sistema defensivo"
                    )
                    
                    // Flecha de transición animada
                    HStack {
                        Spacer()
                        VStack(spacing: 8) {
                            Image(systemName: "arrow.down")
                                .font(.largeTitle)
                                .foregroundColor(.blue)
                            
                            Text("Transformación")
                                .font(.caption)
                                .fontWeight(.semibold)
                                .foregroundColor(.blue)
                        }
                        Spacer()
                    }
                    .padding(.vertical, 16)
                    
                    // Reacción Yes Brain
                    reactionCard(
                        title: "Reacción Yes Brain",
                        content: example.reactionYes,
                        color: .green,
                        icon: "checkmark.circle.fill",
                        description: "Respuesta conectada que activa el sistema receptivo"
                    )
                }
                .transition(.opacity.combined(with: .scale(scale: 0.9)))
            }
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(Color(.systemBackground))
                .overlay(
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(Color.orange.opacity(0.2), lineWidth: 1)
                )
        )
        .shadow(color: .orange.opacity(0.1), radius: 8, x: 0, y: 4)
    }
    
    // MARK: - Insight Section
    private var insightSection: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack {
                Image(systemName: "lightbulb.fill")
                    .foregroundColor(.yellow)
                    .font(.title2)
                
                Text("Insight Clínico")
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundColor(.primary)
            }
            
            Text(example.clinicalInsight)
                .font(.title3)
                .fontWeight(.bold)
                .foregroundColor(.yellow)
                .italic()
                .multilineTextAlignment(.leading)
                .lineLimit(nil)
            
            Text(detailedInsight)
                .font(.body)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.leading)
                .lineLimit(nil)
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(
                    LinearGradient(
                        gradient: Gradient(colors: [
                            Color.yellow.opacity(0.1),
                            Color.yellow.opacity(0.05)
                        ]),
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                )
                .overlay(
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(Color.yellow.opacity(0.3), lineWidth: 2)
                )
        )
        .shadow(color: .yellow.opacity(0.2), radius: 12, x: 0, y: 6)
    }
    
    // MARK: - Book Information Section
    private var bookInformationSection: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack {
                Image(systemName: "book.fill")
                    .foregroundColor(.blue)
                    .font(.title2)
                
                Text("Según Siegel & Bryson")
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundColor(.primary)
            }
            
            Text(bookInformation)
                .font(.body)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.leading)
                .lineLimit(nil)
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(Color(.systemBackground))
                .overlay(
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(Color.blue.opacity(0.2), lineWidth: 1)
                )
        )
        .shadow(color: .blue.opacity(0.1), radius: 8, x: 0, y: 4)
    }
    
    // MARK: - Application Tips Section
    private var applicationTipsSection: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack {
                Image(systemName: "house.fill")
                    .foregroundColor(.green)
                    .font(.title2)
                
                Text("Consejos de Aplicación")
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundColor(.primary)
            }
            
            Text(applicationTips)
                .font(.body)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.leading)
                .lineLimit(nil)
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(Color(.systemBackground))
                .overlay(
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(Color.green.opacity(0.2), lineWidth: 1)
                )
        )
        .shadow(color: .green.opacity(0.1), radius: 8, x: 0, y: 4)
    }
    
    // MARK: - Reflection Section
    private var reflectionSection: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack {
                Image(systemName: "heart.fill")
                    .foregroundColor(.pink)
                    .font(.title2)
                
                Text("Reflexión Personal")
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundColor(.primary)
            }
            
            Text(reflectionPrompt)
                .font(.title3)
                .fontWeight(.medium)
                .foregroundColor(.pink)
                .italic()
                .multilineTextAlignment(.leading)
                .lineLimit(nil)
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(
                    LinearGradient(
                        gradient: Gradient(colors: [
                            Color.pink.opacity(0.1),
                            Color.pink.opacity(0.05)
                        ]),
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                )
                .overlay(
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(Color.pink.opacity(0.3), lineWidth: 2)
                )
        )
        .shadow(color: .pink.opacity(0.2), radius: 12, x: 0, y: 6)
    }
    
    // MARK: - Reaction Card Helper
    private func reactionCard(title: String, content: String, color: Color, icon: String, description: String) -> some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack(spacing: 12) {
                Image(systemName: icon)
                    .foregroundColor(color)
                    .font(.title2)
                
                VStack(alignment: .leading, spacing: 4) {
                    Text(title)
                        .font(.headline)
                        .fontWeight(.bold)
                        .foregroundColor(.primary)
                    
                    Text(description)
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
                
                Spacer()
            }
            
            Text(content)
                .font(.body)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.leading)
                .padding(.horizontal, 16)
                .padding(.vertical, 12)
                .background(
                    RoundedRectangle(cornerRadius: 12)
                        .fill(color.opacity(0.1))
                        .overlay(
                            RoundedRectangle(cornerRadius: 12)
                                .stroke(color.opacity(0.3), lineWidth: 2)
                        )
                )
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(Color(.systemBackground))
                .overlay(
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(color.opacity(0.2), lineWidth: 1)
                )
        )
        .shadow(color: color.opacity(0.1), radius: 8, x: 0, y: 4)
    }
    
    // MARK: - Supporting Properties
    private var scenarioDescription: String {
        switch example.scenario {
        case "No quiere vestirse para la escuela":
            return "Es una mañana típica y tu hijo se resiste a vestirse para ir a la escuela. Puede estar cansado, molesto por algo, o simplemente no quiere cooperar. Esta situación es común en muchas familias y puede generar estrés tanto en el niño como en los padres."
            
        case "Tiene una rabieta en el supermercado":
            return "Estás haciendo las compras con tu hijo y de repente comienza a llorar, gritar o tirarse al suelo porque quiere algo que no le puedes comprar. Esta situación puede ser embarazosa y estresante, especialmente en público donde sientes que todos te están juzgando."
            
        case "No quiere hacer la tarea":
            return "Es hora de hacer la tarea y tu hijo se resiste, dice que no entiende, o simplemente se niega a trabajar. Puede estar frustrado, cansado, o sentir que la tarea es demasiado difícil. Esta resistencia puede crear tensión en casa."
            
        case "Se pelea con su hermano/hermana":
            return "Los hermanos están discutiendo, gritándose, o incluso llegando a las manos. Puede ser por un juguete, por atención, o simplemente porque están cansados. Los conflictos entre hermanos pueden ser agotadores para toda la familia."
            
        default:
            return example.scenario
        }
    }
    
    private var detailedInsight: String {
        switch example.scenario {
        case "No quiere vestirse para la escuela":
            return "La conexión antes que la corrección es fundamental. Cuando conectamos con las emociones del niño antes de pedirle que haga algo, activamos su Yes Brain. Esto significa validar lo que siente, ofrecer ayuda, y crear un ambiente de cooperación en lugar de confrontación."
            
        case "Tiene una rabieta en el supermercado":
            return "La validación emocional calma el sistema nervioso. Cuando un niño está en medio de una rabieta, su cerebro inferior (emocional) está dominando. Al validar sus emociones y mantener la calma, ayudamos a activar su cerebro superior (racional) y a regular su sistema nervioso."
            
        case "No quiere hacer la tarea":
            return "El estrés bloquea el aprendizaje. Cuando un niño se siente presionado o juzgado, su cerebro activa el modo defensivo (No Brain) y se vuelve menos receptivo al aprendizaje. Crear un ambiente de apoyo y curiosidad facilita el acceso al Yes Brain."
            
        case "Se pelea con su hermano/hermana":
            return "Los conflictos son oportunidades de enseñanza. En lugar de simplemente separar a los hermanos, podemos usar estos momentos para enseñar habilidades de resolución de conflictos, empatía y comunicación. Esto fortalece sus circuitos de conexión social."
            
        default:
            return example.clinicalInsight
        }
    }
    
    private var bookInformation: String {
        switch example.scenario {
        case "No quiere vestirse para la escuela":
            return "Siegel y Bryson explican que la resistencia del niño no es personal, sino una señal de que su sistema nervioso necesita apoyo. La conexión emocional activa el Yes Brain, permitiendo que el niño coopere desde un lugar de calma y seguridad en lugar de miedo o presión."
            
        case "Tiene una rabieta en el supermercado":
            return "Los autores enfatizan que las rabietas son una expresión de que el cerebro del niño está desregulado. La validación emocional no significa ceder a las demandas, sino reconocer los sentimientos del niño y ayudarle a calmarse para poder pensar racionalmente."
            
        case "No quiere hacer la tarea":
            return "Siegel y Bryson describen cómo el estrés académico puede activar el No Brain. Cuando los padres mantienen la calma y ofrecen apoyo en lugar de presión, facilitan el acceso al Yes Brain, donde el aprendizaje se vuelve más efectivo y placentero."
            
        case "Se pelea con su hermano/hermana":
            return "Los autores explican que los conflictos entre hermanos son normales y pueden ser oportunidades de crecimiento. Al modelar la resolución pacífica de conflictos, los padres enseñan habilidades sociales importantes y fortalecen los circuitos de empatía en el cerebro del niño."
            
        default:
            return "Información específica del libro sobre este escenario clínico."
        }
    }
    
    private var applicationTips: String {
        switch example.scenario {
        case "No quiere vestirse para la escuela":
            return "1. Conecta primero: 'Veo que te cuesta trabajo vestirte esta mañana'\n2. Ofrece opciones: '¿Prefieres ponerte la camisa azul o la roja?'\n3. Hazlo divertido: '¿Quieres que cantemos mientras te vistes?'\n4. Mantén la calma: Tu tranquilidad es contagiosa\n5. Celebra el esfuerzo: '¡Qué bien lo hiciste!'"
            
        case "Tiene una rabieta en el supermercado":
            return "1. Mantén la calma: Respira profundo antes de responder\n2. Valida las emociones: 'Entiendo que estés molesto'\n3. Ofrece alternativas: 'No podemos comprar eso, pero podemos...'\n4. Usa el contacto físico: Un abrazo puede calmar el sistema nervioso\n5. Mantén los límites: La validación no significa ceder"
            
        case "No quiere hacer la tarea":
            return "1. Reduce la presión: 'Veo que esto es difícil para ti'\n2. Ofrece apoyo: '¿En qué puedo ayudarte?'\n3. Divide en pasos pequeños: Hacer la tarea más manejable\n4. Crea un ambiente relajado: Menos distracciones, más calma\n5. Enfócate en el esfuerzo: 'Estoy orgulloso de que estés intentando'"
            
        case "Se pelea con su hermano/hermana":
            return "1. Interviene con calma: 'Veo que están muy molestos'\n2. Valida a ambos: 'Entiendo que ambos estén frustrados'\n3. Enseña habilidades: '¿Cómo podemos resolver esto juntos?'\n4. Fomenta la empatía: '¿Cómo crees que se siente tu hermano?'\n5. Celebra la resolución: '¡Qué bien resolvieron el problema!'"
            
        default:
            return "Consejos específicos para aplicar este ejemplo clínico en situaciones reales."
        }
    }
    
    private var reflectionPrompt: String {
        switch example.scenario {
        case "No quiere vestirse para la escuela":
            return "¿Cómo puedes recordar conectarte con las emociones de tu hijo antes de pedirle que haga algo? ¿Qué te ayuda a mantener la calma durante las mañanas estresantes?"
            
        case "Tiene una rabieta en el supermercado":
            return "¿Cómo puedes prepararte para mantener la calma durante las rabietas en público? ¿Qué estrategias de validación emocional te resultan más naturales?"
            
        case "No quiere hacer la tarea":
            return "¿Cómo puedes crear un ambiente de aprendizaje más relajado en casa? ¿Qué cambios podrías hacer para reducir la presión académica?"
            
        case "Se pelea con su hermano/hermana":
            return "¿Cómo puedes usar los conflictos entre hermanos como oportunidades de enseñanza? ¿Qué habilidades de resolución de conflictos quieres modelar?"
            
        default:
            return "¿Cómo puedes aplicar estos principios del Yes Brain en tu propia crianza?"
        }
    }
    
    // MARK: - Haptic Feedback
    private func triggerHaptic() {
        let impactFeedback = UIImpactFeedbackGenerator(style: .light)
        impactFeedback.impactOccurred()
    }
}

// MARK: - Preview
struct ClinicalExampleDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ClinicalExampleDetailView(
                example: Capa1Example(
                    scenario: "No quiere vestirse para la escuela",
                    reactionNo: "\"¡Vístete YA! ¡Vamos a llegar tarde!\"",
                    reactionYes: "\"Veo que te cuesta trabajo vestirte. ¿Qué necesitas para sentirte cómodo?\"",
                    clinicalInsight: "La conexión antes que la corrección activa el Yes Brain"
                )
            )
        }
    }
}
