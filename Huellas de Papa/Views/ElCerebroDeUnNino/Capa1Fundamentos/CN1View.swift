import SwiftUI

/// Vista principal de la Capa 1 (Fundamentos) del módulo El Cerebro del Niño
/// Forma al padre en los fundamentos de integración cerebral de Daniel Siegel
struct CN1View: View {
    @State private var selectedStrategy: CN1Strategy?
    @State private var showingStrategyDetail = false
    @State private var selectedSection: CN1Section?
    @State private var showingSectionDetail = false
    
    var body: some View {
        ScrollView {
            VStack(spacing: 32) {
                // 1. Header animado
                headerSection
                
                // 2. Secciones teóricas clave
                theoreticalSectionsScrollView
                
                // 3. Partes del cerebro
                brainPartsSection
                
                // 4. Las 12 estrategias
                strategiesSection
                
                // 5. Frase motivacional
                motivationalQuoteSection
            }
            .padding()
        }
        .background(Color(.systemGroupedBackground))
        .navigationTitle("Fundamentos")
        .navigationBarTitleDisplayMode(.large)
        .sheet(isPresented: $showingStrategyDetail) {
            if let strategy = selectedStrategy {
                CN1StrategyDetailView(strategy: strategy)
            }
        }
        .sheet(isPresented: $showingSectionDetail) {
            if let section = selectedSection {
                CN1SectionDetailView(section: section)
            }
        }
    }
    
    // MARK: - 1. Header Section
    private var headerSection: some View {
        VStack(spacing: 16) {
            Text("El Cerebro del Niño")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundStyle(
                    LinearGradient(
                        gradient: Gradient(colors: [.blue, .mint]),
                        startPoint: .leading,
                        endPoint: .trailing
                    )
                )
            
            Text("12 Estrategias Revolucionarias para Cultivar la Mente en Desarrollo")
                .font(.title3)
                .fontWeight(.medium)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
            
            Text("Basado en neurociencia para criar niños equilibrados y resilientes")
                .font(.subheadline)
                .foregroundColor(.blue)
                .multilineTextAlignment(.center)
                .italic()
        }
        .padding(.vertical)
    }
    
