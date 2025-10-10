import SwiftUI

// MARK: - SITUACIONES 8-12 (Parte 3)
extension BM5View {
    var situationsPart3: [BM5Situation] {
        [
            // SITUACIÓN 8: Poner Límites sin Castigos
            BM5Situation(
                number: 8,
                title: "Poner Límites Sin Castigos (Aplicación Real)",
                context: "Tu hijo hace algo peligroso o inaceptable. Necesitas detenerlo pero sin castigar. Quieres aplicar límites respetuosos como enseña el libro pero no sabes cómo en la práctica.",
                preparation: [
                    "ENTENDER QUE LÍMITES ≠ CASTIGOS: Los límites son necesarios (seguridad, convivencia). Los castigos NO son necesarios. Puedes poner límites firmes sin violencia física ni emocional.",
                    "CONOCER LA DIFERENCIA: LÍMITE = 'No puedes pegar' (se detiene conducta). CASTIGO = 'Como pegaste, no hay parque' (se añade consecuencia punitiva). El límite es suficiente.",
                    "PREPARAR FRASES: Tener claras frases respetuosas: 'Eso no se puede, pero puedes...', 'Entiendo que quieras X, pero...', 'Veo que estás enfadado, y no voy a permitir que...'.",
                    "MANTENER CALMA: El límite debe ponerse desde la CALMA, no desde la ira. Si estás muy enfadada, respira hondo antes de actuar."
                ],
                implementationSteps: [
                    "PASO 1 - DETENER LA CONDUCTA INMEDIATAMENTE: Si está pegando, sujeta su mano con firmeza pero sin violencia. Si está tirando comida, retira el plato. Si está en peligro, apártalo físicamente. Detener es válido y necesario. Hazlo con calma.",
                    "PASO 2 - EXPLICAR POR QUÉ NO (adaptado a edad): 2 años: 'Pegar duele. No se pega'. 4 años: 'Pegar duele a tu hermano y le pone triste. No vamos a pegar en esta familia'. 6 años: 'Entiendo que estés enfadado, pero pegar no resuelve problemas. Vamos a buscar otra forma'. Explicación clara, voz tranquila.",
                    "PASO 3 - OFRECER ALTERNATIVA ACEPTABLE: En lugar de solo prohibir, redirige. 'No puedes tirar comida, pero puedes jugar con estos juguetes'. 'No puedes pegar, pero puedes decirle con palabras que estás enfadado'. 'No puedes correr aquí, pero puedes caminar rápido o correr afuera'. Siempre ofrece opción aceptable.",
                    "PASO 4 - VALIDAR EMOCIÓN (si aplica): 'Entiendo que estés frustrado/enfadado'. Separar emoción (válida) de conducta (inaceptable). 'Puedes estar enfadado, Y no puedes pegar'. El 'Y' es importante (no 'pero' que invalida).",
                    "PASO 5 - SER CONSISTENTE: Si ayer pegar no era aceptable, hoy tampoco. La consistencia enseña. Cambiar normas según tu humor confunde. Los límites importantes deben ser firmes SIEMPRE.",
                    "PASO 6 - REPARAR SI PIERDES LA CALMA: Si gritaste, te disculpas. 'Perdón por gritar, estaba muy enfadada. Gritar no está bien. Voy a intentar hablar con calma'. Modelar reparación es educativo."
                ],
                commonObstacles: [
                    Obstacle(
                        obstacle: "Repite la conducta una y otra vez, no 'aprende'",
                        solution: "Los niños pequeños necesitan CIENTOS de repeticiones. Su corteza prefrontal (control de impulsos) no está madura hasta los 6-7 años. NO es que no aprenda, es que NEUROLÓGICAMENTE no puede controlarse siempre. Sigue poniendo límites con paciencia. Eventualmente, con madurez cerebral, interiorizará la norma."
                    ),
                    Obstacle(
                        obstacle: "Me dicen que sin castigos será un tirano",
                        solution: "FALSO. Los límites sin castigos SÍ funcionan (requieren más paciencia pero son más efectivos a largo plazo). El castigo genera miedo u obediencia ciega, no comprensión moral. Los límites respetuosos enseñan RAZONAMIENTO. Niños educados sin castigos desarrollan moral interna, no solo evitan castigo."
                    ),
                    Obstacle(
                        obstacle: "Pierdo la calma y grito/amenazo cuando hace algo peligroso",
                        solution: "COMPRENSIBLE. Cuando hay peligro real, la adrenalina nos hace gritar. NO es ideal pero es humano. DESPUÉS, cuando esté seguro y tú calmada: Disculparte, explicar, reconnectar. Un grito ocasional por miedo NO es trauma. Los gritos constantes SÍ. Trabaja en respirar antes de reaccionar (no siempre posible, pero intentar)."
                    )
                ],
                bookQuotes: [
                    "Los límites son necesarios. Los castigos, no. Un niño puede aprender perfectamente qué está permitido y qué no sin necesidad de bofetadas, gritos o castigos.",
                    "El castigo enseña: 'No lo hagas porque te castigarán'. El límite respetuoso enseña: 'No lo hagas porque hace daño/está mal'. Solo el segundo desarrolla moral real.",
                    "Pegar a un niño para enseñarle que pegar está mal es contradictorio e ineficaz.",
                    "La firmeza y el respeto no son incompatibles. Puedes ser muy firme sin ser violenta."
                ],
                ageRange: "2-6 años",
                category: .limits
            ),
            
            // SITUACIÓN 9: Manejo de Rabietas en Casa
            BM5Situation(
                number: 9,
                title: "Manejo de Rabietas en Casa (Guía Completa)",
                context: "Tu hijo de 3 años tiene rabietas intensas en casa. Se tira al suelo, grita, llora. No sabes si debes castigar, ignorar, o acompañar. Necesitas protocolo claro.",
                preparation: [
                    "ENTENDER QUÉ SON LAS RABIETAS: NO son manipulación. Son falta de regulación emocional (cerebro inmaduro). Normales de 2-5 años. El niño LITERALMENTE no puede controlarse. Es neurobiología, no conducta voluntaria.",
                    "ELIMINAR EXPECTATIVA DE 'ARREGLARLA': Tu trabajo NO es evitar/terminar la rabieta. Tu trabajo es ACOMPAÑARLA. La rabieta pasará sola cuando la emoción se agote.",
                    "PREPARAR TU REGULACIÓN: Las rabietas te alterarán (gritos, llanto intenso). Practica: respiraciones profundas, recordarte 'es su cerebro inmaduro, no es contra mí', mantener calma externa aunque internamente estés alterada.",
                    "ESPACIO SEGURO: Área donde el niño pueda estar sin lastimarse durante la rabieta (sin esquinas afiladas, sin objetos peligrosos cerca)."
                ],
                implementationSteps: [
                    "FASE 1 - INICIO DE LA RABIETA (primeros segundos): Reconoce qué la disparó (le negaste algo, frustración, cansancio, hambre). NO cedes a la demanda (si el límite era válido), pero SÍ validas la emoción: 'Veo que estás muy enfadado porque querías X'.",
                    "FASE 2 - ESCALADA (el niño se tira al suelo, grita): MANTÉN LA CALMA (respira). Ponte a su nivel (agáchate, siéntate en el suelo). Di con voz tranquila: 'Puedes estar enfadado. Estoy aquí contigo. No te voy a dejar solo'. NO intentes razonar (no puede escucharte en ese estado). Solo acompañas.",
                    "FASE 3 - PICO DE LA RABIETA (llanto/gritos intensos): Ofrece contacto físico ('¿Quieres un abrazo?'). Si acepta, abrázalo. Si rechaza, quédate cerca sin invadir. Algunos niños no quieren contacto durante rabieta (respeta). Tu presencia CERCA sigue siendo consuelo. Puede durar 5-30 minutos. Espera con paciencia.",
                    "FASE 4 - DESCENSO (el llanto disminuye): Acércate más (si no lo habías hecho). Ofrece abrazo de nuevo (ahora puede aceptar). Di: 'Ya pasó lo peor. Aquí estoy'. Puede que pida pecho/agua/abrazo. Dale lo que pida.",
                    "FASE 5 - POST-RABIETA (cuando está calmado): AHORA puedes hablar. 'Fue difícil, ¿verdad?'. Explicar el límite si es necesario: 'Entiendo que querías X, pero no se podía porque...'. NO sermonear, NO castigar la rabieta ('Como hiciste rabieta, no hay...'). La rabieta NO es conducta a castigar.",
                    "QUÉ NO HACER NUNCA: NO dejarlo solo ('vete a tu cuarto a calmarte'), NO castigar ('no hay parque por la rabieta'), NO minimizar ('no fue para tanto'), NO distraer ('mira un dulce!'), NO amenazar ('como no pares...'). Solo ACOMPAÑAR."
                ],
                commonObstacles: [
                    Obstacle(
                        obstacle: "Tiene rabietas todos los días, estoy agotada",
                        solution: "Si son DIARIAS puede haber causas subyacentes: (1) Hambre/sueño frecuentes (ajustar horarios comida/sueño), (2) Demandas de él no realistas (¿pides demasiado para su edad?), (3) Necesidad de más atención (¿está teniendo suficiente tiempo contigo?), (4) Etapa de desarrollo (2-3 años las rabietas son máximas). Evalúa causas + sigue acompañando. Disminuirán con madurez (4-5 años)."
                    ),
                    Obstacle(
                        obstacle: "La rabieta dura 45 minutos, no puedo estar tanto tiempo",
                        solution: "Rabietas largas indican emociones MUY intensas. El niño necesita ese tiempo para desahogarse. SÍ puedes acompañar (aunque sea duro). Si absolutamente necesitas hacer algo, dile: 'Voy a X, vuelvo en 2 minutos'. Vuelve rápido. Pero idealmente: Cancela lo que ibas a hacer. Esta rabieta es prioridad ahora."
                    ),
                    Obstacle(
                        obstacle: "Me dice que me odia durante la rabieta",
                        solution: "No lo dice en serio. Es la rabieta hablando. NO tomes personal. NO respondas con ira. Cuando esté calmado: 'Antes dijiste que me odiabas. Sé que estabas muy enfadado. Yo te amo siempre, incluso cuando estás enfadado'. Enseñas amor incondicional."
                    ),
                    Obstacle(
                        obstacle: "Se pega a sí mismo durante la rabieta",
                        solution: "Detener la auto-agresión (sujeta sus manos suavemente). 'No voy a dejar que te lastimes'. Abrazarlo conteniendo (si permite). Si rechaza, manten vigilancia cercana. Rabietas con auto-agresión suelen indicar emociones muy intensas. Cuando pase, evalúa: ¿Qué necesita más? (atención, sueño, límites más claros). Consultar profesional si es frecuente."
                    )
                ],
                bookQuotes: [
                    "Las rabietas son normales de los 2 a los 5 años. Son señal de cerebro inmaduro, no de mala educación.",
                    "No se puede evitar las rabietas (son desarrollo normal). Solo se puede acompañarlas con amor.",
                    "Castigar una rabieta no enseña autocontrol, enseña represión. El niño seguirá sin poder regular, solo añadirá miedo.",
                    "La respuesta correcta a una rabieta es validación emocional + límite firme + acompañamiento. Nada más, nada menos."
                ],
                ageRange: "2-5 años",
                category: .limits
            ),
            
            // SITUACIÓN 10: Control de Esfínteres Respetuoso
            BM5Situation(
                number: 10,
                title: "Control de Esfínteres Respetuoso (Paso a Paso)",
                context: "Decides respetar el ritmo de tu hijo para control de esfínteres, ignorando presiones externas. Necesitas guía de cuándo empezar y cómo hacerlo sin estrés.",
                preparation: [
                    "CONOCER SEÑALES DE MADUREZ: (1) Permanece seco 2+ horas, (2) Avisa cuando está mojado/sucio, (3) Pide ir al baño o muestra interés, (4) Puede subir/bajar pantalones, (5) Entiende instrucciones simples. Si NO muestra TODAS, NO está listo.",
                    "EDAD ESPERADA: Entre 2-4 años generalmente. 2 años puede ser temprano para muchos (especialmente niños varones). 3-3.5 años es edad común. 4 años sigue siendo normal. NO hay 'atraso' dentro de este rango.",
                    "COMPRAR ORINAL: Que el niño elija (le da control). Ponerlo accesible en baño. No forzar usarlo, solo disponible.",
                    "ELIMINAR PRESIÓN: De colegio, familia, comparaciones. Tu hijo controlará cuando SU cuerpo esté listo, no cuando otros decidan."
                ],
                implementationSteps: [
                    "OBSERVAR SIN PRESIONAR (meses antes): Comentar cuando le cambias: 'Estás mojado, te cambio'. Dejar que vea cuando tú vas al baño (modelas sin presionar). Tener orinal visible pero sin obligar. Esta fase puede durar MESES. Es preparación, no entrenamiento.",
                    "CUANDO MUESTRE SEÑALES: Ofrecer orinal en momentos clave (después de comer, antes de bañarse, al despertar). 'Quieres intentar en el orinal?'. Si dice NO, respetas. Si dice SÍ, genial. Sin presión.",
                    "PRIMEROS USOS: Celebrar logros sin exagerar ('¡Lo hiciste! ¿Viste?') pero sin presión ('Ahora siempre aquí'). Aceptar que quizá próxima vez no quiera. Es proceso irregular. Algunos días sí, otros no. NORMAL.",
                    "ACCIDENTES (habrá muchos): NUNCA regañar, NUNCA castigar. Simplemente: 'Te hiciste pipí, te cambio'. Tono neutral. El niño ya se siente mal por el accidente, no necesita que lo hagas sentir peor. Limpiar sin drama. Seguir.",
                    "TIEMPO DE CONSOLIDACIÓN: Puede llevar 3-12 MESES de accidentes ocasionales. Es NORMAL. No significa fracaso. Control diurno viene antes que nocturno. Control de pipí antes que de caca a veces. Cada niño es diferente.",
                    "CONTROL NOCTURNO: Puede tardar AÑOS (hasta 5-7 años es normal). NO quites pañal de noche hasta que lleve semanas despertando seco. Si lo quitas y hay accidentes, vuelve al pañal sin drama. No está listo."
                ],
                commonObstacles: [
                    Obstacle(
                        obstacle: "Tiene 3.5 años y no muestra ninguna señal de interés",
                        solution: "Dentro de lo normal (el límite superior es 4 años). NO fuerces. Continúa esperando señales. Si a los 4 años NO hay progreso, consulta pediatra (puede haber problema físico). Pero antes de 4, simplemente es su ritmo. Carlos González: 'Algunos controlan a los 2, otros a los 4. Ambos son NORMALES. Tu hijo no está atrasado, está en SU tiempo'."
                    ),
                    Obstacle(
                        obstacle: "Controló durante 2 semanas, ahora regresó al pañal (accidentes constantes)",
                        solution: "REGRESIONES son NORMALES. Causas comunes: Hermano nuevo, mudanza, cambio de colegio, enfermedad, estrés. La solución NO es presionar más. Es dar MÁS apoyo emocional, quizá volver al pañal temporalmente (sin drama: 'Veo que ahora te es difícil, usamos pañal unos días'). La regresión pasará cuando el estrés pase."
                    ),
                    Obstacle(
                        obstacle: "Se niega a hacer caca en el baño (retiene, solo hace en pañal)",
                        solution: "COMÚN. La caca da más 'miedo' que el pipí (sensación diferente). NO fuerces. Déjalo hacer caca en pañal (ponte el pañal solo para eso si es necesario). Eventualmente se animará. Si retiene (estreñimiento), vuelve al pañal COMPLETO. El estreñimiento es señal de que NO está listo. Forzar causa problemas médicos."
                    )
                ],
                bookQuotes: [
                    "El control de esfínteres no se enseña, se espera. Requiere madurez neurológica que no se puede acelerar.",
                    "Forzar el control antes de tiempo causa: infecciones urinarias, estreñimiento, enuresis nocturna y trauma. No vale la pena.",
                    "Cada niño controla entre 2-4 años. TODO ese rango es normal. No hay atraso ni adelanto. Hay desarrollo individual.",
                    "Los métodos rápidos de 'quitar el pañal en 3 días' son estresantes, ineficaces a largo plazo y potencialmente dañinos."
                ],
                ageRange: "2-4 años",
                category: .limits
            ),
            
            // SITUACIÓN 11: Respuesta ante "Lo Estás Malcriando"
            BM5Situation(
                number: 11,
                title: "Plan de Acción ante 'Lo Estás Malcriando'",
                context: "Escuchas constantemente que tu crianza con apego es 'malcriar'. Necesitas estrategias específicas para defender tu crianza o protegerte de críticas tóxicas.",
                preparation: [
                    "REAFIRMAR CONVICCIÓN: Releer Bésame Mucho para reafirmar que estás haciendo bien. El amor NUNCA malcría. La ciencia está de tu lado.",
                    "PREPARAR 3 NIVELES DE RESPUESTA: Nivel 1 (educativa), Nivel 2 (límite suave), Nivel 3 (límite firme). Según quién critique y cuántas veces.",
                    "IDENTIFICAR CRÍTICOS TÓXICOS: ¿Hay personas que critican CONSTANTEMENTE sin cesar? Prepararse para limitar contacto.",
                    "BUSCAR APOYO: Grupo de apego, amigas con crianza similar, pareja que te respalde. NO estar sola contra todos."
                ],
                implementationSteps: [
                    "PRIMERA CRÍTICA (Respuesta Educativa): Explica con calma: 'En realidad, los estudios muestran que los niños con más contacto/respuesta desarrollan apego seguro y se vuelven MÁS independientes, no menos. La OMS recomienda lo que estoy haciendo'. Compartes artículo/libro si parecen receptivos.",
                    "SEGUNDA CRÍTICA DE LA MISMA PERSONA (Límite Suave): 'Ya hablamos de esto. Es mi decisión como madre/padre. Respeto que opines diferente, pero no voy a cambiar mi crianza'. Tono firme pero educado. Cambias de tema.",
                    "TERCERA CRÍTICA O MÁS (Límite Firme): 'Ya te pedí que no comentaras sobre mi crianza. Si sigues haciéndolo, me/nos voy/vamos'. Y cumples. Te vas o cortas la visita. O la próxima vez no vas. Es límite necesario.",
                    "CRÍTICAS EN PÚBLICO (desconocidos): Generalmente ignorar es mejor opción. No debes educación a desconocidos. Si insisten: 'Mi hijo y yo estamos bien, gracias'. Y sigues tu camino. NO te enzarces en discusión con extraños.",
                    "PROTEGER A TU HIJO: Si las críticas son delante del niño ('ese niño está malcriado'), protege: 'No hables así de mi hijo'. Los niños internalizan lo que oyen. Protegerlo de etiquetas negativas es crucial.",
                    "REDUCIR CONTACTO CON TÓXICOS: Si una persona (familiar o no) critica CONSTANTEMENTE a pesar de límites, es válido distanciarte. No es obligación tolerar toxicidad. Relaciones sanas respetan decisiones parentales."
                ],
                commonObstacles: [
                    Obstacle(
                        obstacle: "Son mis padres/suegros, no puedo 'echarlos' de mi vida",
                        solution: "No necesitas 'echarlos'. Pero SÍ puedes limitar contacto. Visitas más cortas, menos frecuentes, en lugares neutrales (no tu casa donde critican tu crianza). Límites claros: 'Si critican cómo crío, nos vamos'. Relación puede continuar CON límites. Carlos González valida distanciarte de familia tóxica."
                    ),
                    Obstacle(
                        obstacle: "Empiezo a dudar si realmente estoy haciendo bien",
                        solution: "NORMAL dudar bajo presión constante. SOLUCIONES: (1) Releer Bésame Mucho (reafirma), (2) Unirte a grupo de apego (validación de pares), (3) Observar a tu hijo: ¿Está feliz? ¿Sano? ¿Con vínculo fuerte contigo? Si SÍ, estás haciendo BIEN (independiente de críticas externas), (4) Recordar: La ciencia respalda crianza con apego, no la autoritaria."
                    ),
                    Obstacle(
                        obstacle: "Mi pareja empieza a ceder a las críticas ('quizá tienen razón')",
                        solution: "Conversación de pareja urgente. Lean Bésame Mucho JUNTOS. Acordar: ¿Estamos de acuerdo en esta crianza? Si SÍ, presentar frente unido ante familia. Si pareja duda, es problema de pareja a resolver (quizá terapia de pareja). NO cambiar crianza solo para complacer a familia extendida."
                    )
                ],
                bookQuotes: [
                    "Es imposible malcriar con amor. El amor nunca sobra, nunca estorba, nunca daña.",
                    "Los niños 'malcriados' con amor se convierten en adultos seguros y felices. Los privados de amor se convierten en adultos inseguros con problemas emocionales.",
                    "No tienes que justificar tu crianza ante nadie. Es tu hijo, tu decisión informada.",
                    "Proteger tu crianza de críticas tóxicas es proteger la salud emocional de tu hijo y la tuya."
                ],
                ageRange: "0-6 años",
                category: .limits
            ),
            
            // SITUACIÓN 12: Manejo de Celos entre Hermanos
            BM5Situation(
                number: 12,
                title: "Aplicación Práctica: Manejo de Celos del Hermano",
                context: "Tienes segundo bebé, el mayor muestra celos intensos. Necesitas plan concreto de aplicación diaria de lo que enseña el libro.",
                preparation: [
                    "ENTENDER QUE SON NORMALES: Los celos son AMOR ('te quiero tanto que no quiero compartirte'). No son problema de conducta, son emoción válida.",
                    "PREPARAR TIEMPO INDIVIDUAL: Antes de que nazca el bebé, pensar: ¿Quién cuidará al bebé 30 min diarios para que yo esté SOLO con el mayor?",
                    "PREPARAR AL MAYOR (antes del nacimiento): Hablar honestamente: 'Vendrá un bebé. Va a necesitar mucho a mamá/papá. Pero SIEMPRE habrá tiempo para ti. Te amo igual que siempre'.",
                    "PLANEAR PARTICIPACIÓN: Qué tareas simples puede hacer el mayor para sentirse incluido (traer pañal, cantar al bebé)."
                ],
                implementationSteps: [
                    "PRIMEROS DÍAS CON BEBÉ: Cuando llegues a casa del hospital, que OTRA PERSONA traiga al bebé. Tú abres brazos al mayor PRIMERO. Abrazo largo. 'Te extrañé tanto'. Luego presentas al bebé: 'Mira a tu hermanito, te estaba esperando'.",
                    "ATENCIÓN INDIVIDUAL DIARIA (NO NEGOCIABLE): 30-60 minutos SOLO para el mayor. Sin el bebé presente (pareja/abuela lo cuida). Hacen juntos lo que el mayor quiera. Jugar, leer, pasear, hablar. Atención PLENA. Este tiempo es SAGRADO, no se cancela.",
                    "VALIDACIÓN DE CELOS: Cuando muestre celos (llanto, agresión, regresión): 'Es difícil compartir a mamá, ¿verdad? Te entiendo'. NUNCA 'No seas celoso', 'Ya eres grande'. Los celos son válidos. Validarlos no los intensifica, los ayuda a procesar.",
                    "INVOLUCRAR EN CUIDADOS: Tareas apropiadas: 'Tráeme un pañal', 'Cántale mientras lo cambio', 'Ayúdame a elegir su ropa'. Elogiar: 'Eres un hermano mayor increíble, el bebé tiene suerte'. Se siente útil, no reemplazado.",
                    "PROTEGER AL BEBÉ SIN CASTIGAR AL MAYOR: Si pega al bebé: Detener (bloquear físicamente), decir 'No voy a dejar que lastimes a tu hermano', redirigir ('Si estás enfadado, pega esta almohada, no al bebé'). NO castigar (el niño ya se siente mal, castigar empeora). Supervisión cercana primeros meses.",
                    "REFORZAR AMOR: Decir diariamente: 'Te amo igual que siempre', 'Hay amor para ambos', 'Eres especial e insustituible'. El mayor necesita escuchar esto frecuentemente. Los celos disminuyen cuando se siente seguro del amor parental."
                ],
                commonObstacles: [
                    Obstacle(
                        obstacle: "No tengo 30 minutos diarios solo para el mayor, estoy agotada con el bebé",
                        solution: "Entiende que esos 30 min son INVERSIÓN que previene problemas mayores. Los celos no atendidos generan conductas problemáticas (agresión, regresiones) que consumirán MÁS tiempo. SOLUCIONES: (1) Pareja cuida al bebé esos 30 min, (2) Pedir a abuela/alguien que cuide al bebé, (3) Durante siesta del bebé (atención al mayor), (4) Reducir otras tareas, priorizar este tiempo."
                    ),
                    Obstacle(
                        obstacle: "El mayor pega/pellizca al bebé cuando no miro",
                        solution: "NUNCA dejar solos inicialmente (primeros 6 meses). Supervisión constante. Cuando veas señal de agresión: Intervenir ANTES de que pase. Redirigir. Si ya pegó: Detener, validar emoción ('Estás enfadado'), proteger al bebé, NO castigar al mayor. La solución es MÁS atención al mayor, no más castigos."
                    ),
                    Obstacle(
                        obstacle: "Regresiones (pipí encima, pide biberón, habla como bebé)",
                        solution: "NORMALES. Es forma de decir 'también cuídame como bebé'. RESPONDE a la necesidad: Dale biberón si pide (aunque ya no use), déjalo en pañal si regresa, permítele 'ser bebé' temporalmente. NO regañes ('ya eres grande'). Las regresiones PASAN cuando el niño se siente seguro. Forzar madurez intensifica la regresión."
                    )
                ],
                bookQuotes: [
                    "Los celos son normales, sanos y una muestra de amor. No son problema de conducta, son emoción que necesita validación.",
                    "Los celos se curan con amor y atención individual, no con castigos.",
                    "Es imposible que un niño NO tenga celos cuando nace un hermano. Lo raro sería no tenerlos. Significa que no le importas.",
                    "El hermano mayor necesita MÁS atención tras nacimiento del bebé, no menos. Parece contradictorio (el bebé necesita mucho) pero es crucial para resolver los celos."
                ],
                ageRange: "3-6 años (edad del mayor)",
                category: .limits
            )
        ]
    }
}

