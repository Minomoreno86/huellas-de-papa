import SwiftUI

/// Vista de detalle para mostrar un pilar completo del modelo "Tengo un Volcán"
struct TV1PillarDetailView: View {
    let pillar: TV1Pillar
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 32) {
                // Header con ícono grande
                headerSection
                
                // Definición
                definitionSection
                
                // Aplicación Práctica
                practicalApplicationSection
                
                // Ejemplo visual
                visualExampleSection
            }
            .padding()
        }
        .navigationTitle(pillar.name)
        .navigationBarTitleDisplayMode(.large)
        .background(Color(.systemGroupedBackground))
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    dismiss()
                } label: {
                    Image(systemName: "xmark.circle.fill")
                        .foregroundColor(.secondary)
                        .font(.title3)
                }
            }
        }
    }
    
    // MARK: - Header Section
    private var headerSection: some View {
        VStack(spacing: 20) {
            // Ícono grande
            ZStack {
                Circle()
                    .fill(
                        LinearGradient(
                            gradient: Gradient(colors: [.blue.opacity(0.6), .mint.opacity(0.6)]),
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                    )
                    .frame(width: 120, height: 120)
                
                Image(systemName: pillar.iconName)
                    .font(.system(size: 50))
                    .foregroundColor(.white)
            }
            
            // Título
            Text(pillar.name)
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
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical)
    }
    
    // MARK: - Definition Section
    private var definitionSection: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack {
                Image(systemName: "book.fill")
                    .foregroundColor(.blue)
                    .font(.title2)
                
                Text("Definición")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .foregroundColor(.primary)
            }
            
            Text(pillar.definition)
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
    
    // MARK: - Practical Application Section
    private var practicalApplicationSection: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack {
                Image(systemName: "lightbulb.fill")
                    .foregroundColor(.mint)
                    .font(.title2)
                
                Text("Aplicación Práctica")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .foregroundColor(.primary)
            }
            
            VStack(alignment: .leading, spacing: 12) {
                HStack(alignment: .top, spacing: 12) {
                    Image(systemName: "quote.opening")
                        .foregroundColor(.mint)
                        .font(.title3)
                    
                    Text(pillar.practicalApplication)
                        .font(.callout)
                        .foregroundColor(.primary)
                        .italic()
                        .fixedSize(horizontal: false, vertical: true)
                        .lineSpacing(6)
                }
            }
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 12)
                    .fill(Color.mint.opacity(0.1))
            )
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(Color(.systemBackground))
                .shadow(color: Color.black.opacity(0.1), radius: 8, x: 0, y: 2)
        )
    }
    
    // MARK: - Visual Example Section
    private var visualExampleSection: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack {
                Image(systemName: "star.fill")
                    .foregroundColor(.orange)
                    .font(.title2)
                
                Text("Recordatorio Clave")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .foregroundColor(.primary)
            }
            
            VStack(spacing: 16) {
                Image(systemName: pillar.iconName)
                    .font(.system(size: 40))
                    .foregroundColor(.blue)
                
                Text(reminderText)
                    .font(.title3)
                    .fontWeight(.medium)
                    .foregroundColor(.primary)
                    .multilineTextAlignment(.center)
                    .fixedSize(horizontal: false, vertical: true)
            }
            .frame(maxWidth: .infinity)
            .padding(24)
            .background(
                RoundedRectangle(cornerRadius: 12)
                    .fill(
                        LinearGradient(
                            gradient: Gradient(colors: [.blue.opacity(0.1), .mint.opacity(0.1)]),
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
    
    // MARK: - Helper
    private var reminderText: String {
        switch pillar.name {
        case "Alfabetización Emocional":
            return "Ayuda a tu hijo a nombrar lo que siente: 'Esto es rabia, y está bien sentirla'"
        case "Conciencia Corporal":
            return "Enseña a escuchar las señales del cuerpo: 'Tu volcán te avisa antes de explotar'"
        case "Análisis Cognitivo":
            return "Cambia las nubes oscuras por nubes de aire fresco: pensamientos más realistas"
        case "Aceptación Emocional":
            return "El volcán es parte de ti, pero tú no eres el volcán"
        default:
            return "Este pilar es fundamental para gestionar el volcán interior"
        }
    }
}

#Preview {
    NavigationStack {
        TV1PillarDetailView(pillar: TV1Data.pillars[0])
    }
}

