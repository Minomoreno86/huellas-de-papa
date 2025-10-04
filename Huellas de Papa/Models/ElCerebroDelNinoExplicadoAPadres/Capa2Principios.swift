import Foundation

// MARK: - Estructuras de Datos para CAPA 2: PRINCIPIOS CLAVE

struct PrincipioClave: Identifiable, Codable {
    let id = UUID()
    let titulo: String
    let filosofiaProfunda: String // 200+ palabras
    let aplicacionPractica: String // 300+ palabras
    let estrategiasImplementacion: [String] // 5-7 estrategias específicas
    let baseNeurocientifica: String
    let icono: String
    let color: String
}

struct Capa2Principios: Identifiable, Codable {
    let id = UUID()
    let principios: [PrincipioClave]
    let introduccion: String
    let resumenIntegrador: String

    static func contenidoCerebroDelNino() -> Capa2Principios {
        return Capa2Principios(
            principios: Capa2Principios.crearPrincipios(),
            introduccion: """
            Los principios clave del libro "El cerebro del niño explicado a los padres" representan los pilares fundamentales sobre los que se construye una crianza basada en neurociencia. Estos principios no son meras sugerencias, sino verdades científicas sobre cómo funciona el cerebro infantil y cómo los padres pueden aprovechar este conocimiento para fomentar un desarrollo óptimo. Cada principio está respaldado por décadas de investigación en neurociencia, psicología del desarrollo y teoría del apego, y juntos forman un marco integral para la crianza consciente y efectiva.
            """,
            resumenIntegrador: """
            Los seis principios clave de "El cerebro del niño explicado a los padres" forman un sistema integrado que transforma la crianza de una práctica intuitiva a una ciencia aplicada. Estos principios, basados en la neurociencia del desarrollo, proporcionan a los padres un mapa claro para navegar los desafíos de la crianza mientras fomentan el crecimiento cerebral óptimo de sus hijos. Desde la comprensión de la arquitectura cerebral hasta la aplicación de estrategias de integración, cada principio se conecta con los demás para crear una experiencia de crianza coherente, efectiva y científicamente fundamentada.
            """
        )
    }
    
