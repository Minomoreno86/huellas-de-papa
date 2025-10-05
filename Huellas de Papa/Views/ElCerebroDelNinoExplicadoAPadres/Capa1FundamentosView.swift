import SwiftUI

struct Capa1FundamentosView: View {
    @EnvironmentObject private var progresoManager: ProgresoManager
    @State private var capa1: Capa1Fundamentos?
    @State private var ideaSeleccionada: IdeaClave?
    @State private var fraseSeleccionada: FrasePoderosa?
    @State private var mostrarDetalle = false
    
    var body: some View {
        NavigationView {
            ScrollView {
                if let capa1 = capa1 {
                    VStack(alignment: .leading, spacing: 20) {
                    
                    // Header
                    VStack(alignment: .leading, spacing: 10) {
                        HStack {
                            Image(systemName: "brain.head.profile")
                                .font(.largeTitle)
                                .foregroundColor(.blue)
                            
                            VStack(alignment: .leading) {
                                Text("Fundamentos del Libro")
                                    .font(.title2)
                                    .fontWeight(.bold)
                                
                                Text("El cerebro del niño explicado a los padres")
                                    .font(.subheadline)
                                    .foregroundColor(.secondary)
                            }
                            
                            Spacer()
                            
                            // Progreso
                            VStack {
                                CircularProgressView(progress: capa1.progreso)
                                Text("\(Int(capa1.progreso * 100))%")
                                    .font(.caption)
                                    .fontWeight(.medium)
                            }
                        }
                        
                        Text("20 ideas clave + 7 frases poderosas")
                            .font(.caption)
                            .foregroundColor(.secondary)
                    }
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(12)
                    
                    // Ideas Clave
                    VStack(alignment: .leading, spacing: 15) {
                        HStack {
                            Text("🧠 Ideas Clave")
                                .font(.title3)
                                .fontWeight(.bold)
                            
                            Spacer()
                            
                            Text("\(capa1.ideasClave.count) ideas")
                                .font(.caption)
                                .foregroundColor(.secondary)
                        }
                        
                        LazyVStack(spacing: 12) {
                            ForEach(Array(capa1.ideasClave.enumerated()), id: \.offset) { index, idea in
                                IdeaClaveCard(idea: idea, index: index + 1) {
                                    ideaSeleccionada = idea
                                    mostrarDetalle = true
                                }
                            }
                        }
                    }
                    
                    // Frases Poderosas
                    VStack(alignment: .leading, spacing: 15) {
                        HStack {
                            Text("💬 Frases Poderosas")
                                .font(.title3)
                                .fontWeight(.bold)
                            
                            Spacer()
                            
                            Text("\(capa1.frasesPoderosas.count) frases")
                                .font(.caption)
                                .foregroundColor(.secondary)
                        }
                        
                        LazyVStack(spacing: 12) {
                            ForEach(Array(capa1.frasesPoderosas.enumerated()), id: \.offset) { index, frase in
                                FrasePoderosaCard(frase: frase, index: index + 1) {
                                    fraseSeleccionada = frase
                                    mostrarDetalle = true
                                }
                            }
                        }
                    }
                    
                    // Contexto Científico y Cultural
                    VStack(alignment: .leading, spacing: 15) {
                        Text("🔬 Contexto Científico")
                            .font(.title3)
                            .fontWeight(.bold)
                        
                        Text(capa1.contextoCientifico)
                            .font(.body)
                            .lineSpacing(4)
                        
                        Text("🌍 Contexto Cultural")
                            .font(.title3)
                            .fontWeight(.bold)
                        
                        Text(capa1.contextoCultural)
                            .font(.body)
                            .lineSpacing(4)
                    }
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(12)
                    
                    // Resumen Profundo
                    VStack(alignment: .leading, spacing: 15) {
                        Text("📖 Resumen Profundo")
                            .font(.title3)
                            .fontWeight(.bold)
                        
                        Text(capa1.resumenProfundo)
                            .font(.body)
                            .lineSpacing(4)
                    }
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(12)
                    
                }
                .padding()
                } else {
                    VStack {
                        ProgressView("Cargando contenido...")
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                    }
                }
            }
            .navigationTitle("Capa 1")
            .navigationBarTitleDisplayMode(.inline)
            .onAppear {
                print("🔍 DEBUG: Capa1FundamentosView onAppear")
                if capa1 == nil {
                    print("🔍 DEBUG: Cargando contenido de Capa1Fundamentos...")
                    capa1 = Capa1Fundamentos.contenidoCerebroDelNino()
                    print("🔍 DEBUG: Contenido cargado exitosamente")
                }
            }
        }
        .sheet(isPresented: $mostrarDetalle) {
            if let idea = ideaSeleccionada {
                IdeaDetalleView(idea: idea)
            } else if let frase = fraseSeleccionada {
                FraseDetalleView(frase: frase)
            }
        }
    }
}

