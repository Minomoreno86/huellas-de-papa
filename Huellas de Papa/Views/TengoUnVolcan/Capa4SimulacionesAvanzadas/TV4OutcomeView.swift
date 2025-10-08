import SwiftUI

/// Vista que muestra el resultado de la opción elegida
struct TV4OutcomeView: View {
    let option: TV4Option
    let scenario: TV4Scenario
    let onTryAgain: () -> Void
    let onContinue: () -> Void
    
    var body: some View {
        VStack(spacing: 32) {
            // 1. Header con evaluación
            evaluationHeader
            
            // 2. Respuesta elegida
            chosenResponseCard
            
            // 3. Reacción del niño
            childReactionCard
            
            // 4. Efecto en el volcán
            volcanoEffectCard
            
            // 5. Tu emoción como padre
            parentEmotionCard
            
            // 6. Por qué pasó esto
            whyThisHappenedCard
            
            // 7. Impacto a largo plazo
            longTermImpactCard
            
            // 8. Qué hacer ahora
            whatToDoNextCard
            
            // 9. Insight del escenario
            insightCard
            
            // 10. Botones de acción
            actionButtons
        }
    }
    
    // MARK: - Evaluation Header
    private var evaluationHeader: some View {
        VStack(spacing: 20) {
            // Rating visual
            ZStack {
                Circle()
                    .fill(ratingColor.opacity(0.2))
                    .frame(width: 100, height: 100)
                
                VStack(spacing: 4) {
                    HStack(spacing: 2) {
                        ForEach(1...5, id: \.self) { star in
                            Image(systemName: star <= option.outcome.rating ? "star.fill" : "star")
                                .foregroundColor(star <= option.outcome.rating ? ratingColor : .gray)
                                .font(.caption)
                        }
                    }
                    
                    Text(responseTypeText)
                        .font(.caption)
                        .fontWeight(.bold)
                        .foregroundColor(ratingColor)
                }
            }
            
            Text(responseTypeMessage)
                .font(.title3)
                .fontWeight(.semibold)
                .foregroundColor(.primary)
                .multilineTextAlignment(.center)
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(
                    LinearGradient(
                        gradient: Gradient(colors: [ratingColor.opacity(0.2), ratingColor.opacity(0.05)]),
                        startPoint: .top,
                        endPoint: .bottom
                    )
                )
        )
    }
    
    // MARK: - Cards
    private var chosenResponseCard: some View {
        outcomeCard(
            icon: "hand.raised.fill",
            title: "Tu Respuesta",
            content: option.text,
            color: .blue
        )
    }
    
    private var childReactionCard: some View {
        outcomeCard(
            icon: "person.fill",
            title: "Reacción de \(scenario.childName)",
            content: option.outcome.childReaction,
            color: .purple
        )
    }
    
    private var volcanoEffectCard: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack {
                volcanoEffectIcon
                
                Text("Efecto en el Volcán")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .foregroundColor(.primary)
            }
            
