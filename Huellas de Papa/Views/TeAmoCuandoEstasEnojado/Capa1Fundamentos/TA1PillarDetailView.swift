import SwiftUI

/// Vista detallada de un pilar del amor incondicional
struct TA1PillarDetailView: View {
    let pillar: TA1Pillar
    
    var body: some View {
        ScrollView {
            VStack(spacing: 24) {
                // Header con icono
                VStack(spacing: 16) {
                    Image(systemName: "heart.circle.fill")
                        .font(.system(size: 80))
                        .foregroundStyle(
                            LinearGradient(
                                colors: [.pink, .mint],
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            )
                        )
                    
                    Text(pillar.name)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundStyle(
                            LinearGradient(
                                colors: [.pink, .mint],
                                startPoint: .leading,
                                endPoint: .trailing
                            )
                        )
                }
                .padding(.top)
                
                // Definición
                VStack(alignment: .leading, spacing: 12) {
                    Text("Definición")
                        .font(.headline)
                        .foregroundColor(.pink)
                    
                    Text(pillar.definition)
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
                    Label("Del libro", systemImage: "book.fill")
                        .font(.headline)
                        .foregroundColor(.mint)
                    
                    Text("\"")
                        .font(.largeTitle)
                        .foregroundColor(.mint.opacity(0.3))
                        + Text(pillar.bookQuote)
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
                
                // Ejemplo parental
                VStack(alignment: .leading, spacing: 12) {
                    Label("Cómo aplicarlo", systemImage: "lightbulb.fill")
                        .font(.headline)
                        .foregroundColor(.pink)
                    
                    Text(pillar.parentalExample)
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
            }
            .padding()
        }
        .navigationTitle("Pilar")
        .navigationBarTitleDisplayMode(.inline)
    }
}

