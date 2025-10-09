import Foundation

/// Cuento narrado desde la perspectiva del niño
/// Ayuda al padre a SENTIR cómo vive su hijo el mundo
struct CN8Story: Codable, Identifiable {
    let id: UUID
    let title: String
    let age: String                     // "4 años", "7 años", etc.
    let emotion: String                 // Emoción principal
    let childPerspective: String        // Narrado en primera persona (voz del niño)
    let whatsBrainDoing: String         // Explicación neurológica de lo que pasa
    let whatChildNeeds: String          // Lo que el niño realmente necesita
    let parentInsight: String           // Insight para el padre
    let icon: String
    let color: String
    
    init(title: String, age: String, emotion: String, childPerspective: String, whatsBrainDoing: String, whatChildNeeds: String, parentInsight: String, icon: String, color: String) {
        self.id = UUID()
        self.title = title
        self.age = age
        self.emotion = emotion
        self.childPerspective = childPerspective
        self.whatsBrainDoing = whatsBrainDoing
        self.whatChildNeeds = whatChildNeeds
        self.parentInsight = parentInsight
        self.icon = icon
        self.color = color
    }
}

/// Historias desde la perspectiva del niño basadas en el libro
let cn8Stories: [CN8Story] = [
    CN8Story(
        title: "Mi Cerebro Cuando Tengo Berrinche",
        age: "3 años",
        emotion: "Frustración Abrumadora",
        childPerspective: "Quería el juguete rojo pero mamá me dio el azul. No sé por qué pero mi cuerpo se siente MUY mal. Mi panza está apretada. Mis manos quieren aventar cosas. Mi boca grita sin que yo lo decida. No puedo parar. Mamá me dice 'Cálmate' pero NO SÉ CÓMO. Mis piernas patalean solas. Todo es DEMASIADO GRANDE. Escucho a mamá hablando pero sus palabras no tienen sentido. Solo siento. Solo grito. Necesito... no sé qué necesito. Todo está mal y no sé por qué el juguete azul me hace sentir así pero LO SIENTO.",
        whatsBrainDoing: "Su hemisferio DERECHO emocional está en control total. La amígdala (cerebro inferior) se activó. La corteza prefrontal (cerebro superior) está completamente offline. No puede acceder a razonamiento, lenguaje complejo, o autorregulación. Sus palabras literalmente no tienen sentido para él en este momento porque el hemisferio izquierdo lingüístico está desconectado.",
        whatChildNeeds: "Necesita co-regulación, NO razonamiento. Tu presencia física calmada (arrodíllate, voz suave, tal vez abrazo). Tu sistema nervioso regulado regulará el suyo. ESPERA. No hables mucho. Solo presencia. Cuando veas señales de calma (respiración más lenta, contacto visual), ENTONCES puedes conectar con palabras.",
        parentInsight: "Cuando tu hijo de 3 años tiene berrinche 'irracional', no está manipulando o portándose mal. Su cerebro derecho domina completamente. No puede controlar lo que tú puedes. Conecta con su emoción primero. La lógica vendrá después.",
        icon: "flame.fill",
        color: "red"
    ),
    
    CN8Story(
        title: "Cuando Papá Me Grita",
        age: "5 años",
        emotion: "Miedo y Confusión",
        childPerspective: "Derramé el jugo. No fue a propósito. Mi mano simplemente... se resbaló. Y ahora papá está GRITANDO. Su cara está roja. Su voz es grande y fuerte. Mi cuerpo se pone muy chiquito. Siento mi corazón golpeando fuerte. Quiero correr pero no puedo moverme. Quiero decir 'lo siento' pero mi boca no funciona. Solo lloro. No escucho las palabras que dice, solo el ruido fuerte. Ahora tengo miedo de papá. ¿Todavía me ama? ¿Hice algo muy malo? Siento que soy malo. Mi panza duele. Solo quiero que papá me abrace pero también quiero esconderme.",
        whatsBrainDoing: "La voz alta del padre activó su amígdala (alarma de amenaza). Entró en modo 'congelar' (una de las respuestas de supervivencia). Su cerebro superior está completamente offline. No puede procesar palabras, solo tono amenazante. Su memoria implícita está grabando: papá = amenaza. Su cerebro está en modo supervivencia, no aprendizaje.",
        whatChildNeeds: "Necesita señales de SEGURIDAD urgentemente. Tu voz calmada, tu cara relajada, tu cuerpo no amenazante. Arrodíllate (menos amenazante). Di con voz MUY suave: 'Fue un accidente. No pasa nada. Estás bien. Yo estoy bien.' Abraza si acepta. Su sistema nervioso necesita regularse antes de que pueda aprender algo sobre no derramar jugo.",
        parentInsight: "Tu voz alta activa el sistema de amenaza del cerebro de tu hijo. No está aprendiendo sobre responsabilidad; está en modo supervivencia. Gritar NO enseña; traumatiza. Si gritaste, REPARA inmediatamente. La reparación es más importante que la 'lección' sobre el jugo.",
        icon: "speaker.wave.3.fill",
        color: "orange"
    ),
    
    CN8Story(
        title: "Por Qué No Puedo Dormir Solo",
        age: "6 años",
        emotion: "Miedo Nocturno",
        childPerspective: "La casa está oscura. Todos duermen. Yo debería dormir también pero mi cerebro no para. Veo sombras que se mueven. Escucho ruidos. Mi corazón late rápido. Sé que papá dice 'No hay nada que temer' pero MI CUERPO no lo cree. Mi panza se siente rara. Pienso en monstruos aunque sé que no existen. Pero ¿y si esta vez SÍ existen? Llamo a mamá. Ella dice 'Ya eres grande, vuelve a dormir.' Pero no puedo. El miedo es MUY REAL para mí. Voy a su cuarto. Solo quiero saber que estoy seguro. Solo quiero sentir a alguien cerca.",
        whatsBrainDoing: "En la oscuridad y soledad, su amígdala está hipersensible. Cada sombra o ruido la activa (modo supervivencia). Su corteza prefrontal (razonamiento: 'los monstruos no existen') no puede controlar la amígdala activada. La memoria implícita de todos los cuentos de miedo está disparando respuestas corporales. Para él, el miedo es TAN REAL como cualquier amenaza física.",
        whatChildNeeds: "Necesita VALIDACIÓN de que su miedo es real para él, aunque no sea lógico para ti. 'Veo que tienes miedo. Algo te asusta.' Ayúdalo a nombrar qué ve/escucha. Procesamiento de la experiencia. Tal vez estrategias de seguridad que ÉL elija (luz nocturna, puerta abierta, muñeco especial). Co-regulación, no minimización.",
        parentInsight: "El miedo de tu hijo es neurológicamente REAL, no 'inventado'. Su amígdala no distingue entre amenaza real e imaginada. Minimizar ('No hay nada') invalida su experiencia cerebral. Conecta primero, luego ayuda a procesar. El miedo disminuirá con validación y herramientas, no con minimización.",
        icon: "moon.stars.fill",
        color: "indigo"
    ),
    
    CN8Story(
        title: "No Sé Por Qué Estoy Llorando",
        age: "8 años",
        emotion: "Tristeza sin Razón",
        childPerspective: "Llegué de la escuela y algo se siente mal. No pasó nada específico pero me siento triste. Pesada. Como una nube gris sobre mí. Mamá pregunta '¿Qué pasó?' y digo 'Nada' porque es verdad - no pasó NADA. Pero me siento horrible. Mamá se frustra: '¿Por qué lloras si no pasó nada?' Y ahora me siento PEOR porque ni yo entiendo. Tal vez soy rara. Tal vez algo está mal conmigo. ¿Por qué no puedo simplemente estar feliz? Mis lágrimas salen y no sé de dónde vienen. Me siento sola con este sentimiento que no entiendo.",
        whatsBrainDoing: "Puede haber memoria implícita activada (algo en la escuela disparó emoción sin que ella recuerde conscientemente qué). O simplemente acumulación de estrés del día sin procesar. Su hemisferio derecho está lleno de emoción pero su hemisferio izquierdo no tiene narrativa que explique. Esta desconexión es confusa y aterradora para ella.",
        whatChildNeeds: "Necesita VALIDACIÓN de que las emociones no siempre tienen 'razón' lógica y eso está BIEN. 'A veces nuestro cuerpo tiene emociones grandes sin razón clara. Está bien.' Luego SIFT: '¿Qué sientes en tu cuerpo? ¿Qué imágenes ves? ¿Qué sentimientos? ¿Qué pensamientos?' Ayudarla a explorar sin juzgar. Nombrar lo que está ahí, aunque no tenga lógica.",
        parentInsight: "No todas las emociones tienen causas lógicas claras, especialmente en niños. Memoria implícita, acumulación de estrés, o simplemente química cerebral pueden causar tristeza 'sin razón'. No necesitas 'arreglarlo'. Solo estar presente. SIFT ayuda a explorar sin necesitar explicación lógica.",
        icon: "cloud.rain.fill",
        color: "blue"
    ),
    
    CN8Story(
        title: "Cuando Me Dicen 'Deberías'",
        age: "10 años",
        emotion: "Vergüenza y Presión",
        childPerspective: "Saqué 7 en el examen. Yo estudié. Hice mi mejor esfuerzo. Llego a casa y le digo a papá. Él dice 'Deberías haber estudiado más. Tu amigo sacó 10.' Ahora siento una cosa horrible en mi pecho. Vergüenza. Como si yo fuera menos. Pienso: nunca soy suficiente. Traté mi mejor pero no fue suficiente. ¿Por qué mi amigo puede y yo no? Tal vez soy tonto. Tal vez no sirvo para esto. Ya no quiero contarle a papá cosas. No quiero que vea cuando fallo. Me quiero ir a mi cuarto y llorar solo donde nadie me vea ser un fracaso.",
        whatsBrainDoing: "La comparación y el 'deberías' activó vergüenza (amígdala + corteza cingulada anterior). Su cerebro superior registra: mis mejores esfuerzos no son suficientes. Esto puede cablear circuitos de 'no soy suficiente' que duran toda la vida. Neuroplasticidad negativa: experiencias de vergüenza repetidas construyen ansiedad y auto-crítica crónica.",
        whatChildNeeds: "Necesita VALIDACIÓN del esfuerzo, no comparación con resultado. 'Estudiaste mucho. Eso es lo que importa. Un 7 muestra esfuerzo.' Preguntar: '¿Cómo TE sientes con tu esfuerzo?' no '¿Por qué no fue 10?' Celebrar progreso personal, no comparación con otros. Esto cablea circuitos de perseverancia vs. vergüenza.",
        parentInsight: "'Deberías' y comparaciones construyen vergüenza, no motivación. Siegel enseña: celebra el ESFUERZO (ejercita cerebro superior), no solo resultado. Tu hijo necesita saber que es amado y valioso incluso cuando falla. Esto construye resiliencia vs. ansiedad de rendimiento.",
        icon: "figure.walk.departure",
        color: "gray"
    ),
    
    CN8Story(
        title: "Sé Que Está Mal Pero No Puedo Parar",
        age: "9 años",
        emotion: "Impulsividad",
        childPerspective: "Veo el celular de mamá en la mesa. Sé que no debo tomarlo. Sé que me va a regañar. Pero mi mano ya lo está tomando. Mi cerebro dice 'Para' pero mi cuerpo no escucha. Abro el juego. Solo 5 minutos, pienso. Mamá entra. Está enojada. '¡Cuántas veces te he dicho!' Muchas. Lo sé. SÉ que no debo. Pero en el momento, mi cerebro solo quería jugar. No pensé en consecuencias. Ahora me siento mal. ¿Por qué no puedo controlarme si SÉ qué está bien?",
        whatsBrainDoing: "El cerebro inferior (búsqueda de recompensa/dopamina) dominó al cerebro superior (control de impulsos). Su corteza prefrontal es INMADURA - literalmente no puede controlar impulsos consistentemente. Hay una BRECHA entre 'saber qué hacer' y 'poder hacerlo'. Esto no es desafío; es desarrollo cerebral. Su cerebro superior no madura hasta los 25 años.",
        whatChildNeeds: "Necesita entender que control de impulsos es HABILIDAD que se desarrolla con práctica, no algo que 'debería' ya tener. Ayuda a identificar el momento ANTES del impulso: '¿Qué sentiste justo antes de tomar el celular?' Practica PAUSAR. Ejercita cerebro superior con anticipación: '¿Qué harás si ves mi celular mañana?' No vergüenza; entrenamiento.",
        parentInsight: "Tu hijo de 9 años SABE las reglas pero su cerebro superior no puede siempre controlar impulsos. Esta brecha conocimiento-acción es NORMAL en cerebros inmaduros. Castigo no ayuda; ejercitar cerebro superior con práctica de pausar SÍ. Ten paciencia con un cerebro que aún tiene 16 años de desarrollo por delante.",
        icon: "bolt.fill",
        color: "yellow"
    )
]

