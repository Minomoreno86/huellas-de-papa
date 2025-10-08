import Foundation

/// Datos de la Capa 8 - Modo Niño
/// Basado en "The Yes Brain" de Daniel J. Siegel y Tina Payne Bryson
struct YB8Data {
    
    // MARK: - Stories
    static func createStories() -> [YB8Story] {
        return [
            YB8Story(
                title: "El día en que rugí y nadie me escuchó",
                emotion: "Frustración",
                narrative: """
                Hoy intenté decirte algo muy importante para mí. Pero tú estabas ocupado mirando tu teléfono.
                
                Te llamé una vez. Dos veces. Tres veces.
                
                Sentí algo caliente en mi pecho. Mis manos se apretaron solas. Mi voz se hizo más fuerte.
                
                Entonces grité. No porque quisiera ser malo. Sino porque no sabía cómo más hacerte entender que te necesitaba.
                
                Cuando finalmente me miraste, me dijiste que dejara de gritar. Pero yo solo quería que me vieras. Que me escucharas. Que sintieras que lo que yo sentía era importante.
                
                A veces, cuando me escuchas, mi voz vuelve a ser suave. Porque sé que me ves.
                """,
                moral: "A veces solo necesito que entiendas lo que siento, no que lo corrijas.",
                duration: 90,
                icon: "megaphone.fill",
                color: "red"
            ),
            
            YB8Story(
                title: "Cuando el mundo se movió demasiado rápido",
                emotion: "Miedo",
                narrative: """
                Esta mañana me dijiste: 'Date prisa, vamos tarde'.
                
                Pero mis dedos no se movían rápido con los botones de la camisa. Mi cerebro no recordaba dónde había dejado los zapatos. Y cuando me apuraste más, todo se volvió confuso.
                
                Sentí como si todo girara. Como si no pudiera pensar. Como si fuera a explotar o desaparecer.
                
                Cuando me ayudaste con calma, cuando me dijiste 'respira conmigo', el mundo volvió a estar quieto.
                
                No siempre puedo ir tan rápido como tú. Mi cerebro todavía está aprendiendo a manejar muchas cosas a la vez.
                """,
                moral: "Mi cerebro necesita tiempo y calma para organizarse. Tu paciencia me ayuda a crecer.",
                duration: 75,
                icon: "timer",
                color: "orange"
            ),
            
            YB8Story(
                title: "La vez que me equivoqué y me sonreíste",
                emotion: "Alegría",
                narrative: """
                Hoy derramé mi jugo en el suelo. Todo el suelo.
                
                Me quedé quieto, esperando que te enojaras. Mi corazón latía rápido. Mis ojos se llenaron de lágrimas.
                
                Pero tú te acercaste, te arrodillaste a mi lado, y me dijiste: 'Los accidentes pasan. Vamos a limpiar juntos'.
                
                Me sonreíste. Y yo sentí que podía respirar otra vez.
                
                No solo limpiamos el jugo. También limpiaste mi miedo. Me enseñaste que equivocarse no es el fin del mundo. Que el amor es más fuerte que los errores.
                
                Cuando me tratas así, quiero seguir intentando cosas nuevas. Porque sé que estarás ahí si me caigo.
                """,
                moral: "Tu respuesta a mis errores construye mi cerebro resiliente. Cuando me tratas con amor, aprendo sin miedo.",
                duration: 85,
                icon: "heart.circle.fill",
                color: "yellow"
            ),
            
            YB8Story(
                title: "El abrazo que no pedí con palabras",
                emotion: "Tristeza",
                narrative: """
                Hoy algo me puso triste. No sé bien qué fue. Solo sé que me sentía pequeño y pesado.
                
                No tenía palabras para explicártelo. Mi boca no sabía qué decir. Pero mi cuerpo sí lo sabía.
                
                Me acerqué a ti, sin hablar. Solo me quedé cerca. Muy cerca.
                
                Tú lo entendiste. No me preguntaste qué pasaba. No me dijiste que dejara de sentirme así.
                
                Solo abriste tus brazos. Y yo me metí ahí. Y lloramos juntos en silencio.
                
                En ese momento aprendí que no siempre necesito palabras. Que tú me entiendes incluso cuando no hablo. Que mi tristeza también tiene un lugar seguro contigo.
                """,
                moral: "No siempre puedo nombrar lo que siento. A veces solo necesito que estés ahí, sin preguntas.",
                duration: 80,
                icon: "figure.arms.open",
                color: "purple"
            )
        ]
    }
    
