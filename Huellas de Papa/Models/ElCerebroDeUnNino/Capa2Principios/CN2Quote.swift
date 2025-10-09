import Foundation

/// Citas del libro sobre principios de integración
struct CN2Quote: Codable, Identifiable {
    let id: UUID
    let text: String
    let author: String
    let context: String
    
    init(text: String, author: String, context: String) {
        self.id = UUID()
        self.text = text
        self.author = author
        self.context = context
    }
}

let cn2Quotes: [CN2Quote] = [
    CN2Quote(
        text: "La integración es como un río: cuando ambas orillas (lógica y emoción, cerebro superior e inferior) trabajan juntas, el río fluye armoniosamente. Cuando una domina, el río se desborda.",
        author: "Daniel J. Siegel",
        context: "Sobre la integración cerebral"
    ),
    CN2Quote(
        text: "Connect and redirect: primero conecta con el hemisferio derecho emocional, luego redirige con el hemisferio izquierdo lógico. En ese orden.",
        author: "Daniel J. Siegel & Tina Payne Bryson",
        context: "La secuencia fundamental de crianza"
    ),
    CN2Quote(
        text: "No puedes razonar con un cerebro inferior activado. Primero cálmalo, luego involucra el cerebro superior.",
        author: "Daniel J. Siegel",
        context: "Sobre integración vertical"
    ),
    CN2Quote(
        text: "Name it to tame it: cuando pones palabras a una emoción, reduces su poder emocional. El hemisferio izquierdo ayuda al derecho a procesar.",
        author: "Daniel J. Siegel & Tina Payne Bryson",
        context: "Sobre integración hemisférica"
    )
]

