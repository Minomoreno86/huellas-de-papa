//
//  ContentView.swift
//  Huellas de Papa
//
//  Created by Jorge Vasquez rodriguez on 3/10/25.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @StateObject private var progresoManager = ProgresoManager()
    @State private var moduloSeleccionado: ModuloDisponible? = nil
    @Environment(\.modelContext) private var modelContext
    
    var body: some View {
        NavigationView {
            if let modulo = moduloSeleccionado {
                // Vista del módulo seleccionado
                ModuloView(modulo: modulo)
                    .environmentObject(progresoManager)
                    .navigationBarBackButtonHidden(false)
                    .toolbar {
                        ToolbarItem(placement: .navigationBarLeading) {
                            Button("Volver") {
                                moduloSeleccionado = nil
                            }
                        }
                    }
            } else {
                // HOME VIEW - Lista de módulos disponibles
                HomeView()
                    .environmentObject(progresoManager)
                    .onReceive(NotificationCenter.default.publisher(for: .moduloSeleccionado)) { notification in
                        if let modulo = notification.object as? ModuloDisponible {
                            moduloSeleccionado = modulo
                        }
                    }
            }
        }
        .environmentObject(progresoManager)
        .onAppear {
            // Inicializar datos persistentes del módulo "Tengo un Volcán"
            TV9DataInitializer.initializeAll(context: modelContext)
        }
    }
}

// MARK: - Extensión para notificaciones
extension Notification.Name {
    static let moduloSeleccionado = Notification.Name("moduloSeleccionado")
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
