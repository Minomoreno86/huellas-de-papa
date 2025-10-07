import SwiftUI

// MARK: - Capa 3: Vista de Herramientas Prácticas
// Vista principal que aplica SuperDesign para crear una experiencia
// emocionalmente atractiva y funcionalmente efectiva.

struct Capa3HerramientasView: View {
    @EnvironmentObject private var progresoManager: ProgresoManager
    @State private var capa3: Capa3Herramientas?
    @State private var herramientaSeleccionada: Capa3Tool?
    @State private var mostrarDetalle = false
    @State private var categoriaFiltro: CategoriaHerramienta?
    @State private var animacionEntrada = false
    @State private var scrollOffset: CGFloat = 0
    
    var herramientasFiltradas: [Capa3Tool] {
        guard let capa3 = capa3 else { return [] }
        if let categoria = categoriaFiltro {
            return capa3.herramientas.filter { $0.categoria == categoria }
        }
        return capa3.herramientas
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                // Fondo con gradiente dinámico
                LinearGradient(
                    gradient: Gradient(colors: [
                        Color.blue.opacity(0.1),
                        Color.purple.opacity(0.05),
                        Color.mint.opacity(0.1)
                    ]),
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
                .ignoresSafeArea()
                
                ScrollView {
                    LazyVStack(spacing: 20) {
                        if let capa3 = capa3 {
                            // Header con animación de entrada
                            headerSection(capa3: capa3)
                                .opacity(animacionEntrada ? 1 : 0)
                                .offset(y: animacionEntrada ? 0 : -30)
                                .animation(.spring(response: 0.8, dampingFraction: 0.8), value: animacionEntrada)
                            
                            // Filtros de categoría con diseño fluido
                            filtrosSection()
                                .opacity(animacionEntrada ? 1 : 0)
                                .offset(y: animacionEntrada ? 0 : -20)
                                .animation(.spring(response: 0.8, dampingFraction: 0.8).delay(0.2), value: animacionEntrada)
                            
                            // Lista de herramientas con animación escalonada
                            herramientasSection()
                                .opacity(animacionEntrada ? 1 : 0)
                                .offset(y: animacionEntrada ? 0 : -10)
                                .animation(.spring(response: 0.8, dampingFraction: 0.8).delay(0.4), value: animacionEntrada)
                        } else {
                            // Estado de carga con animación
                            loadingState()
                        }
                    }
                    .padding(.horizontal, 16)
                    .padding(.top, 20)
                }
                .background(
                    GeometryReader { geometry in
                        Color.clear
                            .preference(key: ScrollOffsetPreferenceKey.self, value: geometry.frame(in: .named("scroll")).minY)
                    }
                )
                .coordinateSpace(name: "scroll")
                .onPreferenceChange(ScrollOffsetPreferenceKey.self) { value in
                    scrollOffset = value
                }
            }
            .navigationTitle("Herramientas Prácticas")
            .navigationBarTitleDisplayMode(.large)
            .onAppear {
                if capa3 == nil {
                    capa3 = Capa3Herramientas.contenidoCerebroDelNino()
                }
                
                // Animación de entrada
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                    animacionEntrada = true
                }
            }
        }
        .sheet(isPresented: $mostrarDetalle) {
            if let herramienta = herramientaSeleccionada {
                HerramientaDetalleView(herramienta: herramienta)
            }
        }
    }
    
    // MARK: - Header Section
    @ViewBuilder
    private func headerSection(capa3: Capa3Herramientas) -> some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack {
                Image(systemName: "wrench.and.screwdriver.fill")
                    .font(.title)
                    .foregroundStyle(
                        LinearGradient(
                            colors: [.blue, .purple],
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                    )
                
                VStack(alignment: .leading, spacing: 4) {
                    Text("Herramientas Prácticas")
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(.primary)
                    
                    Text("Traducir teoría en acción")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
                
                Spacer()
            }
            
            Text(capa3.introduccion)
                .font(.body)
                .foregroundColor(.secondary)
                .lineSpacing(4)
                .multilineTextAlignment(.leading)
        }
        .padding(20)
        .background(
            RoundedRectangle(cornerRadius: 20)
                .fill(.ultraThinMaterial)
                .shadow(color: .black.opacity(0.1), radius: 10, x: 0, y: 5)
        )
    }
    
    // MARK: - Filtros Section
    @ViewBuilder
    private func filtrosSection() -> some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Explorar por categoría")
                .font(.headline)
                .fontWeight(.semibold)
                .foregroundColor(.primary)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 12) {
                    // Botón "Todas"
                    filtroButton(
                        titulo: "Todas",
                        isSelected: categoriaFiltro == nil,
                        color: .blue
                    ) {
                        withAnimation(.spring(response: 0.5, dampingFraction: 0.8)) {
                            categoriaFiltro = nil
                        }
                    }
                    
                    // Botones de categoría
                    ForEach(CategoriaHerramienta.allCases, id: \.self) { categoria in
                        filtroButton(
                            titulo: categoria.rawValue,
                            isSelected: categoriaFiltro == categoria,
                            color: colorForCategoria(categoria)
                        ) {
                            withAnimation(.spring(response: 0.5, dampingFraction: 0.8)) {
                                categoriaFiltro = categoria
                            }
                        }
                    }
                }
                .padding(.horizontal, 16)
            }
        }
    }
    
    // MARK: - Herramientas Section
    @ViewBuilder
    private func herramientasSection() -> some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack {
                Text("Herramientas disponibles")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .foregroundColor(.primary)
                
                Spacer()
                
                Text("\(herramientasFiltradas.count)")
                    .font(.caption)
                    .fontWeight(.medium)
                    .foregroundColor(.secondary)
                    .padding(.horizontal, 8)
                    .padding(.vertical, 4)
                    .background(Color.secondary.opacity(0.1))
                    .cornerRadius(8)
            }
            
            LazyVStack(spacing: 16) {
                ForEach(Array(herramientasFiltradas.enumerated()), id: \.element.id) { index, herramienta in
                    HerramientaCard(
                        herramienta: herramienta,
                        index: index + 1
                    ) {
                        herramientaSeleccionada = herramienta
                        mostrarDetalle = true
                    }
                    .opacity(animacionEntrada ? 1 : 0)
                    .offset(y: animacionEntrada ? 0 : 20)
                    .animation(
                        .spring(response: 0.6, dampingFraction: 0.8)
                        .delay(Double(index) * 0.1 + 0.6),
                        value: animacionEntrada
                    )
                }
            }
        }
    }
    
    // MARK: - Loading State
    @ViewBuilder
    private func loadingState() -> some View {
        VStack(spacing: 20) {
            ProgressView()
                .scaleEffect(1.2)
                .tint(.blue)
            
            Text("Cargando herramientas...")
                .font(.headline)
                .foregroundColor(.secondary)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
    
    // MARK: - Helper Views
    @ViewBuilder
    private func filtroButton(
        titulo: String,
        isSelected: Bool,
        color: Color,
        action: @escaping () -> Void
    ) -> some View {
        Button(action: action) {
            Text(titulo)
                .font(.caption)
                .fontWeight(.medium)
                .foregroundColor(isSelected ? .white : color)
                .padding(.horizontal, 16)
                .padding(.vertical, 8)
                .background(
                    RoundedRectangle(cornerRadius: 20)
                        .fill(isSelected ? color : color.opacity(0.1))
                )
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(color.opacity(0.3), lineWidth: 1)
                )
        }
        .buttonStyle(ScaleButtonStyle())
    }
    
    private func colorForCategoria(_ categoria: CategoriaHerramienta) -> Color {
        switch categoria {
        case .regulacionEmocional: return .red
        case .comunicacion: return .blue
        case .disciplina: return .orange
        case .juego: return .green
        case .mindfulness: return .purple
        case .creatividad: return .pink
        case .socializacion: return .cyan
        case .aprendizaje: return .indigo
        case .vínculo: return .mint
        case .autorregulacion: return .teal
        }
    }
}

