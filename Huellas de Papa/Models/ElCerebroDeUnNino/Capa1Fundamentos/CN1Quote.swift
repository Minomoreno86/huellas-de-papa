import Foundation

/// Citas inspiradoras del libro "El Cerebro del Niño"
struct CN1Quote: Codable, Identifiable {
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

/// Citas clave del libro
let cn1Quotes: [CN1Quote] = [
    CN1Quote(
        text: "El objetivo no es hacer niños felices todo el tiempo. El objetivo es ayudarles a desarrollar un cerebro integrado que les permita ser felices, éticos y exitosos en la vida.",
        author: "Daniel J. Siegel",
        context: "Sobre el propósito de la crianza cerebral"
    ),
    CN1Quote(
        text: "Conectar y redirigir: Primero conecta con el cerebro derecho emocional, luego redirige con el cerebro izquierdo lógico.",
        author: "Daniel J. Siegel & Tina Payne Bryson",
        context: "La estrategia fundamental de disciplina"
    ),
    CN1Quote(
        text: "Las experiencias que proporcionas a tu hijo están literalmente moldeando su cerebro y determinando quién será.",
        author: "Daniel J. Siegel",
        context: "Sobre la neuroplasticidad"
    ),
    CN1Quote(
        text: "Un cerebro integrado es aquel donde las diferentes partes trabajan juntas de forma coordinada. El resultado es un niño más equilibrado, resiliente y empático.",
        author: "Daniel J. Siegel & Tina Payne Bryson",
        context: "Definiendo la integración cerebral"
    ),
    CN1Quote(
        text: "No puedes razonar con un niño de 2 años en medio de un berrinche. Primero calma el cerebro inferior, luego involucra el cerebro superior.",
        author: "Daniel J. Siegel",
        context: "Sobre manejar berrinches"
    ),
    CN1Quote(
        text: "El cerebro superior es como un músculo: mientras más lo ejercitas, más fuerte se vuelve.",
        author: "Daniel J. Siegel & Tina Payne Bryson",
        context: "Sobre el desarrollo de la corteza prefrontal"
    )
]

