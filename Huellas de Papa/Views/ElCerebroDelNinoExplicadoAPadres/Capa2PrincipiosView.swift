import SwiftUI
import UIKit

// MARK: - CAPA 2 VIEW: PRINCIPIOS CLAVE BILBAO
// Vista principal que implementa los principios neuropsicológicos de Álvaro Bilbao
// Diseño SuperDesign: estética profesional, emocionalmente atractiva, fluida

struct Capa2PrincipiosView: View {
    // MARK: - Estado de la Vista
    @StateObject private var gestorPrincipios = Capa2GestorPrincipios()
    @State private var categoriaSeleccionada: Capa2Categoria? = nil
    @State private var principioSeleccionado: Capa2Principio? = nil
    @State private var mostrarDetalle = false
    @State private var textoBusqueda = ""
    @State private var principioCompletado: Set<UUID> = []
    
    // MARK: - Configuración SuperDesign
    private let coloresClinicos = (
        azulSuave: Color.blue.opacity(0.1),
        acentoCoral: Color.orange.opacity(0.8),
        verdeSuave: Color.green.opacity(0.1),
        purpuraSuave: Color.purple.opacity(0.1)
    )
    
    var body: some View {
        NavigationView {
            GeometryReader { geometry in
                ScrollView {
                    LazyVStack(spacing: 24) {
                        // MARK: - Header Principal
                        headerPrincipalView
                        
                        // MARK: - Barra de Búsqueda
                        barraBusquedaView
                        
                        // MARK: - Filtros de Categoría
                        filtrosCategoriaView
                        
                        // MARK: - Contenido Principal
                        contenidoPrincipalView
                        
                        // MARK: - Footer de Progreso
                        footerProgresoView
                    }
                    .padding(.horizontal, 20)
                    .padding(.vertical, 16)
                }
            }
            .background(
                LinearGradient(
                    gradient: Gradient(colors: [
                        coloresClinicos.azulSuave,
                        Color(UIColor.systemBackground)
                    ]),
                    startPoint: .top,
                    endPoint: .bottom
                )
            )
            .navigationTitle("Principios Clave")
            .navigationBarTitleDisplayMode(.large)
            .sheet(isPresented: $mostrarDetalle) {
                if let principio = principioSeleccionado {
                    Capa2PrincipioDetalleView(
                        principio: principio,
                        esCompletado: principioCompletado.contains(principio.id),
                        onToggleCompletado: { toggleCompletado(principio.id) }
                    )
                }
            }
        }
    }
    
    // MARK: - Header Principal
    private var headerPrincipalView: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack {
                VStack(alignment: .leading, spacing: 8) {
                    Text("🧠 Principios Clave")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.primary)
                    
                    Text("Neurociencia aplicada a la crianza")
                        .font(.title3)
                        .foregroundColor(.secondary)
                        .fontWeight(.medium)
                }
                
                Spacer()
                