    // MARK: - Games
    static func createGames() -> [YB8Game] {
        return [
            YB8Game(
                title: "El Espejo de las Caras",
                gameDescription: "Conecten desde la imitación afectiva. Las neuronas espejo se activan cuando copiamos gestos emocionales.",
                steps: [
                    "Siéntense frente a frente, rodillas tocándose",
                    "Mírense a los ojos durante 5 segundos sin hablar",
                    "Padre: haz una cara (sorpresa, alegría, tristeza)",
                    "Hijo: copia exactamente esa cara",
                    "Cambien de rol: ahora el hijo hace la cara",
                    "Terminen con una sonrisa compartida de 10 segundos"
                ],
                emotionTrained: "Empatía",
                durationMinutes: 2,
                icon: "face.smiling.fill",
                color: "yellow"
            ),
            
            YB8Game(
                title: "Mimos sin Palabras",
                gameDescription: "Comunicación afectiva pura. Entrenar el lenguaje no verbal y la oxitocina vincular.",
                steps: [
                    "Apaguen todas las pantallas y eliminen distracciones",
                    "Siéntense cómodamente juntos",
                    "Durante 3 minutos: solo abrazos, caricias, contacto suave",
                    "Sin hablar. Solo sentir la presencia del otro",
                    "Observa su respiración: ¿se sincroniza con la tuya?",
                    "Al terminar, di: 'Gracias por este momento contigo'"
                ],
                emotionTrained: "Conexión",
                durationMinutes: 3,
                icon: "heart.fill",
                color: "pink"
            ),
            
            YB8Game(
                title: "El Juego de la Calma Compartida",
                gameDescription: "Regulación co-consciente. Enseñar que la calma se construye juntos.",
                steps: [
                    "Túmbense boca arriba, lado a lado",
                    "Coloca una mano en su pecho, él coloca una en el tuyo",
                    "Sientan los latidos del otro",
                    "Respiren juntos: inhalen contando hasta 4, exhalen hasta 6",
                    "Repitan 5 veces",
                    "Pregunta: '¿Cómo se siente tu cuerpo ahora?'"
                ],
                emotionTrained: "Regulación",
                durationMinutes: 4,
                icon: "waveform.path.ecg",
                color: "blue"
            ),
            
            YB8Game(
                title: "Cambio de Zapatos",
                gameDescription: "Perspectiva empática física. Literalmente ponerse en el lugar del otro.",
                steps: [
                    "Intercambien zapatos (o algo característico)",
                    "Durante 5 minutos, actúen como el otro",
                    "Hijo imita al padre, padre imita al hijo",
                    "Exageren gestos, tono de voz, manera de caminar",
                    "Después, compartan: '¿Qué descubriste?'",
                    "Rían juntos de lo que vieron"
                ],
                emotionTrained: "Insight",
                durationMinutes: 5,
                icon: "figure.walk",
                color: "green"
            )
        ]
    }
    
