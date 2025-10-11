import SwiftUI

/// Vista de conversaciones guiadas
struct BM8ConversationsView: View {
    let questions = conversationsData
    @State private var selectedCategory: ConversationCategory? = nil
    
    var body: some View {
        ScrollView {
            VStack(spacing: 24) {
                instructionsSection
                categoryFilterSection
                questionsListSection
            }
            .padding()
        }
        .background(Color(.systemGroupedBackground))
        .navigationTitle("Conversaciones")
    }
    
    // MARK: - Instructions
    private var instructionsSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            Label("Cómo usar estas preguntas", systemImage: "info.circle.fill")
                .font(.headline)
                .foregroundColor(.mint)
            
            VStack(alignment: .leading, spacing: 8) {
                Text("• Elige un momento tranquilo (antes de dormir ideal)")
                Text("• No hay respuestas correctas o incorrectas")
                Text("• Escucha activamente a tu hijo sin interrumpir")
                Text("• No juzgues ni corrijas sus respuestas")
                Text("• Comparte también tus propias respuestas")
                Text("• Valida todo lo que exprese")
            }
            .font(.body)
            .foregroundColor(.primary)
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(Color.mint.opacity(0.1))
        )
    }
    
    // MARK: - Category Filter
    private var categoryFilterSection: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 12) {
                Button(action: {
                    withAnimation { selectedCategory = nil }
                }) {
                    Text("Todas")
                        .font(.subheadline)
                        .fontWeight(.medium)
                        .foregroundColor(selectedCategory == nil ? .white : .mint)
                        .padding(.horizontal, 16)
                        .padding(.vertical, 8)
                        .background(
                            Capsule()
                                .fill(selectedCategory == nil ? Color.mint : Color.mint.opacity(0.1))
                        )
                }
                
                ForEach([ConversationCategory.feelings, .safety, .family, .needs, .fears], id: \.self) { category in
                    Button(action: {
                        withAnimation { selectedCategory = category }
                    }) {
                        HStack(spacing: 6) {
                            Image(systemName: category.icon)
                            Text(category.rawValue)
                        }
                        .font(.subheadline)
                        .fontWeight(.medium)
                        .foregroundColor(selectedCategory == category ? .white : .blue)
                        .padding(.horizontal, 16)
                        .padding(.vertical, 8)
                        .background(
                            Capsule()
                                .fill(selectedCategory == category ? Color.blue : Color.blue.opacity(0.1))
                        )
                    }
                }
            }
        }
    }
    
    // MARK: - Questions List
    private var questionsListSection: some View {
        VStack(spacing: 16) {
            ForEach(filteredQuestions) { question in
                BM8QuestionCard(question: question)
            }
        }
    }
    
    private var filteredQuestions: [BM8Question] {
        if let selectedCategory = selectedCategory {
            return questions.filter { $0.category == selectedCategory }
        }
        return questions
    }
}

// MARK: - BM8 Question Card
struct BM8QuestionCard: View {
    let question: BM8Question
    @State private var isExpanded = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Button(action: {
                withAnimation(.spring()) {
                    isExpanded.toggle()
                }
                triggerHaptic()
            }) {
                HStack(spacing: 16) {
                    Image(systemName: question.icon)
                        .font(.system(size: 30))
                        .foregroundColor(colorFromString(question.color))
                        .frame(width: 50, height: 50)
                        .background(
                            Circle()
                                .fill(colorFromString(question.color).opacity(0.2))
                        )
                    
                    VStack(alignment: .leading, spacing: 8) {
                        Text(question.question)
                            .font(.headline)
                            .foregroundColor(.primary)
                            .multilineTextAlignment(.leading)
                        
                        HStack {
                            Label(question.category.rawValue, systemImage: question.category.icon)
                                .font(.caption)
                                .foregroundColor(colorFromString(question.color))
                            
                            Spacer()
                            
                            Image(systemName: isExpanded ? "chevron.up" : "chevron.down")
                                .foregroundColor(.secondary)
                        }
                    }
                }
            }
            
