import SwiftUI

struct Capa4SimulacionesAvanzadasView: View {
    @State private var simulaciones: [BrainSim] = []
    @State private var simulacionSeleccionada: BrainSim?
    @State private var mostrarDetalle = false
    @State private var filtroEdad: String = "Todas"
    @State private var filtroDificultad: String = "Todas"
    @State private var isLoading = true
    
    let edades = ["Todas", "2-5 años", "6-8 años", "9-12 años"]
    let dificultades = ["Todas", "Fácil", "Intermedio", "Avanzado"]
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 0) {
                    // Header
                    HeaderSimulacionesView()
                    
                    // Filtros
                    FiltrosSimulacionesView(
                        edadSeleccionada: $filtroEdad,
                        dificultadSeleccionada: $filtroDificultad
                    )
                    
                    // Lista de simulaciones
                    if isLoading {
                        LoadingSimulacionesView()
                    } else {
                        ListaSimulacionesView(
                            simulaciones: simulacionesFiltradas,
                            simulacionSeleccionada: $simulacionSeleccionada,
                            mostrarDetalle: $mostrarDetalle
                        )
                    }
                }
            }
            .navigationTitle("Simulaciones Avanzadas")
            .navigationBarTitleDisplayMode(.large)
            .onAppear {
                cargarSimulaciones()
            }
            .sheet(isPresented: $mostrarDetalle) {
                if let simulacion = simulacionSeleccionada {
                    BrainSimView(simulacion: simulacion)
                }
            }
        }
    }
    
    private var simulacionesFiltradas: [BrainSim] {
        var filtradas = simulaciones
        
        // Filtro por edad
        if filtroEdad != "Todas" {
            switch filtroEdad {
            case "2-5 años":
                filtradas = filtradas.filter { $0.ageRange.lowerBound >= 2 && $0.ageRange.upperBound <= 5 }
            case "6-8 años":
                filtradas = filtradas.filter { $0.ageRange.lowerBound >= 6 && $0.ageRange.upperBound <= 8 }
            case "9-12 años":
                filtradas = filtradas.filter { $0.ageRange.lowerBound >= 9 && $0.ageRange.upperBound <= 12 }
            default:
                break
            }
        }
        
        // Filtro por dificultad
        if filtroDificultad != "Todas" {
            switch filtroDificultad {
            case "Fácil":
                filtradas = filtradas.filter { $0.difficulty <= 2 }
            case "Intermedio":
                filtradas = filtradas.filter { $0.difficulty == 3 }
            case "Avanzado":
                filtradas = filtradas.filter { $0.difficulty >= 4 }
            default:
                break
            }
        }
        
        return filtradas
    }
    
    private func cargarSimulaciones() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            self.simulaciones = Capa4SimulacionesAvanzadas.contenidoCerebroDelNino()
            self.isLoading = false
        }
    }
}

// MARK: - Header de Simulaciones

struct HeaderSimulacionesView: View {
    var body: some View {
        VStack(spacing: 16) {
            HStack {
                Image(systemName: "brain.head.profile")
                    .font(.system(size: 40))
                    .foregroundColor(.blue)
                
                VStack(alignment: .leading, spacing: 4) {
                    Text("Simulaciones Avanzadas")
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(.primary)
                    
                    Text("Entrena tu cerebro parental")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
                
                Spacer()
            }
            
            Text("Practica situaciones reales con feedback neurocientífico basado en el libro de Álvaro Bilbao")
                .font(.body)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.leading)
                .padding(.horizontal)
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(Color.blue.opacity(0.1))
                .overlay(
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(Color.blue.opacity(0.3), lineWidth: 1)
                )
        )
        .padding(.horizontal)
    }
}

// MARK: - Filtros de Simulaciones

struct FiltrosSimulacionesView: View {
    @Binding var edadSeleccionada: String
    @Binding var dificultadSeleccionada: String
    
    var body: some View {
        VStack(spacing: 16) {
            // Filtro por edad
            VStack(alignment: .leading, spacing: 8) {
                Text("Filtrar por Edad")
                    .font(.headline)
                    .fontWeight(.semibold)
                    .foregroundColor(.primary)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 12) {
                        ForEach(["Todas", "2-5 años", "6-8 años", "9-12 años"], id: \.self) { edad in
                            Button(action: {
                                edadSeleccionada = edad
                            }) {
                                Text(edad)
                                    .font(.subheadline)
                                    .padding(.horizontal, 16)
                                    .padding(.vertical, 8)
                                    .background(
                                        RoundedRectangle(cornerRadius: 12)
                                            .fill(edadSeleccionada == edad ? Color.blue : Color(.systemGray6))
                                    )
                                    .foregroundColor(edadSeleccionada == edad ? .white : .primary)
                            }
                        }
                    }
                    .padding(.horizontal)
                }
            }
            
