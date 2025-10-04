import SwiftUI

struct Capa8ModoNinoView: View {
    var body: some View {
        VStack {
            Image(systemName: "figure.child")
                .font(.system(size: 60))
                .foregroundColor(.pink)
            
            Text("CAPA 8: MODO NIÑO")
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
    Capa8ModoNinoView()
}