            if isExpanded {
                VStack(alignment: .leading, spacing: 12) {
                    Divider()
                    
                    Text("Consejos para esta conversación:")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundColor(.secondary)
                    
                    ForEach(Array(question.tips.enumerated()), id: \.offset) { index, tip in
                        HStack(alignment: .top, spacing: 8) {
                            Image(systemName: "lightbulb.fill")
                                .font(.caption)
                                .foregroundColor(.yellow)
                            Text(tip)
                                .font(.body)
                                .foregroundColor(.primary)
                                .fixedSize(horizontal: false, vertical: true)
                        }
                    }
                    
                    Label(question.ageRange, systemImage: "person.fill")
                        .font(.caption)
                        .foregroundColor(.orange)
                        .padding(.top, 8)
                }
                .transition(.opacity.combined(with: .move(edge: .top)))
            }
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 18)
                .fill(Color(.systemBackground))
                .shadow(color: colorFromString(question.color).opacity(0.15), radius: 8, x: 0, y: 4)
        )
    }
    
    private func colorFromString(_ colorString: String) -> Color {
        switch colorString {
        case "mint": return .mint
        case "blue": return .blue
        case "purple": return .purple
        case "pink": return .pink
        case "orange": return .orange
        default: return .mint
        }
    }
    
    private func triggerHaptic() {
        #if !os(macOS)
        let impactFeedback = UIImpactFeedbackGenerator(style: .light)
        impactFeedback.impactOccurred()
        #endif
    }
}