                VStack {
                    Image(systemName: "brain.head.profile")
                        .font(.system(size: 40))
                        .foregroundColor(coloresClinicos.acentoCoral)
                    
                    Text("Bilbao")
                        .font(.caption)
                        .foregroundColor(.secondary)
                        .fontWeight(.medium)
                }
            }
            
            Text("Los pilares fundamentales basados en 'El cerebro del niño explicado a los padres' de Álvaro Bilbao. Cada principio está respaldado por neurociencia y diseñado para transformar tu crianza.")
                .font(.body)
                .foregroundColor(.secondary)
                .lineSpacing(4)
                .padding(.vertical, 8)
        }
        .padding(20)
        .background(
            RoundedRectangle(cornerRadius: 20)
                .fill(Color(.systemBackground))
                .shadow(color: .black.opacity(0.05), radius: 10, x: 0, y: 5)
        )
    }
    
    // MARK: - Barra de Búsqueda
    private var barraBusquedaView: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundColor(.secondary)
            
            TextField("Buscar principios...", text: $textoBusqueda)
                .textFieldStyle(PlainTextFieldStyle())
                .font(.body)
                .accessibilityLabel("Campo de búsqueda")
                .accessibilityHint("Escribe para buscar principios específicos")
                .dynamicTypeSize(.medium ... .accessibility2)
            
            if !textoBusqueda.isEmpty {
                Button(action: { textoBusqueda = "" }) {
                    Image(systemName: "xmark.circle.fill")
                        .foregroundColor(.secondary)
                }
            }
        }
        .padding(16)
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(Color(UIColor.systemGray6))
        )
    }
    
    // MARK: - Filtros de Categoría
    private var filtrosCategoriaView: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Categorías")
                .font(.headline)
                .fontWeight(.semibold)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 12) {
                    // Botón "Todos"
                    Button(action: { categoriaSeleccionada = nil }) {
                        Text("Todos")
                            .font(.subheadline)
                            .fontWeight(.medium)
                            .foregroundColor(categoriaSeleccionada == nil ? .white : .primary)
                            .padding(.horizontal, 16)
                            .padding(.vertical, 8)
                            .background(
                                RoundedRectangle(cornerRadius: 20)
                                    .fill(categoriaSeleccionada == nil ? coloresClinicos.acentoCoral : Color(UIColor.systemGray5))
                            )
                    }
                    
                    // Chips de categorías
                    ForEach(Capa2Categoria.allCases, id: \.self) { categoria in
                        categoriaChipView(categoria: categoria)
                    }
                }
                .padding(.horizontal, 4)
            }
        }
    }
    
    // MARK: - Chip de Categoría Individual
    private func categoriaChipView(categoria: Capa2Categoria) -> some View {
        Button(action: { 
            withAnimation(.spring(response: 0.6, dampingFraction: 0.8)) {
                categoriaSeleccionada = categoriaSeleccionada == categoria ? nil : categoria
            }
        }) {
            HStack(spacing: 6) {
                Image(systemName: categoria.icono)
                    .font(.caption)
                
                Text(categoria.rawValue)
                    .font(.subheadline)
                    .fontWeight(.medium)
            }
            .foregroundColor(categoriaSeleccionada == categoria ? .white : .primary)
            .padding(.horizontal, 12)
            .padding(.vertical, 8)
            .background(
                RoundedRectangle(cornerRadius: 16)
                    .fill(categoriaSeleccionada == categoria ? Color(categoria.color) : Color(UIColor.systemGray5))
            )
        }
        .scaleEffect(categoriaSeleccionada == categoria ? 1.05 : 1.0)
        .animation(.spring(response: 0.6, dampingFraction: 0.8), value: categoriaSeleccionada)
    }
    
    // MARK: - Contenido Principal
    private var contenidoPrincipalView: some View {
        VStack(alignment: .leading, spacing: 16) {
            // Título de sección
            HStack {
                Text("Principios Disponibles")
                    .font(.title2)
                    .fontWeight(.bold)
                
                Spacer()
                
                Text("\(principiosFiltrados.count) principios")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
            
            // Lista de principios
            LazyVStack(spacing: 12) {
                ForEach(principiosFiltrados.indices, id: \.self) { index in
                    Capa2PrincipioCardView(
                        principio: principiosFiltrados[index],
                        index: index + 1,
                        esCompletado: principioCompletado.contains(principiosFiltrados[index].id),
                        onTap: {
                            // Feedback háptico al tocar
            let impactFeedback = UIImpactFeedbackGenerator(style: UIImpactFeedbackGenerator.FeedbackStyle.light)
            impactFeedback.impactOccurred()
                            
                            withAnimation(.spring(response: 0.6, dampingFraction: 0.8)) {
                                principioSeleccionado = principiosFiltrados[index]
                                mostrarDetalle = true
                            }
                        },
                        onToggleCompletado: {
                            toggleCompletado(principiosFiltrados[index].id)
                        }
                    )
                    .transition(.asymmetric(
                        insertion: .opacity
                            .combined(with: .move(edge: .top))
                            .combined(with: .scale(scale: 0.8)),
                        removal: .opacity
                            .combined(with: .move(edge: .top))
                            .combined(with: .scale(scale: 0.8))
                    ))
                    .animation(
                        .spring(response: 0.8, dampingFraction: 0.9)
                        .delay(Double(index) * 0.1),
                        value: principiosFiltrados.count
                    )
                }
            }
        }
    }
    
    // MARK: - Footer de Progreso con Animaciones
    private var footerProgresoView: some View {
        VStack(spacing: 16) {
            HStack {
                VStack(alignment: .leading, spacing: 4) {
                    Text("Progreso")
                        .font(.headline)
                        .fontWeight(.semibold)
                    
                    Text("Principios de Bilbao")
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
                
                Spacer()
                
                VStack(alignment: .trailing, spacing: 4) {
                    Text("\(principioCompletado.count) de \(gestorPrincipios.principios.count)")
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(coloresClinicos.acentoCoral)
                        .animation(.spring(response: 0.6, dampingFraction: 0.8), value: principioCompletado.count)
                    
                    Text("completados")
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
            }
            
            // Barra de progreso animada
            ZStack(alignment: .leading) {
                RoundedRectangle(cornerRadius: 8)
                    .fill(Color(UIColor.systemGray5))
                    .frame(height: 12)
                
                RoundedRectangle(cornerRadius: 8)
                    .fill(
                        LinearGradient(
                            gradient: Gradient(colors: [
                                coloresClinicos.acentoCoral,
                                coloresClinicos.acentoCoral.opacity(0.8)
                            ]),
                            startPoint: .leading,
                            endPoint: .trailing
                        )
                    )
                    .frame(width: progressWidth, height: 12)
                    .animation(.spring(response: 0.8, dampingFraction: 0.9), value: progressWidth)
                    .overlay(
                        // Indicador de progreso con pulso
                        Circle()
                            .fill(Color.white)
                            .frame(width: 16, height: 16)
                            .offset(x: progressWidth - 8)
                            .opacity(principioCompletado.count > 0 ? 1 : 0)
                            .scaleEffect(principioCompletado.count > 0 ? 1 : 0)
                            .animation(.spring(response: 0.6, dampingFraction: 0.8), value: principioCompletado.count)
                    )
            }
            
            // Mensaje motivacional
            if principioCompletado.count > 0 {
                Text(mensajeMotivacional)
                    .font(.caption)
                    .fontWeight(.medium)
                    .foregroundColor(coloresClinicos.acentoCoral)
                    .multilineTextAlignment(.center)
                    .transition(.opacity.combined(with: .move(edge: .bottom)))
                    .animation(.spring(response: 0.6, dampingFraction: 0.8), value: mensajeMotivacional)
            }
        }
        .padding(20)
        .background(
            RoundedRectangle(cornerRadius: 20)
                .fill(Color(.systemBackground))
                .shadow(color: .black.opacity(0.05), radius: 10, x: 0, y: 5)
        )
    }
    
    // MARK: - Computed Properties para animaciones
    private var progressWidth: CGFloat {
        let totalWidth: CGFloat = 300 // Ancho aproximado de la barra
        let progress = gestorPrincipios.principios.isEmpty ? 0 : Double(principioCompletado.count) / Double(gestorPrincipios.principios.count)
        return totalWidth * progress
    }
    
    private var mensajeMotivacional: String {
        let porcentaje = gestorPrincipios.principios.isEmpty ? 0 : (Double(principioCompletado.count) / Double(gestorPrincipios.principios.count)) * 100
        
        switch porcentaje {
        case 0..<25:
            return "¡Excelente inicio! Cada principio es un paso hacia una crianza más consciente."
        case 25..<50:
            return "¡Vas por buen camino! La neurociencia está transformando tu perspectiva."
        case 50..<75:
            return "¡Increíble progreso! Ya dominas la mayoría de los principios clave."
        case 75..<100:
            return "¡Casi terminado! Estás a punto de completar todos los principios de Bilbao."
        default:
            return "¡Felicidades! Has completado todos los principios clave. Tu crianza está basada en neurociencia."
        }
    }
    
    // MARK: - Computed Properties
    private var principiosFiltrados: [Capa2Principio] {
        var filtrados = gestorPrincipios.principios
        
        // Filtro por categoría
        if let categoria = categoriaSeleccionada {
            filtrados = filtrados.filter { $0.categoria == categoria }
        }
        
        // Filtro por búsqueda
        if !textoBusqueda.isEmpty {
            filtrados = gestorPrincipios.buscarPrincipios(textoBusqueda)
            if let categoria = categoriaSeleccionada {
                filtrados = filtrados.filter { $0.categoria == categoria }
            }
        }
        
        return filtrados
    }
    
    // MARK: - Funciones de Acción
    private func toggleCompletado(_ principioId: UUID) {
        let eraCompletado = principioCompletado.contains(principioId)
        
        withAnimation(.spring(response: 0.6, dampingFraction: 0.8)) {
            if eraCompletado {
                principioCompletado.remove(principioId)
            } else {
                principioCompletado.insert(principioId)
            }
        }
        
        // Feedback háptico diferenciado
        if eraCompletado {
            // Feedback más suave para desmarcar
            let notificationFeedback = UINotificationFeedbackGenerator()
            notificationFeedback.notificationOccurred(UINotificationFeedbackGenerator.FeedbackType.warning)
        } else {
            // Feedback de éxito para marcar como completado
            let notificationFeedback = UINotificationFeedbackGenerator()
            notificationFeedback.notificationOccurred(UINotificationFeedbackGenerator.FeedbackType.success)
            
            // Feedback adicional de impacto para celebrar
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                let impactFeedback = UIImpactFeedbackGenerator(style: UIImpactFeedbackGenerator.FeedbackStyle.heavy)
                impactFeedback.impactOccurred()
            }
        }
        
        // Animación de celebración si se completa un principio
        if !eraCompletado && principioCompletado.count == gestorPrincipios.principios.count {
            // Todos los principios completados - celebración especial
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                let notificationFeedback = UINotificationFeedbackGenerator()
                notificationFeedback.notificationOccurred(UINotificationFeedbackGenerator.FeedbackType.success)
            }
        }
    }
}

