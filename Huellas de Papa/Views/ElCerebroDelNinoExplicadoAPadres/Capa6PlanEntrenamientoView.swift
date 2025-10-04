import SwiftUI

struct Capa6PlanEntrenamientoView: View {
    var body: some View {
        VStack {
            Image(systemName: "calendar")
                .font(.system(size: 60))
                .foregroundColor(.red)
            
            Text("CAPA 6: PLAN DE ENTRENAMIENTO")
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
    Capa6PlanEntrenamientoView()
}
