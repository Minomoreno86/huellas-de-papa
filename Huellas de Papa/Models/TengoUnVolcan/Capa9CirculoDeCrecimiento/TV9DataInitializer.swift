import Foundation
import SwiftData

/// Inicializador de datos persistentes para el módulo "Tengo un Volcán"
class TV9DataInitializer {
    
    /// Inicializa las insignias en la base de datos si no existen
    static func initializeBadgesIfNeeded(context: ModelContext) {
        let descriptor = FetchDescriptor<TV9Badge>()
        let existingBadges = (try? context.fetch(descriptor)) ?? []
        
        // Si ya hay insignias, no inicializar de nuevo
        guard existingBadges.isEmpty else { return }
        
        // Crear las 12 insignias basadas en las plantillas
        for template in TV9Data.badgeTemplates {
            let badge = TV9Badge(
                title: template.title,
                badgeDescription: template.description,
                requirement: template.requirement,
                iconName: template.iconName,
                color: template.color,
                relatedContent: template.relatedContent
            )
            context.insert(badge)
        }
        
        try? context.save()
    }
    
    /// Inicializa el progreso del módulo si no existe
    static func initializeProgressIfNeeded(context: ModelContext) {
        let descriptor = FetchDescriptor<TV9Progress>()
        let existingProgress = (try? context.fetch(descriptor)) ?? []
        
        // Si ya hay progreso, no inicializar de nuevo
        guard existingProgress.isEmpty else { return }
        
        // Crear progreso inicial
        let progress = TV9Progress()
        context.insert(progress)
        
        try? context.save()
    }
    
    /// Inicializa todas las preguntas de evaluación si no existen
    static func initializeEvaluationQuestionsIfNeeded(context: ModelContext) {
        let descriptor = FetchDescriptor<TV7Question>()
        let existingQuestions = (try? context.fetch(descriptor)) ?? []
        
        // Si ya hay preguntas, no inicializar de nuevo
        guard existingQuestions.isEmpty else { return }
        
        // Crear las 13 preguntas de autoevaluación
        for (index, questionData) in TV7Data.evaluationQuestions.enumerated() {
            let question = TV7Question(
                category: questionData.category,
                text: questionData.text,
                type: TV7Question.QuestionType.scale, // Todas son escala 1-5
                weight: 1.0,
                order: index,
                relatedCapa: questionData.relatedCapa
            )
            context.insert(question)
        }
        
        try? context.save()
    }
    
    /// Inicializa todos los datos del módulo
    static func initializeAll(context: ModelContext) {
        initializeBadgesIfNeeded(context: context)
        initializeProgressIfNeeded(context: context)
        initializeEvaluationQuestionsIfNeeded(context: context)
    }
}

