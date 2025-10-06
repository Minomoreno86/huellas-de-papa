import SwiftUI

struct Capa6PlanEntrenamientoView: View {
    @EnvironmentObject private var progresoManager: ProgresoManager
    @State private var capa6: Capa6PlanEntrenamiento?
    @State private var planSeleccionado: PlanEntrenamiento? = nil
    @State private var mostrarDetalle = false
    @State private var filtroCategoria: CategoriaPlan? = nil
    @State private var filtroDificultad: NivelDificultadPlan? = nil
    @State private var filtroEdad: RangoEdadPlan? = nil
    
    var planesFiltrados: [PlanEntrenamiento] {
        guard let capa6 = capa6 else { return [] }
        var filtrados = capa6.planes
        
        if let categoria = filtroCategoria {
            filtrados = filtrados.filter { $0.categoria == categoria }
        }
        
        if let dificultad = filtroDificultad {
            filtrados = filtrados.filter { $0.nivelDificultad == dificultad }
        }
        
        if let edad = filtroEdad {
            filtrados = filtrados.filter { $0.edadRecomendada == edad }
        }
        
        return filtrados
    }
    
    var body: some View {
        NavigationView {
            ScrollView {
                if let capa6 = capa6 {
                    VStack(spacing: 20) {
                        // Header
                        VStack(spacing: 12) {
                            HStack {
                                Image(systemName: "calendar.badge.clock")
                                    .font(.title2)
                                    .foregroundColor(.blue)
                                
                                Text("Planes de Entrenamiento")
                                    .font(.title2)
                                    .fontWeight(.bold)
                                
                                Spacer()
                            }
                            
                            Text("Programas estructurados basados en neurociencia")
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                        }
                        .padding(.horizontal)
                        
                        // Introducción
                        VStack(alignment: .leading, spacing: 12) {
                            Text("Introducción")
                                .font(.headline)
                                .foregroundColor(.primary)
                            
                            Text(capa6.introduccion)
                                .font(.body)
                                .foregroundColor(.secondary)
                                .lineLimit(nil)
                        }
                        .padding()
                        .background(Color(.systemGray6))
                        .cornerRadius(12)
                        .padding(.horizontal)
                        
                        // Filtros
                        VStack(spacing: 16) {
                            // Filtro por categoría
                            VStack(alignment: .leading, spacing: 8) {
                                Text("Por Categoría:")
                                    .font(.headline)
                                    .foregroundColor(.secondary)
                                
                                ScrollView(.horizontal, showsIndicators: false) {
                                    HStack(spacing: 12) {
                                        FilterButton(
                                            titulo: "Todas",
                                            isSelected: filtroCategoria == nil,
                                            action: {
                                                filtroCategoria = nil
                                            }
                                        )
                                        
                                        ForEach(CategoriaPlan.allCases, id: \.self) { categoria in
                                            FilterButton(
                                                titulo: categoria.rawValue,
                                                isSelected: filtroCategoria == categoria,
                                                action: {
                                                    filtroCategoria = categoria
                                                }
                                            )
                                        }
                                    }
                                    .padding(.horizontal)
                                }
                            }
                            
                            // Filtro por dificultad
                            VStack(alignment: .leading, spacing: 8) {
                                Text("Por Dificultad:")
                                    .font(.headline)
                                    .foregroundColor(.secondary)
                                
                                ScrollView(.horizontal, showsIndicators: false) {
                                    HStack(spacing: 12) {
                                        FilterButton(
                                            titulo: "Todas",
                                            isSelected: filtroDificultad == nil,
                                            action: {
                                                filtroDificultad = nil
                                            }
                                        )
                                        
                                        ForEach(NivelDificultadPlan.allCases, id: \.self) { dificultad in
                                            FilterButton(
                                                titulo: dificultad.rawValue,
                                                isSelected: filtroDificultad == dificultad,
                                                action: {
                                                    filtroDificultad = dificultad
                                                }
                                            )
                                        }
                                    }
                                    .padding(.horizontal)
                                }
                            }
                            
                            // Filtro por edad
                            VStack(alignment: .leading, spacing: 8) {
                                Text("Por Edad:")
                                    .font(.headline)
                                    .foregroundColor(.secondary)
                                
                                ScrollView(.horizontal, showsIndicators: false) {
                                    HStack(spacing: 12) {
                                        FilterButton(
                                            titulo: "Todas",
                                            isSelected: filtroEdad == nil,
                                            action: {
                                                filtroEdad = nil
                                            }
                                        )
                                        
                                        ForEach(RangoEdadPlan.allCases, id: \.self) { edad in
                                            FilterButton(
                                                titulo: edad.rawValue,
                                                isSelected: filtroEdad == edad,
                                                action: {
                                                    filtroEdad = edad
                                                }
                                            )
                                        }
                                    }
                                    .padding(.horizontal)
                                }
                            }
                        }
                        
                        // Lista de Planes
                        VStack(alignment: .leading, spacing: 20) {
                            HStack {
                                Text("\(planesFiltrados.count) Planes Disponibles")
                                    .font(.headline)
                                    .foregroundColor(.primary)
                                
                                Spacer()
                            }
                            .padding(.horizontal)
                            
                            LazyVStack(spacing: 16) {
                                ForEach(planesFiltrados) { plan in
                                    PlanEntrenamientoCard(plan: plan) {
                                        planSeleccionado = plan
                                        mostrarDetalle = true
                                    }
                                }
                            }
                            .padding(.horizontal)
                        }
                        
                        // Resumen
                        VStack(alignment: .leading, spacing: 12) {
                            Text("Resumen Integrador")
                                .font(.headline)
                                .foregroundColor(.primary)
                            
                            Text(capa6.resumenIntegrador)
                                .font(.body)
                                .foregroundColor(.secondary)
                                .lineLimit(nil)
                        }
                        .padding()
                        .background(Color(.systemGray6))
                        .cornerRadius(12)
                        .padding(.horizontal)
                    }
                } else {
                    VStack(spacing: 20) {
                        ProgressView()
                            .scaleEffect(1.5)
                        
                        Text("Cargando planes de entrenamiento...")
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                }
            }
            .navigationTitle("Plan de Entrenamiento")
            .navigationBarTitleDisplayMode(.inline)
        }
        .onAppear {
            if capa6 == nil {
                capa6 = Capa6PlanEntrenamiento.contenidoCerebroDelNino()
            }
        }
        .sheet(isPresented: $mostrarDetalle) {
            if let plan = planSeleccionado {
                PlanEntrenamientoDetalleView(plan: plan)
            }
        }
    }
}

// MARK: - Componentes de la Vista

struct PlanEntrenamientoCard: View {
    let plan: PlanEntrenamiento
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            VStack(alignment: .leading, spacing: 12) {
                // Header
                HStack {
                    Image(systemName: plan.icono)
                        .font(.title2)
                        .foregroundColor(Color(plan.color))
                    
                    VStack(alignment: .leading, spacing: 4) {
                        Text(plan.titulo)
                            .font(.headline)
                            .foregroundColor(.primary)
                            .multilineTextAlignment(.leading)
                        
                        Text(plan.categoria.rawValue)
                            .font(.caption)
                            .foregroundColor(.secondary)
                    }
                    
                    Spacer()
                    
                    VStack(alignment: .trailing, spacing: 4) {
                        Text(plan.nivelDificultad.rawValue)
                            .font(.caption)
                            .foregroundColor(Color(plan.nivelDificultad.color))
                            .padding(.horizontal, 8)
                            .padding(.vertical, 4)
                            .background(Color(plan.nivelDificultad.color).opacity(0.1))
                            .cornerRadius(8)
                        
                        Text(plan.edadRecomendada.rawValue)
                            .font(.caption)
                            .foregroundColor(.secondary)
                    }
                }
                
                // Descripción
                Text(plan.descripcion)
                    .font(.body)
                    .foregroundColor(.secondary)
                    .lineLimit(3)
                
                // Información del plan
                HStack(spacing: 16) {
                    HStack(spacing: 4) {
                        Image(systemName: "clock")
                            .font(.caption)
                        Text("\(plan.duracionSemanas) semanas")
                            .font(.caption)
                    }
                    .foregroundColor(.secondary)
                    
                    HStack(spacing: 4) {
                        Image(systemName: "calendar")
                            .font(.caption)
                        Text("\(plan.frecuenciaSemanal)x/semana")
                            .font(.caption)
                    }
                    .foregroundColor(.secondary)
                    
                    HStack(spacing: 4) {
                        Image(systemName: "timer")
                            .font(.caption)
                        Text(plan.duracionSesion)
                            .font(.caption)
                    }
                    .foregroundColor(.secondary)
                    
                    Spacer()
                }
            }
            .padding()
            .background(Color(.systemBackground))
            .cornerRadius(12)
            .shadow(color: .black.opacity(0.1), radius: 4, x: 0, y: 2)
        }
        .buttonStyle(ScaleButtonStyle())
    }
}

