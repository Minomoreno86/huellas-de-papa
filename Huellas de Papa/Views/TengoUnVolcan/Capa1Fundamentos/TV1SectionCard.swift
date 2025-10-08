import SwiftUI

/// Tarjeta visual para mostrar una sección teórica del modelo del volcán
struct TV1SectionCard: View {
    let section: TV1Section
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            // Header
            VStack(alignment: .leading, spacing: 8) {
                Text(section.title)
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(.primary)
                
                Text(section.subtitle)
                    .font(.subheadline)
                    .foregroundColor(.blue)
                    .fontWeight(.medium)
            }
            
            Divider()
            
            // Description
            Text(section.description)
                .font(.body)
                .foregroundColor(.secondary)
                .fixedSize(horizontal: false, vertical: true)
            
            // Key Idea
            VStack(alignment: .leading, spacing: 8) {
                HStack {
                    Image(systemName: "lightbulb.fill")
                        .foregroundColor(.mint)
                        .font(.title3)
                    
                    Text("Idea Clave")
                        .font(.headline)
                        .foregroundColor(.mint)
                }
                
                Text(section.keyIdea)
                    .font(.callout)
                    .foregroundColor(.primary)
                    .italic()
                    .padding(.leading, 8)
            }
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 12)
                    .fill(Color.mint.opacity(0.1))
            )
        }
        .padding(20)
        .frame(width: 320)
        .background(
            RoundedRectangle(cornerRadius: 20)
                .fill(Color(.systemBackground))
                .shadow(color: Color.black.opacity(0.1), radius: 10, x: 0, y: 4)
        )
    }
}

#Preview {
    ScrollView(.horizontal) {
        HStack {
            ForEach(TV1Data.theoreticalSections) { section in
                TV1SectionCard(section: section)
            }
        }
        .padding()
    }
    .background(Color(.systemGroupedBackground))
}

