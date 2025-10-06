import Foundation

// MARK: - CAPA 1: FUNDAMENTOS DEL LIBRO
/// Estructura principal para la Capa 1 del módulo "El cerebro del niño explicado a los padres"
/// Contiene el contexto, principios, ejes neuroemocionales, errores comunes, frases guía, ideas visuales, relaciones y bibliografía
struct Capa1Fundamentos: Identifiable, Codable {
    let id: UUID
    let context: Capa1Context
    let principles: [Capa1Principle]
    let axes: [Capa1Axis]
    let pitfalls: [Capa1Pitfall]
    let mantras: [Capa1Mantra]
    let visualIdeas: [Capa1VisualIdea]
    let relations: [Capa1Relation]
    let references: [Capa1Reference]
    var progreso: Double = 0.0
    
    init(context: Capa1Context, principles: [Capa1Principle], axes: [Capa1Axis], pitfalls: [Capa1Pitfall], mantras: [Capa1Mantra], visualIdeas: [Capa1VisualIdea], relations: [Capa1Relation], references: [Capa1Reference], progreso: Double = 0.0) {
        self.id = UUID()
        self.context = context
        self.principles = principles
        self.axes = axes
        self.pitfalls = pitfalls
        self.mantras = mantras
        self.visualIdeas = visualIdeas
        self.relations = relations
        self.references = references
        self.progreso = progreso
    }
    