// MARK: - Herramienta Card
struct HerramientaCard: View {
    let herramienta: Capa3Tool
    let index: Int
    let onTap: () -> Void
    
    @State private var isPressed = false
    
    var body: some View {
        Button(action: onTap) {
            VStack(alignment: .leading, spacing: 16) {
                // Header con gradiente y número
                HStack {
                    ZStack {
                        Circle()
                            .fill(
                                LinearGradient(
                                    colors: [Color(herramienta.color), Color(herramienta.color).opacity(0.7)],
                                    startPoint: .topLeading,
                                    endPoint: .bottomTrailing
                                )
                            )
                            .frame(width: 40, height: 40)
                        
                        Text("\(index)")
                            .font(.headline)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                    }
                    
                    VStack(alignment: .leading, spacing: 4) {
                        Text(herramienta.nombre)
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
                    
                    VStack(spacing: 4) {
                        Image(systemName: "arrow.right.circle.fill")
                            .font(.title2)
                            .foregroundColor(Color(herramienta.color))
                        
                        Text("Practicar")
                            .font(.caption2)
                            .foregroundColor(Color(herramienta.color))
                    }
                }
                
                // Contenido
                VStack(alignment: .leading, spacing: 12) {
                    Text(herramienta.propositoClinico)
                        .font(.body)
                        .foregroundColor(.secondary)
                        .lineLimit(3)
                        .multilineTextAlignment(.leading)
                        .lineSpacing(2)
                    
                    // Información adicional
                    HStack {
                        Label("\(herramienta.tiempoEstimado) min", systemImage: "clock")
                            .font(.caption)
                            .foregroundColor(.secondary)
                        
                        Spacer()
                        
                        Label(herramienta.dificultad.rawValue, systemImage: "chart.bar")
                            .font(.caption)
                            .foregroundColor(.secondary)
                    }
                }
                
                // Barra de progreso visual
                HStack {
                    ForEach(0..<5) { _ in
                        Circle()
                            .fill(Color(herramienta.color).opacity(0.3))
                            .frame(width: 6, height: 6)
                    }
                    
                    Spacer()
                    
                    Text("Toca para comenzar")
                        .font(.caption2)
                        .foregroundColor(.secondary)
                }
            }
            .padding(20)
            .background(
                RoundedRectangle(cornerRadius: 20)
                    .fill(.ultraThinMaterial)
                    .shadow(color: .black.opacity(0.1), radius: 8, x: 0, y: 4)
            )
            .overlay(
                RoundedRectangle(cornerRadius: 20)
                    .stroke(
                        LinearGradient(
                            colors: [Color(herramienta.color).opacity(0.3), Color(herramienta.color).opacity(0.1)],
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        ),
                        lineWidth: 1
                    )
            )
            .scaleEffect(isPressed ? 0.98 : 1.0)
        }
        .buttonStyle(PlainButtonStyle())
        .onLongPressGesture(minimumDuration: 0, maximumDistance: .infinity, pressing: { pressing in
            withAnimation(.easeInOut(duration: 0.1)) {
                isPressed = pressing
            }
        }, perform: {})
    }
}

// MARK: - Herramienta Detalle View
struct HerramientaDetalleView: View {
    let herramienta: Capa3Tool
    @Environment(\.dismiss) private var dismiss
    @EnvironmentObject private var progresoManager: ProgresoManager
    @State private var pasoActual = 0
    @State private var pasosCompletados: Set<Int> = []
    @State private var mostrarFeedback = false
    @State private var animacionPaso = false
    @State private var mostrarAdaptaciones = false
    @State private var herramientaCompletada = false
    
