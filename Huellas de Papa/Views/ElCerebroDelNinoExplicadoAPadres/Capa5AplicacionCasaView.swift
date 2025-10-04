import SwiftUI

struct Capa5AplicacionCasaView: View {
    var body: some View {
        VStack {
            Image(systemName: "house")
                .font(.system(size: 60))
                .foregroundColor(.green)
            
            Text("CAPA 5: APLICACIÓN EN CASA")
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
    Capa5AplicacionCasaView()
}