    // MARK: - Factory Method para contenido del libro
    static func contenidoCerebroDelNino() -> Capa1Fundamentos {
        let context = Capa1Context(
            titulo: "El cerebro del niño explicado a los padres",
            autor: "Dr. Álvaro Bilbao",
            proposito: """
            Este libro revoluciona la forma en que los padres entienden el desarrollo cerebral de sus hijos. 
            Álvaro Bilbao, neuropsicólogo clínico con más de 15 años de experiencia, democratiza el conocimiento 
            neurocientífico para empoderar a los padres como arquitectos activos del desarrollo cerebral infantil.
            
            El objetivo es transformar a los padres de espectadores pasivos a participantes conscientes en la 
            construcción del cerebro de sus hijos, proporcionando herramientas científicas para optimizar el 
            desarrollo neurológico desde los primeros años de vida.
            """,
            marcoConceptual: """
            El libro se fundamenta en las investigaciones más recientes en neurociencia del desarrollo, 
            neuroplasticidad y neuroimagen. Combina evidencia científica sólida con aplicaciones prácticas 
            para padres, basándose en trabajos de neurocientíficos como Patricia Kuhl, John Medina, y Daniel Siegel.
            
            La base científica incluye estudios longitudinales sobre desarrollo cerebral, investigaciones sobre 
            neuroplasticidad infantil, estudios de neuroimagen funcional que muestran cómo las experiencias moldean 
            el cerebro, y evidencia sobre la importancia de los primeros años en el desarrollo neurológico.
            """,
            importancia: """
            Los primeros años de vida son críticos para el desarrollo cerebral. El cerebro infantil forma 
            700-1000 nuevas conexiones neuronales por segundo, y las experiencias tempranas literalmente 
            moldean la arquitectura cerebral. Los padres tienen el poder de influir directamente en este 
            desarrollo a través de interacciones conscientes y basadas en neurociencia.
            
            La evidencia científica demuestra que la estimulación apropiada puede aumentar el volumen de la 
            corteza prefrontal en un 15-20%, mientras que el estrés tóxico puede dañar permanentemente las 
            conexiones neuronales.
            """,
            enfoque: """
            La crianza basada en neurociencia no es complicada, es consciente. No requiere ser un experto 
            en neurociencia, sino simplemente estar consciente y presente en las interacciones con nuestros 
            hijos. El amor informado por la ciencia es transformador.
            
            El libro se posiciona como un puente entre la ciencia compleja y la aplicación práctica, haciendo 
            accesible el conocimiento neurocientífico para padres de todos los niveles educativos, 
            empoderándolos con conocimiento científico para tomar decisiones informadas.
            """
        )
        
        // Principios centrales del desarrollo cerebral
        let principles: [Capa1Principle] = [
            Capa1Principle(
                titulo: "La Neuroplasticidad: El Cerebro que se Transforma",
                explicacion: """
                La neuroplasticidad es la capacidad extraordinaria del cerebro para cambiar, adaptarse y reorganizarse a lo largo de toda la vida, pero especialmente durante la infancia. A diferencia de lo que se creía tradicionalmente, el cerebro no es una estructura fija que se desarrolla solo hasta la adolescencia. Por el contrario, es un órgano dinámico que se moldea constantemente en respuesta a las experiencias, el aprendizaje y el entorno.

                Durante los primeros años de vida, el cerebro de un niño forma aproximadamente 700-1000 nuevas conexiones neuronales por segundo. Esta explosión de actividad sináptica crea una red neural increíblemente densa que se refina a través de un proceso llamado "poda sináptica", donde las conexiones más utilizadas se fortalecen y las menos utilizadas se eliminan. Este proceso, conocido como "use it or lose it" (úsalo o piérdelo), es fundamental para el desarrollo cerebral óptimo.

                La neuroplasticidad significa que cada interacción, cada experiencia de aprendizaje, cada momento de conexión emocional con un padre o cuidador, literalmente moldea la estructura física del cerebro del niño. Las experiencias positivas, como el juego, la lectura, el afecto y la estimulación apropiada, fortalecen las conexiones neuronales que sustentan el aprendizaje, la regulación emocional y las habilidades sociales.
                """,
                baseCientifica: "Investigaciones de neuroimagen muestran que el cerebro infantil forma 700-1000 conexiones neuronales por segundo. Estudios longitudinales demuestran que la estimulación temprana aumenta el volumen de la corteza prefrontal en un 15-20%.",
                aplicacionPractica: """
                1. **Juego Interactivo Diario**: Dedica 20-30 minutos diarios a juegos que involucren múltiples sentidos (tacto, vista, oído, movimiento) para estimular diferentes áreas cerebrales simultáneamente.

                2. **Lectura Conversacional**: No solo leas a tu hijo, sino que conversa sobre las imágenes, haz predicciones sobre la historia y conecta el contenido con experiencias de su vida diaria.

                3. **Experiencias Multisensoriales**: Proporciona oportunidades para que explore diferentes texturas, sabores, sonidos y olores de manera segura y supervisada.

                4. **Rutinas Enriquecidas**: Convierte las actividades cotidianas (bañarse, comer, vestirse) en momentos de aprendizaje y conexión emocional.

                5. **Respuesta Sensible**: Responde consistentemente a las señales de tu hijo, ya que la predictibilidad y la sensibilidad parental fortalecen las conexiones neuronales relacionadas con la seguridad y la confianza.
                """,
                ejemplos: """
                **Ejemplo 1: La Experiencia del "No" (Basado en el libro)**
                Según Álvaro Bilbao, cuando tu hijo de 2 años dice "no" por primera vez, está desarrollando su corteza prefrontal. En lugar de frustrarte, celebra este hito: "¡Qué bien! Ya sabes decir 'no'. Eso significa que tu cerebro está creciendo." Esta respuesta positiva fortalece las conexiones neuronales de autonomía.

                **Ejemplo 2: El Poder del Abrazo Neuroquímico**
                Bilbao explica que cada abrazo libera oxitocina, la "hormona del amor" que fortalece las conexiones neuronales. Cuando tu hijo de 3 años tiene una rabieta, un abrazo de 20 segundos puede ser más efectivo que mil palabras, ya que literalmente reconecta su cerebro emocional.
                """,
                importancia: "Este principio es fundamental porque establece que los padres no son solo cuidadores, sino arquitectos activos del cerebro de sus hijos, con el poder de influir directamente en su desarrollo neurológico."
            ),
            Capa1Principle(
                titulo: "La Arquitectura Cerebral de Tres Pisos",
                explicacion: """
                El cerebro humano puede entenderse como una casa de tres pisos, cada uno con funciones específicas pero interconectadas. Esta metáfora, desarrollada por el Dr. Daniel Siegel, ayuda a los padres a comprender por qué sus hijos se comportan de cierta manera y cómo pueden responder de manera más efectiva.

                El "primer piso" es el cerebro reptiliano o tronco cerebral, la parte más antigua y primitiva del cerebro. Es responsable de las funciones básicas de supervivencia: respiración, latido del corazón, sueño, hambre, sed y respuestas de lucha o huida. Cuando un niño está hambriento, cansado o asustado, esta parte del cerebro toma el control, y es inútil intentar razonar o enseñar en ese momento.

                El "segundo piso" es el cerebro límbico o emocional, que incluye la amígdala, el hipocampo y el hipotálamo. Es el centro de las emociones, la memoria, el apego y las relaciones sociales. Aquí es donde se procesan sentimientos como el amor, el miedo, la alegría y la tristeza. Esta parte del cerebro es especialmente activa durante la infancia y la adolescencia.

                El "tercer piso" es la corteza cerebral, especialmente la corteza prefrontal, la parte más nueva y sofisticada del cerebro. Es responsable del pensamiento lógico, la planificación, la toma de decisiones, el autocontrol, la empatía y la resolución de problemas. Esta parte del cerebro es la última en madurar, completándose alrededor de los 25 años.
                """,
                baseCientifica: "La corteza prefrontal no madura completamente hasta los 25 años. Estudios de neuroimagen muestran que el cerebro límbico es 2-3 veces más activo en niños que en adultos, explicando la intensidad emocional infantil.",
                aplicacionPractica: """
                1. **Priorizar Necesidades Básicas**: Asegúrate de que tu hijo esté bien alimentado, descansado y en un entorno seguro antes de intentar enseñar o disciplinar.

                2. **Validación Emocional Primero**: Cuando tu hijo esté en crisis emocional, conecta primero con sus sentimientos antes de intentar razonar o corregir.

                3. **Modelar Regulación Emocional**: Demuestra cómo manejas tus propias emociones de manera saludable, ya que los niños aprenden observando.

                4. **Enseñar Estrategias de Calma**: Ayuda a tu hijo a desarrollar herramientas para calmarse cuando está abrumado (respiración, contar, abrazos).

                5. **Fomentar la Reflexión**: Una vez que tu hijo esté calmado, ayúdale a reflexionar sobre lo que pasó y cómo podría manejarlo mejor la próxima vez.
                """,
                ejemplos: """
                **Ejemplo 1: El Cerebro Reptiliano en Acción (Según Bilbao)**
                Álvaro Bilbao describe cómo cuando tu hijo de 3 años tiene una rabieta porque no puede abrir una caja, su cerebro reptiliano está en control. En lugar de razonar, primero satisface sus necesidades básicas: "Veo que estás muy frustrado. ¿Tienes hambre? ¿Estás cansado?" Solo después de calmar el cerebro reptiliano puedes acceder a los otros "pisos".

                **Ejemplo 2: Conectando con el Cerebro Límbico**
                Bilbao enfatiza que el cerebro límbico procesa las emociones. Cuando tu hijo de 5 años llora porque perdió su juguete favorito, no digas "no es para tanto". En su lugar, conecta: "Entiendo que te sientes muy triste. Ese juguete era especial para ti." Esto activa su sistema límbico para procesar la emoción.
                """,
                importancia: "Este principio es crucial porque ayuda a los padres a entender que el comportamiento infantil no es manipulación, sino comunicación de las necesidades del cerebro en desarrollo."
            ),
            Capa1Principle(
                titulo: "La Ventana de Oportunidad: Los Primeros 6 Años",
                explicacion: """
                Los primeros seis años de vida representan una ventana de oportunidad crítica en el desarrollo cerebral. Durante este período, el cerebro infantil experimenta una explosión de crecimiento y desarrollo sin precedentes, formando billones de conexiones neuronales a una velocidad asombrosa. Es el momento en que se sientan las bases para el aprendizaje, la regulación emocional, las habilidades sociales y la resiliencia que durarán toda la vida.

                Esta ventana de oportunidad no significa que todo esté perdido después de los seis años, pero sí indica que es mucho más fácil y natural para el cerebro adquirir ciertas habilidades durante estos años formativos. Por ejemplo, aprender un segundo idioma, desarrollar habilidades musicales, o establecer patrones de apego seguro es significativamente más sencillo durante esta etapa.

                La neurociencia ha demostrado que durante los primeros años, el cerebro es particularmente sensible a las experiencias del entorno. Las interacciones positivas, la estimulación apropiada y las relaciones de apego seguro pueden optimizar el desarrollo cerebral, mientras que el estrés crónico, la negligencia o la falta de estimulación pueden tener efectos adversos duraderos.
                """,
                baseCientifica: "El cerebro forma 90% de sus conexiones neuronales antes de los 6 años. La exposición temprana a múltiples idiomas aumenta la densidad de materia gris en un 20-30%.",
                aplicacionPractica: """
                1. **Maximizar Interacciones Positivas**: Cada conversación, cada juego, cada momento de conexión es una inversión en el desarrollo cerebral de tu hijo.

                2. **Estimulación Multisensorial**: Proporciona experiencias ricas que involucren todos los sentidos para maximizar la formación de conexiones neuronales.

                3. **Apego Seguro**: Responde de manera consistente y sensible a las necesidades de tu hijo para establecer patrones de apego que durarán toda la vida.

                4. **Aprendizaje a Través del Juego**: El juego no es solo diversión; es la forma más efectiva de aprender durante estos años críticos.

                5. **Reducir Estrés Tóxico**: Protege a tu hijo del estrés crónico y proporciona un entorno seguro y predecible.
                """,
                ejemplos: """
                **Ejemplo 1: La Ventana de los Idiomas (Según Bilbao)**
                Álvaro Bilbao explica que entre los 0-6 años, el cerebro forma conexiones neuronales específicas para cada idioma. Si tu hijo de 3 años escucha español en casa e inglés en la guardería, su cerebro crea "autopistas neuronales" separadas para cada idioma. Después de los 6 años, el cerebro debe usar circuitos ya establecidos, haciendo el aprendizaje más difícil.

                **Ejemplo 2: El Desarrollo de la Empatía**
                Bilbao describe cómo entre los 2-4 años, el cerebro desarrolla las "neuronas espejo" que permiten la empatía. Cuando tu hijo de 3 años ve a otro niño llorar y automáticamente se acerca a consolarlo, está desarrollando conexiones neuronales que durarán toda la vida.
                """,
                importancia: "Este principio es vital porque establece que los primeros años son una inversión desproporcionadamente grande en el futuro desarrollo y bienestar del niño."
            ),
            Capa1Principle(
                titulo: "El Estrés Tóxico vs. Estrés Positivo",
                explicacion: """
                No todo el estrés es perjudicial para el desarrollo infantil. De hecho, el estrés positivo es necesario para el desarrollo de la resiliencia y la capacidad de afrontamiento. La diferencia crucial radica en la intensidad, duración y, especialmente, en la presencia de un adulto de apoyo.

                El estrés positivo es breve, moderado y manejable. Incluye situaciones como el primer día de escuela, aprender a montar en bicicleta, o enfrentar un desafío académico. Este tipo de estrés, cuando es manejado con el apoyo de un adulto, ayuda al niño a desarrollar habilidades de afrontamiento y resiliencia.

                El estrés tolerable es más intenso pero limitado en el tiempo, como la muerte de un ser querido o una enfermedad grave. Aunque puede ser abrumador, la presencia de un adulto de apoyo que ayude al niño a procesar y superar la experiencia puede permitir una recuperación completa.

                El estrés tóxico, sin embargo, es la exposición prolongada o repetida a adversidades severas sin el apoyo adecuado de un adulto. Esto incluye abuso, negligencia crónica, violencia doméstica, pobreza extrema, o la presencia constante de un cuidador deprimido o ansioso. Este tipo de estrés puede alterar la arquitectura cerebral y tener efectos duraderos en la salud física y mental.
                """,
                baseCientifica: "El estrés tóxico crónico puede reducir el tamaño del hipocampo en un 8-12% y aumentar la reactividad de la amígdala en un 30-40%, afectando la memoria y la regulación emocional.",
                aplicacionPractica: """
                1. **Ser un Amortiguador del Estrés**: Tu presencia calmante y empática puede transformar el estrés tóxico en estrés tolerable.

                2. **Reconocer Señales de Estrés**: Aprende a identificar cuando tu hijo está experimentando estrés y responde con consuelo y apoyo.

                3. **Crear Entornos Seguros**: Proporciona un hogar estable y predecible que sirva como refugio del estrés externo.

                4. **Enseñar Estrategias de Afrontamiento**: Ayuda a tu hijo a desarrollar herramientas para manejar el estrés de manera saludable.

                5. **Buscar Apoyo Profesional**: Si tu hijo está expuesto a estrés severo, no dudes en buscar ayuda de profesionales especializados.
                """,
                ejemplos: """
                **Ejemplo 1: Estrés Positivo - El Primer Día de Guardería (Según Bilbao)**
                Álvaro Bilbao explica que el estrés positivo es breve y manejable. Cuando tu hijo de 3 años va por primera vez a la guardería y llora, es estrés positivo si tú estás presente y lo consuelas: "Es normal sentirse triste. Estoy aquí contigo." Tu presencia amortigua el cortisol y fortalece su resiliencia.

                **Ejemplo 2: El Amortiguador del Estrés**
                El autor enfatiza que los padres somos "amortiguadores del estrés". Cuando tu hijo de 5 años se cae y se lastima, tu respuesta inmediata de consuelo y abrazo activa su sistema de calma, convirtiendo el estrés tóxico en estrés positivo que fortalece su desarrollo.
                """,
                importancia: "Este principio es fundamental porque establece que los padres pueden transformar experiencias potencialmente dañinas en oportunidades de crecimiento y resiliencia."
            ),
            Capa1Principle(
                titulo: "La Importancia del Apego Seguro",
                explicacion: """
                El apego seguro es la base fundamental del desarrollo emocional y social saludable. Se refiere a la capacidad del niño de confiar en que sus cuidadores estarán disponibles, sensibles y receptivos a sus necesidades. Esta confianza se desarrolla a través de interacciones consistentes y predecibles durante los primeros años de vida.

                Un niño con apego seguro se siente cómodo explorando el mundo porque sabe que puede regresar a su base segura (sus padres) cuando necesite consuelo o apoyo. Esta seguridad emocional le permite desarrollar autonomía, curiosidad y confianza en sí mismo, sabiendo que siempre tendrá un lugar seguro al que regresar.

                El apego seguro se construye a través de la "sintonía emocional" - la capacidad del cuidador de leer y responder apropiadamente a las señales emocionales del niño. Esto incluye reconocer cuando el niño está hambriento, cansado, asustado o necesitado de afecto, y responder de manera consistente y sensible.

                Los beneficios del apego seguro se extienden mucho más allá de la infancia. Los niños con apego seguro tienden a tener mejores relaciones interpersonales, mayor autoestima, mejor regulación emocional, y mayor capacidad de resiliencia ante la adversidad. También tienen un mejor rendimiento académico y mayor probabilidad de formar relaciones saludables en la edad adulta.
                """,
                baseCientifica: "El apego seguro activa el sistema de oxitocina, reduciendo el cortisol en un 40-60%. Los niños con apego seguro muestran un 25% más de actividad en la corteza prefrontal durante tareas emocionales.",
                aplicacionPractica: """
                1. **Respuesta Sensible y Consistente**: Responde de manera predecible a las necesidades de tu hijo, creando un patrón de confianza.

                2. **Contacto Físico Afectuoso**: Los abrazos, caricias y contacto físico liberan oxitocina y fortalecen el vínculo emocional.

                3. **Disponibilidad Emocional**: Está presente emocionalmente, no solo físicamente, cuando tu hijo necesita consuelo o apoyo.

                4. **Validación Emocional**: Reconoce y valida las emociones de tu hijo, incluso las difíciles, sin juzgar o minimizar.

                5. **Rutinas de Conexión**: Establece momentos regulares de conexión uno a uno, como la hora del cuento o el tiempo de juego especial.
                """,
                ejemplos: """
                **Ejemplo 1: La Base Segura (Concepto de Bilbao)**
                Álvaro Bilbao explica que el apego seguro se construye en los primeros 3 años. Cuando tu bebé de 8 meses llora y tú respondes consistentemente: "Aquí estoy, te escucho", su cerebro forma conexiones que le dicen "el mundo es seguro". Estas conexiones se convierten en su "base segura" para explorar.

                **Ejemplo 2: El Ritual de Conexión Diaria**
                Bilbao enfatiza la importancia de los rituales. Cada noche, tu hijo de 3 años sabe que tendrá 15 minutos de tu atención exclusiva para cuentos. Este ritual predecible libera oxitocina y fortalece las conexiones neuronales del apego, creando un "modelo interno de trabajo" que durará toda la vida.
                """,
                importancia: "Este principio es la base de todo el desarrollo emocional y social, estableciendo los cimientos para todas las relaciones futuras del niño."
            ),
            Capa1Principle(
                titulo: "El Cerebro Social: La Importancia de las Relaciones",
                explicacion: """
                El cerebro humano es fundamentalmente social, diseñado para conectarse y relacionarse con otros. Durante la infancia, las relaciones sociales no son solo importantes para el bienestar emocional, sino que son absolutamente críticas para el desarrollo cerebral saludable. El cerebro social se desarrolla a través de interacciones cara a cara, contacto visual, expresiones faciales, tono de voz y lenguaje corporal.

                Las neuronas espejo, descubiertas en la década de 1990, son fundamentales para entender cómo los niños aprenden a través de la observación e imitación. Estas neuronas se activan tanto cuando un niño realiza una acción como cuando observa a otra persona realizarla, creando una base neural para la empatía, el aprendizaje social y la comprensión de las intenciones de los demás.

                El desarrollo del cerebro social está íntimamente ligado a la capacidad de autorregulación emocional. Los niños que crecen en entornos socialmente ricos y empáticos desarrollan mejores habilidades para manejar el estrés, resolver conflictos y mantener relaciones saludables. Por el contrario, la falta de interacciones sociales positivas puede llevar a dificultades en el desarrollo de la empatía, la comunicación y las habilidades interpersonales.

                La calidad de las relaciones tempranas, especialmente con los padres y cuidadores principales, establece un patrón neural que influye en todas las relaciones futuras del niño. Un apego seguro crea un "modelo interno de trabajo" que permite al niño confiar en los demás, regular sus emociones y explorar el mundo con seguridad.
                """,
                baseCientifica: "Las neuronas espejo se desarrollan principalmente entre los 2-5 años. Estudios muestran que los niños con interacciones sociales ricas tienen un 40% más de conexiones en el cerebro social.",
                aplicacionPractica: """
                1. **Tiempo de Calidad Diario**: Dedica al menos 30 minutos diarios de interacción directa y sin distracciones con tu hijo.

                2. **Modelar Empatía**: Demuestra comprensión y compasión hacia los sentimientos de tu hijo y de otras personas.

                3. **Juego Social**: Fomenta juegos que involucren cooperación, turnos y interacción con otros niños.

                4. **Comunicación No Verbal**: Presta atención a las señales no verbales de tu hijo y responde apropiadamente.

                5. **Resolución de Conflictos**: Enseña habilidades para resolver problemas interpersonales de manera pacífica y respetuosa.
                """,
                ejemplos: """
                **Ejemplo 1: Las Neuronas Espejo en Acción (Según Bilbao)**
                Álvaro Bilbao explica que las neuronas espejo se desarrollan entre los 2-4 años. Cuando tu hijo de 3 años ve a otro niño llorar y automáticamente se acerca a consolarlo, sus neuronas espejo están activas. Estas neuronas le permiten "sentir" las emociones de otros y desarrollar empatía natural.

                **Ejemplo 2: El Contacto Visual como Conexión Social**
                Bilbao enfatiza que el contacto visual libera oxitocina. Cuando tu hijo de 4 años te mira a los ojos mientras le cuentas un cuento, su cerebro social se activa. Este contacto visual cara a cara es más poderoso que cualquier pantalla para desarrollar habilidades sociales.
                """,
                importancia: "Este principio es crucial porque establece que las relaciones sociales son el motor del desarrollo cerebral y la base de todas las habilidades humanas."
            ),
            Capa1Principle(
                titulo: "La Regulación Emocional: El Cerebro en Desarrollo",
                explicacion: """
                La regulación emocional es la capacidad de manejar y responder a las emociones de manera apropiada. En los niños, esta habilidad se desarrolla gradualmente a lo largo de los primeros años de vida, con el cerebro emocional (sistema límbico) madurando antes que la corteza prefrontal, que es responsable del control ejecutivo y la autorregulación.

                Durante los primeros años, los niños dependen completamente de los adultos para la regulación emocional externa. Los padres actúan como "cerebro externo" para sus hijos, ayudándoles a calmarse cuando están abrumados y a procesar emociones intensas. Esta regulación externa repetida y consistente eventualmente se internaliza, permitiendo al niño desarrollar su propia capacidad de autorregulación.

                El estrés y las emociones intensas pueden literalmente "secuestrar" el cerebro racional, especialmente en los niños pequeños. Cuando un niño está en crisis emocional, la amígdala (centro de miedo y alerta) toma el control, y es inútil intentar razonar o enseñar en ese momento. La clave es primero ayudar al niño a calmarse, y luego, cuando esté en un estado más regulado, procesar la experiencia y aprender de ella.

                La capacidad de regulación emocional está directamente relacionada con el éxito académico, las relaciones sociales y la salud mental a largo plazo. Los niños que desarrollan buenas habilidades de regulación emocional tienen mejor rendimiento escolar, relaciones más saludables y menor riesgo de problemas de salud mental.
                """,
                baseCientifica: "La corteza prefrontal no madura completamente hasta los 25 años. Los niños menores de 6 años tienen una capacidad limitada de autorregulación y dependen de la regulación externa.",
                aplicacionPractica: """
                1. **Co-regulación**: Ayuda a tu hijo a calmarse antes de intentar enseñar o corregir.

                2. **Validación Emocional**: Reconoce y nombra las emociones de tu hijo sin juzgarlas.

                3. **Estrategias de Calma**: Enseña técnicas como respiración profunda, contar o abrazos para manejar emociones intensas.

                4. **Modelar Regulación**: Demuestra cómo manejas tus propias emociones de manera saludable.

                5. **Prevención**: Identifica y minimiza los factores que desencadenan emociones intensas en tu hijo.
                """,
                ejemplos: """
                **Ejemplo 1: La Co-regulación Parental (Concepto de Bilbao)**
                Álvaro Bilbao explica que los niños no pueden autorregularse solos hasta los 6-7 años. Cuando tu hijo de 3 años tiene una rabieta, su cerebro límbico está en control. Tu calma literalmente "presta" tu corteza prefrontal: "Veo que estás muy frustrado. Respira conmigo: 1, 2, 3." Tu cerebro regulado ayuda a regular el suyo.

                **Ejemplo 2: El Cerebro Emocional vs. Racional**
                Bilbao describe cómo el cerebro límbico (emocional) madura antes que la corteza prefrontal (racional). Cuando tu hija de 5 años llora porque su amiga no quiso jugar, no puedes razonar con su cerebro límbico. Primero conecta: "Es muy triste cuando nuestros amigos no quieren jugar." Luego, cuando esté calmada, puedes reflexionar.
                """,
                importancia: "Este principio es fundamental porque establece que la regulación emocional es la base de todo el desarrollo cognitivo, social y académico del niño."
            )
        ]
        
        // Ejes neuroemocionales centrales del desarrollo cerebral
        let axes: [Capa1Axis] = [
            Capa1Axis(
                nombre: "Amígdala: El Centro de Alerta",
                funcion: "La amígdala es el sistema de alarma del cerebro, responsable de detectar amenazas y activar respuestas de supervivencia. En los niños, es especialmente sensible y puede activarse fácilmente ante situaciones nuevas, cambios o estrés.",
                desarrollo: "Se desarrolla completamente hacia los 2-3 años, pero es muy reactiva durante toda la infancia. Los niños con amígdalas hiperactivas pueden mostrar ansiedad, miedo excesivo o reacciones intensas ante cambios.",
                importancia: "Una amígdala bien regulada permite al niño explorar el mundo con confianza, mientras que una amígdala hiperactiva puede limitar el aprendizaje y las experiencias sociales.",
                estimulacion: "Crear entornos seguros y predecibles, validar las emociones del niño, enseñar técnicas de calma y proporcionar consuelo consistente cuando está asustado."
            ),
            Capa1Axis(
                nombre: "Corteza Prefrontal: El Centro Ejecutivo",
                funcion: "La corteza prefrontal es el 'CEO' del cerebro, responsable del control ejecutivo, la planificación, la toma de decisiones, la autorregulación y la empatía. Es la parte más sofisticada del cerebro humano.",
                desarrollo: "Es la última parte del cerebro en madurar, completándose alrededor de los 25 años. Durante la infancia, los niños dependen de los adultos para funciones ejecutivas como el autocontrol y la planificación.",
                importancia: "Una corteza prefrontal bien desarrollada es crucial para el éxito académico, las relaciones sociales y la capacidad de autorregulación emocional.",
                estimulacion: "Fomentar la reflexión, enseñar estrategias de resolución de problemas, modelar el autocontrol, proporcionar oportunidades para la toma de decisiones apropiadas para la edad."
            ),
            Capa1Axis(
                nombre: "Hipocampo: El Archivo de Memoria",
                funcion: "El hipocampo es el centro de la memoria y el aprendizaje. Convierte las experiencias en recuerdos a largo plazo y es fundamental para el aprendizaje académico y emocional.",
                desarrollo: "Se desarrolla gradualmente durante los primeros años, con picos de crecimiento entre los 2-5 años. Es especialmente sensible al estrés, que puede afectar su funcionamiento.",
                importancia: "Un hipocampo saludable es esencial para el aprendizaje, la formación de recuerdos positivos y la capacidad de recordar experiencias que guían el comportamiento futuro.",
                estimulacion: "Crear experiencias de aprendizaje significativas, reducir el estrés tóxico, fomentar la repetición y la práctica, conectar nuevos aprendizajes con experiencias previas."
            ),
            Capa1Axis(
                nombre: "Cerebelo: El Coordinador Motor y Cognitivo",
                funcion: "El cerebelo no solo coordina el movimiento, sino que también está involucrado en funciones cognitivas como la atención, el lenguaje y la regulación emocional. Es crucial para el desarrollo de habilidades motoras y cognitivas.",
                desarrollo: "Se desarrolla rápidamente durante los primeros 2 años de vida, con un segundo pico de crecimiento entre los 5-7 años. Es muy sensible a la estimulación temprana.",
                importancia: "Un cerebelo bien desarrollado mejora la coordinación, el equilibrio, la atención y las habilidades de aprendizaje, especialmente en lectura y matemáticas.",
                estimulacion: "Fomentar el movimiento y la actividad física, proporcionar actividades que requieran coordinación ojo-mano, practicar actividades rítmicas y de equilibrio."
            ),
            Capa1Axis(
                nombre: "Sistema Límbico: El Centro Emocional",
                funcion: "El sistema límbico es el centro emocional del cerebro, incluyendo estructuras como la amígdala, el hipocampo y el hipotálamo. Procesa emociones, memoria emocional y respuestas de estrés.",
                desarrollo: "Se desarrolla temprano y es muy activo durante la infancia. Los niños procesan las emociones de manera más intensa que los adultos debido a la inmadurez de la corteza prefrontal.",
                importancia: "Un sistema límbico bien regulado permite el procesamiento saludable de emociones, la formación de apegos seguros y la capacidad de manejar el estrés de manera efectiva.",
                estimulacion: "Validar y nombrar emociones, proporcionar consuelo y apoyo emocional, enseñar estrategias de regulación emocional, crear experiencias emocionales positivas."
            ),
            Capa1Axis(
                nombre: "Neuronas Espejo: El Cerebro Social",
                funcion: "Las neuronas espejo permiten al cerebro 'reflejar' las acciones y emociones de otros, creando la base neural para la empatía, el aprendizaje por observación y la comprensión social.",
                desarrollo: "Se desarrollan principalmente entre los 2-5 años, con picos de actividad durante la interacción social y el juego. Son fundamentales para el desarrollo de habilidades sociales.",
                importancia: "Las neuronas espejo son la base de la empatía, la imitación, el aprendizaje social y la capacidad de entender las intenciones de otros.",
                estimulacion: "Fomentar la interacción social cara a cara, modelar comportamientos positivos, proporcionar oportunidades de juego social, limitar el tiempo de pantalla que interfiere con la interacción social."
            )
        ]
        // Errores comunes de crianza y su reencuadre (basados en el libro)
        let pitfalls: [Capa1Pitfall] = [
            Capa1Pitfall(
                error: "Intentar razonar con un niño en crisis emocional",
                impacto: "El niño no puede procesar información racional cuando su cerebro límbico está activado, generando más frustración y desconexión emocional.",
                reencuadre: "En lugar de razonar, conecta primero con la emoción: 'Veo que estás muy frustrado. Estoy aquí contigo.' Luego, cuando esté calmado, puedes reflexionar juntos.",
                alternativa: "Co-regulación emocional: respira con tu hijo, abrázalo, valida sus sentimientos. Una vez calmado, ayúdale a procesar lo que pasó y a encontrar soluciones.",
                explicacion: "Según Álvaro Bilbao, cuando un niño está en crisis emocional, su corteza prefrontal (centro racional) está 'secuestrada' por el sistema límbico. Intentar razonar en ese momento es como hablarle a alguien que está bajo el agua: no puede escucharte. La clave es primero ayudar a calmar el cerebro emocional, y luego acceder al cerebro racional."
            ),
            Capa1Pitfall(
                error: "Usar el castigo como herramienta principal de disciplina",
                impacto: "El castigo activa el sistema de estrés, generando miedo y resentimiento, pero no enseña habilidades de autorregulación ni resolución de problemas.",
                reencuadre: "El castigo enseña qué NO hacer, pero no enseña qué SÍ hacer. En lugar de castigar, enseña habilidades: 'Cuando te sientes enojado, puedes respirar hondo o pedir ayuda.'",
                alternativa: "Disciplina positiva: establece límites claros con amor, enseña habilidades de autorregulación, usa consecuencias naturales, y modela el comportamiento que quieres ver.",
                explicacion: "Bilbao explica que el castigo crónico puede dañar la arquitectura cerebral, especialmente el desarrollo de la corteza prefrontal. Los niños necesitan aprender a autorregularse, no a temer las consecuencias. La disciplina efectiva enseña habilidades para la vida, no solo evita comportamientos no deseados."
            ),
            Capa1Pitfall(
                error: "Minimizar o ignorar las emociones del niño",
                impacto: "Las emociones no validadas no desaparecen, se internalizan y pueden manifestarse como problemas de comportamiento, ansiedad o dificultades de regulación emocional.",
                reencuadre: "Las emociones son información, no manipulación. Cuando tu hijo llora, está comunicando una necesidad. En lugar de 'no es para tanto', di 'veo que esto es muy importante para ti'.",
                alternativa: "Validación emocional: reconoce y nombra las emociones de tu hijo, ayúdale a entender qué siente, y enséñale estrategias saludables para manejar emociones intensas.",
                explicacion: "Según el autor, validar las emociones no significa ceder a todas las demandas del niño, sino reconocer que sus sentimientos son reales e importantes. Esto fortalece la conexión emocional y enseña al niño que sus emociones son válidas y manejables."
            ),
            Capa1Pitfall(
                error: "Sobrecargar al niño con actividades y estimulación",
                impacto: "El exceso de estimulación puede abrumar el sistema nervioso en desarrollo, generando estrés, dificultades de atención y problemas de autorregulación.",
                reencuadre: "Más no siempre es mejor. El cerebro infantil necesita tiempo para procesar, consolidar aprendizajes y descansar. El aburrimiento es creativo y necesario.",
                alternativa: "Equilibrio estimulante: combina actividades estructuradas con tiempo libre, permite el aburrimiento creativo, respeta los ritmos naturales del niño, y prioriza la calidad sobre la cantidad.",
                explicacion: "Bilbao enfatiza que el cerebro infantil necesita 'tiempo muerto' para consolidar aprendizajes y desarrollar la creatividad. El exceso de estimulación puede ser tan perjudicial como la falta de ella. Los niños necesitan tiempo para procesar, soñar y crear conexiones neuronales propias."
            ),
            Capa1Pitfall(
                error: "Usar pantallas como niñera o para calmar al niño",
                impacto: "Las pantallas pueden interferir con el desarrollo de habilidades sociales, la autorregulación emocional y la capacidad de atención sostenida.",
                reencuadre: "Las pantallas son herramientas, no soluciones. En lugar de usar la tablet para calmar una rabieta, usa tu presencia, tu voz y tu abrazo.",
                alternativa: "Regulación natural: usa contacto físico, respiración, música suave, o actividades sensoriales para calmar a tu hijo. Las pantallas pueden ser educativas, pero no deben reemplazar la interacción humana.",
                explicacion: "El autor explica que las pantallas activan el sistema de recompensa del cerebro de manera similar a las drogas, creando dependencia y dificultando la autorregulación natural. Los niños necesitan aprender a calmarse a través de relaciones humanas, no de estímulos digitales."
            ),
            Capa1Pitfall(
                error: "Comparar al niño con otros o usar etiquetas negativas",
                impacto: "Las comparaciones y etiquetas pueden dañar la autoestima, crear expectativas rígidas y limitar el potencial del niño al definir su identidad de manera limitante.",
                reencuadre: "Cada niño es único y se desarrolla a su propio ritmo. En lugar de 'eres muy lento', di 'tú tienes tu propio ritmo, y eso está bien'.",
                alternativa: "Enfoque en fortalezas: reconoce las cualidades únicas de tu hijo, celebra sus logros individuales, y ayúdale a desarrollar sus talentos naturales sin comparaciones.",
                explicacion: "Bilbao explica que las etiquetas se convierten en profecías autocumplidas. Cuando le decimos a un niño que es 'malo' o 'lento', su cerebro comienza a actuar según esa etiqueta. Es mejor enfocarse en el comportamiento específico y en las fortalezas del niño."
            )
        ]
        // Frases guía y mantras del módulo (basados en el libro)
        let mantras: [Capa1Mantra] = [
            Capa1Mantra(
                frase: "El amor informado por la ciencia es transformador",
                explicacion: "Esta frase resume la filosofía central del libro: no se trata de ser un experto en neurociencia, sino de aplicar el conocimiento científico con amor y consciencia en la crianza diaria.",
                contexto: "Álvaro Bilbao enfatiza que los padres no necesitan ser neurocientíficos, sino simplemente estar conscientes de cómo sus acciones moldean el cerebro de sus hijos.",
                aplicacion: "Usa esta frase como recordatorio diario de que cada interacción con tu hijo tiene un impacto neurocientífico. No necesitas ser perfecto, solo consciente.",
                significado: "Representa la unión entre el amor parental instintivo y el conocimiento científico, creando una crianza más efectiva y consciente."
            ),
            Capa1Mantra(
                frase: "Conecta antes de corregir",
                explicacion: "Esta es una de las enseñanzas más importantes del libro. Cuando un niño está en crisis emocional, primero debemos conectar con sus sentimientos antes de intentar enseñar o corregir.",
                contexto: "Bilbao explica que el cerebro límbico (emocional) debe estar calmado antes de que la corteza prefrontal (racional) pueda procesar información.",
                aplicacion: "Antes de decir 'no' o corregir un comportamiento, primero di: 'Veo que estás muy frustrado. Estoy aquí contigo.' Luego, cuando esté calmado, puedes reflexionar juntos.",
                significado: "Esta frase encapsula el principio de co-regulación emocional, donde los padres actúan como 'cerebro externo' para sus hijos."
            ),
            Capa1Mantra(
                frase: "El cerebro que se siente seguro aprende mejor",
                explicacion: "La seguridad emocional es la base de todo aprendizaje. Un niño que se siente seguro y amado puede explorar, aprender y desarrollarse de manera óptima.",
                contexto: "Bilbao explica que el estrés crónico puede dañar la arquitectura cerebral, mientras que la seguridad emocional fortalece las conexiones neuronales.",
                aplicacion: "Prioriza crear un entorno emocionalmente seguro en casa. La consistencia, la predictibilidad y el amor incondicional son los mejores estimulantes cerebrales.",
                significado: "Esta frase destaca que el desarrollo cognitivo está íntimamente ligado al bienestar emocional del niño."
            ),
            Capa1Mantra(
                frase: "Cada 'no' de tu hijo es un 'sí' a su desarrollo",
                explicacion: "Cuando un niño de 2-3 años dice 'no', está desarrollando su corteza prefrontal y su sentido de autonomía. Es un hito del desarrollo, no un desafío a la autoridad.",
                contexto: "Bilbao describe cómo el 'no' es una señal de que el cerebro del niño está madurando y desarrollando su capacidad de autorregulación.",
                aplicacion: "En lugar de frustrarte cuando tu hijo dice 'no', celebra: '¡Qué bien! Ya sabes decir no. Eso significa que tu cerebro está creciendo.'",
                significado: "Esta frase ayuda a los padres a reencuadrar comportamientos desafiantes como señales positivas de desarrollo."
            ),
            Capa1Mantra(
                frase: "Las pantallas son herramientas, no soluciones",
                explicacion: "Las pantallas pueden ser educativas, pero no deben reemplazar la interacción humana, especialmente para calmar emociones o como niñera digital.",
                contexto: "Bilbao explica que las pantallas activan el sistema de recompensa de manera similar a las drogas, dificultando la autorregulación natural.",
                aplicacion: "Usa tu presencia, tu voz y tu abrazo para calmar a tu hijo. Las pantallas pueden ser complementarias, pero nunca deben reemplazar la conexión humana.",
                significado: "Esta frase enfatiza la importancia de las relaciones humanas sobre la tecnología en el desarrollo cerebral."
            ),
            Capa1Mantra(
                frase: "El aburrimiento es creativo y necesario",
                explicacion: "El cerebro infantil necesita 'tiempo muerto' para procesar información, consolidar aprendizajes y desarrollar la creatividad. El exceso de estimulación puede ser contraproducente.",
                contexto: "Bilbao enfatiza que el cerebro necesita tiempo para crear conexiones neuronales propias, no solo recibir estímulos constantes.",
                aplicacion: "Permite que tu hijo tenga tiempo libre sin actividades estructuradas. El aburrimiento es el motor de la creatividad y la imaginación.",
                significado: "Esta frase desafía la creencia de que 'más es mejor' en la estimulación infantil, promoviendo un equilibrio saludable."
            ),
            Capa1Mantra(
                frase: "Tu calma es contagiosa",
                explicacion: "Los niños aprenden a regular sus emociones observando cómo los adultos manejan las suyas. Tu calma literalmente ayuda a calmar el cerebro de tu hijo.",
                contexto: "Bilbao explica que los padres actúan como 'amortiguadores del estrés' y que la co-regulación emocional es fundamental para el desarrollo.",
                aplicacion: "Cuando tu hijo esté en crisis, respira hondo y mantén la calma. Tu cerebro regulado puede ayudar a regular el suyo a través de la conexión emocional.",
                significado: "Esta frase destaca el poder de la co-regulación emocional y el modelado de comportamientos saludables."
            ),
            Capa1Mantra(
                frase: "Cada interacción es una inversión en el cerebro de tu hijo",
                explicacion: "Durante los primeros años, cada conversación, cada juego, cada momento de conexión moldea literalmente la estructura física del cerebro del niño.",
                contexto: "Bilbao explica que el cerebro forma 700-1000 conexiones neuronales por segundo durante la infancia, y cada experiencia cuenta.",
                aplicacion: "Aprovecha los momentos cotidianos (bañarse, comer, vestirse) para conectar y aprender. Cada interacción es una oportunidad de desarrollo.",
                significado: "Esta frase transforma las tareas diarias en oportunidades conscientes de desarrollo cerebral."
            )
        ]
        // Ideas visuales y animaciones conceptuales (basadas en el libro)
        let visualIdeas: [Capa1VisualIdea] = [
            Capa1VisualIdea(
                titulo: "La Casa de Tres Pisos del Cerebro",
                descripcion: "Animación que muestra la metáfora del cerebro como una casa de tres pisos: cerebro reptiliano (primer piso), sistema límbico (segundo piso) y corteza prefrontal (tercer piso).",
                animacion: "Casa que se construye piso por piso, mostrando cómo cada nivel se activa según la situación del niño.",
                proposito: "Ayudar a los padres a entender por qué sus hijos se comportan de cierta manera y cuándo es el momento adecuado para razonar o conectar emocionalmente.",
                implementacion: "Animación 3D de una casa que se construye desde abajo hacia arriba, con colores diferentes para cada piso y efectos de 'iluminación' cuando cada nivel se activa."
            ),
            Capa1VisualIdea(
                titulo: "Las Conexiones Neuronales en Tiempo Real",
                descripcion: "Visualización de cómo se forman las conexiones neuronales durante las interacciones padre-hijo, mostrando el impacto inmediato de cada experiencia.",
                animacion: "Red de neuronas que se conectan y desconectan dinámicamente, con diferentes colores según el tipo de interacción (positiva, negativa, neutra).",
                proposito: "Demostrar visualmente que cada interacción moldea literalmente el cerebro del niño, reforzando la importancia de las experiencias positivas.",
                implementacion: "Animación de partículas que se conectan formando redes neuronales, con efectos de brillo y movimiento que responden a diferentes tipos de interacciones."
            ),
            Capa1VisualIdea(
                titulo: "El Amortiguador del Estrés",
                descripcion: "Representación visual de cómo los padres actúan como 'amortiguadores' del estrés, transformando el estrés tóxico en estrés positivo.",
                animacion: "Ondas de estrés que se amortiguan al pasar por el 'filtro parental', cambiando de color rojo (tóxico) a verde (positivo).",
                proposito: "Mostrar el papel crucial de los padres en la regulación emocional de sus hijos y cómo su presencia puede transformar experiencias negativas.",
                implementacion: "Animación de ondas que se propagan y se transforman al pasar por un 'escudo' parental, con cambios de color y intensidad."
            ),
            Capa1VisualIdea(
                titulo: "La Ventana de Oportunidad",
                descripcion: "Visualización de los primeros 6 años como una ventana de oportunidad crítica, mostrando cómo las experiencias tempranas tienen un impacto desproporcionado.",
                animacion: "Ventana que se abre y se cierra gradualmente, con diferentes actividades que 'pasan' a través de ella, mostrando su impacto en el desarrollo.",
                proposito: "Concienciar sobre la importancia de los primeros años y la necesidad de aprovechar esta ventana de oportunidad única.",
                implementacion: "Animación de una ventana temporal con efectos de luz y sombra, mostrando cómo diferentes experiencias 'marcan' el cerebro en desarrollo."
            ),
            Capa1VisualIdea(
                titulo: "Las Neuronas Espejo en Acción",
                descripcion: "Demostración visual de cómo las neuronas espejo permiten a los niños aprender por observación e imitación.",
                animacion: "Neuronas que se 'reflejan' entre padre e hijo, mostrando cómo las acciones de uno activan las mismas áreas cerebrales en el otro.",
                proposito: "Explicar por qué es tan importante que los padres modelen el comportamiento que quieren ver en sus hijos.",
                implementacion: "Animación de espejos neuronales que reflejan acciones entre dos figuras, con efectos de sincronización y resonancia."
            ),
            Capa1VisualIdea(
                titulo: "El Cerebro Social en Desarrollo",
                descripcion: "Visualización del desarrollo del cerebro social a través de interacciones cara a cara, mostrando el contraste con las pantallas.",
                animacion: "Comparación entre interacciones humanas (que activan múltiples áreas cerebrales) y pantallas (que activan áreas limitadas).",
                proposito: "Demostrar por qué las interacciones humanas son superiores a las pantallas para el desarrollo social del cerebro.",
                implementacion: "Animación comparativa que muestra diferentes patrones de activación cerebral según el tipo de interacción."
            )
        ]
        let relations: [Capa1Relation] = []
        let references: [Capa1Reference] = []
        
        return Capa1Fundamentos(
            context: context,
            principles: principles,
            axes: axes,
            pitfalls: pitfalls,
            mantras: mantras,
            visualIdeas: visualIdeas,
            relations: relations,
            references: references,
            progreso: 0.0
        )
    }
}

