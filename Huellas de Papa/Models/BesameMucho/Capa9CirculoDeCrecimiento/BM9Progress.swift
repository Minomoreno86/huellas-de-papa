import Foundation
import SwiftUI

/// Modelo que representa el progreso general del usuario
struct BM9Progress: Codable {
    var level: Int
    var points: Int
    var streak: Int // días consecutivos
    var lastActiveDate: Date?
    var totalAchievements: Int
    var unlockedAchievements: Int
    var habitTracking: [Date: HabitDay]
    
    init() {
        self.level = 1
        self.points = 0
        self.streak = 0
        self.lastActiveDate = nil
        self.totalAchievements = 20
        self.unlockedAchievements = 0
        self.habitTracking = [:]
    }
    
    var percentageComplete: Double {
        guard totalAchievements > 0 else { return 0 }
        return (Double(unlockedAchievements) / Double(totalAchievements)) * 100
    }
    
    var nextLevelPoints: Int {
        return level * 100 // cada nivel requiere 100 puntos más
    }
    
    var progressToNextLevel: Double {
        let currentLevelBase = (level - 1) * 100
        let pointsInCurrentLevel = points - currentLevelBase
        return Double(pointsInCurrentLevel) / Double(nextLevelPoints - currentLevelBase)
    }
}

/// Registro de hábitos de un día
struct HabitDay: Codable {
    var colecho: Bool
    var lactanciaADemanda: Bool
    var respuestaAlLlanto: Bool
    var sinGritar: Bool
    var sinCastigos: Bool
    var contactoFisico: Bool
    var validacionEmocional: Bool
    var lecturaLibro: Bool
    
    init() {
        self.colecho = false
        self.lactanciaADemanda = false
        self.respuestaAlLlanto = false
        self.sinGritar = false
        self.sinCastigos = false
        self.contactoFisico = false
        self.validacionEmocional = false
        self.lecturaLibro = false
    }
    
    var completedCount: Int {
        var count = 0
        if colecho { count += 1 }
        if lactanciaADemanda { count += 1 }
        if respuestaAlLlanto { count += 1 }
        if sinGritar { count += 1 }
        if sinCastigos { count += 1 }
        if contactoFisico { count += 1 }
        if validacionEmocional { count += 1 }
        if lecturaLibro { count += 1 }
        return count
    }
    
    var totalCount: Int {
        return 8
    }
}

