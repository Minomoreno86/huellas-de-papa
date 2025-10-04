import SwiftUI

struct Capa3HerramientasView: View {
    @StateObject private var progresoManager = ProgresoManager()
    @State private var capa3 = Capa3Herramientas.contenidoCerebroDelNino()
    @State private var herramientaSeleccionada: HerramientaPractica?
    @State private var mostrarDetalle = false
    @State private var categoriaFiltro: CategoriaHerramienta?
    
    var herramientasFiltradas: [HerramientaPractica] {
        if let categoria = categoriaFiltro {
            return capa3.herramientas.filter { $0.categoria == categoria }
        }
        return capa3.herramientas
    }
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    // Header
                    VStack(alignment: .leading, spacing: 12) {
                        Text("CAPA 3: HERRAMIENTAS PRÁCTICAS")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .foregroundColor(.primary)
                        
                        Text(capa3.resumenIntroduccion)
                            .font(.body)
                            .foregroundColor(.secondary)
                            .lineSpacing(5)
                    }
                    .padding(.bottom, 10)
                    
                    Divider()
                        .padding(.vertical, 10)
                    
                    // Filtros de categoría
                    VStack(alignment: .leading, spacing: 12) {
                        Text("Filtrar por categoría:")
                            .font(.headline)
                            .fontWeight(.semibold)
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 12) {
                                Button(action: {
                                    categoriaFiltro = nil
                                }) {
                                    Text("Todas")
                                        .font(.caption)
                                        .fontWeight(.medium)
                                        .foregroundColor(categoriaFiltro == nil ? .white : .blue)
                                        .padding(.horizontal, 16)
                                        .padding(.vertical, 8)
                                        .background(categoriaFiltro == nil ? Color.blue : Color.blue.opacity(0.1))
                                        .cornerRadius(20)
                                }
                                
                                ForEach(CategoriaHerramienta.allCases, id: \.self) { categoria in
                                    Button(action: {
                                        categoriaFiltro = categoria
                                    }) {
                                        Text(categoria.rawValue)
                                            .font(.caption)
                                            .fontWeight(.medium)
                                            .foregroundColor(categoriaFiltro == categoria ? .white : .blue)
                                            .padding(.horizontal, 16)
                                            .padding(.vertical, 8)
                                            .background(categoriaFiltro == categoria ? Color.blue : Color.blue.opacity(0.1))
                                            .cornerRadius(20)
                                    }
                                }
                            }
                            .padding(.horizontal)
                        }
                    }
                    
                    // Lista de herramientas
                    VStack(alignment: .leading, spacing: 16) {
                        Text("Herramientas disponibles:")
                            .font(.title2)
                            .fontWeight(.semibold)
                            .padding(.bottom, 10)
                        
                        ForEach(herramientasFiltradas.indices, id: \.self) { index in
                            HerramientaCard(
                                herramienta: herramientasFiltradas[index],
                                index: index + 1
                            ) {
                                herramientaSeleccionada = herramientasFiltradas[index]
                                mostrarDetalle = true
                            }
                        }
                    }
                }
                .padding()
            }
            .navigationTitle("Herramientas")
            .navigationBarTitleDisplayMode(.inline)
        }
        .sheet(isPresented: $mostrarDetalle) {
            if let herramienta = herramientaSeleccionada {
                HerramientaDetalleView(herramienta: herramienta)
            }
        }
    }
}

// MARK: - Componentes de Vista
struct HerramientaCard: View {
    let herramienta: HerramientaPractica
    let index: Int
    let onTap: () -> Void
    
