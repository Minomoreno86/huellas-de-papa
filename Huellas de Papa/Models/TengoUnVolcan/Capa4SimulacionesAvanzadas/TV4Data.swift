import Foundation

/// Datos consolidados de la Capa 4: Simulaciones Avanzadas
/// Escenarios interactivos para practicar respuestas ante el volcán del hijo
struct TV4Data {
    
    // MARK: - Escenarios Interactivos
    static let scenarios: [TV4Scenario] = [
        // ESCENARIO 1: Rabieta en el Supermercado (Fase: Erupción)
        TV4Scenario(
            title: "Rabieta en el Supermercado",
            childName: "Sofía",
            childAge: "4 años",
            volcanoPhase: .erupcion,
            trigger: "Botón de No Conseguir lo que Quiero",
            situation: "Estás en el supermercado con Sofía. Ella ve un juguete y te pide que se lo compres. Le dices que no, porque ya tiene muchos juguetes en casa. Su rostro se pone rojo, empieza a gritar '¡LO QUIERO! ¡LO NECESITO!', se tira al suelo y patalea. Otras personas están mirando.",
            physicalSignals: [
                "Cara completamente roja",
                "Gritos a todo volumen",
                "Pataletas en el suelo",
                "Lágrimas intensas",
                "Cuerpo rígido"
            ],
            thoughtPattern: "Nube de Humo (Sofía): 'Mamá/Papá es malo/a, nunca me compra nada'",
            options: [
                TV4Option(
                    text: "Ceder y comprar el juguete para que se calme",
                    responseType: .counterproductive,
                    outcome: TV4Outcome(
                        childReaction: "Sofía deja de llorar inmediatamente, toma el juguete y sonríe. En ese momento hay paz.",
                        volcanoEffect: .decreased,
                        parentEmotion: "Te sientes aliviado/a de que paró el berrinche, pero también frustrado/a porque cediste a la presión.",
                        longTermImpact: "NEGATIVO: Sofía aprende que si grita lo suficiente, consigue lo que quiere. La próxima vez gritará más fuerte y más rápido. Su volcán se vuelve una herramienta de manipulación.",
                        whyThisHappened: "Reforzaste positivamente el berrinche. Su cerebro registró: 'Gritar funciona para conseguir lo que quiero'. El volcán se volvió su estrategia de negociación.",
                        whatToDoNext: "Si ya cediste, después (en calma) explica: 'Hoy te compré el juguete, pero no porque gritaste. Eso no está bien. La próxima vez, si gritas, no lo conseguirás aunque llores mucho'.",
                        rating: 1
                    )
                ),
                TV4Option(
                    text: "Gritarle: '¡Basta! Estás haciendo un ridículo. Te voy a castigar cuando lleguemos a casa'",
                    responseType: .counterproductive,
                    outcome: TV4Outcome(
                        childReaction: "Sofía grita aún más fuerte, llora más intensamente. Ahora además de querer el juguete, se siente humillada y rechazada. El volcán se alimenta con tu rabia.",
                        volcanoEffect: .exploded,
                        parentEmotion: "Te sientes avergonzado/a por las miradas de la gente, frustrado/a y también enojado/a. Tu propio volcán explotó.",
                        longTermImpact: "NEGATIVO: Sofía aprende que cuando está mal, tú también te pones mal. No aprende a calmarse, aprende a temer tu reacción. La confianza se daña.",
                        whyThisHappened: "Tu volcán se activó por el de ella. Entraron en un círculo de desregulación mutua. Además, la amenaza de castigo futuro no calma el volcán presente.",
                        whatToDoNext: "Cuando ambos estén calmados, discúlpate: 'Perdón por gritarte. Mi volcán también explotó. Los dos necesitamos practicar nuestras herramientas'.",
                        rating: 1
                    )
                ),
                TV4Option(
                    text: "Agacharte a su altura, validar y usar El Paraguas Mágico: 'Veo que tu volcán explotó porque querías el juguete. Está bien querer cosas. Vamos a un lugar tranquilo'",
                    responseType: .effective,
                    outcome: TV4Outcome(
                        childReaction: "Sofía sigue llorando, pero acepta que la tomes en brazos o la lleves de la mano a un lugar más tranquilo (fuera de la tienda o a un rincón). Gradualmente, con tu presencia calmada, su llanto disminuye.",
                        volcanoEffect: .decreased,
                        parentEmotion: "Te sientes orgulloso/a de mantener la calma a pesar de las miradas. Confiado/a en que estás priorizando la regulación emocional de Sofía sobre la opinión de extraños.",
                        longTermImpact: "POSITIVO: Sofía aprende que su emoción es válida (querías el juguete, lo entiendo) pero el comportamiento tiene límites. Aprende que TÚ eres su refugio seguro incluso cuando está desregulada.",
                        whyThisHappened: "Validaste su emoción sin ceder al capricho. Usaste el Paraguas Mágico (distancia) y fuiste su Fuente de Calma. Co-regulación efectiva.",
                        whatToDoNext: "Cuando esté calmada, conversa: '¿Recuerdas qué pasó? Tu volcán explotó porque querías el juguete. Está bien querer cosas, pero gritar no es la forma. ¿Qué herramienta podríamos usar la próxima vez?'",
                        rating: 5
                    )
                ),
                TV4Option(
                    text: "Ignorarla completamente y seguir comprando como si nada pasara",
                    responseType: .needsWork,
                    outcome: TV4Outcome(
                        childReaction: "Sofía se siente abandonada emocionalmente. Grita más fuerte para llamar tu atención. Su volcán crece porque además de la frustración original, ahora siente que no la ves, que no importa.",
                        volcanoEffect: .increased,
                        parentEmotion: "Te sientes incómodo/a ignorándola mientras grita. Internamente estás tenso/a. Quieres que pare pero no sabes cómo.",
                        longTermImpact: "MIXTO: Puede que eventualmente se canse y pare, pero no aprende regulación. Aprende que cuando está mal, tú no estás disponible emocionalmente. Puede afectar el apego.",
                        whyThisHappened: "Ignorar el comportamiento puede funcionar para caprichos leves, pero cuando hay una erupción real, el niño necesita co-regulación. No puede calmarse solo a los 4 años.",
                        whatToDoNext: "Aunque ignores el comportamiento, NO ignores la emoción. Puedes decir: 'Veo que estás muy enojada. Cuando estés lista, estaré aquí para ayudarte a calmarte'.",
                        rating: 2
                    )
                )
            ],
            insight: "En una erupción pública, tu prioridad es: 1) Regular TU propio volcán, 2) Ser la fuente de calma de tu hijo (co-regulación), 3) Enseñar (después, en calma). La enseñanza NO ocurre durante la crisis. Las miradas de extraños NO son tu prioridad; el bienestar emocional de tu hijo SÍ.",
            toolsRecommended: ["El Paraguas Mágico", "La Fuente de la Calma", "El Botón de Pausa (para ti primero)"],
            difficulty: 4,
            iconName: "cart.fill",
            color: "red"
        ),
        
        // ESCENARIO 2: Torre Destruida por el Hermano (Fase: Burbujeo)
        TV4Scenario(
            title: "La Torre que el Hermano Destruyó",
            childName: "Lucas",
            childAge: "6 años",
            volcanoPhase: .burbujeo,
            trigger: "Botón de Frustración + Botón de Injusticia",
            situation: "Lucas pasó 30 minutos construyendo una torre de bloques muy alta. Estaba orgulloso y a punto de poner la última pieza. Su hermano pequeño de 2 años pasa corriendo y, sin querer, la tira toda. Lucas se congela. Ves que sus manos se cierran en puños, su cara se pone roja, su respiración se acelera. Dice con voz temblorosa: '¡SIEMPRE me lo arruina todo!'",
            physicalSignals: [
                "Manos cerradas en puños",
                "Cara enrojecida",
                "Respiración acelerada",
                "Mandíbula tensa",
                "Voz temblorosa de rabia contenida"
            ],
            thoughtPattern: "Nube de Humo: 'Mi hermano SIEMPRE me lo arruina todo' + 'Lo hizo a propósito'",
            options: [
                TV4Option(
                    text: "Decir: 'No es para tanto, era solo una torre. Puedes hacerla de nuevo. No te enojes'",
                    responseType: .counterproductive,
                    outcome: TV4Outcome(
                        childReaction: "Lucas se siente invalidado. Su esfuerzo de 30 minutos no fue 'nada'. Ahora además de enojado, se siente incomprendido. Puede que explote o se cierre emocionalmente.",
                        volcanoEffect: .increased,
                        parentEmotion: "Crees que estás ayudando a que vea perspectiva, pero en realidad estás minimizando su experiencia.",
                        longTermImpact: "NEGATIVO: Lucas aprende que sus emociones no son importantes para ti. Puede dejar de compartir cuando algo le duele. La desconexión emocional crece.",
                        whyThisHappened: "Minimizaste su experiencia ('no es para tanto') e invalidaste su emoción ('no te enojes'). Para él SÍ era importante. Necesitaba validación, no minimización.",
                        whatToDoNext: "Reconoce su perspectiva: 'Tienes razón, trabajaste mucho en esa torre. Yo también me enojaría si la tiraran. Tu emoción es válida'.",
                        rating: 1
                    )
                ),
                TV4Option(
                    text: "Validar y ayudar con Caza de Nubes: 'Veo que estás MUY enojado. Trabajaste mucho. ¿Crees que tu hermano lo hizo a propósito o fue un accidente?'",
                    responseType: .effective,
                    outcome: TV4Outcome(
                        childReaction: "Lucas respira, piensa un momento. Dice: 'Fue un accidente... pero igual estoy enojado'. Tú dices: 'Claro que sí. Puedes estar enojado aunque haya sido accidente. Son dos cosas diferentes'. Lucas asiente, su volcán baja del Burbujeo a la Chispa.",
                        volcanoEffect: .decreased,
                        parentEmotion: "Te sientes conectado/a con Lucas. Lograste validar su emoción Y ayudarlo a pensar con claridad. Sientes que lo estás acompañando bien.",
                        longTermImpact: "POSITIVO: Lucas aprende que puede estar enojado Y reconocer que no hubo mala intención. Desarrolla pensamiento flexible. Cazó una nube de humo con tu ayuda.",
                        whyThisHappened: "Validaste la emoción primero ('Veo que estás MUY enojado') y DESPUÉS ayudaste a cazar la nube ('¿A propósito o accidente?'). Orden correcto: validar, luego reestructurar.",
                        whatToDoNext: "Ofrece herramientas: '¿Quieres respirar juntos? ¿Necesitas un abrazo? ¿O prefieres ir a tu cuarto un momento?' Deja que elija.",
                        rating: 5
                    )
                ),
                TV4Option(
                    text: "Regañar al hermano pequeño: '¡Mira lo que hiciste! Le tiraste la torre a Lucas. Pídele perdón ahora mismo'",
                    responseType: .needsWork,
                    outcome: TV4Outcome(
                        childReaction: "Lucas se siente defendido momentáneamente, pero su volcán no baja. El hermano pequeño llora porque lo regañaron. Ahora hay DOS niños desregulados. Lucas puede sentirse culpable de que su hermano llore.",
                        volcanoEffect: .maintained,
                        parentEmotion: "Crees que hiciste justicia, pero en realidad creaste más caos emocional. Ahora tienes que lidiar con dos volcanes.",
                        longTermImpact: "NEGATIVO: Lucas puede aprender a buscar venganza o castigo cuando está enojado, en lugar de buscar regulación. El hermano aprende que es 'malo'. Se daña la relación entre hermanos.",
                        whyThisHappened: "Enfocaste en castigar al hermano en lugar de ayudar a Lucas a regularse. Fue un accidente de un niño de 2 años - no necesita castigo. Lucas necesitaba validación y herramientas.",
                        whatToDoNext: "Redirige: Valida a Lucas ('Veo tu enojo'), explica al pequeño ('Fue un accidente, sé que no querías') y enfoca en solución ('¿Podemos reconstruirla juntos?').",
                        rating: 2
                    )
                )
            ],
            insight: "La Caza de Nubes es más efectiva cuando primero validas la emoción. No puedes razonar con un volcán en erupción - primero baja la intensidad, LUEGO reestructura el pensamiento.",
            toolsRecommended: ["Caza de Nubes", "El Botón de Pausa", "La Fuente de la Calma"],
            difficulty: 3,
            iconName: "building.2.fill",
            color: "orange"
        ),
        
        // ESCENARIO 2: Frustración con la Tarea (Fase: Burbujeo)
        TV4Scenario(
            title: "No Puedo Hacer la Tarea",
            childName: "Mateo",
            childAge: "7 años",
            volcanoPhase: .burbujeo,
            trigger: "Botón de Frustración",
            situation: "Mateo está haciendo su tarea de matemáticas. Lo ves borrando una y otra vez. Sus hombros están tensos, su ceño fruncido. De repente, arruga el papel y dice con voz tensa: 'No puedo. Nunca voy a aprender esto. Soy tonto'. Tira el lápiz al suelo.",
            physicalSignals: [
                "Hombros tensos y elevados",
                "Ceño profundamente fruncido",
                "Mandíbula apretada",
                "Voz tensa y frustrada",
                "Movimientos bruscos (tirar el lápiz)"
            ],
            thoughtPattern: "Nubes de Humo: 'Nunca voy a aprender esto' + 'Soy tonto' + 'Todo me sale mal'",
            options: [
                TV4Option(
                    text: "Decir: 'Claro que puedes. Solo tienes que esforzarte más. No te rindas'",
                    responseType: .needsWork,
                    outcome: TV4Outcome(
                        childReaction: "Mateo se frustra más. Tu frase implica que no se está esforzando lo suficiente, lo cual no es cierto. Su nube de humo crece: 'Ni siquiera entienden lo difícil que es'.",
                        volcanoEffect: .increased,
                        parentEmotion: "Crees que estás motivándolo, pero en realidad él siente que no entiendes su dificultad.",
                        longTermImpact: "NEGATIVO: Mateo puede dejar de pedirte ayuda porque siente que minimizas sus desafíos. La autocrítica ('soy tonto') se refuerza porque 'debería poder' pero no puede.",
                        whyThisHappened: "'Esfuérzate más' invalida el esfuerzo que ya hizo. 'No te rindas' no le da una herramienta concreta. Son frases bien intencionadas pero vacías de ayuda real.",
                        whatToDoNext: "Valida el esfuerzo ya hecho: 'Veo que has trabajado mucho en esto. Es difícil y estás frustrado. Eso es normal cuando algo es desafiante'.",
                        rating: 2
                    )
                ),
                TV4Option(
                    text: "Hacer la tarea por él para que no sufra",
                    responseType: .counterproductive,
                    outcome: TV4Outcome(
                        childReaction: "Mateo se siente aliviado momentáneamente. Pero su nube de humo 'no puedo hacerlo' se confirmó: 'Tenía razón, no puedo. Por eso mamá/papá lo hizo'.",
                        volcanoEffect: .decreased,
                        parentEmotion: "Te sientes bien porque lo 'rescataste' del sufrimiento. Pero es una satisfacción falsa.",
                        longTermImpact: "NEGATIVO: Mateo no desarrolla tolerancia a la frustración. Cada vez que algo sea difícil, esperará que tú lo resuelvas. La impotencia aprendida crece.",
                        whyThisHappened: "Al rescatarlo, le enviaste el mensaje: 'No confío en que puedas hacerlo'. Su autoestima y autonomía se dañan.",
                        whatToDoNext: "Si ya lo hiciste, explica: 'Te ayudé esta vez, pero TÚ sí puedes aprender. Mañana lo intentaremos juntos, paso a paso, hasta que lo logres TÚ'.",
                        rating: 1
                    )
                ),
                TV4Option(
                    text: "Validar, cazar nubes y ofrecer herramientas: 'Estás frustrado. Borraste muchas veces. ¿De verdad NUNCA vas a aprenderlo? ¿O es difícil AHORA y necesitas ayuda? Respiremos juntos primero'",
                    responseType: .effective,
                    outcome: TV4Outcome(
                        childReaction: "Mateo respira contigo (Botón de Pausa). Piensa: 'Hoy es difícil... pero puedo aprender'. Su volcán baja. Dice: 'Necesito que me expliques esta parte'. Trabajan juntos. Él lo logra con tu guía.",
                        volcanoEffect: .decreased,
                        parentEmotion: "Te sientes conectado/a y útil. Lograste calmar su volcán Y ayudarlo a aprender (tanto la tarea como la regulación emocional).",
                        longTermImpact: "POSITIVO: Mateo aprende que la frustración es normal, que puede pedir ayuda sin ser 'tonto', y que los pensamientos se pueden cambiar. Desarrolla resiliencia y autoeficacia.",
                        whyThisHappened: "Usaste Botón de Pausa (respirar juntos), Caza de Nubes ('¿NUNCA o es difícil AHORA?') y ofreciste ayuda apropiada (guiar, no hacer). Balance perfecto.",
                        whatToDoNext: "Celebra el proceso: 'Lo lograste. Estabas frustrado, usamos herramientas, pediste ayuda y lo conseguiste. Así se desarrolla el músculo emocional'.",
                        rating: 5
                    )
                )
            ],
            insight: "La frustración académica enciende volcanes frecuentemente. La clave es: validar el esfuerzo, cazar nubes de autocrítica ('soy tonto' → 'necesito ayuda'), y guiar sin rescatar. Ayúdalo a lograrlo, no lo hagas por él.",
            toolsRecommended: ["Caza de Nubes", "El Botón de Pausa", "Las Palabras Mágicas"],
            difficulty: 3,
            iconName: "pencil",
            color: "orange"
        ),
        
        // ESCENARIO 3: Pelea entre Hermanos (Fase: Chispa → Burbujeo)
        TV4Scenario(
            title: "Pelea por el Tablet",
            childName: "Emma",
            childAge: "5 años",
            volcanoPhase: .burbujeo,
            trigger: "Botón de Injusticia",
            situation: "Emma y su hermano de 8 años están jugando con el tablet. El tiempo se acabó y tú dices que deben apagarlo. El hermano dice 'Yo lo apago' y lo toma. Emma grita: '¡NO! ¡Yo quería apagarlo! ¡No es justo!' Ves que su cuerpo se tensa, sus ojos se achican, está a punto de arrebatárselo de las manos.",
            physicalSignals: [
                "Cuerpo tenso, listo para arrebatar",
                "Ojos achicados, mirada intensa",
                "Voz elevada pero aún controlada",
                "Respiración acelerada",
                "Primera chispa de calor visible"
            ],
            thoughtPattern: "Nube de Humo: 'No es justo, él siempre decide' + 'Nunca me dejan a mí'",
            options: [
                TV4Option(
                    text: "Decir al hermano: 'Déjala que lo apague ella. Tú siempre quieres todo'",
                    responseType: .needsWork,
                    outcome: TV4Outcome(
                        childReaction: "Emma se siente vindicada y apaga el tablet. Su volcán baja... por ahora. Pero reforzaste su nube de humo: 'Tenía razón, él SIEMPRE quiere todo y es injusto'.",
                        volcanoEffect: .decreased,
                        parentEmotion: "Te sientes justo/a defendiendo a Emma. Pero creaste resentimiento en el hermano.",
                        longTermImpact: "MIXTO: Emma aprende que si grita, tú tomas su lado. El hermano se siente atacado. La rivalidad entre hermanos aumenta. No aprenden a negociar.",
                        whyThisHappened: "Tomaste partido en lugar de enseñar negociación. La solución fue externa (tú decidiste) no interna (ellos negociaron).",
                        whatToDoNext: "Después, enseña turnos: 'Hoy apagó él, mañana tú. Haremos una lista de turnos para que sea justo'.",
                        rating: 2
                    )
                ),
                TV4Option(
                    text: "Reconocer la emoción y cazar nubes: 'Emma, veo que querías apagarlo tú. Te sientes frustrada. ¿Tu hermano SIEMPRE decide? ¿O esta vez sí pero otras veces tú?' Luego proponer solución",
                    responseType: .effective,
                    outcome: TV4Outcome(
                        childReaction: "Emma piensa: 'Hoy sí... pero ayer yo apagué la tele'. Su nube se aclara. Dice: 'Está bien, pero la próxima vez yo'. Respiras juntas. El volcán pasa de Burbujeo a Chispa.",
                        volcanoEffect: .decreased,
                        parentEmotion: "Te sientes orgulloso/a de ayudarla a pensar en lugar de reaccionar. La crisis se evitó.",
                        longTermImpact: "POSITIVO: Emma aprende que puede estar molesta Y pensar con claridad. Caza nubes con tu ayuda. Desarrolla flexibilidad cognitiva y tolerancia a la frustración.",
                        whyThisHappened: "Validaste ('Te sientes frustrada'), cazaste la nube ('¿SIEMPRE o esta vez?'), y ella llegó a una conclusión realista. Intervención temprana en Burbujeo evitó Erupción.",
                        whatToDoNext: "Establece sistema de turnos: 'Haremos una lista. Hoy él, mañana tú, pasado mañana él. Así todos saben cuándo les toca'. Prevención de futuros volcanes.",
                        rating: 5
                    )
                ),
                TV4Option(
                    text: "Quitarles el tablet a ambos: 'Como están peleando, nadie lo usa mañana. Se acabó'",
                    responseType: .counterproductive,
                    outcome: TV4Outcome(
                        childReaction: "AHORA ambos están furiosos. Emma porque era 'injusto desde el principio' y ahora peor. El hermano porque él no hizo nada malo. Dos volcanes en erupción.",
                        volcanoEffect: .exploded,
                        parentEmotion: "Te sientes frustrado/a y enojado/a. Tu propio volcán se activó. Castigaste en caliente.",
                        longTermImpact: "NEGATIVO: No aprendieron a negociar. Aprendieron que cuando hay conflicto, viene castigo. No desarrollan habilidades de resolución, solo miedo al castigo.",
                        whyThisHappened: "El castigo en caliente reactivo ('Se acabó') no enseña nada. Tu volcán explotó con el de ellos. Entraron en desregulación colectiva.",
                        whatToDoNext: "Cuando TODOS estén calmados, discúlpate: 'Perdón, mi volcán también explotó. Castigarlos no fue la solución. Hablemos de cómo resolver esto la próxima vez'.",
                        rating: 1
                    )
                )
            ],
            insight: "Las peleas entre hermanos encienden volcanes rápidamente. Tu rol NO es ser juez ('Quién tiene razón'), es ser ENTRENADOR de regulación emocional. Enseña a negociar, a cazar nubes ('¿SIEMPRE o esta vez?'), y a establecer sistemas justos (turnos).",
            toolsRecommended: ["Caza de Nubes", "Las Palabras Mágicas", "El Botón de Pausa"],
            difficulty: 4,
            iconName: "ipad",
            color: "red"
        ),
        
        // ESCENARIO 4: Primer Día de Escuela (Fase: Chispa con Emoción Enmascarada)
        TV4Scenario(
            title: "No Quiero Ir a la Escuela",
            childName: "Alba",
            childAge: "5 años",
            volcanoPhase: .chispa,
            trigger: "Botón de Emociones Enmascaradas (Miedo disfrazado de rabia)",
            situation: "Es el primer día de escuela. Alba despierta y al recordar que tiene que ir, cruza los brazos y dice con voz dura: 'NO voy a ir. La escuela es aburrida. No me gusta'. Ves un leve temblor en su voz. Sus ojos parecen a punto de llorar pero está conteniendo.",
            physicalSignals: [
                "Brazos cruzados defensivamente",
                "Voz dura pero con temblor",
                "Ojos brillantes (a punto de llorar)",
                "Postura rígida",
                "Primer calor en el estómago (Chispa)"
            ],
            thoughtPattern: "Emoción Real: Miedo. Nube de Humo: 'La escuela es aburrida' (protege de admitir el miedo)",
            options: [
                TV4Option(
                    text: "Decir: 'No seas tonta, la escuela es divertida. Vas a hacer amigos. No hay nada que temer'",
                    responseType: .counterproductive,
                    outcome: TV4Outcome(
                        childReaction: "Alba se siente incomprendida. Llamarla 'tonta' lastima. 'No hay nada que temer' invalida su miedo real. Su volcán crece porque ahora además se siente sola con su miedo.",
                        volcanoEffect: .increased,
                        parentEmotion: "Crees que la estás animando, pero ella se siente juzgada y no escuchada.",
                        longTermImpact: "NEGATIVO: Alba aprende que el miedo no es aceptable en tu casa. Dejará de compartir sus miedos. Los enterrará o los disfrazará de rabia.",
                        whyThisHappened: "Invalidaste su emoción ('no hay nada que temer' niega su experiencia) y la etiquetaste negativamente ('tonta'). Su emoción necesitaba validación.",
                        whatToDoNext: "Valida: 'Tienes razón en sentir nervios. El primer día es nuevo y lo nuevo puede dar miedo. Yo también me siento así a veces'.",
                        rating: 1
                    )
                ),
                TV4Option(
                    text: "Buscar la emoción debajo: 'Dices que la escuela es aburrida... pero tu voz tiembla un poquito. ¿Estás enojada... o también asustada?'",
                    responseType: .effective,
                    outcome: TV4Outcome(
                        childReaction: "Alba te mira, sus ojos se llenan de lágrimas y dice: 'Tengo miedo. ¿Y si nadie quiere ser mi amigo?' El volcán (rabia defensiva) se transforma en la emoción real: tristeza/miedo. Llora en tus brazos.",
                        volcanoEffect: .decreased,
                        parentEmotion: "Te sientes conectado/a profundamente con Alba. Lograste ver debajo de la rabia a la emoción vulnerable. Puedes ayudarla ahora.",
                        longTermImpact: "POSITIVO: Alba aprende que puede mostrar sus miedos contigo, que no tiene que disfrazarlos de rabia. La confianza se profundiza. Puede nombrar y procesar emociones difíciles.",
                        whyThisHappened: "Buscaste debajo del volcán (rabia) la emoción enmascarada (miedo). Las Palabras Mágicas aplicadas: señalaste la incongruencia con gentileza. Ella pudo ser vulnerable.",
                        whatToDoNext: "Valida el miedo: 'Es normal tener miedo de cosas nuevas. ¿Qué te ayudaría a sentirte más valiente?' Ofrecen soluciones juntos (llevarte algo especial, acordar señas, etc.).",
                        rating: 5
                    )
                ),
                TV4Option(
                    text: "Obligarla firmemente: 'No discutas. Te vistes ahora y vamos. No hay opciones'",
                    responseType: .counterproductive,
                    outcome: TV4Outcome(
                        childReaction: "Alba se viste llorando, sintiéndose forzada y no escuchada. Va a la escuela con el volcán aún activo y el miedo intacto. Posible erupción en la escuela.",
                        volcanoEffect: .maintained,
                        parentEmotion: "Te sientes en control porque 'ganaste' la batalla. Pero perdiste la oportunidad de conexión.",
                        longTermImpact: "NEGATIVO: Alba aprende que sus emociones no importan, solo la obediencia. El miedo real no se procesó, solo se reprimió. Puede manifestarse de otras formas.",
                        whyThisHappened: "Priorizaste la conducta (que vaya) sobre la emoción (su miedo). El comportamiento cambió, pero la emoción no se reguló. Es una victoria vacía.",
                        whatToDoNext: "Después de la escuela, reconecta: 'Esta mañana no te escuché bien. ¿Cómo te sentiste? ¿Qué necesitabas de mí?' Repara la desconexión.",
                        rating: 1
                    )
                )
            ],
            insight: "A veces el volcán (rabia) protege emociones más vulnerables (miedo, tristeza, soledad). Tu rol es buscar DEBAJO de la rabia: '¿Estás enojado/a o también triste/asustado/a?' Esta pregunta abre la puerta a la emoción real.",
            toolsRecommended: ["Buscar Emociones Enmascaradas", "La Fuente de la Calma", "Las Palabras Mágicas"],
            difficulty: 4,
            iconName: "building.columns.fill",
            color: "purple"
        ),
        
        // ESCENARIO 5: Hora de Dormir (Fase: Chispa)
        TV4Scenario(
            title: "No Quiero Dormir",
            childName: "Leo",
            childAge: "4 años",
            volcanoPhase: .chispa,
            trigger: "Botón de No Conseguir lo que Quiero",
            situation: "Es hora de dormir. Leo estaba jugando y te pide '5 minutos más'. Le dices que no, que ya es muy tarde. Leo cruza los brazos y dice: 'NO quiero dormir. No tengo sueño'. Ves el primer calor en su mirada, el inicio de la resistencia.",
            physicalSignals: [
                "Brazos cruzados",
                "Postura defensiva",
                "Primer calor visible en la mirada",
                "Voz con primer tono de desafío",
                "Mandíbula empezando a tensarse"
            ],
            thoughtPattern: "Nube de Humo: 'Nunca me dejan hacer lo que quiero' + 'No es justo'",
            options: [
                TV4Option(
                    text: "Amenazar: 'Si no te vas a dormir ahora, mañana no hay parque'",
                    responseType: .counterproductive,
                    outcome: TV4Outcome(
                        childReaction: "Leo llora de frustración y rabia. Va a la cama enojado y resentido. Tarda mucho en dormirse porque está alterado emocionalmente. Conexión dañada.",
                        volcanoEffect: .increased,
                        parentEmotion: "Lograste que obedezca (fue a la cama) pero con rabia. Victoria vacía.",
                        longTermImpact: "NEGATIVO: La hora de dormir se asocia con conflicto y castigos. Leo no aprende autorregulación, aprende miedo a consecuencias. La resistencia nocturna aumentará.",
                        whyThisHappened: "La amenaza genera cumplimiento por miedo, no por entendimiento. El volcán no se reguló, solo se reprimió. Las emociones reprimidas tardan más en calmarse.",
                        whatToDoNext: "Antes de que duerma, reconecta: 'Perdón por amenazarte. Ambos estábamos cansados. Mañana seguimos yendo al parque. Te amo'.",
                        rating: 1
                    )
                ),
                TV4Option(
                    text: "Validar, ofrecer opción limitada: 'Entiendo que quieras seguir jugando. Es difícil parar cuando es divertido. No podemos quedarnos despiertos, pero ¿quieres escoger el cuento que leemos?'",
                    responseType: .effective,
                    outcome: TV4Outcome(
                        childReaction: "Leo siente que lo escuchas ('Entiendo que quieras'). La opción limitada (escoger el cuento) le da sensación de control sin cambiar el límite (dormir). Dice: 'Quiero el del dragón'. Va más tranquilo.",
                        volcanoEffect: .decreased,
                        parentEmotion: "Te sientes equilibrado/a: mantuviste el límite (dormir) pero con conexión. Leo cooperó sin batalla.",
                        longTermImpact: "POSITIVO: Leo aprende que los límites pueden ser firmes Y amorosos. Que sus emociones son válidas aunque la respuesta sea 'no'. Desarrolla flexibilidad.",
                        whyThisHappened: "Validación + límite firme + opción limitada = fórmula efectiva. El cerebro de Leo sintió: 'Me entienden' (baja defensividad) + 'Tengo control en algo' (reduce impotencia).",
                        whatToDoNext: "Durante la lectura del cuento, reconecta: 'Gracias por cooperar aunque no querías. Eso fue difícil y lo hiciste bien'.",
                        rating: 5
                    )
                ),
                TV4Option(
                    text: "Ceder: 'Bueno, 5 minutos más, pero después SÍ te duermes'",
                    responseType: .needsWork,
                    outcome: TV4Outcome(
                        childReaction: "Leo juega 5 minutos más... y cuando le dices que ya, pide '5 más'. Ahora el Burbujeo está más fuerte porque ya sabe que si insiste, cedes.",
                        volcanoEffect: .maintained,
                        parentEmotion: "Te sientes cansado/a. Cediste para evitar conflicto, pero el conflicto solo se pospuso y creció.",
                        longTermImpact: "NEGATIVO: Leo aprende que los límites son negociables si presiona. La inconsistencia genera volcanes más frecuentes porque 'nunca sé si es en serio o no'.",
                        whyThisHappened: "La inconsistencia confunde. Si a veces cedes y a veces no, el niño siempre intentará, generando más conflictos. Los límites claros y consistentes previenen volcanes.",
                        whatToDoNext: "Sé consistente: 'Hoy cedí, pero no estuvo bien. A partir de mañana, cuando diga que es hora de dormir, es hora. Sin 5 minutos más'.",
                        rating: 2
                    )
                )
            ],
            insight: "Los límites firmes con amor previenen volcanes. La fórmula: Validación ('Entiendo que...') + Límite claro ('Pero es hora de...') + Opción limitada ('¿Cuento A o B?'). Firmeza sin dureza.",
            toolsRecommended: ["Validación + Límites", "Opciones Limitadas", "Regar el Jardín (rutina de sueño consistente)"],
            difficulty: 2,
            iconName: "moon.stars.fill",
            color: "blue"
        )
    ]
}

