import SwiftUI

// MARK: - CUESTIONARIOS 4-8
extension BM7View {
    var questionnairesPart2: [BM7Questionnaire] {
        [
            // CUESTIONARIO 4: Respuesta al Llanto
            BM7Questionnaire(
                number: 4,
                title: "¿Respondo al Llanto Adecuadamente?",
                description: "Evalúa tu respuesta al llanto según los principios del libro",
                questions: [
                    BM7Question(
                        text: "Cuando tu bebé llora, ¿cuál es tu primera reacción?",
                        options: [
                            QuestionOption(text: "Ir inmediatamente a consolar", points: 1.0, feedback: "Perfecto. Respuesta inmediata crea apego seguro."),
                            QuestionOption(text: "Esperar unos minutos 'por si se calma solo'", points: 0.0, feedback: "Esperar es innecesario y dañino. Ir inmediatamente."),
                            QuestionOption(text: "Depende de mi estado de ánimo", points: 0.0, feedback: "El bebé necesita respuesta consistente.")
                        ],
                        category: "Respuesta"
                    ),
                    BM7Question(
                        text: "¿Crees que atender el llanto 'malcría'?",
                        options: [
                            QuestionOption(text: "No, el apego es necesidad, no capricho", points: 1.0, feedback: "Correcto según el libro. Imposible malcriar con afecto."),
                            QuestionOption(text: "Tengo dudas a veces", points: 0.5, feedback: "Normal con presión social. El libro aclara: no malcría."),
                            QuestionOption(text: "Sí, por eso a veces no atiendo", points: 0.0, feedback: "Mito peligroso. Atender SIEMPRE es correcto.")
                        ],
                        category: "Creencias"
                    ),
                    BM7Question(
                        text: "¿Validas las emociones cuando llora (aunque la causa parezca 'tonta')?",
                        options: [
                            QuestionOption(text: "Siempre. Para él es real", points: 1.0, feedback: "Empatía perfecta. Su experiencia es válida."),
                            QuestionOption(text: "A veces digo 'no es para tanto'", points: 0.0, feedback: "Minimizar invalida su experiencia emocional."),
                            QuestionOption(text: "No valido, intento distraer", points: 0.0, feedback: "Distracción sin validar no procesa emoción.")
                        ],
                        category: "Validación"
                    ),
                    BM7Question(
                        text: "¿Ofreces contacto físico cuando llora?",
                        options: [
                            QuestionOption(text: "Siempre (brazos, pecho, caricias)", points: 1.0, feedback: "Perfecto. Contacto regula sistema nervioso."),
                            QuestionOption(text: "A veces, no siempre", points: 0.5, feedback: "Aumenta el contacto. Es regulador más potente."),
                            QuestionOption(text: "Rara vez, intento palabras solo", points: 0.0, feedback: "Bebés necesitan contacto más que palabras.")
                        ],
                        category: "Contacto"
                    ),
                    BM7Question(
                        text: "¿Te frustras cuando llora 'sin razón aparente'?",
                        options: [
                            QuestionOption(text: "No, entiendo que hay razón aunque no la vea", points: 1.0, feedback: "Madurez emocional excelente."),
                            QuestionOption(text: "A veces me frustra", points: 0.5, feedback: "Normal. Respira. Recuerda: siempre hay razón."),
                            QuestionOption(text: "Sí, me enoja mucho", points: 0.0, feedback: "Necesitas apoyo. Tu frustración afecta respuesta.")
                        ],
                        category: "Autocontrol"
                    ),
                    BM7Question(
                        text: "¿Interpretas el llanto como comunicación o como manipulación?",
                        options: [
                            QuestionOption(text: "Comunicación, su único lenguaje", points: 1.0, feedback: "Correcto. Bebés NO manipulan."),
                            QuestionOption(text: "A veces pienso que 'manipula'", points: 0.0, feedback: "Bebés son incapaces de manipular. Es comunicación."),
                            QuestionOption(text: "Manipulación, por eso no siempre atiendo", points: 0.0, feedback: "Idea muy dañina. Releer sección sobre llanto del libro.")
                        ],
                        category: "Interpretación"
                    )
                ],
                category: .emotions
            ),
            
            // CUESTIONARIO 5: Contacto Continuo
            BM7Questionnaire(
                number: 5,
                title: "¿Ofrezco Suficiente Contacto?",
                description: "Evalúa si ofreces el contacto físico que necesita tu hijo",
                questions: [
                    BM7Question(
                        text: "¿Llevas a tu bebé en brazos o porteador frecuentemente?",
                        options: [
                            QuestionOption(text: "Sí, la mayor parte del día", points: 1.0, feedback: "Perfecto. El contacto constante es saludable."),
                            QuestionOption(text: "A veces, cuando puedo", points: 0.5, feedback: "Intenta más. Porteadores facilitan contacto constante."),
                            QuestionOption(text: "Rara vez, prefiero el cochecito/cuna", points: 0.0, feedback: "Bebés necesitan contacto. Reconsiderar prioridades.")
                        ],
                        category: "Porteo"
                    ),
                    BM7Question(
                        text: "¿Te dicen que 'lo acostumbras a los brazos'?",
                        options: [
                            QuestionOption(text: "Sí, pero lo ignoro. Sé que es correcto", points: 1.0, feedback: "Defensa correcta. Contacto es necesidad."),
                            QuestionOption(text: "Sí, y me hace dudar", points: 0.5, feedback: "Normal dudar. El libro confirma: contacto es necesidad."),
                            QuestionOption(text: "Sí, por eso limito los brazos", points: 0.0, feedback: "Imposible 'acostumbrar' a una necesidad básica.")
                        ],
                        category: "Creencias"
                    ),
                    BM7Question(
                        text: "¿Tu hijo protesta cuando lo bajas?",
                        options: [
                            QuestionOption(text: "Sí, aún necesita contacto y lo respeto", points: 1.0, feedback: "Respetas su necesidad. Perfecto."),
                            QuestionOption(text: "Sí, pero lo bajo igual 'para que aprenda'", points: 0.0, feedback: "No hay que 'enseñar' independencia. Viene sola."),
                            QuestionOption(text: "No protesta (ya es más independiente)", points: 1.0, feedback: "Ha ganado independencia natural. Bien.")
                        ],
                        category: "Respuesta"
                    ),
                    BM7Question(
                        text: "¿Usas portabebés/fular regularmente?",
                        options: [
                            QuestionOption(text: "Sí, es mi herramienta principal", points: 1.0, feedback: "Excelente. Portear beneficia a ambos."),
                            QuestionOption(text: "Lo tengo pero no lo uso mucho", points: 0.5, feedback: "Intenta usarlo más. Facilita todo."),
                            QuestionOption(text: "No uso, prefiero cochecito", points: 0.0, feedback: "Cochecito aleja. Portear conecta.")
                        ],
                        category: "Herramientas"
                    ),
                    BM7Question(
                        text: "¿Permites que tu hijo toque/explore tu cuerpo?",
                        options: [
                            QuestionOption(text: "Sí, es parte del apego", points: 1.0, feedback: "Correcto. Exploración es normal y saludable."),
                            QuestionOption(text: "A veces me incomoda", points: 0.5, feedback: "Normal. Pero es fase, pasará."),
                            QuestionOption(text: "No lo permito", points: 0.0, feedback: "Parte del apego. Reconsiderar.")
                        ],
                        category: "Exploración"
                    ),
                    BM7Question(
                        text: "¿Ofreces masajes o caricias diarias?",
                        options: [
                            QuestionOption(text: "Sí, contacto físico constante", points: 1.0, feedback: "Perfecto. Refuerza vínculo."),
                            QuestionOption(text: "A veces", points: 0.5, feedback: "Intenta hacerlo rutina diaria."),
                            QuestionOption(text: "Rara vez", points: 0.0, feedback: "Incorpora contacto afectivo diario.")
                        ],
                        category: "Afecto"
                    )
                ],
                category: .contact
            ),
            
            // CUESTIONARIO 6: Defensa ante Presión
            BM7Questionnaire(
                number: 6,
                title: "¿Defiendo mi Crianza Efectivamente?",
                description: "Evalúa tu capacidad de defender tu crianza ante críticas",
                questions: [
                    BM7Question(
                        text: "¿Estableces límites claros con quienes critican tu crianza?",
                        options: [
                            QuestionOption(text: "Sí, claramente y sin culpa", points: 1.0, feedback: "Excelente firmeza y seguridad."),
                            QuestionOption(text: "Lo intento pero con dudas", points: 0.5, feedback: "Practica. Con el tiempo será más fácil."),
                            QuestionOption(text: "No, cedo o me callo", points: 0.0, feedback: "Necesitas fortalecer límites. Entrenamiento 7.")
                        ],
                        category: "Límites"
                    ),
                    BM7Question(
                        text: "¿Te afectan emocionalmente las críticas a tu crianza?",
                        options: [
                            QuestionOption(text: "No, tengo seguridad en mi decisiones", points: 1.0, feedback: "Confianza sólida. Excelente."),
                            QuestionOption(text: "A veces me duelen", points: 0.5, feedback: "Normal. Reafírmate con el libro."),
                            QuestionOption(text: "Sí, mucho. Hasta cambio mi crianza", points: 0.0, feedback: "Peligroso. Necesitas apoyo urgente.")
                        ],
                        category: "Impacto emocional"
                    ),
                    BM7Question(
                        text: "¿Educas a quienes critican o solo defiendes?",
                        options: [
                            QuestionOption(text: "Ambas: defiendo Y ofrezco información", points: 1.0, feedback: "Ideal. Educas además de proteger."),
                            QuestionOption(text: "Solo defiendo sin explicar", points: 0.5, feedback: "Válido. Si tienes energía, educar ayuda."),
                            QuestionOption(text: "No hago ninguna", points: 0.0, feedback: "Al menos defensa es necesaria.")
                        ],
                        category: "Educación"
                    ),
                    BM7Question(
                        text: "¿Reduces contacto con personas muy tóxicas para tu crianza?",
                        options: [
                            QuestionOption(text: "Sí, incluso familiares si es necesario", points: 1.0, feedback: "Protección necesaria. Bien hecho."),
                            QuestionOption(text: "Me cuesta, por 'obligación familiar'", points: 0.5, feedback: "Tu hijo es prioridad sobre obligaciones."),
                            QuestionOption(text: "No, aguanto todo", points: 0.0, feedback: "Distanciarse de toxicidad es válido y necesario.")
                        ],
                        category: "Protección"
                    ),
                    BM7Question(
                        text: "¿Buscas apoyo en grupos pro-apego?",
                        options: [
                            QuestionOption(text: "Sí, tengo comunidad de apoyo", points: 1.0, feedback: "Fundamental. Tribu es importante."),
                            QuestionOption(text: "No tengo pero lo busco", points: 0.5, feedback: "Redes sociales, grupos locales. Búscalos."),
                            QuestionOption(text: "No busco apoyo", points: 0.0, feedback: "Apoyo es crucial. Busca tu tribu.")
                        ],
                        category: "Apoyo"
                    ),
                    BM7Question(
                        text: "¿Compartes recursos (libro/artículos) con quienes dudan?",
                        options: [
                            QuestionOption(text: "Sí, comparto información", points: 1.0, feedback: "Buena estrategia para educar."),
                            QuestionOption(text: "A veces", points: 0.5, feedback: "Hazlo más. Información cambia mentes."),
                            QuestionOption(text: "No comparto", points: 0.0, feedback: "Considera hacerlo. Puede ayudar.")
                        ],
                        category: "Difusión"
                    )
                ],
                category: .externalPressure
            ),
            
            // CUESTIONARIO 7: Validación Emocional
            BM7Questionnaire(
                number: 7,
                title: "¿Valido las Emociones de mi Hijo?",
                description: "Evalúa tu capacidad de validar emociones según el libro",
                questions: [
                    BM7Question(
                        text: "Cuando tu hijo llora por algo 'tonto', ¿cómo reaccionas?",
                        options: [
                            QuestionOption(text: "Valido: 'Entiendo que estés triste'", points: 1.0, feedback: "Perfecto. Para él es real e importante."),
                            QuestionOption(text: "Digo 'no es para tanto'", points: 0.0, feedback: "Minimizar invalida su experiencia."),
                            QuestionOption(text: "Ignoro", points: 0.0, feedback: "Ignorar es no validar. Siempre validar.")
                        ],
                        category: "Validación"
                    ),
                    BM7Question(
                        text: "¿Nombras las emociones que observas en tu hijo?",
                        options: [
                            QuestionOption(text: "Sí, 'Veo que estás enojado'", points: 1.0, feedback: "Excelente. Enseñas vocabulario emocional."),
                            QuestionOption(text: "A veces", points: 0.5, feedback: "Hazlo más. Es educación emocional."),
                            QuestionOption(text: "No lo hago", points: 0.0, feedback: "Nombrar emociones las hace manejables.")
                        ],
                        category: "Vocabulario"
                    ),
                    BM7Question(
                        text: "¿Permites todas las emociones (incluso negativas)?",
                        options: [
                            QuestionOption(text: "Sí, todas son válidas", points: 1.0, feedback: "Correcto. No hay emociones malas."),
                            QuestionOption(text: "A veces reprimo las 'malas'", points: 0.0, feedback: "Todas las emociones son válidas. Reprimir daña."),
                            QuestionOption(text: "No permito negatividad", points: 0.0, feedback: "Peligroso. Reprimir emociones causa problemas futuros.")
                        ],
                        category: "Aceptación"
                    ),
                    BM7Question(
                        text: "¿Acompañas las rabietas o intentas cortarlas?",
                        options: [
                            QuestionOption(text: "Acompaño cerca, con calma", points: 1.0, feedback: "Perfecto. Acompañar sin rescatar."),
                            QuestionOption(text: "Intento distraer para que pare", points: 0.0, feedback: "Distracción sin procesar no ayuda."),
                            QuestionOption(text: "Castigo por rabietas", points: 0.0, feedback: "Castigar emociones es dañino. Acompañar siempre.")
                        ],
                        category: "Rabietas"
                    ),
                    BM7Question(
                        text: "¿Modelas la expresión saludable de emociones?",
                        options: [
                            QuestionOption(text: "Sí, 'Estoy enojado pero respiro'", points: 1.0, feedback: "Modelar es la mejor enseñanza."),
                            QuestionOption(text: "A veces", points: 0.5, feedback: "Hazlo más. Aprenden de ti."),
                            QuestionOption(text: "No, oculto mis emociones", points: 0.0, feedback: "Modelar es crucial. Muestra emociones sanamente.")
                        ],
                        category: "Modelado"
                    ),
                    BM7Question(
                        text: "¿Enseñas estrategias de regulación emocional?",
                        options: [
                            QuestionOption(text: "Sí, respiro con él, abrazo, etc.", points: 1.0, feedback: "Enseñas herramientas para toda la vida."),
                            QuestionOption(text: "A veces", points: 0.5, feedback: "Hazlo consistentemente."),
                            QuestionOption(text: "No enseño estrategias", points: 0.0, feedback: "Respiración, abrazo, agua. Enseña herramientas.")
                        ],
                        category: "Regulación"
                    )
                ],
                category: .emotions
            ),
            
            // CUESTIONARIO 8: Alineación General
            BM7Questionnaire(
                number: 8,
                title: "Alineación General con el Libro",
                description: "Evalúa tu alineación global con los principios de Bésame Mucho",
                questions: [
                    BM7Question(
                        text: "¿Has leído 'Bésame Mucho' completo?",
                        options: [
                            QuestionOption(text: "Sí, completo (incluso varias veces)", points: 1.0, feedback: "Base sólida para crianza con apego."),
                            QuestionOption(text: "Parcialmente", points: 0.5, feedback: "Termínalo. Cada capítulo aporta."),
                            QuestionOption(text: "No lo he leído", points: 0.0, feedback: "Fundamental leerlo completo.")
                        ],
                        category: "Conocimiento"
                    ),
                    BM7Question(
                        text: "¿Confías en los instintos naturales de crianza?",
                        options: [
                            QuestionOption(text: "Sí, totalmente", points: 1.0, feedback: "Base del libro. Instinto > 'expertos'."),
                            QuestionOption(text: "A veces dudo", points: 0.5, feedback: "Normal dudar. El libro reafirma: confía en ti."),
                            QuestionOption(text: "No, prefiero seguir 'expertos'", points: 0.0, feedback: "Tu instinto es más sabio que muchos 'expertos'.")
                        ],
                        category: "Confianza"
                    ),
                    BM7Question(
                        text: "¿Priorizas las necesidades del niño sobre opiniones externas?",
                        options: [
                            QuestionOption(text: "Siempre, mi hijo es prioridad", points: 1.0, feedback: "Prioridad correcta."),
                            QuestionOption(text: "A veces cedo por presión", points: 0.0, feedback: "Necesidad del niño > opinión de otros."),
                            QuestionOption(text: "No, las opiniones me importan más", points: 0.0, feedback: "Peligroso. Niño es prioridad absoluta.")
                        ],
                        category: "Prioridades"
                    ),
                    BM7Question(
                        text: "¿Sientes culpa por tu estilo de crianza con apego?",
                        options: [
                            QuestionOption(text: "No, sé que es lo correcto", points: 1.0, feedback: "Seguridad basada en conocimiento."),
                            QuestionOption(text: "A veces, por presión", points: 0.5, feedback: "Normal. Reafírmate con libro y ciencia."),
                            QuestionOption(text: "Sí, constantemente", points: 0.0, feedback: "Culpa es señal de presión. Necesitas apoyo.")
                        ],
                        category: "Emociones"
                    ),
                    BM7Question(
                        text: "¿Recomiendas el libro a otras familias?",
                        options: [
                            QuestionOption(text: "Sí, siempre que puedo", points: 1.0, feedback: "Difundir conocimiento es valioso."),
                            QuestionOption(text: "A veces", points: 0.5, feedback: "Recomiéndalo más. Puede transformar vidas."),
                            QuestionOption(text: "No lo recomiendo", points: 0.0, feedback: "Compartir puede ayudar a otros niños.")
                        ],
                        category: "Difusión"
                    ),
                    BM7Question(
                        text: "¿Te cuestionas constantemente tus decisiones de crianza?",
                        options: [
                            QuestionOption(text: "No, tengo confianza en mi camino", points: 1.0, feedback: "Seguridad saludable."),
                            QuestionOption(text: "A veces dudo", points: 0.5, feedback: "Normal dudar ocasionalmente."),
                            QuestionOption(text: "Sí, constantemente", points: 0.0, feedback: "Dudas constantes señalan falta de apoyo. Búscalo.")
                        ],
                        category: "Seguridad"
                    ),
                    BM7Question(
                        text: "¿Observas el impacto positivo del apego en tu hijo?",
                        options: [
                            QuestionOption(text: "Sí, veo los beneficios claramente", points: 1.0, feedback: "Evidencia práctica de que funciona."),
                            QuestionOption(text: "No estoy seguro/a", points: 0.5, feedback: "Observa: ¿está seguro, explora, vuelve a ti?"),
                            QuestionOption(text: "No veo diferencia", points: 0.0, feedback: "Beneficios son a largo plazo. Paciencia.")
                        ],
                        category: "Resultados"
                    ),
                    BM7Question(
                        text: "Si tuvieras otro hijo, ¿repetirías esta crianza?",
                        options: [
                            QuestionOption(text: "Sí, sin dudarlo", points: 1.0, feedback: "Convicción total. Excelente."),
                            QuestionOption(text: "Probablemente sí", points: 0.5, feedback: "Positivo. ¿Qué te hace dudar?"),
                            QuestionOption(text: "No, cambiaría cosas", points: 0.0, feedback: "¿Qué cambiarías? Reflexiona por qué.")
                        ],
                        category: "Convicción"
                    ),
                    BM7Question(
                        text: "¿Te sientes satisfecho/a con tu rol como madre/padre con apego?",
                        options: [
                            QuestionOption(text: "Sí, muy satisfecho/a", points: 1.0, feedback: "Satisfacción es señal de alineación."),
                            QuestionOption(text: "A veces", points: 0.5, feedback: "Crianza es difícil. Busca apoyo."),
                            QuestionOption(text: "No, me siento agotado/a", points: 0.0, feedback: "Agotamiento señala falta de apoyo. Búscalo urgentemente.")
                        ],
                        category: "Bienestar"
                    ),
                    BM7Question(
                        text: "¿Crees que el apego genera independencia (paradoja)?",
                        options: [
                            QuestionOption(text: "Sí, entiendo la paradoja del libro", points: 1.0, feedback: "Comprensión profunda. Dependencia → Independencia."),
                            QuestionOption(text: "Me cuesta entenderlo", points: 0.5, feedback: "Releer sección. Es clave: cubrir necesidad = independencia."),
                            QuestionOption(text: "No, creo que genera dependencia", points: 0.0, feedback: "Contrario al libro y evidencia. Apego = Independencia futura.")
                        ],
                        category: "Comprensión"
                    )
                ],
                category: .general
            )
        ]
    }
}

