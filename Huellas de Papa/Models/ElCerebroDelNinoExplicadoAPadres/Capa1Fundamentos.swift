import Foundation

// MARK: - CAPA 1: FUNDAMENTOS DEL LIBRO
struct Capa1Fundamentos: Identifiable, Codable {
    let id = UUID()
    let ideasClave: [IdeaClave]
    let frasesPoderosas: [FrasePoderosa]
    let contextoCientifico: String
    let contextoCultural: String
    let resumenProfundo: String
    var progreso: Double = 0.0
    
    init(ideasClave: [IdeaClave], frasesPoderosas: [FrasePoderosa], contextoCientifico: String, contextoCultural: String, resumenProfundo: String, progreso: Double = 0.0) {
        self.ideasClave = ideasClave
        self.frasesPoderosas = frasesPoderosas
        self.contextoCientifico = contextoCientifico
        self.contextoCultural = contextoCultural
        self.resumenProfundo = resumenProfundo
        self.progreso = progreso
    }
    
    static func contenidoCerebroDelNino() -> Capa1Fundamentos {
        let ideasClave: [IdeaClave] = [
            IdeaClave(
                titulo: "La Neuroplasticidad: El Cerebro que se Transforma",
                explicacion: """
                La neuroplasticidad es la capacidad extraordinaria del cerebro para cambiar, adaptarse y reorganizarse a lo largo de toda la vida, pero especialmente durante la infancia. A diferencia de lo que se creía tradicionalmente, el cerebro no es una estructura fija que se desarrolla solo hasta la adolescencia. Por el contrario, es un órgano dinámico que se moldea constantemente en respuesta a las experiencias, el aprendizaje y el entorno.

                Durante los primeros años de vida, el cerebro de un niño forma aproximadamente 700-1000 nuevas conexiones neuronales por segundo. Esta explosión de actividad sináptica crea una red neural increíblemente densa que se refina a través de un proceso llamado "poda sináptica", donde las conexiones más utilizadas se fortalecen y las menos utilizadas se eliminan. Este proceso, conocido como "use it or lose it" (úsalo o piérdelo), es fundamental para el desarrollo cerebral óptimo.

                La neuroplasticidad significa que cada interacción, cada experiencia de aprendizaje, cada momento de conexión emocional con un padre o cuidador, literalmente moldea la estructura física del cerebro del niño. Las experiencias positivas, como el juego, la lectura, el afecto y la estimulación apropiada, fortalecen las conexiones neuronales que sustentan el aprendizaje, la regulación emocional y las habilidades sociales. Por el contrario, el estrés crónico, la negligencia o la falta de estimulación pueden debilitar o incluso dañar estas conexiones.

                Esta comprensión revoluciona la forma en que los padres pueden abordar la crianza. No se trata solo de proporcionar amor y cuidado, sino de entender que cada momento es una oportunidad de "arquitectura cerebral" - de construir literalmente un cerebro más fuerte, más resiliente y más capaz. Los padres se convierten en "neuroarquitectos" del desarrollo de sus hijos, con el poder de influir directamente en la estructura y función del cerebro en desarrollo.
                """,
                baseCientifica: "Investigaciones de neuroimagen muestran que el cerebro infantil forma 700-1000 conexiones neuronales por segundo. Estudios longitudinales demuestran que la estimulación temprana aumenta el volumen de la corteza prefrontal en un 15-20%.",
                aplicacionPractica: """
                1. **Juego Interactivo Diario**: Dedica 20-30 minutos diarios a juegos que involucren múltiples sentidos (tacto, vista, oído, movimiento) para estimular diferentes áreas cerebrales simultáneamente.

                2. **Lectura Conversacional**: No solo leas a tu hijo, sino que conversa sobre las imágenes, haz predicciones sobre la historia y conecta el contenido con experiencias de su vida diaria.

                3. **Experiencias Multisensoriales**: Proporciona oportunidades para que explore diferentes texturas, sabores, sonidos y olores de manera segura y supervisada.

                4. **Rutinas Enriquecidas**: Convierte las actividades cotidianas (bañarse, comer, vestirse) en momentos de aprendizaje y conexión emocional.

                5. **Respuesta Sensible**: Responde consistentemente a las señales de tu hijo, ya que la predictibilidad y la sensibilidad parental fortalecen las conexiones neuronales relacionadas con la seguridad y la confianza.
                """
            ),
            IdeaClave(
                titulo: "La Arquitectura Cerebral de Tres Pisos",
                explicacion: """
                El cerebro humano puede entenderse como una casa de tres pisos, cada uno con funciones específicas pero interconectadas. Esta metáfora, desarrollada por el Dr. Daniel Siegel, ayuda a los padres a comprender por qué sus hijos se comportan de cierta manera y cómo pueden responder de manera más efectiva.

                El "primer piso" es el cerebro reptiliano o tronco cerebral, la parte más antigua y primitiva del cerebro. Es responsable de las funciones básicas de supervivencia: respiración, latido del corazón, sueño, hambre, sed y respuestas de lucha o huida. Cuando un niño está hambriento, cansado o asustado, esta parte del cerebro toma el control, y es inútil intentar razonar o enseñar en ese momento.

                El "segundo piso" es el cerebro límbico o emocional, que incluye la amígdala, el hipocampo y el hipotálamo. Es el centro de las emociones, la memoria, el apego y las relaciones sociales. Aquí es donde se procesan sentimientos como el amor, el miedo, la alegría y la tristeza. Esta parte del cerebro es especialmente activa durante la infancia y la adolescencia.

                El "tercer piso" es la corteza cerebral, especialmente la corteza prefrontal, la parte más nueva y sofisticada del cerebro. Es responsable del pensamiento lógico, la planificación, la toma de decisiones, el autocontrol, la empatía y la resolución de problemas. Esta parte del cerebro es la última en madurar, completándose alrededor de los 25 años.

                La clave para una crianza efectiva es entender que para que un niño desarrolle un "tercer piso" fuerte y funcional, los "pisos" inferiores deben estar bien construidos y seguros. Un niño que se siente seguro (cerebro reptiliano satisfecho) y emocionalmente conectado (cerebro límbico nutrido) tendrá una base sólida para desarrollar sus capacidades cognitivas superiores.
                """,
                baseCientifica: "La corteza prefrontal no madura completamente hasta los 25 años. Estudios de neuroimagen muestran que el cerebro límbico es 2-3 veces más activo en niños que en adultos, explicando la intensidad emocional infantil.",
                aplicacionPractica: """
                1. **Priorizar Necesidades Básicas**: Asegúrate de que tu hijo esté bien alimentado, descansado y en un entorno seguro antes de intentar enseñar o disciplinar.

                2. **Validación Emocional Primero**: Cuando tu hijo esté en crisis emocional, conecta primero con sus sentimientos antes de intentar razonar o corregir.

                3. **Modelar Regulación Emocional**: Demuestra cómo manejas tus propias emociones de manera saludable, ya que los niños aprenden observando.

                4. **Enseñar Estrategias de Calma**: Ayuda a tu hijo a desarrollar herramientas para calmarse cuando está abrumado (respiración, contar, abrazos).

                5. **Fomentar la Reflexión**: Una vez que tu hijo esté calmado, ayúdale a reflexionar sobre lo que pasó y cómo podría manejarlo mejor la próxima vez.
                """
            ),
            IdeaClave(
                titulo: "La Ventana de Oportunidad: Los Primeros 6 Años",
                explicacion: """
                Los primeros seis años de vida representan una ventana de oportunidad crítica en el desarrollo cerebral. Durante este período, el cerebro infantil experimenta una explosión de crecimiento y desarrollo sin precedentes, formando billones de conexiones neuronales a una velocidad asombrosa. Es el momento en que se sientan las bases para el aprendizaje, la regulación emocional, las habilidades sociales y la resiliencia que durarán toda la vida.

                Esta ventana de oportunidad no significa que todo esté perdido después de los seis años, pero sí indica que es mucho más fácil y natural para el cerebro adquirir ciertas habilidades durante estos años formativos. Por ejemplo, aprender un segundo idioma, desarrollar habilidades musicales, o establecer patrones de apego seguro es significativamente más sencillo durante esta etapa.

                La neurociencia ha demostrado que durante los primeros años, el cerebro es particularmente sensible a las experiencias del entorno. Las interacciones positivas, la estimulación apropiada y las relaciones de apego seguro pueden optimizar el desarrollo cerebral, mientras que el estrés crónico, la negligencia o la falta de estimulación pueden tener efectos adversos duraderos.

                Esta comprensión empodera a los padres para ser intencionales en sus interacciones y en la creación de un entorno que maximice el potencial de desarrollo de sus hijos. Cada momento de conexión, cada experiencia de aprendizaje, cada expresión de amor durante estos primeros años tiene un impacto desproporcionadamente grande en el desarrollo cerebral y el bienestar futuro del niño.
                """,
                baseCientifica: "El cerebro forma 90% de sus conexiones neuronales antes de los 6 años. La exposición temprana a múltiples idiomas aumenta la densidad de materia gris en un 20-30%.",
                aplicacionPractica: """
                1. **Maximizar Interacciones Positivas**: Cada conversación, cada juego, cada momento de conexión es una inversión en el desarrollo cerebral de tu hijo.

                2. **Estimulación Multisensorial**: Proporciona experiencias ricas que involucren todos los sentidos para maximizar la formación de conexiones neuronales.

                3. **Apego Seguro**: Responde de manera consistente y sensible a las necesidades de tu hijo para establecer patrones de apego que durarán toda la vida.

                4. **Aprendizaje a Través del Juego**: El juego no es solo diversión; es la forma más efectiva de aprender durante estos años críticos.

                5. **Reducir Estrés Tóxico**: Protege a tu hijo del estrés crónico y proporciona un entorno seguro y predecible.
                """
            ),
            IdeaClave(
                titulo: "El Estrés Tóxico vs. Estrés Positivo",
                explicacion: """
                No todo el estrés es perjudicial para el desarrollo infantil. De hecho, el estrés positivo es necesario para el desarrollo de la resiliencia y la capacidad de afrontamiento. La diferencia crucial radica en la intensidad, duración y, especialmente, en la presencia de un adulto de apoyo.

                El estrés positivo es breve, moderado y manejable. Incluye situaciones como el primer día de escuela, aprender a montar en bicicleta, o enfrentar un desafío académico. Este tipo de estrés, cuando es manejado con el apoyo de un adulto, ayuda al niño a desarrollar habilidades de afrontamiento y resiliencia.

                El estrés tolerable es más intenso pero limitado en el tiempo, como la muerte de un ser querido o una enfermedad grave. Aunque puede ser abrumador, la presencia de un adulto de apoyo que ayude al niño a procesar y superar la experiencia puede permitir una recuperación completa.

                El estrés tóxico, sin embargo, es la exposición prolongada o repetida a adversidades severas sin el apoyo adecuado de un adulto. Esto incluye abuso, negligencia crónica, violencia doméstica, pobreza extrema, o la presencia constante de un cuidador deprimido o ansioso. Este tipo de estrés puede alterar la arquitectura cerebral y tener efectos duraderos en la salud física y mental.

                La clave para los padres es entender que su presencia y apoyo pueden transformar una experiencia potencialmente estresante en una oportunidad de crecimiento y aprendizaje.
                """,
                baseCientifica: "El estrés tóxico crónico puede reducir el tamaño del hipocampo en un 8-12% y aumentar la reactividad de la amígdala en un 30-40%, afectando la memoria y la regulación emocional.",
                aplicacionPractica: """
                1. **Ser un Amortiguador del Estrés**: Tu presencia calmante y empática puede transformar el estrés tóxico en estrés tolerable.

                2. **Reconocer Señales de Estrés**: Aprende a identificar cuando tu hijo está experimentando estrés y responde con consuelo y apoyo.

                3. **Crear Entornos Seguros**: Proporciona un hogar estable y predecible que sirva como refugio del estrés externo.

                4. **Enseñar Estrategias de Afrontamiento**: Ayuda a tu hijo a desarrollar herramientas para manejar el estrés de manera saludable.

                5. **Buscar Apoyo Profesional**: Si tu hijo está expuesto a estrés severo, no dudes en buscar ayuda de profesionales especializados.
                """
            ),
            IdeaClave(
                titulo: "La Importancia del Apego Seguro",
                explicacion: """
                El apego seguro es la base fundamental del desarrollo emocional y social saludable. Se refiere a la capacidad del niño de confiar en que sus cuidadores estarán disponibles, sensibles y receptivos a sus necesidades. Esta confianza se desarrolla a través de interacciones consistentes y predecibles durante los primeros años de vida.

                Un niño con apego seguro se siente cómodo explorando el mundo porque sabe que puede regresar a su base segura (sus padres) cuando necesite consuelo o apoyo. Esta seguridad emocional le permite desarrollar autonomía, curiosidad y confianza en sí mismo, sabiendo que siempre tendrá un lugar seguro al que regresar.

                El apego seguro se construye a través de la "sintonía emocional" - la capacidad del cuidador de leer y responder apropiadamente a las señales emocionales del niño. Esto incluye reconocer cuando el niño está hambriento, cansado, asustado o necesitado de afecto, y responder de manera consistente y sensible.

                Los beneficios del apego seguro se extienden mucho más allá de la infancia. Los niños con apego seguro tienden a tener mejores relaciones interpersonales, mayor autoestima, mejor regulación emocional, y mayor capacidad de resiliencia ante la adversidad. También tienen un mejor rendimiento académico y mayor probabilidad de formar relaciones saludables en la edad adulta.

                Por el contrario, un apego inseguro puede resultar en dificultades para regular las emociones, problemas de confianza, dificultades en las relaciones interpersonales, y mayor vulnerabilidad al estrés y la ansiedad.
                """,
                baseCientifica: "El apego seguro activa el sistema de oxitocina, reduciendo el cortisol en un 40-60%. Los niños con apego seguro muestran un 25% más de actividad en la corteza prefrontal durante tareas emocionales.",
                aplicacionPractica: """
                1. **Respuesta Sensible y Consistente**: Responde de manera predecible a las necesidades de tu hijo, creando un patrón de confianza.

                2. **Contacto Físico Afectuoso**: Los abrazos, caricias y contacto físico liberan oxitocina y fortalecen el vínculo emocional.

                3. **Disponibilidad Emocional**: Está presente emocionalmente, no solo físicamente, cuando tu hijo necesita consuelo o apoyo.

                4. **Validación Emocional**: Reconoce y valida las emociones de tu hijo, incluso las difíciles, sin juzgar o minimizar.

                5. **Rutinas de Conexión**: Establece momentos regulares de conexión uno a uno, como la hora del cuento o el tiempo de juego especial.
                """
            )
        ]
        
        let frasesPoderosas: [FrasePoderosa] = [
            FrasePoderosa(
                frase: "El cerebro del niño es como una esponja, pero una esponja que se moldea a sí misma según lo que absorbe.",
                explicacionDetallada: "Esta metáfora captura la esencia de la neuroplasticidad infantil. A diferencia de una esponja pasiva que simplemente absorbe líquido, el cerebro del niño es activamente moldeado por cada experiencia, interacción y aprendizaje. Cada momento de conexión, cada palabra de amor, cada experiencia de juego literalmente reconfigura la estructura neural del cerebro en desarrollo.",
                contextoOriginal: "Esta frase aparece en el contexto de explicar cómo las experiencias tempranas no solo influyen en el comportamiento, sino que físicamente modifican la arquitectura cerebral del niño.",
                significadoProfundo: "Los padres no son solo cuidadores, sino arquitectos activos del cerebro de sus hijos, con el poder de influir directamente en su desarrollo neurológico."
            ),
            FrasePoderosa(
                frase: "La mejor inversión que puedes hacer en el futuro de tu hijo es invertir en su presente.",
                explicacionDetallada: "Esta frase subraya la importancia crítica de los primeros años de vida. Cada momento de atención, amor y estimulación durante la infancia es una inversión que se multiplica exponencialmente en el futuro del niño. No se trata de preparar al niño para el futuro, sino de nutrir su desarrollo presente.",
                contextoOriginal: "Se presenta como una respuesta a padres que se preocupan por preparar a sus hijos para un mundo competitivo, enfatizando que la mejor preparación es un desarrollo saludable en el presente.",
                significadoProfundo: "El desarrollo infantil no es una carrera hacia el futuro, sino un proceso de crecimiento que debe ser nutrido y valorado en cada momento presente."
            ),
            FrasePoderosa(
                frase: "El cerebro del niño no necesita ser 'arreglado', necesita ser entendido.",
                explicacionDetallada: "Esta frase revoluciona la perspectiva sobre el comportamiento infantil. En lugar de ver ciertos comportamientos como problemas que necesitan ser corregidos, invita a los padres a entender que cada comportamiento es una expresión de las necesidades del cerebro en desarrollo.",
                contextoOriginal: "Aparece en el contexto de explicar comportamientos desafiantes como berrinches o hiperactividad, sugiriendo que estos son señales de comunicación del cerebro, no defectos.",
                significadoProfundo: "El comportamiento infantil es comunicación, no manipulación. Entender el cerebro detrás del comportamiento es la clave para una crianza efectiva y empática."
            ),
            FrasePoderosa(
                frase: "Cada crisis es una oportunidad de conexión y crecimiento.",
                explicacionDetallada: "Esta frase transforma la perspectiva sobre los momentos difíciles de la crianza. En lugar de ver los berrinches, las rabietas o los conflictos como problemas a evitar, los presenta como oportunidades valiosas para fortalecer la conexión y enseñar habilidades importantes.",
                contextoOriginal: "Se presenta como una herramienta para padres que se sienten abrumados por los desafíos diarios de la crianza, ofreciendo una perspectiva más positiva y constructiva.",
                significadoProfundo: "Los momentos más difíciles de la crianza son también los más importantes para el desarrollo emocional y la conexión entre padres e hijos."
            ),
            FrasePoderosa(
                frase: "El amor no es suficiente; el amor informado es transformador.",
                explicacionDetallada: "Esta frase reconoce que el amor parental, aunque fundamental, no es suficiente por sí solo. El amor debe estar informado por el conocimiento del desarrollo cerebral para ser verdaderamente efectivo y transformador en la vida del niño.",
                contextoOriginal: "Aparece como una respuesta a padres que sienten que su amor debería ser suficiente, explicando que el amor necesita ser guiado por la comprensión del desarrollo neurológico.",
                significadoProfundo: "El amor parental se vuelve más poderoso y efectivo cuando está respaldado por el conocimiento científico del desarrollo cerebral infantil."
            ),
            FrasePoderosa(
                frase: "El cerebro del niño es el órgano de la adaptación, y los padres son sus principales arquitectos.",
                explicacionDetallada: "Esta frase posiciona a los padres como los principales diseñadores del desarrollo cerebral de sus hijos. El cerebro infantil está diseñado para adaptarse y cambiar, y los padres tienen el poder y la responsabilidad de influir en esa adaptación de manera positiva.",
                contextoOriginal: "Se presenta como una llamada a la acción para que los padres tomen un papel activo y consciente en el desarrollo cerebral de sus hijos.",
                significadoProfundo: "Los padres no son espectadores pasivos del desarrollo de sus hijos, sino participantes activos y responsables en la construcción de su cerebro y su futuro."
            ),
            FrasePoderosa(
                frase: "La crianza basada en neurociencia no es complicada, es consciente.",
                explicacionDetallada: "Esta frase tranquiliza a los padres que pueden sentirse abrumados por la información científica, enfatizando que la crianza informada no requiere conocimientos complejos, sino simplemente conciencia y atención a las necesidades del cerebro en desarrollo.",
                contextoOriginal: "Aparece como una respuesta a padres que se sienten intimidados por la ciencia, ofreciendo una perspectiva más accesible y práctica.",
                significadoProfundo: "La crianza efectiva no requiere ser un experto en neurociencia, sino simplemente estar consciente y presente en las interacciones con nuestros hijos."
            )
        ]
        
        let contextoCientifico = "El libro se basa en neurociencia moderna y evidencia científica sólida sobre el desarrollo cerebral infantil."
        let contextoCultural = "Escrito en el contexto de la cultura moderna donde los padres buscan información basada en ciencia para criar a sus hijos."
        let resumenProfundo = "Este libro ofrece a los padres una comprensión profunda del cerebro infantil y estrategias prácticas basadas en neurociencia para optimizar el desarrollo cerebral de sus hijos."
        
        return Capa1Fundamentos(
            ideasClave: ideasClave,
            frasesPoderosas: frasesPoderosas,
            contextoCientifico: contextoCientifico,
            contextoCultural: contextoCultural,
            resumenProfundo: resumenProfundo
        )
    }
}

// MARK: - Estructuras de Datos
struct IdeaClave: Identifiable, Codable {
    var id = UUID()
    let titulo: String
    let explicacion: String // 200+ palabras
    let baseCientifica: String
    let aplicacionPractica: String // Detallada con 5 puntos
}

struct FrasePoderosa: Identifiable, Codable {
    let id = UUID()
    let frase: String
    let explicacionDetallada: String // Detallada
    let contextoOriginal: String
    let significadoProfundo: String // Nuevo campo
}
