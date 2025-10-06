import SwiftUI

struct HomeView: View {
    @EnvironmentObject var progresoManager: ProgresoManager
    @State private var modulos = ModuloDisponible.todosLosModulos()
    @State private var categoriaSeleccionada: CategoriaModulo? = nil
    @State private var busqueda = ""
    @State private var mostrarFiltros = false
    
    var modulosFiltrados: [ModuloDisponible] {
        var filtrados = modulos
        
        // Filtrar por categoría
        if let categoria = categoriaSeleccionada {
            filtrados = filtrados.filter { $0.categoria == categoria }
        }
        
        // Filtrar por búsqueda
        if !busqueda.isEmpty {
            filtrados = filtrados.filter { modulo in
                modulo.titulo.localizedCaseInsensitiveContains(busqueda) ||
                modulo.autor.localizedCaseInsensitiveContains(busqueda) ||
                modulo.tematica.localizedCaseInsensitiveContains(busqueda)
            }
        }
        
        return filtrados
    }
    
    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                // Header con estadísticas
                HeaderView(progresoManager: progresoManager)
                
                // Barra de búsqueda y filtros
                BusquedaFiltrosView(
                    busqueda: $busqueda,
                    categoriaSeleccionada: $categoriaSeleccionada,
                    mostrarFiltros: $mostrarFiltros
                )
                
                // Lista de módulos
                ScrollView {
                    LazyVStack(spacing: 16) {
                        ForEach(modulosFiltrados) { modulo in
                            ModuloCardView(modulo: modulo) {
                                // Enviar notificación para navegar al módulo
                                NotificationCenter.default.post(
                                    name: .moduloSeleccionado,
                                    object: modulo
                                )
                            }
                        }
                    }
                    .padding()
                }
            }
            .navigationTitle("Huellas de Papa")
            .navigationBarTitleDisplayMode(.large)
        }
    }
}

// MARK: - Header con Estadísticas
struct HeaderView: View {
    @ObservedObject var progresoManager: ProgresoManager
    
    var body: some View {
        VStack(spacing: 8) {
            HStack {
                VStack(alignment: .leading, spacing: 2) {
                    Text("¡Bienvenido!")
                        .font(.title2)
                        .fontWeight(.bold)
                    
                    Text("22 módulos de crianza basados en neurociencia")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
                
                Spacer()
                
                // Progreso general
                VStack {
                    CircularProgressView(progress: progresoManager.progresoGeneral)
                    Text("\(Int(progresoManager.progresoGeneral * 100))%")
                        .font(.caption)
                        .fontWeight(.medium)
                }
            }
        }
        .padding(.horizontal)
        .padding(.top, 8)
        .padding(.bottom, 4)
    }
}

// MARK: - Barra de Búsqueda y Filtros
struct BusquedaFiltrosView: View {
    @Binding var busqueda: String
    @Binding var categoriaSeleccionada: CategoriaModulo?
    @Binding var mostrarFiltros: Bool
    
    var body: some View {
        VStack(spacing: 12) {
            // Barra de búsqueda
            HStack {
                Image(systemName: "magnifyingglass")
                    .foregroundColor(.secondary)
                
                TextField("Buscar módulos...", text: $busqueda)
                    .textFieldStyle(PlainTextFieldStyle())
                
                if !busqueda.isEmpty {
                    Button("Limpiar") {
                        busqueda = ""
                    }
                    .font(.caption)
                    .foregroundColor(.blue)
                }
            }
            .padding()
            .background(Color(.systemGray6))
            .cornerRadius(10)
            
            // Filtros por categoría
            if mostrarFiltros {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 12) {
                        // Botón "Todos"
                        FilterButton(
                            titulo: "Todos",
                            isSelected: categoriaSeleccionada == nil
                        ) {
                            categoriaSeleccionada = nil
                        }
                        
                        // Botones de categorías
                        ForEach(CategoriaModulo.allCases, id: \.self) { categoria in
                            FilterButton(
                                titulo: categoria.displayName,
                                isSelected: categoriaSeleccionada == categoria
                            ) {
                                categoriaSeleccionada = categoria
                            }
                        }
                    }
                    .padding(.horizontal)
                }
            }
            
