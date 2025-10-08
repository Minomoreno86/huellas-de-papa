import SwiftUI

/// Tarjeta visual para mostrar un principio del modelo del volcán
struct TV2PrincipleCard: View {
    let principle: TV2Principle
    let isSelected: Bool
    
    var body: some View {
        NavigationLink(destination: TV2PrincipleDetailView(principle: principle)) {
            VStack(alignment: .leading, spacing: 16) {
                // Ícono y título
                HStack {
                    Image(systemName: principle.iconName)
                        .font(.largeTitle)
                        .foregroundColor(principleColor)
                        .frame(width: 60, height: 60)
                        .background(
                            Circle()
                                .fill(principleColor.opacity(0.2))
                        )
                    
                    Spacer()
                }
                
                Text(principle.name)
                    .font(.headline)
                    .fontWeight(.bold)
                    .foregroundColor(.primary)
                    .lineLimit(2)
                    .fixedSize(horizontal: false, vertical: true)
                
                Text(principle.description)
                    .font(.caption)
                    .foregroundColor(.secondary)
                    .lineLimit(4)
                
                Spacer()
                
                // Footer
                HStack {
                    Text("Ver detalles")
                        .font(.caption)
                        .fontWeight(.semibold)
                        .foregroundColor(principleColor)
                    
                    Image(systemName: "arrow.right")
                        .font(.caption)
                        .foregroundColor(principleColor)
                }
            }
            .padding()
            .frame(width: 280, height: 260)
            .background(
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color(.systemBackground))
                    .shadow(color: Color.black.opacity(isSelected ? 0.2 : 0.1), radius: isSelected ? 12 : 8, x: 0, y: isSelected ? 6 : 2)
            )
            .overlay(
                RoundedRectangle(cornerRadius: 20)
                    .stroke(isSelected ? principleColor : Color.clear, lineWidth: 2)
            )
            .scaleEffect(isSelected ? 1.05 : 1.0)
            .animation(.spring(), value: isSelected)
        }
        .buttonStyle(PlainButtonStyle())
    }
    
    private var principleColor: Color {
        switch principle.color {
        case "orange": return .orange
        case "red": return .red
        case "purple": return .purple
        case "mint": return .mint
        case "blue": return .blue
        default: return .blue
        }
    }
}

#Preview {
    NavigationStack {
        ScrollView(.horizontal) {
            HStack {
                TV2PrincipleCard(principle: TV2Data.principles[0], isSelected: true)
                TV2PrincipleCard(principle: TV2Data.principles[1], isSelected: false)
            }
            .padding()
        }
    }
    .background(Color(.systemGroupedBackground))
}

