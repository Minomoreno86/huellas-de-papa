import SwiftUI

struct Capa7EvaluacionView: View {
    @StateObject private var adaptiveSystem = EvaluationAdaptiveSystem()
    @State private var capa7: Capa7Evaluacion?
    @State private var mostrarEvaluacion = false
    @State private var evaluacionSeleccionada: TipoEvaluacion?
    
    enum TipoEvaluacion: String, CaseIterable {
        case conocimiento = "Conocimiento"
        case habilidad = "Habilidad"
        case consistencia = "Consistencia"
        case transferencia = "Transferencia"
        case completa = "Evaluación Completa"
        
        var icono: String {
            switch self {
            case .conocimiento: return "brain.head.profile"
            case .habilidad: return "hand.raised.fill"
            case .consistencia: return "calendar.badge.clock"
            case .transferencia: return "house.fill"
            case .completa: return "star.fill"
            }
        }
        
        var color: Color {
            switch self {
            case .conocimiento: return .blue
            case .habilidad: return .green
            case .consistencia: return .orange
            case .transferencia: return .purple
            case .completa: return .indigo
            }
        }
    }
    
    var body: some View {
        if let capa7 = capa7 {
            ScrollView {
                VStack(spacing: 24) {
                    // Header
                    EvaluacionHeaderView(capa7: capa7)
                    
                    // Progreso General
                    ProgresoGeneralView(moduleScore: adaptiveSystem.moduleScore)
                    
                    // Dimensiones
                    DimensionesView(dimensiones: capa7.dimensiones)
                    
                    // Tipos de Evaluación
                    TiposEvaluacionView(
                        tipos: TipoEvaluacion.allCases,
                        evaluacionSeleccionada: $evaluacionSeleccionada,
                        mostrarEvaluacion: $mostrarEvaluacion
                    )
                    
                    // Objetivos
                    ObjetivosView(objetivos: capa7.objetivos)
                    
                    // Introducción
                    IntroduccionView(introduccion: capa7.introduccion)
                }
                .padding()
            }
            .navigationTitle("Evaluación")
            .navigationBarTitleDisplayMode(.large)
            .sheet(isPresented: $mostrarEvaluacion) {
                if let tipo = evaluacionSeleccionada {
                    EvaluacionDetalleView(
                        tipo: tipo,
                        items: capa7.items,
                        adaptiveSystem: adaptiveSystem
                    )
                }
            }
        } else {
            ProgressView("Cargando evaluación...")
                .onAppear {
                    capa7 = Capa7Evaluacion.contenidoCerebroDelNino()
                }
        }
    }
}

// MARK: - Componentes de la Vista

struct EvaluacionHeaderView: View {
    let capa7: Capa7Evaluacion
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack {
                Image(systemName: "brain.head.profile")
                    .font(.largeTitle)
                    .foregroundColor(.blue)
                
                VStack(alignment: .leading) {
                    Text(capa7.titulo)
                        .font(.title2)
                        .fontWeight(.bold)
                    
                    Text(capa7.descripcion)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
            }
            
            Text("Sistema adaptativo de evaluación en 4 dimensiones")
                .font(.caption)
                .foregroundColor(.blue)
                .padding(.horizontal, 12)
                .padding(.vertical, 6)
                .background(Color.blue.opacity(0.1))
                .cornerRadius(8)
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(Color(.systemBackground))
                .shadow(color: .black.opacity(0.1), radius: 8, x: 0, y: 4)
        )
    }
}

struct ProgresoGeneralView: View {
    let moduleScore: ModuleScore
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack {
                Text("Tu Progreso")
                    .font(.headline)
                    .fontWeight(.semibold)
                
                Spacer()
                
                Text("\(Int(moduleScore.totalScore))/100")
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(moduleScore.level.color)
            }
            
            // Barra de progreso
            ProgressView(value: moduleScore.totalScore, total: 100)
                .progressViewStyle(LinearProgressViewStyle(tint: moduleScore.level.color))
                .scaleEffect(x: 1, y: 2, anchor: .center)
            
