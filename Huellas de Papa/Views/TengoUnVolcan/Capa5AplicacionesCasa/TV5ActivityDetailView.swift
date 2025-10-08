import SwiftUI

/// Vista de detalle completa para una actividad en casa
struct TV5ActivityDetailView: View {
    let activity: TV5Activity
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 32) {
                // Header
                headerSection
                
                // Si es del libro
                if activity.fromBook {
                    bookBadge
                }
                
                // Objetivo
                objectiveSection
                
                // Materiales
                materialsSection
                
                // Instrucciones
                instructionsSection
                
                // Tips
                tipsSection
            }
            .padding()
        }
        .navigationTitle(activity.title)
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
                            gradient: Gradient(colors: [.purple.opacity(0.6), .purple.opacity(0.3)]),
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                    )
                    .frame(width: 100, height: 100)
                
                Image(systemName: activity.iconName)
                    .font(.system(size: 40))
                    .foregroundColor(.white)
            }
            
            HStack(spacing: 16) {
                Label(activity.durationMinutes, systemImage: "clock")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                
                Label(activity.ageRange, systemImage: "person.2")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                
                Label(activity.frequency.rawValue, systemImage: "calendar")
                    .font(.subheadline)
                    .foregroundColor(.purple)
            }
            
            HStack(spacing: 8) {
                Image(systemName: "link")
                    .foregroundColor(.mint)
                Text("Herramienta: \(activity.relatedTool)")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundColor(.mint)
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 8)
            .background(
                Capsule()
                    .fill(Color.mint.opacity(0.1))
            )
        }
        .frame(maxWidth: .infinity)
    }
    
    private var bookBadge: some View {
        HStack {
            Image(systemName: "book.closed.fill")
                .foregroundColor(.orange)
            Text("Actividad original de la Guía Pedagógica del libro")
                .font(.subheadline)
                .fontWeight(.semibold)
                .foregroundColor(.orange)
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(Color.orange.opacity(0.1))
        )
    }
    
    private var objectiveSection: some View {
        sectionCard(
            icon: "target",
            title: "Objetivo",
            content: activity.objective,
            color: .blue
        )
    }
    
    private var materialsSection: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack {
                Image(systemName: "bag.fill")
                    .foregroundColor(.mint)
                    .font(.title2)
                
                Text("Materiales")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .foregroundColor(.primary)
            }
            
            VStack(alignment: .leading, spacing: 8) {
                ForEach(activity.materials, id: \.self) { material in
                    HStack(alignment: .top, spacing: 12) {
                        Image(systemName: "checkmark.circle.fill")
                            .foregroundColor(.mint)
                        
                        Text(material)
                            .font(.body)
                            .foregroundColor(.primary)
                            .fixedSize(horizontal: false, vertical: true)
                    }
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
    
    private var instructionsSection: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack {
                Image(systemName: "list.number")
                    .foregroundColor(.purple)
                    .font(.title2)
                
                Text("Instrucciones")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .foregroundColor(.primary)
            }
            
            VStack(alignment: .leading, spacing: 16) {
                ForEach(Array(activity.instructions.enumerated()), id: \.offset) { index, instruction in
                    stepRow(number: index + 1, text: instruction)
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
                        .fill(Color.purple)
                )
            
            Text(text)
                .font(.body)
                .foregroundColor(.primary)
                .fixedSize(horizontal: false, vertical: true)
        }
    }
    
    private var tipsSection: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack {
                Image(systemName: "lightbulb.fill")
                    .foregroundColor(.yellow)
                    .font(.title2)
                
                Text("Consejos del Libro")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .foregroundColor(.primary)
            }
            
            VStack(alignment: .leading, spacing: 12) {
                ForEach(activity.tips, id: \.self) { tip in
                    HStack(alignment: .top, spacing: 12) {
                        Image(systemName: "star.fill")
                            .foregroundColor(.yellow)
                            .font(.caption)
                            .padding(.top, 4)
                        
                        Text(tip)
                            .font(.callout)
                            .foregroundColor(.primary)
                            .italic()
                            .fixedSize(horizontal: false, vertical: true)
                    }
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 8)
                            .fill(Color.yellow.opacity(0.1))
                    )
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
}

#Preview {
    NavigationStack {
        TV5ActivityDetailView(activity: TV5Data.activities[0])
    }
}

