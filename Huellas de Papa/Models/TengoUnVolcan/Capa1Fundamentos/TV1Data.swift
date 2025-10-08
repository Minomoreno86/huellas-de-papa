import Foundation

/// Datos consolidados de la Capa 1: Fundamentos del modelo "Tengo un Volcán"
/// Basado en el libro de Míriam Tirado sobre gestión emocional de la rabia en niños
struct TV1Data {
    
    // MARK: - Los Cuatro Pilares del Modelo del Volcán
    static let pillars: [TV1Pillar] = [
        TV1Pillar(
            name: "Alfabetización Emocional",
            definition: "La capacidad de reconocer y nombrar la emoción de la rabia cuando aparece, entendiendo que es una experiencia normal y universal.",
            practicalApplication: "Ayuda a tu hijo a identificar: 'Esto que sientes se llama rabia. Todos la sentimos a veces. No significa que seas malo, solo que algo te molesta.'",
            iconName: "brain.head.profile"
        ),
        TV1Pillar(
            name: "Conciencia Corporal",
            definition: "La habilidad de identificar las señales físicas que el cuerpo envía cuando el volcán se activa, creando un 'mapa personal del volcán'.",
            practicalApplication: "Enseña a tu hijo a notar: '¿Dónde sientes el calor? ¿Tus manos se cierran? ¿Tu respiración cambia?' Estas son las señales de alerta temprana.",
            iconName: "figure.stand"
        ),
        TV1Pillar(
            name: "Análisis Cognitivo",
            definition: "La comprensión de que los pensamientos actúan como 'nubes de humo' que alimentan el volcán, y que podemos cambiarlos por pensamientos más realistas.",
            practicalApplication: "Ayuda a cuestionar pensamientos como 'siempre me molesta' o 'lo hace a propósito', reemplazándolos por 'esta vez tropezó sin querer'.",
            iconName: "cloud.fill"
        ),
        TV1Pillar(
            name: "Aceptación Emocional",
            definition: "El entendimiento de que el volcán es parte de nosotros, pero no define quiénes somos. La rabia es una señal, no una identidad.",
            practicalApplication: "Refuerza: 'El volcán es parte de ti, pero el volcán no eres tú. Tú eres mucho más que esta emoción que estás sintiendo ahora.'",
            iconName: "heart.fill"
        )
    ]
    
    // MARK: - Secciones Teóricas Fundamentales
    static let theoreticalSections: [TV1Section] = [
        TV1Section(
            title: "El Volcán Interior",
            subtitle: "La metáfora central del modelo",
            description: "Cada niño tiene un volcán dentro, ubicado entre el ombligo y las costillas. Este volcán representa la rabia, esa fuerza que a veces parece incontrolable. No es algo malo que hay que eliminar, sino una energía que necesita ser comprendida y dirigida.",
            keyIdea: "El objetivo no es apagar el volcán, sino aprender a ser su 'domador', convirtiéndonos en capitanes de nuestras emociones."
        ),
        TV1Section(
            title: "La Rabia como Emoción Natural",
            subtitle: "Normalización de la experiencia",
            description: "La rabia es una emoción universal que todos experimentamos, niños y adultos. No es negativa en sí misma; el desafío está en cómo la gestionamos. Cuando la entendemos, puede convertirse en una señal de alarma útil.",
            keyIdea: "Sentir rabia no te convierte en una persona mala. Es una emoción transitoria que todos sentimos cuando algo nos molesta o nos frustra."
        ),
        TV1Section(
            title: "Identidad vs. Emoción",
            subtitle: "Separar el ser de la experiencia emocional",
            description: "Es fundamental que los niños comprendan que experimentar rabia no define quiénes son. La emoción es temporal y manejable; la persona es mucho más que ese momento de intensidad emocional.",
            keyIdea: "Ayuda a tu hijo a entender: 'Estás sintiendo rabia' en lugar de 'Eres un niño rabioso'. La diferencia es crucial para su autoestima."
        ),
        TV1Section(
            title: "El Volcán como Fortaleza",
            subtitle: "Transformando la energía en crecimiento",
            description: "Cuando aprendemos a gestionar el volcán, su energía se transforma en una fuente de fortaleza personal. La 'lava' puede ser constructiva: nos ayuda a establecer límites, defendernos y proteger a otros.",
            keyIdea: "Cada vez que tu hijo gestiona su rabia exitosamente, está desarrollando su 'músculo emocional', ganando resiliencia y autoconfianza."
        )
    ]
    