    // MARK: - Scenes
    static func createScenes() -> [YB8Scene] {
        return [
            YB8Scene(
                title: "No quiero irme a dormir",
                scenario: "Es hora de dormir. El niño no quiere ir a la cama. Hay dos formas de responder.",
                roleParent: [
                    "Modo No Brain: 'A la cama AHORA. Se acabó la discusión.'",
                    "Modo Yes Brain: 'Veo que no tienes ganas. Te entiendo, dormir significa que se acaba lo divertido.'",
                    "Modo Yes Brain: 'Y también sé que dormir cuida tu cuerpo y tu cerebro. ¿Qué historia quieres que leamos antes?'"
                ],
                roleChild: [
                    "¡No quiero! ¡Todavía no tengo sueño!",
                    "(Se pone más resistente) ¡No es justo!",
                    "(Se calma un poco) ...¿La del dragón amigable?"
                ],
                learning: "Validar la emoción no significa ceder el límite. Puedes ser firme y empático al mismo tiempo.",
                icon: "moon.stars.fill",
                color: "purple"
            ),
            
            YB8Scene(
                title: "El juguete compartido",
                scenario: "Dos hermanos quieren el mismo juguete. Entra el padre.",
                roleParent: [
                    "Modo No Brain: 'Dejen de pelear o guardo el juguete.'",
                    "Modo Yes Brain: 'Veo que ambos quieren el coche. Es difícil esperar, ¿verdad?'",
                    "Modo Yes Brain: '¿Cómo podemos resolverlo? ¿Turnos, jugar juntos, o encontrar otro coche?'"
                ],
                roleChild: [
                    "¡Pero yo lo tenía primero!",
                    "(Llora) ¡Siempre él gana!",
                    "(Piensa) ...¿Podemos hacer una carrera con dos coches?"
                ],
                learning: "Enseñar a resolver conflictos guiando, no imponiendo. El cerebro aprende soluciones, no obediencia ciega.",
                icon: "car.fill",
                color: "blue"
            ),
            
            YB8Scene(
                title: "El miedo a la oscuridad",
                scenario: "El niño tiene miedo en su habitación oscura.",
                roleParent: [
                    "Modo No Brain: 'No hay nada ahí. Los monstruos no existen.'",
                    "Modo Yes Brain: 'Veo que tienes miedo. El miedo se siente muy real, ¿verdad?'",
                    "Modo Yes Brain: '¿Qué te ayudaría a sentirte seguro? ¿Una luz? ¿Que me quede contigo 5 minutos?'"
                ],
                roleChild: [
                    "¡Pero yo siento que hay algo!",
                    "(Temblando) Tengo miedo...",
                    "(Más calmado) ...¿Puedes dejar la puerta un poco abierta?"
                ],
                learning: "Invalidar el miedo no lo hace desaparecer. Validarlo y ofrecer estrategias construye seguridad emocional.",
                icon: "moon.zzz.fill",
                color: "indigo"
            )
        ]
    }
    
    // MARK: - Simulations
    static func createSimulations() -> [YB8Simulation] {
        return [
            YB8Simulation(
                title: "La Espera Infinita",
                type: "Tiempo",
                simulationDescription: "Experimentarás 30 segundos de espera sin saber cuándo termina. Para un niño, esperar se siente así de largo.",
                durationSeconds: 30,
                insight: "Para un niño, 30 segundos pueden sentirse como una eternidad. Su percepción del tiempo es diferente a la tuya.",
                icon: "hourglass",
                color: "orange"
            ),
            
            YB8Simulation(
                title: "Sobrecarga Sensorial",
                type: "Ruido",
                simulationDescription: "Escucharás sonidos superpuestos creciendo en intensidad. Así se siente cuando le pides hacer varias cosas a la vez.",
                durationSeconds: 20,
                insight: "Cuando su cerebro recibe demasiada información, colapsa. Tu calma es su ancla.",
                icon: "waveform",
                color: "red"
            ),
            
            YB8Simulation(
                title: "La Incertidumbre",
                type: "Incertidumbre",
                simulationDescription: "Te diré que algo va a pasar, pero no qué ni cuándo. Observa cómo reacciona tu cuerpo.",
                durationSeconds: 25,
                insight: "La incertidumbre activa la amígdala. Los niños necesitan predictibilidad para sentirse seguros.",
                icon: "questionmark.circle.fill",
                color: "yellow"
            ),
            
            YB8Simulation(
                title: "El Cambio Repentino",
                type: "Luz",
                simulationDescription: "La pantalla cambiará súbitamente de color y brillo. Así se siente una transición abrupta para ellos.",
                durationSeconds: 15,
                insight: "Las transiciones sin aviso generan estrés. Los avisos ('en 5 minutos terminamos') ayudan a su cerebro a prepararse.",
                icon: "light.beacon.max.fill",
                color: "purple"
            )
        ]
    }
}

