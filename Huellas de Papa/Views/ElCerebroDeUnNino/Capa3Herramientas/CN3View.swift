import SwiftUI

/// Vista principal de la Capa 3 (Herramientas) del módulo El Cerebro del Niño
/// 12 herramientas prácticas basadas en las estrategias de Daniel Siegel
struct CN3View: View {
    @State private var selectedTool: CN3Tool?
    @State private var showingToolDetail = false
    @State private var searchText = ""
    
    var filteredTools: [CN3Tool] {
        if searchText.isEmpty {
            return cn3Tools
        } else {
            return cn3Tools.filter {
                $0.name.localizedCaseInsensitiveContains(searchText) ||
                $0.strategyName.localizedCaseInsensitiveContains(searchText)
            }
        }
    }
    
    var body: some View {
        ScrollView {
            VStack(spacing: 32) {
                // 1. Header
                headerSection
                
                // 2. Search Bar
                searchSection
                
                // 3. Herramientas
                toolsSection
                
                // 4. Frases Motivacionales
                phrasesSection
            }
            .padding()
        }
        .background(Color(.systemGroupedBackground))
        .navigationTitle("Herramientas")
        .navigationBarTitleDisplayMode(.large)
        .sheet(isPresented: $showingToolDetail) {
            if let tool = selectedTool {
                CN3ToolDetailView(tool: tool)
            }
        }
    }
    
    // MARK: - 1. Header Section
    private var headerSection: some View {
        VStack(spacing: 16) {
            Text("12 Herramientas Prácticas")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundStyle(
                    LinearGradient(
                        gradient: Gradient(colors: [.blue, .mint]),
                        startPoint: .leading,
                        endPoint: .trailing
                    )
                )
            
            Text("Aplicaciones concretas de las estrategias para usar hoy mismo")
                .font(.title3)
                .fontWeight(.medium)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
            
            Text("Paso a paso • Basadas en neurociencia • Resultados comprobados")
                .font(.subheadline)
                .foregroundColor(.blue)
                .multilineTextAlignment(.center)
                .italic()
        }
        .padding(.vertical)
    }
    
    // MARK: - 2. Search Section
    private var searchSection: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundColor(.secondary)
            
            TextField("Buscar herramienta...", text: $searchText)
                .textFieldStyle(PlainTextFieldStyle())
            
            if !searchText.isEmpty {
                Button(action: {
                    searchText = ""
                }) {
                    Image(systemName: "xmark.circle.fill")
                        .foregroundColor(.secondary)
                }
            }
        }
        .padding(12)
        .background(
            RoundedRectangle(cornerRadius: 10)
                .fill(Color(.systemBackground))
        )
    }
    
    // MARK: - 3. Tools Section
    private var toolsSection: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack {
                Text("Todas las Herramientas")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .foregroundColor(.primary)
                
                Spacer()
                
                Text("\(filteredTools.count)")
                    .font(.caption)
                    .fontWeight(.bold)
                    .padding(.horizontal, 10)
                    .padding(.vertical, 4)
                    .background(
                        Circle()
                            .fill(Color.blue.opacity(0.2))
                    )
                    .foregroundColor(.blue)
            }
            
            VStack(spacing: 12) {
                ForEach(filteredTools) { tool in
                    CN3ToolCard(tool: tool)
                        .onTapGesture {
                            selectedTool = tool
                            showingToolDetail = true
                            triggerHaptic()
                        }
                }
            }
        }
    }
    
    // MARK: - 4. Phrases Section
    private var phrasesSection: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("💡 Frases para Recordar")
                .font(.headline)
                .fontWeight(.semibold)
                .foregroundColor(.primary)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 12) {
                    ForEach(cn3Phrases) { phrase in
                        CN3PhraseCard(phrase: phrase)
                    }
                }
                .padding(.horizontal, 4)
            }
        }
        .padding(.bottom, 32)
    }
    
    // MARK: - Haptic Feedback
    private func triggerHaptic() {
        let impactFeedback = UIImpactFeedbackGenerator(style: .light)
        impactFeedback.impactOccurred()
    }
}

// MARK: - Supporting Views

/// Tarjeta para herramienta
struct CN3ToolCard: View {
    let tool: CN3Tool
    
