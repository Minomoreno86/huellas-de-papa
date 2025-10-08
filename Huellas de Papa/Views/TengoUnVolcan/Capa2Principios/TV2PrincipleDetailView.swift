import SwiftUI

/// Vista de detalle completa para un principio del modelo del volcán
struct TV2PrincipleDetailView: View {
    let principle: TV2Principle
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 32) {
                // Header
                headerSection
                
                // Descripción
                descriptionSection
                
                // Cómo funciona
                howItWorksSection
                
                // Ejemplo práctico
                practicalExampleSection
            }
            .padding()
        }
        .navigationTitle(principle.name)
        .navigationBarTitleDisplayMode(.large)
        .background(Color(.systemGroupedBackground))
    }
    
    // MARK: - Header
    private var headerSection: some View {
        VStack(spacing: 20) {
            ZStack {
                Circle()
                    .fill(
                        LinearGradient(
                            gradient: Gradient(colors: [principleColor.opacity(0.6), principleColor.opacity(0.3)]),
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                    )
                    .frame(width: 120, height: 120)
                
                Image(systemName: principle.iconName)
                    .font(.system(size: 50))
                    .foregroundColor(.white)
            }
        }
        .frame(maxWidth: .infinity)
    }
    
    // MARK: - Description
    private var descriptionSection: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack {
                Image(systemName: "doc.text.fill")
                    .foregroundColor(principleColor)
                    .font(.title2)
                
                Text("¿Qué es?")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .foregroundColor(.primary)
            }
            
            Text(principle.description)
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
    
    // MARK: - How It Works
    private var howItWorksSection: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack {
                Image(systemName: "gearshape.2.fill")
                    .foregroundColor(principleColor)
                    .font(.title2)
                
                Text("¿Cómo funciona?")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .foregroundColor(.primary)
            }
            
            Text(principle.howItWorks)
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
    
    // MARK: - Practical Example
    private var practicalExampleSection: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack {
                Image(systemName: "lightbulb.fill")
                    .foregroundColor(.orange)
                    .font(.title2)
                
                Text("Ejemplo Práctico")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .foregroundColor(.primary)
            }
            
            VStack(alignment: .leading, spacing: 12) {
                HStack(alignment: .top, spacing: 12) {
                    Image(systemName: "quote.opening")
                        .foregroundColor(principleColor)
                        .font(.title3)
                    
                    Text(principle.practicalExample)
                        .font(.callout)
                        .foregroundColor(.primary)
                        .italic()
                        .fixedSize(horizontal: false, vertical: true)
                        .lineSpacing(6)
                }
            }
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 12)
                    .fill(principleColor.opacity(0.1))
            )
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(Color(.systemBackground))
                .shadow(color: Color.black.opacity(0.1), radius: 8, x: 0, y: 2)
        )
    }
    
    // MARK: - Helper
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
        TV2PrincipleDetailView(principle: TV2Data.principles[0])
    }
}

