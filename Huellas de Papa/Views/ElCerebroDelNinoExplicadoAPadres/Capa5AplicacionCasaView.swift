import SwiftUI

// MARK: - Capa 5: Aplicación en Casa - Vista Principal
/// Transforma el hogar en un laboratorio de desarrollo cerebral
/// Basado en "El cerebro del niño explicado a los padres" de Álvaro Bilbao
struct Capa5AplicacionCasaView: View {
    @State private var capa5: Capa5AplicacionCasa = Capa5AplicacionCasa()
    @State private var mostrarReflexion = false
    @State private var seccionActiva: SeccionCapa5 = .rutinas
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 0) {
                    // MARK: - Header con Progreso Familiar
                    HeaderProgresoFamiliar(progreso: capa5.progreso)
                        .padding(.horizontal)
                        .padding(.top)
                    
                    // MARK: - Navegación por Secciones
                    NavegacionSecciones(seccionActiva: $seccionActiva)
                        .padding(.horizontal)
                        .padding(.vertical, 8)
                    
                    // MARK: - Contenido Dinámico por Sección
                    Group {
                        switch seccionActiva {
                        case .rutinas:
                            SeccionRutinas(rutinas: capa5.rutinas)
                                .transition(.asymmetric(
                                    insertion: .move(edge: .trailing).combined(with: .opacity),
                                    removal: .move(edge: .leading).combined(with: .opacity)
                                ))
                        case .habitos:
                            SeccionHabitos(habitos: capa5.habitos)
                                .transition(.asymmetric(
                                    insertion: .move(edge: .trailing).combined(with: .opacity),
                                    removal: .move(edge: .leading).combined(with: .opacity)
                                ))
                        case .desafios:
                            SeccionDesafios(desafios: capa5.desafios)
                                .transition(.asymmetric(
                                    insertion: .move(edge: .trailing).combined(with: .opacity),
                                    removal: .move(edge: .leading).combined(with: .opacity)
                                ))
                        case .reflexion:
                            SeccionReflexion()
                                .transition(.asymmetric(
                                    insertion: .move(edge: .trailing).combined(with: .opacity),
                                    removal: .move(edge: .leading).combined(with: .opacity)
                                ))
                        case .progreso:
                            SeccionProgreso(progreso: capa5.progreso)
                                .transition(.asymmetric(
                                    insertion: .move(edge: .trailing).combined(with: .opacity),
                                    removal: .move(edge: .leading).combined(with: .opacity)
                                ))
                        }
                    }
                    .animation(.spring(response: 0.6, dampingFraction: 0.8), value: seccionActiva)
                }
            }
            .navigationTitle("Aplicación en Casa")
            .navigationBarTitleDisplayMode(.large)
            .background(
                // Fondo orgánico con gradientes suaves
                LinearGradient(
                    gradient: Gradient(colors: [
                        Color.mint.opacity(0.08),
                        Color.green.opacity(0.04),
                        Color.blue.opacity(0.02)
                    ]),
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
            )
            .sheet(isPresented: $mostrarReflexion) {
                ReflexionDiariaView()
            }
        }
    }
}

// MARK: - Header con Progreso Familiar
struct HeaderProgresoFamiliar: View {
    let progreso: Capa5Progress
    @State private var animacionProgreso = false
    @State private var animacionEstadisticas = false
    
    var body: some View {
        VStack(spacing: 16) {
            // Título y descripción
            VStack(spacing: 8) {
                HStack {
                    Image(systemName: "house.fill")
                        .font(.title2)
                        .foregroundColor(.green)
                        .scaleEffect(animacionProgreso ? 1.0 : 0.8)
                        .opacity(animacionProgreso ? 1.0 : 0.0)
                        .animation(.spring(response: 0.6, dampingFraction: 0.8).delay(0.1), value: animacionProgreso)
                    
                    Text("Transforma tu hogar en un laboratorio de desarrollo cerebral")
                        .font(.headline)
                        .fontWeight(.semibold)
                        .foregroundColor(.primary)
                        .multilineTextAlignment(.leading)
                        .scaleEffect(animacionProgreso ? 1.0 : 0.95)
                        .opacity(animacionProgreso ? 1.0 : 0.0)
                        .animation(.spring(response: 0.6, dampingFraction: 0.8).delay(0.2), value: animacionProgreso)
                    
                    Spacer()
                }
                
                Text("Aplica los principios de Álvaro Bilbao en tu vida diaria familiar")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                    .multilineTextAlignment(.leading)
                    .scaleEffect(animacionProgreso ? 1.0 : 0.95)
                    .opacity(animacionProgreso ? 1.0 : 0.0)
                    .animation(.spring(response: 0.6, dampingFraction: 0.8).delay(0.3), value: animacionProgreso)
            }
            
            // Progreso circular
            HStack(spacing: 20) {
                // Progreso general
                VStack(spacing: 8) {
                    ZStack {
                        Circle()
                            .stroke(Color.gray.opacity(0.3), lineWidth: 8)
                            .frame(width: 80, height: 80)
                        
                        Circle()
                            .trim(from: 0, to: CGFloat(progreso.nivel) / 10.0)
                            .stroke(
                                LinearGradient(
                                    gradient: Gradient(colors: [.green, .mint]),
                                    startPoint: .topLeading,
                                    endPoint: .bottomTrailing
                                ),
                                style: StrokeStyle(lineWidth: 8, lineCap: .round)
                            )
                            .frame(width: 80, height: 80)
                            .rotationEffect(.degrees(-90))
                            .scaleEffect(animacionProgreso ? 1.0 : 0.8)
                            .opacity(animacionProgreso ? 1.0 : 0.0)
                            .animation(.spring(response: 0.8, dampingFraction: 0.6).delay(0.4), value: animacionProgreso)
                        
                        VStack(spacing: 2) {
                            Text("\(progreso.nivel)")
                                    .font(.title2)
                                    .fontWeight(.bold)
                                    .foregroundColor(.green)
                            
                            Text("Nivel")
                                .font(.caption)
                                .foregroundColor(.secondary)
                        }
                            }
                            
                    Text("Progreso Familiar")
                        .font(.caption)
                        .fontWeight(.medium)
                                .foregroundColor(.secondary)
                }
                
                // Estadísticas rápidas
                VStack(alignment: .leading, spacing: 8) {
                    EstadisticaRapida(
                        icono: "checkmark.circle.fill",
                        titulo: "Rutinas Completadas",
                        valor: "\(progreso.rutinasCompletadas)",
                        color: .green
                    )
                    
                    EstadisticaRapida(
                        icono: "repeat.circle.fill",
                        titulo: "Hábitos Activos",
                        valor: "\(progreso.habitosActivos)",
                        color: .blue
                    )
                    
                    EstadisticaRapida(
                        icono: "trophy.fill",
                        titulo: "Desafíos Completados",
                        valor: "\(progreso.desafiosCompletados)",
                        color: .orange
                    )
                }
                
                Spacer()
            }
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(Color(.systemBackground))
                .shadow(color: .black.opacity(0.1), radius: 8, x: 0, y: 4)
        )
        .onAppear {
            withAnimation {
                animacionProgreso = true
                animacionEstadisticas = true
            }
        }
    }
}

// MARK: - Navegación por Secciones
struct NavegacionSecciones: View {
    @Binding var seccionActiva: SeccionCapa5
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 12) {
                ForEach(SeccionCapa5.allCases, id: \.self) { seccion in
                    BotonSeccion(
                        seccion: seccion,
                        isSelected: seccionActiva == seccion
                    ) {
                        withAnimation(.spring(response: 0.6, dampingFraction: 0.8)) {
                            seccionActiva = seccion
                        }
                    }
                }
            }
            .padding(.horizontal)
        }
    }
}

// MARK: - Botón de Sección
struct BotonSeccion: View {
    let seccion: SeccionCapa5
    let isSelected: Bool
    let action: () -> Void
    @State private var animacionBoton = false
    
    var body: some View {
        Button(action: action) {
            HStack(spacing: 8) {
                Image(systemName: seccion.icono)
                    .font(.caption)
                    .foregroundColor(isSelected ? .white : Color(seccion.color))
                    .scaleEffect(isSelected ? 1.1 : 1.0)
                    .animation(.spring(response: 0.4, dampingFraction: 0.6), value: isSelected)
                
                Text(seccion.titulo)
                    .font(.caption)
                    .fontWeight(.medium)
                    .foregroundColor(isSelected ? .white : .primary)
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 8)
            .background(
                RoundedRectangle(cornerRadius: 20)
                    .fill(isSelected ? Color(seccion.color) : Color(.secondarySystemBackground))
                    .shadow(
                        color: isSelected ? Color(seccion.color).opacity(0.3) : .clear,
                        radius: isSelected ? 4 : 0,
                        x: 0,
                        y: 2
                    )
            )
            .scaleEffect(isSelected ? 1.05 : 1.0)
            .animation(.spring(response: 0.4, dampingFraction: 0.6), value: isSelected)
        }
        .buttonStyle(Capa5ScaleButtonStyle())
        .scaleEffect(animacionBoton ? 1.0 : 0.8)
        .opacity(animacionBoton ? 1.0 : 0.0)
        .animation(.spring(response: 0.6, dampingFraction: 0.8), value: animacionBoton)
        .onAppear {
            withAnimation {
                animacionBoton = true
            }
        }
    }
}

