import SwiftUI

/// Tarjeta visual para mostrar un principio del amor incondicional
struct TA2PrincipleCard: View {
    let principle: TA2Principle
    
    var body: some View {
        NavigationLink(destination: TA2PrincipleDetailView(principle: principle)) {
            VStack(alignment: .leading, spacing: 16) {
                // Header con icono
                HStack {
                    Image(systemName: "heart.text.square.fill")
                        .font(.title)
                        .foregroundStyle(
                            LinearGradient(
                                colors: [.pink, .mint],
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            )
                        )
                    
                    Spacer()
                }
                
                // Nombre del principio
                Text(principle.name)
                    .font(.headline)
                    .fontWeight(.bold)
                    .foregroundColor(.primary)
                    .lineLimit(2)
                
                // Definición
                Text(principle.definition)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                    .lineLimit(3)
                
                Divider()
                
                // Cita del libro
                HStack(alignment: .top, spacing: 8) {
                    Image(systemName: "quote.bubble.fill")
                        .font(.caption)
                        .foregroundColor(.mint)
                    
                    Text(principle.bookQuote)
                        .font(.caption)
                        .italic()
                        .foregroundColor(.secondary)
                        .lineLimit(2)
                }
            }
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 16)
                    .fill(Color(.systemBackground))
                    .shadow(color: Color.pink.opacity(0.15), radius: 10, x: 0, y: 4)
            )
            .overlay(
                RoundedRectangle(cornerRadius: 16)
                    .stroke(
                        LinearGradient(
                            colors: [.pink.opacity(0.4), .mint.opacity(0.3)],
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        ),
                        lineWidth: 1.5
                    )
            )
        }
        .buttonStyle(PlainButtonStyle())
    }
}