// MARK: - ESTRUCTURAS DE DATOS VACÍAS

/// Contexto general y propósito del libro
struct Capa1Context: Identifiable, Codable {
    let id: UUID
    let titulo: String
    let autor: String
    let proposito: String
    let marcoConceptual: String
    let importancia: String
    let enfoque: String
    
    init(titulo: String, autor: String, proposito: String, marcoConceptual: String, importancia: String, enfoque: String) {
        self.id = UUID()
        self.titulo = titulo
        self.autor = autor
        self.proposito = proposito
        self.marcoConceptual = marcoConceptual
        self.importancia = importancia
        self.enfoque = enfoque
    }
}

/// Principios centrales del desarrollo cerebral infantil
struct Capa1Principle: Identifiable, Codable {
    let id: UUID
    let titulo: String
    let explicacion: String
    let baseCientifica: String
    let aplicacionPractica: String
    let ejemplos: String
    let importancia: String
    
    init(titulo: String, explicacion: String, baseCientifica: String, aplicacionPractica: String, ejemplos: String, importancia: String) {
        self.id = UUID()
        self.titulo = titulo
        self.explicacion = explicacion
        self.baseCientifica = baseCientifica
        self.aplicacionPractica = aplicacionPractica
        self.ejemplos = ejemplos
        self.importancia = importancia
    }
}

