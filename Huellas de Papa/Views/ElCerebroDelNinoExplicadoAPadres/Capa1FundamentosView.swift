import SwiftUI

// MARK: - CAPA 1 VIEW: FUNDAMENTOS DEL LIBRO
/// Vista principal de la Capa 1 con diseño SuperDesign
/// Implementa navegación por secciones, transiciones suaves y feedback háptico
struct Capa1FundamentosView: View {
    @EnvironmentObject private var progresoManager: ProgresoManager
    @State private var capa1: Capa1Fundamentos?
    @State private var seccionActiva: SeccionCapa1 = .contexto
    @State private var mostrarDetalle = false
    @State private var elementoSeleccionado: Any?
    @State private var propositoExpandido = false
    @State private var marcoExpandido = false
    @State private var importanciaExpandida = false
    @State private var enfoqueExpandido = false
    
    enum SeccionCapa1: String, CaseIterable {
        case contexto = "Contexto"
        case principios = "Principios"
        case ejes = "Ejes"
        case errores = "Errores"
        case mantras = "Mantras"
        case visuales = "Visuales"
    }
    
    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                // Navegación horizontal por secciones
                tabNavigationView
                
                // Contenido de la sección activa con scroll
            ScrollView {
                    VStack(spacing: 20) {
                        switch seccionActiva {
                        case .contexto:
                            contextoSection
                        case .principios:
                            principiosSection
                        case .ejes:
                            ejesSection
                        case .errores:
                            erroresSection
                        case .mantras:
                            mantrasSection
                        case .visuales:
                            visualesSection
                        }
                    }
                    .padding()
                    .padding(.bottom, 40)
                }
            }
            .navigationTitle("Capa 1: Fundamentos")
            .navigationBarTitleDisplayMode(.inline)
            .onAppear {
                cargarContenido()
            }
        }
        .sheet(isPresented: $mostrarDetalle) {
            detalleView
        }
    }
    
    // MARK: - Tab Navigation View
    private var tabNavigationView: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 12) {
                ForEach(SeccionCapa1.allCases, id: \.self) { seccion in
                    Button(action: {
                        withAnimation(.spring(response: 0.6, dampingFraction: 0.8)) {
                            seccionActiva = seccion
                        }
                    }) {
                        VStack(spacing: 4) {
                            Image(systemName: iconoParaSeccion(seccion))
                                .font(.title3)
                            
                            Text(seccion.rawValue)
                                .font(.caption)
                                .fontWeight(.medium)
                        }
                        .foregroundColor(seccionActiva == seccion ? .white : .primary)
                        .padding(.horizontal, 16)
                        .padding(.vertical, 12)
                        .background(
                            RoundedRectangle(cornerRadius: 12)
                                .fill(seccionActiva == seccion ? 
                                    LinearGradient(colors: [.blue, .purple], startPoint: .leading, endPoint: .trailing) :
                                    LinearGradient(colors: [Color(.systemGray6)], startPoint: .leading, endPoint: .trailing)
                                )
                        )
                    }
                    .buttonStyle(ScaleButtonStyle())
                }
            }
            .padding(.horizontal)
        }
        .padding(.vertical, 8)
    }
    
    // MARK: - Secciones de Contenido (Placeholders)
    
    private var contextoSection: some View {
        VStack(alignment: .leading, spacing: 20) {
            // Header de la sección
                        HStack {
                Image(systemName: "book.fill")
                    .font(.title2)
                                .foregroundColor(.blue)
                            
                Text("Contexto General")
                                    .font(.title2)
                                    .fontWeight(.bold)
                                
                Spacer()
            }
            
            if let context = capa1?.context {
                // Contenido directo sin tarjeta principal
                VStack(alignment: .leading, spacing: 24) {
                    // Propósito del libro (expandible)
                    VStack(alignment: .leading, spacing: 12) {
                        Button(action: {
                            withAnimation(.spring(response: 0.6, dampingFraction: 0.8)) {
                                propositoExpandido.toggle()
                            }
                        }) {
                            HStack {
                                Image(systemName: "target")
                                    .foregroundColor(.green)
                                Text("Propósito")
                                    .font(.headline)
                                    .fontWeight(.semibold)
                                    .foregroundColor(.primary)
                            
                            Spacer()
                            
                                Image(systemName: propositoExpandido ? "chevron.up" : "chevron.down")
                                    .foregroundColor(.green)
                                    .font(.title3)
                            }
                        }
                        .buttonStyle(PlainButtonStyle())
                        
                        if propositoExpandido {
                            Text(context.proposito)
                                .font(.body)
                                .lineSpacing(4)
                                .foregroundColor(.primary)
                                .fixedSize(horizontal: false, vertical: true)
                                .transition(.asymmetric(
                                    insertion: .opacity.combined(with: .move(edge: .top)),
                                    removal: .opacity.combined(with: .move(edge: .top))
                                ))
                        }
                    }
                    .padding(20)
                    .background(Color.green.opacity(0.1))
                    .cornerRadius(12)
                    
                    // Marco conceptual (expandible)
                    VStack(alignment: .leading, spacing: 12) {
                        Button(action: {
                            withAnimation(.spring(response: 0.6, dampingFraction: 0.8)) {
                                marcoExpandido.toggle()
                            }
                        }) {
                        HStack {
                                Image(systemName: "atom")
                                    .foregroundColor(.purple)
                                Text("Marco Conceptual")
                                    .font(.headline)
                                    .fontWeight(.semibold)
                                    .foregroundColor(.primary)
                                
                                Spacer()
                                
                                Image(systemName: marcoExpandido ? "chevron.up" : "chevron.down")
                                    .foregroundColor(.purple)
                                .font(.title3)
                            }
                        }
                        .buttonStyle(PlainButtonStyle())
                        
                        if marcoExpandido {
                            Text(context.marcoConceptual)
                                .font(.body)
                                .lineSpacing(4)
                                .foregroundColor(.primary)
                                .fixedSize(horizontal: false, vertical: true)
                                .transition(.asymmetric(
                                    insertion: .opacity.combined(with: .move(edge: .top)),
                                    removal: .opacity.combined(with: .move(edge: .top))
                                ))
                        }
                    }
                    .padding(20)
                    .background(Color.purple.opacity(0.1))
                    .cornerRadius(12)
                    
                    // Importancia (expandible)
                    VStack(alignment: .leading, spacing: 12) {
                        Button(action: {
                            withAnimation(.spring(response: 0.6, dampingFraction: 0.8)) {
                                importanciaExpandida.toggle()
                            }
                        }) {
                            HStack {
                                Image(systemName: "exclamationmark.triangle.fill")
                                    .foregroundColor(.orange)
                                Text("Importancia")
                                    .font(.headline)
                                    .fontWeight(.semibold)
                                    .foregroundColor(.primary)
                            
                            Spacer()
                            
                                Image(systemName: importanciaExpandida ? "chevron.up" : "chevron.down")
                                    .foregroundColor(.orange)
                                    .font(.title3)
                            }
                        }
                        .buttonStyle(PlainButtonStyle())
                        
                        if importanciaExpandida {
                            Text(context.importancia)
                                .font(.body)
                                .lineSpacing(4)
                                .foregroundColor(.primary)
                                .fixedSize(horizontal: false, vertical: true)
                                .transition(.asymmetric(
                                    insertion: .opacity.combined(with: .move(edge: .top)),
                                    removal: .opacity.combined(with: .move(edge: .top))
                                ))
                        }
                    }
                    .padding(20)
                    .background(Color.orange.opacity(0.1))
                    .cornerRadius(12)
                    
                    // Enfoque (expandible)
                    VStack(alignment: .leading, spacing: 12) {
                        Button(action: {
                            withAnimation(.spring(response: 0.6, dampingFraction: 0.8)) {
                                enfoqueExpandido.toggle()
                            }
                        }) {
                            HStack {
                                Image(systemName: "lightbulb.fill")
                                    .foregroundColor(.yellow)
                                Text("Enfoque")
                                    .font(.headline)
                                    .fontWeight(.semibold)
                                    .foregroundColor(.primary)
                                
                                Spacer()
                                
                                Image(systemName: enfoqueExpandido ? "chevron.up" : "chevron.down")
                                    .foregroundColor(.yellow)
                                    .font(.title3)
                            }
                        }
                        .buttonStyle(PlainButtonStyle())
                        
                        if enfoqueExpandido {
                            Text(context.enfoque)
                                .font(.body)
                                .lineSpacing(4)
                                .foregroundColor(.primary)
                                .fixedSize(horizontal: false, vertical: true)
                                .transition(.asymmetric(
                                    insertion: .opacity.combined(with: .move(edge: .top)),
                                    removal: .opacity.combined(with: .move(edge: .top))
                                ))
                        }
                    }
                    .padding(20)
                    .background(Color.yellow.opacity(0.1))
                    .cornerRadius(12)
                }
            } else {
                // Estado de carga
                VStack(spacing: 16) {
                    ProgressView()
                        .scaleEffect(1.2)
                    
                    Text("Cargando contexto...")
                        .font(.body)
                                .foregroundColor(.secondary)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .padding(40)
            }
        }
    }
    
    private var principiosSection: some View {
        VStack(alignment: .leading, spacing: 20) {
            // Header de la sección
            HStack {
                Image(systemName: "brain.head.profile")
                    .font(.title2)
                    .foregroundColor(.blue)
                
                Text("Principios Centrales")
                    .font(.title2)
                    .fontWeight(.bold)
                
                Spacer()
            }
            
            if let principles = capa1?.principles, !principles.isEmpty {
                LazyVStack(spacing: 20) {
                    ForEach(Array(principles.enumerated()), id: \.offset) { index, principle in
                        PrincipleCard(principle: principle, index: index + 1) {
                            elementoSeleccionado = principle
                                    mostrarDetalle = true
                                }
                    }
                }
            } else {
                // Estado de carga
                VStack(spacing: 16) {
                    ProgressView()
                        .scaleEffect(1.2)
                    
                    Text("Cargando principios...")
                        .font(.body)
                        .foregroundColor(.secondary)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .padding(40)
            }
        }
    }
    
    private var ejesSection: some View {
        VStack(alignment: .leading, spacing: 20) {
            // Header de la sección
                        HStack {
                Image(systemName: "bolt.fill")
                    .font(.title2)
                    .foregroundColor(.blue)
                
                Text("Ejes Neuroemocionales")
                    .font(.title2)
                                .fontWeight(.bold)
                            
                            Spacer()
            }
            
            if let axes = capa1?.axes, !axes.isEmpty {
                LazyVStack(spacing: 16) {
                    ForEach(Array(axes.enumerated()), id: \.offset) { index, axis in
                        AxisBadge(axis: axis, index: index + 1) {
                            elementoSeleccionado = axis
                            mostrarDetalle = true
                        }
                    }
                }
            } else {
                // Estado de carga
                VStack(spacing: 16) {
                    ProgressView()
                        .scaleEffect(1.2)
                    
                    Text("Cargando ejes neuroemocionales...")
                        .font(.body)
                                .foregroundColor(.secondary)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .padding(40)
            }
        }
    }
    
    private var erroresSection: some View {
        VStack(alignment: .leading, spacing: 20) {
            // Header de la sección
            HStack {
                Image(systemName: "exclamationmark.triangle.fill")
                    .font(.title2)
                    .foregroundColor(.red)
                
                Text("Errores Comunes de Crianza")
                    .font(.title2)
                    .fontWeight(.bold)
                
                Spacer()
            }
            
            if let pitfalls = capa1?.pitfalls, !pitfalls.isEmpty {
                LazyVStack(spacing: 16) {
                    ForEach(Array(pitfalls.enumerated()), id: \.offset) { index, pitfall in
                        PitfallCard(pitfall: pitfall, index: index + 1) {
                            elementoSeleccionado = pitfall
                                    mostrarDetalle = true
                                }
                    }
                }
            } else {
                // Estado de carga
                VStack(spacing: 16) {
                    ProgressView()
                        .scaleEffect(1.2)
                    
                    Text("Cargando errores comunes...")
                        .font(.body)
                        .foregroundColor(.secondary)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .padding(40)
            }
        }
    }
    
    private var mantrasSection: some View {
        VStack(alignment: .leading, spacing: 20) {
            // Header de la sección
            HStack {
                Image(systemName: "quote.bubble.fill")
                    .font(.title2)
                    .foregroundColor(.blue)
                
                Text("Frases Guía y Mantras")
                    .font(.title2)
                            .fontWeight(.bold)
                        
                Spacer()
            }
            
            if let mantras = capa1?.mantras, !mantras.isEmpty {
                MantraCarousel(mantras: mantras) { mantra in
                    elementoSeleccionado = mantra
                    mostrarDetalle = true
                }
            } else {
                // Estado de carga
                VStack(spacing: 16) {
                    ProgressView()
                        .scaleEffect(1.2)
                    
                    Text("Cargando frases guía...")
                            .font(.body)
                        .foregroundColor(.secondary)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .padding(40)
            }
        }
    }
    
    private var visualesSection: some View {
        VStack(alignment: .leading, spacing: 20) {
            // Header de la sección
            HStack {
                Image(systemName: "eye.fill")
                    .font(.title2)
                    .foregroundColor(.purple)
                
                Text("Ideas Visuales y Animaciones")
                    .font(.title2)
                            .fontWeight(.bold)
                        
                Spacer()
            }
            
            if let visualIdeas = capa1?.visualIdeas, !visualIdeas.isEmpty {
                LazyVStack(spacing: 16) {
                    ForEach(Array(visualIdeas.enumerated()), id: \.offset) { index, visualIdea in
                        VisualIdeaCard(visualIdea: visualIdea, index: index + 1) {
                            elementoSeleccionado = visualIdea
                            mostrarDetalle = true
                        }
                    }
                }
            } else {
                // Estado de carga
                VStack(spacing: 16) {
                    ProgressView()
                        .scaleEffect(1.2)
                    
                    Text("Cargando ideas visuales...")
                            .font(.body)
                        .foregroundColor(.secondary)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .padding(40)
            }
        }
    }
    
    
    // MARK: - Detalle View
    private var detalleView: some View {
        NavigationView {
            Group {
                if let principle = elementoSeleccionado as? Capa1Principle {
                    PrincipleDetalleView(principle: principle)
                } else if let axis = elementoSeleccionado as? Capa1Axis {
                    AxisDetalleView(axis: axis)
                } else if let pitfall = elementoSeleccionado as? Capa1Pitfall {
                    PitfallDetalleView(pitfall: pitfall)
                } else if let mantra = elementoSeleccionado as? Capa1Mantra {
                    MantraDetalleView(mantra: mantra)
                } else if let visualIdea = elementoSeleccionado as? Capa1VisualIdea {
                    VisualIdeaDetalleView(visualIdea: visualIdea)
                } else {
                    VStack {
                        Text("Vista de detalle")
                            .font(.title)
                        Text("El contenido detallado se implementará aquí...")
                            .foregroundColor(.secondary)
                    }
                }
            }
            .navigationTitle("Detalle")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Cerrar") {
                        mostrarDetalle = false
                    }
                }
            }
        }
    }
    
    // MARK: - Helper Functions
    
    private func cargarContenido() {
                    print("🔍 DEBUG: Cargando contenido de Capa1Fundamentos...")
        if capa1 == nil {
                    capa1 = Capa1Fundamentos.contenidoCerebroDelNino()
                    print("🔍 DEBUG: Contenido cargado exitosamente")
                }
            }
    
    private func iconoParaSeccion(_ seccion: SeccionCapa1) -> String {
        switch seccion {
        case .contexto: return "book.fill"
        case .principios: return "brain.head.profile"
        case .ejes: return "bolt.fill"
        case .errores: return "exclamationmark.triangle.fill"
        case .mantras: return "quote.bubble.fill"
        case .visuales: return "eye.fill"
        }
    }
    
}

// MARK: - Componentes de Vista

struct PrincipleCard: View {
    let principle: Capa1Principle
    let index: Int
    let onTap: () -> Void
    @State private var isExpanded = false
    
    var body: some View {
        Button(action: onTap) {
            VStack(alignment: .leading, spacing: 16) {
                // Header con gradiente
                HStack {
                    ZStack {
                        Circle()
                            .fill(
                                LinearGradient(
                                    gradient: Gradient(colors: [.blue, .purple]),
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
                        Text(principle.titulo)
                            .font(.headline)
                            .fontWeight(.semibold)
                            .foregroundColor(.primary)
                            .multilineTextAlignment(.leading)
                            .lineLimit(2)
                        
                        HStack {
                            Image(systemName: "atom")
                                .font(.caption)
                                .foregroundColor(.blue)
                            
                            Text("Principio Neurocientífico")
                                .font(.caption)
                                .foregroundColor(.blue)
                                .fontWeight(.medium)
                        }
                    }
                    
                    Spacer()
                    
                    VStack {
                        Image(systemName: "arrow.right.circle.fill")
                            .font(.title2)
                            .foregroundColor(.blue)
                        
                        Text("Explorar")
                            .font(.caption2)
                            .foregroundColor(.blue)
                    }
                }
                
                // Contenido con diseño mejorado
                VStack(alignment: .leading, spacing: 12) {
                    Text(principle.explicacion)
                        .font(.body)
                        .foregroundColor(.secondary)
                        .lineLimit(isExpanded ? nil : 3)
                        .multilineTextAlignment(.leading)
                        .lineSpacing(2)
                    
                    // Base científica
                    HStack {
                        Image(systemName: "flask.fill")
                            .font(.caption)
                            .foregroundColor(.purple)
                        
                        Text(principle.baseCientifica)
                            .font(.caption)
                            .foregroundColor(.purple)
                            .fontWeight(.medium)
                            .lineLimit(1)
                        
                        Spacer()
                    }
                    
                    // Indicadores de contenido
                    HStack(spacing: 16) {
                        HStack(spacing: 4) {
                        Image(systemName: "wrench.and.screwdriver.fill")
                            .font(.caption)
                            .foregroundColor(.green)
                        
                            Text("Aplicación práctica")
                            .font(.caption)
                            .foregroundColor(.green)
                            .fontWeight(.medium)
                        }
                        
                        HStack(spacing: 4) {
                            Image(systemName: "lightbulb.circle.fill")
                                .font(.caption)
                                .foregroundColor(.orange)
                            
                            Text("Ejemplos")
                                .font(.caption)
                                .foregroundColor(.orange)
                                .fontWeight(.medium)
                        }
                        
                        Spacer()
                    }
                }
                
                // Barra de progreso visual
                HStack {
                    ForEach(0..<5) { _ in
                        Circle()
                            .fill(Color.blue.opacity(0.3))
                            .frame(width: 6, height: 6)
                    }
                    
                    Spacer()
                    
                    Text("Toca para ver más")
                        .font(.caption2)
                        .foregroundColor(.secondary)
                }
            }
            .padding(20)
            .background(
                RoundedRectangle(cornerRadius: 16)
                    .fill(Color(.systemBackground))
                    .shadow(color: .black.opacity(0.08), radius: 8, x: 0, y: 4)
            )
            .overlay(
                RoundedRectangle(cornerRadius: 16)
                    .stroke(
                        LinearGradient(
                            gradient: Gradient(colors: [Color.blue.opacity(0.3), Color.purple.opacity(0.3)]),
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

struct PrincipleDetalleView: View {
    let principle: Capa1Principle
    @Environment(\.dismiss) private var dismiss
    @State private var mostrarAplicacion = false
    @State private var mostrarEjemplos = false
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 24) {
                // Header con gradiente
                VStack(alignment: .leading, spacing: 16) {
                HStack {
                        Image(systemName: "brain.head.profile")
                            .font(.largeTitle)
                            .foregroundColor(.blue)
                        
                        VStack(alignment: .leading, spacing: 4) {
                            Text("Principio Central")
                                .font(.title2)
                                .fontWeight(.bold)
                                .foregroundColor(.blue)
                            
                            Text("Neurociencia Práctica")
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                        }
                        
                        Spacer()
                    }
                    
                    Text(principle.titulo)
                        .font(.title)
                        .fontWeight(.bold)
                        .multilineTextAlignment(.leading)
                        .lineSpacing(4)
                }
                .padding(20)
                .background(
                                LinearGradient(
                        gradient: Gradient(colors: [Color.blue.opacity(0.1), Color.purple.opacity(0.1)]),
                                    startPoint: .topLeading,
                                    endPoint: .bottomTrailing
                                )
                            )
                .cornerRadius(16)
                
                // Explicación principal
                VStack(alignment: .leading, spacing: 12) {
                    HStack {
                        Image(systemName: "lightbulb.fill")
                            .foregroundColor(.yellow)
                        Text("Explicación Detallada")
                            .font(.headline)
                            .fontWeight(.semibold)
                    }
                    
                    Text(principle.explicacion)
                        .font(.body)
                        .lineSpacing(6)
                        .foregroundColor(.primary)
                        .fixedSize(horizontal: false, vertical: true)
                }
                .padding(16)
                .background(Color(.systemGray6))
                .cornerRadius(12)
                
                // Base científica
                VStack(alignment: .leading, spacing: 12) {
                    HStack {
                        Image(systemName: "atom")
                            .foregroundColor(.purple)
                        Text("Base Científica")
                            .font(.headline)
                            .fontWeight(.semibold)
                    }
                    
                    Text(principle.baseCientifica)
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
                
                // Aplicación práctica (expandible)
                VStack(alignment: .leading, spacing: 12) {
                    Button(action: {
                        withAnimation(.spring(response: 0.6, dampingFraction: 0.8)) {
                            mostrarAplicacion.toggle()
                        }
                    }) {
                        HStack {
                            Image(systemName: "wrench.and.screwdriver.fill")
                                .foregroundColor(.green)
                            Text("Aplicación Práctica")
                                .font(.headline)
                                .fontWeight(.semibold)
                                .foregroundColor(.primary)
                            
                            Spacer()
                            
                            Image(systemName: mostrarAplicacion ? "chevron.up" : "chevron.down")
                                .foregroundColor(.green)
                                .font(.title3)
                        }
                    }
                    .buttonStyle(PlainButtonStyle())
                    
                    if mostrarAplicacion {
                        VStack(alignment: .leading, spacing: 8) {
                            Text(principle.aplicacionPractica)
                                .font(.body)
                                .foregroundColor(.primary)
                                .lineSpacing(4)
                                .fixedSize(horizontal: false, vertical: true)
                            
                            // Botones de acción
                            HStack(spacing: 12) {
                                Button(action: {
                                    // Acción para marcar como completado
                                }) {
                                    HStack {
                                        Image(systemName: "checkmark.circle.fill")
                                        Text("Marcar como Completado")
                                    }
                            .font(.caption)
                            .foregroundColor(.white)
                                    .padding(.horizontal, 12)
                                    .padding(.vertical, 6)
                                    .background(Color.green)
                                    .cornerRadius(8)
                                }
                                
                                Button(action: {
                                    // Acción para compartir
                                }) {
                                    HStack {
                                        Image(systemName: "square.and.arrow.up")
                                        Text("Compartir")
                                    }
                                    .font(.caption)
                                    .foregroundColor(.blue)
                                    .padding(.horizontal, 12)
                                    .padding(.vertical, 6)
                                    .background(Color.blue.opacity(0.1))
                                    .cornerRadius(8)
                                }
                                
                                Spacer()
                            }
                            .padding(.top, 8)
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
                
                // Ejemplos concretos (expandible)
                VStack(alignment: .leading, spacing: 12) {
                    Button(action: {
                        withAnimation(.spring(response: 0.6, dampingFraction: 0.8)) {
                            mostrarEjemplos.toggle()
                        }
                    }) {
                        HStack {
                            Image(systemName: "lightbulb.circle.fill")
                                .foregroundColor(.orange)
                            Text("Ejemplos Concretos")
                                .font(.headline)
                                .fontWeight(.semibold)
                                .foregroundColor(.primary)
                            
                            Spacer()
                            
                            Image(systemName: mostrarEjemplos ? "chevron.up" : "chevron.down")
                                .foregroundColor(.orange)
                                .font(.title3)
                        }
                    }
                    .buttonStyle(PlainButtonStyle())
                    
                    if mostrarEjemplos {
                        VStack(alignment: .leading, spacing: 8) {
                            Text(principle.ejemplos)
                                .font(.body)
                                .foregroundColor(.primary)
                                .lineSpacing(4)
                                .fixedSize(horizontal: false, vertical: true)
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
                
                // Importancia
                VStack(alignment: .leading, spacing: 12) {
                    HStack {
                        Image(systemName: "exclamationmark.triangle.fill")
                            .foregroundColor(.red)
                        Text("Importancia")
                            .font(.headline)
                            .fontWeight(.semibold)
                    }
                    
                    Text(principle.importancia)
                        .font(.body)
                        .foregroundColor(.primary)
                        .lineSpacing(4)
                        .padding(.horizontal, 12)
                        .padding(.vertical, 8)
                        .background(Color.red.opacity(0.1))
                        .cornerRadius(8)
                }
                .padding(16)
                .background(Color(.systemBackground))
                .cornerRadius(12)
                .shadow(color: .black.opacity(0.05), radius: 4, x: 0, y: 2)
            }
            .padding()
        }
        .navigationTitle("Principio Central")
        .navigationBarTitleDisplayMode(.inline)
    }
}

// MARK: - AxisBadge Component
struct AxisBadge: View {
    let axis: Capa1Axis
    let index: Int
    let onTap: () -> Void
    @State private var isPressed = false
    
    var body: some View {
        Button(action: onTap) {
            VStack(alignment: .leading, spacing: 12) {
                // Header con icono temático
                HStack {
                    ZStack {
                        Circle()
                            .fill(iconoGradiente)
                            .frame(width: 36, height: 36)
                        
                        Image(systemName: iconoParaEje(axis.nombre))
                            .font(.system(size: 16, weight: .bold))
                            .foregroundColor(.white)
                    }
                    
                    VStack(alignment: .leading, spacing: 2) {
                        Text(axis.nombre)
                            .font(.headline)
                            .fontWeight(.semibold)
                            .foregroundColor(.primary)
                            .multilineTextAlignment(.leading)
                            .lineLimit(2)
                        
                        Text("Eje Neuroemocional")
                                .font(.caption)
                            .foregroundColor(.secondary)
                                .fontWeight(.medium)
                    }
                    
                    Spacer()
                    
                    VStack {
                        Image(systemName: "arrow.right.circle.fill")
                            .font(.title3)
                            .foregroundColor(iconoColor)
                        
                        Text("Explorar")
                            .font(.caption2)
                            .foregroundColor(iconoColor)
                    }
                }
                
                // Función principal
                VStack(alignment: .leading, spacing: 8) {
                    Text(axis.funcion)
                        .font(.body)
                        .foregroundColor(.secondary)
                        .lineLimit(3)
                        .multilineTextAlignment(.leading)
                        .lineSpacing(2)
                    
                    // Indicadores de contenido
                    HStack(spacing: 12) {
                        HStack(spacing: 4) {
                            Image(systemName: "clock.fill")
                            .font(.caption)
                                .foregroundColor(.blue)
                        
                            Text("Desarrollo")
                            .font(.caption)
                                .foregroundColor(.blue)
                            .fontWeight(.medium)
                        }
                        
                        HStack(spacing: 4) {
                            Image(systemName: "heart.fill")
                                .font(.caption)
                                .foregroundColor(.red)
                            
                            Text("Importancia")
                                .font(.caption)
                                .foregroundColor(.red)
                                .fontWeight(.medium)
                        }
                        
                        HStack(spacing: 4) {
                            Image(systemName: "sparkles")
                                .font(.caption)
                                .foregroundColor(.green)
                            
                            Text("Estimulación")
                                .font(.caption)
                                .foregroundColor(.green)
                                .fontWeight(.medium)
                        }
                        
                        Spacer()
                    }
                }
                
                // Barra de progreso visual
                HStack {
                    ForEach(0..<4) { _ in
                        Circle()
                            .fill(iconoColor.opacity(0.3))
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
                RoundedRectangle(cornerRadius: 14)
                    .fill(Color(.systemBackground))
                    .shadow(color: .black.opacity(0.06), radius: 6, x: 0, y: 3)
            )
            .overlay(
                RoundedRectangle(cornerRadius: 14)
                    .stroke(iconoGradiente, lineWidth: 1.5)
            )
        }
        .buttonStyle(ScaleButtonStyle())
        .scaleEffect(isPressed ? 0.95 : 1.0)
        .onLongPressGesture(minimumDuration: 0) { pressing in
            withAnimation(.easeInOut(duration: 0.1)) {
                isPressed = pressing
            }
        } perform: {
            // Acción de toque largo si es necesaria
        }
    }
    
    private var iconoGradiente: LinearGradient {
                        LinearGradient(
            gradient: Gradient(colors: [iconoColor, iconoColor.opacity(0.7)]),
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
        )
    }
    
    private var iconoColor: Color {
        switch axis.nombre {
        case let nombre where nombre.contains("Amígdala"):
            return .red
        case let nombre where nombre.contains("Corteza Prefrontal"):
            return .blue
        case let nombre where nombre.contains("Hipocampo"):
            return .purple
        case let nombre where nombre.contains("Cerebelo"):
            return .green
        case let nombre where nombre.contains("Sistema Límbico"):
            return .orange
        case let nombre where nombre.contains("Neuronas Espejo"):
            return .pink
        default:
            return .blue
        }
    }
    
    private func iconoParaEje(_ nombre: String) -> String {
        switch nombre {
        case let nombre where nombre.contains("Amígdala"):
            return "exclamationmark.triangle.fill"
        case let nombre where nombre.contains("Corteza Prefrontal"):
            return "brain.head.profile"
        case let nombre where nombre.contains("Hipocampo"):
            return "memorychip.fill"
        case let nombre where nombre.contains("Cerebelo"):
            return "figure.walk"
        case let nombre where nombre.contains("Sistema Límbico"):
            return "heart.fill"
        case let nombre where nombre.contains("Neuronas Espejo"):
            return "person.2.fill"
        default:
            return "bolt.fill"
        }
    }
}

// MARK: - AxisDetalleView Component
struct AxisDetalleView: View {
    let axis: Capa1Axis
    @Environment(\.dismiss) private var dismiss
    @State private var mostrarDesarrollo = false
    @State private var mostrarImportancia = false
    @State private var mostrarEstimulacion = false
    
    var body: some View {
            ScrollView {
                VStack(alignment: .leading, spacing: 24) {
                    // Header con gradiente
                    VStack(alignment: .leading, spacing: 16) {
                        HStack {
                        Image(systemName: iconoParaEje(axis.nombre))
                                .font(.largeTitle)
                            .foregroundColor(iconoColor)
                            
                            VStack(alignment: .leading, spacing: 4) {
                            Text("Eje Neuroemocional")
                                    .font(.title2)
                                    .fontWeight(.bold)
                                .foregroundColor(iconoColor)
                                
                            Text("Arquitectura Cerebral")
                                    .font(.subheadline)
                                    .foregroundColor(.secondary)
                            }
                            
                            Spacer()
                        }
                        
                    Text(axis.nombre)
                            .font(.title)
                            .fontWeight(.bold)
                            .multilineTextAlignment(.leading)
                            .lineSpacing(4)
                    }
                    .padding(20)
                    .background(
                        LinearGradient(
                        gradient: Gradient(colors: [iconoColor.opacity(0.1), iconoColor.opacity(0.05)]),
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                    )
                    .cornerRadius(16)
                    
                // Función principal
                    VStack(alignment: .leading, spacing: 12) {
                        HStack {
                        Image(systemName: "gear")
                            .foregroundColor(iconoColor)
                        Text("Función Principal")
                                .font(.headline)
                                .fontWeight(.semibold)
                        }
                        
                    Text(axis.funcion)
                            .font(.body)
                            .lineSpacing(6)
                            .foregroundColor(.primary)
                        .fixedSize(horizontal: false, vertical: true)
                    }
                    .padding(16)
                    .background(Color(.systemGray6))
                    .cornerRadius(12)
                    
                // Desarrollo (expandible)
                    VStack(alignment: .leading, spacing: 12) {
                    Button(action: {
                        withAnimation(.spring(response: 0.6, dampingFraction: 0.8)) {
                            mostrarDesarrollo.toggle()
                        }
                    }) {
                        HStack {
                            Image(systemName: "clock.fill")
                                .foregroundColor(.blue)
                            Text("Desarrollo")
                                .font(.headline)
                                .fontWeight(.semibold)
                                .foregroundColor(.primary)
                            
                            Spacer()
                            
                            Image(systemName: mostrarDesarrollo ? "chevron.up" : "chevron.down")
                                .foregroundColor(.blue)
                                .font(.title3)
                        }
                    }
                    .buttonStyle(PlainButtonStyle())
                    
                    if mostrarDesarrollo {
                        Text(axis.desarrollo)
                            .font(.body)
                            .foregroundColor(.primary)
                            .lineSpacing(4)
                            .fixedSize(horizontal: false, vertical: true)
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
                    
                // Importancia (expandible)
                    VStack(alignment: .leading, spacing: 12) {
                        Button(action: {
                            withAnimation(.spring(response: 0.6, dampingFraction: 0.8)) {
                            mostrarImportancia.toggle()
                            }
                        }) {
                            HStack {
                            Image(systemName: "heart.fill")
                                .foregroundColor(.red)
                            Text("Importancia")
                                .font(.headline)
                                .fontWeight(.semibold)
                                .foregroundColor(.primary)
                            
                            Spacer()
                            
                            Image(systemName: mostrarImportancia ? "chevron.up" : "chevron.down")
                                .foregroundColor(.red)
                                .font(.title3)
                        }
                    }
                    .buttonStyle(PlainButtonStyle())
                    
                    if mostrarImportancia {
                        Text(axis.importancia)
                            .font(.body)
                            .foregroundColor(.primary)
                            .lineSpacing(4)
                            .fixedSize(horizontal: false, vertical: true)
                            .padding(12)
                            .background(Color.red.opacity(0.1))
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
                
                // Estimulación (expandible)
                VStack(alignment: .leading, spacing: 12) {
                    Button(action: {
                        withAnimation(.spring(response: 0.6, dampingFraction: 0.8)) {
                            mostrarEstimulacion.toggle()
                        }
                    }) {
                        HStack {
                            Image(systemName: "sparkles")
                                    .foregroundColor(.green)
                            Text("Estimulación")
                                    .font(.headline)
                                    .fontWeight(.semibold)
                                    .foregroundColor(.primary)
                                
                                Spacer()
                                
                            Image(systemName: mostrarEstimulacion ? "chevron.up" : "chevron.down")
                                    .foregroundColor(.green)
                                    .font(.title3)
                            }
                        }
                        .buttonStyle(PlainButtonStyle())
                        
                    if mostrarEstimulacion {
                            VStack(alignment: .leading, spacing: 8) {
                            Text(axis.estimulacion)
                                    .font(.body)
                                    .foregroundColor(.primary)
                                    .lineSpacing(4)
                                .fixedSize(horizontal: false, vertical: true)
                                
                                // Botones de acción
                                HStack(spacing: 12) {
                                    Button(action: {
                                        // Acción para marcar como completado
                                    }) {
                                        HStack {
                                            Image(systemName: "checkmark.circle.fill")
                                            Text("Marcar como Completado")
                                        }
                                        .font(.caption)
                                        .foregroundColor(.white)
                                        .padding(.horizontal, 12)
                                        .padding(.vertical, 6)
                                        .background(Color.green)
                                        .cornerRadius(8)
                                    }
                                    
                                    Button(action: {
                                        // Acción para compartir
                                    }) {
                                        HStack {
                                            Image(systemName: "square.and.arrow.up")
                                            Text("Compartir")
                                        }
                                        .font(.caption)
                                        .foregroundColor(.blue)
                                        .padding(.horizontal, 12)
                                        .padding(.vertical, 6)
                                        .background(Color.blue.opacity(0.1))
                                        .cornerRadius(8)
                                    }
                                    
                                    Spacer()
                                }
                                .padding(.top, 8)
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
            }
            .padding()
        }
        .navigationTitle("Eje Neuroemocional")
        .navigationBarTitleDisplayMode(.inline)
    }
    
    private var iconoColor: Color {
        switch axis.nombre {
        case let nombre where nombre.contains("Amígdala"):
            return .red
        case let nombre where nombre.contains("Corteza Prefrontal"):
            return .blue
        case let nombre where nombre.contains("Hipocampo"):
            return .purple
        case let nombre where nombre.contains("Cerebelo"):
            return .green
        case let nombre where nombre.contains("Sistema Límbico"):
            return .orange
        case let nombre where nombre.contains("Neuronas Espejo"):
            return .pink
        default:
            return .blue
        }
    }
    
    private func iconoParaEje(_ nombre: String) -> String {
        switch nombre {
        case let nombre where nombre.contains("Amígdala"):
            return "exclamationmark.triangle.fill"
        case let nombre where nombre.contains("Corteza Prefrontal"):
            return "brain.head.profile"
        case let nombre where nombre.contains("Hipocampo"):
            return "memorychip.fill"
        case let nombre where nombre.contains("Cerebelo"):
            return "figure.walk"
        case let nombre where nombre.contains("Sistema Límbico"):
            return "heart.fill"
        case let nombre where nombre.contains("Neuronas Espejo"):
            return "person.2.fill"
        default:
            return "bolt.fill"
        }
    }
}

// MARK: - PitfallCard Component
struct PitfallCard: View {
    let pitfall: Capa1Pitfall
    let index: Int
    let onTap: () -> Void
    @State private var isPressed = false
    
    var body: some View {
        Button(action: onTap) {
                    VStack(alignment: .leading, spacing: 12) {
                // Header con icono de advertencia
                        HStack {
                    ZStack {
                        Circle()
                            .fill(
                                LinearGradient(
                                    gradient: Gradient(colors: [.red, .orange]),
                                    startPoint: .topLeading,
                                    endPoint: .bottomTrailing
                                )
                            )
                            .frame(width: 36, height: 36)
                        
                        Image(systemName: "exclamationmark.triangle.fill")
                            .font(.system(size: 16, weight: .bold))
                            .foregroundColor(.white)
                    }
                    
                    VStack(alignment: .leading, spacing: 2) {
                        Text("Error Común")
                            .font(.caption)
                            .foregroundColor(.red)
                            .fontWeight(.medium)
                        
                        Text(pitfall.error)
                                .font(.headline)
                                .fontWeight(.semibold)
                            .foregroundColor(.primary)
                            .multilineTextAlignment(.leading)
                            .lineLimit(2)
                    }
                    
                    Spacer()
                    
                    VStack {
                        Image(systemName: "arrow.right.circle.fill")
                            .font(.title3)
                            .foregroundColor(.red)
                        
                        Text("Ver Reencuadre")
                            .font(.caption2)
                            .foregroundColor(.red)
                    }
                }
                
                // Impacto del error
                VStack(alignment: .leading, spacing: 8) {
                    Text(pitfall.impacto)
                            .font(.body)
                        .foregroundColor(.secondary)
                        .lineLimit(3)
                        .multilineTextAlignment(.leading)
                        .lineSpacing(2)
                    
                    // Indicadores de contenido
                    HStack(spacing: 12) {
                        HStack(spacing: 4) {
                            Image(systemName: "arrow.clockwise.circle.fill")
                                .font(.caption)
                                .foregroundColor(.green)
                            
                            Text("Reencuadre")
                                .font(.caption)
                                .foregroundColor(.green)
                                .fontWeight(.medium)
                        }
                        
                        HStack(spacing: 4) {
                            Image(systemName: "lightbulb.fill")
                                .font(.caption)
                                .foregroundColor(.blue)
                            
                            Text("Alternativa")
                                .font(.caption)
                                .foregroundColor(.blue)
                                .fontWeight(.medium)
                        }
                        
                        HStack(spacing: 4) {
                            Image(systemName: "brain.head.profile")
                                .font(.caption)
                                .foregroundColor(.purple)
                            
                            Text("Explicación")
                                .font(.caption)
                                .foregroundColor(.purple)
                                .fontWeight(.medium)
                        }
                        
                        Spacer()
                    }
                }
                
                // Barra de progreso visual
                HStack {
                    ForEach(0..<4) { _ in
                        Circle()
                            .fill(Color.red.opacity(0.3))
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
                RoundedRectangle(cornerRadius: 14)
                    .fill(Color(.systemBackground))
                    .shadow(color: .black.opacity(0.06), radius: 6, x: 0, y: 3)
            )
            .overlay(
                RoundedRectangle(cornerRadius: 14)
                    .stroke(
                        LinearGradient(
                            gradient: Gradient(colors: [Color.red.opacity(0.3), Color.orange.opacity(0.3)]),
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        ),
                        lineWidth: 1.5
                    )
            )
        }
        .buttonStyle(ScaleButtonStyle())
        .scaleEffect(isPressed ? 0.95 : 1.0)
        .onLongPressGesture(minimumDuration: 0) { pressing in
            withAnimation(.easeInOut(duration: 0.1)) {
                isPressed = pressing
            }
        } perform: {
            // Acción de toque largo si es necesaria
        }
    }
}

// MARK: - PitfallDetalleView Component
struct PitfallDetalleView: View {
    let pitfall: Capa1Pitfall
    @Environment(\.dismiss) private var dismiss
    @State private var mostrarReencuadre = false
    @State private var mostrarAlternativa = false
    @State private var mostrarExplicacion = false
    
    var body: some View {
            ScrollView {
                VStack(alignment: .leading, spacing: 24) {
                    // Header con gradiente
                    VStack(alignment: .leading, spacing: 16) {
                        HStack {
                        Image(systemName: "exclamationmark.triangle.fill")
                                .font(.largeTitle)
                            .foregroundColor(.red)
                            
                            VStack(alignment: .leading, spacing: 4) {
                            Text("Error Común de Crianza")
                                    .font(.title2)
                                    .fontWeight(.bold)
                                .foregroundColor(.red)
                                
                            Text("Reencuadre Neurocientífico")
                                    .font(.subheadline)
                                    .foregroundColor(.secondary)
                            }
                            
                            Spacer()
                        }
                        
                    Text(pitfall.error)
                            .font(.title)
                            .fontWeight(.bold)
                            .multilineTextAlignment(.leading)
                            .lineSpacing(4)
                    }
                    .padding(20)
                    .background(
                        LinearGradient(
                        gradient: Gradient(colors: [Color.red.opacity(0.1), Color.orange.opacity(0.05)]),
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                    )
                    .cornerRadius(16)
                    
                // Impacto del error
                    VStack(alignment: .leading, spacing: 12) {
                        HStack {
                        Image(systemName: "bolt.fill")
                            .foregroundColor(.red)
                        Text("Impacto en el Desarrollo")
                                .font(.headline)
                                .fontWeight(.semibold)
                        }
                        
                    Text(pitfall.impacto)
                            .font(.body)
                            .lineSpacing(6)
                            .foregroundColor(.primary)
                        .fixedSize(horizontal: false, vertical: true)
                    }
                    .padding(16)
                    .background(Color(.systemGray6))
                    .cornerRadius(12)
                    
                // Reencuadre (expandible)
                    VStack(alignment: .leading, spacing: 12) {
                    Button(action: {
                        withAnimation(.spring(response: 0.6, dampingFraction: 0.8)) {
                            mostrarReencuadre.toggle()
                        }
                    }) {
                        HStack {
                            Image(systemName: "arrow.clockwise.circle.fill")
                                .foregroundColor(.green)
                            Text("Reencuadre Positivo")
                                .font(.headline)
                                .fontWeight(.semibold)
                                .foregroundColor(.primary)
                            
                            Spacer()
                            
                            Image(systemName: mostrarReencuadre ? "chevron.up" : "chevron.down")
                                .foregroundColor(.green)
                                .font(.title3)
                        }
                    }
                    .buttonStyle(PlainButtonStyle())
                    
                    if mostrarReencuadre {
                        Text(pitfall.reencuadre)
                            .font(.body)
                            .foregroundColor(.primary)
                            .lineSpacing(4)
                            .fixedSize(horizontal: false, vertical: true)
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
                    
                // Alternativa (expandible)
                    VStack(alignment: .leading, spacing: 12) {
                        Button(action: {
                            withAnimation(.spring(response: 0.6, dampingFraction: 0.8)) {
                            mostrarAlternativa.toggle()
                        }
                    }) {
                        HStack {
                            Image(systemName: "lightbulb.fill")
                                .foregroundColor(.blue)
                            Text("Alternativa Práctica")
                                .font(.headline)
                                .fontWeight(.semibold)
                                .foregroundColor(.primary)
                            
                            Spacer()
                            
                            Image(systemName: mostrarAlternativa ? "chevron.up" : "chevron.down")
                                .foregroundColor(.blue)
                                .font(.title3)
                        }
                    }
                    .buttonStyle(PlainButtonStyle())
                    
                    if mostrarAlternativa {
                        Text(pitfall.alternativa)
                            .font(.body)
                            .foregroundColor(.primary)
                            .lineSpacing(4)
                            .fixedSize(horizontal: false, vertical: true)
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
                
                // Explicación científica (expandible)
                VStack(alignment: .leading, spacing: 12) {
                    Button(action: {
                        withAnimation(.spring(response: 0.6, dampingFraction: 0.8)) {
                            mostrarExplicacion.toggle()
                            }
                        }) {
                            HStack {
                                Image(systemName: "brain.head.profile")
                                    .foregroundColor(.purple)
                            Text("Explicación Científica")
                                    .font(.headline)
                                    .fontWeight(.semibold)
                                    .foregroundColor(.primary)
                                
                                Spacer()
                                
                            Image(systemName: mostrarExplicacion ? "chevron.up" : "chevron.down")
                                    .foregroundColor(.purple)
                                    .font(.title3)
                            }
                        }
                        .buttonStyle(PlainButtonStyle())
                        
                    if mostrarExplicacion {
                            VStack(alignment: .leading, spacing: 8) {
                            Text(pitfall.explicacion)
                                    .font(.body)
                                    .foregroundColor(.primary)
                                    .lineSpacing(4)
                                .fixedSize(horizontal: false, vertical: true)
                                
                                // Botones de acción
                                HStack(spacing: 12) {
                                    Button(action: {
                                    // Acción para marcar como completado
                                    }) {
                                        HStack {
                                        Image(systemName: "checkmark.circle.fill")
                                        Text("Marcar como Completado")
                                        }
                                        .font(.caption)
                                        .foregroundColor(.white)
                            .padding(.horizontal, 12)
                                        .padding(.vertical, 6)
                                    .background(Color.green)
                            .cornerRadius(8)
                                    }
                                    
                                    Button(action: {
                                        // Acción para compartir
                                    }) {
                                        HStack {
                                            Image(systemName: "square.and.arrow.up")
                                            Text("Compartir")
                                        }
                                        .font(.caption)
                                    .foregroundColor(.blue)
                                        .padding(.horizontal, 12)
                                        .padding(.vertical, 6)
                                    .background(Color.blue.opacity(0.1))
                                        .cornerRadius(8)
                                    }
                                    
                                    Spacer()
                                }
                                .padding(.top, 8)
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
        .navigationTitle("Error de Crianza")
            .navigationBarTitleDisplayMode(.inline)
    }
}

// MARK: - MantraCarousel Component
struct MantraCarousel: View {
    let mantras: [Capa1Mantra]
    let onMantraTap: (Capa1Mantra) -> Void
    @State private var currentIndex = 0
    @State private var dragOffset: CGFloat = 0
    
    var body: some View {
        VStack(spacing: 20) {
            // Carrusel principal
            TabView(selection: $currentIndex) {
                ForEach(Array(mantras.enumerated()), id: \.offset) { index, mantra in
                    MantraCard(mantra: mantra, index: index + 1) {
                        onMantraTap(mantra)
                    }
                    .tag(index)
                }
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            .frame(height: 200)
            .gesture(
                DragGesture()
                    .onChanged { value in
                        dragOffset = value.translation.width
                    }
                    .onEnded { value in
                        withAnimation(.spring(response: 0.6, dampingFraction: 0.8)) {
                            if value.translation.width > 50 && currentIndex > 0 {
                                currentIndex -= 1
                            } else if value.translation.width < -50 && currentIndex < mantras.count - 1 {
                                currentIndex += 1
                            }
                            dragOffset = 0
                        }
                    }
            )
            
            // Indicadores de página
            HStack(spacing: 8) {
                ForEach(0..<mantras.count, id: \.self) { index in
                    Circle()
                        .fill(index == currentIndex ? Color.blue : Color.gray.opacity(0.3))
                        .frame(width: 8, height: 8)
                        .scaleEffect(index == currentIndex ? 1.2 : 1.0)
                        .animation(.spring(response: 0.6, dampingFraction: 0.8), value: currentIndex)
                }
            }
            
            // Controles de navegación
            HStack(spacing: 20) {
                Button(action: {
                    withAnimation(.spring(response: 0.6, dampingFraction: 0.8)) {
                        if currentIndex > 0 {
                            currentIndex -= 1
                        }
                    }
                }) {
                    HStack {
                        Image(systemName: "chevron.left")
                        Text("Anterior")
                    }
                    .font(.caption)
                    .foregroundColor(.blue)
                    .padding(.horizontal, 12)
                    .padding(.vertical, 6)
                    .background(Color.blue.opacity(0.1))
                    .cornerRadius(8)
                }
                .disabled(currentIndex == 0)
                
                Spacer()
                
                Text("\(currentIndex + 1) de \(mantras.count)")
                    .font(.caption)
                    .foregroundColor(.secondary)
                
                Spacer()
                
                Button(action: {
                    withAnimation(.spring(response: 0.6, dampingFraction: 0.8)) {
                        if currentIndex < mantras.count - 1 {
                            currentIndex += 1
                        }
                    }
                }) {
                    HStack {
                        Text("Siguiente")
                        Image(systemName: "chevron.right")
                    }
                    .font(.caption)
                    .foregroundColor(.blue)
                    .padding(.horizontal, 12)
                    .padding(.vertical, 6)
                    .background(Color.blue.opacity(0.1))
                    .cornerRadius(8)
                }
                .disabled(currentIndex == mantras.count - 1)
            }
        }
    }
}

// MARK: - MantraCard Component
struct MantraCard: View {
    let mantra: Capa1Mantra
    let index: Int
    let onTap: () -> Void
    @State private var isPressed = false
    
    var body: some View {
        Button(action: onTap) {
            VStack(alignment: .leading, spacing: 16) {
                // Header con icono de cita
                HStack {
                    ZStack {
                        Circle()
                            .fill(
                                LinearGradient(
                                    gradient: Gradient(colors: [.blue, .purple]),
                                    startPoint: .topLeading,
                                    endPoint: .bottomTrailing
                                )
                            )
                            .frame(width: 40, height: 40)
                        
                        Image(systemName: "quote.bubble.fill")
                            .font(.system(size: 18, weight: .bold))
                            .foregroundColor(.white)
                    }
                    
                    VStack(alignment: .leading, spacing: 2) {
                        Text("Frase Guía")
                            .font(.caption)
                            .foregroundColor(.blue)
                            .fontWeight(.medium)
                        
                        Text("Mantra \(index)")
                            .font(.caption2)
                            .foregroundColor(.secondary)
                    }
                    
                    Spacer()
                    
                    VStack {
                        Image(systemName: "arrow.right.circle.fill")
                            .font(.title3)
                            .foregroundColor(.blue)
                        
                        Text("Explorar")
                            .font(.caption2)
                            .foregroundColor(.blue)
                    }
                }
                
                // Frase principal
                VStack(alignment: .leading, spacing: 8) {
                    Text(mantra.frase)
                        .font(.headline)
                        .fontWeight(.semibold)
                        .foregroundColor(.primary)
                        .multilineTextAlignment(.leading)
                        .lineLimit(3)
                        .lineSpacing(2)
                    
                    // Explicación breve
                    Text(mantra.explicacion)
                        .font(.body)
                        .foregroundColor(.secondary)
                        .lineLimit(2)
                        .multilineTextAlignment(.leading)
                        .lineSpacing(1)
                }
                
                // Indicadores de contenido
                HStack(spacing: 12) {
                    HStack(spacing: 4) {
                        Image(systemName: "lightbulb.fill")
                            .font(.caption)
                            .foregroundColor(.yellow)
                        
                        Text("Contexto")
                            .font(.caption)
                            .foregroundColor(.yellow)
                            .fontWeight(.medium)
                    }
                    
                    HStack(spacing: 4) {
                        Image(systemName: "wrench.and.screwdriver.fill")
                            .font(.caption)
                            .foregroundColor(.green)
                        
                        Text("Aplicación")
                            .font(.caption)
                            .foregroundColor(.green)
                            .fontWeight(.medium)
                    }
                    
                    HStack(spacing: 4) {
                        Image(systemName: "heart.fill")
                            .font(.caption)
                            .foregroundColor(.red)
                        
                        Text("Significado")
                            .font(.caption)
                            .foregroundColor(.red)
                            .fontWeight(.medium)
                    }
                    
                    Spacer()
                }
            }
            .padding(20)
            .background(
                RoundedRectangle(cornerRadius: 16)
                    .fill(Color(.systemBackground))
                    .shadow(color: .black.opacity(0.08), radius: 8, x: 0, y: 4)
            )
            .overlay(
                RoundedRectangle(cornerRadius: 16)
                    .stroke(
                        LinearGradient(
                            gradient: Gradient(colors: [Color.blue.opacity(0.3), Color.purple.opacity(0.3)]),
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        ),
                        lineWidth: 1
                    )
            )
        }
        .buttonStyle(ScaleButtonStyle())
        .scaleEffect(isPressed ? 0.95 : 1.0)
        .onLongPressGesture(minimumDuration: 0) { pressing in
            withAnimation(.easeInOut(duration: 0.1)) {
                isPressed = pressing
            }
        } perform: {
            // Acción de toque largo si es necesaria
        }
    }
}

// MARK: - MantraDetalleView Component
struct MantraDetalleView: View {
    let mantra: Capa1Mantra
    @Environment(\.dismiss) private var dismiss
    @State private var mostrarContexto = false
    @State private var mostrarAplicacion = false
    @State private var mostrarSignificado = false
    
    var body: some View {
            ScrollView {
                VStack(alignment: .leading, spacing: 24) {
                    // Header con gradiente
                    VStack(alignment: .leading, spacing: 16) {
                        HStack {
                            Image(systemName: "quote.bubble.fill")
                                .font(.largeTitle)
                            .foregroundColor(.blue)
                            
                            VStack(alignment: .leading, spacing: 4) {
                            Text("Frase Guía")
                                    .font(.title2)
                                    .fontWeight(.bold)
                                .foregroundColor(.blue)
                                
                            Text("Mantra Neurocientífico")
                                    .font(.subheadline)
                                    .foregroundColor(.secondary)
                            }
                            
                            Spacer()
                        }
                        
                    Text(mantra.frase)
                            .font(.title)
                            .fontWeight(.bold)
                            .multilineTextAlignment(.leading)
                            .lineSpacing(4)
                            .foregroundColor(.primary)
                    }
                    .padding(20)
                    .background(
                        LinearGradient(
                        gradient: Gradient(colors: [Color.blue.opacity(0.1), Color.purple.opacity(0.05)]),
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                    )
                    .cornerRadius(16)
                    
                // Explicación principal
                    VStack(alignment: .leading, spacing: 12) {
                        HStack {
                            Image(systemName: "lightbulb.fill")
                                .foregroundColor(.yellow)
                        Text("Explicación")
                                .font(.headline)
                                .fontWeight(.semibold)
                        }
                        
                    Text(mantra.explicacion)
                            .font(.body)
                            .lineSpacing(6)
                            .foregroundColor(.primary)
                        .fixedSize(horizontal: false, vertical: true)
                    }
                    .padding(16)
                    .background(Color(.systemGray6))
                    .cornerRadius(12)
                    
                // Contexto (expandible)
                    VStack(alignment: .leading, spacing: 12) {
                    Button(action: {
                        withAnimation(.spring(response: 0.6, dampingFraction: 0.8)) {
                            mostrarContexto.toggle()
                        }
                    }) {
                        HStack {
                            Image(systemName: "lightbulb.fill")
                                .foregroundColor(.yellow)
                            Text("Contexto del Libro")
                                .font(.headline)
                                .fontWeight(.semibold)
                                .foregroundColor(.primary)
                            
                            Spacer()
                            
                            Image(systemName: mostrarContexto ? "chevron.up" : "chevron.down")
                                .foregroundColor(.yellow)
                                .font(.title3)
                        }
                    }
                    .buttonStyle(PlainButtonStyle())
                    
                    if mostrarContexto {
                        Text(mantra.contexto)
                            .font(.body)
                            .foregroundColor(.primary)
                            .lineSpacing(4)
                            .fixedSize(horizontal: false, vertical: true)
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
                    
                // Aplicación práctica (expandible)
                VStack(alignment: .leading, spacing: 12) {
                    Button(action: {
                        withAnimation(.spring(response: 0.6, dampingFraction: 0.8)) {
                            mostrarAplicacion.toggle()
                        }
                    }) {
                        HStack {
                            Image(systemName: "wrench.and.screwdriver.fill")
                                .foregroundColor(.green)
                            Text("Aplicación Práctica")
                                .font(.headline)
                                .fontWeight(.semibold)
                                .foregroundColor(.primary)
                            
                            Spacer()
                            
                            Image(systemName: mostrarAplicacion ? "chevron.up" : "chevron.down")
                                .foregroundColor(.green)
                                .font(.title3)
                        }
                    }
                    .buttonStyle(PlainButtonStyle())
                    
                    if mostrarAplicacion {
                        Text(mantra.aplicacion)
                            .font(.body)
                            .foregroundColor(.primary)
                            .lineSpacing(4)
                            .fixedSize(horizontal: false, vertical: true)
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
                
                // Significado (expandible)
                    VStack(alignment: .leading, spacing: 12) {
                        Button(action: {
                            withAnimation(.spring(response: 0.6, dampingFraction: 0.8)) {
                                mostrarSignificado.toggle()
                            }
                        }) {
                            HStack {
                            Image(systemName: "heart.fill")
                                .foregroundColor(.red)
                                Text("Significado Profundo")
                                    .font(.headline)
                                    .fontWeight(.semibold)
                                    .foregroundColor(.primary)
                                
                                Spacer()
                                
                                Image(systemName: mostrarSignificado ? "chevron.up" : "chevron.down")
                                .foregroundColor(.red)
                                    .font(.title3)
                            }
                        }
                        .buttonStyle(PlainButtonStyle())
                        
                        if mostrarSignificado {
                            VStack(alignment: .leading, spacing: 8) {
                            Text(mantra.significado)
                                    .font(.body)
                                    .foregroundColor(.primary)
                                    .lineSpacing(4)
                                .fixedSize(horizontal: false, vertical: true)
                                
                                // Botones de acción
                                HStack(spacing: 12) {
                                    Button(action: {
                                    // Acción para marcar como favorito
                                    }) {
                                        HStack {
                                            Image(systemName: "heart.fill")
                                        Text("Marcar como Favorito")
                                        }
                                        .font(.caption)
                                        .foregroundColor(.white)
                                        .padding(.horizontal, 12)
                                        .padding(.vertical, 6)
                                        .background(Color.red)
                                        .cornerRadius(8)
                                    }
                                    
                                    Button(action: {
                                        // Acción para compartir
                                    }) {
                                        HStack {
                                            Image(systemName: "square.and.arrow.up")
                                            Text("Compartir")
                                        }
                                        .font(.caption)
                                    .foregroundColor(.blue)
                                        .padding(.horizontal, 12)
                                        .padding(.vertical, 6)
                                    .background(Color.blue.opacity(0.1))
                                        .cornerRadius(8)
                                    }
                                    
                                    Spacer()
                                }
                                .padding(.top, 8)
                            }
                            .padding(12)
                        .background(Color.red.opacity(0.1))
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
        .navigationTitle("Frase Guía")
            .navigationBarTitleDisplayMode(.inline)
    }
}

// MARK: - VisualIdeaCard Component
struct VisualIdeaCard: View {
    let visualIdea: Capa1VisualIdea
    let index: Int
    let onTap: () -> Void
    @State private var isPressed = false
    @State private var isAnimating = false
    
    var body: some View {
        Button(action: onTap) {
            VStack(alignment: .leading, spacing: 16) {
                // Header con icono animado
                HStack {
                    ZStack {
                        Circle()
                            .fill(
                                LinearGradient(
                                    gradient: Gradient(colors: [.purple, .pink]),
                                    startPoint: .topLeading,
                                    endPoint: .bottomTrailing
                                )
                            )
                            .frame(width: 40, height: 40)
                            .scaleEffect(isAnimating ? 1.1 : 1.0)
                            .animation(.easeInOut(duration: 2.0).repeatForever(autoreverses: true), value: isAnimating)
                        
                        Image(systemName: "eye.fill")
                            .font(.system(size: 18, weight: .bold))
                            .foregroundColor(.white)
                    }
                    
                    VStack(alignment: .leading, spacing: 2) {
                        Text("Idea Visual")
                            .font(.caption)
                            .foregroundColor(.purple)
                            .fontWeight(.medium)
                        
                        Text("Animación \(index)")
                            .font(.caption2)
                            .foregroundColor(.secondary)
                    }
                    
                    Spacer()
                    
                    VStack {
                        Image(systemName: "play.circle.fill")
                            .font(.title3)
                            .foregroundColor(.purple)
                        
                        Text("Ver Animación")
                            .font(.caption2)
                            .foregroundColor(.purple)
                    }
                }
                
                // Título y descripción
                VStack(alignment: .leading, spacing: 8) {
                    Text(visualIdea.titulo)
                        .font(.headline)
                        .fontWeight(.semibold)
                        .foregroundColor(.primary)
                        .multilineTextAlignment(.leading)
                        .lineLimit(2)
                        .lineSpacing(2)
                    
                    Text(visualIdea.descripcion)
                        .font(.body)
                        .foregroundColor(.secondary)
                        .lineLimit(3)
                        .multilineTextAlignment(.leading)
                        .lineSpacing(1)
                }
                
                // Indicadores de contenido
                HStack(spacing: 12) {
                    HStack(spacing: 4) {
                        Image(systemName: "target")
                            .font(.caption)
                            .foregroundColor(.orange)
                        
                        Text("Propósito")
                            .font(.caption)
                            .foregroundColor(.orange)
                            .fontWeight(.medium)
                    }
                    
                    HStack(spacing: 4) {
                        Image(systemName: "gear")
                            .font(.caption)
                            .foregroundColor(.blue)
                        
                        Text("Implementación")
                            .font(.caption)
                            .foregroundColor(.blue)
                            .fontWeight(.medium)
                    }
                    
                    HStack(spacing: 4) {
                        Image(systemName: "sparkles")
                            .font(.caption)
                            .foregroundColor(.yellow)
                        
                        Text("Animación")
                            .font(.caption)
                            .foregroundColor(.yellow)
                            .fontWeight(.medium)
                    }
                    
                    Spacer()
                }
                
                // Barra de progreso visual
                HStack {
                    ForEach(0..<4) { _ in
                        Circle()
                            .fill(Color.purple.opacity(0.3))
                            .frame(width: 6, height: 6)
                    }
                    
                    Spacer()
                    
                    Text("Toca para ver más")
                        .font(.caption2)
                        .foregroundColor(.secondary)
                }
            }
            .padding(20)
            .background(
                RoundedRectangle(cornerRadius: 16)
                    .fill(Color(.systemBackground))
                    .shadow(color: .black.opacity(0.08), radius: 8, x: 0, y: 4)
            )
            .overlay(
                RoundedRectangle(cornerRadius: 16)
                    .stroke(
                        LinearGradient(
                            gradient: Gradient(colors: [Color.purple.opacity(0.3), Color.pink.opacity(0.3)]),
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        ),
                        lineWidth: 1
                    )
            )
        }
        .buttonStyle(ScaleButtonStyle())
        .scaleEffect(isPressed ? 0.95 : 1.0)
        .onLongPressGesture(minimumDuration: 0) { pressing in
            withAnimation(.easeInOut(duration: 0.1)) {
                isPressed = pressing
            }
        } perform: {
            // Acción de toque largo si es necesaria
        }
        .onAppear {
            isAnimating = true
        }
    }
}

// MARK: - VisualIdeaDetalleView Component
struct VisualIdeaDetalleView: View {
    let visualIdea: Capa1VisualIdea
    @Environment(\.dismiss) private var dismiss
    @State private var mostrarAnimacion = false
    @State private var mostrarProposito = false
    @State private var mostrarImplementacion = false
    @State private var isAnimating = false
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 24) {
                // Header con gradiente
                VStack(alignment: .leading, spacing: 16) {
                    HStack {
                        ZStack {
                            Circle()
                                .fill(
                                    LinearGradient(
                                        gradient: Gradient(colors: [.purple, .pink]),
                                        startPoint: .topLeading,
                                        endPoint: .bottomTrailing
                                    )
                                )
                                .frame(width: 60, height: 60)
                                .scaleEffect(isAnimating ? 1.1 : 1.0)
                                .animation(.easeInOut(duration: 2.0).repeatForever(autoreverses: true), value: isAnimating)
                            
                            Image(systemName: "eye.fill")
                                .font(.largeTitle)
                                .foregroundColor(.white)
                        }
                        
                        VStack(alignment: .leading, spacing: 4) {
                            Text("Idea Visual")
                                .font(.title2)
                                .fontWeight(.bold)
                                .foregroundColor(.purple)
                            
                            Text("Animación Conceptual")
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                        }
                        
                        Spacer()
                    }
                    
                    Text(visualIdea.titulo)
                        .font(.title)
                        .fontWeight(.bold)
                        .multilineTextAlignment(.leading)
                        .lineSpacing(4)
                        .foregroundColor(.primary)
                }
                .padding(20)
                .background(
                    LinearGradient(
                        gradient: Gradient(colors: [Color.purple.opacity(0.1), Color.pink.opacity(0.05)]),
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                )
                .cornerRadius(16)
                
                // Descripción principal
                VStack(alignment: .leading, spacing: 12) {
                    HStack {
                        Image(systemName: "doc.text.fill")
                            .foregroundColor(.purple)
                        Text("Descripción")
                            .font(.headline)
                            .fontWeight(.semibold)
                    }
                    
                    Text(visualIdea.descripcion)
                        .font(.body)
                        .lineSpacing(6)
                        .foregroundColor(.primary)
                        .fixedSize(horizontal: false, vertical: true)
                }
                .padding(16)
                .background(Color(.systemGray6))
                .cornerRadius(12)
                
                // Animación (expandible)
                VStack(alignment: .leading, spacing: 12) {
                    Button(action: {
                        withAnimation(.spring(response: 0.6, dampingFraction: 0.8)) {
                            mostrarAnimacion.toggle()
                        }
                    }) {
                        HStack {
                            Image(systemName: "play.circle.fill")
                                .foregroundColor(.purple)
                            Text("Descripción de la Animación")
                                .font(.headline)
                                .fontWeight(.semibold)
                                .foregroundColor(.primary)
                            
                            Spacer()
                            
                            Image(systemName: mostrarAnimacion ? "chevron.up" : "chevron.down")
                                .foregroundColor(.purple)
                                .font(.title3)
                        }
                    }
                    .buttonStyle(PlainButtonStyle())
                    
                    if mostrarAnimacion {
                        Text(visualIdea.animacion)
                            .font(.body)
                            .foregroundColor(.primary)
                            .lineSpacing(4)
                            .fixedSize(horizontal: false, vertical: true)
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
                
                // Propósito (expandible)
                VStack(alignment: .leading, spacing: 12) {
                    Button(action: {
                        withAnimation(.spring(response: 0.6, dampingFraction: 0.8)) {
                            mostrarProposito.toggle()
                        }
                    }) {
                        HStack {
                            Image(systemName: "target")
                                .foregroundColor(.orange)
                            Text("Propósito Educativo")
                                .font(.headline)
                                .fontWeight(.semibold)
                                .foregroundColor(.primary)
                            
                            Spacer()
                            
                            Image(systemName: mostrarProposito ? "chevron.up" : "chevron.down")
                                .foregroundColor(.orange)
                                .font(.title3)
                        }
                    }
                    .buttonStyle(PlainButtonStyle())
                    
                    if mostrarProposito {
                        Text(visualIdea.proposito)
                            .font(.body)
                            .foregroundColor(.primary)
                            .lineSpacing(4)
                            .fixedSize(horizontal: false, vertical: true)
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
                
                // Implementación técnica (expandible)
                VStack(alignment: .leading, spacing: 12) {
                    Button(action: {
                        withAnimation(.spring(response: 0.6, dampingFraction: 0.8)) {
                            mostrarImplementacion.toggle()
                        }
                    }) {
                        HStack {
                            Image(systemName: "gear")
                                .foregroundColor(.blue)
                            Text("Implementación Técnica")
                                .font(.headline)
                                .fontWeight(.semibold)
                                .foregroundColor(.primary)
                            
                            Spacer()
                            
                            Image(systemName: mostrarImplementacion ? "chevron.up" : "chevron.down")
                                .foregroundColor(.blue)
                                .font(.title3)
                        }
                    }
                    .buttonStyle(PlainButtonStyle())
                    
                    if mostrarImplementacion {
                        VStack(alignment: .leading, spacing: 8) {
                            Text(visualIdea.implementacion)
                                .font(.body)
                                .foregroundColor(.primary)
                                .lineSpacing(4)
                                .fixedSize(horizontal: false, vertical: true)
                            
                            // Botones de acción
                            HStack(spacing: 12) {
                                Button(action: {
                                    // Acción para reproducir animación
                                }) {
                                    HStack {
                                        Image(systemName: "play.fill")
                                        Text("Reproducir Animación")
                                    }
                                    .font(.caption)
                                    .foregroundColor(.white)
                                    .padding(.horizontal, 12)
                                    .padding(.vertical, 6)
                                    .background(Color.purple)
                                    .cornerRadius(8)
                                }
                                
                                Button(action: {
                                    // Acción para compartir
                                }) {
                                    HStack {
                                        Image(systemName: "square.and.arrow.up")
                                        Text("Compartir")
                                    }
                                    .font(.caption)
                                    .foregroundColor(.blue)
                                    .padding(.horizontal, 12)
                                    .padding(.vertical, 6)
                                    .background(Color.blue.opacity(0.1))
                                    .cornerRadius(8)
                                }
                                
                                Spacer()
                            }
                            .padding(.top, 8)
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
            }
            .padding()
        }
        .navigationTitle("Idea Visual")
        .navigationBarTitleDisplayMode(.inline)
        .onAppear {
            isAnimating = true
        }
    }
}

// MARK: - Preview
struct Capa1FundamentosView_Previews: PreviewProvider {
    static var previews: some View {
        Capa1FundamentosView()
            .environmentObject(ProgresoManager())
    }
}