    var body: some View {
        Button(action: onTap) {
            VStack(alignment: .leading, spacing: 12) {
                // Header con gradiente, icono, título
                HStack {
                    ZStack {
                        Circle()
                            .fill(
                                LinearGradient(
                                    gradient: Gradient(colors: [Color(herramienta.color), Color(herramienta.color).opacity(0.7)]),
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
                        Text(herramienta.titulo)
                            .font(.headline)
                            .fontWeight(.semibold)
                            .foregroundColor(.primary)
                            .multilineTextAlignment(.leading)
                            .lineLimit(2)
                        
                        HStack {
                            Image(systemName: herramienta.icono)
                                .font(.caption)
                                .foregroundColor(Color(herramienta.color))
                            
                            Text(herramienta.categoria.rawValue)
                                .font(.caption)
                                .foregroundColor(Color(herramienta.color))
                                .fontWeight(.medium)
                        }
                    }
                    
                    Spacer()
                    
                    VStack {
                        Image(systemName: "arrow.right.circle.fill")
                            .font(.title2)
                            .foregroundColor(Color(herramienta.color))
                        
                        Text("Explorar")
                            .font(.caption2)
                            .foregroundColor(Color(herramienta.color))
                    }
                }
                
                // Contenido con diseño mejorado
                VStack(alignment: .leading, spacing: 8) {
                    Text(herramienta.descripcion)
                        .font(.body)
                        .foregroundColor(.secondary)
                        .lineLimit(3)
                        .multilineTextAlignment(.leading)
                        .lineSpacing(2)
                    
                    // Información adicional
                    HStack {
                        Label(herramienta.tiempoEstimado, systemImage: "clock")
                            .font(.caption)
                            .foregroundColor(.secondary)
                        
                        Spacer()
                        
                        Label(herramienta.edadRecomendada, systemImage: "person")
                            .font(.caption)
                            .foregroundColor(.secondary)
                    }
                    .padding(.top, 4)
                }
                
                // Barra de progreso visual
                HStack {
                    ForEach(0..<5) { _ in
                        Circle()
                            .fill(Color(herramienta.color).opacity(0.3))
                            .frame(width: 6, height: 6)
                    }
                    
                    Spacer()
                    
                    Text("Toca para ver más")
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
                            gradient: Gradient(colors: [Color(herramienta.color).opacity(0.3), Color(herramienta.color).opacity(0.1)]),
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

// MARK: - Vista de Detalle
struct HerramientaDetalleView: View {
    let herramienta: HerramientaPractica
    @Environment(\.dismiss) private var dismiss
    @State private var mostrarInstrucciones = false
    @State private var mostrarBeneficios = false
    @State private var mostrarVariaciones = false
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 24) {
                    // Header con gradiente, título de la herramienta
                    VStack(alignment: .leading, spacing: 16) {
                        HStack {
                            Image(systemName: herramienta.icono)
                                .font(.largeTitle)
                                .foregroundColor(Color(herramienta.color))
                            
                            VStack(alignment: .leading, spacing: 4) {
                                Text("Herramienta Práctica")
                                    .font(.title2)
                                    .fontWeight(.bold)
                                    .foregroundColor(Color(herramienta.color))
                                
                                Text(herramienta.categoria.rawValue)
                                    .font(.subheadline)
                                    .foregroundColor(.secondary)
                            }
                            
                            Spacer()
                        }
                        
                        Text(herramienta.titulo)
                            .font(.title)
                            .fontWeight(.bold)
                            .multilineTextAlignment(.leading)
                            .lineSpacing(4)
                    }
                    .padding(20)
                    .background(
                        LinearGradient(
                            gradient: Gradient(colors: [Color(herramienta.color).opacity(0.1), Color(herramienta.color).opacity(0.05)]),
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                    )
                    .cornerRadius(16)
                    
                    // Descripción
                    VStack(alignment: .leading, spacing: 12) {
                        Text("Descripción")
                            .font(.headline)
                            .fontWeight(.semibold)
                        
                        Text(herramienta.descripcion)
                            .font(.body)
                            .lineSpacing(6)
                            .foregroundColor(.primary)
                    }
                    .padding(16)
                    .background(Color(.systemGray6))
                    .cornerRadius(12)
                    
                    // Información básica
                    VStack(alignment: .leading, spacing: 12) {
                        Text("Información Básica")
                            .font(.headline)
                            .fontWeight(.semibold)
                        
                        VStack(alignment: .leading, spacing: 8) {
                            InfoRow(icon: "clock", title: "Tiempo estimado", value: herramienta.tiempoEstimado)
                            InfoRow(icon: "person", title: "Edad recomendada", value: herramienta.edadRecomendada)
                            InfoRow(icon: "chart.bar", title: "Dificultad", value: herramienta.dificultad.rawValue)
                        }
                    }
                    .padding(16)
                    .background(Color(.systemBackground))
                    .cornerRadius(12)
                    .shadow(color: .black.opacity(0.05), radius: 4, x: 0, y: 2)
                    
                    // Instrucciones (expandible)
                    VStack(alignment: .leading, spacing: 12) {
                        Button(action: {
                            withAnimation(.spring(response: 0.6, dampingFraction: 0.8)) {
                                mostrarInstrucciones.toggle()
                            }
                        }) {
                            HStack {
                                Image(systemName: "list.number")
                                    .foregroundColor(.blue)
                                Text("Instrucciones Paso a Paso")
                                    .font(.headline)
                                    .fontWeight(.semibold)
                                    .foregroundColor(.primary)
                                
                                Spacer()
                                
                                Image(systemName: mostrarInstrucciones ? "chevron.up" : "chevron.down")
                                    .foregroundColor(.blue)
                                    .font(.title3)
                            }
                        }
                        .buttonStyle(PlainButtonStyle())
                        
                        if mostrarInstrucciones {
                            VStack(alignment: .leading, spacing: 8) {
                                ForEach(herramienta.instrucciones.indices, id: \.self) { index in
                                    HStack(alignment: .top, spacing: 8) {
                                        Text("\(index + 1).")
                                            .font(.body)
                                            .fontWeight(.bold)
                                            .foregroundColor(.blue)
                                        Text(herramienta.instrucciones[index])
                                            .font(.body)
                                            .foregroundColor(.primary)
                                            .lineSpacing(4)
                                    }
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
                    
                    // Beneficios (expandible)
                    VStack(alignment: .leading, spacing: 12) {
                        Button(action: {
                            withAnimation(.spring(response: 0.6, dampingFraction: 0.8)) {
                                mostrarBeneficios.toggle()
                            }
                        }) {
                            HStack {
                                Image(systemName: "star.fill")
                                    .foregroundColor(.yellow)
                                Text("Beneficios")
                                    .font(.headline)
                                    .fontWeight(.semibold)
                                    .foregroundColor(.primary)
                                
                                Spacer()
                                
                                Image(systemName: mostrarBeneficios ? "chevron.up" : "chevron.down")
                                    .foregroundColor(.yellow)
                                    .font(.title3)
                            }
                        }
                        .buttonStyle(PlainButtonStyle())
                        
                        if mostrarBeneficios {
                            VStack(alignment: .leading, spacing: 8) {
                                ForEach(herramienta.beneficios, id: \.self) { beneficio in
                                    HStack(alignment: .top, spacing: 8) {
                                        Image(systemName: "checkmark.circle.fill")
                                            .foregroundColor(.yellow)
                                            .font(.caption)
                                        Text(beneficio)
                                            .font(.body)
                                            .foregroundColor(.primary)
                                            .lineSpacing(4)
                                    }
                                }
                            }
                            .padding(12)
                            .background(Color.yellow.opacity(0.1))
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
                                    .foregroundColor(.purple)
                                Text("Variaciones")
                                    .font(.headline)
                                    .fontWeight(.semibold)
                                    .foregroundColor(.primary)
                                
                                Spacer()
                                
                                Image(systemName: mostrarVariaciones ? "chevron.up" : "chevron.down")
                                    .foregroundColor(.purple)
                                    .font(.title3)
                            }
                        }
                        .buttonStyle(PlainButtonStyle())
                        
                        if mostrarVariaciones {
                            VStack(alignment: .leading, spacing: 8) {
                                ForEach(herramienta.variaciones, id: \.self) { variacion in
                                    HStack(alignment: .top, spacing: 8) {
                                        Image(systemName: "lightbulb.fill")
                                            .foregroundColor(.purple)
                                            .font(.caption)
                                        Text(variacion)
                                            .font(.body)
                                            .foregroundColor(.primary)
                                            .lineSpacing(4)
                                    }
                                }
                            }
                            .padding(12)
                            .background(Color.purple.opacity(0.1))
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
                }
                .padding()
            }
            .navigationTitle("Herramienta")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Cerrar") {
                        dismiss()
                    }
                    .foregroundColor(Color(herramienta.color))
                }
            }
        }
    }
}

// MARK: - Componente de Información
struct InfoRow: View {
    let icon: String
    let title: String
    let value: String
    
    var body: some View {
        HStack {
            Image(systemName: icon)
                .foregroundColor(.blue)
                .frame(width: 20)
            
            Text(title)
                .font(.body)
                .foregroundColor(.secondary)
            
            Spacer()
            
            Text(value)
                .font(.body)
                .fontWeight(.medium)
                .foregroundColor(.primary)
        }
    }
}

#Preview {
    Capa3HerramientasView()
}
