import SwiftUI

/// Tarjeta visual para mostrar una sección teórica
struct TA1SectionCard: View {
    let section: TA1Section
    @State private var isExpanded = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            // Header
            HStack {
                VStack(alignment: .leading, spacing: 8) {
                    Text(section.title)
                        .font(.headline)
                        .fontWeight(.bold)
                        .foregroundColor(.primary)
                    
                    Text(section.subtitle)
                        .font(.subheadline)
                        .foregroundColor(.pink)
                }
                
                Spacer()
                
                Image(systemName: isExpanded ? "chevron.up.circle.fill" : "chevron.down.circle.fill")
                    .font(.title2)
                    .foregroundColor(.mint)
            }
            
            // Contenido expandible
            if isExpanded {
                VStack(alignment: .leading, spacing: 12) {
                    Divider()
                    
                    Text(section.description)
                        .font(.body)
                        .foregroundColor(.secondary)
                    
                    HStack {
                        Image(systemName: "key.fill")
                            .foregroundColor(.pink)
                        
                        Text(section.keyIdea)
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .foregroundColor(.primary)
                    }
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(
                        RoundedRectangle(cornerRadius: 8)
                            .fill(Color.pink.opacity(0.1))
                    )
                }
                .transition(.opacity.combined(with: .move(edge: .top)))
            }
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(Color(.systemBackground))
                .shadow(color: Color.mint.opacity(0.1), radius: 8, x: 0, y: 4)
        )
        .overlay(
            RoundedRectangle(cornerRadius: 16)
                .stroke(
                    LinearGradient(
                        colors: [.mint.opacity(0.3), .pink.opacity(0.2)],
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    ),
                    lineWidth: 1
                )
        )
        .onTapGesture {
            withAnimation(.spring()) {
                isExpanded.toggle()
                triggerHaptic()
            }
        }
    }
    
    private func triggerHaptic() {
        let impactFeedback = UIImpactFeedbackGenerator(style: .light)
        impactFeedback.impactOccurred()
    }
}