            // Filtro por dificultad
            VStack(alignment: .leading, spacing: 8) {
                Text("Filtrar por Dificultad")
                    .font(.headline)
                    .fontWeight(.semibold)
                    .foregroundColor(.primary)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 12) {
                        ForEach(["Todas", "Fácil", "Intermedio", "Avanzado"], id: \.self) { dificultad in
                            Button(action: {
                                dificultadSeleccionada = dificultad
                            }) {
                                Text(dificultad)
                                    .font(.subheadline)
                                    .padding(.horizontal, 16)
                                    .padding(.vertical, 8)
                                    .background(
                                        RoundedRectangle(cornerRadius: 12)
                                            .fill(dificultadSeleccionada == dificultad ? Color.orange : Color(.systemGray6))
                                    )
                                    .foregroundColor(dificultadSeleccionada == dificultad ? .white : .primary)
                            }
                        }
                    }
                    .padding(.horizontal)
                }
            }
        }
        .padding(.vertical, 16)
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(Color(.systemGray6))
        )
        .padding(.horizontal)
    }
}

// MARK: - Lista de Simulaciones

struct ListaSimulacionesView: View {
    let simulaciones: [BrainSim]
    @Binding var simulacionSeleccionada: BrainSim?
    @Binding var mostrarDetalle: Bool
    
    var body: some View {
        LazyVStack(spacing: 16) {
            ForEach(simulaciones) { simulacion in
                SimulacionCard(simulacion: simulacion) {
                    simulacionSeleccionada = simulacion
                    mostrarDetalle = true
                }
            }
        }
        .padding()
    }
}

// MARK: - Card de Simulación

struct SimulacionCard: View {
    let simulacion: BrainSim
    let onTap: () -> Void
    
    var body: some View {
        Button(action: onTap) {
            VStack(alignment: .leading, spacing: 12) {
                // Header de la card
                HStack {
                    VStack(alignment: .leading, spacing: 4) {
                        Text(simulacion.title)
                            .font(.headline)
                            .fontWeight(.semibold)
                            .foregroundColor(.primary)
                            .multilineTextAlignment(.leading)
                        
                        Text("Edad: \(simulacion.ageRange.lowerBound)-\(simulacion.ageRange.upperBound) años")
                            .font(.caption)
                            .foregroundColor(.secondary)
                    }
                    
                    Spacer()
                    
                    VStack(alignment: .trailing, spacing: 4) {
                        // Dificultad
                        HStack(spacing: 4) {
                            ForEach(0..<5, id: \.self) { index in
                                Circle()
                                    .fill(index < simulacion.difficulty ? Color.orange : Color(.systemGray4))
                                    .frame(width: 6, height: 6)
                            }
                        }
                        
                        Text("\(simulacion.estimatedDuration) min")
                            .font(.caption)
                            .foregroundColor(.secondary)
                    }
                }
                
                // Contexto
                VStack(alignment: .leading, spacing: 8) {
                    HStack {
                        Image(systemName: "location")
                            .foregroundColor(.blue)
                        Text(simulacion.context.place)
                            .font(.caption)
                            .foregroundColor(.secondary)
                        
                        Spacer()
                        
                        Image(systemName: "clock")
                            .foregroundColor(.blue)
                        Text(simulacion.context.timeOfDay)
                            .font(.caption)
                            .foregroundColor(.secondary)
                    }
                    
                    if !simulacion.context.childState.isEmpty {
                        HStack {
                            Image(systemName: "person")
                                .foregroundColor(.blue)
                            Text(simulacion.context.childState.joined(separator: ", "))
                                .font(.caption)
                                .foregroundColor(.secondary)
                        }
                    }
                }
                
                // Descripción
                Text(simulacion.description)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                    .multilineTextAlignment(.leading)
                    .lineLimit(2)
                
                // Base neurocientífica
                HStack {
                    Image(systemName: "brain.head.profile")
                        .foregroundColor(.purple)
                    Text("Feedback neurocientífico")
                        .font(.caption)
                        .foregroundColor(.purple)
                        .fontWeight(.medium)
                }
            }
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 16)
                    .fill(Color(.systemBackground))
                    .shadow(color: .black.opacity(0.1), radius: 8, x: 0, y: 4)
            )
        }
        .buttonStyle(PlainButtonStyle())
    }
}

// MARK: - Vista de Carga

struct LoadingSimulacionesView: View {
    var body: some View {
        VStack(spacing: 20) {
            ProgressView()
                .scaleEffect(1.5)
            
            Text("Cargando simulaciones...")
                .font(.headline)
                .foregroundColor(.secondary)
            
            Text("Preparando experiencias de entrenamiento cerebral")
                .font(.subheadline)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

#Preview {
    Capa4SimulacionesAvanzadasView()
}
