import SwiftUI

// MARK: - CUESTIONARIOS 1-4
extension BM7View {
    var questionnairesPart1: [BM7Questionnaire] {
        [
            // CUESTIONARIO 1: Colecho Seguro
            BM7Questionnaire(
                number: 1,
                title: "¿Practico el Colecho Seguro?",
                description: "Evalúa tu práctica actual de sueño compartido según los principios del libro",
                questions: [
                    BM7Question(
                        text: "¿Tu bebé/niño duerme contigo en la misma cama?",
                        options: [
                            QuestionOption(text: "Sí, todas las noches", points: 1.0, feedback: "Perfecto según el libro. El colecho es natural y beneficioso."),
                            QuestionOption(text: "A veces (algunas noches sí, otras no)", points: 0.5, feedback: "Parcialmente. Considera hacerlo más consistente si funciona bien."),
                            QuestionOption(text: "No, duerme solo en su cuna/cama", points: 0.0, feedback: "Considera intentar colecho según el libro (si el niño no duerme bien solo).")
                        ],
                        category: "Práctica de colecho"
                    ),
                    BM7Question(
                        text: "¿La cama cumple las condiciones de seguridad del libro?",
                        options: [
                            QuestionOption(text: "Sí, he verificado todas (colchón firme, sin almohadas cerca, etc.)", points: 1.0, feedback: "Excelente. Seguridad es prioritaria."),
                            QuestionOption(text: "No estoy seguro/a de todas las condiciones", points: 0.5, feedback: "Revisa la lista de seguridad del libro. Es importante verificar."),
                            QuestionOption(text: "No hago colecho", points: 0.0, feedback: "Si decides intentarlo, primero lee sobre seguridad.")
                        ],
                        category: "Seguridad"
                    ),
                    BM7Question(
                        text: "¿Amamantas acostada durante la noche?",
                        options: [
                            QuestionOption(text: "Sí, amamanto acostada (más cómodo y descansado)", points: 1.0, feedback: "Perfecto. Facilita lactancia nocturna y descanso."),
                            QuestionOption(text: "Me levanto a amamantar sentada", points: 0.5, feedback: "Funcional pero agotador. Intenta amamantar acostada (descansas más)."),
                            QuestionOption(text: "No amamanto", points: 0.0, feedback: "No aplica. Si amamantas, considera hacerlo acostada.")
                        ],
                        category: "Lactancia nocturna"
                    ),
                    BM7Question(
                        text: "¿Cuántas veces te levantas por noche con tu hijo?",
                        options: [
                            QuestionOption(text: "0-2 veces (colecho facilita todo)", points: 1.0, feedback: "Excelente. El colecho reduce levantadas."),
                            QuestionOption(text: "3-5 veces", points: 0.5, feedback: "Considerable. El colecho podría reducir esto."),
                            QuestionOption(text: "6+ veces", points: 0.0, feedback: "Agotador. Definitivamente considera colecho para descansar más.")
                        ],
                        category: "Descanso"
                    ),
                    BM7Question(
                        text: "¿Has intentado métodos para 'enseñar a dormir' a tu hijo?",
                        options: [
                            QuestionOption(text: "No, nunca. Respeto su desarrollo natural", points: 1.0, feedback: "Alineado con el libro. El sueño es biológico, no se enseña."),
                            QuestionOption(text: "Lo consideré pero no lo hice", points: 0.5, feedback: "Bien que no lo hiciste. Sigue confiando en desarrollo natural."),
                            QuestionOption(text: "Sí, he intentado (o estoy intentando)", points: 0.0, feedback: "El libro critica estos métodos. Considera volver a respuesta nocturna.")
                        ],
                        category: "Métodos conductistas"
                    ),
                    BM7Question(
                        text: "Si has intentado métodos, ¿involucraron dejar llorar al bebé?",
                        options: [
                            QuestionOption(text: "No aplica, no he usado métodos", points: 1.0, feedback: "Correcto según el libro."),
                            QuestionOption(text: "Sí, implicaban dejarlo llorar", points: 0.0, feedback: "El libro llama a esto 'llanto terapéutico' irónicamente. No es terapéutico."),
                            QuestionOption(text: "Solo un poco / con intervalos", points: 0.0, feedback: "Cualquier cantidad de llanto ignorado es dañino según el libro.")
                        ],
                        category: "Llanto ignorado"
                    ),
                    BM7Question(
                        text: "¿Respondes a los despertares nocturnos de tu hijo?",
                        options: [
                            QuestionOption(text: "Siempre, inmediatamente", points: 1.0, feedback: "Perfecto. Creas apego seguro incluso de noche."),
                            QuestionOption(text: "A veces (depende de mi cansancio/humor)", points: 0.5, feedback: "Trata de ser más consistente. El bebé necesita respuesta predecible."),
                            QuestionOption(text: "Rara vez (intento que 'aprenda' a dormir)", points: 0.0, feedback: "Contrario al libro. Los bebés no aprenden, se resignan.")
                        ],
                        category: "Respuesta nocturna"
                    ),
                    BM7Question(
                        text: "¿Sientes culpa por dormir con tu hijo?",
                        options: [
                            QuestionOption(text: "No, sé que es correcto y natural", points: 1.0, feedback: "Confianza basada en el libro. Excelente."),
                            QuestionOption(text: "A veces, cuando me critican", points: 0.5, feedback: "Normal sentir dudas con presión. Reafirma con el libro."),
                            QuestionOption(text: "Sí, siento que está 'mal'", points: 0.0, feedback: "Releer capítulo sobre colecho. Es CORRECTO según ciencia y libro.")
                        ],
                        category: "Seguridad emocional"
                    ),
                    BM7Question(
                        text: "¿La familia critica tu decisión de colechar?",
                        options: [
                            QuestionOption(text: "No, respetan mi decisión", points: 1.0, feedback: "Familia respetuosa o bien educada por ti."),
                            QuestionOption(text: "Sí, pero he establecido límites", points: 1.0, feedback: "Excelente. Defiendes tu crianza efectivamente."),
                            QuestionOption(text: "Sí, y me afecta emocionalmente", points: 0.0, feedback: "Necesitas establecer límites o distanciarte. Entrenamiento 7.")
                        ],
                        category: "Presión familiar"
                    ),
                    BM7Question(
                        text: "¿Has defendido tu decisión de colechar ante críticas?",
                        options: [
                            QuestionOption(text: "Sí, con datos del libro/OMS", points: 1.0, feedback: "Perfecto. Defiendes con argumentos."),
                            QuestionOption(text: "No ha sido necesario (no me critican)", points: 1.0, feedback: "Afortunado/a. Pero prepárate por si acaso."),
                            QuestionOption(text: "No, cedo o me callo ante críticas", points: 0.0, feedback: "Necesitas fortalecer tu defensa. Entrenamiento 7 recomendado.")
                        ],
                        category: "Defensa de crianza"
                    ),
                    BM7Question(
                        text: "¿Planeas transicionar al niño a su cama pronto aunque no esté listo?",
                        options: [
                            QuestionOption(text: "No, esperaré a que muestre señales de estar listo", points: 1.0, feedback: "Perfecto. Respetas su ritmo individual."),
                            QuestionOption(text: "Tal vez, por presión de pareja/familia", points: 0.0, feedback: "Presión externa no es razón válida según el libro."),
                            QuestionOption(text: "Sí, creo que 'ya es hora'", points: 0.0, feedback: "¿Por qué 'ya es hora'? Evalúa si es necesidad del niño o presión.")
                        ],
                        category: "Respeto al ritmo"
                    ),
                    BM7Question(
                        text: "¿Confías en que tu hijo dormirá solo cuando esté preparado?",
                        options: [
                            QuestionOption(text: "Sí, totalmente. TODOS eventualmente duermen solos", points: 1.0, feedback: "Confianza basada en realidad. No hay adultos que duerman con sus padres."),
                            QuestionOption(text: "Tengo dudas a veces", points: 0.5, feedback: "Normal dudar. Releer sección sobre independencia natural."),
                            QuestionOption(text: "No, temo que 'nunca' duerma solo", points: 0.0, feedback: "Miedo infundado. Releer el libro sobre independencia que se consigue.")
                        ],
                        category: "Confianza en desarrollo"
                    )
                ],
                category: .sleep
            ),
            
            // CUESTIONARIO 2: Lactancia a Demanda
            BM7Questionnaire(
                number: 2,
                title: "¿Practico Lactancia a Demanda?",
                description: "Evalúa si amamantas completamente a demanda según los principios del libro",
                questions: [
                    BM7Question(
                        text: "¿Amamantas cuando el bebé pide, sin mirar el reloj?",
                        options: [
                            QuestionOption(text: "Siempre, a demanda total", points: 1.0, feedback: "Perfecto. Así debe ser la lactancia."),
                            QuestionOption(text: "A veces miro el reloj", points: 0.5, feedback: "Intenta eliminar el reloj completamente. Confía en el bebé."),
                            QuestionOption(text: "Uso horarios fijos (cada X horas)", points: 0.0, feedback: "Los horarios son arbitrarios según el libro. Cambia a demanda.")
                        ],
                        category: "Frecuencia"
                    ),
                    BM7Question(
                        text: "¿Limitas la duración de las tomas (minutos por pecho)?",
                        options: [
                            QuestionOption(text: "No, mama el tiempo que quiere", points: 1.0, feedback: "Correcto. El bebé regula su ingesta perfectamente."),
                            QuestionOption(text: "A veces limito si es 'muy largo'", points: 0.5, feedback: "Evita limitar. La leche del final (más grasa) sale después de 20+ min."),
                            QuestionOption(text: "Sí, limito a X minutos por pecho", points: 0.0, feedback: "Limitar es arbitrario. El bebé sabe cuánto necesita.")
                        ],
                        category: "Duración"
                    ),
                    BM7Question(
                        text: "¿Amamantas de noche sin restricciones?",
                        options: [
                            QuestionOption(text: "Sí, todas las veces que pide", points: 1.0, feedback: "Perfecto. Tomas nocturnas son cruciales para producción."),
                            QuestionOption(text: "Limito tomas nocturnas (intento espaciar)", points: 0.0, feedback: "Contrario al libro. Tomas de noche son importantes siempre."),
                            QuestionOption(text: "No amamanto de noche", points: 0.0, feedback: "Reconsiderar según el libro. Lactancia nocturna es natural.")
                        ],
                        category: "Lactancia nocturna"
                    ),
                    BM7Question(
                        text: "¿Te preocupa que el bebé 'tome demasiado'?",
                        options: [
                            QuestionOption(text: "No, confío en su autorregulación", points: 1.0, feedback: "Confianza correcta. Los bebés no toman 'demasiado'."),
                            QuestionOption(text: "A veces me preocupa", points: 0.5, feedback: "Los bebés regulan perfectamente. No existe 'demasiado'."),
                            QuestionOption(text: "Sí, por eso limito", points: 0.0, feedback: "Innecesario y contraproducente según el libro.")
                        ],
                        category: "Confianza"
                    ),
                    BM7Question(
                        text: "¿Respondes antes de que llore (a señales de hambre)?",
                        options: [
                            QuestionOption(text: "Siempre, reconozco sus señales", points: 1.0, feedback: "Excelente. Prevenir llanto es ideal."),
                            QuestionOption(text: "A veces, no siempre las reconozco", points: 0.5, feedback: "Práctica mejorará tu reconocimiento de señales."),
                            QuestionOption(text: "Espero al llanto para saber que tiene hambre", points: 0.0, feedback: "El llanto es la última señal. Aprende señales tempranas.")
                        ],
                        category: "Señales"
                    ),
                    BM7Question(
                        text: "¿Confías en que tu bebé sabe cuánto necesita mamar?",
                        options: [
                            QuestionOption(text: "Sí, totalmente", points: 1.0, feedback: "Confianza fundamental según el libro."),
                            QuestionOption(text: "Tengo dudas a veces", points: 0.5, feedback: "Normal dudar. El libro reafirma: los bebés saben."),
                            QuestionOption(text: "No, creo que debo controlar yo", points: 0.0, feedback: "Contrario al libro. Los bebés autoregulan perfectamente.")
                        ],
                        category: "Confianza en el bebé"
                    ),
                    BM7Question(
                        text: "¿Sigues horarios de algún 'experto' (pediatra/libro)?",
                        options: [
                            QuestionOption(text: "No, sigo a demanda total", points: 1.0, feedback: "Correcto. Los horarios son arbitrarios."),
                            QuestionOption(text: "Intenté pero no funcionó, volví a demanda", points: 1.0, feedback: "Aprendiste por experiencia. Bien."),
                            QuestionOption(text: "Sí, sigo horarios fijos", points: 0.0, feedback: "Los horarios son contraproducentes según el libro.")
                        ],
                        category: "Horarios"
                    ),
                    BM7Question(
                        text: "Te dicen que el bebé 'usa el pecho como chupete'. ¿Cómo reaccionas?",
                        options: [
                            QuestionOption(text: "Lo ignoro, sé que es comentario ignorante", points: 1.0, feedback: "Correcto. El chupete imita el pecho, no al revés."),
                            QuestionOption(text: "Me molesta pero no respondo", points: 0.5, feedback: "Válido. Podrías educar si tienes energía."),
                            QuestionOption(text: "Me preocupa, intento limitarle el pecho", points: 0.0, feedback: "Innecesario. La succión no nutritiva es VÁLIDA.")
                        ],
                        category: "Críticas"
                    ),
                    BM7Question(
                        text: "¿Ofreces pecho como consuelo (no solo como alimento)?",
                        options: [
                            QuestionOption(text: "Sí, el pecho es alimento Y consuelo", points: 1.0, feedback: "Perfecto. Entiendes la función múltiple del pecho."),
                            QuestionOption(text: "A veces, con dudas", points: 0.5, feedback: "Es válido. El pecho es para TODO: alimento, consuelo, sueño."),
                            QuestionOption(text: "No, solo para alimentar", points: 0.0, feedback: "El pecho es mucho más que alimento según el libro.")
                        ],
                        category: "Uso del pecho"
                    ),
                    BM7Question(
                        text: "¿Practicas colecho Y lactancia nocturna juntos?",
                        options: [
                            QuestionOption(text: "Sí, ambas cosas", points: 1.0, feedback: "Combinación ideal según el libro."),
                            QuestionOption(text: "Solo una de las dos", points: 0.5, feedback: "Bueno, pero juntas funcionan mejor."),
                            QuestionOption(text: "Ninguna de las dos", points: 0.0, feedback: "Considera intentar al menos una.")
                        ],
                        category: "Integración"
                    ),
                    BM7Question(
                        text: "¿Has considerado destetar por presión externa (no por deseo mutuo)?",
                        options: [
                            QuestionOption(text: "No, destestaré cuando AMBOS estemos listos", points: 1.0, feedback: "Decisión correcta según el libro."),
                            QuestionOption(text: "Lo he considerado por presión", points: 0.0, feedback: "Presión externa NO es razón válida para destetar."),
                            QuestionOption(text: "Ya desteté por presión (me arrepiento)", points: 0.0, feedback: "Comprensible. Para futuro: tu decisión, no de otros.")
                        ],
                        category: "Destete"
                    ),
                    BM7Question(
                        text: "¿La lactancia es estresante o placentera para ti?",
                        options: [
                            QuestionOption(text: "Placentera, la disfruto", points: 1.0, feedback: "Ideal. Así debe ser."),
                            QuestionOption(text: "A veces estresante (por críticas/dudas)", points: 0.5, feedback: "Busca apoyo. La lactancia debe ser placentera."),
                            QuestionOption(text: "Muy estresante, la sufro", points: 0.0, feedback: "Si es por técnica: busca asesora. Si por presión: límites urgentes.")
                        ],
                        category: "Experiencia"
                    )
                ],
                category: .feeding
            ),
            
            // CUESTIONARIO 3: Crianza sin Violencia
            BM7Questionnaire(
                number: 3,
                title: "¿Practico Crianza sin Violencia?",
                description: "Evalúa tu uso (o no uso) de castigos físicos y emocionales",
                questions: [
                    BM7Question(
                        text: "¿Has pegado alguna vez a tu hijo (bofetada, nalgada, etc.)?",
                        options: [
                            QuestionOption(text: "Nunca, jamás", points: 1.0, feedback: "Alineado con el libro. Nunca una bofetada."),
                            QuestionOption(text: "Una o dos veces (me arrepiento)", points: 0.5, feedback: "Arrepentimiento es primer paso. Compromiso de nunca más."),
                            QuestionOption(text: "Sí, cuando 'lo merece'", points: 0.0, feedback: "El libro critica esto totalmente. Pegar nunca es educativo.")
                        ],
                        category: "Violencia física"
                    ),
                    BM7Question(
                        text: "¿Gritas frecuentemente a tu hijo?",
                        options: [
                            QuestionOption(text: "Raramente (solo emergencias)", points: 1.0, feedback: "Buen control. Un grito ocasional es humano."),
                            QuestionOption(text: "A veces, cuando pierdo la paciencia", points: 0.5, feedback: "Trabaja en autorregulación. Entrenamiento 5."),
                            QuestionOption(text: "Frecuentemente, es mi forma de poner límites", points: 0.0, feedback: "Gritar daña. Límites pueden ser firmes sin gritar.")
                        ],
                        category: "Violencia verbal"
                    ),
                    BM7Question(
                        text: "¿Usas castigos (quitar privilegios, rincón de pensar, etc.)?",
                        options: [
                            QuestionOption(text: "No, solo límites sin castigos", points: 1.0, feedback: "Perfecto. Límites ≠ castigos según el libro."),
                            QuestionOption(text: "A veces, cuando 'no hay de otra'", points: 0.5, feedback: "Hay alternativas. Consecuencias naturales, no castigos."),
                            QuestionOption(text: "Sí, es mi método principal", points: 0.0, feedback: "El libro critica castigos. No educan, dominan.")
                        ],
                        category: "Castigos"
                    ),
                    BM7Question(
                        text: "Cuando tu hijo hace algo inaceptable, ¿cuál es tu primera reacción?",
                        options: [
                            QuestionOption(text: "Detener con calma, explicar, redirigir", points: 1.0, feedback: "Protocolo correcto del libro."),
                            QuestionOption(text: "Gritar primero, explicar después", points: 0.0, feedback: "Invertir orden. Calma primero, explicación inmediata."),
                            QuestionOption(text: "Castigar para que 'aprenda'", points: 0.0, feedback: "Castigo no enseña comprensión moral según el libro.")
                        ],
                        category: "Reacción"
                    ),
                    BM7Question(
                        text: "¿Ofreces alternativas cuando pones límites?",
                        options: [
                            QuestionOption(text: "Siempre: 'No esto, pero sí esto otro'", points: 1.0, feedback: "Excelente. Redirigir es más efectivo que solo prohibir."),
                            QuestionOption(text: "A veces lo intento", points: 0.5, feedback: "Bien. Practícalo más consistentemente."),
                            QuestionOption(text: "No, solo digo 'no'", points: 0.0, feedback: "Ofrecer alternativas enseña, solo prohibir frustra.")
                        ],
                        category: "Redirección"
                    ),
                    BM7Question(
                        text: "¿Mantienes la calma cuando pones límites?",
                        options: [
                            QuestionOption(text: "Sí, generalmente tranquilo/a", points: 1.0, feedback: "Control emocional excelente."),
                            QuestionOption(text: "Depende del día/situación", points: 0.5, feedback: "Trabaja en consistencia. Respiración profunda ayuda."),
                            QuestionOption(text: "No, pierdo la calma frecuentemente", points: 0.0, feedback: "Necesitas estrategias de autorregulación. Entrenamiento 5.")
                        ],
                        category: "Autorregulación"
                    ),
                    BM7Question(
                        text: "¿Te disculpas cuando pierdes la calma con tu hijo?",
                        options: [
                            QuestionOption(text: "Siempre. Modelo reparación", points: 1.0, feedback: "Excelente modelar que los errores se reparan."),
                            QuestionOption(text: "A veces", points: 0.5, feedback: "Intenta siempre. Es enseñanza importante."),
                            QuestionOption(text: "No, 'soy el adulto, no me disculpo'", points: 0.0, feedback: "Disculparse es modelar reparación. Es educativo, no debilidad.")
                        ],
                        category: "Reparación"
                    ),
                    BM7Question(
                        text: "¿Usas amenazas para lograr obediencia?",
                        options: [
                            QuestionOption(text: "No, explico sin amenazar", points: 1.0, feedback: "Correcto. Amenazas generan miedo, no comprensión."),
                            QuestionOption(text: "A veces ('si no X, entonces no Y')", points: 0.0, feedback: "Amenazas son forma de control por miedo."),
                            QuestionOption(text: "Sí, frecuentemente", points: 0.0, feedback: "El libro critica amenazas. Hay mejores formas de educar.")
                        ],
                        category: "Amenazas"
                    ),
                    BM7Question(
                        text: "¿Usas consecuencias naturales (cuando es seguro)?",
                        options: [
                            QuestionOption(text: "Sí, enseñan causa-efecto", points: 1.0, feedback: "Excelente. Más educativo que castigos arbitrarios."),
                            QuestionOption(text: "No sé qué son", points: 0.5, feedback: "Ejemplo: No abrigo → siente frío (aprende). Usa estas."),
                            QuestionOption(text: "No, uso castigos arbitrarios", points: 0.0, feedback: "Naturales enseñan mejor que arbitrarios.")
                        ],
                        category: "Consecuencias"
                    ),
                    BM7Question(
                        text: "¿Consideras que puedes poner límites firmes sin violencia?",
                        options: [
                            QuestionOption(text: "Sí, lo practico diariamente", points: 1.0, feedback: "Prueba viviente de que límites ≠ violencia."),
                            QuestionOption(text: "Lo intento pero me cuesta", points: 0.5, feedback: "Práctica y entrenamiento ayudarán."),
                            QuestionOption(text: "No, creo que a veces 'hay que pegar'", points: 0.0, feedback: "El libro demuestra que NUNCA es necesario pegar.")
                        ],
                        category: "Creencias"
                    )
                ],
                category: .limits
            )
        ]
    }
}

