import SwiftUI

/// Vista detallada de un principio del amor incondicional
struct TA2PrincipleDetailView: View {
    let principle: TA2Principle
    
    var body: some View {
        ScrollView {
            VStack(spacing: 24) {
                // Header con icono
                VStack(spacing: 16) {
                    Image(systemName: "heart.text.square.fill")
                        .font(.system(size: 80))
                        .foregroundStyle(
                            LinearGradient(
                                colors: [.pink, .mint],
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            )
                        )
                    
                    Text(principle.name)
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundStyle(
                            LinearGradient(
                                colors: [.pink, .mint],
                                startPoint: .leading,
                                endPoint: .trailing
                            )
                        )
                        .multilineTextAlignment(.center)
                }
                .padding(.top)
                
                // Definición
                VStack(alignment: .leading, spacing: 12) {
                    Label("Definición", systemImage: "book.fill")
                        .font(.headline)
                        .foregroundColor(.pink)
                    
                    Text(principle.definition)
                        .font(.body)
                        .foregroundColor(.primary)
                }
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(
                    RoundedRectangle(cornerRadius: 12)
                        .fill(Color.pink.opacity(0.1))
                )
                
                // Cita del libro
                VStack(alignment: .leading, spacing: 12) {
                    Label("Del libro de Erin Winters", systemImage: "quote.bubble.fill")
                        .font(.headline)
                        .foregroundColor(.mint)
                    
                    Text("\"")
                        .font(.largeTitle)
                        .foregroundColor(.mint.opacity(0.3))
                        + Text(principle.bookQuote)
                        .font(.body)
                        .italic()
                        .foregroundColor(.primary)
                        + Text("\"")
                        .font(.largeTitle)
                        .foregroundColor(.mint.opacity(0.3))
                }
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(
                    RoundedRectangle(cornerRadius: 12)
                        .fill(Color.mint.opacity(0.1))
                )
                
                // Aplicación parental
                VStack(alignment: .leading, spacing: 12) {
                    Label("Cómo aplicarlo", systemImage: "hand.raised.fill")
                        .font(.headline)
                        .foregroundColor(.pink)
                    
                    Text(principle.parentApplication)
                        .font(.body)
                        .foregroundColor(.primary)
                }
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(
                    RoundedRectangle(cornerRadius: 12)
                        .fill(
                            LinearGradient(
                                colors: [Color.pink.opacity(0.05), Color.mint.opacity(0.05)],
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            )
                        )
                )
                
                // Impacto emocional
                VStack(alignment: .leading, spacing: 12) {
                    Label("Impacto emocional", systemImage: "brain.head.profile")
                        .font(.headline)
                        .foregroundColor(.mint)
                    
                    Text(principle.emotionalImpact)
                        .font(.body)
                        .foregroundColor(.primary)
                }
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(
                    RoundedRectangle(cornerRadius: 12)
                        .fill(Color.mint.opacity(0.1))
                )
            }
            .padding()
        }
        .background(Color(.systemGroupedBackground))
        .navigationTitle("Principio")
        .navigationBarTitleDisplayMode(.inline)
    }
}

