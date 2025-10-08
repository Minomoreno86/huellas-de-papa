import Foundation
import SwiftData

/// Escena de dramatización interactiva
@Model
final class YB8Scene {
    @Attribute(.unique) var id: UUID
    var title: String
    var scenario: String
    var roleParent: [String]        // Diálogos del padre
    var roleChild: [String]         // Diálogos del niño
    var learning: String
    var icon: String                // SF Symbol
    var color: String               // Color principal
    
    init(
        title: String,
        scenario: String,
        roleParent: [String],
        roleChild: [String],
        learning: String,
        icon: String,
        color: String
    ) {
        self.id = UUID()
        self.title = title
        self.scenario = scenario
        self.roleParent = roleParent
        self.roleChild = roleChild
        self.learning = learning
        self.icon = icon
        self.color = color
    }
}