            // Botón para mostrar/ocultar filtros
            Button(action: { mostrarFiltros.toggle() }) {
                HStack {
                    Text(mostrarFiltros ? "Ocultar Filtros" : "Mostrar Filtros")
                    Image(systemName: mostrarFiltros ? "chevron.up" : "chevron.down")
                }
                .font(.caption)
                .foregroundColor(.blue)
            }
        }
        .padding(.horizontal)
    }
}

// MARK: - Tarjeta de Módulo
struct ModuloCardView: View {
    let modulo: ModuloDisponible
    let onTap: () -> Void
    
    var body: some View {
        Button(action: onTap) {
            VStack(alignment: .leading, spacing: 12) {
                // Header de la tarjeta
                HStack {
                    // Icono y título
                    HStack(spacing: 12) {
                        Image(systemName: modulo.icono)
                            .font(.title2)
                            .foregroundColor(Color(modulo.color))
                            .frame(width: 40, height: 40)
                            .background(Color(modulo.color).opacity(0.1))
                            .clipShape(Circle())
                        
                        VStack(alignment: .leading, spacing: 4) {
                            Text(modulo.titulo)
                                .font(.headline)
                                .fontWeight(.semibold)
                                .foregroundColor(.primary)
                                .multilineTextAlignment(.leading)
                            
                            Text("por \(modulo.autor)")
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                        }
                    }
                    
                    Spacer()
                    
                    // Progreso
                    VStack {
                        CircularProgressView(progress: modulo.progreso)
                        Text("\(Int(modulo.progreso * 100))%")
                            .font(.caption)
                            .fontWeight(.medium)
                    }
                }
                
                // Temática y enfoque
                VStack(alignment: .leading, spacing: 4) {
                    Text(modulo.tematica)
                        .font(.body)
                        .foregroundColor(.primary)
                        .multilineTextAlignment(.leading)
                    
                    Text("Enfoque: \(modulo.enfoque)")
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
                
                // Información adicional
                HStack {
                    // Público objetivo
                    Label(modulo.publico, systemImage: "person.2")
                        .font(.caption)
                        .foregroundColor(.secondary)
                    
                    Spacer()
                    
                    // Dificultad
                    Label(modulo.dificultad.displayName, systemImage: "chart.bar")
                        .font(.caption)
                        .foregroundColor(Color(modulo.dificultad.color))
                    
                    Spacer()
                    
                    // Tiempo estimado
                    Label(modulo.tiempoEstimado, systemImage: "clock")
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
                
                // Estado
                HStack {
                    Spacer()
                    
                    if modulo.estaCompletado {
                        Label("Completado", systemImage: "checkmark.circle.fill")
                            .font(.caption)
                            .foregroundColor(.green)
                    } else if modulo.progreso > 0 {
                        Label("En Progreso", systemImage: "play.circle.fill")
                            .font(.caption)
                            .foregroundColor(.blue)
                    } else {
                        Label("Nuevo", systemImage: "star.fill")
                            .font(.caption)
                            .foregroundColor(.orange)
                    }
                }
            }
            .padding()
            .background(Color(.systemBackground))
            .cornerRadius(16)
            .shadow(color: .black.opacity(0.1), radius: 4, x: 0, y: 2)
        }
        .buttonStyle(PlainButtonStyle())
    }
}

// MARK: - Componentes de Apoyo
struct StatCardView: View {
    let titulo: String
    let valor: String
    let icono: String
    let color: Color
    
    var body: some View {
        VStack(spacing: 4) {
            Image(systemName: icono)
                .font(.title3)
                .foregroundColor(color)
            
            Text(valor)
                .font(.headline)
                .fontWeight(.bold)
            
            Text(titulo)
                .font(.caption)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
        }
        .frame(maxWidth: .infinity)
    }
}

struct FilterButton: View {
    let titulo: String
    let isSelected: Bool
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(titulo)
                .font(.caption)
                .fontWeight(.medium)
                .padding(.horizontal, 12)
                .padding(.vertical, 6)
                .background(isSelected ? Color.blue : Color(.systemGray5))
                .foregroundColor(isSelected ? .white : .primary)
                .cornerRadius(16)
        }
    }
}

// MARK: - Preview
struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
