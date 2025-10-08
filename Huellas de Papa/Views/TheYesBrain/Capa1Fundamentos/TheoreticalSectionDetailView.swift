import SwiftUI

/// Vista detallada que muestra el contenido completo de un bloque teórico del Yes Brain
/// Se abre en una nueva pantalla para proporcionar más espacio
struct TheoreticalSectionDetailView: View {
    let section: Capa1Section
    @State private var isPressed = false
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 24) {
                // Header principal
                headerSection
                
                // Información específica del libro
                bookSpecificContent
                
                // Ejemplo práctico
                practicalExample
                
                // Cita del libro si aplica
                if let quote = sectionQuote {
                    bookQuote(quote)
                }
                
                // Idea clave destacada
                keyIdeaSection
                
                // Espaciado final
                Spacer(minLength: 50)
            }
            .padding()
        }
        .navigationTitle(section.title)
        .navigationBarTitleDisplayMode(.large)
        .background(Color(.systemGroupedBackground))
    }
    
    // MARK: - Header Section
    private var headerSection: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text(section.subtitle)
                .font(.title2)
                .fontWeight(.semibold)
                .foregroundColor(.blue)
            
            Text(section.description)
                .font(.body)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.leading)
                .lineLimit(nil)
        }
        .padding(.vertical)
    }
    
    // MARK: - Book Specific Content
    private var bookSpecificContent: some View {
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
            
            Text(sectionSpecificContent)
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
    
    // MARK: - Practical Example
    private var practicalExample: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack {
                Image(systemName: "house.fill")
                    .foregroundColor(.green)
                    .font(.title2)
                
                Text("Ejemplo Práctico")
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundColor(.primary)
            }
            
            Text(practicalExampleText)
                .font(.body)
                .foregroundColor(.blue)
                .italic()
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
    
    // MARK: - Book Quote
    private func bookQuote(_ quote: String) -> some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack {
                Image(systemName: "quote.bubble.fill")
                    .foregroundColor(.purple)
                    .font(.title2)
                
                Text("Cita del Libro")
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundColor(.primary)
            }
            
            Text(quote)
                .font(.title3)
                .fontWeight(.medium)
                .foregroundColor(.purple)
                .italic()
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
    
    // MARK: - Key Idea Section
    private var keyIdeaSection: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack {
                Image(systemName: "lightbulb.fill")
                    .foregroundColor(.orange)
                    .font(.title2)
                
                Text("Idea Clave del Libro")
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundColor(.primary)
            }
            
            Text(section.keyIdea)
                .font(.title2)
                .fontWeight(.bold)
                .foregroundColor(.orange)
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
                            Color.orange.opacity(0.1),
                            Color.orange.opacity(0.05)
                        ]),
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                )
                .overlay(
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(Color.orange.opacity(0.3), lineWidth: 2)
                )
        )
        .shadow(color: .orange.opacity(0.2), radius: 12, x: 0, y: 6)
    }
    
    // MARK: - Content Properties
    private var sectionSpecificContent: String {
        switch section.title {
        case "Arquitectura del Cerebro":
            return "El cerebro tiene dos estados fundamentales: el Yes Brain (receptivo, integrado) y el No Brain (reactivo, defensivo). La amígdala controla las emociones básicas, mientras que la corteza prefrontal maneja el razonamiento y la autorregulación. Cuando están integrados, el niño puede aprender y crecer.\n\nLa neurociencia nos enseña que el estado emocional del adulto influye directamente en el estado cerebral del niño. Cuando el adulto mantiene la calma, activa los circuitos de autorregulación en el cerebro del niño."
            
        case "Neurointegración":
            return "La integración es el proceso que conecta diferentes partes del cerebro. La integración vertical une el cerebro superior (razón) con el inferior (emociones). La horizontal conecta los hemisferios izquierdo y derecho. La relacional permite la empatía y conexión con otros.\n\nCuando estas conexiones funcionan bien, el niño puede regular sus emociones, tomar decisiones reflexivas y mantener relaciones saludables. La calma del adulto facilita esta integración."
            
        case "El Lenguaje":
            return "Cada palabra y tono que usamos activa circuitos específicos en el cerebro del niño. Las palabras de conexión activan el Yes Brain, mientras que las de desconexión activan el No Brain. El tono, ritmo y contacto visual son igual de importantes que las palabras.\n\nEl lenguaje constructivo fortalece la corteza prefrontal y facilita el aprendizaje. Las palabras de validación crean un ambiente emocional seguro donde el niño puede explorar y crecer."
            
        case "Neuroplasticidad":
            return "Cada interacción con tu hijo es una oportunidad de moldear su cerebro. Las experiencias repetidas crean conexiones neuronales duraderas. Cada vez que respondes con calma y conexión, fortaleces los circuitos del Yes Brain.\n\nLa neuroplasticidad significa que el cerebro puede cambiar y adaptarse. Las experiencias positivas repetidas crean patrones neuronales que promueven la resiliencia y el bienestar emocional."
            
        default:
            return section.description
        }
    }
    
    private var practicalExampleText: String {
        switch section.title {
        case "Arquitectura del Cerebro":
            return "Cuando tu hijo tiene una rabieta, su amígdala está dominando. En lugar de gritar, respira profundo y di: 'Veo que estás muy molesto'. Esto activa su corteza prefrontal y lo ayuda a calmarse.\n\nPractica: Antes de reaccionar, haz tres respiraciones profundas. Tu calma se convertirá en su calma."
            
        case "Neurointegración":
            return "Si tu hijo está llorando, no digas 'No llores'. En su lugar, valida: 'Es normal sentirse triste'. Esto conecta su emoción (cerebro inferior) con su comprensión (cerebro superior).\n\nPractica: Nombra las emociones que observas. 'Veo que estás frustrado' ayuda a integrar la experiencia emocional."
            
        case "El Lenguaje":
            return "En lugar de '¡Para ya!' prueba 'Entiendo que estés molesto. ¿Qué necesitas?' El primer mensaje activa el No Brain, el segundo activa el Yes Brain y facilita la cooperación.\n\nPractica: Usa 'Sí, y...' en lugar de 'No, pero...'. Esto mantiene la conexión mientras estableces límites."
            
        case "Neuroplasticidad":
            return "Cada vez que mantienes la calma durante el caos, tu hijo observa y su cerebro aprende que es posible autorregularse. Con el tiempo, estas experiencias se convierten en patrones neuronales duraderos.\n\nPractica: Celebra los pequeños momentos de conexión. Cada abrazo, cada mirada comprensiva, cada palabra amable construye circuitos de bienestar."
            
        default:
            return "Practica este concepto en tu interacción diaria con tu hijo."
        }
    }
    
    private var sectionQuote: String? {
        switch section.title {
        case "Arquitectura del Cerebro":
            return "\"El Yes Brain es un estado de receptividad, no de perfección.\""
        case "Neurointegración":
            return "\"La integración es el secreto de la salud mental.\""
        case "El Lenguaje":
            return "\"Las palabras construyen mundos internos.\""
        case "Neuroplasticidad":
            return "\"Cada momento de conexión es una oportunidad de moldear el cerebro.\""
        default:
            return nil
        }
    }
}

// MARK: - Preview
struct TheoreticalSectionDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            TheoreticalSectionDetailView(
                section: Capa1Section(
                    title: "Arquitectura del Cerebro",
                    subtitle: "Sí y No",
                    description: "Sistemas cerebrales implicados: amígdala, corteza PFC, cuerpo calloso, sistema de recompensa.",
                    keyIdea: "Tu calma regula su cerebro"
                )
            )
        }
    }
}