// MARK: - Componentes de Vista

struct IdeaClaveCard: View {
    let idea: IdeaClave
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
                                    gradient: Gradient(colors: [Color.blue, Color.purple]),
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
                        Text(idea.titulo)
                            .font(.headline)
                            .fontWeight(.semibold)
                            .foregroundColor(.primary)
                            .multilineTextAlignment(.leading)
                            .lineLimit(2)
                        
                        HStack {
                            Image(systemName: "brain.head.profile")
                                .font(.caption)
                                .foregroundColor(.blue)
                            
                            Text(idea.baseCientifica)
                                .font(.caption)
                                .foregroundColor(.blue)
                                .lineLimit(1)
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
                VStack(alignment: .leading, spacing: 8) {
                    Text(idea.explicacion)
                        .font(.body)
                        .foregroundColor(.secondary)
                        .lineLimit(3)
                        .multilineTextAlignment(.leading)
                        .lineSpacing(2)
                    
                    // Indicador de aplicación práctica
                    HStack {
                        Image(systemName: "wrench.and.screwdriver.fill")
                            .font(.caption)
                            .foregroundColor(.green)
                        
                        Text("Incluye aplicación práctica")
                            .font(.caption)
                            .foregroundColor(.green)
                            .fontWeight(.medium)
                        
                        Spacer()
                    }
                    .padding(.top, 4)
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

// MARK: - Estilo de Botón Personalizado
// ScaleButtonStyle está definido en ModuloBase.swift

struct FrasePoderosaCard: View {
    let frase: FrasePoderosa
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
                                    gradient: Gradient(colors: [Color.green, Color.mint]),
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
                        Text(frase.frase)
                            .font(.headline)
                            .fontWeight(.semibold)
                            .foregroundColor(.primary)
                            .multilineTextAlignment(.leading)
                            .italic()
                            .lineLimit(2)
                        
                        HStack {
                            Image(systemName: "quote.bubble.fill")
                                .font(.caption)
                                .foregroundColor(.green)
                            
                            Text("Frase Poderosa")
                                .font(.caption)
                                .foregroundColor(.green)
                                .fontWeight(.medium)
                        }
                    }
                    
                    Spacer()
                    
                    VStack {
                        Image(systemName: "arrow.right.circle.fill")
                            .font(.title2)
                            .foregroundColor(.green)
                        
                        Text("Explorar")
                            .font(.caption2)
                            .foregroundColor(.green)
                    }
                }
                
                // Contenido con diseño mejorado
                VStack(alignment: .leading, spacing: 8) {
                    Text(frase.explicacionDetallada)
                        .font(.body)
                        .foregroundColor(.secondary)
                        .lineLimit(3)
                        .multilineTextAlignment(.leading)
                        .lineSpacing(2)
                    
                    // Indicador de contexto original
                    HStack {
                        Image(systemName: "book.fill")
                            .font(.caption)
                            .foregroundColor(.orange)
                        
                        Text("Incluye contexto original")
                            .font(.caption)
                            .foregroundColor(.orange)
                            .fontWeight(.medium)
                        
                        Spacer()
                    }
                    .padding(.top, 4)
                }
                
                // Barra de progreso visual
                HStack {
                    ForEach(0..<5) { _ in
                        Circle()
                            .fill(Color.green.opacity(0.3))
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
                            gradient: Gradient(colors: [Color.green.opacity(0.3), Color.mint.opacity(0.3)]),
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

// MARK: - Vistas de Detalle

struct IdeaDetalleView: View {
    let idea: IdeaClave
    @Environment(\.dismiss) private var dismiss
    @State private var mostrarAplicacion = false
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 24) {
                    // Header con gradiente
                    VStack(alignment: .leading, spacing: 16) {
                        HStack {
                            Image(systemName: "brain.head.profile")
                                .font(.largeTitle)
                                .foregroundColor(.blue)
                            
                            VStack(alignment: .leading, spacing: 4) {
                                Text("Idea Clave")
                                    .font(.title2)
                                    .fontWeight(.bold)
                                    .foregroundColor(.blue)
                                
                                Text("Neurociencia Práctica")
                                    .font(.subheadline)
                                    .foregroundColor(.secondary)
                            }
                            
                            Spacer()
                        }
                        
                        Text(idea.titulo)
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
                        
                        Text(idea.explicacion)
                            .font(.body)
                            .lineSpacing(6)
                            .foregroundColor(.primary)
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
                        
                        Text(idea.baseCientifica)
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
                                Text(idea.aplicacionPractica)
                                    .font(.body)
                                    .foregroundColor(.primary)
                                    .lineSpacing(4)
                                
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
            .navigationTitle("Idea Clave")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Cerrar") {
                        dismiss()
                    }
                    .foregroundColor(.blue)
                }
            }
        }
    }
}

