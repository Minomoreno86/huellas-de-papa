import SwiftUI

struct Capa7ReflexionView: View {
    var body: some View {
        VStack {
            Image(systemName: "book.pages")
                .font(.system(size: 60))
                .foregroundColor(.teal)
            
            Text("CAPA 7: REFLEXIÓN PROFUNDA")
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
    Capa7ReflexionView()
}