    // MARK: - Ejemplos Clínicos (Basados en la historia del libro)
    static let clinicalExamples: [TV1Example] = [
        TV1Example(
            scenario: "Un amigo toma un juguete sin pedir permiso",
            childName: "Alba",
            beforeManagement: "Alba siente un calor extraño que sube por su cuerpo. No entiende qué es. El calor crece y crece hasta que explota en gritos y lágrimas, dejándola asustada y confundida.",
            afterManagement: "Alba reconoce la 'chispa inicial', ese primer calor. Sabe que es su volcán avisándole. Respira como le enseñó el hada y puede decir: 'Me molesta que tomes mi juguete sin preguntar'.",
            clinicalInsight: "La alfabetización emocional permite a los niños nombrar lo que sienten en lugar de ser dominados por la emoción. Reconocer la chispa inicial da tiempo para intervenir antes de la erupción.",
            volcanoPhase: .chispa
        ),
        TV1Example(
            scenario: "Un proyecto escolar sale mal después de mucho esfuerzo",
            childName: "Luca",
            beforeManagement: "Luca siente que sus manos se cierran en puños, sus hombros se tensan, su respiración se acelera. El burbujeo del volcán crece. De repente, lanza el proyecto al suelo y grita que todo es injusto.",
            afterManagement: "Luca nota las señales físicas del burbujeo: manos tensas, respiración rápida. Reconoce su 'mapa del volcán' activándose. Se aleja un momento, respira profundo y busca a un adulto para pedir ayuda.",
            clinicalInsight: "El mapa corporal del volcán funciona como un sistema de alerta temprana. Cuando los niños aprenden a leer estas señales, pueden intervenir antes de perder el control.",
            volcanoPhase: .burbujeo
        ),
        TV1Example(
            scenario: "Negación de un deseo importante (no poder ir al parque)",
            childName: "Alba",
            beforeManagement: "El volcán de Alba explota. Su cara se pone roja, sus oídos zumban, grita con toda su fuerza, patalea, llora. La rabia se apodera de todo su cuerpo y no puede parar, asustándose a sí misma.",
            afterManagement: "Aunque siente la gran erupción comenzando, Alba recuerda que puede usar su 'paraguas mágico': se va a su habitación, abraza su almohada, respira varias veces. Después puede hablar de su frustración sin gritar.",
            clinicalInsight: "Incluso cuando la erupción es intensa, tener herramientas da a los niños una sensación de control. Aprender que pueden manejar incluso las emociones más fuertes desarrolla su resiliencia emocional.",
            volcanoPhase: .erupcion
        )
    ]
    
