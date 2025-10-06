import SwiftUI

struct Capa2PrincipiosView: View {
    let principios: Capa2Principios = Capa2Principios.contenidoCerebroDelNino()
    @State private var principioSeleccionado: PrincipioClave? = nil
    @State private var mostrarEstrategias = false
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 25) {
                // Header simplificado
                VStack(alignment: .leading, spacing: 12) {
                    HStack {
                        Image(systemName: "lightbulb.fill")
                            .font(.title2)
                            .foregroundColor(.orange)
                        Text("Principios Clave")
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundColor(.orange)
                    }
                    
                    Text("Los pilares fundamentales de la crianza basada en neurociencia")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
                .padding()
                .background(
                    LinearGradient(
                        gradient: Gradient(colors: [Color.orange.opacity(0.1), Color.yellow.opacity(0.1)]),
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
                    
                    Text(principios.introduccion)
                        .font(.body)
                        .lineSpacing(6)
                        .padding()
                        .background(Color(.systemGray6))
                        .cornerRadius(12)
                }
                
                // Principios Clave con diseño mejorado
                VStack(alignment: .leading, spacing: 20) {
                    HStack {
                        Image(systemName: "star.fill")
                            .foregroundColor(.orange)
                        Text("9 Principios Clave")
                            .font(.title2)
                            .fontWeight(.semibold)
                        Spacer()
                        Text("Toca para explorar")
                            .font(.caption)
                            .foregroundColor(.secondary)
                    }
                    
                    LazyVStack(spacing: 12) {
                        ForEach(Array(principios.principios.enumerated()), id: \.offset) { index, principio in
                            PrincipioClaveCard(
                                principio: principio,
                                index: index + 1
                            ) {
                                withAnimation(.spring(response: 0.6, dampingFraction: 0.8)) {
                                    principioSeleccionado = principio
                                    mostrarEstrategias = true
                                }
                            }
                        }
                    }
                }
                
                // Resumen Integrador
                VStack(alignment: .leading, spacing: 15) {
                    HStack {
                        Image(systemName: "brain.head.profile")
                            .foregroundColor(.purple)
                        Text("Resumen Integrador")
                            .font(.title2)
                            .fontWeight(.semibold)
                    }
                    
                    Text(principios.resumenIntegrador)
                        .font(.body)
                        .lineSpacing(6)
                        .padding()
                        .background(Color(.systemGray6))
                        .cornerRadius(12)
                }
            }
            .padding()
        }
        .navigationTitle("Principios Clave")
        .navigationBarTitleDisplayMode(.inline)
        .sheet(isPresented: $mostrarEstrategias) {
            if let principio = principioSeleccionado {
                PrincipioDetalleView(principio: principio)
            }
        }
    }
}

// MARK: - Tarjeta de Principio Clave Mejorada
struct PrincipioClaveCard: View {
    let principio: PrincipioClave
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
                                    gradient: Gradient(colors: [Color(principio.color), Color(principio.color).opacity(0.7)]),
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
                        Text(principio.titulo)
                            .font(.headline)
                            .fontWeight(.semibold)
                            .foregroundColor(.primary)
                            .multilineTextAlignment(.leading)
                            .lineLimit(2)
                        
