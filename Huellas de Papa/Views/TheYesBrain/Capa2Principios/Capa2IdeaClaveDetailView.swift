import SwiftUI

/// Vista detallada de una idea clave con contenido neuropsicológico completo
struct Capa2IdeaClaveDetailView: View {
    let idea: Capa2IdeaClave
    @Environment(\.dismiss) private var dismiss
    @State private var selectedTab: DetailTab = .consejos
    
    enum DetailTab: CaseIterable {
        case consejos, ejemplos, estrategias, inspiracion
        
        var title: String {
            switch self {
            case .consejos: return "💡 Consejos"
            case .ejemplos: return "📝 Ejemplos"
            case .estrategias: return "🛠️ Estrategias"
            case .inspiracion: return "✨ Inspiración"
            }
        }
    }
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 24) {
                    // Header
                    headerSection
                    
                    // Tabs
                    tabSection
                    
                    // Content
                    contentSection
                }
                .padding()
            }
            .navigationTitle(idea.titulo)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Cerrar") {
                        dismiss()
                    }
                }
            }
        }
    }
    
    private var headerSection: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack {
                Image(systemName: idea.icono)
                    .font(.largeTitle)
                    .foregroundColor(iconColor)
                    .frame(width: 48, height: 48)
                    .background(
                        Circle()
                            .fill(iconColor.opacity(0.1))
                    )
                
                VStack(alignment: .leading, spacing: 4) {
                    Text(idea.subtitulo)
                        .font(.title3)
                        .fontWeight(.medium)
                        .foregroundColor(.secondary)
                    
                    Text(idea.categoria)
                        .font(.caption)
                        .padding(.horizontal, 8)
                        .padding(.vertical, 4)
                        .background(
                            RoundedRectangle(cornerRadius: 8)
                                .fill(iconColor.opacity(0.2))
                        )
                        .foregroundColor(iconColor)
                }
                
                Spacer()
            }
            
            Text(idea.ideaCentral)
                .font(.body)
                .foregroundColor(.primary)
                .multilineTextAlignment(.leading)
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(iconColor.opacity(0.05))
                .overlay(
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(iconColor.opacity(0.2), lineWidth: 1)
                )
        )
    }
    
    private var tabSection: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 12) {
                ForEach(DetailTab.allCases, id: \.self) { tab in
                    Button(action: {
                        withAnimation(.easeInOut(duration: 0.3)) {
                            selectedTab = tab
                        }
                    }) {
                        Text(tab.title)
                            .font(.subheadline)
                            .fontWeight(.medium)
                            .foregroundColor(selectedTab == tab ? .white : iconColor)
                            .padding(.horizontal, 16)
                            .padding(.vertical, 8)
                            .background(
                                RoundedRectangle(cornerRadius: 20)
                                    .fill(selectedTab == tab ? iconColor : iconColor.opacity(0.1))
                            )
                    }
                }
            }
            .padding(.horizontal)
        }
    }
    
    @ViewBuilder
    private var contentSection: some View {
        switch selectedTab {
        case .consejos:
            consejosSection
        case .ejemplos:
            ejemplosSection
        case .estrategias:
            estrategiasSection
        case .inspiracion:
            inspiracionSection
        }
    }
    
    private var consejosSection: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("💡 Consejos de Aplicación")
                .font(.title2)
                .fontWeight(.bold)
                .foregroundColor(iconColor)
            
            Text(idea.consejosAplicacion)
                .font(.body)
                .foregroundColor(.primary)
                .multilineTextAlignment(.leading)
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 12)
                        .fill(iconColor.opacity(0.1))
                        .overlay(
                            RoundedRectangle(cornerRadius: 12)
                                .stroke(iconColor.opacity(0.3), lineWidth: 1)
                        )
                )
        }
    }
    
    private var ejemplosSection: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("📝 Ejemplos Prácticos")
                .font(.title2)
                .fontWeight(.bold)
                .foregroundColor(.green)
            
            if !idea.ejemplosPracticos.isEmpty {
                ForEach(Array(idea.ejemplosPracticos.enumerated()), id: \.offset) { index, ejemplo in
                    HStack(alignment: .top, spacing: 12) {
                        Text("\(index + 1)")
                            .font(.headline)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .frame(width: 24, height: 24)
                            .background(
                                Circle()
                                    .fill(Color.green)
                            )
                        
                        Text(ejemplo)
                            .font(.body)
                            .foregroundColor(.primary)
                            .multilineTextAlignment(.leading)
                    }
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 12)
                            .fill(Color.green.opacity(0.1))
                            .overlay(
                                RoundedRectangle(cornerRadius: 12)
                                    .stroke(Color.green.opacity(0.3), lineWidth: 1)
                            )
                    )
                }
            }
        }
    }
    
    private var estrategiasSection: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("🛠️ Estrategias Prácticas")
                .font(.title2)
                .fontWeight(.bold)
                .foregroundColor(.orange)
            
            if !idea.estrategiasPracticas.isEmpty {
                ForEach(Array(idea.estrategiasPracticas.enumerated()), id: \.offset) { index, estrategia in
                    HStack(alignment: .top, spacing: 12) {
                        Text("\(index + 1)")
                            .font(.headline)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .frame(width: 24, height: 24)
                            .background(
                                Circle()
                                    .fill(Color.orange)
                            )
                        
                        Text(estrategia)
                            .font(.body)
                            .foregroundColor(.primary)
                            .multilineTextAlignment(.leading)
                    }
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 12)
                            .fill(Color.orange.opacity(0.1))
                            .overlay(
                                RoundedRectangle(cornerRadius: 12)
                                    .stroke(Color.orange.opacity(0.3), lineWidth: 1)
                            )
                    )
                }
            }
        }
    }
    
    private var inspiracionSection: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("✨ Frase Inspiradora")
                .font(.title2)
                .fontWeight(.bold)
                .foregroundColor(.purple)
            
            VStack(alignment: .leading, spacing: 12) {
                Text("\"\(idea.fraseInspiradora)\"")
                    .font(.title3)
                    .italic()
                    .foregroundColor(.primary)
                    .multilineTextAlignment(.leading)
                
                Text("— \(idea.autor)")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 16)
                    .fill(Color.purple.opacity(0.1))
                    .overlay(
                        RoundedRectangle(cornerRadius: 16)
                            .stroke(Color.purple.opacity(0.3), lineWidth: 1)
                    )
            )
        }
    }
    
    private var iconColor: Color {
        switch idea.color {
        case "blue": return .blue
        case "green": return .green
        case "purple": return .purple
        case "pink": return .pink
        case "red": return .red
        case "orange": return .orange
        default: return .blue
        }
    }
}

// MARK: - Preview
struct Capa2IdeaClaveDetailView_Previews: PreviewProvider {
    static var previews: some View {
        Capa2IdeaClaveDetailView(idea: Capa2IdeasClaveData.ideasClave[0])
    }
}