    // MARK: - Señales Físicas del Mapa del Volcán
    static let physicalSignals: [TV1PhysicalSignal] = [
        // Fase 1: La Chispa Inicial
        TV1PhysicalSignal(
            bodyPart: "Estómago",
            description: "Un calor extraño que aparece y empieza a subir por el cuerpo",
            phase: .chispa,
            iconName: "flame.fill"
        ),
        TV1PhysicalSignal(
            bodyPart: "Pecho",
            description: "Sensación de calor que sube desde el estómago",
            phase: .chispa,
            iconName: "heart.fill"
        ),
        
        // Fase 2: El Burbujeo
        TV1PhysicalSignal(
            bodyPart: "Hombros",
            description: "Se ponen tensos, rígidos, se elevan",
            phase: .burbujeo,
            iconName: "figure.arms.open"
        ),
        TV1PhysicalSignal(
            bodyPart: "Manos",
            description: "Se cierran en puños, se tensan involuntariamente",
            phase: .burbujeo,
            iconName: "hand.raised.fill"
        ),
        TV1PhysicalSignal(
            bodyPart: "Mandíbula",
            description: "Se cierra con fuerza, los dientes se tocan y aprietan",
            phase: .burbujeo,
            iconName: "mouth.fill"
        ),
        TV1PhysicalSignal(
            bodyPart: "Ceño",
            description: "Se frunce, las cejas se juntan hacia el centro",
            phase: .burbujeo,
            iconName: "face.dashed.fill"
        ),
        TV1PhysicalSignal(
            bodyPart: "Ojos",
            description: "Se 'achican', la mirada se vuelve más intensa",
            phase: .burbujeo,
            iconName: "eye.fill"
        ),
        TV1PhysicalSignal(
            bodyPart: "Voz",
            description: "Suena más gruesa, más grave, con tensión",
            phase: .burbujeo,
            iconName: "waveform"
        ),
        TV1PhysicalSignal(
            bodyPart: "Brazos",
            description: "Sensación de hormigueo, energía acumulándose",
            phase: .burbujeo,
            iconName: "bolt.fill"
        ),
        TV1PhysicalSignal(
            bodyPart: "Respiración",
            description: "Se vuelve más rápida, más ruidosa, menos controlada",
            phase: .burbujeo,
            iconName: "wind"
        ),
        
        // Fase 3: La Gran Erupción
        TV1PhysicalSignal(
            bodyPart: "Cara",
            description: "Se pone muy roja, el calor es visible",
            phase: .erupcion,
            iconName: "face.smiling.fill"
        ),
        TV1PhysicalSignal(
            bodyPart: "Oídos",
            description: "Zumban, cuesta escuchar con claridad",
            phase: .erupcion,
            iconName: "ear.fill"
        ),
        TV1PhysicalSignal(
            bodyPart: "Cuerpo completo",
            description: "Gritos, pataletas, lágrimas, o un silencio intenso como un muro",
            phase: .erupcion,
            iconName: "exclamationmark.triangle.fill"
        ),
        TV1PhysicalSignal(
            bodyPart: "Impulsos",
            description: "Necesidad intensa de golpear, lanzar cosas, o movimientos bruscos",
            phase: .erupcion,
            iconName: "tornado"
        )
    ]
    
    // MARK: - Citas Inspiradoras del Libro
    static let inspirationalQuotes: [TV1Quote] = [
        TV1Quote(
            text: "El volcán es parte de ti, sí, pero el volcán no es tú.",
            author: "Míriam Tirado",
            context: "Ayuda a los niños a separar su identidad de sus emociones intensas"
        ),
        TV1Quote(
            text: "La lava puede ser una fuerza poderosa y constructiva cuando aprendemos a dirigirla.",
            author: "Míriam Tirado",
            context: "Transforma la rabia en energía positiva para establecer límites y protegerse"
        ),
        TV1Quote(
            text: "Cada vez que gestionas una emoción intensa, desarrollas tu músculo emocional.",
            author: "Míriam Tirado",
            context: "La regulación emocional se fortalece con la práctica, como un músculo"
        ),
        TV1Quote(
            text: "No se trata de apagar el volcán, sino de aprender a ser su domador.",
            author: "Míriam Tirado",
            context: "El objetivo es controlar la emoción, no suprimirla"
        ),
        TV1Quote(
            text: "El volcán avisa antes de explotar. Solo necesitamos aprender a escuchar sus señales.",
            author: "Míriam Tirado",
            context: "Las señales físicas son el sistema de alerta temprana del cuerpo"
        )
    ]
}

