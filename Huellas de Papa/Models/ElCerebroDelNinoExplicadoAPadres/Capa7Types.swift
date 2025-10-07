import Foundation
import SwiftUI

// MARK: - Tipos Compartidos para Capa 7

/// Enum para tipos de evaluación
enum TipoEvaluacion: String, CaseIterable {
    case conocimiento = "Conocimiento"
    case habilidad = "Habilidad"
    case consistencia = "Consistencia"
    case transferencia = "Transferencia"
    case completa = "Evaluación Completa"
    
    var icono: String {
        switch self {
        case .conocimiento: return "brain.head.profile"
        case .habilidad: return "hand.raised.fill"
        case .consistencia: return "calendar.badge.clock"
        case .transferencia: return "house.fill"
        case .completa: return "star.fill"
        }
    }
    
    var color: Color {
        switch self {
        case .conocimiento: return .blue
        case .habilidad: return .green
        case .consistencia: return .orange
        case .transferencia: return .purple
        case .completa: return .indigo
        }
    }
}

/// Item de evaluación
struct EvalItem: Identifiable, Codable {
    enum ItemType: String, Codable, CaseIterable {
        case mcq = "mcq"
        case multi = "multi"
        case order = "order"
        case branch = "branch"
        case microReto = "microReto"
        case transfer = "transfer"
        case journaling = "journaling"
    }
    
    let id: String
    let moduleId: String
    let chapter: String
    let concept: String
    let ageRange: String
    let difficulty: Int
    let type: ItemType
    let prompt: String
    let options: [String]?
    let correct: [Int]?
    let branches: [BranchNode]?
    let explanation: String
    let chapterReference: String
}

struct BranchNode: Codable {
    let optionText: String
    let nextId: String?
    let weight: Double
    let feedback: String
}

/// Sistema adaptativo de evaluación
class EvaluationAdaptiveSystem: ObservableObject {
    @Published var sessionState: EvalSessionState
    @Published var moduleScore: ModuleScore
    
    init() {
        self.sessionState = EvalSessionState()
        self.moduleScore = ModuleScore()
    }
    
    func nextItem(from bank: [EvalItem], targetConcept: String? = nil) -> EvalItem? {
        let concept = targetConcept ?? sessionState.lastConcept
        let pool = bank.filter { 
            $0.concept == concept && 
            $0.difficulty == sessionState.difficulty &&
            !sessionState.itemsCompleted.contains($0.id)
        }
        
        if let pick = pool.randomElement() { 
            return pick 
        }
        
        let alt = bank.filter { 
            $0.concept == concept && 
            abs($0.difficulty - sessionState.difficulty) <= 1 &&
            !sessionState.itemsCompleted.contains($0.id)
        }
        
        return alt.randomElement() ?? bank.filter { 
            !sessionState.itemsCompleted.contains($0.id) 
        }.randomElement()
    }
    
    func registerMCQ(answer idx: Int, correct: Int, difficulty: Int) -> (deltaK: Double, deltaH: Double) {
        let ok = (idx == correct)
        sessionState.streak = ok ? (sessionState.streak + 1) : 0
        sessionState.fails = ok ? 0 : (sessionState.fails + 1)
        
        if sessionState.streak >= 2 { 
            sessionState.difficulty = min(sessionState.difficulty + 1, 5) 
        }
        if sessionState.fails >= 2 { 
            sessionState.difficulty = max(sessionState.difficulty - 1, 1) 
        }
        
        let dK = ok ? (10.0 * Double(difficulty)) : (-5.0)
        return (dK, 0.0)
    }
    
    func updateScores(deltaK: Double, deltaH: Double, deltaC: Double = 0, deltaT: Double = 0) {
        moduleScore.K = max(0, min(100, moduleScore.K + deltaK))
        moduleScore.H = max(0, min(100, moduleScore.H + deltaH))
        moduleScore.C = max(0, min(100, moduleScore.C + deltaC))
        moduleScore.T = max(0, min(100, moduleScore.T + deltaT))
        moduleScore.updatedAt = Date()
    }
}

struct EvalSessionState: Codable {
    var difficulty = 2
    var streak = 0
    var fails = 0
    var lastConcept: String?
    var currentSession: Date = Date()
    var itemsCompleted: [String] = []
}

struct ModuleScore: Codable {
    var K: Double = 0.0
    var H: Double = 0.0
    var C: Double = 0.0
    var T: Double = 0.0
    var updatedAt: Date = Date()
    
    var totalScore: Double {
        return 0.30 * K + 0.30 * H + 0.20 * C + 0.20 * T
    }
    
    var level: EvaluationLevel {
        switch totalScore {
        case 0..<50: return .novato
        case 50..<70: return .practico
        case 70..<85: return .guiador
        default: return .maestro
        }
    }
}

enum EvaluationLevel: String, Codable, CaseIterable {
    case novato = "Novato"
    case practico = "Práctico"
    case guiador = "Guiador"
    case maestro = "Maestro"
    