// MARK: - Secciones de Contenido (Placeholders)

struct SeccionRutinas: View {
    let rutinas: [Capa5Routine]
    
    var body: some View {
        VStack(spacing: 16) {
            // Header de sección
                            HStack {
                Image(systemName: "clock.fill")
                    .foregroundColor(.orange)
                Text("Rutinas Familiares")
                    .font(.title2)
                    .fontWeight(.semibold)
                Spacer()
            }
            .padding(.horizontal)
            
            if rutinas.isEmpty {
                // Placeholder para rutinas
                PlaceholderSeccion(
                    icono: "clock.fill",
                    titulo: "Rutinas Familiares",
                    descripcion: "Crea rutinas basadas en neurociencia para tu familia",
                    color: .orange
                )
            } else {
                // Lista de rutinas (cuando se implementen)
                LazyVStack(spacing: 12) {
                    ForEach(rutinas) { rutina in
                        RutinaCard(rutina: rutina)
                    }
                }
                .padding(.horizontal)
            }
        }
        .padding(.vertical)
    }
}

struct SeccionHabitos: View {
    let habitos: [Capa5Habit]
    
    var body: some View {
        VStack(spacing: 16) {
            // Header de sección
            HStack {
                Image(systemName: "repeat.circle.fill")
                                    .foregroundColor(.blue)
                Text("Hábitos Medibles")
                                    .font(.title2)
                                    .fontWeight(.semibold)
                Spacer()
            }
            .padding(.horizontal)
            
            if habitos.isEmpty {
                // Placeholder para hábitos
                PlaceholderSeccion(
                    icono: "repeat.circle.fill",
                    titulo: "Hábitos Medibles",
                    descripcion: "Desarrolla hábitos diarios con seguimiento de progreso",
                    color: .blue
                )
            } else {
                // Lista de hábitos (cuando se implementen)
                LazyVStack(spacing: 12) {
                    ForEach(habitos) { habito in
                        HabitoCard(habito: habito)
                    }
                }
                .padding(.horizontal)
            }
        }
        .padding(.vertical)
    }
}

struct SeccionDesafios: View {
    let desafios: [Capa5Challenge]
    
    var body: some View {
        VStack(spacing: 16) {
            // Header de sección
                            HStack {
                Image(systemName: "trophy.fill")
                                    .foregroundColor(.orange)
                Text("Desafíos Familiares")
                                    .font(.title2)
                                    .fontWeight(.semibold)
                Spacer()
            }
            .padding(.horizontal)
            
            if desafios.isEmpty {
                // Placeholder para desafíos
                PlaceholderSeccion(
                    icono: "trophy.fill",
                    titulo: "Desafíos Familiares",
                    descripcion: "Retos semanales para aplicar conocimientos en familia",
                    color: .orange
                )
            } else {
                // Lista de desafíos (cuando se implementen)
                LazyVStack(spacing: 12) {
                    ForEach(desafios) { desafio in
                        DesafioCard(desafio: desafio)
                    }
                }
                .padding(.horizontal)
            }
        }
        .padding(.vertical)
    }
}

struct SeccionReflexion: View {
    @State private var reflexionActual = ""
    @State private var emocionSeleccionada: EmocionReflexion = .alegria
    @State private var mostrarEditor = false
    @State private var reflexionesGuardadas: [Capa5Reflection] = []
    
    var body: some View {
        VStack(spacing: 20) {
            // Header de sección
            HStack {
                Image(systemName: "book.closed.fill")
                    .foregroundColor(.purple)
                Text("Reflexión Diaria")
                    .font(.title2)
                    .fontWeight(.semibold)
                Spacer()
                
                Button(action: {
                    withAnimation(.spring(response: 0.6, dampingFraction: 0.8)) {
                        mostrarEditor = true
                    }
                }) {
                    Image(systemName: "plus.circle.fill")
                        .font(.title2)
                        .foregroundColor(.purple)
                }
            }
            .padding(.horizontal)
            
            // Selector de emociones
            VStack(alignment: .leading, spacing: 12) {
                Text("¿Cómo te sientes hoy?")
                                    .font(.headline)
                    .fontWeight(.semibold)
                    .foregroundColor(.primary)
                                
                                ScrollView(.horizontal, showsIndicators: false) {
                                    HStack(spacing: 12) {
                        ForEach(EmocionReflexion.allCases, id: \.self) { emocion in
                            EmocionButton(
                                emocion: emocion,
                                isSelected: emocionSeleccionada == emocion,
                                            action: {
                                    withAnimation(.spring(response: 0.4, dampingFraction: 0.6)) {
                                        emocionSeleccionada = emocion
                                    }
                                }
                            )
                        }
                    }
                    .padding(.horizontal)
                }
            }
            
            // Editor de reflexión
            VStack(alignment: .leading, spacing: 12) {
                Text("Reflexiona sobre tu día")
                    .font(.headline)
                    .fontWeight(.semibold)
                    .foregroundColor(.primary)
                
                VStack(spacing: 8) {
                    TextEditor(text: $reflexionActual)
                        .frame(minHeight: 100)
                        .padding(12)
                        .background(
                            RoundedRectangle(cornerRadius: 12)
                                .fill(Color(.secondarySystemBackground))
                        )
                        .overlay(
                            RoundedRectangle(cornerRadius: 12)
                                .stroke(Color.purple.opacity(0.3), lineWidth: 1)
                        )
                    
                    if reflexionActual.isEmpty {
                        Text("Escribe sobre tu día, aprendizajes, momentos especiales...")
                            .font(.caption)
                            .foregroundColor(.secondary)
                            .padding(.horizontal, 4)
                    }
                }
                
                // Botones de acción
                HStack(spacing: 12) {
                    Button(action: {
                        guardarReflexion()
                    }) {
                        HStack {
                            Image(systemName: "checkmark.circle.fill")
                            Text("Guardar Reflexión")
                        }
                        .font(.subheadline)
                        .fontWeight(.medium)
                        .foregroundColor(.white)
                        .padding(.horizontal, 16)
                        .padding(.vertical, 8)
                        .background(
                            RoundedRectangle(cornerRadius: 20)
                                .fill(Color.purple)
                        )
                    }
                    .disabled(reflexionActual.isEmpty)
                    .opacity(reflexionActual.isEmpty ? 0.5 : 1.0)
                    
                    Button(action: {
                        limpiarReflexion()
                    }) {
                        HStack {
                            Image(systemName: "trash.circle.fill")
                            Text("Limpiar")
                        }
                        .font(.subheadline)
                        .fontWeight(.medium)
                        .foregroundColor(.red)
                        .padding(.horizontal, 16)
                        .padding(.vertical, 8)
                        .background(
                            RoundedRectangle(cornerRadius: 20)
                                .fill(Color.red.opacity(0.1))
                        )
                    }
                    .disabled(reflexionActual.isEmpty)
                    .opacity(reflexionActual.isEmpty ? 0.5 : 1.0)
                    
                    Spacer()
                                        }
                                    }
                                    .padding(.horizontal)
            
            // Historial de reflexiones
            if !reflexionesGuardadas.isEmpty {
                VStack(alignment: .leading, spacing: 12) {
                    Text("Reflexiones Recientes")
                        .font(.headline)
                        .fontWeight(.semibold)
                        .foregroundColor(.primary)
                    
                    ScrollView {
                        LazyVStack(spacing: 8) {
                            ForEach(reflexionesGuardadas.prefix(3)) { reflexion in
                                ReflexionCard(reflexion: reflexion)
                            }
                        }
                    }
                    .frame(maxHeight: 200)
                }
                .padding(.horizontal)
            }
        }
        .padding(.vertical)
        .sheet(isPresented: $mostrarEditor) {
            EditorReflexionCompleto(
                emocionSeleccionada: $emocionSeleccionada,
                reflexionActual: $reflexionActual,
                onSave: { reflexion in
                    reflexionesGuardadas.insert(reflexion, at: 0)
                    mostrarEditor = false
                }
            )
        }
    }
    
    private func guardarReflexion() {
        let nuevaReflexion = Capa5Reflection(
            titulo: "Reflexión del día",
            contenido: reflexionActual,
            emociones: [emocionSeleccionada],
            aprendizajes: [],
            gratitud: []
        )
        
        reflexionesGuardadas.insert(nuevaReflexion, at: 0)
        limpiarReflexion()
        
        // Feedback haptic
        #if canImport(UIKit)
        let impactFeedback = UIImpactFeedbackGenerator(style: .medium)
        impactFeedback.impactOccurred()
        #endif
    }
    
    private func limpiarReflexion() {
        withAnimation(.easeInOut(duration: 0.3)) {
            reflexionActual = ""
            emocionSeleccionada = .alegria
        }
    }
}

// MARK: - Componentes de Reflexión