                        HStack {
                            Image(systemName: principio.icono)
                                .font(.caption)
                                .foregroundColor(Color(principio.color))
                            
                            Text(principio.baseNeurocientifica)
                                .font(.caption)
                                .foregroundColor(Color(principio.color))
                                .lineLimit(1)
                        }
                    }
                    
                    Spacer()
                    
                    VStack {
                        Image(systemName: "arrow.right.circle.fill")
                            .font(.title2)
                            .foregroundColor(Color(principio.color))
                        
                        Text("Explorar")
                            .font(.caption2)
                            .foregroundColor(Color(principio.color))
                    }
                }
                
                // Contenido con diseño mejorado
                VStack(alignment: .leading, spacing: 8) {
                    Text(principio.filosofiaProfunda)
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
                        
                        Text("Incluye aplicación práctica detallada")
                            .font(.caption)
                            .foregroundColor(.green)
                            .fontWeight(.medium)
                        
                        Spacer()
                        
                        Text("\(principio.estrategiasImplementacion.count) estrategias")
                            .font(.caption2)
                            .foregroundColor(.secondary)
                    }
                    .padding(.top, 4)
                }
                
                // Barra de progreso visual
                HStack {
                    ForEach(0..<5) { _ in
                        Circle()
                            .fill(Color(principio.color).opacity(0.3))
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
                            gradient: Gradient(colors: [Color(principio.color).opacity(0.3), Color(principio.color).opacity(0.1)]),
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

// MARK: - Vista de Detalle del Principio
struct PrincipioDetalleView: View {
    let principio: PrincipioClave
    @Environment(\.dismiss) private var dismiss
    @State private var mostrarEstrategias = false
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 24) {
                    // Header con gradiente
                    VStack(alignment: .leading, spacing: 16) {
                        HStack {
                            Image(systemName: principio.icono)
                                .font(.largeTitle)
                                .foregroundColor(Color(principio.color))
                            
                            VStack(alignment: .leading, spacing: 4) {
                                Text("Principio Clave")
                                    .font(.title2)
                                    .fontWeight(.bold)
                                    .foregroundColor(Color(principio.color))
                                
                                Text("Neurociencia Aplicada")
                                    .font(.subheadline)
                                    .foregroundColor(.secondary)
                            }
                            
                            Spacer()
                        }
                        
                        Text(principio.titulo)
                            .font(.title)
                            .fontWeight(.bold)
                            .multilineTextAlignment(.leading)
                            .lineSpacing(4)
                    }
                    .padding(20)
                    .background(
                        LinearGradient(
                            gradient: Gradient(colors: [Color(principio.color).opacity(0.1), Color(principio.color).opacity(0.05)]),
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                    )
                    .cornerRadius(16)
                    
                    // Filosofía profunda
                    VStack(alignment: .leading, spacing: 12) {
                        HStack {
                            Image(systemName: "lightbulb.fill")
                                .foregroundColor(.yellow)
                            Text("Filosofía Profunda")
                                .font(.headline)
                                .fontWeight(.semibold)
                        }
                        
                        Text(principio.filosofiaProfunda)
                            .font(.body)
                            .lineSpacing(6)
                            .foregroundColor(.primary)
                    }
                    .padding(16)
                    .background(Color(.systemGray6))
                    .cornerRadius(12)
                    
                    // Base neurocientífica
                    VStack(alignment: .leading, spacing: 12) {
                        HStack {
                            Image(systemName: "atom")
                                .foregroundColor(.purple)
                            Text("Base Neurocientífica")
                                .font(.headline)
                                .fontWeight(.semibold)
                        }
                        
                        Text(principio.baseNeurocientifica)
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
                                mostrarEstrategias.toggle()
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
                                
                                Image(systemName: mostrarEstrategias ? "chevron.up" : "chevron.down")
                                    .foregroundColor(.green)
                                    .font(.title3)
                            }
                        }
                        .buttonStyle(PlainButtonStyle())
                        
                        if mostrarEstrategias {
                            VStack(alignment: .leading, spacing: 8) {
                                Text(principio.aplicacionPractica)
                                    .font(.body)
                                    .foregroundColor(.primary)
                                    .lineSpacing(4)
                                
                                // Estrategias de implementación
                                VStack(alignment: .leading, spacing: 8) {
                                    Text("Estrategias de Implementación:")
                                        .font(.subheadline)
                                        .fontWeight(.semibold)
                                        .foregroundColor(.green)
                                    
                                    ForEach(Array(principio.estrategiasImplementacion.enumerated()), id: \.offset) { index, estrategia in
                                        HStack(alignment: .top, spacing: 8) {
                                            Text("\(index + 1).")
                                                .font(.caption)
                                                .fontWeight(.bold)
                                                .foregroundColor(.green)
                                                .frame(width: 20, alignment: .leading)
                                            
                                            Text(estrategia)
                                                .font(.body)
                                                .foregroundColor(.primary)
                                        }
                                        .padding(.vertical, 2)
                                    }
                                }
                                .padding(12)
                                .background(Color.green.opacity(0.1))
                                .cornerRadius(8)
                                
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
}

// MARK: - Preview
struct Capa2PrincipiosView_Previews: PreviewProvider {
    static var previews: some View {
        Capa2PrincipiosView()
    }
}
