import Foundation
import SwiftUI

/// Módulo completo de Bésame Mucho de Carlos González
/// Contiene información sobre crianza con apego y respeto a las necesidades del niño
struct ModuloBesameMucho: ProtocoloModulo {
    let id: String
    let titulo: String
    let descripcion: String
    let autor: String
    let icono: String
    let color: String
    let categoria: CategoriaModulo
    let enfoque: String
    let publico: String
    let capas: [TipoCapa]
    
    init() {
        self.id = "besame-mucho"
        self.titulo = "Bésame Mucho"
        self.autor = "Carlos González"
        self.descripcion = "Cómo criar a tus hijos con amor. Una defensa apasionada de los niños y sus necesidades. Crianza con apego basada en la biología y el respeto al niño."
        self.icono = "heart.fill"
        self.color = "007AFF"
        self.categoria = .gestionEmocional
        self.enfoque = "Crianza con Apego"
        self.publico = "Padres de 0-6 años"
        self.capas = TipoCapa.allCases
    }
}

