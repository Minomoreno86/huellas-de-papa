import SwiftUI

/// Vista que muestra las frases calmantes del Hada del Volcán
struct TV3PhraseView: View {
    var body: some View {
        VStack(spacing: 16) {
            ForEach(TV3Data.phrases) { phrase in
                phraseCard(phrase)
            }
        }
    }
    
    private func phraseCard(_ phrase: TV3Phrase) -> some View {
        VStack(alignment: .leading, spacing: 16) {
            // Frase principal
            VStack(alignment: .leading, spacing: 12) {
                HStack(spacing: 8) {
                    Image(systemName: phrase.iconName)
                        .foregroundColor(.mint)
                        .font(.title3)
                    
                    Spacer()
                    
                    Image(systemName: "quote.opening")
                        .foregroundColor(.mint.opacity(0.3))
                        .font(.title)
                }
                
                Text(phrase.text)
                    .font(.title3)
                    .fontWeight(.semibold)
                    .foregroundColor(.primary)
                    .italic()
                    .fixedSize(horizontal: false, vertical: true)
                    .lineSpacing(6)
            }
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 12)
                    .fill(
                        LinearGradient(
                            gradient: Gradient(colors: [.mint.opacity(0.2), .mint.opacity(0.1)]),
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                    )
            )
            
            // Cuándo usarla
            VStack(alignment: .leading, spacing: 8) {
                HStack {
                    Image(systemName: "clock.fill")
                        .foregroundColor(.orange)
                        .font(.caption)
                    
                    Text("Cuándo usarla:")
                        .font(.caption)
                        .fontWeight(.semibold)
                        .foregroundColor(.orange)
                }
                
                Text(phrase.situation)
                    .font(.caption)
                    .foregroundColor(.secondary)
                    .fixedSize(horizontal: false, vertical: true)
            }
            
            Divider()
            
            // Propósito
            VStack(alignment: .leading, spacing: 8) {
                HStack {
                    Image(systemName: "target")
                        .foregroundColor(.blue)
                        .font(.caption)
                    
                    Text("Propósito:")
                        .font(.caption)
                        .fontWeight(.semibold)
                        .foregroundColor(.blue)
                }
                
                Text(phrase.purpose)
                    .font(.caption)
                    .foregroundColor(.secondary)
                    .fixedSize(horizontal: false, vertical: true)
            }
            
            Divider()
            
            // Ejemplo
            VStack(alignment: .leading, spacing: 8) {
                HStack {
                    Image(systemName: "lightbulb.fill")
                        .foregroundColor(.yellow)
                        .font(.caption)
                    
                    Text("Ejemplo:")
                        .font(.caption)
                        .fontWeight(.semibold)
                        .foregroundColor(.yellow)
                }
                
                Text(phrase.example)
                    .font(.caption)
                    .foregroundColor(.secondary)
                    .italic()
                    .fixedSize(horizontal: false, vertical: true)
            }
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(Color(.systemBackground))
                .shadow(color: Color.black.opacity(0.1), radius: 8, x: 0, y: 2)
        )
    }
}

#Preview {
    ScrollView {
        TV3PhraseView()
            .padding()
    }
    .background(Color(.systemGroupedBackground))
}