struct EmocionButton: View {
    let emocion: EmocionReflexion
    let isSelected: Bool
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            VStack(spacing: 6) {
                Image(systemName: emocion.icono)
                    .font(.title2)
                    .foregroundColor(isSelected ? .white : Color(emocion.color))
                
                Text(emocion.rawValue)
                    .font(.caption)
                    .fontWeight(.medium)
                    .foregroundColor(isSelected ? .white : .primary)
            }
            .padding(.horizontal, 12)
            .padding(.vertical, 8)
            .background(
                RoundedRectangle(cornerRadius: 16)
                    .fill(isSelected ? Color(emocion.color) : Color(.secondarySystemBackground))
            )
            .scaleEffect(isSelected ? 1.05 : 1.0)
            .animation(.spring(response: 0.3, dampingFraction: 0.6), value: isSelected)
        }
        .buttonStyle(PlainButtonStyle())
    }
}

struct ReflexionCard: View {
    let reflexion: Capa5Reflection
    
    var body: some View {
                            VStack(alignment: .leading, spacing: 8) {
            HStack {
                if let primeraEmocion = reflexion.emociones.first {
                    Image(systemName: primeraEmocion.icono)
                        .foregroundColor(Color(primeraEmocion.color))
                    
                    Text(primeraEmocion.rawValue)
                        .font(.caption)
                        .fontWeight(.medium)
                        .foregroundColor(Color(primeraEmocion.color))
                }
                
                Spacer()
                
                Text(reflexion.fecha, style: .date)
                    .font(.caption2)
                                    .foregroundColor(.secondary)
            }
            
            Text(reflexion.contenido)
                .font(.body)
                .foregroundColor(.primary)
                .lineLimit(3)
        }
        .padding(12)
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(Color(.systemBackground))
                .shadow(color: .black.opacity(0.05), radius: 4, x: 0, y: 2)
        )
    }
}

struct EditorReflexionCompleto: View {
    @Binding var emocionSeleccionada: EmocionReflexion
    @Binding var reflexionActual: String
    let onSave: (Capa5Reflection) -> Void
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                // Selector de emociones expandido
                VStack(alignment: .leading, spacing: 12) {
                    Text("¿Cómo te sientes hoy?")
                        .font(.headline)
                        .fontWeight(.semibold)
                    
                    LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 3), spacing: 12) {
                        ForEach(EmocionReflexion.allCases, id: \.self) { emocion in
                            EmocionButton(
                                emocion: emocion,
                                isSelected: emocionSeleccionada == emocion,
                                                action: {
                                    withAnimation(.spring(response: 0.4, dampingFraction: 0.6)) {
                                        emocionSeleccionada = emocion
                                    }
                                }
                            )
                        }
                    }
                }
                
                // Editor expandido
                VStack(alignment: .leading, spacing: 12) {
                    Text("Reflexiona sobre tu día")
                        .font(.headline)
                        .fontWeight(.semibold)
                    
                    TextEditor(text: $reflexionActual)
                        .frame(minHeight: 200)
                        .padding(12)
                        .background(
                            RoundedRectangle(cornerRadius: 12)
                                .fill(Color(.secondarySystemBackground))
                        )
                        .overlay(
                            RoundedRectangle(cornerRadius: 12)
                                .stroke(Color.purple.opacity(0.3), lineWidth: 1)
                        )
                }
                
                Spacer()
            }
            .padding()
            .navigationTitle("Reflexión Diaria")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancelar") {
                        dismiss()
                    }
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Guardar") {
                        let reflexion = Capa5Reflection(
                            titulo: "Reflexión del día",
                            contenido: reflexionActual,
                            emociones: [emocionSeleccionada],
                            aprendizajes: [],
                            gratitud: []
                        )
                        onSave(reflexion)
                    }
                    .disabled(reflexionActual.isEmpty)
                }
            }
        }
    }
}

struct SeccionProgreso: View {
    let progreso: Capa5Progress
    @State private var mostrarEstadisticas = false
    @State private var mostrarMedallas = false
    
    var body: some View {
        VStack(spacing: 20) {
            // Header de sección
                            HStack {
                Image(systemName: "chart.line.uptrend.xyaxis")
                                    .foregroundColor(.green)
                Text("Progreso Familiar")
                                    .font(.title2)
                                    .fontWeight(.semibold)
                                Spacer()
                
                Button(action: {
                    withAnimation(.spring(response: 0.6, dampingFraction: 0.8)) {
                        mostrarEstadisticas = true
                    }
                }) {
                    Image(systemName: "chart.bar.fill")
                        .font(.title2)
                        .foregroundColor(.green)
                }
            }
            .padding(.horizontal)
            
            // Progreso general circular
            VStack(spacing: 16) {
                Text("Progreso General")
                    .font(.headline)
                    .fontWeight(.semibold)
                    .foregroundColor(.primary)
                
                ZStack {
                    // Círculo de fondo
                    Circle()
                        .stroke(Color.gray.opacity(0.2), lineWidth: 12)
                        .frame(width: 120, height: 120)
                    
                    // Círculo de progreso
                    let progresoCalculado = Double(progreso.rutinasCompletadas + progreso.habitosActivos + progreso.desafiosCompletados + progreso.reflexionesEscritas) / 40.0 // Máximo estimado
                    Circle()
                        .trim(from: 0, to: min(progresoCalculado, 1.0))
                        .stroke(
                            LinearGradient(
                                gradient: Gradient(colors: [.green, .mint]),
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            ),
                            style: StrokeStyle(lineWidth: 12, lineCap: .round)
                        )
                        .frame(width: 120, height: 120)
                        .rotationEffect(.degrees(-90))
                        .animation(.easeInOut(duration: 1.5), value: progresoCalculado)
                    
                    // Porcentaje
                    VStack(spacing: 4) {
                        Text("\(Int(min(progresoCalculado, 1.0) * 100))%")
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(.green)
                        
                        Text("Completado")
                                    .font(.caption)
                                    .foregroundColor(.secondary)
                    }
                }
                
                Text("¡Excelente progreso familiar!")
                    .font(.subheadline)
                    .foregroundColor(.green)
                    .fontWeight(.medium)
            }
            .padding(20)
            .background(
                RoundedRectangle(cornerRadius: 16)
                    .fill(Color(.secondarySystemBackground))
                    .shadow(color: .black.opacity(0.05), radius: 8, x: 0, y: 4)
            )
            .padding(.horizontal)
            
            // Estadísticas rápidas
            VStack(spacing: 12) {
                Text("Estadísticas Rápidas")
                    .font(.headline)
                    .fontWeight(.semibold)
                    .foregroundColor(.primary)
                
                LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 2), spacing: 12) {
                    EstadisticaCard(
                        icono: "clock.fill",
                        titulo: "Rutinas",
                        valor: "\(progreso.rutinasCompletadas)",
                        total: "10",
                        color: .orange
                    )
                    
                    EstadisticaCard(
                        icono: "flame.fill",
                        titulo: "Hábitos",
                        valor: "\(progreso.habitosActivos)",
                        total: "10",
                        color: .red
                    )
                    
                    EstadisticaCard(
                        icono: "trophy.fill",
                        titulo: "Desafíos",
                        valor: "\(progreso.desafiosCompletados)",
                        total: "10",
                        color: .blue
                    )
                    
                    EstadisticaCard(
                        icono: "book.fill",
                        titulo: "Reflexiones",
                        valor: "\(progreso.reflexionesEscritas)",
                        total: "10",
                        color: .purple
                    )
                }
            }
            .padding(.horizontal)
            
            // Medallas obtenidas
            VStack(alignment: .leading, spacing: 12) {
                HStack {
                    Text("Medallas Obtenidas")
                        .font(.headline)
                        .fontWeight(.semibold)
                        .foregroundColor(.primary)
                    
                    Spacer()
                    
                    Text("\(progreso.medallas.count)")
                        .font(.caption)
                        .fontWeight(.bold)
                        .foregroundColor(.green)
                }
                
                if progreso.medallas.isEmpty {
                    Text("¡Completa actividades para obtener medallas!")
                        .font(.caption)
                        .foregroundColor(.secondary)
                        .padding(.vertical, 8)
                } else {
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 12) {
                            ForEach(progreso.medallas.prefix(3), id: \.self) { medalla in
                                MedallaSimpleCard(titulo: medalla)
                            }
                        }
                        .padding(.horizontal)
                    }
                }
            }
            .padding(.horizontal)
            
            // Botón de estadísticas detalladas
            Button(action: {
                withAnimation(.spring(response: 0.6, dampingFraction: 0.8)) {
                    mostrarEstadisticas = true
                }
            }) {
                            HStack {
                    Image(systemName: "chart.bar.fill")
                    Text("Ver Estadísticas Detalladas")
                }
                .font(.headline)
                .foregroundColor(.white)
                .padding(.horizontal, 24)
                .padding(.vertical, 12)
                .background(
                    RoundedRectangle(cornerRadius: 25)
                        .fill(
                            LinearGradient(
                                gradient: Gradient(colors: [.green, .mint]),
                                startPoint: .leading,
                                endPoint: .trailing
                            )
                        )
                )
                .shadow(color: .green.opacity(0.3), radius: 8, x: 0, y: 4)
            }
            .padding(.horizontal)
        }
        .padding(.vertical)
        .sheet(isPresented: $mostrarEstadisticas) {
            EstadisticasDetalladasView(progreso: progreso)
        }
    }
}

// MARK: - Componentes de Progreso

struct EstadisticaCard: View {
    let icono: String
    let titulo: String
    let valor: String
    let total: String
    let color: Color
    