    var progreso: Double {
        guard !herramienta.pasos.isEmpty else { return 0 }
        return Double(pasosCompletados.count) / Double(herramienta.pasos.count)
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                // Fondo con gradiente
                LinearGradient(
                    gradient: Gradient(colors: [
                        Color(herramienta.color).opacity(0.1),
                        Color(herramienta.color).opacity(0.05)
                    ]),
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
                .ignoresSafeArea()
                
                ScrollView {
                    LazyVStack(spacing: 24) {
                        // Header de la herramienta
                        headerHerramienta()
                        
                        // Barra de progreso
                        barraProgreso()
                        
                        // Paso actual
                        pasoActualView()
                        
                        // Navegación de pasos
                        navegacionPasos()
                        
                        // Adaptaciones por edad
                        adaptacionesSection()
                        
                        // Feedback y reflexión
                        feedbackSection()
                        
                        // Celebración de completado
                        if herramientaCompletada {
                            celebracionSection()
                        }
                    }
                    .padding(.horizontal, 16)
                    .padding(.top, 20)
                }
            }
            .navigationTitle(herramienta.nombre)
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
        .onAppear {
            animacionPaso = true
        }
    }
    
    // MARK: - Header de Herramienta
    @ViewBuilder
    private func headerHerramienta() -> some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack {
                Image(systemName: herramienta.icono)
                    .font(.largeTitle)
                    .foregroundColor(Color(herramienta.color))
                
                VStack(alignment: .leading, spacing: 4) {
                    Text(herramienta.nombre)
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(.primary)
                    
                    Text(herramienta.categoria.rawValue)
                        .font(.subheadline)
                        .foregroundColor(Color(herramienta.color))
                        .fontWeight(.medium)
                }
                
                Spacer()
            }
            
