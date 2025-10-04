import SwiftUI

struct ModuloView: View {
    let modulo: ModuloDisponible
    @StateObject private var progresoManager = ProgresoManager()
    @State private var capaSeleccionada: TipoCapa = .fundamentos
    
    var body: some View {
        VStack(spacing: 0) {
            // Header del módulo
            ModuloHeaderView(modulo: modulo, progresoManager: progresoManager)
            
            // Selector horizontal de capas
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 12) {
                    ForEach(TipoCapa.allCases, id: \.self) { capa in
                        CapaSelectorButton(
                            capa: capa,
                            isSelected: capaSeleccionada == capa,
                            progreso: progresoManager.progreso(for: modulo.id, capa: capa)
                        ) {
                            capaSeleccionada = capa
                        }
                    }
                }
                .padding(.horizontal)
            }
            .padding(.vertical, 8)
            .background(Color(.systemGray6))
            
            // Contenido de la capa seleccionada usando Factory
            ScrollView {
                VStack {
                    FactoryModulos.crearVistaCapa(paraModulo: modulo.id, capa: capaSeleccionada)
                }
                .padding()
            }
        }
        .environmentObject(progresoManager)
        .navigationTitle(modulo.titulo)
        .navigationBarTitleDisplayMode(.inline)
    }
}

// MARK: - Header del Módulo
struct ModuloHeaderView: View {
    let modulo: ModuloDisponible
    @ObservedObject var progresoManager: ProgresoManager
    
    var body: some View {
        HStack {
            // Icono y título
            HStack(spacing: 12) {
                Image(systemName: modulo.icono)
                    .font(.title2)
                    .foregroundColor(Color(modulo.color))
                    .frame(width: 40, height: 40)
                    .background(Color(modulo.color).opacity(0.1))
                    .clipShape(Circle())
                
                VStack(alignment: .leading, spacing: 2) {
                    Text(modulo.titulo)
                        .font(.title3)
                        .fontWeight(.bold)
                        .multilineTextAlignment(.leading)
                    
                    Text("por \(modulo.autor)")
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
            }
            
            Spacer()
            
            // Progreso general del módulo
            VStack {
                CircularProgressView(progress: modulo.progreso)
                Text("\(Int(modulo.progreso * 100))%")
                    .font(.caption)
                    .fontWeight(.medium)
            }
        }
        .padding()
        .background(Color(.systemGray6))
    }
}

// MARK: - Vistas Placeholder para las Capas Restantes
// Estas vistas ahora están en sus respectivas carpetas de módulos

// MARK: - Botón Selector de Capa
struct CapaSelectorButton: View {
    let capa: TipoCapa
    let isSelected: Bool
    let progreso: Double
    let onTap: () -> Void
    
    var body: some View {
        Button(action: onTap) {
            VStack(spacing: 6) {
                // Icono con indicador de progreso
                ZStack {
                    Circle()
                        .stroke(Color.gray.opacity(0.3), lineWidth: 2)
                        .frame(width: 40, height: 40)
                    
                    Circle()
                        .trim(from: 0, to: progreso)
                        .stroke(Color.blue, style: StrokeStyle(lineWidth: 2, lineCap: .round))
                        .rotationEffect(.degrees(-90))
                        .frame(width: 40, height: 40)
                        .animation(.easeInOut(duration: 0.3), value: progreso)
                    
                    Image(systemName: capa.iconName)
                        .font(.system(size: 16, weight: .medium))
                        .foregroundColor(isSelected ? .white : .primary)
                }
                
                // Título de la capa
                Text(capa.displayName)
                    .font(.caption)
                    .fontWeight(.medium)
                    .foregroundColor(isSelected ? .white : .primary)
                    .multilineTextAlignment(.center)
                    .lineLimit(2)
                    .frame(width: 80)
            }
            .padding(.vertical, 8)
            .padding(.horizontal, 12)
            .background(
                RoundedRectangle(cornerRadius: 12)
                    .fill(isSelected ? Color.blue : Color(.systemBackground))
                    .shadow(color: .black.opacity(0.1), radius: 2, x: 0, y: 1)
            )
        }
        .buttonStyle(PlainButtonStyle())
    }
}

// MARK: - Preview
struct ModuloView_Previews: PreviewProvider {
    static var previews: some View {
        let modulo = ModuloDisponible.todosLosModulos().first!
        ModuloView(modulo: modulo)
    }
}