    var body: some View {
        VStack(spacing: 8) {
            Image(systemName: icono)
                                    .font(.title2)
                .foregroundColor(color)
            
            Text(titulo)
                .font(.caption)
                .fontWeight(.medium)
                .foregroundColor(.secondary)
            
            Text(valor)
                .font(.title2)
                .fontWeight(.bold)
                .foregroundColor(.primary)
            
            Text("de \(total)")
                .font(.caption2)
                .foregroundColor(.secondary)
        }
        .padding(12)
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(Color(.systemBackground))
                .shadow(color: .black.opacity(0.05), radius: 4, x: 0, y: 2)
        )
    }
}

struct MedallaSimpleCard: View {
    let titulo: String
    
    var body: some View {
        VStack(spacing: 8) {
            Image(systemName: "trophy.fill")
                .font(.title)
                .foregroundColor(.orange)
            
            Text(titulo)
                .font(.caption)
                .fontWeight(.medium)
                .foregroundColor(.primary)
                .multilineTextAlignment(.center)
                .lineLimit(2)
        }
        .padding(12)
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(Color(.systemBackground))
                .shadow(color: .black.opacity(0.05), radius: 4, x: 0, y: 2)
        )
        .frame(width: 100)
    }
}

struct EstadisticasDetalladasView: View {
    let progreso: Capa5Progress
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        NavigationView {
            ScrollView {
                    VStack(spacing: 20) {
                    GraficoSemanalView()
                    EstadisticasDetalladasSection(progreso: progreso)
                    InformacionAdicionalSection(progreso: progreso)
                }
                .padding()
            }
            .navigationTitle("Estadísticas")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Cerrar") {
                        dismiss()
                    }
                }
            }
        }
    }
}

struct GraficoSemanalView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Progreso Semanal")
                            .font(.headline)
                .fontWeight(.semibold)
            
            HStack(alignment: .bottom, spacing: 8) {
                ForEach(0..<7) { dia in
                    VStack(spacing: 4) {
                        RoundedRectangle(cornerRadius: 4)
                            .fill(Color.green.opacity(0.7))
                            .frame(width: 30, height: CGFloat.random(in: 20...80))
                        
                        Text(["L", "M", "X", "J", "V", "S", "D"][dia])
                            .font(.caption2)
                            .foregroundColor(.secondary)
                    }
                }
            }
            .frame(height: 100)
        }
        .padding(16)
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(Color(.secondarySystemBackground))
        )
    }
}

struct EstadisticasDetalladasSection: View {
    let progreso: Capa5Progress
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Estadísticas Detalladas")
                .font(.headline)
                .fontWeight(.semibold)
            
            VStack(spacing: 12) {
                EstadisticaDetallada(
                    titulo: "Rutinas Completadas",
                    valor: progreso.rutinasCompletadas,
                    total: 10,
                    color: .orange
                )
                
                EstadisticaDetallada(
                    titulo: "Hábitos Activos",
                    valor: progreso.habitosActivos,
                    total: 10,
                    color: .red
                )
                
                EstadisticaDetallada(
                    titulo: "Desafíos Completados",
                    valor: progreso.desafiosCompletados,
                    total: 10,
                    color: .blue
                )
                
                EstadisticaDetallada(
                    titulo: "Reflexiones Registradas",
                    valor: progreso.reflexionesEscritas,
                    total: 10,
                    color: .purple
                )
            }
        }
        .padding(16)
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(Color(.secondarySystemBackground))
        )
    }
}

struct InformacionAdicionalSection: View {
    let progreso: Capa5Progress
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Información Adicional")
                .font(.headline)
                .fontWeight(.semibold)
            
            VStack(spacing: 12) {
                HStack {
                    Text("Streak General:")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                    Spacer()
                    Text("\(progreso.streakGeneral) días")
                        .font(.subheadline)
                        .fontWeight(.bold)
                        .foregroundColor(.green)
                }
                
                HStack {
                    Text("Puntos Totales:")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                    Spacer()
                    Text("\(progreso.puntos)")
                        .font(.subheadline)
                        .fontWeight(.bold)
                        .foregroundColor(.blue)
                }
                
                HStack {
                    Text("Nivel Actual:")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                    Spacer()
                    Text("Nivel \(progreso.nivel)")
                        .font(.subheadline)
                        .fontWeight(.bold)
                        .foregroundColor(.purple)
                }
            }
        }
        .padding(16)
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(Color(.secondarySystemBackground))
        )
    }
}

struct EstadisticaDetallada: View {
    let titulo: String
    let valor: Int
    let total: Int
    let color: Color
    
    var porcentaje: Double {
        guard total > 0 else { return 0 }
        return Double(valor) / Double(total)
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                Text(titulo)
                    .font(.subheadline)
                    .fontWeight(.medium)
                    .foregroundColor(.primary)
                
                Spacer()
                
                Text("\(valor)/\(total)")
                    .font(.subheadline)
                    .fontWeight(.bold)
                    .foregroundColor(color)
            }
            
            ZStack(alignment: .leading) {
                RoundedRectangle(cornerRadius: 4)
                    .fill(Color.gray.opacity(0.2))
                    .frame(height: 8)
                
                RoundedRectangle(cornerRadius: 4)
                    .fill(color)
                    .frame(width: CGFloat(porcentaje) * 300, height: 8)
                    .animation(.easeInOut(duration: 1.0), value: porcentaje)
            }
            .frame(width: 300)
        }
    }
}


// MARK: - Componentes de Ayuda

struct EstadisticaRapida: View {
    let icono: String
    let titulo: String
    let valor: String
    let color: Color
    
    var body: some View {
        HStack(spacing: 8) {
            Image(systemName: icono)
                .font(.caption)
                .foregroundColor(color)
                .frame(width: 16)
            
            VStack(alignment: .leading, spacing: 2) {
                Text(titulo)
                    .font(.caption2)
                    .foregroundColor(.secondary)
                
                Text(valor)
                    .font(.caption)
                    .fontWeight(.semibold)
                    .foregroundColor(.primary)
            }
        }
    }
}

struct PlaceholderSeccion: View {
    let icono: String
    let titulo: String
    let descripcion: String
    let color: Color
    
    var body: some View {
        VStack(spacing: 16) {
            Image(systemName: icono)
                .font(.system(size: 48))
                .foregroundColor(color.opacity(0.6))
            
            VStack(spacing: 8) {
                Text(titulo)
                    .font(.title3)
                    .fontWeight(.semibold)
                    .foregroundColor(.primary)
                
                Text(descripcion)
                    .font(.body)
                    .foregroundColor(.secondary)
                    .multilineTextAlignment(.center)
                    .lineSpacing(4)
            }
            
            Button(action: {
                // Acción para agregar contenido
            }) {
                HStack {
                    Image(systemName: "plus.circle.fill")
                    Text("Agregar \(titulo)")
                }
                .font(.subheadline)
                .fontWeight(.medium)
                .foregroundColor(.white)
                .padding(.horizontal, 20)
                .padding(.vertical, 12)
                .background(
                    RoundedRectangle(cornerRadius: 12)
                        .fill(color)
                )
            }
            .buttonStyle(Capa5ScaleButtonStyle())
        }
        .padding(24)
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(Color(.secondarySystemBackground))
                .shadow(color: .black.opacity(0.1), radius: 8, x: 0, y: 4)
        )
        .padding(.horizontal)
    }
}

// MARK: - Cards de Contenido (Placeholders)

struct RutinaCard: View {
    let rutina: Capa5Routine
    @State private var isPressed = false
    @State private var mostrarDetalle = false
    
