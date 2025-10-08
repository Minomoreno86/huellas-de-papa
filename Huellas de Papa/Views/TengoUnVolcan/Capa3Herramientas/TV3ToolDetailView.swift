import SwiftUI

/// Vista de detalle completa para una herramienta
struct TV3ToolDetailView: View {
    let tool: TV3Tool
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 32) {
                // 1. Header
                headerSection
                
                // 2. Objetivo
                objectiveSection
                
                // 3. Cuándo usarla
                whenToUseSection
                
                // 4. Cómo funciona
                howItWorksSection
                
                // 5. Pasos
                stepsSection
                
                // 6. Consejo del Hada
                fairyTipSection
                
                // 7. Info adicional
                additionalInfoSection
            }
            .padding()
        }
        .navigationTitle(tool.name)
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
                            gradient: Gradient(colors: [toolColor.opacity(0.6), toolColor.opacity(0.3)]),
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                    )
                    .frame(width: 120, height: 120)
                
                Image(systemName: tool.iconName)
                    .font(.system(size: 50))
                    .foregroundColor(.white)
            }
            
            Text(tool.category.rawValue)
                .font(.caption)
                .fontWeight(.semibold)
                .foregroundColor(toolColor)
                .padding(.horizontal, 16)
                .padding(.vertical, 8)
                .background(
                    Capsule()
                        .fill(toolColor.opacity(0.1))
                )
        }
        .frame(maxWidth: .infinity)
    }
    
    // MARK: - Objective
    private var objectiveSection: some View {
        sectionCard(
            icon: "target",
            title: "Objetivo",
            content: tool.objective,
            color: .blue
        )
    }
    
    // MARK: - When To Use
    private var whenToUseSection: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack {
                Image(systemName: "clock.fill")
                    .foregroundColor(.orange)
                    .font(.title2)
                
                Text("¿Cuándo usarla?")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .foregroundColor(.primary)
            }
            
            Text(tool.whenToUse)
                .font(.body)
                .foregroundColor(.secondary)
                .fixedSize(horizontal: false, vertical: true)
                .lineSpacing(6)
            
            // Fases recomendadas
            HStack(spacing: 12) {
                Text("Recomendada para:")
                    .font(.caption)
                    .fontWeight(.semibold)
                    .foregroundColor(.secondary)
                
                ForEach(tool.recommendedPhase, id: \.self) { phase in
                    phaseChip(phase)
                }
            }
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(Color(.systemBackground))
                .shadow(color: Color.black.opacity(0.1), radius: 8, x: 0, y: 2)
        )
    }
    
    private func phaseChip(_ phase: TV3Tool.VolcanoPhase) -> some View {
        HStack(spacing: 4) {
            phaseIcon(phase)
            Text(phase.rawValue)
                .font(.caption2)
        }
        .foregroundColor(phaseColor(phase))
        .padding(.horizontal, 8)
        .padding(.vertical, 4)
        .background(
            Capsule()
                .fill(phaseColor(phase).opacity(0.1))
        )
    }
    
    private func phaseIcon(_ phase: TV3Tool.VolcanoPhase) -> some View {
        Group {
            switch phase {
            case .chispa:
                Image(systemName: "flame.fill")
            case .burbujeo:
                Image(systemName: "smoke.fill")
            case .erupcion:
                Image(systemName: "tornado")
            case .postErupcion:
                Image(systemName: "cloud.fill")
            }
        }
        .font(.caption2)
    }
    
    private func phaseColor(_ phase: TV3Tool.VolcanoPhase) -> Color {
        switch phase {
        case .chispa: return .orange
        case .burbujeo: return .red
        case .erupcion: return .purple
        case .postErupcion: return .gray
        }
    }
    
    // MARK: - How It Works
    private var howItWorksSection: some View {
        sectionCard(
            icon: "gearshape.2.fill",
            title: "¿Cómo funciona?",
            content: tool.howItWorks,
            color: .mint
        )
    }
    
    // MARK: - Steps
    private var stepsSection: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack {
                Image(systemName: "list.number")
                    .foregroundColor(toolColor)
                    .font(.title2)
                
                Text("Pasos para usar esta herramienta")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .foregroundColor(.primary)
            }
            
            VStack(alignment: .leading, spacing: 16) {
                ForEach(Array(tool.steps.enumerated()), id: \.offset) { index, step in
                    stepRow(number: index + 1, text: step)
                }
            }
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(Color(.systemBackground))
                .shadow(color: Color.black.opacity(0.1), radius: 8, x: 0, y: 2)
        )
    }
    
    private func stepRow(number: Int, text: String) -> some View {
        HStack(alignment: .top, spacing: 12) {
            Text("\(number)")
                .font(.headline)
                .fontWeight(.bold)
                .foregroundColor(.white)
                .frame(width: 32, height: 32)
                .background(
                    Circle()
                        .fill(toolColor)
                )
            
            Text(text)
                .font(.body)
                .foregroundColor(.primary)
                .fixedSize(horizontal: false, vertical: true)
        }
    }
    
    // MARK: - Fairy Tip
    private var fairyTipSection: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack {
                Image(systemName: "sparkles")
                    .foregroundColor(.yellow)
                    .font(.title2)
                
                Text("Consejo del Hada del Volcán")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .foregroundColor(.primary)
            }
            
            VStack(alignment: .leading, spacing: 12) {
                HStack(alignment: .top, spacing: 12) {
                    Image(systemName: "quote.opening")
                        .foregroundColor(.orange)
                        .font(.title3)
                    
                    Text(tool.fairyTip)
                        .font(.callout)
                        .foregroundColor(.primary)
                        .italic()
                        .fontWeight(.medium)
                        .fixedSize(horizontal: false, vertical: true)
                        .lineSpacing(6)
                }
            }
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 12)
                    .fill(
                        LinearGradient(
                            gradient: Gradient(colors: [.orange.opacity(0.2), .yellow.opacity(0.1)]),
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                    )
            )
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(Color(.systemBackground))
                .shadow(color: Color.black.opacity(0.1), radius: 8, x: 0, y: 2)
        )
    }
    
    // MARK: - Additional Info
    private var additionalInfoSection: some View {
        VStack(spacing: 12) {
            infoRow(icon: "clock", label: "Duración", value: tool.durationMinutes)
            infoRow(icon: "person.2", label: "Edad recomendada", value: tool.ageRange)
            
            if !tool.materials.isEmpty {
                materialsRow
            }
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(Color(.systemBackground))
                .shadow(color: Color.black.opacity(0.1), radius: 8, x: 0, y: 2)
        )
    }
    
    private func infoRow(icon: String, label: String, value: String) -> some View {
        HStack {
            Image(systemName: icon)
                .foregroundColor(.secondary)
                .frame(width: 24)
            
            Text(label)
                .font(.subheadline)
                .foregroundColor(.secondary)
            
            Spacer()
            
            Text(value)
                .font(.subheadline)
                .fontWeight(.semibold)
                .foregroundColor(.primary)
        }
    }
    
    private var materialsRow: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                Image(systemName: "bag")
                    .foregroundColor(.secondary)
                    .frame(width: 24)
                
                Text("Materiales necesarios")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
            
            ForEach(tool.materials, id: \.self) { material in
                HStack(alignment: .top, spacing: 8) {
                    Image(systemName: "circle.fill")
                        .font(.system(size: 6))
                        .foregroundColor(toolColor)
                        .padding(.top, 6)
                    
                    Text(material)
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
                .padding(.leading, 32)
            }
        }
    }
    
    // MARK: - Helper
    private func sectionCard(icon: String, title: String, content: String, color: Color) -> some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack {
                Image(systemName: icon)
                    .foregroundColor(color)
                    .font(.title2)
                
                Text(title)
                    .font(.title2)
                    .fontWeight(.semibold)
                    .foregroundColor(.primary)
            }
            
            Text(content)
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
        TV3ToolDetailView(tool: TV3Data.tools[0])
    }
}