// MARK: - Card de Principio SuperDesign
struct Capa2PrincipioCardView: View {
    let principio: Capa2Principio
    let index: Int
    let esCompletado: Bool
    let onTap: () -> Void
    let onToggleCompletado: () -> Void
    
    @State private var isPressed = false
    
    var body: some View {
        Button(action: onTap) {
            VStack(alignment: .leading, spacing: 16) {
                // Header con gradiente y número
                HStack(alignment: .top, spacing: 12) {
                    // Número con gradiente
                    ZStack {
                        Circle()
                            .fill(
                                LinearGradient(
                                    gradient: Gradient(colors: [
                                        Color(principio.color).opacity(0.8),
                                        Color(principio.color).opacity(0.6)
                                    ]),
                                    startPoint: .topLeading,
                                    endPoint: .bottomTrailing
                                )
                            )
                            .frame(width: 40, height: 40)
                            .shadow(color: Color(principio.color).opacity(0.3), radius: 4, x: 0, y: 2)
                        
                        Text("\(index)")
                            .font(.headline)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                    }
                    
                    // Título y categoría
                    VStack(alignment: .leading, spacing: 6) {
                        Text(principio.titulo)
                            .font(.headline)
                            .fontWeight(.bold)
                            .foregroundColor(.primary)
                            .multilineTextAlignment(.leading)
                            .lineLimit(3)
                            .lineSpacing(2)
                            .dynamicTypeSize(.medium ... .accessibility3)
                        
                        HStack(spacing: 6) {
                            Image(systemName: principio.categoria.icono)
                                .font(.caption)
                                .foregroundColor(Color(principio.categoria.color))
                            
                            Text(principio.categoria.rawValue)
                                .font(.caption)
                                .fontWeight(.medium)
                                .foregroundColor(Color(principio.categoria.color))
                                .padding(.horizontal, 8)
                                .padding(.vertical, 4)
                                .background(
                                    RoundedRectangle(cornerRadius: 8)
                                        .fill(Color(principio.categoria.color).opacity(0.1))
                                )
                        }
                    }
                    
                    Spacer()
                    
                    // Botón de completado con animación
                    Button(action: onToggleCompletado) {
                        ZStack {
                            Circle()
                                .fill(esCompletado ? Color.green : Color(.systemGray4))
                                .frame(width: 32, height: 32)
                                .scaleEffect(esCompletado ? 1.1 : 1.0)
                            
                            Image(systemName: esCompletado ? "checkmark" : "circle")
                                .font(.system(size: 16, weight: .semibold))
                                .foregroundColor(esCompletado ? .white : .secondary)
                        }
                    }
                    .buttonStyle(PlainButtonStyle())
                    .animation(.spring(response: 0.6, dampingFraction: 0.8), value: esCompletado)
                    .accessibilityLabel(esCompletado ? "Marcar como no completado" : "Marcar como completado")
                    .accessibilityHint("Toca para cambiar el estado de completado del principio")
                }
                
                // Contenido principal
                VStack(alignment: .leading, spacing: 12) {
                    // Explicación teórica
                    Text(principio.explicacionTeorica)
                        .font(.body)
                        .foregroundColor(.secondary)
                        .lineLimit(4)
                        .multilineTextAlignment(.leading)
                        .lineSpacing(3)
                        .dynamicTypeSize(.medium ... .accessibility2)
                    
                    // Base neurocientífica
                    HStack {
                        Image(systemName: "atom")
                            .font(.caption)
                            .foregroundColor(.purple)
                        
                        Text(principio.baseNeurocientifica)
                            .font(.caption)
                            .foregroundColor(.purple)
                            .fontWeight(.medium)
                    }
                    .padding(.horizontal, 12)
                    .padding(.vertical, 6)
                    .background(
                        RoundedRectangle(cornerRadius: 12)
                            .fill(Color.purple.opacity(0.1))
                    )
                }
                
                // Frase guía con diseño especial
                VStack(alignment: .leading, spacing: 8) {
                    HStack {
                        Image(systemName: "quote.bubble.fill")
                            .font(.caption)
                            .foregroundColor(Color(principio.color))
                        
                        Text("Frase Guía")
                            .font(.caption)
                            .fontWeight(.semibold)
                            .foregroundColor(Color(principio.color))
                        
                        Spacer()
                    }
                    
                    Text(principio.fraseGuia)
                        .font(.subheadline)
                        .fontWeight(.medium)
                        .foregroundColor(Color(principio.color))
                        .italic()
                        .multilineTextAlignment(.leading)
                        .lineSpacing(2)
                }
                .padding(12)
                .background(
                    RoundedRectangle(cornerRadius: 12)
                        .fill(Color(principio.color).opacity(0.1))
                        .overlay(
                            RoundedRectangle(cornerRadius: 12)
                                .stroke(Color(principio.color).opacity(0.3), lineWidth: 1)
                        )
                )
                
                // Indicadores de progreso
                HStack {
                    // Indicador de vínculos con Capa 1
                    if !principio.vinculosCapa1.isEmpty {
                        HStack(spacing: 4) {
                            Image(systemName: "link")
                                .font(.caption2)
                            Text("Capa 1")
                                .font(.caption2)
                        }
                        .foregroundColor(.blue)
                        .padding(.horizontal, 8)
                        .padding(.vertical, 4)
                        .background(
                            RoundedRectangle(cornerRadius: 8)
                                .fill(Color.blue.opacity(0.1))
                        )
                    }
                    
                    // Indicador de vínculos con Capa 3
                    if !principio.vinculosCapa3.isEmpty {
                        HStack(spacing: 4) {
                            Image(systemName: "wrench.and.screwdriver")
                                .font(.caption2)
                            Text("Capa 3")
                                .font(.caption2)
                        }
                        .foregroundColor(.green)
                        .padding(.horizontal, 8)
                        .padding(.vertical, 4)
                        .background(
                            RoundedRectangle(cornerRadius: 8)
                                .fill(Color.green.opacity(0.1))
                        )
                    }
                    
                    Spacer()
                    
                    // Indicador de completado
                    if esCompletado {
                        HStack(spacing: 4) {
                            Image(systemName: "checkmark.circle.fill")
                                .font(.caption2)
                            Text("Completado")
                                .font(.caption2)
                        }
                        .foregroundColor(.green)
                        .padding(.horizontal, 8)
                        .padding(.vertical, 4)
                        .background(
                            RoundedRectangle(cornerRadius: 8)
                                .fill(Color.green.opacity(0.1))
                        )
                    }
                }
            }
            .padding(20)
            .background(
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color(.systemBackground))
                    .shadow(
                        color: esCompletado ? .green.opacity(0.2) : .black.opacity(0.08),
                        radius: esCompletado ? 12 : 8,
                        x: 0,
                        y: esCompletado ? 6 : 4
                    )
            )
            .overlay(
                RoundedRectangle(cornerRadius: 20)
                    .stroke(
                        LinearGradient(
                            gradient: Gradient(colors: [
                                esCompletado ? .green : Color(principio.color).opacity(0.3),
                                esCompletado ? .green.opacity(0.1) : Color(principio.color).opacity(0.1)
                            ]),
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        ),
                        lineWidth: esCompletado ? 2 : 1
                    )
            )
            .scaleEffect(esCompletado ? 1.02 : (isPressed ? 0.98 : 1.0))
            .animation(.spring(response: 0.6, dampingFraction: 0.8), value: esCompletado)
            .animation(.easeInOut(duration: 0.1), value: isPressed)
        }
        .buttonStyle(PlainButtonStyle())
        .onLongPressGesture(minimumDuration: 0, maximumDistance: .infinity, pressing: { pressing in
            isPressed = pressing
        }, perform: {})
        // MARK: - Accesibilidad
        .accessibilityLabel("Principio: \(principio.titulo)")
        .accessibilityHint("Toca para ver detalles completos del principio")
        .accessibilityValue(esCompletado ? "Completado" : "No completado")
        .accessibilityAddTraits(.isButton)
        .accessibilityAddTraits(esCompletado ? .isSelected : [])
    }
}

