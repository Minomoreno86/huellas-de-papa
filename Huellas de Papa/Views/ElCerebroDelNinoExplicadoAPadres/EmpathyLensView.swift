import SwiftUI

// MARK: - Capa 8: Herramientas de Empatía y Mentalización
// "Lentes del Niño" - Ayuda al adulto a entender la perspectiva interna del niño
// Diseño limpio y eficiente, sin animaciones excesivas

struct EmpathyLensView: View {
    @State private var selectedAge: Int = 5
    @State private var selectedState: String = "contento"
    @State private var empathyTool: Capa8ConnectionCircle?
    
    private let availableStates = ["contento", "triste", "enojado", "asustado", "cansado", "hambriento", "sobreestimulado"]
    
    var body: some View {
        VStack(spacing: 20) {
            // Header
            VStack(spacing: 8) {
                Text("Lentes del Niño")
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(.primary)
                
                Text("Ve el mundo desde la perspectiva de tu hijo")
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
            
            // Selectores
            selectorsView
            
            // Contenido de empatía
            if let tool = empathyTool {
                empathyContentView(tool)
            } else {
                Text("Selecciona edad y estado para ver la perspectiva del niño")
                    .font(.body)
                    .foregroundColor(.secondary)
                    .multilineTextAlignment(.center)
                    .padding()
            }
            
            Spacer()
        }
        .padding()
        .onAppear {
            generateEmpathyTool()
        }
        .onChange(of: selectedAge) { _, _ in
            generateEmpathyTool()
        }
        .onChange(of: selectedState) { _, _ in
            generateEmpathyTool()
        }
    }
    
    private var selectorsView: some View {
        VStack(spacing: 16) {
            // Selector de edad
            VStack(spacing: 8) {
                Text("Edad del niño")
                    .font(.subheadline)
                    .fontWeight(.medium)
                    .foregroundColor(.primary)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 8) {
                        ForEach(2...10, id: \.self) { age in
                            Button(action: {
                                selectedAge = age
                            }) {
                                Text("\(age)")
                                    .font(.body)
                                    .fontWeight(.medium)
                                    .foregroundColor(selectedAge == age ? .white : .primary)
                                    .frame(width: 40, height: 40)
                                    .background(
                                        Circle()
                                            .fill(selectedAge == age ? Color.blue : Color.gray.opacity(0.2))
                                    )
                            }
                        }
                    }
                    .padding(.horizontal)
                }
            }
            
            // Selector de estado
            VStack(spacing: 8) {
                Text("Estado emocional")
                    .font(.subheadline)
                    .fontWeight(.medium)
                    .foregroundColor(.primary)
                
                LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 3), spacing: 8) {
                    ForEach(availableStates, id: \.self) { state in
                        Button(action: {
                            selectedState = state
                        }) {
                            Text(state.capitalized)
                                .font(.caption)
                                .fontWeight(.medium)
                                .foregroundColor(selectedState == state ? .white : .primary)
                                .padding(.horizontal, 12)
                                .padding(.vertical, 8)
                                .background(
                                    RoundedRectangle(cornerRadius: 8)
                                        .fill(selectedState == state ? Color.orange : Color.gray.opacity(0.2))
                                )
                        }
                    }
                }
            }
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(Color.white.opacity(0.6))
                .shadow(color: .black.opacity(0.05), radius: 2, x: 0, y: 1)
        )
    }
    
    @ViewBuilder
    private func empathyContentView(_ tool: Capa8ConnectionCircle) -> some View {
        VStack(spacing: 16) {
            // Lo que siento
            VStack(spacing: 8) {
                Text("Lo que siento:")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundColor(.primary)
                
                Text(tool.feelingGenerated)
                    .font(.body)
                    .foregroundColor(.primary)
                    .multilineTextAlignment(.leading)
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 12)
                            .fill(Color.blue.opacity(0.1))
                    )
            }
            
            // Lo que me ayuda
            VStack(spacing: 8) {
                Text("Lo que me ayuda:")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundColor(.primary)
                
                Text(tool.action)
                    .font(.body)
                    .foregroundColor(.primary)
                    .multilineTextAlignment(.leading)
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 12)
                            .fill(Color.green.opacity(0.1))
                    )
            }
            
            // Frases validadoras
            VStack(spacing: 8) {
                Text("Frases que me ayudan:")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundColor(.primary)
                
                VStack(spacing: 8) {
                    ForEach(tool.instructions, id: \.self) { phrase in
                        Text(phrase)
                            .font(.body)
                            .foregroundColor(.primary)
                            .multilineTextAlignment(.leading)
                            .padding(.horizontal, 12)
                            .padding(.vertical, 8)
                            .background(
                                RoundedRectangle(cornerRadius: 8)
                                    .fill(Color.orange.opacity(0.1))
                            )
                    }
                }
            }
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(Color.white.opacity(0.8))
                .shadow(color: .black.opacity(0.1), radius: 4, x: 0, y: 2)
        )
    }
    
    private func generateEmpathyTool() {
        let sampleTool = Capa8ConnectionCircle(
            title: "Conexión \(selectedState.capitalized)",
            action: generateWhatHelps(),
            time: 30,
            feelingGenerated: generateWhatIFeel(),
            instructions: generateParentPhrases()
        )
        
        empathyTool = sampleTool
    }
    
    private func generateWhatIFeel() -> String {
        switch selectedState {
        case "contento":
            return "Me siento feliz y seguro. El mundo parece un lugar maravilloso y quiero explorar todo. Mi cuerpo se siente ligero y mi corazón late de emoción."
        case "triste":
            return "Me siento como si algo muy importante se hubiera perdido. Mi corazón duele y las lágrimas vienen sin que yo las llame. Todo parece gris y sin color."
        case "enojado":
            return "Me siento como un volcán que va a explotar. Mi cuerpo está tenso y siento que nadie me entiende. Quiero gritar y romper cosas."
        case "asustado":
            return "Mi corazón late muy rápido y siento mariposas en el estómago. Todo me parece amenazante y quiero esconderme. No me siento seguro."
        case "cansado":
            return "Mi cuerpo se siente pesado como si fuera de plomo. Mis ojos quieren cerrarse y mi cerebro está confuso. Todo me cuesta mucho trabajo."
        case "hambriento":
            return "Mi estómago hace ruidos y duele. Me siento débil y de mal humor. No puedo pensar en otra cosa que no sea comida."
        case "sobreestimulado":
            return "Hay demasiado ruido, luces y movimiento. Mi cerebro se siente como si fuera a explotar. Necesito que todo pare y me dejen en paz."
        default:
            return "Me siento confundido y no sé exactamente qué está pasando conmigo."
        }
    }
    
    private func generateWhatHelps() -> String {
        switch selectedState {
        case "contento":
            return "Disfruto cuando me das tiempo para explorar de forma segura. Me gusta que celebres mis logros y me muestres que estás orgulloso de mí."
        case "triste":
            return "Necesito que me abraces sin palabras. Tu presencia cálida me calma más que cualquier consejo. Déjame llorar sin juzgarme."
        case "enojado":
            return "Necesito espacio para calmarme, pero también tu presencia cerca. Ayúdame a respirar profundo y a nombrar lo que siento."
        case "asustado":
            return "Necesito que me tranquilices con tu voz suave y tu abrazo firme. Ayúdame a sentir que estoy a salvo contigo."
        case "cansado":
            return "Necesito un lugar tranquilo para descansar. Ayúdame a relajarme con una rutina calmada antes de dormir."
        case "hambriento":
            return "Necesito comida saludable que me dé energía. Ayúdame a tener horarios regulares para comer."
        case "sobreestimulado":
            return "Necesito un lugar silencioso y oscuro para calmarme. Ayúdame a reducir los estímulos y a respirar despacio."
        default:
            return "Necesito tu comprensión y paciencia mientras aprendo a manejar mis emociones."
        }
    }
    
    private func generateParentPhrases() -> [String] {
        switch selectedState {
        case "contento":
            return [
                "¡Qué bien te ves tan feliz!",
                "Me encanta verte disfrutar",
                "Eres tan especial cuando sonríes"
            ]
        case "triste":
            return [
                "Es normal sentirse triste a veces",
                "Estoy aquí contigo",
                "Te quiero mucho, aunque estés triste"
            ]
        case "enojado":
            return [
                "Veo que estás muy molesto",
                "Es difícil cuando las cosas no salen como queremos",
                "Vamos a respirar juntos"
            ]
        case "asustado":
            return [
                "Entiendo que tengas miedo",
                "Estás a salvo conmigo",
                "No te va a pasar nada malo"
            ]
        case "cansado":
            return [
                "Veo que estás muy cansado",
                "Es hora de descansar",
                "Te ayudo a relajarte"
            ]
        case "hambriento":
            return [
                "Veo que tienes hambre",
                "Vamos a preparar algo rico",
                "Tu cuerpo necesita energía"
            ]
        case "sobreestimulado":
            return [
                "Hay demasiado ruido, ¿verdad?",
                "Vamos a un lugar más tranquilo",
                "Te ayudo a calmarte"
            ]
        default:
            return [
                "Te veo y te escucho",
                "Estoy aquí para ayudarte",
                "Te quiero mucho"
            ]
        }
    }
}

#Preview {
    EmpathyLensView()
}