// MARK: - CONVERSATIONS DATA
let conversationsData: [BM8Question] = [
    BM8Question(
        number: 1,
        question: "¿Cuándo te sientes más feliz del mundo?",
        icon: "face.smiling.fill",
        color: "mint",
        category: .feelings,
        tips: [
            "Escucha sin interrumpir. Dale tiempo para pensar su respuesta",
            "Si dice algo que te sorprende, no lo corrijas. Su felicidad puede venir de cosas que tú considerarías 'simples'",
            "Valida: 'Me encanta que eso te haga tan feliz. Vamos a hacer eso más seguido'",
            "Comparte tu propia respuesta: 'Yo me siento más feliz cuando estoy contigo'",
            "Esta pregunta te revela qué valora tu hijo y qué llena su corazón"
        ],
        ageRange: "3+ años"
    ),
    
    BM8Question(
        number: 2,
        question: "¿Qué haces cuando estás muy triste?",
        icon: "heart.fill",
        color: "blue",
        category: .feelings,
        tips: [
            "Observa si su respuesta es saludable ('busco a mamá/papá') o preocupante ('me escondo/me aguanto')",
            "Si dice que busca ayuda: ¡Excelente! Refuerza: 'Me encanta que sepas pedir ayuda cuando estás triste. Siempre puedes venir conmigo'",
            "Si dice que se aísla: Ofrece alternativa: 'También puedes venir a abrazarme. Está bien necesitar ayuda cuando estás triste'",
            "Esta pregunta revela sus estrategias de regulación emocional",
            "Modela tú también: 'Cuando yo estoy triste, busco abrazos de ustedes. Me ayudan mucho'"
        ],
        ageRange: "3+ años"
    ),
    
    BM8Question(
        number: 3,
        question: "¿Qué te hace sentir más seguro en todo el mundo?",
        icon: "shield.fill",
        color: "purple",
        category: .safety,
        tips: [
            "Esta es una pregunta CLAVE. Su respuesta revela su base de seguridad",
            "Respuestas ideales: 'Tú', 'Mamá', 'Nuestra familia', 'Los abrazos', 'Dormir contigo'",
            "Si dice objetos ('mi peluche', 'mi cobija'): está bien, pero considera si necesita MÁS conexión humana",
            "Si dice 'tú/mamá/papá': ¡PERFECTO! Eres su base segura. Refuerza: 'Y yo siempre estaré aquí para ti. Siempre'",
            "Esta pregunta también te dice si se siente seguro en general"
        ],
        ageRange: "4+ años"
    ),
    
    BM8Question(
        number: 4,
        question: "¿Cuál es tu abrazo favorito de todos?",
        icon: "figure.2.arms.open",
        color: "pink",
        category: .family,
        tips: [
            "Pregunta de seguimiento: '¿De quién es ese abrazo? ¿Cómo es? ¿Qué lo hace especial?'",
            "Observa los detalles: ¿Le gustan abrazos fuertes o suaves? ¿Largos o cortos? ¿Con balanceo?",
            "Después de la conversación, dale ese abrazo exacto que describió",
            "Esto normaliza hablar de necesidades de contacto físico. Está bien tener preferencias",
            "Comparte el tuyo: 'Mi abrazo favorito es cuando tú corres y te lanzas a mis brazos'"
        ],
        ageRange: "3+ años"
    ),
    
    BM8Question(
        number: 5,
        question: "¿Hay algo que te dé miedo y no me hayas contado?",
        icon: "sparkles",
        color: "orange",
        category: .fears,
        tips: [
            "Esta pregunta requiere MUCHA seguridad. Hazla solo si tienen buena comunicación",
            "No fuerces. Si dice 'no', respeta totalmente. Puedes preguntar otro día",
            "Si comparte un miedo: NUNCA minimices ('eso no da miedo', 'ya eres grande')",
            "Valida completamente: 'Entiendo que eso te dé miedo. Muchas personas le tienen miedo a eso. Gracias por confiar en mí y contármelo'",
            "Pregunta: '¿Qué podría ayudarte a sentirte menos asustado?' Busquen soluciones juntos",
            "Comparte tú también un miedo: 'Yo de niño le tenía miedo a...' Esto normaliza tener miedos"
        ],
        ageRange: "4+ años"
    ),
    
    BM8Question(
        number: 6,
        question: "¿Qué es lo mejor de nuestra familia?",
        icon: "house.fill",
        color: "mint",
        category: .family,
        tips: [
            "Esta pregunta es una mina de oro. Su respuesta te dice qué valora MÁS de ustedes",
            "Puede decir cosas tangibles ('que jugamos') o intangibles ('que nos amamos'). Todo es válido",
            "Observa si menciona contacto físico ('que dormimos juntos', 'que me abrazas'), tiempo ('que jugamos'), o palabras ('que me dices que me amas')",
            "Refuerza: 'A mí también me encanta eso de nuestra familia. Vamos a seguir haciéndolo siempre'",
            "Integra más de eso que valoró en su rutina diaria",
            "Pregunta de seguimiento: '¿Hay algo que quisieras que hiciéramos más seguido?'"
        ],
        ageRange: "4+ años"
    ),
    
    BM8Question(
        number: 7,
        question: "¿Cómo sabes que te amo muchísimo?",
        icon: "heart.circle.fill",
        color: "blue",
        category: .family,
        tips: [
            "Esta pregunta identifica su 'lenguaje de amor' (palabras, tiempo, contacto, regalos, servicios)",
            "Si dice 'porque me lo dices': su lenguaje son las PALABRAS. Dile 'te amo' más seguido",
            "Si dice 'porque juegas conmigo': su lenguaje es TIEMPO de calidad. Prioriza tiempo juntos",
            "Si dice 'porque me abrazas': su lenguaje es CONTACTO físico. Dale más abrazos",
            "Si dice 'no sé' o duda: ALERTA. Reflexiona: ¿estás comunicando tu amor claramente?",
            "Después de su respuesta, dile explícitamente: 'Te amo no por lo que haces, sino por SER TÚ. Te amaría igual si no hicieras nada'"
        ],
        ageRange: "4+ años"
    ),
    
    BM8Question(
        number: 8,
        question: "¿Hay algo que necesites de mí y no me hayas pedido?",
        icon: "hand.raised.fill",
        color: "purple",
        category: .needs,
        tips: [
            "Pregunta muy poderosa que DA VOZ al niño. Le dice: 'Tu opinión importa'",
            "No te pongas a la defensiva si pide algo. Escucha con mente abierta",
            "Si pide algo razonable: 'Gracias por decírmelo. Voy a intentar darte eso'",
            "Si pide algo imposible: 'Entiendo que quisieras eso. No puedo darte exactamente eso, pero ¿qué tal si...?' (alternativa)",
            "Valida siempre: 'Me alegra que confíes en mí para pedirme cosas'",
            "Esta pregunta puede revelar necesidades no satisfechas. Tómala muy en serio"
        ],
        ageRange: "5+ años"
    ),
    
    BM8Question(
        number: 9,
        question: "¿Qué es lo que más te gusta hacer conmigo?",
        icon: "figure.and.child.holdinghands",
        color: "mint",
        category: .family,
        tips: [
            "Su respuesta te dice qué tipo de conexión valora más contigo",
            "Puede ser actividades ('jugar fútbol') o momentos ('hablar antes de dormir'). Ambas importan",
            "Intenta hacer esa actividad MÁS seguido. Es claramente importante para él",
            "Valida: 'A mí también me encanta hacer eso contigo. Eres mi compañero favorito'",
            "Si menciona algo que hace tiempo no hacen: reconecta. 'Tienes razón, hace tiempo no lo hacemos. ¿Lo hacemos mañana?'",
            "Esta pregunta identifica momentos de conexión profunda para priorizar"
        ],
        ageRange: "3+ años"
    ),
    
    BM8Question(
        number: 10,
        question: "Si pudieras cambiar algo de cómo soy contigo como papá/mamá, ¿qué sería?",
        icon: "arrow.triangle.2.circlepath",
        color: "orange",
        category: .needs,
        tips: [
            "Esta es la pregunta MÁS valiente que puedes hacer. Requiere humildad",
            "No te ofendas. Los niños son honestos. Su respuesta es un REGALO",
            "Puede decir: 'que grites menos', 'que juegues más conmigo', 'que estés menos en el celular'",
            "AGRADECE su honestidad: 'Gracias por decirme esto. Es valiente de tu parte. Voy a trabajar en eso'",
            "Reflexiona seriamente en su respuesta. Puede dolerte, pero es información valiosa",
            "Pregunta de seguimiento: '¿Cómo te sentirías si yo cambiara eso?'",
            "Esta pregunta demuestra que los padres también pueden mejorar. Es modelar humildad"
        ],
        ageRange: "5+ años"
    ),
    
    BM8Question(
        number: 11,
        question: "¿Cuándo te sientes más cerca de mí emocionalmente?",
        icon: "heart.fill",
        color: "pink",
        category: .family,
        tips: [
            "Esta pregunta identifica los momentos de MÁXIMA conexión emocional",
            "Su respuesta puede sorprenderte. Puede no ser lo que imaginas",
            "Ejemplos comunes: 'cuando leemos cuentos', 'cuando hablamos en la cama antes de dormir', 'cuando me abrazas cuando lloro'",
            "Lo que mencione, AUMENTA eso en frecuencia. Es claramente un momento crucial para él",
            "Comparte: 'Yo también me siento muy cerca de ti en esos momentos. Son especiales para mí'",
            "Protege esos momentos. No los reemplaces con otras actividades",
            "Esos momentos de cercanía emocional son su banco de seguridad emocional"
        ],
        ageRange: "5+ años"
    ),
    
    BM8Question(
        number: 12,
        question: "¿Hay algo que quieras preguntarme tú a mí?",
        icon: "bubble.left.and.bubble.right.fill",
        color: "blue",
        category: .family,
        tips: [
            "Esta pregunta invierte los roles. Ahora ÉL pregunta, TÚ respondes",
            "Dale permiso total de preguntar lo que sea. 'Puedes preguntarme cualquier cosa'",
            "Responde con honestidad apropiada a su edad. No evadas preguntas difíciles",
            "Si pregunta algo muy complejo, simplifica pero no mientas",
            "Puede preguntar cosas profundas ('¿por qué existo?') o simples ('¿por qué el cielo es azul?'). Todo vale",
            "Agradece sus preguntas: 'Me encanta que me hagas preguntas. Significa que confías en mí'",
            "Si no sabes la respuesta: 'No sé, pero vamos a investigar juntos'. Esto modela que no saber está bien"
        ],
        ageRange: "4+ años"
    )
]
