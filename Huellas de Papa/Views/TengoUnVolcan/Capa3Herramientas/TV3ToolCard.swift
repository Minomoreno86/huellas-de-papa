import SwiftUI

/// Tarjeta visual para mostrar una herramienta de la Caja de Herramientas
struct TV3ToolCard: View {
    let tool: TV3Tool
    
    var body: some View {
        NavigationLink(destination: TV3ToolDetailView(tool: tool)) {
            HStack(spacing: 16) {
                // Ícono grande
                Image(systemName: tool.iconName)
                    .font(.title)
                    .foregroundColor(toolColor)
                    .frame(width: 60, height: 60)
                    .background(
                        Circle()
                            .fill(toolColor.opacity(0.2))
                    )
                
                // Contenido
                VStack(alignment: .leading, spacing: 8) {
                    // Nombre
                    Text(tool.name)
                        .font(.headline)
                        .fontWeight(.semibold)
                        .foregroundColor(.primary)
                        .lineLimit(2)
                        .fixedSize(horizontal: false, vertical: true)
                    
                    // Objetivo resumido
                    Text(tool.objective)
                        .font(.caption)
                        .foregroundColor(.secondary)
                        .lineLimit(2)
                    
                    // Footer con categoría y fases
                    HStack {
                        // Categoría
                        Text(tool.category.rawValue)
                            .font(.caption2)
                            .foregroundColor(toolColor)
                            .padding(.horizontal, 8)
                            .padding(.vertical, 4)
                            .background(
                                Capsule()
                                    .fill(toolColor.opacity(0.1))
                            )
                        
                        // Fases recomendadas
                        HStack(spacing: 4) {
                            ForEach(tool.recommendedPhase, id: \.self) { phase in
                                phaseIcon(phase)
                            }
                        }
                        
                        Spacer()
                    }
                }
                
                // Chevron
                Image(systemName: "chevron.right")
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 16)
                    .fill(Color(.systemBackground))
                    .shadow(color: Color.black.opacity(0.1), radius: 8, x: 0, y: 2)
            )
        }
        .buttonStyle(PlainButtonStyle())
    }
    
    private func phaseIcon(_ phase: TV3Tool.VolcanoPhase) -> some View {
        Group {
            switch phase {
            case .chispa:
                Image(systemName: "flame.fill")
                    .foregroundColor(.orange)
                    .font(.caption2)
            case .burbujeo:
                Image(systemName: "smoke.fill")
                    .foregroundColor(.red)
                    .font(.caption2)
            case .erupcion:
                Image(systemName: "tornado")
                    .foregroundColor(.purple)
                    .font(.caption2)
            case .postErupcion:
                Image(systemName: "cloud.fill")
                    .foregroundColor(.gray)
                    .font(.caption2)
            }
        }
    }
    
    private var toolColor: Color {
        switch tool.color {
        case "mint": return .mint
        case "blue": return .blue
        case "green": return .green
        case "purple": return .purple
        case "orange": return .orange
        case "red": return .red
        case "yellow": return .yellow
        default: return .blue
        }
    }
}

#Preview {
    NavigationStack {
        ScrollView {
            VStack(spacing: 16) {
                ForEach(TV3Data.tools.prefix(4)) { tool in
                    TV3ToolCard(tool: tool)
                }
            }
            .padding()
        }
    }
    .background(Color(.systemGroupedBackground))
}

