import SwiftUI

struct Capa5AplicacionCasaView: View {
    @EnvironmentObject private var progresoManager: ProgresoManager
    @State private var capa5: Capa5AplicacionCasa?
    @State private var actividadSeleccionada: ActividadCasa? = nil
    @State private var mostrarDetalle = false
    @State private var filtroCategoria: CategoriaActividadCasa? = nil
    @State private var filtroEdad: RangoEdad? = nil
    
    var actividadesFiltradas: [ActividadCasa] {
        guard let capa5 = capa5 else { return [] }
        var filtradas = capa5.actividades
        
        if let categoria = filtroCategoria {
            filtradas = filtradas.filter { $0.categoria == categoria }
        }
        
        if let edad = filtroEdad {
            filtradas = filtradas.filter { $0.rangoEdad == edad }
        }
        
        return filtradas
    }
    
    var body: some View {
        NavigationView {
            ScrollView {
                if let capa5 = capa5 {
                    VStack(alignment: .leading, spacing: 25) {
                        // Header con gradiente
                        VStack(alignment: .leading, spacing: 12) {
                            HStack {
                                Image(systemName: "house.fill")
                                    .font(.title2)
                                    .foregroundColor(.green)
                                Text("Aplicación en Casa")
                                    .font(.title2)
                                    .fontWeight(.bold)
                                    .foregroundColor(.green)
                            }
                            
                            Text("Transforma tu hogar en un laboratorio de desarrollo cerebral")
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                        }
                        .padding()
                        .background(
                            LinearGradient(
                                gradient: Gradient(colors: [Color.green.opacity(0.1), Color.mint.opacity(0.1)]),
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            )
                        )
                        .cornerRadius(12)
                        
                        // Introducción
                        VStack(alignment: .leading, spacing: 15) {
                            HStack {
                                Image(systemName: "book.closed.fill")
                                    .foregroundColor(.blue)
                                Text("Introducción")
                                    .font(.title2)
                                    .fontWeight(.semibold)
                            }
                            
                            Text(capa5.introduccion)
                                .font(.body)
                                .lineSpacing(6)
                                .padding()
                                .background(Color(.systemGray6))
                                .cornerRadius(12)
                        }
                        
                        // Filtros
                        VStack(alignment: .leading, spacing: 15) {
                            HStack {
                                Image(systemName: "slider.horizontal.3")
                                    .foregroundColor(.orange)
                                Text("Filtrar Actividades")
                                    .font(.title2)
                                    .fontWeight(.semibold)
                            }
                            
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
                                        
                                        ForEach(CategoriaActividadCasa.allCases, id: \.self) { categoria in
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
                                        
                                        ForEach(RangoEdad.allCases, id: \.self) { edad in
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
                        
                        // Lista de Actividades
                        VStack(alignment: .leading, spacing: 20) {
                            HStack {
                                Image(systemName: "house.fill")
                                    .foregroundColor(.green)
                                Text("\(actividadesFiltradas.count) Actividades Disponibles")
                                    .font(.title2)
                                    .fontWeight(.semibold)
                                Spacer()
                                Text("Toca para explorar")
                                    .font(.caption)
                                    .foregroundColor(.secondary)
                            }
                            
                            LazyVStack(spacing: 16) {
                                ForEach(Array(actividadesFiltradas.enumerated()), id: \.offset) { index, actividad in
                                    ActividadCasaCard(
                                        actividad: actividad,
                                        index: index + 1
                                    ) {
                                        withAnimation(.spring(response: 0.6, dampingFraction: 0.8)) {
                                            actividadSeleccionada = actividad
                                            mostrarDetalle = true
                                        }
                                    }
                                }
                            }
                        }
                        
                        // Resumen Integrador
                        VStack(alignment: .leading, spacing: 15) {
                            HStack {
                                Image(systemName: "brain.head.profile")
                                    .foregroundColor(.green)
                                Text("Resumen Integrador")
                                    .font(.title2)
                                    .fontWeight(.semibold)
                            }
                            
                            Text(capa5.resumenIntegrador)
                                .font(.body)
                                .lineSpacing(6)
                                .padding()
                                .background(Color(.systemGray6))
                                .cornerRadius(12)
                        }
                    }
                    .padding()
                } else {
                    VStack(spacing: 20) {
                        ProgressView()
                            .scaleEffect(1.5)
                        Text("Cargando actividades en casa...")
                            .font(.headline)
                            .foregroundColor(.secondary)
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                }
            }
            .navigationTitle("Aplicación en Casa")
            .navigationBarTitleDisplayMode(.inline)
            .onAppear {
                if capa5 == nil {
                    capa5 = Capa5AplicacionCasa.contenidoCerebroDelNino()
                }
            }
            .sheet(isPresented: $mostrarDetalle) {
                if let actividad = actividadSeleccionada {
                    ActividadCasaDetalleView(actividad: actividad)
                }
            }
        }
    }
}

// MARK: - Tarjeta de Actividad en Casa
struct ActividadCasaCard: View {
    let actividad: ActividadCasa
    let index: Int
    let onTap: () -> Void
    
    var body: some View {
        Button(action: onTap) {
            VStack(alignment: .leading, spacing: 12) {
                // Header con gradiente
                HStack {
                    ZStack {
                        Circle()
                            .fill(
                                LinearGradient(
                                    gradient: Gradient(colors: [Color(actividad.color), Color(actividad.color).opacity(0.7)]),
                                    startPoint: .topLeading,
                                    endPoint: .bottomTrailing
                                )
                            )
                            .frame(width: 32, height: 32)
                        
                        Text("\(index)")
                            .font(.caption)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                    }
                    
                    VStack(alignment: .leading, spacing: 4) {
                        Text(actividad.titulo)
                            .font(.headline)
                            .fontWeight(.semibold)
                            .foregroundColor(.primary)
                            .multilineTextAlignment(.leading)
                            .lineLimit(2)
                        
                        HStack {
                            Image(systemName: actividad.categoria.icono)
                                .font(.caption)
                                .foregroundColor(Color(actividad.categoria.color))
                            
                            Text(actividad.categoria.rawValue)
                                .font(.caption)
                                .foregroundColor(Color(actividad.categoria.color))
                            
                            Spacer()
                            
                            HStack {
                                Image(systemName: actividad.rangoEdad.icono)
                                    .font(.caption)
                                    .foregroundColor(Color(actividad.rangoEdad.color))
                                
                                Text(actividad.rangoEdad.rawValue)
                                    .font(.caption)
                                    .foregroundColor(Color(actividad.rangoEdad.color))
                            }
                        }
                    }
                    
                    Spacer()
                    
                    VStack {
                        Image(systemName: "house.circle.fill")
                            .font(.title2)
                            .foregroundColor(Color(actividad.color))
                        
                        Text("Iniciar")
                            .font(.caption2)
                            .foregroundColor(Color(actividad.color))
                    }
                }
                
                // Contenido con diseño mejorado
                VStack(alignment: .leading, spacing: 8) {
                    Text(actividad.descripcion)
                        .font(.body)
                        .foregroundColor(.secondary)
                        .lineLimit(3)
                        .multilineTextAlignment(.leading)
                        .lineSpacing(2)
                    
                    // Información adicional
                    HStack {
                        HStack {
                            Image(systemName: "clock.fill")
                                .font(.caption)
                                .foregroundColor(.orange)
                            
                            Text(actividad.duracionEstimada)
                                .font(.caption)
                                .foregroundColor(.orange)
                        }
                        
                        Spacer()
                        
                        HStack {
                            Image(systemName: "person.fill")
                                .font(.caption)
                                .foregroundColor(.blue)
                            
                            Text(actividad.edadRecomendada)
                                .font(.caption)
                                .foregroundColor(.blue)
                        }
                        
                        Spacer()
                        
                        HStack {
                            Image(systemName: "star.fill")
                                .font(.caption)
                                .foregroundColor(Color(actividad.nivelDificultad.color))
                            
                            Text(actividad.nivelDificultad.rawValue)
                                .font(.caption)
                                .foregroundColor(Color(actividad.nivelDificultad.color))
                        }
                    }
                    .padding(.top, 4)
                }
                
                // Barra de progreso visual
                HStack {
                    ForEach(0..<5) { _ in
                        Circle()
                            .fill(Color(actividad.color).opacity(0.3))
                            .frame(width: 6, height: 6)
                    }
                    
                    Spacer()
                    
                    Text("Toca para iniciar")
                        .font(.caption2)
                        .foregroundColor(.secondary)
                }
            }
            .padding(16)
            .background(
                RoundedRectangle(cornerRadius: 16)
                    .fill(Color(.systemBackground))
                    .shadow(color: .black.opacity(0.08), radius: 8, x: 0, y: 4)
            )
            .overlay(
                RoundedRectangle(cornerRadius: 16)
                    .stroke(
                        LinearGradient(
                            gradient: Gradient(colors: [Color(actividad.color).opacity(0.3), Color(actividad.color).opacity(0.1)]),
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        ),
                        lineWidth: 1
                    )
            )
        }
        .buttonStyle(ScaleButtonStyle())
    }
}

// MARK: - Vista de Detalle de Actividad en Casa
struct ActividadCasaDetalleView: View {
    let actividad: ActividadCasa
    @Environment(\.dismiss) private var dismiss
    @State private var mostrarPasos = false
    @State private var mostrarVariaciones = false
    @State private var mostrarMateriales = false
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 24) {
                    // Header con gradiente
                    VStack(alignment: .leading, spacing: 16) {
                        HStack {
                            Image(systemName: actividad.icono)
                                .font(.largeTitle)
                                .foregroundColor(Color(actividad.color))
                            
                            VStack(alignment: .leading, spacing: 4) {
                                Text("Actividad en Casa")
                                    .font(.title2)
                                    .fontWeight(.bold)
                                    .foregroundColor(Color(actividad.color))
                                
                                Text("Experiencia Familiar")
                                    .font(.subheadline)
                                    .foregroundColor(.secondary)
                            }
                            
                            Spacer()
                        }
                        
                        Text(actividad.titulo)
                            .font(.title)
                            .fontWeight(.bold)
                            .multilineTextAlignment(.leading)
                            .lineSpacing(4)
                    }
                    .padding(20)
                    .background(
                        LinearGradient(
                            gradient: Gradient(colors: [Color(actividad.color).opacity(0.1), Color(actividad.color).opacity(0.05)]),
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                    )
                    .cornerRadius(16)
                    
                    // Información básica
                    VStack(alignment: .leading, spacing: 12) {
                        HStack {
                            Image(systemName: "info.circle.fill")
                                .foregroundColor(.blue)
                            Text("Información de la Actividad")
                                .font(.headline)
                                .fontWeight(.semibold)
                        }
                        
                        VStack(alignment: .leading, spacing: 8) {
                            ActividadInfoRow(icon: "clock.fill", title: "Duración", value: actividad.duracionEstimada, color: .orange)
                            ActividadInfoRow(icon: "person.fill", title: "Edad Recomendada", value: actividad.edadRecomendada, color: .blue)
                            ActividadInfoRow(icon: "star.fill", title: "Dificultad", value: actividad.nivelDificultad.rawValue, color: Color(actividad.nivelDificultad.color))
                            ActividadInfoRow(icon: actividad.categoria.icono, title: "Categoría", value: actividad.categoria.rawValue, color: Color(actividad.categoria.color))
                            ActividadInfoRow(icon: actividad.rangoEdad.icono, title: "Rango de Edad", value: actividad.rangoEdad.rawValue, color: Color(actividad.rangoEdad.color))
                        }
                    }
                    .padding(16)
                    .background(Color(.systemGray6))
                    .cornerRadius(12)
                    
                    // Descripción
                    VStack(alignment: .leading, spacing: 12) {
                        HStack {
                            Image(systemName: "text.alignleft")
                                .foregroundColor(.green)
                            Text("Descripción")
                                .font(.headline)
                                .fontWeight(.semibold)
                        }
                        
                        Text(actividad.descripcion)
                            .font(.body)
                            .lineSpacing(6)
                            .foregroundColor(.primary)
                    }
                    .padding(16)
                    .background(Color(.systemBackground))
                    .cornerRadius(12)
                    .shadow(color: .black.opacity(0.05), radius: 4, x: 0, y: 2)
                    
                    // Objetivo neurocientífico
                    VStack(alignment: .leading, spacing: 12) {
                        HStack {
                            Image(systemName: "target")
                                .foregroundColor(.purple)
                            Text("Objetivo Neurocientífico")
                                .font(.headline)
                                .fontWeight(.semibold)
                        }
                        
                        Text(actividad.objetivoNeurocientifico)
                            .font(.body)
                            .foregroundColor(.secondary)
                            .padding(.horizontal, 12)
                            .padding(.vertical, 8)
                            .background(Color.purple.opacity(0.1))
                            .cornerRadius(8)
                    }
                    .padding(16)
                    .background(Color(.systemBackground))
                    .cornerRadius(12)
                    .shadow(color: .black.opacity(0.05), radius: 4, x: 0, y: 2)
                    
                    // Pasos de la actividad (expandible)
                    VStack(alignment: .leading, spacing: 12) {
                        Button(action: {
                            withAnimation(.spring(response: 0.6, dampingFraction: 0.8)) {
                                mostrarPasos.toggle()
                            }
                        }) {
                            HStack {
                                Image(systemName: "list.number")
                                    .foregroundColor(.green)
                                Text("Pasos de la Actividad")
                                    .font(.headline)
                                    .fontWeight(.semibold)
                                    .foregroundColor(.primary)
                                
                                Spacer()
                                
                                Image(systemName: mostrarPasos ? "chevron.up" : "chevron.down")
                                    .foregroundColor(.green)
                                    .font(.title3)
                            }
                        }
                        .buttonStyle(PlainButtonStyle())
                        
                        if mostrarPasos {
                            VStack(alignment: .leading, spacing: 8) {
                                ForEach(Array(actividad.pasosActividad.enumerated()), id: \.offset) { index, paso in
                                HStack(alignment: .top, spacing: 12) {
                                    Text("\(index + 1).")
                                        .font(.caption)
                                        .fontWeight(.bold)
                                        .foregroundColor(.green)
                                        .frame(width: 20, alignment: .leading)
                                    
                                    Text(paso)
                                        .font(.body)
                                        .foregroundColor(.primary)
                                }
                                .padding(.vertical, 2)
                            }
                            }
                            .padding(12)
                            .background(Color.green.opacity(0.1))
                            .cornerRadius(8)
                            .transition(.asymmetric(
                                insertion: .opacity.combined(with: .move(edge: .top)),
                                removal: .opacity.combined(with: .move(edge: .top))
                            ))
                        }
                    }
                    .padding(16)
                    .background(Color(.systemBackground))
                    .cornerRadius(12)
                    .shadow(color: .black.opacity(0.05), radius: 4, x: 0, y: 2)
                    
                    // Materiales necesarios (expandible)
                    VStack(alignment: .leading, spacing: 12) {
                        Button(action: {
                            withAnimation(.spring(response: 0.6, dampingFraction: 0.8)) {
                                mostrarMateriales.toggle()
                            }
                        }) {
                            HStack {
                                Image(systemName: "shippingbox.fill")
                                    .foregroundColor(.orange)
                                Text("Materiales Necesarios")
                                    .font(.headline)
                                    .fontWeight(.semibold)
                                    .foregroundColor(.primary)
                                
                                Spacer()
                                
                                Image(systemName: mostrarMateriales ? "chevron.up" : "chevron.down")
                                    .foregroundColor(.orange)
                                    .font(.title3)
                            }
                        }
                        .buttonStyle(PlainButtonStyle())
                        
                        if mostrarMateriales {
                            LazyVGrid(columns: [
                                GridItem(.flexible()),
                                GridItem(.flexible())
                            ], spacing: 8) {
                                ForEach(actividad.materialesNecesarios, id: \.self) { material in
                                    HStack {
                                        Image(systemName: "checkmark.circle.fill")
                                            .font(.caption)
                                            .foregroundColor(.green)
                                        Text(material)
                                            .font(.caption)
                                            .foregroundColor(.primary)
                                    }
                                    .padding(.horizontal, 8)
                                    .padding(.vertical, 4)
                                    .background(Color.orange.opacity(0.1))
                                    .cornerRadius(6)
                                }
                            }
                            .padding(12)
                            .background(Color.orange.opacity(0.1))
                            .cornerRadius(8)
                            .transition(.asymmetric(
                                insertion: .opacity.combined(with: .move(edge: .top)),
                                removal: .opacity.combined(with: .move(edge: .top))
                            ))
                        }
                    }
                    .padding(16)
                    .background(Color(.systemBackground))
                    .cornerRadius(12)
                    .shadow(color: .black.opacity(0.05), radius: 4, x: 0, y: 2)
                    
                    // Variaciones (expandible)
                    VStack(alignment: .leading, spacing: 12) {
                        Button(action: {
                            withAnimation(.spring(response: 0.6, dampingFraction: 0.8)) {
                                mostrarVariaciones.toggle()
                            }
                        }) {
                            HStack {
                                Image(systemName: "arrow.triangle.branch")
                                    .foregroundColor(.blue)
                                Text("Variaciones")
                                    .font(.headline)
                                    .fontWeight(.semibold)
                                    .foregroundColor(.primary)
                                
                                Spacer()
                                
                                Image(systemName: mostrarVariaciones ? "chevron.up" : "chevron.down")
                                    .foregroundColor(.blue)
                                    .font(.title3)
                            }
                        }
                        .buttonStyle(PlainButtonStyle())
                        
                        if mostrarVariaciones {
                            VStack(alignment: .leading, spacing: 8) {
                                ForEach(Array(actividad.variaciones.enumerated()), id: \.offset) { index, variacion in
                                HStack(alignment: .top, spacing: 12) {
                                    Text("•")
                                        .font(.caption)
                                        .fontWeight(.bold)
                                        .foregroundColor(.blue)
                                        .frame(width: 20, alignment: .leading)
                                    
                                    Text(variacion)
                                        .font(.body)
                                        .foregroundColor(.primary)
                                }
                                .padding(.vertical, 2)
                            }
                            }
                            .padding(12)
                            .background(Color.blue.opacity(0.1))
                            .cornerRadius(8)
                            .transition(.asymmetric(
                                insertion: .opacity.combined(with: .move(edge: .top)),
                                removal: .opacity.combined(with: .move(edge: .top))
                            ))
                        }
                    }
                    .padding(16)
                    .background(Color(.systemBackground))
                    .cornerRadius(12)
                    .shadow(color: .black.opacity(0.05), radius: 4, x: 0, y: 2)
                    
                    // Resultados esperados
                    VStack(alignment: .leading, spacing: 12) {
                        HStack {
                            Image(systemName: "target")
                                .foregroundColor(.green)
                            Text("Resultados Esperados")
                                .font(.headline)
                                .fontWeight(.semibold)
                        }
                        
                        Text(actividad.resultadosEsperados)
                            .font(.body)
                            .lineSpacing(4)
                            .foregroundColor(.primary)
                    }
                    .padding(16)
                    .background(Color(.systemBackground))
                    .cornerRadius(12)
                    .shadow(color: .black.opacity(0.05), radius: 4, x: 0, y: 2)
                    
                    // Base científica
                    VStack(alignment: .leading, spacing: 12) {
                        HStack {
                            Image(systemName: "atom")
                                .foregroundColor(.purple)
                            Text("Base Científica")
                                .font(.headline)
                                .fontWeight(.semibold)
                        }
                        
                        Text(actividad.baseCientifica)
                            .font(.body)
                            .foregroundColor(.secondary)
                            .padding(.horizontal, 12)
                            .padding(.vertical, 8)
                            .background(Color.purple.opacity(0.1))
                            .cornerRadius(8)
                    }
                    .padding(16)
                    .background(Color(.systemBackground))
                    .cornerRadius(12)
                    .shadow(color: .black.opacity(0.05), radius: 4, x: 0, y: 2)
                    
                    // Botones de acción
                    HStack(spacing: 12) {
                        Button(action: {
                            // Acción para iniciar actividad
                        }) {
                            HStack {
                                Image(systemName: "play.fill")
                                Text("Iniciar Actividad")
                            }
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding(.horizontal, 20)
                            .padding(.vertical, 12)
                            .background(Color(actividad.color))
                            .cornerRadius(12)
                        }
                        
                        Button(action: {
                            // Acción para marcar como completado
                        }) {
                            HStack {
                                Image(systemName: "checkmark.circle.fill")
                                Text("Completado")
                            }
                            .font(.subheadline)
                            .foregroundColor(.green)
                            .padding(.horizontal, 16)
                            .padding(.vertical, 8)
                            .background(Color.green.opacity(0.1))
                            .cornerRadius(8)
                        }
                        
                        Spacer()
                    }
                    .padding(.top, 8)
                }
                .padding()
            }
            .navigationTitle("Actividad")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Cerrar") {
                        dismiss()
                    }
                    .foregroundColor(Color(actividad.color))
                }
            }
        }
    }
}

// MARK: - Componentes de Ayuda
struct ActividadInfoRow: View {
    let icon: String
    let title: String
    let value: String
    let color: Color
    
    var body: some View {
        HStack {
            Image(systemName: icon)
                .font(.caption)
                .foregroundColor(color)
                .frame(width: 16)
            
            Text(title)
                .font(.caption)
                .fontWeight(.medium)
                .foregroundColor(.secondary)
            
            Spacer()
            
            Text(value)
                .font(.caption)
                .foregroundColor(color)
        }
    }
}

// MARK: - Preview
struct Capa5AplicacionCasaView_Previews: PreviewProvider {
    static var previews: some View {
        Capa5AplicacionCasaView()
            .environmentObject(ProgresoManager())
    }
}