            HStack {
                Text(option.outcome.volcanoEffect.rawValue)
                    .font(.headline)
                    .foregroundColor(volcanoEffectColor)
                    .padding(.horizontal, 16)
                    .padding(.vertical, 8)
                    .background(
                        Capsule()
                            .fill(volcanoEffectColor.opacity(0.2))
                    )
                
                Spacer()
            }
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(Color(.systemBackground))
                .shadow(color: Color.black.opacity(0.1), radius: 8, x: 0, y: 2)
        )
    }
    
    private var parentEmotionCard: some View {
        outcomeCard(
            icon: "heart.fill",
            title: "Tu Emoción como Padre/Madre",
            content: option.outcome.parentEmotion,
            color: .pink
        )
    }
    
    private var whyThisHappenedCard: some View {
        outcomeCard(
            icon: "questionmark.circle.fill",
            title: "¿Por Qué Pasó Esto?",
            content: option.outcome.whyThisHappened,
            color: .orange
        )
    }
    
    private var longTermImpactCard: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack {
                Image(systemName: "calendar.badge.clock")
                    .foregroundColor(impactColor)
                    .font(.title2)
                
                Text("Impacto a Largo Plazo")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .foregroundColor(.primary)
            }
            
            // Badge de impacto
            HStack {
                Text(impactBadge)
                    .font(.caption)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding(.horizontal, 12)
                    .padding(.vertical, 6)
                    .background(
                        Capsule()
                            .fill(impactColor)
                    )
                
                Spacer()
            }
            
            Text(option.outcome.longTermImpact)
                .font(.body)
                .foregroundColor(.primary)
                .fixedSize(horizontal: false, vertical: true)
                .lineSpacing(6)
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(Color(.systemBackground))
                .shadow(color: Color.black.opacity(0.1), radius: 8, x: 0, y: 2)
        )
    }
    
    private var whatToDoNextCard: some View {
        outcomeCard(
            icon: "arrow.forward.circle.fill",
            title: "Qué Hacer Ahora",
            content: option.outcome.whatToDoNext,
            color: .mint
        )
    }
    
    private var insightCard: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack {
                Image(systemName: "lightbulb.fill")
                    .foregroundColor(.yellow)
                    .font(.title2)
                
                Text("Insight Clave del Escenario")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .foregroundColor(.primary)
            }
            
            Text(scenario.insight)
                .font(.callout)
                .foregroundColor(.primary)
                .fontWeight(.medium)
                .italic()
                .fixedSize(horizontal: false, vertical: true)
                .lineSpacing(6)
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 12)
                        .fill(Color.yellow.opacity(0.1))
                )
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(Color(.systemBackground))
                .shadow(color: Color.black.opacity(0.1), radius: 8, x: 0, y: 2)
        )
    }
    
    private var actionButtons: some View {
        VStack(spacing: 12) {
            // Botón para intentar de nuevo
            Button {
                onTryAgain()
            } label: {
                HStack {
                    Image(systemName: "arrow.counterclockwise")
                    Text("Probar otra respuesta")
                        .fontWeight(.semibold)
                }
                .foregroundColor(.blue)
                .frame(maxWidth: .infinity)
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 12)
                        .fill(Color.blue.opacity(0.1))
                )
            }
            
            // Botón para continuar
            if option.outcome.rating >= 4 {
                Button {
                    onContinue()
                } label: {
                    HStack {
                        Image(systemName: "checkmark.circle.fill")
                        Text("Continuar")
                            .fontWeight(.semibold)
                    }
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 12)
                            .fill(Color.green)
                    )
                }
            }
        }
        .padding(.vertical)
    }
    
    // MARK: - Helper Function
    private func outcomeCard(icon: String, title: String, content: String, color: Color) -> some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack {
                Image(systemName: icon)
                    .foregroundColor(color)
                    .font(.title2)
                
                Text(title)
                    .font(.title2)
                    .fontWeight(.semibold)
                    .foregroundColor(.primary)
            }
            
            Text(content)
                .font(.body)
                .foregroundColor(.secondary)
                .fixedSize(horizontal: false, vertical: true)
                .lineSpacing(6)
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(Color(.systemBackground))
                .shadow(color: Color.black.opacity(0.1), radius: 8, x: 0, y: 2)
        )
    }
    
    // MARK: - Computed Properties
    private var ratingColor: Color {
        switch option.outcome.rating {
        case 5: return .green
        case 3, 4: return .orange
        default: return .red
        }
    }
    
    private var responseTypeText: String {
        switch option.responseType {
        case .effective: return "EFECTIVA"
        case .needsWork: return "MEJORABLE"
        case .counterproductive: return "CONTRAPRODUCENTE"
        }
    }
    
    private var responseTypeMessage: String {
        switch option.responseType {
        case .effective: return "¡Excelente elección! Esta es una respuesta muy efectiva"
        case .needsWork: return "Esta respuesta puede mejorar. Veamos cómo"
        case .counterproductive: return "Esta respuesta no es la mejor opción. Aprendamos por qué"
        }
    }
    
    private var impactColor: Color {
        if option.outcome.longTermImpact.contains("POSITIVO") {
            return .green
        } else if option.outcome.longTermImpact.contains("MIXTO") {
            return .orange
        } else {
            return .red
        }
    }
    
    private var impactBadge: String {
        if option.outcome.longTermImpact.contains("POSITIVO") {
            return "IMPACTO POSITIVO"
        } else if option.outcome.longTermImpact.contains("MIXTO") {
            return "IMPACTO MIXTO"
        } else {
            return "IMPACTO NEGATIVO"
        }
    }
    
    private var volcanoEffectIcon: some View {
        Group {
            switch option.outcome.volcanoEffect {
            case .decreased:
                Image(systemName: "arrow.down.circle.fill")
                    .foregroundColor(.green)
            case .maintained:
                Image(systemName: "equal.circle.fill")
                    .foregroundColor(.orange)
            case .increased:
                Image(systemName: "arrow.up.circle.fill")
                    .foregroundColor(.red)
            case .exploded:
                Image(systemName: "exclamationmark.triangle.fill")
                    .foregroundColor(.purple)
            }
        }
        .font(.title2)
    }
    
    private var volcanoEffectColor: Color {
        switch option.outcome.volcanoEffect {
        case .decreased: return .green
        case .maintained: return .orange
        case .increased: return .red
        case .exploded: return .purple
        }
    }
    
    private var phaseIcon: some View {
        Group {
            switch scenario.volcanoPhase {
            case .chispa:
                Image(systemName: "flame.fill")
                    .foregroundColor(.orange)
            case .burbujeo:
                Image(systemName: "smoke.fill")
                    .foregroundColor(.red)
            case .erupcion:
                Image(systemName: "tornado")
                    .foregroundColor(.purple)
            }
        }
        .font(.caption)
    }
    
    private var phaseColor: Color {
        switch scenario.volcanoPhase {
        case .chispa: return .orange
        case .burbujeo: return .red
        case .erupcion: return .purple
        }
    }
}

#Preview {
    ScrollView {
        TV4OutcomeView(
            option: TV4Data.scenarios[0].options[2],
            scenario: TV4Data.scenarios[0],
            onTryAgain: {},
            onContinue: {}
        )
        .padding()
    }
    .background(Color(.systemGroupedBackground))
}