    var body: some View {
        Button(action: {
            withAnimation(.spring(response: 0.6, dampingFraction: 0.8)) {
                mostrarDetalle = true
            }
        }) {
            VStack(alignment: .leading, spacing: 16) {
                // Header con gradiente y animación
                HStack {
                    // Icono con animación de respiración
                    ZStack {
                        Circle()
                            .fill(
                                LinearGradient(
                                    gradient: Gradient(colors: [
                                        Color(rutina.color).opacity(0.8),
                                        Color(rutina.color).opacity(0.4)
                                    ]),
                                    startPoint: .topLeading,
                                    endPoint: .bottomTrailing
                                )
                            )
                            .frame(width: 50, height: 50)
                            .scaleEffect(isPressed ? 1.1 : 1.0)
                            .animation(.easeInOut(duration: 2.0).repeatForever(autoreverses: true), value: isPressed)
                        
                        Image(systemName: rutina.icono)
                            .font(.title2)
                            .foregroundColor(.white)
                            .fontWeight(.semibold)
                    }
                    
                    VStack(alignment: .leading, spacing: 4) {
                        Text(rutina.titulo)
                            .font(.headline)
                            .fontWeight(.bold)
                            .foregroundColor(.primary)
                            .multilineTextAlignment(.leading)
                            .lineLimit(2)
                        
                        HStack {
                            Image(systemName: rutina.categoria.icono)
                                .font(.caption)
                                .foregroundColor(Color(rutina.categoria.color))
                            
                            Text(rutina.categoria.rawValue)
                                .font(.caption)
                                .foregroundColor(Color(rutina.categoria.color))
                            
                            Spacer()
                            
                            HStack {
                                Image(systemName: rutina.frecuencia.icono)
                                    .font(.caption)
                                    .foregroundColor(Color(rutina.frecuencia.color))
                                
                                Text(rutina.frecuencia.rawValue)
                                    .font(.caption)
                                    .foregroundColor(Color(rutina.frecuencia.color))
                            }
                        }
                    }
                    
                    Spacer()
                    
                    // Botón de acción con animación
                    VStack(spacing: 4) {
                        Image(systemName: "play.circle.fill")
                            .font(.title2)
                            .foregroundColor(Color(rutina.color))
                            .scaleEffect(isPressed ? 1.2 : 1.0)
                            .animation(.spring(response: 0.3, dampingFraction: 0.6), value: isPressed)
                        
                        Text("Iniciar")
                            .font(.caption2)
                            .fontWeight(.medium)
                            .foregroundColor(Color(rutina.color))
                    }
                }
                
                // Descripción con diseño orgánico
                VStack(alignment: .leading, spacing: 8) {
                    Text(rutina.descripcion)
                        .font(.body)
                        .foregroundColor(.secondary)
                        .lineLimit(3)
                        .multilineTextAlignment(.leading)
                        .lineSpacing(2)
                    
                    // Información adicional con iconos
                    HStack(spacing: 16) {
                        HStack(spacing: 4) {
                            Image(systemName: "clock.fill")
                                .font(.caption)
                                .foregroundColor(.orange)
                            
                            Text(rutina.duracion)
                                .font(.caption)
                                .foregroundColor(.orange)
                        }
                        
                        HStack(spacing: 4) {
                            Image(systemName: rutina.edadRecomendada.icono)
                                .font(.caption)
                                .foregroundColor(Color(rutina.edadRecomendada.color))
                            
                            Text(rutina.edadRecomendada.rawValue)
                                .font(.caption)
                                .foregroundColor(Color(rutina.edadRecomendada.color))
                        }
                        
                        Spacer()
                        
                        // Indicador de completado
                        HStack(spacing: 4) {
                            Image(systemName: rutina.completada ? "checkmark.circle.fill" : "circle")
                                .font(.caption)
                                .foregroundColor(rutina.completada ? .green : .gray)
                            
                            Text(rutina.completada ? "Completada" : "Pendiente")
                                .font(.caption)
                                .foregroundColor(rutina.completada ? .green : .gray)
                        }
                    }
                    .padding(.top, 4)
                }
                
                // Barra de progreso visual con efecto orgánico
                        HStack {
                    ForEach(0..<5) { index in
                        Circle()
                            .fill(
                                LinearGradient(
                                    gradient: Gradient(colors: [
                                        Color(rutina.color).opacity(0.6),
                                        Color(rutina.color).opacity(0.3)
                                    ]),
                                    startPoint: .topLeading,
                                    endPoint: .bottomTrailing
                                )
                            )
                            .frame(width: 8, height: 8)
                            .scaleEffect(isPressed ? 1.2 : 1.0)
                            .animation(.easeInOut(duration: 0.5).delay(Double(index) * 0.1), value: isPressed)
                    }
                    
                    Spacer()
                    
                    Text("Toca para explorar")
                        .font(.caption2)
                        .foregroundColor(.secondary)
                }
            }
            .padding(20)
            .background(
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color(.systemBackground))
                    .shadow(color: .black.opacity(0.1), radius: 12, x: 0, y: 6)
            )
            .overlay(
                RoundedRectangle(cornerRadius: 20)
                    .stroke(
                        LinearGradient(
                            gradient: Gradient(colors: [
                                Color(rutina.color).opacity(0.3),
                                Color(rutina.color).opacity(0.1)
                            ]),
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        ),
                        lineWidth: 2
                    )
            )
            .scaleEffect(isPressed ? 0.98 : 1.0)
            .animation(.spring(response: 0.3, dampingFraction: 0.6), value: isPressed)
        }
        .buttonStyle(PlainButtonStyle())
        .onLongPressGesture(minimumDuration: 0) { pressing in
            withAnimation(.easeInOut(duration: 0.1)) {
                isPressed = pressing
            }
        } perform: {
            // Acción de presión larga
        }
        .sheet(isPresented: $mostrarDetalle) {
            RutinaDetalleView(rutina: rutina)
        }
    }
}


struct HabitoCard: View {
    let habito: Capa5Habit
    @State private var mostrarDetalle = false
    
    var body: some View {
        Button(action: {
            mostrarDetalle = true
        }) {
            VStack(alignment: .leading, spacing: 12) {
                HStack {
                    Image(systemName: habito.icono)
                        .font(.title2)
                        .foregroundColor(Color(habito.color))
                    
                    VStack(alignment: .leading, spacing: 4) {
                        Text(habito.titulo)
                            .font(.headline)
                            .fontWeight(.bold)
                            .foregroundColor(.primary)
                            .lineLimit(2)
                        
                        Text(habito.categoria.rawValue)
                                .font(.caption)
                            .foregroundColor(Color(habito.categoria.color))
                    }
                    
                    Spacer()
                }
                
                Text(habito.descripcion)
                    .font(.body)
                    .foregroundColor(.secondary)
                    .lineLimit(2)
                
                HStack {
                    Text("Streak: \(habito.streak) días")
                        .font(.caption)
                        .foregroundColor(.orange)
                    
                    Spacer()
                    
                    Text("Máximo: \(habito.streakMaximo) días")
                                .font(.caption)
                                .foregroundColor(.blue)
                }
            }
            .padding(16)
            .background(
                RoundedRectangle(cornerRadius: 12)
                    .fill(Color(.systemBackground))
                    .shadow(color: .black.opacity(0.1), radius: 4, x: 0, y: 2)
            )
        }
        .buttonStyle(PlainButtonStyle())
        .sheet(isPresented: $mostrarDetalle) {
            HabitoDetalleView(habito: habito)
        }
    }
}

struct DesafioCard: View {
    let desafio: Capa5Challenge
    @State private var isPressed = false
    @State private var mostrarDetalle = false
    @State private var isStarted = false
    