    var description: String {
        switch self {
        case .novato: return "Estás comenzando tu viaje de aprendizaje"
        case .practico: return "Ya tienes conocimientos sólidos"
        case .guiador: return "Eres un guía experto"
        case .maestro: return "Dominas completamente el tema"
        }
    }
    
    var color: Color {
        switch self {
        case .novato: return .orange
        case .practico: return .blue
        case .guiador: return .purple
        case .maestro: return .green
        }
    }
}

/// Nivel de integración cerebral
enum BrainIntegrationLevel: String, Codable {
    case amygdala = "Reacción Emocional"
    case bridge = "Integración Parcial"
    case prefrontal = "Respuesta Consciente"
}

/// Bloque de evaluación reflexiva general
struct Capa7ReflectionTest: Codable, Identifiable {
    let id: UUID
    let title: String
    let questions: [ReflectionQuestion]
}

/// Pregunta de reflexión con escala emocional
struct ReflectionQuestion: Codable, Identifiable {
    let id: UUID
    let prompt: String
    let options: [ReflectionOption]
}

/// Opción con feedback emocional inmediato
struct ReflectionOption: Codable, Identifiable {
    let id: UUID
    let text: String
    let feedback: String
    let brainLevel: BrainIntegrationLevel
}

/// Escenario narrativo breve tipo test emocional
struct Capa7Scenario: Codable, Identifiable {
    let id: UUID
    let context: String
    let situation: String
    let options: [ScenarioOption]
}

struct ScenarioOption: Codable, Identifiable {
    let id: UUID
    let text: String
    let reflection: String
    let brainResponse: BrainIntegrationLevel
}

// MARK: - Sistema de Progreso Longitudinal

struct ReflectionProgress: Codable {
    let id: UUID
    let testId: UUID
    let responses: [UUID] // IDs de las opciones seleccionadas
    let timestamp: Date
    let brainLevel: BrainIntegrationLevel
}

struct ScenarioProgress: Codable {
    let id: UUID
    let scenarioId: UUID
    let selectedOption: UUID
    let timestamp: Date
    let brainResponse: BrainIntegrationLevel
}

class Capa7ProgressManager: ObservableObject {
    @Published var reflectionHistory: [ReflectionProgress] = []
    @Published var scenarioHistory: [ScenarioProgress] = []
    @Published var currentBrainState: BrainIntegrationLevel = .amygdala
    
    func recordReflection(testId: UUID, responses: [UUID], brainLevel: BrainIntegrationLevel) {
        let progress = ReflectionProgress(
            id: UUID(),
            testId: testId,
            responses: responses,
            timestamp: Date(),
            brainLevel: brainLevel
        )
        reflectionHistory.append(progress)
        updateBrainState()
    }
    
    func recordScenario(scenarioId: UUID, selectedOption: UUID, brainResponse: BrainIntegrationLevel) {
        let progress = ScenarioProgress(
            id: UUID(),
            scenarioId: scenarioId,
            selectedOption: selectedOption,
            timestamp: Date(),
            brainResponse: brainResponse
        )
        scenarioHistory.append(progress)
        updateBrainState()
    }
    
    private func updateBrainState() {
        let recentReflections = reflectionHistory.suffix(5)
        let recentScenarios = scenarioHistory.suffix(5)
        
        let allRecent = Array(recentReflections) + Array(recentScenarios.map { $0 as Any })
        
        if allRecent.isEmpty {
            currentBrainState = .amygdala
            return
        }
        
        let prefrontalCount = allRecent.filter { 
            if let reflection = $0 as? ReflectionProgress {
                return reflection.brainLevel == .prefrontal
            } else if let scenario = $0 as? ScenarioProgress {
                return scenario.brainResponse == .prefrontal
            }
            return false
        }.count
        
        let bridgeCount = allRecent.filter { 
            if let reflection = $0 as? ReflectionProgress {
                return reflection.brainLevel == .bridge
            } else if let scenario = $0 as? ScenarioProgress {
                return scenario.brainResponse == .bridge
            }
            return false
        }.count
        
        let _ = allRecent.filter { 
            if let reflection = $0 as? ReflectionProgress {
                return reflection.brainLevel == .amygdala
            } else if let scenario = $0 as? ScenarioProgress {
                return scenario.brainResponse == .amygdala
            }
            return false
        }.count
        
        if prefrontalCount >= 3 {
            currentBrainState = .prefrontal
        } else if bridgeCount >= 2 {
            currentBrainState = .bridge
        } else {
            currentBrainState = .amygdala
        }
    }
    
    func getProgressSummary() -> String {
        switch currentBrainState {
        case .prefrontal:
            return "Estás fortaleciendo tu calma interior y desarrollando respuestas conscientes."
        case .bridge:
            return "Estás en proceso de integración. Algunas respuestas son conscientes, otras aún reactivas."
        case .amygdala:
            return "Aún reaccionas desde la emoción, pero reconocer esto es el primer paso hacia el crecimiento."
        }
    }
}
