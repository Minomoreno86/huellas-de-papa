import SwiftUI

/// Vista detallada que muestra información completa de un pilar del Yes Brain
/// Se abre en una nueva pantalla para proporcionar más espacio
struct PillarDetailView: View {
    let pillar: Capa1Pillar
    @State private var isPressed = false
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 24) {
                // Header principal
                headerSection
                
                // Definición detallada
                definitionSection
                
                // Información del libro
                bookInformationSection
                
                // Ejemplos prácticos
                practicalExamplesSection
                
                // Circuito cerebral
                brainPathwaySection
                
                // Consejos de aplicación
                applicationTipsSection
                
                // Cita inspiradora
                inspirationalQuoteSection
                
                // Espaciado final
                Spacer(minLength: 50)
            }
            .padding()
        }
        .navigationTitle(pillar.name)
        .navigationBarTitleDisplayMode(.large)
        .background(Color(.systemGroupedBackground))
    }
    
    // MARK: - Header Section
    private var headerSection: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack {
                Image(systemName: pillarIcon)
                    .font(.largeTitle)
                    .foregroundColor(pillarColor)
                
                VStack(alignment: .leading, spacing: 4) {
                    Text("Pilar del Yes Brain")
                        .font(.title3)
                        .fontWeight(.semibold)
                        .foregroundColor(.secondary)
                    
                    Text(pillar.name)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(pillarColor)
                }
                
                Spacer()
            }
            
            Text(pillar.definition)
                .font(.title2)
                .fontWeight(.medium)
                .foregroundColor(.primary)
                .multilineTextAlignment(.leading)
                .lineLimit(nil)
        }
        .padding(.vertical)
    }
    
    // MARK: - Definition Section
    private var definitionSection: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack {
                Image(systemName: "info.circle.fill")
                    .foregroundColor(.blue)
                    .font(.title2)
                
                Text("Definición Profunda")
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundColor(.primary)
            }
            
            Text(detailedDefinition)
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
    
    // MARK: - Book Information Section
    private var bookInformationSection: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack {
                Image(systemName: "book.fill")
                    .foregroundColor(.purple)
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
                        .stroke(Color.purple.opacity(0.2), lineWidth: 1)
                )
        )
        .shadow(color: .purple.opacity(0.1), radius: 8, x: 0, y: 4)
    }
    
    // MARK: - Practical Examples Section
    private var practicalExamplesSection: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack {
                Image(systemName: "house.fill")
                    .foregroundColor(.green)
                    .font(.title2)
                
                Text("Ejemplos Prácticos")
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundColor(.primary)
            }
            
            VStack(alignment: .leading, spacing: 12) {
                Text("Ejemplo Principal:")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundColor(.primary)
                
                Text(pillar.parentalExample)
                    .font(.body)
                    .foregroundColor(.green)
                    .italic()
                    .multilineTextAlignment(.leading)
                    .lineLimit(nil)
                
                Text("Ejemplos Adicionales:")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundColor(.primary)
                    .padding(.top, 8)
                
                Text(additionalExamples)
                    .font(.body)
                    .foregroundColor(.secondary)
                    .multilineTextAlignment(.leading)
                    .lineLimit(nil)
            }
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
    
    // MARK: - Brain Pathway Section
    private var brainPathwaySection: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack {
                Image(systemName: "brain.head.profile")
                    .foregroundColor(.orange)
                    .font(.title2)
                
                Text("Circuito Cerebral")
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundColor(.primary)
            }
            
            Text(pillar.brainPathway)
                .font(.title3)
                .fontWeight(.bold)
                .foregroundColor(.orange)
                .multilineTextAlignment(.leading)
                .lineLimit(nil)
            
            Text(circuitExplanation)
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
                        .stroke(Color.orange.opacity(0.2), lineWidth: 1)
                )
        )
        .shadow(color: .orange.opacity(0.1), radius: 8, x: 0, y: 4)
    }
    
    // MARK: - Application Tips Section
    private var applicationTipsSection: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack {
                Image(systemName: "lightbulb.fill")
                    .foregroundColor(.yellow)
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
                        .stroke(Color.yellow.opacity(0.2), lineWidth: 1)
                )
        )
        .shadow(color: .yellow.opacity(0.1), radius: 8, x: 0, y: 4)
    }
    
    // MARK: - Inspirational Quote Section
    private var inspirationalQuoteSection: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack {
                Image(systemName: "quote.bubble.fill")
                    .foregroundColor(pillarColor)
                    .font(.title2)
                
                Text("Cita Inspiradora")
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundColor(.primary)
            }
            
            Text(inspirationalQuote)
                .font(.title3)
                .fontWeight(.medium)
                .foregroundColor(pillarColor)
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
                            pillarColor.opacity(0.1),
                            pillarColor.opacity(0.05)
                        ]),
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                )
                .overlay(
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(pillarColor.opacity(0.3), lineWidth: 2)
                )
        )
        .shadow(color: pillarColor.opacity(0.2), radius: 12, x: 0, y: 6)
    }
    
    // MARK: - Supporting Properties
    private var pillarColor: Color {
        switch pillar.name {
        case "Equilibrio":
            return .blue
        case "Resiliencia":
            return .green
        case "Insight":
            return .purple
        case "Empatía":
            return .mint
        default:
            return .blue
        }
    }
    
    private var pillarIcon: String {
        switch pillar.name {
        case "Equilibrio":
            return "scalemass"
        case "Resiliencia":
            return "arrow.clockwise.circle"
        case "Insight":
            return "brain.head.profile"
        case "Empatía":
            return "heart.circle"
        default:
            return "circle"
        }
    }
    
    private var detailedDefinition: String {
        switch pillar.name {
        case "Equilibrio":
            return "El equilibrio es la capacidad de mantener la estabilidad emocional y física en medio del caos. Es la habilidad de autorregularse cuando las emociones son intensas, permitiendo que el cerebro superior (corteza prefrontal) mantenga el control sobre el cerebro inferior (amígdala y sistema límbico)."
            
        case "Resiliencia":
            return "La resiliencia es la capacidad de recuperarse y adaptarse después de enfrentar dificultades, estrés o fracasos. Es la habilidad de volver al equilibrio después de estar desequilibrado, aprendiendo de la experiencia y creciendo más fuerte."
            
        case "Insight":
            return "El insight es la capacidad de conocerse a uno mismo, de entender los propios pensamientos, emociones y comportamientos. Es la habilidad de observar la experiencia interna con curiosidad y comprensión, creando autoconciencia significativa."
            
        case "Empatía":
            return "La empatía es la capacidad de sintonizar con las emociones y perspectivas de otra persona. Es la habilidad de sentir con el otro, de conectarse emocionalmente y responder de manera apropiada y compasiva."
            
        default:
            return pillar.definition
        }
    }
    
    private var bookInformation: String {
        switch pillar.name {
        case "Equilibrio":
            return "Siegel y Bryson explican que el equilibrio es fundamental para el desarrollo del Yes Brain. Cuando un niño puede regular sus emociones, puede acceder a sus capacidades de aprendizaje y conexión. Los padres pueden modelar el equilibrio manteniendo la calma durante situaciones estresantes."
            
        case "Resiliencia":
            return "Los autores enfatizan que la resiliencia no es evitar las dificultades, sino aprender a navegarlas. Cada desafío superado fortalece los circuitos neuronales de recuperación. Los padres pueden fomentar la resiliencia permitiendo que los niños experimenten fracasos seguros y los apoyen en el proceso de recuperación."
            
        case "Insight":
            return "Siegel y Bryson describen el insight como 'conocerse a uno mismo desde adentro'. Esta capacidad permite a los niños entender sus emociones y comportamientos, facilitando la autorregulación y la toma de decisiones conscientes. Los padres pueden desarrollar el insight haciendo preguntas reflexivas."
            
        case "Empatía":
            return "La empatía es descrita como la capacidad de 'sentir con' otra persona. Esta habilidad conecta el cerebro social y facilita las relaciones saludables. Los padres pueden cultivar la empatía modelando la compasión y ayudando a los niños a reconocer las emociones de otros."
            
        default:
            return "Información del libro sobre este pilar."
        }
    }
    
    private var additionalExamples: String {
        switch pillar.name {
        case "Equilibrio":
            return "• 'Respiremos juntos antes de hablar' (antes de una conversación difícil)\n• 'Veo que estás muy emocionado, vamos a calmarnos juntos' (durante una rabieta)\n• 'Es normal sentirse nervioso, ¿qué te ayuda a calmarte?' (antes de una presentación)"
            
        case "Resiliencia":
            return "• 'No pasa nada, inténtalo otra vez' (después de un error)\n• 'Todos cometemos errores, es así como aprendemos' (cuando algo sale mal)\n• 'Veo que fue difícil, pero lo superaste' (reconociendo el esfuerzo)"
            
        case "Insight":
            return "• '¿Qué sintió tu corazón cuando eso pasó?' (reflexionando sobre emociones)\n• '¿Qué crees que necesitas en este momento?' (autoconocimiento)\n• '¿Cómo te sentiste cuando hiciste eso?' (conciencia de acciones)"
            
        case "Empatía":
            return "• 'Puedo imaginar cómo te sentiste' (validando emociones)\n• 'Veo que tu amigo está triste, ¿cómo podrías ayudarlo?' (reconociendo emociones de otros)\n• 'Entiendo que esto es difícil para ti' (conectando con la experiencia)"
            
        default:
            return "Ejemplos adicionales de aplicación práctica."
        }
    }
    
    private var circuitExplanation: String {
        switch pillar.name {
        case "Equilibrio":
            return "La corteza orbitofrontal regula la amígdala, manteniendo el equilibrio entre emociones y razonamiento. Cuando está activa, permite la autorregulación emocional y el control de impulsos."
            
        case "Resiliencia":
            return "El cíngulo anterior se conecta con el sistema de dopamina para crear circuitos de recompensa que facilitan la recuperación después del estrés. Esta conexión fortalece la capacidad de adaptación."
            
        case "Insight":
            return "La corteza medial prefrontal permite la introspección y el autoconocimiento. Esta área facilita la observación de los propios estados mentales y emocionales."
            
        case "Empatía":
            return "Los circuitos espejo y las conexiones sociales permiten la sintonización emocional. Estas redes neuronales facilitan la comprensión y conexión con las emociones de otros."
            
        default:
            return pillar.brainPathway
        }
    }
    
    private var applicationTips: String {
        switch pillar.name {
        case "Equilibrio":
            return "1. Practica la respiración profunda contigo mismo antes de responder\n2. Usa técnicas de grounding (conectar con el presente)\n3. Establece rutinas que promuevan la calma\n4. Modela la autorregulación manteniendo la calma\n5. Enseña técnicas de relajación apropiadas para la edad"
            
        case "Resiliencia":
            return "1. Permite que los niños experimenten fracasos seguros\n2. Enfócate en el proceso, no solo en el resultado\n3. Celebra los esfuerzos y la perseverancia\n4. Enseña que los errores son oportunidades de aprendizaje\n5. Proporciona apoyo emocional durante las dificultades"
            
        case "Insight":
            return "1. Haz preguntas reflexivas regularmente\n2. Ayuda a los niños a nombrar sus emociones\n3. Practica la observación sin juicio\n4. Fomenta la introspección a través del arte o escritura\n5. Modela el autoconocimiento compartiendo tus propias reflexiones"
            
        case "Empatía":
            return "1. Modela la compasión en tus interacciones\n2. Ayuda a los niños a reconocer emociones en otros\n3. Practica la escucha activa\n4. Enseña sobre diferentes perspectivas\n5. Fomenta actos de bondad y servicio"
            
        default:
            return "Consejos específicos para aplicar este pilar en la crianza diaria."
        }
    }
    
    private var inspirationalQuote: String {
        switch pillar.name {
        case "Equilibrio":
            return "\"El equilibrio no es algo que logras una vez y tienes para siempre. Es algo que cultivas momento a momento.\""
        case "Resiliencia":
            return "\"La resiliencia no es sobre evitar las caídas, sino sobre aprender a levantarse.\""
        case "Insight":
            return "\"Conocerse a uno mismo es el comienzo de toda sabiduría.\""
        case "Empatía":
            return "\"La empatía es ver con los ojos de otro, escuchar con los oídos de otro y sentir con el corazón de otro.\""
        default:
            return "\"Cada pilar del Yes Brain es una oportunidad de crecimiento.\""
        }
    }
}

// MARK: - Preview
struct PillarDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            PillarDetailView(
                pillar: Capa1Pillar(
                    name: "Equilibrio",
                    definition: "Regular emociones y cuerpo",
                    parentalExample: "\"Respiramos juntos antes de hablar.\"",
                    brainPathway: "Corteza orbitofrontal ↔ amígdala"
                )
            )
        }
    }
}
