import SwiftUI

/// Vista principal de la Capa 5 - Aplicación en Casa
struct Capa5View: View {
    @State private var selectedContext = "Mañanas"
    
    let contexts = ["Mañanas", "Conflictos", "Desconexión", "Reencuentros", "Noche"]
    
    var filteredRoutines: [YesBrainRoutineCasa] {
        Capa5Data.rutinas.filter { $0.context == selectedContext }
    }
    
    var body: some View {
        ScrollView {
            VStack(spacing: 24) {
                // Header
                headerSection
                
                // Context Selector
                contextSelector
                
                // Rutinas
                rutinasList
                
                // Recordatorios
                recordatoriosSection
                
                // Actividades rápidas
                actividadesSection
            }
            .padding()
        }
        .background(Color(.systemGroupedBackground).ignoresSafeArea())
        #if !os(macOS)
        .navigationBarTitleDisplayMode(.inline)
        #endif
    }
    
    // MARK: - Header
    private var headerSection: some View {
        VStack(spacing: 16) {
            Image(systemName: "house.fill")
                .font(.system(size: 50))
                .foregroundStyle(
                    LinearGradient(
                        colors: [.blue, .mint],
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                )
            
            Text("Aplicación en Casa")
                .font(.largeTitle)
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
                .foregroundStyle(
                    LinearGradient(
                        gradient: Gradient(colors: [.blue, .mint]),
                        startPoint: .leading,
                        endPoint: .trailing
                    )
                )
            
            Text("Transforma tu casa en un gimnasio emocional")
                .font(.title3)
                .fontWeight(.medium)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
            
            Text("Cada día una oportunidad para entrenar el cerebro Sí")
                .font(.subheadline)
                .foregroundColor(.blue)
                .multilineTextAlignment(.center)
                .italic()
        }
        .padding(.vertical)
    }
    
    // MARK: - Context Selector
    private var contextSelector: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 12) {
                ForEach(contexts, id: \.self) { context in
                    contextChip(context)
                }
            }
            .padding(.horizontal)
        }
    }
    
    private func contextChip(_ context: String) -> some View {
        Button(action: {
            withAnimation(.spring(response: 0.3, dampingFraction: 0.7)) {
                selectedContext = context
                #if !os(macOS)
                UIImpactFeedbackGenerator(style: .light).impactOccurred()
                #endif
            }
        }) {
            HStack(spacing: 8) {
                Image(systemName: contextIcon(for: context))
                    .font(.title3)
                
                Text(context)
                    .font(.subheadline)
                    .fontWeight(.semibold)
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 10)
            .background(
                RoundedRectangle(cornerRadius: 20)
                    .fill(selectedContext == context ? contextColor(for: context) : Color(.systemGray6))
            )
            .foregroundColor(selectedContext == context ? .white : .primary)
            .overlay(
                RoundedRectangle(cornerRadius: 20)
                    .stroke(contextColor(for: context).opacity(0.3), lineWidth: selectedContext == context ? 2 : 0)
            )
        }
    }
    
    // MARK: - Rutinas List
    private var rutinasList: some View {
        VStack(spacing: 16) {
            if filteredRoutines.isEmpty {
                Text("No hay rutinas disponibles para este contexto")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                    .padding()
            } else {
                ForEach(filteredRoutines) { rutina in
                    NavigationLink(destination: RoutineDetailView(rutina: rutina)) {
                        RoutineCardView(rutina: rutina)
                    }
                    .buttonStyle(PlainButtonStyle())
                }
            }
        }
    }
    
    // MARK: - Recordatorios Section
    private var recordatoriosSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("💡 Recordatorios")
                .font(.title2)
                .fontWeight(.semibold)
                .foregroundColor(.primary)
                .padding(.horizontal)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 12) {
                    ForEach(Capa5Data.recordatorios.filter { $0.context == selectedContext || $0.context == "General" }) { reminder in
                        ReminderBannerView(reminder: reminder)
                    }
                }
                .padding(.horizontal)
            }
        }
    }
    
    // MARK: - Actividades Section
    private var actividadesSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("🎯 Actividades rápidas")
                .font(.title2)
                .fontWeight(.semibold)
                .foregroundColor(.primary)
                .padding(.horizontal)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 12) {
                    ForEach(Capa5Data.actividades) { actividad in
                        NavigationLink(destination: YesBrainActivityDetailView(activity: actividad)) {
                            YesBrainActivityCard(activity: actividad)
                        }
                        .buttonStyle(PlainButtonStyle())
                    }
                }
                .padding(.horizontal)
            }
        }
    }
    
    // MARK: - Helper Functions
    private func contextIcon(for context: String) -> String {
        switch context {
        case "Mañanas": return "sunrise.fill"
        case "Conflictos": return "exclamationmark.triangle.fill"
        case "Desconexión": return "arrow.uturn.backward.circle.fill"
        case "Reencuentros": return "figure.wave.circle.fill"
        case "Noche": return "moon.stars.fill"
        default: return "house.fill"
        }
    }
    
    private func contextColor(for context: String) -> Color {
        switch context {
        case "Mañanas": return .orange
        case "Conflictos": return .purple
        case "Desconexión": return .teal
        case "Reencuentros": return .yellow
        case "Noche": return .indigo
        default: return .blue
        }
    }
}

// MARK: - Preview
struct Capa5View_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            Capa5View()
        }
    }
}

