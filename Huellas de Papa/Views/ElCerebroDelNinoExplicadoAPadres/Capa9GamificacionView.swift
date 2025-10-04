import SwiftUI

struct Capa9GamificacionView: View {
    var body: some View {
        VStack {
            Image(systemName: "trophy")
                .font(.system(size: 60))
                .foregroundColor(.yellow)
            
            Text("CAPA 9: GAMIFICACIÓN")
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
    Capa9GamificacionView()
}
