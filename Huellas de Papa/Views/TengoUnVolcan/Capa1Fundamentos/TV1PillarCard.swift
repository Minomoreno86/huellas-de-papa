import SwiftUI

/// Tarjeta visual para mostrar un pilar del modelo "Tengo un Volcán"
/// Al presionar, navega a una vista de detalle completa
struct TV1PillarCard: View {
    let pillar: TV1Pillar
    
    var body: some View {
        NavigationLink(destination: TV1PillarDetailView(pillar: pillar)) {
            VStack(alignment: .leading, spacing: 12) {
                // Ícono
                HStack {
                    Image(systemName: pillar.iconName)
                        .font(.title2)
                        .foregroundColor(.blue)
                        .frame(width: 50, height: 50)
                        .background(
                            Circle()
                                .fill(
                                    LinearGradient(
                                        gradient: Gradient(colors: [.blue.opacity(0.2), .mint.opacity(0.2)]),
                                        startPoint: .topLeading,
                                        endPoint: .bottomTrailing
                                    )
                                )
                        )
                    
                    Spacer()
                    
                    // Indicador de navegación
                    Image(systemName: "chevron.right")
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
                
                // Título
                Text(pillar.name)
                    .font(.headline)
                    .fontWeight(.semibold)
                    .foregroundColor(.primary)
                    .lineLimit(2)
                    .fixedSize(horizontal: false, vertical: true)
                
                // Descripción breve
                Text(pillar.definition)
                    .font(.caption)
                    .foregroundColor(.secondary)
                    .lineLimit(3)
                
                Spacer()
                
                // Footer con llamado a acción
                HStack {
                    Text("Ver más")
                        .font(.caption)
                        .fontWeight(.semibold)
                        .foregroundColor(.blue)
                    
                    Image(systemName: "arrow.right")
                        .font(.caption)
                        .foregroundColor(.blue)
                }
            }
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
            .frame(height: 200)
            .background(
                RoundedRectangle(cornerRadius: 16)
                    .fill(Color(.systemBackground))
                    .shadow(color: Color.black.opacity(0.1), radius: 8, x: 0, y: 2)
            )
        }
        .buttonStyle(PlainButtonStyle())
    }
}

#Preview {
    NavigationStack {
        TV1PillarCard(pillar: TV1Data.pillars[0])
            .padding()
    }
    .background(Color(.systemGroupedBackground))
}

