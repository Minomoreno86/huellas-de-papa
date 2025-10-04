import SwiftUI

struct Capa4SimulacionesView: View {
    var body: some View {
        VStack {
            Image(systemName: "theatermasks")
                .font(.system(size: 60))
                .foregroundColor(.purple)
            
            Text("CAPA 4: SIMULACIONES AVANZADAS")
                .font(.title)
                .fontWeight(.bold)
            
            Text("Próximamente...")
                .font(.subheadline)
                .foregroundColor(.secondary)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

#Preview {
    Capa4SimulacionesView()
}