/// Ejes neuroemocionales (amígdala, corteza prefrontal, integración hemisférica)
struct Capa1Axis: Identifiable, Codable {
    let id: UUID
    let nombre: String
    let funcion: String
    let desarrollo: String
    let importancia: String
    let estimulacion: String
    
    init(nombre: String, funcion: String, desarrollo: String, importancia: String, estimulacion: String) {
        self.id = UUID()
        self.nombre = nombre
        self.funcion = funcion
        self.desarrollo = desarrollo
        self.importancia = importancia
        self.estimulacion = estimulacion
    }
}

/// Errores comunes de crianza y su reencuadre
struct Capa1Pitfall: Identifiable, Codable {
    let id: UUID
    let error: String
    let impacto: String
    let reencuadre: String
    let alternativa: String
    let explicacion: String
    
    init(error: String, impacto: String, reencuadre: String, alternativa: String, explicacion: String) {
        self.id = UUID()
        self.error = error
        self.impacto = impacto
        self.reencuadre = reencuadre
        self.alternativa = alternativa
        self.explicacion = explicacion
    }
}

/// Frases guía o mantras del módulo
struct Capa1Mantra: Identifiable, Codable {
    let id: UUID
    let frase: String
    let explicacion: String
    let contexto: String
    let aplicacion: String
    let significado: String
    
