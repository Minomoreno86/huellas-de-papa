import Foundation

/// Datos de referencia para el sistema de seguimiento
/// Basado en las categorías del libro de Míriam Tirado
struct TV6Data {
    
    // MARK: - Categorías del Libro (para registros)
    
    /// Fases del volcán (Capa 1)
    static let volcanoPhases = [
        "Chispa Inicial",
        "Burbujeo",
        "Erupción"
    ]
    
    /// Botones que activan el volcán (Capa 2)
    static let triggerButtons = [
        "Botón de Injusticia",
        "Botón de Frustración",
        "Botón de No Conseguir lo que Quiero",
        "Botón de Emociones Enmascaradas"
    ]
    
    /// Herramientas disponibles (Capa 3)
    static let availableTools = [
        "El Botón de Pausa",
        "El Paraguas Mágico",
        "El Jardín Secreto",
        "Las Palabras Mágicas",
        "La Fuente de la Calma",
        "Caza de Nubes",
        "El Botón de la Disculpa",
        "El Botón de la Reparación",
        "Regar mi Jardín Interior"
    ]
    
    /// Las 6 Básicas (del libro - Regar el Jardín Interior)
    static let sixBasics = [
        "Sueño suficiente",
        "Alimentación regular",
        "Movimiento diario",
        "Conexión emocional 1-a-1",
        "Momentos de calma",
        "Límites consistentes"
    ]
    
    /// Contextos comunes
    static let contexts = [
        "En casa",
        "En la escuela",
        "En el parque",
        "En el auto",
        "En el supermercado",
        "En casa de familiares",
        "Otro"
    ]
    
    // MARK: - Tips de Seguimiento
    
    struct TrackingTip: Identifiable {
        let id = UUID()
        let title: String
        let description: String
        let iconName: String
    }
    
    static let trackingTips = [
        TrackingTip(
            title: "Registra todos los volcanes",
            description: "No solo las erupciones grandes. También las chispas y el burbujeo. Así verás patrones tempranos.",
            iconName: "pencil.circle.fill"
        ),
        TrackingTip(
            title: "No juzgues, solo observa",
            description: "El registro no es para sentirte mal. Es para aprender. 'Más volcanes' no significa 'mal padre'. Significa 'información valiosa'.",
            iconName: "eye.fill"
        ),
        TrackingTip(
            title: "Busca patrones",
            description: "¿Hay días de la semana con más volcanes? ¿Horas del día? ¿Botones específicos? Los patrones revelan necesidades no cubiertas.",
            iconName: "chart.bar.fill"
        ),
        TrackingTip(
            title: "Verifica las 6 básicas primero",
            description: "Antes de analizar profundo, pregunta: ¿Se cumplieron las 6 básicas? El 80% de volcanes vienen de ahí.",
            iconName: "checklist"
        ),
        TrackingTip(
            title: "Celebra el uso de herramientas",
            description: "Que haya volcanes es normal. Lo importante es: ¿Usaste herramientas? Aunque no funcionen siempre, el intento cuenta.",
            iconName: "star.fill"
        )
    ]
    
    // MARK: - Insights Automáticos (Ejemplos)
    
    struct InsightPattern: Identifiable {
        let id = UUID()
        let pattern: String // Descripción del patrón detectado
        let suggestion: String // Qué hacer al respecto
        let relatedCapa: String // A dónde ir en la app
        let iconName: String
        let color: String
    }
    
    static let insightPatterns = [
        InsightPattern(
            pattern: "Volcanes frecuentes los lunes",
            suggestion: "Los lunes después del fin de semana son difíciles. Verifica: ¿Dormiste bien el domingo? ¿Hubo rutina o descontrol? La transición fin de semana → semana necesita estructura.",
            relatedCapa: "Capa 5 > Regar el Jardín Interior",
            iconName: "calendar",
            color: "blue"
        ),
        InsightPattern(
            pattern: "Volcanes antes de comer",
            suggestion: "El hambre es un botón poderoso. Si ves volcanes entre 11am-12pm o 5pm-6pm, anticípate: ofrece colación ANTES de que el hambre encienda el volcán.",
            relatedCapa: "Capa 3 > Regar mi Jardín Interior (Alimentación)",
            iconName: "fork.knife",
            color: "orange"
        ),
        InsightPattern(
            pattern: "Volcanes después de la escuela",
            suggestion: "Llegada de escuela = transición difícil. Tu hijo trae energía acumulada + posibles frustraciones del día. Ofrece: colación + 20 min de juego libre ANTES de tarea o responsabilidades.",
            relatedCapa: "Capa 5 > Rutina de Llegada de Escuela",
            iconName: "building.columns.fill",
            color: "purple"
        ),
        InsightPattern(
            pattern: "Botón de Frustración frecuente",
            suggestion: "Tu hijo tiene baja tolerancia a la frustración (normal a su edad). Practica más: Caza de Nubes ('Nunca me sale' → 'Es difícil, pero puedo aprender') y valida el esfuerzo, no solo el resultado.",
            relatedCapa: "Capa 3 > Caza de Nubes",
            iconName: "exclamationmark.triangle.fill",
            color: "red"
        ),
        InsightPattern(
            pattern: "Herramientas usadas < 30%",
            suggestion: "Estás viendo muchos volcanes pero usando pocas herramientas. Quizás aún no las dominas. Repasa Capa 3 y practica en CALMA primero, no durante crisis.",
            relatedCapa: "Capa 3 > La Caja de Herramientas",
            iconName: "wrench.and.screwdriver",
            color: "orange"
        ),
        InsightPattern(
            pattern: "6 básicas < 50% esta semana",
            suggestion: "Las 6 básicas (sueño, comida, movimiento, conexión, calma, consistencia) no se están cumpliendo. Esta es la causa raíz. Prioriza estas ANTES que herramientas complejas.",
            relatedCapa: "Capa 5 > Checklist de las 6 Básicas",
            iconName: "leaf.fill",
            color: "green"
        )
    ]
}