    var body: some View {
        HStack(spacing: 16) {
            // Número de estrategia
            VStack(spacing: 4) {
                Text("\(tool.strategyNumber)")
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                
                Image(systemName: tool.icon)
                    .font(.title3)
                    .foregroundColor(.white)
            }
            .frame(width: 60, height: 80)
            .background(
                RoundedRectangle(cornerRadius: 12)
                    .fill(colorFromString(tool.color))
            )
            
            // Contenido
            VStack(alignment: .leading, spacing: 8) {
                Text(tool.name)
                    .font(.headline)
                    .fontWeight(.bold)
                    .foregroundColor(.primary)
                
                Text(tool.strategyName)
                    .font(.subheadline)
                    .foregroundColor(colorFromString(tool.color))
                    .fontWeight(.medium)
                
                HStack(spacing: 12) {
                    Label(tool.ageRange, systemImage: "person.fill")
                        .font(.caption)
                        .foregroundColor(.secondary)
                    
                    Label(tool.duration, systemImage: "clock.fill")
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
            }
            
            Spacer()
            
            Image(systemName: "chevron.right.circle.fill")
                .foregroundColor(.blue.opacity(0.3))
                .font(.title2)
        }
        .padding(16)
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(Color(.systemBackground))
                .shadow(color: Color.black.opacity(0.05), radius: 8, x: 0, y: 2)
        )
    }
    
    private func colorFromString(_ colorName: String) -> Color {
        switch colorName {
        case "pink": return .pink
        case "blue": return .blue
        case "purple": return .purple
        case "orange": return .orange
        case "green": return .green
        case "indigo": return .indigo
        case "teal": return .teal
        case "cyan": return .cyan
        case "yellow": return .yellow
        default: return .blue
        }
    }
}

/// Tarjeta pequeña para frase motivacional
struct CN3PhraseCard: View {
    let phrase: CN3Phrase
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                Text("Estrategia \(phrase.strategyNumber)")
                    .font(.caption)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding(.horizontal, 8)
                    .padding(.vertical, 4)
                    .background(
                        Capsule()
                            .fill(Color.blue)
                    )
                
                Spacer()
            }
            
            Text(phrase.text)
                .font(.body)
                .fontWeight(.medium)
                .foregroundColor(.primary)
                .fixedSize(horizontal: false, vertical: true)
            
            Text(phrase.context)
                .font(.caption)
                .foregroundColor(.secondary)
                .italic()
        }
        .padding(16)
        .frame(width: 280, height: 160)
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(
                    LinearGradient(
                        colors: [Color.blue.opacity(0.1), Color.mint.opacity(0.05)],
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                )
        )
    }
}

