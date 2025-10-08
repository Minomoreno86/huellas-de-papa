import SwiftUI

/// Vista principal de la Capa 3 (Herramientas) del módulo "Tengo un Volcán"
/// La Caja de Herramientas para gestionar el volcán
struct TV3View: View {
    @State private var selectedCategory: TV3Tool.ToolCategory?
    
    var body: some View {
        ScrollView {
            VStack(spacing: 32) {
                // 1. Header
                headerSection
                
                // 2. La Caja de Herramientas (9 herramientas)
                toolsSection
                
                // 3. Frases Calmantes del Hada
                phrasesSection
                
                // 4. Actividades de Práctica
                activitiesSection
                
                // 5. Mensaje final
                finalMessageSection
            }
            .padding()
        }
        .navigationTitle("La Caja de Herramientas")
        .navigationBarTitleDisplayMode(.large)
        .background(Color(.systemGroupedBackground))
    }
    
    // MARK: - 1. Header
    private var headerSection: some View {
        VStack(spacing: 16) {
            // Ícono de la caja
            ZStack {
                Circle()
                    .fill(
                        LinearGradient(
                            gradient: Gradient(colors: [.orange.opacity(0.6), .yellow.opacity(0.3)]),
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                    )
                    .frame(width: 100, height: 100)
                
                Image(systemName: "toolbox.fill")
                    .font(.system(size: 40))
                    .foregroundColor(.white)
            }
            
            Text("La Caja de Herramientas del Volcán")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundStyle(
                    LinearGradient(
                        gradient: Gradient(colors: [.blue, .mint]),
                        startPoint: .leading,
                        endPoint: .trailing
                    )
                )
                .multilineTextAlignment(.center)
            
            Text("9 herramientas prácticas que el Hada del Volcán enseñó a Alba")
                .font(.title3)
                .fontWeight(.medium)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
        }
        .padding(.vertical)
    }
    
    // MARK: - 2. Tools Section
    private var toolsSection: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack {
                Image(systemName: "toolbox.fill")
                    .foregroundColor(.orange)
                    .font(.title2)
                
                Text("Las 9 Herramientas")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .foregroundColor(.primary)
            }
            
            Text("Toca cada herramienta para ver cómo usarla")
                .font(.subheadline)
                .foregroundColor(.secondary)
            
            // Filtro por categoría (opcional)
            categoryFilter
            
            // Lista de herramientas (una debajo de otra)
            VStack(spacing: 16) {
                ForEach(filteredTools) { tool in
                    TV3ToolCard(tool: tool)
                }
            }
        }
    }
    
    private var categoryFilter: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 12) {
                categoryButton(nil, "Todas")
                categoryButton(.breathing, "Respiración")
                categoryButton(.distance, "Distancia")
                categoryButton(.calm, "Calma")
                categoryButton(.communication, "Comunicación")
                categoryButton(.repair, "Reparación")
            }
            .padding(.horizontal, 4)
        }
    }
    
    private func categoryButton(_ category: TV3Tool.ToolCategory?, _ label: String) -> some View {
        Button {
            withAnimation(.spring()) {
                selectedCategory = category
            }
        } label: {
            Text(label)
                .font(.caption)
                .fontWeight(.medium)
                .foregroundColor(selectedCategory == category ? .white : .blue)
                .padding(.horizontal, 16)
                .padding(.vertical, 8)
                .background(
                    Capsule()
                        .fill(selectedCategory == category ? Color.blue : Color.blue.opacity(0.1))
                )
        }
    }
    
    private var filteredTools: [TV3Tool] {
        if let category = selectedCategory {
            return TV3Data.tools.filter { $0.category == category }
        }
        return TV3Data.tools
    }
    
    // MARK: - 3. Phrases Section
    private var phrasesSection: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack {
                Image(systemName: "sparkles")
                    .foregroundColor(.mint)
                    .font(.title2)
                
                Text("Frases del Hada del Volcán")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .foregroundColor(.primary)
            }
            
            Text("Mantras calmantes para recordar")
                .font(.subheadline)
                .foregroundColor(.secondary)
            
            TV3PhraseView()
        }
    }
    
    // MARK: - 4. Activities Section
    private var activitiesSection: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack {
                Image(systemName: "figure.play")
                    .foregroundColor(.purple)
                    .font(.title2)
                
                Text("Actividades para Practicar")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .foregroundColor(.primary)
            }
            
            Text("Juegos y ejercicios para entrenar tus herramientas")
                .font(.subheadline)
                .foregroundColor(.secondary)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 16) {
                    ForEach(TV3Data.activities) { activity in
                        TV3ActivityCard(activity: activity)
                    }
                }
                .padding(.horizontal, 4)
            }
        }
    }
    
    // MARK: - 5. Final Message
    private var finalMessageSection: some View {
        VStack(spacing: 16) {
            Image(systemName: "hands.sparkles.fill")
                .font(.system(size: 50))
                .foregroundColor(.orange)
            
            Text("Recuerda")
                .font(.title2)
                .fontWeight(.bold)
                .foregroundColor(.primary)
            
            Text("Estas herramientas son como músculos: mientras más las practiques, más fuertes se vuelven. No esperes a que tu volcán explote para usarlas. Practica cuando estés tranquilo/a para que estén listas cuando las necesites.")
                .font(.body)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
                .lineSpacing(6)
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 16)
                        .fill(Color.orange.opacity(0.1))
                )
        }
        .padding(.vertical)
    }
}

#Preview {
    NavigationStack {
        TV3View()
    }
}