    init(frase: String, explicacion: String, contexto: String, aplicacion: String, significado: String) {
        self.id = UUID()
        self.frase = frase
        self.explicacion = explicacion
        self.contexto = contexto
        self.aplicacion = aplicacion
        self.significado = significado
    }
}

/// Ideas visuales o animaciones conceptuales
struct Capa1VisualIdea: Identifiable, Codable {
    let id: UUID
    let titulo: String
    let descripcion: String
    let animacion: String
    let proposito: String
    let implementacion: String
    
    init(titulo: String, descripcion: String, animacion: String, proposito: String, implementacion: String) {
        self.id = UUID()
        self.titulo = titulo
        self.descripcion = descripcion
        self.animacion = animacion
        self.proposito = proposito
        self.implementacion = implementacion
    }
}

/// Relaciones con otros módulos
struct Capa1Relation: Identifiable, Codable {
    let id: UUID
    let modulo: String
    let conexion: String
    let importancia: String
    let aplicacion: String
    let beneficio: String
    
    init(modulo: String, conexion: String, importancia: String, aplicacion: String, beneficio: String) {
        self.id = UUID()
        self.modulo = modulo
        self.conexion = conexion
        self.importancia = importancia
        self.aplicacion = aplicacion
        self.beneficio = beneficio
    }
}

/// Bibliografía y referencias
struct Capa1Reference: Identifiable, Codable {
    let id: UUID
    let titulo: String
    let autor: String
    let tipo: String
    let relevancia: String
    let aplicacion: String
    
    init(titulo: String, autor: String, tipo: String, relevancia: String, aplicacion: String) {
        self.id = UUID()
        self.titulo = titulo
        self.autor = autor
        self.tipo = tipo
        self.relevancia = relevancia
        self.aplicacion = aplicacion
    }
}