    // MARK: - 2. Theoretical Sections
    private var theoreticalSectionsScrollView: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Conceptos Clave del Cerebro")
                .font(.title2)
                .fontWeight(.semibold)
                .foregroundColor(.primary)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 16) {
                    ForEach(cn1TheoreticalSections) { section in
                        CN1SectionCard(section: section)
                            .onTapGesture {
                                selectedSection = section
                                showingSectionDetail = true
                                triggerHaptic()
                            }
                    }
                }
                .padding(.horizontal, 4)
            }
        }
    }
    
    // MARK: - 3. Brain Parts Section
    private var brainPartsSection: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Partes del Cerebro")
                .font(.title2)
                .fontWeight(.semibold)
                .foregroundColor(.primary)
            
            Text("Comprende cómo funciona el cerebro de tu hijo")
                .font(.subheadline)
                .foregroundColor(.secondary)
            
            VStack(spacing: 12) {
                ForEach(cn1BrainParts) { part in
                    CN1BrainPartCard(brainPart: part)
                }
            }
        }
    }
    
    // MARK: - 4. Strategies Section
    private var strategiesSection: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Las 12 Estrategias Revolucionarias")
                .font(.title2)
                .fontWeight(.semibold)
                .foregroundColor(.primary)
            
            Text("Herramientas prácticas basadas en neurociencia")
                .font(.subheadline)
                .foregroundColor(.secondary)
            
            VStack(spacing: 12) {
                ForEach(cn1Strategies) { strategy in
                    CN1StrategyCard(strategy: strategy)
                        .onTapGesture {
                            selectedStrategy = strategy
                            showingStrategyDetail = true
                            triggerHaptic()
                        }
                }
            }
        }
    }
    
    // MARK: - 5. Motivational Quote
    private var motivationalQuoteSection: some View {
        VStack(spacing: 20) {
            Text("💡 Reflexión Final")
                .font(.headline)
                .fontWeight(.semibold)
                .foregroundColor(.primary)
            
            if let quote = cn1Quotes.first {
                VStack(spacing: 12) {
                    Text("\"" + quote.text + "\"")
                        .font(.title3)
                        .fontWeight(.medium)
                        .foregroundColor(.primary)
                        .multilineTextAlignment(.center)
                        .italic()
                    
                    Text("— \(quote.author)")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
                .padding(.vertical, 24)
                .padding(.horizontal, 20)
                .background(
                    RoundedRectangle(cornerRadius: 16)
                        .fill(
                            LinearGradient(
                                gradient: Gradient(colors: [
                                    Color.blue.opacity(0.1),
                                    Color.mint.opacity(0.05)
                                ]),
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            )
                        )
                        .overlay(
                            RoundedRectangle(cornerRadius: 16)
                                .stroke(
                                    LinearGradient(
                                        gradient: Gradient(colors: [
                                            Color.blue.opacity(0.3),
                                            Color.mint.opacity(0.2)
                                        ]),
                                        startPoint: .topLeading,
                                        endPoint: .bottomTrailing
                                    ),
                                    lineWidth: 1
                                )
                        )
                )
                .shadow(
                    color: Color.blue.opacity(0.1),
                    radius: 8,
                    x: 0,
                    y: 4
                )
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

/// Tarjeta para mostrar sección teórica
struct CN1SectionCard: View {
    let section: CN1Section
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                Image(systemName: section.icon)
                    .font(.title)
                    .foregroundColor(colorFromString(section.color))
                
                Spacer()
                
                Image(systemName: "chevron.right.circle.fill")
                    .foregroundColor(.blue.opacity(0.3))
                    .font(.title3)
            }
            
            Text(section.title)
                .font(.headline)
                .fontWeight(.bold)
                .foregroundColor(.primary)
            
            Text(section.subtitle)
                .font(.subheadline)
                .foregroundColor(colorFromString(section.color))
                .fontWeight(.medium)
            
            Text(section.description)
                .font(.caption)
                .foregroundColor(.secondary)
                .lineLimit(4)
            
            Divider()
            
            HStack(spacing: 8) {
                Image(systemName: "lightbulb.fill")
                    .foregroundColor(.orange)
                    .font(.caption)
                
                Text(section.keyIdea)
                    .font(.caption)
                    .fontWeight(.semibold)
                    .foregroundColor(.orange)
                    .lineLimit(2)
            }
            
            Text("Toca para ver ejemplos prácticos")
                .font(.caption2)
                .foregroundColor(.secondary)
                .italic()
                .padding(.top, 4)
        }
        .padding(16)
        .frame(width: 300, height: 280)
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(Color(.systemBackground))
                .overlay(
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(colorFromString(section.color).opacity(0.3), lineWidth: 2)
                )
                .shadow(color: Color.black.opacity(0.08), radius: 12, x: 0, y: 4)
        )
    }
    
    private func colorFromString(_ colorName: String) -> Color {
        switch colorName {
        case "blue": return .blue
        case "pink": return .pink
        case "purple": return .purple
        case "orange": return .orange
        case "green": return .green
        default: return .blue
        }
    }
}

/// Tarjeta para mostrar parte del cerebro
struct CN1BrainPartCard: View {
    let brainPart: CN1BrainPart
    @State private var isExpanded = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Button(action: {
                withAnimation(.spring()) {
                    isExpanded.toggle()
                }
            }) {
                HStack {
                    Image(systemName: brainPart.icon)
                        .font(.title2)
                        .foregroundColor(colorFromString(brainPart.color))
                    
                    VStack(alignment: .leading, spacing: 4) {
                        Text(brainPart.name)
                            .font(.headline)
                            .fontWeight(.bold)
                            .foregroundColor(.primary)
                        
                        Text(brainPart.description)
                            .font(.caption)
                            .foregroundColor(.secondary)
                            .lineLimit(isExpanded ? nil : 2)
                    }
                    
                    Spacer()
                    
                    Image(systemName: isExpanded ? "chevron.up" : "chevron.down")
                        .foregroundColor(.secondary)
                }
            }
            
