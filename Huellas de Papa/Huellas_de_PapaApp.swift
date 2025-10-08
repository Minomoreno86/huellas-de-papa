//
//  Huellas_de_PapaApp.swift
//  Huellas de Papa
//
//  Created by Jorge Vasquez rodriguez on 3/10/25.
//

import SwiftUI
import SwiftData

@main
struct Huellas_de_PapaApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: [
            // Modelos del módulo "Tengo un Volcán"
            TV6VolcanoLog.self,
            TV6DailyCheck.self,
            TV7Question.self,
            TV7Response.self,
            TV9Badge.self,
            TV9Progress.self,
            
            // Modelos del módulo "The Yes Brain" (si existen)
            YBTrainingDay.self,
            YB7Question.self,
            YB7Response.self,
            YB7Result.self,
            YB8Story.self,
            YB8Game.self,
            YB8Scene.self,
            YB8Simulation.self,
            C9Mission.self,
            C9Badge.self,
            C9Progress.self,
            C9Stage.self,
            C9GrowthTree.self
        ])
    }
}