// MARK: - Vista de Detalle Completa
struct Capa2PrincipioDetalleView: View {
    let principio: Capa2Principio
    let esCompletado: Bool
    let onToggleCompletado: () -> Void
    @Environment(\.dismiss) private var dismiss
    @StateObject private var gestorPrincipios = Capa2GestorPrincipios()
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 24) {
                    // Header con gradiente
                    headerDetalleView
                    
                    // Explicación teórica
                    explicacionTeoricaView
                    
                    // Ejemplo práctico
                    ejemploPracticoView
                    
                    // Aplicación emocional
                    aplicacionEmocionalView
                    
                    // Vínculos con Capa 1
                    vinculosCapa1View
                    
                    // Errores comunes
                    erroresComunesView
                    
                    // Frase guía destacada
                    fraseGuiaView
                    
                    // Botones de acción
                    botonesAccionView
                }
                .padding(.horizontal, 20)
                .padding(.vertical, 16)
            }
            .background(
                LinearGradient(
                    gradient: Gradient(colors: [
                        Color(UIColor.systemBackground),
                        Color(principio.color).opacity(0.05)
                    ]),
                    startPoint: .top,
                    endPoint: .bottom
                )
            )
            .navigationTitle("Principio Clave")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Cerrar") {
                        dismiss()
                    }
                    .foregroundColor(Color(principio.color))
                }
            }
        }
    }
    
    // MARK: - Header del Detalle
    private var headerDetalleView: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack(alignment: .top, spacing: 16) {
                ZStack {
                    Circle()
                        .fill(
                            LinearGradient(
                                gradient: Gradient(colors: [
                                    Color(principio.color).opacity(0.8),
                                    Color(principio.color).opacity(0.6)
                                ]),
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            )
                        )
                        .frame(width: 60, height: 60)
                        .shadow(color: Color(principio.color).opacity(0.3), radius: 8, x: 0, y: 4)
                    
                    Image(systemName: principio.icono)
                        .font(.title)
                        .foregroundColor(.white)
                }
                
                VStack(alignment: .leading, spacing: 8) {
                    Text(principio.titulo)
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(.primary)
                        .multilineTextAlignment(.leading)
                    
                    HStack(spacing: 8) {
                        Image(systemName: principio.categoria.icono)
                            .font(.caption)
                            .foregroundColor(Color(principio.categoria.color))
                        
                        Text(principio.categoria.rawValue)
                            .font(.subheadline)
                            .fontWeight(.medium)
                            .foregroundColor(Color(principio.categoria.color))
                            .padding(.horizontal, 12)
                            .padding(.vertical, 6)
                            .background(
                                RoundedRectangle(cornerRadius: 12)
                                    .fill(Color(principio.categoria.color).opacity(0.1))
                            )
                    }
                }
                
                Spacer()
            }
            
            // Base neurocientífica
            HStack {
                Image(systemName: "atom")
                    .font(.caption)
                    .foregroundColor(.purple)
                
                Text(principio.baseNeurocientifica)
                    .font(.caption)
                    .foregroundColor(.purple)
                    .fontWeight(.medium)
            }
            .padding(.horizontal, 12)
            .padding(.vertical, 8)
            .background(
                RoundedRectangle(cornerRadius: 12)
                    .fill(Color.purple.opacity(0.1))
            )
        }
        .padding(20)
        .background(
            RoundedRectangle(cornerRadius: 20)
                .fill(Color(.systemBackground))
                .shadow(color: .black.opacity(0.05), radius: 10, x: 0, y: 5)
        )
    }
    
    // MARK: - Explicación Teórica
    private var explicacionTeoricaView: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                Image(systemName: "lightbulb.fill")
                    .foregroundColor(.yellow)
                Text("Explicación Teórica")
                    .font(.headline)
                    .fontWeight(.semibold)
            }
            
            Text(principio.explicacionTeorica)
                .font(.body)
                .lineSpacing(4)
                .foregroundColor(.primary)
        }
        .padding(16)
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(Color.yellow.opacity(0.1))
        )
    }
    
    // MARK: - Ejemplo Práctico
    private var ejemploPracticoView: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                Image(systemName: "hands.sparkles.fill")
                    .foregroundColor(.green)
                Text("Ejemplo Práctico")
                    .font(.headline)
                    .fontWeight(.semibold)
            }
            
            Text(principio.ejemploPractico)
                .font(.body)
                .lineSpacing(4)
                .foregroundColor(.primary)
        }
        .padding(16)
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(Color.green.opacity(0.1))
        )
    }
    
    // MARK: - Aplicación Emocional
    private var aplicacionEmocionalView: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                Image(systemName: "heart.fill")
                    .foregroundColor(.pink)
                Text("Aplicación Emocional")
                    .font(.headline)
                    .fontWeight(.semibold)
            }
            
            Text(principio.aplicacionEmocional)
                .font(.body)
                .lineSpacing(4)
                .foregroundColor(.primary)
        }
        .padding(16)
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(Color.pink.opacity(0.1))
        )
    }
    
    // MARK: - Vínculos con Capa 1
    private var vinculosCapa1View: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                Image(systemName: "link")
                    .foregroundColor(.blue)
                Text("Vínculos con Capa 1")
                    .font(.headline)
                    .fontWeight(.semibold)
            }
            
            if !principio.vinculosCapa1.isEmpty {
                LazyVStack(spacing: 8) {
                    ForEach(principio.vinculosCapa1, id: \.self) { vinculo in
                        HStack(spacing: 8) {
                            Image(systemName: "arrow.right.circle.fill")
                                .font(.caption)
                                .foregroundColor(.blue)
                            
                            Text(vinculo)
                                .font(.body)
                                .foregroundColor(.primary)
                        }
                        .padding(.horizontal, 12)
                        .padding(.vertical, 8)
                        .background(
                            RoundedRectangle(cornerRadius: 8)
                                .fill(Color.blue.opacity(0.1))
                        )
                    }
                }
            } else {
                Text("Este principio se conecta con los fundamentos generales de la neurociencia del desarrollo.")
                    .font(.body)
                    .foregroundColor(.secondary)
                    .italic()
            }
        }
        .padding(16)
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(Color.blue.opacity(0.1))
        )
    }
    
    // MARK: - Errores Comunes
    private var erroresComunesView: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                Image(systemName: "exclamationmark.triangle.fill")
                    .foregroundColor(.orange)
                Text("Errores Comunes")
                    .font(.headline)
                    .fontWeight(.semibold)
            }
            
            LazyVStack(spacing: 8) {
                ForEach(Array(principio.erroresComunes.enumerated()), id: \.offset) { index, error in
                    HStack(alignment: .top, spacing: 8) {
                        Text("\(index + 1).")
                            .font(.caption)
                            .fontWeight(.bold)
                            .foregroundColor(.orange)
                            .frame(width: 20, alignment: .leading)
                        
                        Text(error)
                            .font(.body)
                            .foregroundColor(.primary)
                    }
                    .padding(.vertical, 4)
                }
            }
        }
        .padding(16)
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(Color.orange.opacity(0.1))
        )
    }
    
    // MARK: - Frase Guía
    private var fraseGuiaView: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                Image(systemName: "quote.bubble.fill")
                    .foregroundColor(Color(principio.color))
                Text("Frase Guía")
                    .font(.headline)
                    .fontWeight(.semibold)
            }
            
            Text(principio.fraseGuia)
                .font(.title3)
                .fontWeight(.medium)
                .foregroundColor(Color(principio.color))
                .italic()
                .multilineTextAlignment(.leading)
                .lineSpacing(4)
        }
        .padding(20)
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(Color(principio.color).opacity(0.1))
                .overlay(
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(Color(principio.color).opacity(0.3), lineWidth: 2)
                )
        )
    }
    
    // MARK: - Botones de Acción
    private var botonesAccionView: some View {
        VStack(spacing: 12) {
            // Botón principal de completado
            Button(action: onToggleCompletado) {
                HStack {
                    Image(systemName: esCompletado ? "checkmark.circle.fill" : "circle")
                        .font(.title2)
                    
                    Text(esCompletado ? "Principio Completado" : "Marcar como Completado")
                        .font(.headline)
                        .fontWeight(.semibold)
                }
                .foregroundColor(.white)
                .frame(maxWidth: .infinity)
                .padding(.vertical, 16)
                .background(
                    RoundedRectangle(cornerRadius: 16)
                        .fill(esCompletado ? Color.green : Color(principio.color))
                )
            }
            
            // Botón secundario de compartir
            Button(action: {
                // Acción para compartir
            }) {
                HStack {
                    Image(systemName: "square.and.arrow.up")
                    Text("Compartir Principio")
                }
                .foregroundColor(Color(principio.color))
                .frame(maxWidth: .infinity)
                .padding(.vertical, 12)
                .background(
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(Color(principio.color), lineWidth: 2)
                )
            }
        }
    }
}

// MARK: - ScaleButtonStyle ya está definido en ModuloBase.swift

// MARK: - Preview
struct Capa2PrincipiosView_Previews: PreviewProvider {
    static var previews: some View {
        Capa2PrincipiosView()
    }
}