            if isExpanded {
                VStack(alignment: .leading, spacing: 8) {
                    Text("Funciones:")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundColor(.primary)
                    
                    ForEach(brainPart.functions, id: \.self) { function in
                        HStack(alignment: .top, spacing: 8) {
                            Image(systemName: "checkmark.circle.fill")
                                .font(.caption)
                                .foregroundColor(.green)
                            
                            Text(function)
                                .font(.caption)
                                .foregroundColor(.primary)
                        }
                    }
                    
                    Text("Desarrollo:")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundColor(.primary)
                        .padding(.top, 4)
                    
                    Text(brainPart.developmentInfo)
                        .font(.caption)
                        .foregroundColor(.secondary)
                        .italic()
                }
                .padding(.top, 8)
            }
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
        case "blue": return .blue
        case "pink": return .pink
        case "purple": return .purple
        case "orange": return .orange
        default: return .blue
        }
    }
}

/// Tarjeta completa para estrategia (una por línea)
struct CN1StrategyCard: View {
    let strategy: CN1Strategy
    
    var body: some View {
        HStack(spacing: 16) {
            // Número circular
            Text("\(strategy.number)")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.white)
                .frame(width: 50, height: 50)
                .background(
                    Circle()
                        .fill(
                            LinearGradient(
                                colors: [.blue, .mint],
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            )
                        )
                )
            
            // Contenido
            VStack(alignment: .leading, spacing: 6) {
                Text(strategy.title)
                    .font(.headline)
                    .fontWeight(.bold)
                    .foregroundColor(.primary)
                
                Text(strategy.shortDescription)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                    .lineLimit(2)
                
                HStack {
                    Image(systemName: "brain.head.profile")
                        .font(.caption)
                        .foregroundColor(.blue)
                    
                    Text(strategy.brainFocus)
                        .font(.caption)
                        .foregroundColor(.blue)
                        .lineLimit(1)
                }
            }
            
            Spacer()
            
            // Icono e indicador de detalle
            VStack(spacing: 8) {
                Image(systemName: strategy.icon)
                    .font(.title2)
                    .foregroundColor(.blue)
                
                Image(systemName: "chevron.right.circle.fill")
                    .foregroundColor(.blue.opacity(0.3))
                    .font(.title3)
            }
        }
        .padding(16)
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(Color(.systemBackground))
                .shadow(color: Color.black.opacity(0.05), radius: 8, x: 0, y: 2)
        )
    }
}