/// Vista de detalle para herramienta
struct CN3ToolDetailView: View {
    let tool: CN3Tool
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 24) {
                    // Header
                    VStack(spacing: 16) {
                        Image(systemName: tool.icon)
                            .font(.system(size: 60))
                            .foregroundColor(colorFromString(tool.color))
                        
                        VStack(spacing: 8) {
                            Text("Estrategia \(tool.strategyNumber)")
                                .font(.subheadline)
                                .foregroundColor(colorFromString(tool.color))
                                .fontWeight(.semibold)
                            
                            Text(tool.name)
                                .font(.title)
                                .fontWeight(.bold)
                                .foregroundColor(.primary)
                                .multilineTextAlignment(.center)
                            
                            Text(tool.strategyName)
                                .font(.headline)
                                .foregroundColor(.secondary)
                        }
                        
                        HStack(spacing: 16) {
                            InfoBadge(icon: "person.fill", text: tool.ageRange)
                            InfoBadge(icon: "clock.fill", text: tool.duration)
                        }
                    }
                    .frame(maxWidth: .infinity)
                    .padding(.vertical)
                    
                    // Objetivo
                    SectionCard(
                        title: "Objetivo",
                        icon: "target",
                        content: tool.objective,
                        color: colorFromString(tool.color)
                    )
                    
                    // Cuándo usar
                    SectionCard(
                        title: "Cuándo Usar",
                        icon: "calendar.badge.clock",
                        content: tool.whenToUse,
                        color: .blue
                    )
                    
                    // Materiales
                    if !tool.materials.isEmpty {
                        VStack(alignment: .leading, spacing: 12) {
                            Label("Materiales Necesarios", systemImage: "basket.fill")
                                .font(.headline)
                                .fontWeight(.semibold)
                            
                            ForEach(tool.materials, id: \.self) { material in
                                HStack(spacing: 8) {
                                    Image(systemName: "checkmark.circle.fill")
                                        .foregroundColor(.green)
                                    Text(material)
                                        .font(.body)
                                }
                            }
                        }
                        .padding(16)
                        .background(
                            RoundedRectangle(cornerRadius: 12)
                                .fill(Color.green.opacity(0.1))
                        )
                    }
                    
                    // Pasos
                    VStack(alignment: .leading, spacing: 16) {
                        Label("Paso a Paso", systemImage: "list.number")
                            .font(.headline)
                            .fontWeight(.semibold)
                        
                        ForEach(Array(tool.steps.enumerated()), id: \.offset) { index, step in
                            HStack(alignment: .top, spacing: 12) {
                                Text("\(index + 1)")
                                    .font(.headline)
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                                    .frame(width: 32, height: 32)
                                    .background(
                                        Circle()
                                            .fill(colorFromString(tool.color))
                                    )
                                
                                Text(step)
                                    .font(.body)
                                    .foregroundColor(.primary)
                                    .fixedSize(horizontal: false, vertical: true)
                            }
                        }
                    }
                    .padding(16)
                    .background(
                        RoundedRectangle(cornerRadius: 12)
                            .fill(Color(.systemBackground))
                    )
                    
                    // Impacto cerebral
                    SectionCard(
                        title: "¿Qué Pasa en el Cerebro?",
                        icon: "brain.head.profile",
                        content: tool.brainImpact,
                        color: .purple
                    )
                    
                    // Tips
                    VStack(alignment: .leading, spacing: 12) {
                        Label("Tips para Padres", systemImage: "star.fill")
                            .font(.headline)
                            .fontWeight(.semibold)
                        
                        ForEach(tool.tips, id: \.self) { tip in
                            HStack(alignment: .top, spacing: 8) {
                                Image(systemName: "lightbulb.fill")
                                    .foregroundColor(.orange)
                                Text(tip)
                                    .font(.body)
                            }
                        }
                    }
                    .padding(16)
                    .background(
                        RoundedRectangle(cornerRadius: 12)
                            .fill(Color.orange.opacity(0.1))
                    )
                    
                    // Call to action
                    VStack(spacing: 12) {
                        Text("✨ Practica Hoy")
                            .font(.headline)
                            .fontWeight(.semibold)
                        
                        Text("La neuroplasticidad funciona con la práctica. Úsala una vez hoy y observa qué pasa.")
                            .font(.body)
                            .foregroundColor(.secondary)
                            .multilineTextAlignment(.center)
                    }
                    .padding(20)
                    .frame(maxWidth: .infinity)
                    .background(
                        RoundedRectangle(cornerRadius: 16)
                            .fill(
                                LinearGradient(
                                    colors: [colorFromString(tool.color).opacity(0.1), colorFromString(tool.color).opacity(0.05)],
                                    startPoint: .topLeading,
                                    endPoint: .bottomTrailing
                                )
                            )
                    )
                }
                .padding()
            }
            .background(Color(.systemGroupedBackground))
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
    
    private func colorFromString(_ colorName: String) -> Color {
        switch colorName {
        case "pink": return .pink
        case "blue": return .blue
        case "purple": return .purple
        case "orange": return .orange
        case "green": return .green
        case "indigo": return .indigo
        case "teal": return .teal
        case "cyan": return .cyan
        case "yellow": return .yellow
        default: return .blue
        }
    }
}

// MARK: - Helper Views

struct InfoBadge: View {
    let icon: String
    let text: String
    
    var body: some View {
        Label(text, systemImage: icon)
            .font(.subheadline)
            .padding(.horizontal, 12)
            .padding(.vertical, 6)
            .background(
                Capsule()
                    .fill(Color.blue.opacity(0.1))
            )
            .foregroundColor(.blue)
    }
}

struct SectionCard: View {
    let title: String
    let icon: String
    let content: String
    let color: Color
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Label(title, systemImage: icon)
                .font(.headline)
                .fontWeight(.semibold)
                .foregroundColor(color)
            
            Text(content)
                .font(.body)
                .foregroundColor(.primary)
        }
        .padding(16)
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(color.opacity(0.1))
        )
    }
}

// MARK: - Preview
struct CN3View_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            CN3View()
        }
    }
}

