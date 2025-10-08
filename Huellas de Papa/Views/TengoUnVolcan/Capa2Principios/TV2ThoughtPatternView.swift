import SwiftUI

/// Vista que muestra los patrones de pensamiento (Nubes de Humo vs Aire Fresco)
struct TV2ThoughtPatternView: View {
    var body: some View {
        VStack(spacing: 16) {
            ForEach(TV2Data.thoughtPatterns) { pattern in
                thoughtPatternCard(pattern)
            }
        }
    }
    
    private func thoughtPatternCard(_ pattern: TV2ThoughtPattern) -> some View {
        VStack(alignment: .leading, spacing: 16) {
            // Tipo de pensamiento
            HStack {
                Image(systemName: "tag.fill")
                    .foregroundColor(.purple)
                
                Text(pattern.thoughtType.rawValue)
                    .font(.caption)
                    .fontWeight(.semibold)
                    .foregroundColor(.purple)
                    .padding(.horizontal, 12)
                    .padding(.vertical, 6)
                    .background(
                        Capsule()
                            .fill(Color.purple.opacity(0.1))
                    )
            }
            
            // Comparación: Nube de Humo vs Aire Fresco
            HStack(spacing: 12) {
                // Nube de Humo (Negativo)
                VStack(alignment: .leading, spacing: 12) {
                    HStack {
                        Image(systemName: "smoke.fill")
                            .foregroundColor(.red)
                            .font(.title3)
                        
                        Text("Nube de Humo")
                            .font(.caption)
                            .fontWeight(.semibold)
                            .foregroundColor(.red)
                    }
                    
                    Text(pattern.negativeThought)
                        .font(.body)
                        .foregroundColor(.primary)
                        .italic()
                        .fontWeight(.medium)
                        .padding()
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .background(
                            RoundedRectangle(cornerRadius: 12)
                                .fill(Color.red.opacity(0.1))
                        )
                }
                
                // Flecha de transformación
                Image(systemName: "arrow.right")
                    .foregroundColor(.orange)
                    .font(.title2)
                    .fontWeight(.bold)
                
                // Aire Fresco (Positivo)
                VStack(alignment: .leading, spacing: 12) {
                    HStack {
                        Image(systemName: "wind")
                            .foregroundColor(.green)
                            .font(.title3)
                        
                        Text("Aire Fresco")
                            .font(.caption)
                            .fontWeight(.semibold)
                            .foregroundColor(.green)
                    }
                    
                    Text(pattern.positiveAlternative)
                        .font(.body)
                        .foregroundColor(.primary)
                        .italic()
                        .fontWeight(.medium)
                        .padding()
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .background(
                            RoundedRectangle(cornerRadius: 12)
                                .fill(Color.green.opacity(0.1))
                        )
                }
            }
            
            Divider()
            
            // Por qué alimenta la rabia
            VStack(alignment: .leading, spacing: 8) {
                HStack {
                    Image(systemName: "exclamationmark.triangle.fill")
                        .foregroundColor(.orange)
                    
                    Text("Por qué alimenta el volcán:")
                        .font(.caption)
                        .fontWeight(.semibold)
                        .foregroundColor(.orange)
                }
                
                Text(pattern.whyItFeedsAnger)
                    .font(.caption)
                    .foregroundColor(.secondary)
                    .fixedSize(horizontal: false, vertical: true)
            }
            
            Divider()
            
            // Ejemplo con niños
            VStack(alignment: .leading, spacing: 8) {
                HStack {
                    Image(systemName: "person.2.fill")
                        .foregroundColor(.mint)
                    
                    Text("Ejemplo:")
                        .font(.caption)
                        .fontWeight(.semibold)
                        .foregroundColor(.mint)
                }
                
                Text(pattern.childExample)
                    .font(.caption)
                    .foregroundColor(.secondary)
                    .italic()
                    .fixedSize(horizontal: false, vertical: true)
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(
                        RoundedRectangle(cornerRadius: 8)
                            .fill(Color.mint.opacity(0.1))
                    )
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
        TV2ThoughtPatternView()
            .padding()
    }
    .background(Color(.systemGroupedBackground))
}