    static func crearPrincipios() -> [PrincipioClave] {
        return [
            PrincipioClave(
                titulo: "La Casa del Cerebro: Arquitectura Neural",
                filosofiaProfunda: """
                El cerebro humano funciona como una casa de tres pisos, cada uno con funciones específicas pero interconectadas. Esta metáfora arquitectónica no es solo poética, sino científicamente precisa. El primer piso (cerebro reptiliano/tronco cerebral) se encarga de las funciones básicas de supervivencia como la respiración, los latidos del corazón, los reflejos y las respuestas instintivas. Este piso está completamente desarrollado al nacer y funciona de manera automática. El segundo piso (sistema límbico) gestiona las emociones, la memoria emocional, el apego y las respuestas de lucha o huida. Se desarrolla gradualmente durante los primeros años de vida y es especialmente activo en la infancia. El tercer piso (corteza prefrontal) es el centro del pensamiento racional, la planificación, el autocontrol y la toma de decisiones. Este piso es el último en desarrollarse y no alcanza su madurez completa hasta los 25 años. La filosofía profunda de este principio radica en entender que cuando un niño tiene una rabieta, no es por falta de voluntad o mala educación, sino porque el segundo piso (emocional) está dominando y el tercer piso (racional) aún no está suficientemente desarrollado para regular las emociones intensas. Los padres deben actuar como "arquitectos cerebrales", creando un entorno que promueva la integración entre los tres pisos y fomentando el desarrollo gradual y saludable de cada nivel.
                """,
                aplicacionPractica: """
                APLICACIÓN PRÁCTICA DETALLADA: 1) Crear un juego de "La Casa del Cerebro": Dibuja una casa de 3 pisos con tu hijo y explica cada piso. En el piso 1, coloca imágenes de corazón, pulmones y reflejos. En el piso 2, dibuja caras con diferentes emociones. En el piso 3, dibuja un cerebro pensante. 2) Técnica de "Piso por Piso": Cuando tu hijo esté en crisis, di "Veo que estás en el piso 2 (emociones), vamos a subir al piso 3 (pensamiento)". Esto le ayuda a entender qué está pasando en su cerebro. 3) Ejercicio de respiración: "Respira profundo para activar el piso 1, siente tus emociones en el piso 2, piensa en el piso 3". 4) Visualización: "Imagina que tu cerebro es una casa, ¿en qué piso estás ahora?". 5) Refuerzo positivo: "¡Excelente! Lograste usar el piso 3 para resolver ese problema". 6) Técnica de "Actuar como el Cerebro de Arriba": Cuando tu hijo no puede controlarse, actúa tú como su corteza prefrontal: "Vamos a pensar juntos en una solución". 7) Ejercicio de "Pausa y Piensa": Enséñale a hacer una pausa de 3 segundos antes de actuar, activando así el piso 3.
                """,
                estrategiasImplementacion: [
                    "Crear material visual de la casa del cerebro",
                    "Usar la metáfora en momentos de crisis emocional",
                    "Practicar ejercicios de respiración por pisos",
                    "Implementar la técnica de pausa y pensamiento",
                    "Reforzar positivamente el uso del piso 3",
                    "Actuar como cerebro de arriba cuando sea necesario",
                    "Hacer visualizaciones regulares del cerebro"
                ],
                baseNeurocientifica: "Arquitectura cerebral, desarrollo jerárquico, maduración cortical",
                icono: "house.fill",
                color: "blue"
            ),
            PrincipioClave(
                titulo: "Conecta y Redirige: Estrategia de Disciplina Consciente",
                filosofiaProfunda: """
                "Conecta y Redirige" es más que una técnica de disciplina; es una filosofía de crianza que reconoce la naturaleza emocional del cerebro infantil. La conexión emocional es el puente que permite que la información fluya del cerebro emocional al cerebro racional. Cuando un niño está en crisis, su cerebro emocional (sistema límbico) está en control, y el cerebro racional (corteza prefrontal) está temporalmente desconectado. Intentar razonar o disciplinar en este momento es como intentar hablar con alguien que no puede escuchar. La filosofía profunda de este principio radica en entender que la disciplina no debe ser punitiva, sino una oportunidad para enseñar y fomentar el crecimiento cerebral. La conexión emocional activa el sistema nervioso parasimpático, que es responsable de la calma y la relajación, mientras que la redirección activa la corteza prefrontal, que es responsable del pensamiento racional y la toma de decisiones. Este principio transforma los momentos difíciles en oportunidades de aprendizaje y crecimiento, fortaleciendo el vínculo entre padres e hijos mientras se desarrollan habilidades de regulación emocional.
                """,
                aplicacionPractica: """
                APLICACIÓN PRÁCTICA DETALLADA: 1) Técnica de "Conexión Primero": Cuando tu hijo esté en crisis, primero conéctate emocionalmente diciendo "Veo que estás muy enojado" o "Entiendo que te sientes frustrado". Esto activa su sistema de calma. 2) Ejercicio de "Abrazo de Conexión": Abraza a tu hijo durante 20 segundos para activar la oxitocina y calmar el sistema límbico. 3) Técnica de "Validación Emocional": "Es normal sentir esto, yo también me siento así a veces". Esto valida sus emociones sin juzgarlas. 4) Ejercicio de "Respiración Conjunta": Respira profundo junto con tu hijo para sincronizar vuestros sistemas nerviosos. 5) Técnica de "Redirección Suave": Una vez conectado, redirige con "Ahora que estás más calmado, ¿qué podemos hacer para resolver esto?". 6) Ejercicio de "Opciones Limitadas": Ofrece 2-3 opciones específicas para que tu hijo pueda elegir y ejercitar su corteza prefrontal. 7) Técnica de "Reflexión Posterior": Después del episodio, reflexiona juntos sobre qué funcionó y qué se puede mejorar.
                """,
                estrategiasImplementacion: [
                    "Practicar la conexión emocional en momentos de calma",
                    "Usar el abrazo como herramienta de regulación",
                    "Validar emociones sin juzgar el comportamiento",
                    "Sincronizar la respiración durante crisis",
                    "Ofrecer opciones limitadas para la redirección",
                    "Reflexionar sobre episodios después de que pasen",
                    "Crear un espacio seguro para la expresión emocional"
                ],
                baseNeurocientifica: "Sistema nervioso parasimpático, oxitocina, regulación emocional",
                icono: "heart.fill",
                color: "red"
            ),
            PrincipioClave(
                titulo: "Nombra para Domar: El Poder del Lenguaje Emocional",
                filosofiaProfunda: """
                "Nombra para Domar" se basa en una comprensión profunda de cómo el lenguaje puede regular las emociones a nivel neurobiológico. Cuando experimentamos una emoción intensa, la amígdala (parte del cerebro emocional) se activa y puede "secuestrar" la corteza prefrontal (parte racional del cerebro). Al nombrar la emoción, se activa la corteza prefrontal izquierda, que es responsable del procesamiento del lenguaje y la regulación emocional. Esta activación ayuda a calmar la amígdala y a integrar la experiencia emocional. La filosofía profunda de este principio radica en entender que las emociones no son enemigas que hay que suprimir, sino mensajeras que nos dan información importante sobre nuestras necesidades y experiencias. Al nombrar las emociones, les damos voz y las integramos en nuestra experiencia consciente, lo que nos permite procesarlas de manera más efectiva. Este principio también reconoce que el desarrollo del vocabulario emocional es fundamental para la inteligencia emocional y la regulación del comportamiento. Los niños que pueden nombrar sus emociones tienen mejor capacidad para manejarlas y expresarlas de manera constructiva.
                """,
                aplicacionPractica: """
                APLICACIÓN PRÁCTICA DETALLADA: 1) Técnica de "Nombramiento Básico": Ayuda a tu hijo a nombrar emociones básicas (alegría, tristeza, enojo, miedo) usando un espejo o dibujos. 2) Ejercicio de "Diario de Emociones": Crea un diario donde tu hijo pueda dibujar o escribir cómo se siente cada día. 3) Técnica de "Escala de Emociones": Usa una escala del 1 al 10 para que tu hijo pueda describir la intensidad de sus emociones. 4) Ejercicio de "Emociones en el Cuerpo": Pídele que señale dónde siente cada emoción en su cuerpo (el enojo en el pecho, la tristeza en la garganta). 5) Técnica de "Vocabulario Emocional Expandido": Introduce emociones más complejas como frustración, decepción, orgullo, gratitud. 6) Ejercicio de "Empatía con Otros": Ayuda a tu hijo a identificar emociones en otras personas y a nombrarlas. 7) Técnica de "Respiración con Nombres": "Respira profundo y di en voz alta cómo te sientes" para conectar la respiración con el nombramiento emocional.
                """,
                estrategiasImplementacion: [
                    "Crear un diccionario de emociones visual",
                    "Practicar el nombramiento en momentos de calma",
                    "Usar espejos para identificar expresiones emocionales",
                    "Crear escalas de intensidad emocional",
                    "Mapear emociones en el cuerpo",
                    "Expandir gradualmente el vocabulario emocional",
                    "Practicar empatía a través del nombramiento"
                ],
                baseNeurocientifica: "Corteza prefrontal izquierda, amígdala, procesamiento del lenguaje",
                icono: "mouth.fill",
                color: "green"
            ),
            PrincipioClave(
                titulo: "Integración Cerebral: Conectando los Hemisferios",
                filosofiaProfunda: """
                La integración cerebral es el proceso mediante el cual las diferentes partes del cerebro trabajan juntas de manera coordinada y armoniosa. En un cerebro bien integrado, el hemisferio izquierdo (lógico, lineal, verbal) y el hemisferio derecho (emocional, no verbal, holístico) se comunican eficientemente a través del cuerpo calloso. Esta integración es fundamental para el bienestar emocional, la regulación del comportamiento y la capacidad de adaptación. La filosofía profunda de este principio radica en entender que la salud mental no es solo la ausencia de problemas, sino la presencia de integración cerebral. Cuando el cerebro está integrado, el individuo puede acceder a sus emociones sin ser abrumado por ellas, puede pensar claramente incluso en situaciones estresantes, y puede tomar decisiones que reflejen tanto sus valores como sus necesidades emocionales. La integración cerebral no es automática; se desarrolla a través de experiencias que fomentan la conexión entre las diferentes regiones cerebrales. Los padres pueden promover esta integración a través de actividades que involucren tanto el cuerpo como la mente, la emoción como la razón, y la individualidad como la conexión con otros.
                """,
                aplicacionPractica: """
                APLICACIÓN PRÁCTICA DETALLADA: 1) Ejercicio de "Conexión Cuerpo-Mente": Pídele que sienta su respiración mientras piensa en algo que le gusta, conectando sensaciones corporales con pensamientos. 2) Técnica de "Integración Emocional": Cuando esté emocionado, ayúdale a conectar la emoción con el pensamiento: "Sientes enojo y piensas que es injusto". 3) Ejercicio de "El Puente": Imagina un puente entre su corazón (emociones) y su cabeza (pensamiento) y pídele que describa qué pasa en cada lado. 4) Técnica de "Respiración Integradora": Respira profundo conectando el cuerpo, las emociones y los pensamientos en una sola experiencia. 5) Ejercicio de "Arte Emocional": Dibuja o pinta cómo se siente, combinando expresión emocional con creatividad. 6) Técnica de "Coherencia Familiar": Practica actividades que involucren a toda la familia en conexión emocional y mental. 7) Ejercicio de "Mindfulness Simple": Pídele que preste atención a sus pensamientos, emociones y sensaciones corporales al mismo tiempo.
                """,
                estrategiasImplementacion: [
                    "Practicar ejercicios de conexión cuerpo-mente diariamente",
                    "Usar el arte como herramienta de integración",
                    "Crear rituales familiares de conexión",
                    "Practicar mindfulness adaptado a la edad",
                    "Fomentar actividades que involucren ambos hemisferios",
                    "Usar la música para conectar emociones y pensamientos",
                    "Crear espacios de reflexión y expresión"
                ],
                baseNeurocientifica: "Cuerpo calloso, conectividad funcional, coherencia neural",
                icono: "brain.head.profile",
                color: "purple"
            ),
            PrincipioClave(
                titulo: "La Ventana de Oportunidad: Los Primeros 6 Años",
                filosofiaProfunda: """
                Los primeros 6 años de vida representan una ventana de oportunidad única e irrepetible para el desarrollo cerebral. Durante este período, el cerebro del niño es extraordinariamente plástico y sensible a las experiencias del entorno. Las conexiones neuronales se forman a una velocidad asombrosa: hasta 700 nuevas conexiones por segundo. Sin embargo, esta plasticidad también significa que las conexiones no utilizadas se eliminan en un proceso llamado 'poda sináptica'. La filosofía profunda de este principio radica en entender que cada momento de la primera infancia tiene un impacto profundo en el desarrollo futuro. Las experiencias positivas, el amor, el juego, la estimulación adecuada y las interacciones afectuosas fortalecen las conexiones neuronales y crean una base sólida para el desarrollo futuro. Por el contrario, el estrés crónico, la negligencia o la falta de estimulación pueden tener efectos duraderos en la arquitectura cerebral. Este principio reconoce que la inversión en la primera infancia es la más rentable que puede hacer una sociedad, y que cada padre tiene el poder de influir positivamente en el desarrollo cerebral de su hijo a través de cada interacción, cada juego, cada muestra de afecto.
                """,
                aplicacionPractica: """
                APLICACIÓN PRÁCTICA DETALLADA: 1) Plan semanal de estimulación: Lunes (música), Martes (arte), Miércoles (naturaleza), Jueves (juego simbólico), Viernes (lectura), Sábado (deporte), Domingo (familia). 2) Técnica de "5 minutos mágicos": Dedica 5 minutos diarios a una actividad específica de estimulación cerebral. 3) Ejercicio de "Crear un Diario de Conexiones": Anota las nuevas habilidades que observas cada semana para ver la evolución. 4) Técnica de "Aprovechar la Ventana": Cuando notes que tu hijo está especialmente receptivo, intensifica la estimulación. 5) Ejercicio de "Repetición Inteligente": Repite las actividades que más le gustan para fortalecer esas conexiones específicas. 6) Técnica de "Rotación de Experiencias": Cada semana introduce una nueva experiencia sensorial (tacto, olfato, sonido). 7) Ejercicio de "Adaptación al Ritmo": Si está cansado, reduce la estimulación; si está alerta, aumenta las actividades.
                """,
                estrategiasImplementacion: [
                    "Crear un plan semanal de estimulación variada",
                    "Dedicar tiempo diario a actividades de desarrollo",
                    "Documentar el progreso y nuevas habilidades",
                    "Adaptar la estimulación al estado del niño",
                    "Repetir actividades favoritas para fortalecer conexiones",
                    "Introducir nuevas experiencias sensoriales regularmente",
                    "Crear un ambiente rico en estímulos apropiados"
                ],
                baseNeurocientifica: "Ventana de oportunidad, poda sináptica, desarrollo temprano",
                icono: "clock.fill",
                color: "orange"
            ),
            PrincipioClave(
                titulo: "El Estrés Tóxico: Proteger el Cerebro en Desarrollo",
                filosofiaProfunda: """
                El estrés tóxico se refiere a la activación prolongada del sistema de respuesta al estrés del cuerpo, especialmente en ausencia de relaciones de apoyo que puedan ayudar a regular la respuesta. En los niños, el estrés tóxico puede tener efectos devastadores en el desarrollo cerebral, alterando la arquitectura del cerebro y afectando la capacidad de aprendizaje, la regulación emocional y la salud física. La filosofía profunda de este principio radica en entender que no todo el estrés es malo. Existe el estrés positivo (que puede ser motivador), el estrés tolerable (que es manejable con apoyo), y el estrés tóxico (que es crónico, severo y carece de amortiguación protectora). Los padres deben actuar como "amortiguadores" contra el estrés tóxico, proporcionando un ambiente seguro y de apoyo que permita a sus hijos desarrollar resiliencia mientras los protege de los efectos dañinos del estrés crónico. Este principio reconoce que la presencia amorosa y consistente de los padres es la mejor protección contra el estrés tóxico, y que cada interacción positiva puede contrarrestar los efectos del estrés negativo.
                """,
                aplicacionPractica: """
                APLICACIÓN PRÁCTICA DETALLADA: 1) Técnica de "Detección Temprana": Aprende a reconocer las señales de estrés en tu hijo (cambios de comportamiento, irritabilidad, problemas de sueño). 2) Ejercicio de "Zona Segura": Crea un espacio físico y emocional donde tu hijo se sienta completamente seguro. 3) Técnica de "Regulación Co": Cuando tu hijo esté estresado, regula primero tu propio estrés para poder ayudarle efectivamente. 4) Ejercicio de "Respiración de Seguridad": Enséñale técnicas de respiración para activar el sistema de calma. 5) Técnica de "Conexión Protectora": Mantén una conexión emocional fuerte que sirva como amortiguador contra el estrés. 6) Ejercicio de "Rutinas de Calma": Establece rutinas diarias que promuevan la calma y la seguridad. 7) Técnica de "Validación del Estrés": "Es normal sentirse estresado, estoy aquí para ayudarte" para normalizar y validar las experiencias estresantes.
                """,
                estrategiasImplementacion: [
                    "Aprender a identificar señales de estrés temprano",
                    "Crear espacios seguros físicos y emocionales",
                    "Practicar regulación emocional personal",
                    "Enseñar técnicas de respiración y relajación",
                    "Mantener conexión emocional consistente",
                    "Establecer rutinas que promuevan la calma",
                    "Validar y normalizar las experiencias estresantes"
                ],
                baseNeurocientifica: "Estrés tóxico, cortisol, desarrollo cerebral alterado",
                icono: "shield.fill",
                color: "yellow"
            )
        ]
    }
}