            // Nivel actual
            HStack {
                Image(systemName: "star.fill")
                    .foregroundColor(moduleScore.level.color)
                
                Text("Nivel \(moduleScore.level.rawValue)")
                    .fontWeight(.medium)
                
                Spacer()
                
                Text(moduleScore.level.description)
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(Color(.systemBackground))
                .shadow(color: .black.opacity(0.05), radius: 4, x: 0, y: 2)
        )
    }
}

struct DimensionesView: View {
    let dimensiones: [DimensionEvaluacion]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Dimensiones de Evaluación")
                .font(.headline)
                .fontWeight(.semibold)
            
            LazyVGrid(columns: [
                GridItem(.flexible()),
                GridItem(.flexible())
            ], spacing: 12) {
                ForEach(dimensiones) { dimension in
                    DimensionCardView(dimension: dimension)
                }
            }
        }
    }
}

struct DimensionCardView: View {
    let dimension: DimensionEvaluacion
    
    var body: some View {
        VStack(spacing: 8) {
            Image(systemName: dimension.icono)
                .font(.title2)
                .foregroundColor(Color(dimension.color))
            
            Text(dimension.nombre)
                .font(.caption)
                .fontWeight(.medium)
            
            Text(dimension.descripcion)
                .font(.caption2)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(Color(dimension.color).opacity(0.1))
        )
    }
}

struct TiposEvaluacionView: View {
    let tipos: [Capa7EvaluacionView.TipoEvaluacion]
    @Binding var evaluacionSeleccionada: Capa7EvaluacionView.TipoEvaluacion?
    @Binding var mostrarEvaluacion: Bool
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Tipos de Evaluación")
                .font(.headline)
                .fontWeight(.semibold)
            
            LazyVGrid(columns: [
                GridItem(.flexible()),
                GridItem(.flexible())
            ], spacing: 12) {
                ForEach(tipos, id: \.self) { tipo in
                    TipoEvaluacionCardView(
                        tipo: tipo,
                        action: {
                            evaluacionSeleccionada = tipo
                            mostrarEvaluacion = true
                        }
                    )
                }
            }
        }
    }
}

struct TipoEvaluacionCardView: View {
    let tipo: Capa7EvaluacionView.TipoEvaluacion
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            VStack(spacing: 12) {
                Image(systemName: tipo.icono)
                    .font(.title)
                    .foregroundColor(tipo.color)
                
                Text(tipo.rawValue)
                    .font(.subheadline)
                    .fontWeight(.medium)
                    .foregroundColor(.primary)
                
                Text("Comenzar")
                    .font(.caption)
                    .foregroundColor(tipo.color)
            }
            .padding()
            .frame(maxWidth: .infinity)
            .background(
                RoundedRectangle(cornerRadius: 16)
                    .fill(tipo.color.opacity(0.1))
                    .overlay(
                        RoundedRectangle(cornerRadius: 16)
                            .stroke(tipo.color.opacity(0.3), lineWidth: 1)
                    )
            )
        }
        .buttonStyle(PlainButtonStyle())
    }
}

struct ObjetivosView: View {
    let objetivos: [String]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Objetivos de la Evaluación")
                .font(.headline)
                .fontWeight(.semibold)
            
            ForEach(objetivos, id: \.self) { objetivo in
                HStack(alignment: .top, spacing: 8) {
                    Image(systemName: "checkmark.circle.fill")
                        .foregroundColor(.green)
                        .font(.caption)
                    
                    Text(objetivo)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
            }
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(Color(.systemBackground))
                .shadow(color: .black.opacity(0.05), radius: 4, x: 0, y: 2)
        )
    }
}

struct IntroduccionView: View {
    let introduccion: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Introducción")
                .font(.headline)
                .fontWeight(.semibold)
            
            Text(introduccion)
                .font(.subheadline)
                .foregroundColor(.secondary)
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(Color(.systemBackground))
                .shadow(color: .black.opacity(0.05), radius: 4, x: 0, y: 2)
        )
    }
}

// MARK: - Preview

#Preview {
    NavigationView {
        Capa7EvaluacionView()
    }
}