    var body: some View {
        Button(action: {
            withAnimation(.spring(response: 0.6, dampingFraction: 0.8)) {
                mostrarDetalle = true
            }
        }) {
            VStack(alignment: .leading, spacing: 16) {
                // Header con progreso visual
                HStack {
                    // Icono con animación de pulso
                    ZStack {
                        Circle()
                            .fill(
                                LinearGradient(
                                    gradient: Gradient(colors: [
                                        Color(desafio.color).opacity(0.8),
                                        Color(desafio.color).opacity(0.4)
                                    ]),
                                    startPoint: .topLeading,
                                    endPoint: .bottomTrailing
                                )
                            )
                            .frame(width: 50, height: 50)
                            .scaleEffect(isPressed ? 1.1 : 1.0)
                            .animation(.easeInOut(duration: 1.5).repeatForever(autoreverses: true), value: isPressed)
                        
                        Image(systemName: desafio.icono)
                            .font(.title2)
                            .foregroundColor(.white)
                            .fontWeight(.semibold)
                    }
                    
                    VStack(alignment: .leading, spacing: 4) {
                        Text(desafio.titulo)
                            .font(.headline)
                            .fontWeight(.bold)
                            .foregroundColor(.primary)
                            .multilineTextAlignment(.leading)
                            .lineLimit(2)
                        
                        HStack {
                            Image(systemName: desafio.categoria.icono)
                                .font(.caption)
                                .foregroundColor(Color(desafio.categoria.color))
                            
                            Text(desafio.categoria.rawValue)
                                .font(.caption)
                                .foregroundColor(Color(desafio.categoria.color))
                        
                        Spacer()
                        
                        HStack {
                                Image(systemName: "clock.fill")
                                .font(.caption)
                                    .foregroundColor(.orange)
                            
                                Text(desafio.duracion)
                                .font(.caption)
                                    .foregroundColor(.orange)
                            }
                        }
                    }
                    
                    Spacer()
                    
                    // Botón de iniciar con animación
                    Button(action: {
                        withAnimation(.spring(response: 0.4, dampingFraction: 0.6)) {
                            isStarted.toggle()
                        }
                    }) {
                        VStack(spacing: 4) {
                            Image(systemName: isStarted ? "play.circle.fill" : "play.circle")
                                .font(.title2)
                                .foregroundColor(isStarted ? .green : Color(desafio.color))
                                .scaleEffect(isStarted ? 1.2 : 1.0)
                                .animation(.spring(response: 0.3, dampingFraction: 0.6), value: isStarted)
                            
                            Text(isStarted ? "En Progreso" : "Iniciar")
                                .font(.caption2)
                                .fontWeight(.medium)
                                .foregroundColor(isStarted ? .green : Color(desafio.color))
                        }
                    }
                    .buttonStyle(PlainButtonStyle())
                }
                
                // Descripción y información
                VStack(alignment: .leading, spacing: 8) {
                    Text(desafio.descripcion)
                        .font(.body)
                        .foregroundColor(.secondary)
                        .lineLimit(2)
                        .multilineTextAlignment(.leading)
                        .lineSpacing(2)
                    
                    // Información adicional
                    HStack(spacing: 16) {
                        HStack(spacing: 4) {
                            Image(systemName: desafio.edadRecomendada.icono)
                                .font(.caption)
                                .foregroundColor(Color(desafio.edadRecomendada.color))
                            
                            Text(desafio.edadRecomendada.rawValue)
                                .font(.caption)
                                .foregroundColor(Color(desafio.edadRecomendada.color))
                        }
                        
                        Spacer()
                        
                        // Estado del desafío
                        HStack(spacing: 4) {
                            Image(systemName: desafio.activo ? "play.circle.fill" : "pause.circle.fill")
                                .font(.caption)
                                .foregroundColor(desafio.activo ? .green : .gray)
                            
                            Text(desafio.activo ? "Activo" : "Disponible")
                                .font(.caption)
                                .foregroundColor(desafio.activo ? .green : .gray)
                        }
                    }
                    .padding(.top, 4)
                }
                
                // Progreso visual con animación
                VStack(alignment: .leading, spacing: 8) {
                HStack {
                        Text("Progreso del Desafío")
                            .font(.caption)
                            .fontWeight(.medium)
                            .foregroundColor(.secondary)
                        
                        Spacer()
                        
                        Text("\(Int(desafio.progreso * 100))%")
                            .font(.caption)
                            .fontWeight(.bold)
                            .foregroundColor(.green)
                    }
                    
                    // Barra de progreso animada
                    ZStack(alignment: .leading) {
                        RoundedRectangle(cornerRadius: 4)
                            .fill(Color.gray.opacity(0.2))
                            .frame(height: 8)
                        
                        RoundedRectangle(cornerRadius: 4)
                            .fill(
                                LinearGradient(
                                    gradient: Gradient(colors: [.green, .mint]),
                                    startPoint: .leading,
                                    endPoint: .trailing
                                )
                            )
                            .frame(width: CGFloat(desafio.progreso) * 200, height: 8)
                            .animation(.easeInOut(duration: 1.0), value: desafio.progreso)
                    }
                    .frame(width: 200)
                }
                
                // Recompensa y criterios
                HStack {
                    VStack(alignment: .leading, spacing: 4) {
                        Text("Recompensa")
                            .font(.caption2)
                            .foregroundColor(.secondary)
                        
                        Text(desafio.recompensa)
                            .font(.caption)
                            .fontWeight(.semibold)
                            .foregroundColor(.orange)
                    }
                    
                    Spacer()
                    
                    VStack(alignment: .trailing, spacing: 4) {
                        Text("Criterios")
                            .font(.caption2)
                            .foregroundColor(.secondary)
                        
                        Text("\(desafio.criteriosExito.count) objetivos")
                            .font(.caption)
                            .fontWeight(.semibold)
                            .foregroundColor(.blue)
                    }
                }
                
                // Barra de progreso visual con efecto orgánico
                HStack {
                    ForEach(0..<5) { index in
                        Circle()
                            .fill(
                                LinearGradient(
                                    gradient: Gradient(colors: [
                                        Color(desafio.color).opacity(0.6),
                                        Color(desafio.color).opacity(0.3)
                                    ]),
                                    startPoint: .topLeading,
                                    endPoint: .bottomTrailing
                                )
                            )
                            .frame(width: 6, height: 6)
                            .scaleEffect(isPressed ? 1.3 : 1.0)
                            .animation(.easeInOut(duration: 0.3).delay(Double(index) * 0.05), value: isPressed)
                    }
                    
                    Spacer()
                    
                    Text("Toca para ver detalles")
                        .font(.caption2)
                        .foregroundColor(.secondary)
                }
            }
            .padding(20)
            .background(
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color(.systemBackground))
                    .shadow(color: .black.opacity(0.1), radius: 12, x: 0, y: 6)
            )
            .overlay(
                RoundedRectangle(cornerRadius: 20)
                    .stroke(
                        LinearGradient(
                            gradient: Gradient(colors: [
                                Color(desafio.color).opacity(0.3),
                                Color(desafio.color).opacity(0.1)
                            ]),
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        ),
                        lineWidth: 2
                    )
            )
            .scaleEffect(isPressed ? 0.98 : 1.0)
            .animation(.spring(response: 0.3, dampingFraction: 0.6), value: isPressed)
        }
        .buttonStyle(PlainButtonStyle())
        .onLongPressGesture(minimumDuration: 0) { pressing in
            withAnimation(.easeInOut(duration: 0.1)) {
                isPressed = pressing
            }
        } perform: {
            // Acción de presión larga
        }
        .sheet(isPresented: $mostrarDetalle) {
            DesafioDetalleView(desafio: desafio)
        }
    }
}

// MARK: - Vista de Reflexión Diaria
struct ReflexionDiariaView: View {
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Reflexión Diaria")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding()
                
                Text("Esta funcionalidad se implementará en los siguientes pasos")
                    .font(.body)
                    .foregroundColor(.secondary)
                    .multilineTextAlignment(.center)
                    .padding()
                
                Spacer()
            }
            .navigationTitle("Reflexión")
            #if os(iOS)
            .navigationBarTitleDisplayMode(.inline)
            #endif
            .toolbar {
                #if os(iOS)
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Cerrar") {
                        dismiss()
                    }
                }
                #endif
            }
        }
    }
}

// MARK: - Enums y Estructuras de Soporte

enum SeccionCapa5: String, CaseIterable {
    case rutinas = "Rutinas"
    case habitos = "Hábitos"
    case desafios = "Desafíos"
    case reflexion = "Reflexión"
    case progreso = "Progreso"
    
    var titulo: String {
        return self.rawValue
    }
    
    var icono: String {
        switch self {
        case .rutinas: return "clock.fill"
        case .habitos: return "repeat.circle.fill"
        case .desafios: return "trophy.fill"
        case .reflexion: return "book.closed.fill"
        case .progreso: return "chart.line.uptrend.xyaxis"
        }
    }
    
    var color: String {
        switch self {
        case .rutinas: return "orange"
        case .habitos: return "blue"
        case .desafios: return "orange"
        case .reflexion: return "purple"
        case .progreso: return "green"
        }
    }
}

// MARK: - Estilo de Botón con Animación
struct Capa5ScaleButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .scaleEffect(configuration.isPressed ? 0.95 : 1.0)
            .animation(.easeInOut(duration: 0.1), value: configuration.isPressed)
    }
}