            Text(herramienta.propositoClinico)
                .font(.body)
                .foregroundColor(.secondary)
                .lineSpacing(4)
        }
        .padding(20)
        .background(
            RoundedRectangle(cornerRadius: 20)
                .fill(.ultraThinMaterial)
                .shadow(color: .black.opacity(0.1), radius: 10, x: 0, y: 5)
        )
    }
    
    // MARK: - Barra de Progreso
    @ViewBuilder
    private func barraProgreso() -> some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                Text("Progreso")
                    .font(.headline)
                    .fontWeight(.semibold)
                
                Spacer()
                
                Text("\(pasosCompletados.count)/\(herramienta.pasos.count)")
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
            
            ProgressView(value: progreso)
                .progressViewStyle(LinearProgressViewStyle(tint: Color(herramienta.color)))
                .scaleEffect(x: 1, y: 2, anchor: .center)
        }
        .padding(16)
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(.ultraThinMaterial)
        )
    }
    
    // MARK: - Paso Actual
    @ViewBuilder
    private func pasoActualView() -> some View {
        if pasoActual < herramienta.pasos.count {
            let paso = herramienta.pasos[pasoActual]
            
            VStack(alignment: .leading, spacing: 16) {
                HStack {
                    ZStack {
                        Circle()
                            .fill(
                                pasosCompletados.contains(pasoActual) 
                                ? Color.green 
                                : Color(herramienta.color)
                            )
                            .frame(width: 50, height: 50)
                        
                        Image(systemName: pasosCompletados.contains(pasoActual) ? "checkmark" : paso.icono)
                            .font(.title2)
                            .foregroundColor(.white)
                    }
                    
                    VStack(alignment: .leading, spacing: 4) {
                        Text("Paso \(paso.numero)")
                            .font(.caption)
                            .foregroundColor(.secondary)
                        
                        Text(paso.titulo)
                            .font(.headline)
                            .fontWeight(.semibold)
                            .foregroundColor(.primary)
                    }
                    
                    Spacer()
                }
                
                Text(paso.descripcion)
                    .font(.body)
                    .foregroundColor(.secondary)
                    .lineSpacing(4)
                
                // Instrucción del paso
                VStack(alignment: .leading, spacing: 8) {
                    Text("Instrucción:")
                        .font(.subheadline)
                        .fontWeight(.medium)
                        .foregroundColor(.primary)
                    
                    Text(paso.instruccion)
                        .font(.body)
                        .foregroundColor(.primary)
                        .padding(12)
                        .background(Color(herramienta.color).opacity(0.1))
                        .cornerRadius(8)
                }
                
                // Consejos prácticos
                if !paso.consejosPracticos.isEmpty {
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Consejos prácticos:")
                            .font(.subheadline)
                            .fontWeight(.medium)
                            .foregroundColor(.primary)
                        
                        ForEach(paso.consejosPracticos, id: \.self) { consejo in
                            HStack(alignment: .top, spacing: 8) {
                                Image(systemName: "lightbulb.fill")
                                    .foregroundColor(.yellow)
                                    .font(.caption)
                                
                                Text(consejo)
                                    .font(.caption)
                                    .foregroundColor(.secondary)
                            }
                        }
                    }
                }
                
                // Botón de acción
                Button(action: {
                    withAnimation(.spring(response: 0.6, dampingFraction: 0.8)) {
                        if pasosCompletados.contains(pasoActual) {
                            pasosCompletados.remove(pasoActual)
                        } else {
                            pasosCompletados.insert(pasoActual)
                            
                            // Verificar si se completó toda la herramienta
                            if pasosCompletados.count == herramienta.pasos.count && !herramientaCompletada {
                                herramientaCompletada = true
                                // Actualizar progreso en el manager
                                progresoManager.agregarPuntos(50) // 50 puntos por completar una herramienta
                                progresoManager.actualizarProgreso(capaId: "capa3", completada: true)
                            }
                        }
                    }
                }) {
                    HStack {
                        Image(systemName: pasosCompletados.contains(pasoActual) ? "arrow.uturn.backward" : "checkmark")
                        Text(pasosCompletados.contains(pasoActual) ? "Desmarcar" : "Completar paso")
                    }
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 12)
                            .fill(pasosCompletados.contains(pasoActual) ? Color.orange : Color(herramienta.color))
                    )
                }
                .buttonStyle(ScaleButtonStyle())
            }
            .padding(20)
            .background(
                RoundedRectangle(cornerRadius: 20)
                    .fill(.ultraThinMaterial)
                    .shadow(color: .black.opacity(0.1), radius: 8, x: 0, y: 4)
            )
            .opacity(animacionPaso ? 1 : 0)
            .offset(y: animacionPaso ? 0 : 20)
            .animation(.spring(response: 0.8, dampingFraction: 0.8), value: animacionPaso)
        }
    }
    
    // MARK: - Navegación de Pasos
    @ViewBuilder
    private func navegacionPasos() -> some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Navegación")
                .font(.headline)
                .fontWeight(.semibold)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 12) {
                    ForEach(herramienta.pasos.indices, id: \.self) { index in
                        Button(action: {
                            withAnimation(.spring(response: 0.5, dampingFraction: 0.8)) {
                                pasoActual = index
                                animacionPaso = false
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                                    animacionPaso = true
                                }
                            }
                        }) {
                            VStack(spacing: 8) {
                                ZStack {
                                    Circle()
                                        .fill(
                                            index == pasoActual 
                                            ? Color(herramienta.color)
                                            : pasosCompletados.contains(index)
                                            ? Color.green
                                            : Color.gray.opacity(0.3)
                                        )
                                        .frame(width: 40, height: 40)
                                    
                                    if pasosCompletados.contains(index) {
                                        Image(systemName: "checkmark")
                                            .foregroundColor(.white)
                                    } else {
                                        Text("\(index + 1)")
                                            .font(.headline)
                                            .fontWeight(.bold)
                                            .foregroundColor(.white)
                                    }
                                }
                                
                                Text(herramienta.pasos[index].titulo)
                                    .font(.caption)
                                    .foregroundColor(.primary)
                                    .multilineTextAlignment(.center)
                                    .lineLimit(2)
                            }
                            .frame(width: 80)
                        }
                        .buttonStyle(PlainButtonStyle())
                    }
                }
                .padding(.horizontal, 16)
            }
        }
        .padding(16)
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(.ultraThinMaterial)
        )
    }
    
    // MARK: - Adaptaciones por Edad
    @ViewBuilder
    private func adaptacionesSection() -> some View {
        VStack(alignment: .leading, spacing: 12) {
            Button(action: {
                withAnimation(.spring(response: 0.6, dampingFraction: 0.8)) {
                    mostrarAdaptaciones.toggle()
                }
            }) {
                HStack {
                    Image(systemName: "person.2.fill")
                        .foregroundColor(.blue)
                    Text("Adaptaciones por Edad")
                        .font(.headline)
                        .fontWeight(.semibold)
                        .foregroundColor(.primary)
                    
                    Spacer()
                    
                    Image(systemName: mostrarAdaptaciones ? "chevron.up" : "chevron.down")
                        .foregroundColor(.blue)
                }
            }
            .buttonStyle(PlainButtonStyle())
            
            if mostrarAdaptaciones {
                VStack(alignment: .leading, spacing: 12) {
                    ForEach(herramienta.adaptacionesEdad, id: \.id) { adaptacion in
                        VStack(alignment: .leading, spacing: 8) {
                            Text(adaptacion.rangoEdad)
                                .font(.subheadline)
                                .fontWeight(.semibold)
                                .foregroundColor(.primary)
                            
                            if !adaptacion.modificaciones.isEmpty {
                                Text("Modificaciones:")
                                    .font(.caption)
                                    .fontWeight(.medium)
                                    .foregroundColor(.secondary)
                                
                                ForEach(adaptacion.modificaciones, id: \.self) { modificacion in
                                    HStack(alignment: .top, spacing: 8) {
                                        Image(systemName: "circle.fill")
                                            .foregroundColor(.blue)
                                            .font(.caption)
                                        Text(modificacion)
                                            .font(.caption)
                                            .foregroundColor(.secondary)
                                    }
                                }
                            }
                        }
                        .padding(12)
                        .background(Color.blue.opacity(0.1))
                        .cornerRadius(8)
                    }
                }
                .transition(.asymmetric(
                    insertion: .opacity.combined(with: .move(edge: .top)),
                    removal: .opacity.combined(with: .move(edge: .top))
                ))
            }
        }
        .padding(16)
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(.ultraThinMaterial)
        )
    }
    
    // MARK: - Feedback Section
    @ViewBuilder
    private func feedbackSection() -> some View {
        VStack(alignment: .leading, spacing: 12) {
            Button(action: {
                withAnimation(.spring(response: 0.6, dampingFraction: 0.8)) {
                    mostrarFeedback.toggle()
                }
            }) {
                HStack {
                    Image(systemName: "star.fill")
                        .foregroundColor(.yellow)
                    Text("Reflexión y Feedback")
                        .font(.headline)
                        .fontWeight(.semibold)
                        .foregroundColor(.primary)
                    
                    Spacer()
                    
                    Image(systemName: mostrarFeedback ? "chevron.up" : "chevron.down")
                        .foregroundColor(.yellow)
                }
            }
            .buttonStyle(PlainButtonStyle())
            
            if mostrarFeedback {
                VStack(alignment: .leading, spacing: 16) {
                    // Mensajes positivos
                    if !herramienta.feedback.mensajesPositivos.isEmpty {
                        VStack(alignment: .leading, spacing: 8) {
                            Text("Mensajes de apoyo:")
                                .font(.subheadline)
                                .fontWeight(.semibold)
                                .foregroundColor(.primary)
                            
                            ForEach(herramienta.feedback.mensajesPositivos, id: \.self) { mensaje in
                                HStack(alignment: .top, spacing: 8) {
                                    Image(systemName: "heart.fill")
                                        .foregroundColor(.pink)
                                        .font(.caption)
                                    Text(mensaje)
                                        .font(.body)
                                        .foregroundColor(.primary)
                                }
                            }
                        }
                        .padding(12)
                        .background(Color.pink.opacity(0.1))
                        .cornerRadius(8)
                    }
                    
                    // Preguntas de reflexión
                    if !herramienta.feedback.preguntasReflexion.isEmpty {
                        VStack(alignment: .leading, spacing: 8) {
                            Text("Preguntas para reflexionar:")
                                .font(.subheadline)
                                .fontWeight(.semibold)
                                .foregroundColor(.primary)
                            
                            ForEach(herramienta.feedback.preguntasReflexion, id: \.self) { pregunta in
                                HStack(alignment: .top, spacing: 8) {
                                    Image(systemName: "questionmark.circle.fill")
                                        .foregroundColor(.blue)
                                        .font(.caption)
                                    Text(pregunta)
                                        .font(.body)
                                        .foregroundColor(.primary)
                                }
                            }
                        }
                        .padding(12)
                        .background(Color.blue.opacity(0.1))
                        .cornerRadius(8)
                    }
                }
                .transition(.asymmetric(
                    insertion: .opacity.combined(with: .move(edge: .top)),
                    removal: .opacity.combined(with: .move(edge: .top))
                ))
            }
        }
        .padding(16)
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(.ultraThinMaterial)
        )
    }
    
    // MARK: - Celebración Section
    @ViewBuilder
    private func celebracionSection() -> some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack {
                Image(systemName: "trophy.fill")
                    .font(.title)
                    .foregroundColor(.yellow)
                
                VStack(alignment: .leading, spacing: 4) {
                    Text("¡Herramienta Completada!")
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(.primary)
                    
                    Text("Has dominado esta técnica de crianza")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
                
                Spacer()
            }
            
            VStack(alignment: .leading, spacing: 12) {
                Text("Logros obtenidos:")
                    .font(.headline)
                    .fontWeight(.semibold)
                    .foregroundColor(.primary)
                
                ForEach(herramienta.feedback.celebracionLogros, id: \.self) { logro in
                    HStack(alignment: .top, spacing: 8) {
                        Image(systemName: "star.fill")
                            .foregroundColor(.yellow)
                            .font(.caption)
                        Text(logro)
                            .font(.body)
                            .foregroundColor(.primary)
                    }
                }
            }
            .padding(12)
            .background(Color.yellow.opacity(0.1))
            .cornerRadius(8)
            
            HStack {
                Text("Puntos ganados: 50")
                    .font(.subheadline)
                    .fontWeight(.medium)
                    .foregroundColor(.green)
                
                Spacer()
                
                Text("¡Sigue así!")
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
        }
        .padding(20)
        .background(
            RoundedRectangle(cornerRadius: 20)
                .fill(
                    LinearGradient(
                        colors: [Color.yellow.opacity(0.1), Color.orange.opacity(0.05)],
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                )
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(Color.yellow.opacity(0.3), lineWidth: 2)
                )
        )
        .shadow(color: .yellow.opacity(0.2), radius: 10, x: 0, y: 5)
    }
}

// MARK: - Supporting Views

struct ScrollOffsetPreferenceKey: PreferenceKey {
    static var defaultValue: CGFloat = 0
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}

#Preview {
    Capa3HerramientasView()
        .environmentObject(ProgresoManager())
}