/// Vista de detalle para estrategia
struct CN1StrategyDetailView: View {
    let strategy: CN1Strategy
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 24) {
                    // Header
                    VStack(spacing: 16) {
                        Image(systemName: strategy.icon)
                            .font(.system(size: 60))
                            .foregroundStyle(
                                LinearGradient(
                                    colors: [.blue, .mint],
                                    startPoint: .topLeading,
                                    endPoint: .bottomTrailing
                                )
                            )
                        
                        Text("Estrategia \(strategy.number)")
                            .font(.headline)
                            .foregroundColor(.secondary)
                        
                        Text(strategy.title)
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(.primary)
                            .multilineTextAlignment(.center)
                    }
                    .frame(maxWidth: .infinity)
                    .padding(.vertical)
                    
                    // Descripción completa
                    VStack(alignment: .leading, spacing: 12) {
                        Text("Descripción")
                            .font(.headline)
                            .fontWeight(.semibold)
                        
                        Text(strategy.fullDescription)
                            .font(.body)
                            .foregroundColor(.primary)
                    }
                    .padding(16)
                    .background(
                        RoundedRectangle(cornerRadius: 12)
                            .fill(Color(.systemBackground))
                    )
                    
                    // Enfoque cerebral
                    VStack(alignment: .leading, spacing: 12) {
                        HStack {
                            Image(systemName: "brain.head.profile")
                                .foregroundColor(.blue)
                            Text("Enfoque Cerebral")
                                .font(.headline)
                                .fontWeight(.semibold)
                        }
                        
                        Text(strategy.brainFocus)
                            .font(.body)
                            .foregroundColor(.primary)
                    }
                    .padding(16)
                    .background(
                        RoundedRectangle(cornerRadius: 12)
                            .fill(Color.blue.opacity(0.1))
                    )
                    
                    // Rango de edad
                    HStack {
                        Image(systemName: "person.2.fill")
                            .foregroundColor(.mint)
                        Text("Edad recomendada:")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                        Text(strategy.ageRange)
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                    }
                    .padding(16)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(
                        RoundedRectangle(cornerRadius: 12)
                            .fill(Color.mint.opacity(0.1))
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
}

/// Vista de detalle para sección teórica con ejemplos
struct CN1SectionDetailView: View {
    let section: CN1Section
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 24) {
                    // Header con icono
                    VStack(spacing: 16) {
                        Image(systemName: section.icon)
                            .font(.system(size: 60))
                            .foregroundColor(colorFromString(section.color))
                        
                        Text(section.title)
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(.primary)
                            .multilineTextAlignment(.center)
                        
                        Text(section.subtitle)
                            .font(.headline)
                            .foregroundColor(colorFromString(section.color))
                            .multilineTextAlignment(.center)
                    }
                    .frame(maxWidth: .infinity)
                    .padding(.vertical)
                    
                    // Descripción
                    VStack(alignment: .leading, spacing: 12) {
                        Label("Concepto", systemImage: "book.fill")
                            .font(.headline)
                            .fontWeight(.semibold)
                            .foregroundColor(.primary)
                        
                        Text(section.description)
                            .font(.body)
                            .foregroundColor(.primary)
                    }
                    .padding(16)
                    .background(
                        RoundedRectangle(cornerRadius: 12)
                            .fill(Color(.systemBackground))
                    )
                    
                    // Idea clave
                    HStack(spacing: 12) {
                        Image(systemName: "lightbulb.fill")
                            .font(.title2)
                            .foregroundColor(.orange)
                        
                        Text(section.keyIdea)
                            .font(.body)
                            .fontWeight(.semibold)
                            .foregroundColor(.primary)
                    }
                    .padding(16)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(
                        RoundedRectangle(cornerRadius: 12)
                            .fill(Color.orange.opacity(0.1))
                    )
                    
                    // Ejemplos prácticos
                    VStack(alignment: .leading, spacing: 16) {
                        Label("Ejemplos Prácticos", systemImage: "sparkles")
                            .font(.headline)
                            .fontWeight(.semibold)
                            .foregroundColor(.primary)
                        
                        ForEach(Array(section.examples.enumerated()), id: \.offset) { index, example in
                            VStack(alignment: .leading, spacing: 8) {
                                HStack(alignment: .top) {
                                    Text("\(index + 1)")
                                        .font(.headline)
                                        .fontWeight(.bold)
                                        .foregroundColor(.white)
                                        .frame(width: 28, height: 28)
                                        .background(
                                            Circle()
                                                .fill(colorFromString(section.color))
                                        )
                                    
                                    Text(example)
                                        .font(.body)
                                        .foregroundColor(.primary)
                                        .fixedSize(horizontal: false, vertical: true)
                                }
                            }
                            .padding(16)
                            .background(
                                RoundedRectangle(cornerRadius: 12)
                                    .fill(colorFromString(section.color).opacity(0.05))
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 12)
                                            .stroke(colorFromString(section.color).opacity(0.2), lineWidth: 1)
                                    )
                            )
                        }
                    }
                    
                    // Tips prácticos
                    VStack(alignment: .leading, spacing: 16) {
                        Label("Tips para Aplicar", systemImage: "star.fill")
                            .font(.headline)
                            .fontWeight(.semibold)
                            .foregroundColor(.primary)
                        
                        ForEach(Array(section.practicalTips.enumerated()), id: \.offset) { _, tip in
                            HStack(alignment: .top, spacing: 12) {
                                Image(systemName: "checkmark.circle.fill")
                                    .font(.title3)
                                    .foregroundColor(.green)
                                
                                Text(tip)
                                    .font(.body)
                                    .foregroundColor(.primary)
                            }
                            .padding(12)
                            .background(
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(Color.green.opacity(0.05))
                            )
                        }
                    }
                    
                    // Llamado a la acción
                    VStack(spacing: 12) {
                        Text("💪 Pon en Práctica")
                            .font(.headline)
                            .fontWeight(.semibold)
                        
                        Text("Elige uno de estos ejemplos y practícalo esta semana con tu hijo. La neuroplasticidad funciona con la repetición.")
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
                                    colors: [colorFromString(section.color).opacity(0.1), colorFromString(section.color).opacity(0.05)],
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
        case "blue": return .blue
        case "pink": return .pink
        case "purple": return .purple
        case "orange": return .orange
        case "green": return .green
        default: return .blue
        }
    }
}

// MARK: - Preview
struct CN1View_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            CN1View()
        }
    }
}