struct FraseDetalleView: View {
    let frase: FrasePoderosa
    @Environment(\.dismiss) private var dismiss
    @State private var mostrarSignificado = false
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 24) {
                    // Header con gradiente
                    VStack(alignment: .leading, spacing: 16) {
                        HStack {
                            Image(systemName: "quote.bubble.fill")
                                .font(.largeTitle)
                                .foregroundColor(.green)
                            
                            VStack(alignment: .leading, spacing: 4) {
                                Text("Frase Poderosa")
                                    .font(.title2)
                                    .fontWeight(.bold)
                                    .foregroundColor(.green)
                                
                                Text("Sabiduría Práctica")
                                    .font(.subheadline)
                                    .foregroundColor(.secondary)
                            }
                            
                            Spacer()
                        }
                        
                        Text(frase.frase)
                            .font(.title)
                            .fontWeight(.bold)
                            .italic()
                            .multilineTextAlignment(.leading)
                            .lineSpacing(4)
                            .foregroundColor(.primary)
                    }
                    .padding(20)
                    .background(
                        LinearGradient(
                            gradient: Gradient(colors: [Color.green.opacity(0.1), Color.mint.opacity(0.1)]),
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                    )
                    .cornerRadius(16)
                    
                    // Explicación detallada
                    VStack(alignment: .leading, spacing: 12) {
                        HStack {
                            Image(systemName: "lightbulb.fill")
                                .foregroundColor(.yellow)
                            Text("Explicación Detallada")
                                .font(.headline)
                                .fontWeight(.semibold)
                        }
                        
                        Text(frase.explicacionDetallada)
                            .font(.body)
                            .lineSpacing(6)
                            .foregroundColor(.primary)
                    }
                    .padding(16)
                    .background(Color(.systemGray6))
                    .cornerRadius(12)
                    
                    // Contexto original
                    VStack(alignment: .leading, spacing: 12) {
                        HStack {
                            Image(systemName: "book.fill")
                                .foregroundColor(.orange)
                            Text("Contexto Original")
                                .font(.headline)
                                .fontWeight(.semibold)
                        }
                        
                        Text(frase.contextoOriginal)
                            .font(.body)
                            .foregroundColor(.secondary)
                            .padding(.horizontal, 12)
                            .padding(.vertical, 8)
                            .background(Color.orange.opacity(0.1))
                            .cornerRadius(8)
                    }
                    .padding(16)
                    .background(Color(.systemBackground))
                    .cornerRadius(12)
                    .shadow(color: .black.opacity(0.05), radius: 4, x: 0, y: 2)
                    
                    // Significado profundo (expandible)
                    VStack(alignment: .leading, spacing: 12) {
                        Button(action: {
                            withAnimation(.spring(response: 0.6, dampingFraction: 0.8)) {
                                mostrarSignificado.toggle()
                            }
                        }) {
                            HStack {
                                Image(systemName: "brain.head.profile")
                                    .foregroundColor(.purple)
                                Text("Significado Profundo")
                                    .font(.headline)
                                    .fontWeight(.semibold)
                                    .foregroundColor(.primary)
                                
                                Spacer()
                                
                                Image(systemName: mostrarSignificado ? "chevron.up" : "chevron.down")
                                    .foregroundColor(.purple)
                                    .font(.title3)
                            }
                        }
                        .buttonStyle(PlainButtonStyle())
                        
                        if mostrarSignificado {
                            VStack(alignment: .leading, spacing: 8) {
                                Text(frase.significadoProfundo)
                                    .font(.body)
                                    .foregroundColor(.primary)
                                    .lineSpacing(4)
                                
                                // Botones de acción
                                HStack(spacing: 12) {
                                    Button(action: {
                                        // Acción para marcar como favorita
                                    }) {
                                        HStack {
                                            Image(systemName: "heart.fill")
                                            Text("Marcar como Favorita")
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
                                        .foregroundColor(.green)
                                        .padding(.horizontal, 12)
                                        .padding(.vertical, 6)
                                        .background(Color.green.opacity(0.1))
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
            .navigationTitle("Frase Poderosa")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Cerrar") {
                        dismiss()
                    }
                    .foregroundColor(.green)
                }
            }
        }
    }
}

// MARK: - Preview
struct Capa1FundamentosView_Previews: PreviewProvider {
    static var previews: some View {
        Capa1FundamentosView()
    }
}
