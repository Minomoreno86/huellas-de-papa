import SwiftUI

/// Tarjeta que representa una idea clave del Yes Brain
/// Muestra información básica y navega a vista detallada
struct Capa2IdeaClaveCard: View {
    let idea: Capa2IdeaClave
    
    var body: some View {
        NavigationLink(destination: Capa2IdeaClaveDetailView(idea: idea)) {
            VStack(alignment: .leading, spacing: 12) {
                HStack {
                    Image(systemName: idea.icono)
                        .font(.title2)
                        .foregroundColor(colorForTheme(idea.color))
                    
                    Spacer()
                    
                    Image(systemName: "arrow.right.circle.fill")
                        .font(.title3)
                        .foregroundColor(colorForTheme(idea.color))
                }
                
                Text(idea.titulo)
                    .font(.headline)
                    .fontWeight(.bold)
                    .foregroundColor(.primary)
                    .multilineTextAlignment(.leading)
                    .lineLimit(2)
                
                        Text(idea.consejosAplicacion)
                            .font(.subheadline)
                            .foregroundColor(colorForTheme(idea.color))
                            .multilineTextAlignment(.leading)
                            .lineLimit(2)
                
                Spacer()
                
                Text(idea.categoria)
                    .font(.caption)
                    .fontWeight(.medium)
                    .padding(.horizontal, 8)
                    .padding(.vertical, 4)
                    .background(
                        RoundedRectangle(cornerRadius: 8)
                            .fill(colorForTheme(idea.color).opacity(0.1))
                    )
                    .foregroundColor(colorForTheme(idea.color))
            }
            .padding()
            .frame(height: 180)
            .background(
                RoundedRectangle(cornerRadius: 16)
                    .fill(Color(.systemBackground))
                    .overlay(
                        RoundedRectangle(cornerRadius: 16)
                            .stroke(colorForTheme(idea.color).opacity(0.3), lineWidth: 1)
                    )
            )
            .shadow(
                color: colorForTheme(idea.color).opacity(0.1),
                radius: 6,
                x: 0,
                y: 3
            )
        }
        .buttonStyle(PlainButtonStyle())
    }
    
    private func colorForTheme(_ theme: String) -> Color {
        switch theme {
        case "blue": return .blue
        case "mint": return .mint
        case "green": return .green
        case "purple": return .purple
        case "red": return .red
        default: return .gray
        }
    }
}

struct Capa2IdeaClaveCard_Previews: PreviewProvider {
    static var previews: some View {
        let sampleIdea = Capa2IdeaClave(
            titulo: "La Integración es la Clave del Bienestar",
            subtitulo: "Fundamento del desarrollo cerebral",
            ideaCentral: "El cerebro funciona de manera óptima cuando sus diferentes partes trabajan juntas.",
            consejosAplicacion: "Ayuda a tu hijo a conectar sus diferentes experiencias y emociones. Cuando está desregulado, ayúdalo a nombrar lo que siente y a entender por qué.",
            ejemplosPracticos: ["Tu hijo está enojado porque no puede tener un juguete. En lugar de decir 'no llores', ayúdalo a nombrar su emoción"],
            estrategiasPracticas: ["Practica el 'naming' de emociones: 'Veo que estás sintiendo...'", "Ayuda a tu hijo a conectar sus emociones con sus necesidades"],
            fraseInspiradora: "Un cerebro integrado es un cerebro resiliente.",
            autor: "Daniel J. Siegel",
            nivelDificultad: 3,
            categoria: "Integración",
            icono: "brain.head.profile",
            color: "blue"
        )
        
        NavigationView {
            Capa2IdeaClaveCard(idea: sampleIdea)
                .padding()
        }
    }
}