import SwiftUI

/// Vista del reporte final de evaluación
struct TA7ReportView: View {
    let responses: [TA7Response]
    
    private var averageScore: Double {
        guard !responses.isEmpty else { return 0 }
        let total = responses.reduce(0) { $0 + $1.score }
        return Double(total) / Double(responses.count)
    }
    
    var body: some View {
        VStack(spacing: 32) {
            // Header
            VStack(spacing: 16) {
                Image(systemName: "chart.bar.fill")
                    .font(.system(size: 80))
                    .foregroundStyle(LinearGradient(colors: scoreColors, startPoint: .topLeading, endPoint: .bottomTrailing))
                
                Text("Tu Reporte")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                
                // Score general
                ZStack {
                    Circle()
                        .stroke(Color.gray.opacity(0.2), lineWidth: 12)
                        .frame(width: 150, height: 150)
                    
                    Circle()
                        .trim(from: 0, to: averageScore / 100)
                        .stroke(LinearGradient(colors: scoreColors, startPoint: .topLeading, endPoint: .bottomTrailing), style: StrokeStyle(lineWidth: 12, lineCap: .round))
                        .frame(width: 150, height: 150)
                        .rotationEffect(.degrees(-90))
                        .animation(.spring(), value: averageScore)
                    
                    VStack(spacing: 4) {
                        Text("\(Int(averageScore))")
                            .font(.system(size: 50))
                            .fontWeight(.bold)
                        
                        Text("Promedio")
                            .font(.caption)
                            .foregroundColor(.secondary)
                    }
                }
            }
            .padding(.top)
            
            // Interpretación
            VStack(alignment: .leading, spacing: 12) {
                Label(interpretation, systemImage: interpretationIcon)
                    .font(.headline)
                    .foregroundColor(scoreColors.first ?? .pink)
                
                Text(interpretationMessage)
                    .font(.body)
                    .foregroundColor(.primary)
            }
            .padding()
            .background(RoundedRectangle(cornerRadius: 12).fill((scoreColors.first ?? .pink).opacity(0.1)))
            
            // Cita del libro
            VStack(spacing: 12) {
                Image(systemName: "heart.circle.fill")
                    .font(.largeTitle)
                    .foregroundStyle(LinearGradient(colors: [.pink, .mint], startPoint: .topLeading, endPoint: .bottomTrailing))
                
                Text("\"Aprender sobre nuestras emociones es clave. Hablar de ellas con alguien de confianza puede ayudar.\"")
                    .font(.body)
                    .italic()
                    .foregroundColor(.primary)
                    .multilineTextAlignment(.center)
                
                Text("— Erin Winters")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
            .padding()
            .background(RoundedRectangle(cornerRadius: 12).fill(LinearGradient(colors: [Color.pink.opacity(0.1), Color.mint.opacity(0.05)], startPoint: .topLeading, endPoint: .bottomTrailing)))
            
            // Recomendación general
            VStack(alignment: .leading, spacing: 12) {
                Label("Próximo Paso", systemImage: "arrow.forward.circle.fill")
                    .font(.headline)
                    .foregroundColor(.mint)
                
                Text(nextStepRecommendation)
                    .font(.body)
                    .foregroundColor(.primary)
            }
            .padding()
            .background(RoundedRectangle(cornerRadius: 12).fill(Color.mint.opacity(0.1)))
        }
        .padding()
    }
    
    private var scoreColors: [Color] {
        if averageScore >= 80 { return [.green, .mint] }
        else if averageScore >= 60 { return [.mint, .blue] }
        else if averageScore >= 40 { return [.orange, .yellow] }
        else { return [.pink, .red] }
    }
    
    private var interpretation: String {
        if averageScore >= 80 { return "Maestro del Amor Incondicional" }
        else if averageScore >= 60 { return "En Buen Camino" }
        else if averageScore >= 40 { return "Progresando" }
        else { return "Área de Oportunidad" }
    }
    
    private var interpretationIcon: String {
        if averageScore >= 80 { return "crown.fill" }
        else if averageScore >= 60 { return "hand.thumbsup.fill" }
        else if averageScore >= 40 { return "arrow.up.circle.fill" }
        else { return "lightbulb.fill" }
    }
    
    private var interpretationMessage: String {
        if averageScore >= 80 {
            return "¡Excelente! Estás aplicando el amor incondicional de forma consistente. Tu hijo está desarrollando apego seguro y confianza emocional."
        } else if averageScore >= 60 {
            return "Vas bien. Estás aplicando muchos principios del libro. Continúa practicando las áreas que identificaste como oportunidades de mejora."
        } else if averageScore >= 40 {
            return "Estás en proceso de aprendizaje. Cada paso cuenta. Enfócate en una o dos áreas específicas del libro para mejorar."
        } else {
            return "Este es el inicio de tu viaje. No te desanimes. El amor incondicional es una práctica que se desarrolla con el tiempo. Comienza con el Nivel 1 del entrenamiento."
        }
    }
    
    private var nextStepRecommendation: String {
        if averageScore >= 80 {
            return "Continúa con tu práctica y considera compartir tu experiencia con otros padres. Eres un modelo del amor incondicional."
        } else if averageScore >= 60 {
            return "Revisa el Plan de Entrenamiento y enfócate en las áreas que obtuvieron menor puntuación. Practica el ritual nocturno consistentemente."
        } else if averageScore >= 40 {
            return "Comienza con el Nivel 1: Aprendiz de Validación. Practica las frases básicas del libro diariamente."
        } else {
            return "Vuelve a leer el cuento con tu hijo. Comienza con validar una emoción al día usando las frases del libro. La constancia es más importante que la perfección."
        }
    }
}

