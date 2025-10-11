import SwiftUI

// MARK: - ENTRENAMIENTOS 9-10
extension BM6View {
    var trainingsPart2: [BM6Training] {
        [
            // ENTRENAMIENTO 9: Lactancia Prolongada bajo Presión
            BM6Training(
                number: 9,
                title: "Lactancia Prolongada bajo Presión",
                whatYouTrain: "Mantener lactancia 2-4+ años ante críticas intensas de familia y sociedad. Aprenderás datos científicos para argumentar, respuestas a comentarios típicos, estrategias para no amamantar a escondidas, conexión con grupos de lactancia prolongada y preparación para destete natural cuando llegue.",
                duration: "Continuo (mientras amamantes)",
                difficulty: .advanced,
                modules: [
                    TrainingModule(
                        title: "Datos de la OMS y Argumentos Científicos",
                        description: "Memorizar: OMS recomienda lactancia MÍNIMO 2 años. A los 2-4 años es NORMAL y SALUDABLE. Beneficios a esta edad: Inmunológicos (sigue protegiendo), nutricionales (sigue siendo nutritiva), emocionales (vínculo, consuelo), desarrollo maxilofacial. La leche NO pierde propiedades. Estos datos son tu armadura ante críticas."
                    ),
                    TrainingModule(
                        title: "Respuestas a Comentarios Típicos",
                        description: "'Ya es muy grande' → 'La OMS dice mínimo 2 años, estamos en lo recomendado'. 'Se va a quedar pegado' → 'Todos se destetan, no hay adultos amamantándose'. 'Ya no alimenta' → 'Sigue siendo nutritiva e inmunológica'. 'Es casi incesto' → 'Esa es tu proyección inapropiada'. Practicar hasta que salgan automáticamente."
                    ),
                    TrainingModule(
                        title: "No Amamantar a Escondidas - Normalizar",
                        description: "Amamantar abiertamente (no esconderte en baños). Normalizar frente a tu hijo (que no sienta vergüenza). Si la familia critica: Responder o retirarte, pero NO esconder. Mensaje para el niño: La lactancia es normal y hermosa, no algo vergonzoso. Normalizar es educativo."
                    ),
                    TrainingModule(
                        title: "Grupos de Lactancia Prolongada",
                        description: "Buscar activamente: La Liga de la Leche (reuniones locales), grupos de Facebook de lactancia prolongada, foros pro-apego. Rodearte de madres que TAMBIÉN amamantan a 2-4 años es validación poderosa. No estás sola. Es más común de lo que parece (solo que muchas lo esconden)."
                    ),
                    TrainingModule(
                        title: "Manejo de Comentarios en Público",
                        description: "Desconocido comenta en parque/calle: Opción A (ideal) - Ignorar completamente. Opción B - Respuesta breve: 'Es recomendado por la OMS'. Opción C - Pregunta retórica: '¿Por qué te importa?'. Elegir según tu energía. No debes educación a extraños. Prioriza tu paz mental."
                    ),
                    TrainingModule(
                        title: "Preparar Destete Natural (Cuando Llegue)",
                        description: "Eventualmente llegará el destete (2-7 años generalmente). Señales: Niño pide menos, acepta otras formas de consuelo, está listo emocionalmente. TÚ también estás lista. Proceso gradual del libro: Reducir toma a toma, mantener las de consuelo hasta el final, sin trauma para ninguno."
                    )
                ],
                practicalExercises: [
                    "Memorizar 3 datos clave de OMS/beneficios (poder decirlos sin pensar)",
                    "Preparar 10 respuestas a comentarios comunes (escribirlas, memorizarlas)",
                    "Buscar y unirte a 1 grupo de lactancia prolongada (online es válido)",
                    "Amamantar en lugar público sin esconderte (parque, cafetería) - practicar normalizar",
                    "Responder a AL MENOS 1 crítica con datos del libro (practicar defender)",
                    "Reflexión escrita: ¿Hasta cuándo quieres amamantar TÚ? (sin presión externa)"
                ],
                evaluation: [
                    "¿Las críticas disminuyeron en frecuencia? (familia aprende a respetar)",
                    "¿Te afectan menos emocionalmente? (más segura de tu decisión)",
                    "¿Encontraste grupo de apoyo que te valida?",
                    "¿Amamantas en público sin vergüenza?",
                    "¿Lograste defender exitosamente al menos 1 vez?",
                    "¿Tu hijo NO siente vergüenza sobre lactancia? (la has normalizado para él)"
                ],
                bookResources: [
                    "Capítulo sobre lactancia prolongada completo",
                    "Datos sobre beneficios a 2-4+ años",
                    "Sección '¿Hasta cuándo?' - Edades naturales de destete",
                    "Crítica a presión social para destetar temprano",
                    "Apartado sobre destete natural vs. forzado"
                ],
                category: .feeding
            ),
            
            // ENTRENAMIENTO 10: Crianza sin Comparaciones
            BM6Training(
                number: 10,
                title: "Crianza sin Comparaciones",
                whatYouTrain: "Eliminar comparaciones automáticas con otros niños (hermanos, primos, amigos). Aprenderás a respetar el ritmo único de tu hijo, celebrar logros individuales sin presionar, ignorar comentarios sobre 'retrasos' y confiar plenamente en el desarrollo natural de tu hijo.",
                duration: "4 semanas de desaprendizaje",
                difficulty: .intermediate,
                modules: [
                    TrainingModule(
                        title: "Eliminar Comparaciones Mentales Automáticas",
                        description: "Identificar pensamientos comparativos: 'El hijo de X ya...', 'Su hermano a esta edad...', 'Todos los niños de su edad...'. DETENERLOS conscientemente. Reemplazar con: 'Mi hijo tiene su propio ritmo', 'Cada niño es único'. Requiere vigilancia mental constante primeras semanas."
                    ),
                    TrainingModule(
                        title: "Rangos Normales de Desarrollo (Son AMPLIOS)",
                        description: "Aprender rangos reales (no promedio): Caminar 9-18 meses (TODO ese rango es normal), Hablar 12-36 meses, Controlar esfínteres 2-4 años, Dejar pecho 1-7 años. El RANGO es amplísimo. Tu hijo en CUALQUIER punto del rango está bien. No hay 'atraso' dentro del rango."
                    ),
                    TrainingModule(
                        title: "Celebrar Logros Individuales sin Presión",
                        description: "Cuando logra algo: Celebrar el logro en sí ('¡Caminaste!'), NO comparar ('Al fin, tu primo ya caminaba hace meses'). Celebración sin presión implícita. Enfoque en su progreso individual, no en timing respecto a otros. Mensaje: 'Estoy orgulloso de TI, de TU logro'."
                    ),
                    TrainingModule(
                        title: "Ignorar Comentarios Comparativos",
                        description: "'¿Todavía no camina/habla/controla?' → Respuesta: 'Cada niño tiene su tiempo, está bien'. 'El mío ya...' → 'Qué bien por él. El mío también llegará cuando esté listo'. '¿No te preocupa que...?' → 'No, confío en su desarrollo'. Respuestas tranquilas, sin defensividad. Tu calma desarma al comparador."
                    ),
                    TrainingModule(
                        title: "Confianza en el Ritmo de Tu Hijo",
                        description: "Ejercicio de confianza: Observar TODO lo que tu hijo SÍ hace (no enfocarte en lo que no). Lista de sus fortalezas, intereses, logros únicos. Cada niño tiene su perfil. Confiar que su desarrollo sigue su curso natural. Intervenir solo si hay verdadera preocupación médica (no avanza en NADA), no por timing."
                    ),
                    TrainingModule(
                        title: "Respuesta a 'Ya Debería...'",
                        description: "'Ya debería caminar/hablar/dejar el pañal/el pecho...' → Respuesta según el libro: 'Dentro del rango normal de desarrollo. Está bien'. No justificar, no dar explicaciones largas. Simple afirmación de que está dentro de lo normal. Si insisten: 'El pediatra dice que está bien' (cierra conversación)."
                    )
                ],
                practicalExercises: [
                    "Identificar tus comparaciones automáticas (llevar registro 3 días: ¿Cuántas veces comparaste?)",
                    "Práctica de detención de pensamiento: Cuando comparas → ALTO → Reemplazar con 'tiene su ritmo'",
                    "Lista de 20 cosas únicas/especiales de tu hijo (no relacionadas con hitos de desarrollo)",
                    "Practicar respuestas a comentarios comparativos (con pareja o frente a espejo)",
                    "Investigar rangos normales reales (Wikipedia, fuentes médicas serias - sorprenderte de lo amplios que son)",
                    "Evitar conscientemente conversaciones sobre hitos de desarrollo durante 1 semana"
                ],
                evaluation: [
                    "¿Tus comparaciones mentales disminuyeron? (menos pensamientos comparativos)",
                    "¿Sientes menos ansiedad sobre el desarrollo de tu hijo?",
                    "¿Disfrutas más de tu hijo? (sin estar constantemente evaluando si 'va bien')",
                    "¿Lograste ignorar al menos 3 comentarios comparativos con calma?",
                    "¿Confianza en el ritmo de tu hijo aumentó?",
                    "¿Puedes listar logros únicos de tu hijo sin compararlos?"
                ],
                bookResources: [
                    "Sección '¿Y ahora por qué no camina?' - Sobre respetar ritmos",
                    "Apartado sobre desarrollo individual vs. normas rígidas",
                    "Sección 'Su hijo es buena persona' - Enfoque en cualidades, no en hitos",
                    "Datos sobre rangos normales amplios de desarrollo",
                    "Crítica a la competitividad en crianza ('mi hijo antes que el tuyo')"
                ],
                category: .externalPressure
            ),
            
            // ENTRENAMIENTO ADICIONAL 1: Validación Emocional Constante
            BM6Training(
                number: 11,
                title: "Validación Emocional Constante",
                whatYouTrain: "Validar TODAS las emociones de tu hijo sin minimizar, negar o juzgar. Aprenderás vocabulario emocional rico, técnicas de validación efectiva, cómo acompañar emociones intensas sin 'arreglarlas' y permitir que tu hijo sienta plenamente.",
                duration: "3 semanas de práctica diaria",
                difficulty: .intermediate,
                modules: [
                    TrainingModule(
                        title: "Vocabulario Emocional Rico",
                        description: "Más allá de feliz/triste/enfadado: Frustrado, decepcionado, nervioso, emocionado, asustado, avergonzado, orgulloso, celoso, confundido, abrumado. Nombrar específicamente ayuda al niño a identificar y gestionar. Práctica: Usar 1 palabra nueva cada día hasta que sea natural."
                    ),
                    TrainingModule(
                        title: "Frases Validantes vs. Invalidantes",
                        description: "INVALIDANTES (eliminar): 'No llores', 'No pasa nada', 'No es para tanto', 'Ya no estés triste', 'Los grandes no lloran'. VALIDANTES (usar): 'Veo que estás X', 'Es normal sentirse así', 'Puedes estar X', 'Entiendo que sea difícil'. Reemplazo consciente de frases."
                    ),
                    TrainingModule(
                        title: "Acompañar Sin 'Arreglar' Inmediatamente",
                        description: "Instinto adulto: Querer solucionar/alegrar rápido. Error: El niño necesita SENTIR primero. Protocolo correcto: (1) Validar, (2) Acompañar, (3) Permitir desahogo, (4) DESPUÉS (cuando esté calmado) buscar solución si hay. No todas las emociones necesitan solución. A veces solo necesitan ser sentidas."
                    ),
                    TrainingModule(
                        title: "Permitir Emociones 'Negativas'",
                        description: "No hay emociones malas. Tristeza, enfado, celos, miedo - TODO es válido. No intentar 'animarlo' cuando está triste. Permitir la tristeza. No distraer del enfado. Acompañar el miedo. Mensaje: 'Todas tus emociones son aceptables'. Niños que pueden sentir plenamente desarrollan inteligencia emocional."
                    ),
                    TrainingModule(
                        title: "Validar Emoción + Mantener Límite",
                        description: "Validación NO significa ceder: 'Entiendo que estés enfadado (validación) Y no vamos a comprar el juguete (límite)'. Ambas cosas simultáneas. El niño puede estar enfadado por tu límite. Tú puedes acompañar su enfado sin cambiar el límite. No son incompatibles."
                    )
                ],
                practicalExercises: [
                    "Lista de 20 palabras emocionales (ampliar vocabulario personal)",
                    "Registro de 1 semana: ¿Cuántas veces validaste? ¿Cuántas invalidaste? (honestidad)",
                    "Practicar: Ante llanto, primero validar (antes de buscar solución)",
                    "Identificar tus frases invalidantes automáticas (las que usas sin pensar)",
                    "Ejercicio de paciencia: Acompañar 1 emoción intensa sin intentar 'arreglarla'",
                    "Modelar tus emociones: Nombrar en voz alta lo que sientes durante 1 semana"
                ],
                evaluation: [
                    "¿Usas vocabulario emocional más rico?",
                    "¿Tus frases invalidantes disminuyeron?",
                    "¿El niño puede nombrar sus emociones? (aprende de ti)",
                    "¿Logras acompañar sin 'arreglar' inmediatamente?",
                    "¿El niño expresa emociones libremente? (no las reprime)",
                    "¿Puedes validar emoción Y mantener límite simultáneamente?"
                ],
                bookResources: [
                    "Secciones sobre validación emocional",
                    "Apartado sobre permitir que los niños sientan",
                    "Crítica a frases como 'no llores' o 'no pasa nada'",
                    "Datos sobre desarrollo de inteligencia emocional",
                    "Sección sobre acompañar vs. reprimir emociones"
                ],
                category: .communication
            ),
            
            // ENTRENAMIENTO ADICIONAL 2: Manejo de Celos entre Hermanos
            BM6Training(
                number: 12,
                title: "Manejo de Celos entre Hermanos",
                whatYouTrain: "Gestionar celos del hermano mayor tras nacimiento de bebé. Aprenderás a validar celos como emoción normal, dar atención individual efectiva, involucrar al mayor en cuidados del bebé, proteger al bebé sin castigar al mayor y manejar regresiones con compasión.",
                duration: "Primeros 3-6 meses críticos",
                difficulty: .advanced,
                modules: [
                    TrainingModule(
                        title: "Entender Celos como Amor (No Problema)",
                        description: "Reframe mental: Celos = 'Te quiero tanto que no quiero compartirte'. NO son problema de conducta, son emoción válida y SANA. Sería raro que NO tuviera celos (significaría que no le importas). Carlos González: Los celos son normales, esperados y se curan con amor, no con castigos."
                    ),
                    TrainingModule(
                        title: "Atención Individual DIARIA (No Negociable)",
                        description: "30-60 minutos SOLO para el mayor. Sin el bebé (pareja/abuela lo cuida). Hacer lo que el mayor quiera. Atención PLENA (sin móvil). Este tiempo es SAGRADO, prioridad máxima. No se cancela. Si no puedes: Pide ayuda para poder. Es inversión que previene problemas."
                    ),
                    TrainingModule(
                        title: "Validación de Celos sin Minimizar",
                        description: "Frases validantes: 'Es difícil compartir a mamá, ¿verdad?', 'Te entiendo, antes era solo tuyo', 'Los celos son normales', 'Siempre hay amor para ti'. NUNCA: 'No seas celoso', 'Ya eres grande', 'Tienes que querer a tu hermano'. Los celos SON normales. Validarlos no los intensifica, ayuda a procesarlos."
                    ),
                    TrainingModule(
                        title: "Involucrar en Cuidados (Sentirse Importante)",
                        description: "Tareas apropiadas para su edad: 'Tráeme un pañal', 'Cántale mientras lo cambio', 'Elige su ropa', 'Ayúdame a bañarlo'. Elogiar: 'Eres hermano mayor increíble', 'El bebé tiene suerte de tenerte'. Se siente útil e importante, no reemplazado. Incluir, no excluir."
                    ),
                    TrainingModule(
                        title: "Proteger al Bebé Sin Castigar al Mayor",
                        description: "Si pega al bebé: (1) Detener físicamente (bloquear), (2) 'No voy a dejar que lastimes a tu hermano', (3) Redirigir ('Si estás enfadado, pega esta almohada'), (4) NO castigar. Supervisión cercana primeros meses. El mayor no necesita castigos, necesita MÁS atención y validación."
                    ),
                    TrainingModule(
                        title: "Manejo de Regresiones con Compasión",
                        description: "Regresiones (pipí encima, hablar como bebé, pedir biberón): NORMALES. Es forma de decir 'cuídame como bebé'. Respuesta: Permitir regresión temporalmente (dale biberón si pide, acepta pipí sin regañar). NO forzar madurez ('ya eres grande'). La regresión PASA cuando se siente seguro del amor."
                    )
                ],
                practicalExercises: [
                    "Planear QUIÉN cuidará al bebé durante atención individual al mayor (crucial)",
                    "Calendario: Marcar 30-60 min diarios para el mayor (cumplir religiosamente)",
                    "Lista de tareas que el mayor puede hacer con el bebé (apropiadas para su edad)",
                    "Practicar frases de validación de celos (decirlas en voz alta hasta naturalizarlas)",
                    "Plan de supervisión: ¿Cómo evitar dejarlos solos primeros meses?",
                    "Aceptación escrita de regresiones: 'Si mi hijo regresa al pañal/biberón, lo aceptaré'"
                ],
                evaluation: [
                    "¿Los celos del mayor disminuyeron en intensidad?",
                    "¿Las agresiones al bebé son menos frecuentes? (supervisión + atención funcionan)",
                    "¿Cumpliste el tiempo individual diario? (o lo cancelaste por 'no tener tiempo')",
                    "¿El mayor se siente incluido? (pide ayudar con el bebé)",
                    "¿Manejaste regresiones sin regañar? (aceptación compasiva)",
                    "¿La relación entre hermanos es positiva? (o hay tensión/resentimiento)"
                ],
                bookResources: [
                    "Capítulo 'Por qué tienen celos' completo",
                    "Sección sobre celos como muestra de amor",
                    "Apartado 'El complejo del padre de Edipo' (contexto psicológico de celos)",
                    "Datos sobre cómo curar celos (amor, no castigos)",
                    "Sección sobre atención individual como solución principal"
                ],
                category: .limits
            )
        ]
    }
}