// MARK: - Vista de Detalle de Rutina
struct RutinaDetalleView: View {
    let rutina: Capa5Routine
    @Environment(\.dismiss) private var dismiss
    @State private var mostrarPasos = false
    @State private var mostrarPrincipios = false
    @State private var mostrarHerramientas = false
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 24) {
                    // Header con gradiente
                    VStack(alignment: .leading, spacing: 16) {
                        HStack {
                            Image(systemName: rutina.icono)
                                .font(.largeTitle)
                                .foregroundColor(Color(rutina.color))
                            
                            VStack(alignment: .leading, spacing: 4) {
                                Text("Rutina Familiar")
                                    .font(.title2)
                                    .fontWeight(.bold)
                                    .foregroundColor(Color(rutina.color))
                                
                                Text("Basada en Neurociencia")
                                    .font(.subheadline)
                                    .foregroundColor(.secondary)
                            }
                            
                            Spacer()
                        }
                        
                        Text(rutina.titulo)
                            .font(.title)
                            .fontWeight(.bold)
                            .multilineTextAlignment(.leading)
                            .lineSpacing(4)
                    }
                    .padding(20)
                    .background(
                        LinearGradient(
                            gradient: Gradient(colors: [
                                Color(rutina.color).opacity(0.1),
                                Color(rutina.color).opacity(0.05)
                            ]),
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
                            Text("Información de la Rutina")
                                .font(.headline)
                                .fontWeight(.semibold)
                        }
                        
                        VStack(alignment: .leading, spacing: 8) {
                            InfoRow(icon: "clock.fill", title: "Duración", value: rutina.duracion, color: .orange)
                            InfoRow(icon: "repeat", title: "Frecuencia", value: rutina.frecuencia.rawValue, color: Color(rutina.frecuencia.color))
                            InfoRow(icon: rutina.categoria.icono, title: "Categoría", value: rutina.categoria.rawValue, color: Color(rutina.categoria.color))
                            InfoRow(icon: rutina.edadRecomendada.icono, title: "Edad Recomendada", value: rutina.edadRecomendada.rawValue, color: Color(rutina.edadRecomendada.color))
                        }
                    }
                    .padding(16)
                    .background(Color(.secondarySystemBackground))
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
                        
                        Text(rutina.descripcion)
                            .font(.body)
                            .lineSpacing(6)
                            .foregroundColor(.primary)
                    }
                    .padding(16)
                    .background(Color(.systemBackground))
                    .cornerRadius(12)
                    .shadow(color: .black.opacity(0.05), radius: 4, x: 0, y: 2)
                    
                    // Propósito neurocientífico
                    VStack(alignment: .leading, spacing: 12) {
                        HStack {
                            Image(systemName: "target")
                                .foregroundColor(.purple)
                            Text("Propósito Neurocientífico")
                                .font(.headline)
                                .fontWeight(.semibold)
                        }
                        
                        Text(rutina.proposito)
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
                    
                    // Pasos de la rutina (expandible)
                    VStack(alignment: .leading, spacing: 12) {
                        Button(action: {
                            withAnimation(.spring(response: 0.6, dampingFraction: 0.8)) {
                                mostrarPasos.toggle()
                            }
                        }) {
                            HStack {
                                Image(systemName: "list.number")
                                    .foregroundColor(.green)
                                Text("Pasos de la Rutina")
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
                                ForEach(Array(rutina.pasos.enumerated()), id: \.offset) { index, paso in
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
                    
                    // Principios relacionados (expandible)
                    VStack(alignment: .leading, spacing: 12) {
                        Button(action: {
                            withAnimation(.spring(response: 0.6, dampingFraction: 0.8)) {
                                mostrarPrincipios.toggle()
                            }
                        }) {
                            HStack {
                                Image(systemName: "brain.head.profile")
                                    .foregroundColor(.blue)
                                Text("Principios Relacionados")
                                    .font(.headline)
                                    .fontWeight(.semibold)
                                    .foregroundColor(.primary)
                                
                                Spacer()
                                
                                Image(systemName: mostrarPrincipios ? "chevron.up" : "chevron.down")
                                    .foregroundColor(.blue)
                                    .font(.title3)
                            }
                        }
                        .buttonStyle(PlainButtonStyle())
                        
                        if mostrarPrincipios {
                            LazyVGrid(columns: [
                                GridItem(.flexible()),
                                GridItem(.flexible())
                            ], spacing: 8) {
                                ForEach(rutina.vinculoPrincipios, id: \.self) { principio in
                                    HStack {
                                        Image(systemName: "checkmark.circle.fill")
                                            .font(.caption)
                                            .foregroundColor(.green)
                                        Text(principio)
                                            .font(.caption)
                                            .foregroundColor(.primary)
                                    }
                                    .padding(.horizontal, 8)
                                    .padding(.vertical, 4)
                                    .background(Color.blue.opacity(0.1))
                                    .cornerRadius(6)
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
                    
                    // Herramientas relacionadas (expandible)
                    VStack(alignment: .leading, spacing: 12) {
                        Button(action: {
                            withAnimation(.spring(response: 0.6, dampingFraction: 0.8)) {
                                mostrarHerramientas.toggle()
                            }
                        }) {
                            HStack {
                                Image(systemName: "wrench.and.screwdriver.fill")
                                    .foregroundColor(.orange)
                                Text("Herramientas Relacionadas")
                                    .font(.headline)
                                    .fontWeight(.semibold)
                                    .foregroundColor(.primary)
                                
                                Spacer()
                                
                                Image(systemName: mostrarHerramientas ? "chevron.up" : "chevron.down")
                                    .foregroundColor(.orange)
                                    .font(.title3)
                            }
                        }
                        .buttonStyle(PlainButtonStyle())
                        
                        if mostrarHerramientas {
                            LazyVGrid(columns: [
                                GridItem(.flexible()),
                                GridItem(.flexible())
                            ], spacing: 8) {
                                ForEach(rutina.vinculoHerramientas, id: \.self) { herramienta in
                                    HStack {
                                        Image(systemName: "checkmark.circle.fill")
                                        .font(.caption)
                                            .foregroundColor(.green)
                                        Text(herramienta)
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
                    
                    // Botones de acción
                    HStack(spacing: 12) {
                        Button(action: {
                            // Acción para iniciar rutina
                        }) {
                            HStack {
                                Image(systemName: "play.fill")
                                Text("Iniciar Rutina")
                            }
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding(.horizontal, 20)
                            .padding(.vertical, 12)
                            .background(Color(rutina.color))
                            .cornerRadius(12)
                        }
                        
                        Button(action: {
                            // Acción para marcar como completado
                        }) {
                            HStack {
                                Image(systemName: "checkmark.circle.fill")
                                Text("Completada")
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
            .navigationTitle("Rutina")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Cerrar") {
                        dismiss()
                    }
                    .foregroundColor(Color(rutina.color))
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

// MARK: - Vista de Detalle de Hábito
struct HabitoDetalleView: View {
    let habito: Capa5Habit
    @Environment(\.dismiss) private var dismiss
    @State private var mostrarBaseCientifica = false
    @State private var mostrarEstadisticas = false
    @State private var isCompleted = false
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 24) {
                    // Header con gradiente
                    VStack(alignment: .leading, spacing: 16) {
                        HStack {
                            Image(systemName: habito.icono)
                                .font(.largeTitle)
                                .foregroundColor(Color(habito.color))
                            
                            VStack(alignment: .leading, spacing: 4) {
                                Text("Hábito Familiar")
                                    .font(.title2)
                                    .fontWeight(.bold)
                                    .foregroundColor(Color(habito.color))
                                
                                Text("Seguimiento Neurocientífico")
                                    .font(.subheadline)
                                    .foregroundColor(.secondary)
                            }
                            
                            Spacer()
                        }
                        
                        Text(habito.titulo)
                            .font(.title)
                            .fontWeight(.bold)
                            .multilineTextAlignment(.leading)
                            .lineSpacing(4)
                    }
                    .padding(20)
                    .background(
                        LinearGradient(
                            gradient: Gradient(colors: [
                                Color(habito.color).opacity(0.1),
                                Color(habito.color).opacity(0.05)
                            ]),
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
                            Text("Información del Hábito")
                                .font(.headline)
                                .fontWeight(.semibold)
                        }
                        
                        VStack(alignment: .leading, spacing: 8) {
                            InfoRow(icon: "clock.fill", title: "Duración", value: habito.duracion, color: .orange)
                            InfoRow(icon: "repeat", title: "Frecuencia", value: habito.frecuencia.rawValue, color: .blue)
                            InfoRow(icon: habito.categoria.icono, title: "Categoría", value: habito.categoria.rawValue, color: Color(habito.categoria.color))
                            InfoRow(icon: habito.edadRecomendada.icono, title: "Edad Recomendada", value: habito.edadRecomendada.rawValue, color: Color(habito.edadRecomendada.color))
                        }
                    }
                    .padding(16)
                    .background(Color(.secondarySystemBackground))
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
                        
                        Text(habito.descripcion)
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
                        
                        Text(habito.objetivo)
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
                    
                    // Base científica (expandible)
                    VStack(alignment: .leading, spacing: 12) {
                        Button(action: {
                            withAnimation(.spring(response: 0.6, dampingFraction: 0.8)) {
                                mostrarBaseCientifica.toggle()
                            }
                        }) {
                            HStack {
                                Image(systemName: "atom")
                                    .foregroundColor(.blue)
                                Text("Base Científica")
                                    .font(.headline)
                                    .fontWeight(.semibold)
                                    .foregroundColor(.primary)
                                
                                Spacer()
                                
                                Image(systemName: mostrarBaseCientifica ? "chevron.up" : "chevron.down")
                                    .foregroundColor(.blue)
                                    .font(.title3)
                            }
                        }
                        .buttonStyle(PlainButtonStyle())
                        
                        if mostrarBaseCientifica {
                            Text(habito.baseCientifica)
                                .font(.body)
                                .foregroundColor(.secondary)
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
                    
                    // Estadísticas del hábito (expandible)
                    VStack(alignment: .leading, spacing: 12) {
                        Button(action: {
                            withAnimation(.spring(response: 0.6, dampingFraction: 0.8)) {
                                mostrarEstadisticas.toggle()
                            }
                        }) {
                            HStack {
                                Image(systemName: "chart.bar.fill")
                                    .foregroundColor(.green)
                                Text("Estadísticas del Hábito")
                                    .font(.headline)
                                    .fontWeight(.semibold)
                                    .foregroundColor(.primary)
                                
                                Spacer()
                                
                                Image(systemName: mostrarEstadisticas ? "chevron.up" : "chevron.down")
                                    .foregroundColor(.green)
                                    .font(.title3)
                            }
                        }
                        .buttonStyle(PlainButtonStyle())
                        
                        if mostrarEstadisticas {
                            VStack(spacing: 16) {
                                // Streak actual
                                HStack {
                                    VStack(alignment: .leading, spacing: 4) {
                                        Text("Racha Actual")
                                            .font(.caption)
                                            .foregroundColor(.secondary)
                                        
                                        Text("\(habito.streak) días")
                                            .font(.title2)
                                            .fontWeight(.bold)
                                            .foregroundColor(.green)
                                    }
                                    
                                    Spacer()
                                    
                                    VStack(alignment: .trailing, spacing: 4) {
                                        Text("Racha Máxima")
                                            .font(.caption)
                                            .foregroundColor(.secondary)
                                        
                                        Text("\(habito.streakMaximo) días")
                                            .font(.title2)
                                            .fontWeight(.bold)
                                            .foregroundColor(.blue)
                                    }
                                }
                                
                                // Progreso visual
                                VStack(alignment: .leading, spacing: 8) {
                                    Text("Progreso del Mes")
                                        .font(.caption)
                                        .foregroundColor(.secondary)
                                    
                                    ZStack(alignment: .leading) {
                                        RoundedRectangle(cornerRadius: 8)
                                            .fill(Color.gray.opacity(0.2))
                                            .frame(height: 8)
                                        
                                        RoundedRectangle(cornerRadius: 8)
                                            .fill(
                                                LinearGradient(
                                                    gradient: Gradient(colors: [.green, .mint]),
                                                    startPoint: .leading,
                                                    endPoint: .trailing
                                                )
                                            )
                                            .frame(width: CGFloat(habito.streak) / 30.0 * 200, height: 8)
                                            .animation(.easeInOut(duration: 1.0), value: habito.streak)
                                    }
                                    .frame(width: 200)
                                }
                                
                                // Estadísticas adicionales
                                HStack {
                                    VStack(alignment: .leading, spacing: 4) {
                                        Text("Total Ejecuciones")
                                            .font(.caption)
                                            .foregroundColor(.secondary)
                                        
                                        Text("\(habito.totalEjecuciones)")
                                            .font(.headline)
                                            .fontWeight(.semibold)
                                            .foregroundColor(.orange)
                                    }
                                    
                                    Spacer()
                                    
                                    VStack(alignment: .trailing, spacing: 4) {
                                        Text("Estado")
                                            .font(.caption)
                                            .foregroundColor(.secondary)
                                        
                                        Text(habito.activo ? "Activo" : "Pausado")
                                            .font(.headline)
                                            .fontWeight(.semibold)
                                            .foregroundColor(habito.activo ? .green : .gray)
                                    }
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
                    
                    // Botones de acción
                    HStack(spacing: 12) {
                        Button(action: {
                            withAnimation(.spring(response: 0.4, dampingFraction: 0.6)) {
                                isCompleted.toggle()
                            }
                        }) {
                            HStack {
                                Image(systemName: isCompleted ? "checkmark.circle.fill" : "circle")
                                Text(isCompleted ? "¡Completado!" : "Completar Hoy")
                            }
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding(.horizontal, 20)
                            .padding(.vertical, 12)
                            .background(isCompleted ? Color.green : Color(habito.color))
                            .cornerRadius(12)
                        }
                        
                        Button(action: {
                            // Acción para pausar/reanudar hábito
                        }) {
                            HStack {
                                Image(systemName: habito.activo ? "pause.circle.fill" : "play.circle.fill")
                                Text(habito.activo ? "Pausar" : "Reanudar")
                            }
                            .font(.subheadline)
                            .foregroundColor(.orange)
                            .padding(.horizontal, 16)
                            .padding(.vertical, 8)
                            .background(Color.orange.opacity(0.1))
                            .cornerRadius(8)
                        }
                        
                        Spacer()
                    }
                    .padding(.top, 8)
                }
                .padding()
            }
            .navigationTitle("Hábito")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Cerrar") {
                        dismiss()
                    }
                    .foregroundColor(Color(habito.color))
                }
            }
        }
    }
}

// MARK: - Vista de Detalle de Desafío
struct DesafioDetalleView: View {
    let desafio: Capa5Challenge
    @Environment(\.dismiss) private var dismiss
    @State private var mostrarPasos = false
    @State private var mostrarCriterios = false
    @State private var isStarted = false
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 24) {
                    // Header con gradiente
                    VStack(alignment: .leading, spacing: 16) {
        HStack {
                            Image(systemName: desafio.icono)
                                .font(.largeTitle)
                                .foregroundColor(Color(desafio.color))
                            
                            VStack(alignment: .leading, spacing: 4) {
                                Text("Desafío Familiar")
                                    .font(.title2)
                                    .fontWeight(.bold)
                                    .foregroundColor(Color(desafio.color))
                                
                                Text("Reto Neurocientífico")
                                    .font(.subheadline)
                                    .foregroundColor(.secondary)
                            }
                            
                            Spacer()
                        }
                        
                        Text(desafio.titulo)
                            .font(.title)
                            .fontWeight(.bold)
                            .multilineTextAlignment(.leading)
                            .lineSpacing(4)
                    }
                    .padding(20)
                    .background(
                        LinearGradient(
                            gradient: Gradient(colors: [
                                Color(desafio.color).opacity(0.1),
                                Color(desafio.color).opacity(0.05)
                            ]),
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
                            Text("Información del Desafío")
                                .font(.headline)
                                .fontWeight(.semibold)
                        }
                        
                        VStack(alignment: .leading, spacing: 8) {
                            InfoRow(icon: "clock.fill", title: "Duración", value: desafio.duracion, color: .orange)
                            InfoRow(icon: desafio.categoria.icono, title: "Categoría", value: desafio.categoria.rawValue, color: Color(desafio.categoria.color))
                            InfoRow(icon: desafio.edadRecomendada.icono, title: "Edad Recomendada", value: desafio.edadRecomendada.rawValue, color: Color(desafio.edadRecomendada.color))
                            InfoRow(icon: "trophy.fill", title: "Recompensa", value: desafio.recompensa, color: .orange)
                        }
                    }
                    .padding(16)
                    .background(Color(.secondarySystemBackground))
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
                        
                        Text(desafio.descripcion)
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
                        
                        Text(desafio.objetivo)
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
                    
                    // Pasos del desafío (expandible)
                    VStack(alignment: .leading, spacing: 12) {
                        Button(action: {
                            withAnimation(.spring(response: 0.6, dampingFraction: 0.8)) {
                                mostrarPasos.toggle()
                            }
                        }) {
                            HStack {
                                Image(systemName: "list.number")
                                    .foregroundColor(.green)
                                Text("Pasos del Desafío")
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
                                ForEach(Array(desafio.pasos.enumerated()), id: \.offset) { index, paso in
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
                    
                    // Criterios de éxito (expandible)
                    VStack(alignment: .leading, spacing: 12) {
                        Button(action: {
                            withAnimation(.spring(response: 0.6, dampingFraction: 0.8)) {
                                mostrarCriterios.toggle()
                            }
                        }) {
                            HStack {
                                Image(systemName: "checkmark.circle.fill")
                                    .foregroundColor(.blue)
                                Text("Criterios de Éxito")
                                    .font(.headline)
                                    .fontWeight(.semibold)
                                    .foregroundColor(.primary)
                                
                                Spacer()
                                
                                Image(systemName: mostrarCriterios ? "chevron.up" : "chevron.down")
                                    .foregroundColor(.blue)
                                    .font(.title3)
                            }
                        }
                        .buttonStyle(PlainButtonStyle())
                        
                        if mostrarCriterios {
                            VStack(alignment: .leading, spacing: 8) {
                                ForEach(Array(desafio.criteriosExito.enumerated()), id: \.offset) { index, criterio in
                                    HStack(alignment: .top, spacing: 12) {
                                        Image(systemName: "checkmark.circle.fill")
                .font(.caption)
                                            .foregroundColor(.green)
                                            .frame(width: 20, alignment: .leading)
                                        
                                        Text(criterio)
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
                    
                    // Progreso del desafío
                    VStack(alignment: .leading, spacing: 12) {
                        HStack {
                            Image(systemName: "chart.bar.fill")
                                .foregroundColor(.green)
                            Text("Progreso del Desafío")
                                .font(.headline)
                                .fontWeight(.semibold)
                        }
                        
                        VStack(spacing: 12) {
                            HStack {
                                Text("Progreso Actual")
                                    .font(.caption)
                .foregroundColor(.secondary)
            
            Spacer()
            
                                Text("\(Int(desafio.progreso * 100))%")
                .font(.caption)
                                    .fontWeight(.bold)
                                    .foregroundColor(.green)
                            }
                            
                            ZStack(alignment: .leading) {
                                RoundedRectangle(cornerRadius: 8)
                                    .fill(Color.gray.opacity(0.2))
                                    .frame(height: 12)
                                
                                RoundedRectangle(cornerRadius: 8)
                                    .fill(
                                        LinearGradient(
                                            gradient: Gradient(colors: [.green, .mint]),
                                            startPoint: .leading,
                                            endPoint: .trailing
                                        )
                                    )
                                    .frame(width: CGFloat(desafio.progreso) * 300, height: 12)
                                    .animation(.easeInOut(duration: 1.0), value: desafio.progreso)
                            }
                            .frame(width: 300)
                        }
                    }
                    .padding(16)
                    .background(Color(.systemBackground))
                    .cornerRadius(12)
                    .shadow(color: .black.opacity(0.05), radius: 4, x: 0, y: 2)
                    
                    // Botones de acción
                    HStack(spacing: 12) {
                        Button(action: {
                            withAnimation(.spring(response: 0.4, dampingFraction: 0.6)) {
                                isStarted.toggle()
                            }
                        }) {
                            HStack {
                                Image(systemName: isStarted ? "pause.circle.fill" : "play.circle.fill")
                                Text(isStarted ? "Pausar Desafío" : "Iniciar Desafío")
                            }
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding(.horizontal, 20)
                            .padding(.vertical, 12)
                            .background(isStarted ? Color.orange : Color(desafio.color))
                            .cornerRadius(12)
                        }
                        
                        Button(action: {
                            // Acción para marcar como completado
                        }) {
                            HStack {
                                Image(systemName: "checkmark.circle.fill")
                                Text("Completar")
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
            .navigationTitle("Desafío")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Cerrar") {
                        dismiss()
                    }
                    .foregroundColor(Color(desafio.color))
                }
            }
        }
    }
}

// MARK: - Preview
struct Capa5AplicacionCasaView_Previews: PreviewProvider {
    static var previews: some View {
        Capa5AplicacionCasaView()
    }
}