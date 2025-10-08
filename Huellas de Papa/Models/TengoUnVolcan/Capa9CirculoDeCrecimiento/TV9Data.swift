import Foundation

/// Datos consolidados de la Capa 9: Círculo de Crecimiento
/// Sistema de logros basado en dominio del modelo del libro
struct TV9Data {
    
    // MARK: - Logros/Insignias Basadas en el Libro
    
    struct BadgeTemplate {
        let title: String
        let description: String
        let requirement: String
        let iconName: String
        let color: String
        let relatedContent: String
    }
    
    static let badgeTemplates: [BadgeTemplate] = [
        // COMPRENSIÓN DEL MODELO
        BadgeTemplate(
            title: "Conocedor del Volcán",
            description: "Completaste Capa 1: Fundamentos. Comprendes qué es el volcán y cómo funciona.",
            requirement: "Completar Capa 1",
            iconName: "brain.head.profile",
            color: "blue",
            relatedContent: "Los 4 Pilares, Las 3 Fases, El Mapa del Volcán"
        ),
        
        BadgeTemplate(
            title: "Cazador de Nubes",
            description: "Dominas los principios del volcán: botones, nubes de humo y fases.",
            requirement: "Completar Capa 2",
            iconName: "cloud.fill",
            color: "purple",
            relatedContent: "5 Principios, 4 Botones, 6 Patrones de Pensamiento"
        ),
        
        BadgeTemplate(
            title: "Guardián de Herramientas",
            description: "Conoces las 9 herramientas de la Caja del Hada del Volcán.",
            requirement: "Completar Capa 3",
            iconName: "toolbox.fill",
            color: "orange",
            relatedContent: "Las 9 Herramientas del Libro"
        ),
        
        BadgeTemplate(
            title: "Aprendiz Reflexivo",
            description: "Practicaste simulaciones y reflexionaste sobre tus respuestas.",
            requirement: "Completar al menos 2 simulaciones en Capa 4",
            iconName: "brain.fill",
            color: "mint",
            relatedContent: "4 Escenarios Interactivos"
        ),
        
        BadgeTemplate(
            title: "Constructor de Rutinas",
            description: "Implementaste rutinas familiares basadas en el libro.",
            requirement: "Establecer 2+ rutinas de Capa 5",
            iconName: "house.fill",
            color: "green",
            relatedContent: "5 Rutinas Familiares del Libro"
        ),
        
        BadgeTemplate(
            title: "Observador Atento",
            description: "Registraste volcanes de tu hijo y encontraste patrones.",
            requirement: "Registrar 10+ volcanes en Capa 6",
            iconName: "chart.line.uptrend.xyaxis",
            color: "blue",
            relatedContent: "Sistema de Seguimiento"
        ),
        
        BadgeTemplate(
            title: "Padre Reflexivo",
            description: "Completaste la autoevaluación y reconociste áreas de crecimiento.",
            requirement: "Completar autoevaluación de Capa 7",
            iconName: "list.clipboard.fill",
            color: "purple",
            relatedContent: "13 Preguntas de Autorreflexión"
        ),
        
        BadgeTemplate(
            title: "Narrador de Historias",
            description: "Compartiste el cuento de Alba con tu hijo.",
            requirement: "Leer el cuento completo en Capa 8",
            iconName: "book.fill",
            color: "pink",
            relatedContent: "El Cuento de Alba (7 capítulos)"
        ),
        
        // PRÁCTICA CONSTANTE
        BadgeTemplate(
            title: "Respirador Maestro",
            description: "Usaste El Botón de Pausa 20+ veces con tu hijo.",
            requirement: "Registrar uso 20 veces",
            iconName: "wind",
            color: "mint",
            relatedContent: "El Botón de Pausa: Huele la flor, apaga la vela"
        ),
        
        BadgeTemplate(
            title: "Fuente de Calma",
            description: "Fuiste el refugio seguro de tu hijo en 10+ erupciones.",
            requirement: "Usar La Fuente de la Calma 10 veces",
            iconName: "person.2.fill",
            color: "orange",
            relatedContent: "La Fuente de la Calma (Co-regulación)"
        ),
        
        BadgeTemplate(
            title: "Jardinero Constante",
            description: "Cumpliste las 6 básicas durante 7 días seguidos.",
            requirement: "7 días consecutivos con las 6 básicas completas",
            iconName: "leaf.fill",
            color: "green",
            relatedContent: "Regar mi Jardín Interior (Las 6 Básicas)"
        ),
        
        BadgeTemplate(
            title: "Domador de Volcanes",
            description: "¡Completaste todo el módulo! Eres un experto en el modelo de Míriam Tirado.",
            requirement: "Completar las 8 capas del módulo",
            iconName: "star.fill",
            color: "yellow",
            relatedContent: "Módulo Completo: Tengo un Volcán"
        )
    ]
    
    // MARK: - Mensajes Motivacionales del Libro
    
    static let motivationalMessages = [
        "El volcán es parte de ti, pero el volcán no eres tú. - Míriam Tirado",
        "Cada vez que gestionas una emoción intensa, desarrollas tu músculo emocional. - Míriam Tirado",
        "La lava puede ser una fuerza poderosa y constructiva cuando aprendemos a dirigirla. - Míriam Tirado",
        "El volcán avisa antes de explotar. Solo necesitamos aprender a escuchar sus señales. - Míriam Tirado",
        "No se trata de apagar el volcán, sino de aprender a ser su domador. - Míriam Tirado"
    ]
}

