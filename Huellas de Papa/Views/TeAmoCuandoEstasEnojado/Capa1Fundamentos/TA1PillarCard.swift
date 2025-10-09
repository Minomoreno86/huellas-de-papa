import SwiftUI

/// Tarjeta visual para mostrar un pilar del amor incondicional
struct TA1PillarCard: View {
    let pillar: TA1Pillar
    
    var body: some View {
        NavigationLink(destination: TA1PillarDetailView(pillar: pillar)) {
            VStack(alignment: .leading, spacing: 12) {
                HStack {
                    Image(systemName: "heart.fill")
                        .font(.title2)
                        .foregroundStyle(
                            LinearGradient(
                                colors: [.pink, .mint],
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            )
                        )
                    
                    Spacer()
                }
                
                Text(pillar.name)
                    .font(.headline)
                    .fontWeight(.bold)
                    .foregroundColor(.primary)
                
                Text(pillar.definition)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                    .lineLimit(2)
            }
            .padding()
            .frame(maxWidth: .infinity)
            .background(
                RoundedRectangle(cornerRadius: 16)
                    .fill(Color(.systemBackground))
                    .shadow(color: Color.pink.opacity(0.1), radius: 8, x: 0, y: 4)
            )
            .overlay(
                RoundedRectangle(cornerRadius: 16)
                    .stroke(
                        LinearGradient(
                            colors: [.pink.opacity(0.3), .mint.opacity(0.2)],
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        ),
                        lineWidth: 1
                    )
            )
        }
        .buttonStyle(PlainButtonStyle())
    }
}