struct PlanEntrenamientoDetalleView: View {
    let plan: PlanEntrenamiento
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    // Header
                    VStack(alignment: .leading, spacing: 12) {
                        HStack {
                            Image(systemName: plan.icono)
                                .font(.title)
                                .foregroundColor(Color(plan.color))
                            
                            VStack(alignment: .leading, spacing: 4) {
                                Text(plan.titulo)
                                    .font(.title2)
                                    .fontWeight(.bold)
                                    .foregroundColor(.primary)
                                
                                Text(plan.categoria.rawValue)
                                    .font(.subheadline)
                                    .foregroundColor(.secondary)
                            }
                            
                            Spacer()
                        }
                        
                        Text(plan.descripcion)
                            .font(.body)
                            .foregroundColor(.secondary)
                    }
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(12)
                    
                    // Objetivo Neurocientífico
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Objetivo Neurocientífico")
                            .font(.headline)
                            .foregroundColor(.primary)
                        
                        Text(plan.objetivoNeurocientifico)
                            .font(.body)
                            .foregroundColor(.secondary)
                    }
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(12)
                    
                    // Información del Plan
                    VStack(alignment: .leading, spacing: 12) {
                        Text("Información del Plan")
                            .font(.headline)
                            .foregroundColor(.primary)
                        
                        VStack(spacing: 8) {
                            PlanInfoRow(icono: "clock", titulo: "Duración", valor: "\(plan.duracionSemanas) semanas")
                            PlanInfoRow(icono: "calendar", titulo: "Frecuencia", valor: "\(plan.frecuenciaSemanal) veces por semana")
                            PlanInfoRow(icono: "timer", titulo: "Duración por sesión", valor: plan.duracionSesion)
                            PlanInfoRow(icono: "chart.bar.fill", titulo: "Dificultad", valor: plan.nivelDificultad.rawValue)
                            PlanInfoRow(icono: "person.fill", titulo: "Edad recomendada", valor: plan.edadRecomendada.rawValue)
                        }
                    }
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(12)
                    
                    // Actividades
                    VStack(alignment: .leading, spacing: 12) {
                        Text("Actividades del Plan")
                            .font(.headline)
                            .foregroundColor(.primary)
                        
                        ForEach(Array(plan.actividades.enumerated()), id: \.offset) { index, actividad in
                            HStack(alignment: .top, spacing: 12) {
                                Text("\(index + 1)")
                                    .font(.caption)
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                                    .frame(width: 20, height: 20)
                                    .background(Color.blue)
                                    .cornerRadius(10)
                                
                                Text(actividad)
                                    .font(.body)
                                    .foregroundColor(.secondary)
                                
                                Spacer()
                            }
                        }
                    }
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(12)
                    
                    // Progresión
                    VStack(alignment: .leading, spacing: 12) {
                        Text("Progresión del Plan")
                            .font(.headline)
                            .foregroundColor(.primary)
                        
                        ForEach(Array(plan.progresion.enumerated()), id: \.offset) { index, nivel in
                            HStack(alignment: .top, spacing: 12) {
                                Text("Nivel \(index + 1)")
                                    .font(.caption)
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                                    .frame(width: 40, height: 20)
                                    .background(Color.green)
                                    .cornerRadius(10)
                                
                                Text(nivel)
                                    .font(.body)
                                    .foregroundColor(.secondary)
                                
                                Spacer()
                            }
                        }
                    }
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(12)
                    
                    // Materiales Necesarios
                    VStack(alignment: .leading, spacing: 12) {
                        Text("Materiales Necesarios")
                            .font(.headline)
                            .foregroundColor(.primary)
                        
                        LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 2), spacing: 8) {
                            ForEach(plan.materialesNecesarios, id: \.self) { material in
                                HStack(spacing: 8) {
                                    Image(systemName: "checkmark.circle.fill")
                                        .foregroundColor(.green)
                                        .font(.caption)
                                    
                                    Text(material)
                                        .font(.caption)
                                        .foregroundColor(.secondary)
                                    
                                    Spacer()
                                }
                                .padding(.horizontal, 8)
                                .padding(.vertical, 4)
                                .background(Color(.systemGray5))
                                .cornerRadius(8)
                            }
                        }
                    }
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(12)
                    
                    // Ejemplos Prácticos
                    VStack(alignment: .leading, spacing: 12) {
                        Text("Ejemplos Prácticos")
                            .font(.headline)
                            .foregroundColor(.primary)
                        
                        ForEach(Array(plan.ejemplosPracticos.enumerated()), id: \.offset) { index, ejemplo in
                            VStack(alignment: .leading, spacing: 8) {
                                HStack(alignment: .top, spacing: 12) {
                                    Text("Ejemplo \(index + 1)")
                                        .font(.caption)
                                        .fontWeight(.bold)
                                        .foregroundColor(.white)
                                        .frame(width: 60, height: 20)
                                        .background(Color.orange)
                                        .cornerRadius(10)
                                    
                                    Text(ejemplo)
                                        .font(.body)
                                        .foregroundColor(.secondary)
                                    
                                    Spacer()
                                }
                                
                                Divider()
                                    .padding(.vertical, 4)
                            }
                        }
                    }
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(12)
                    
                    // Resultados Esperados
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Resultados Esperados")
                            .font(.headline)
                            .foregroundColor(.primary)
                        
                        Text(plan.resultadosEsperados)
                            .font(.body)
                            .foregroundColor(.secondary)
                    }
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(12)
                }
                .padding()
            }
            .navigationTitle("Detalle del Plan")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarBackButtonHidden(true)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cerrar") {
                        dismiss()
                    }
                }
            }
        }
    }
}

struct PlanInfoRow: View {
    let icono: String
    let titulo: String
    let valor: String
    
    var body: some View {
        HStack(spacing: 12) {
            Image(systemName: icono)
                .font(.caption)
                .foregroundColor(.blue)
                .frame(width: 16)
            
            Text(titulo)
                .font(.caption)
                .foregroundColor(.secondary)
            
            Spacer()
            
            Text(valor)
                .font(.caption)
                .fontWeight(.medium)
                .foregroundColor(.primary)
        }
    }
}

#Preview {
    Capa6PlanEntrenamientoView()
        .environmentObject(ProgresoManager())
}
