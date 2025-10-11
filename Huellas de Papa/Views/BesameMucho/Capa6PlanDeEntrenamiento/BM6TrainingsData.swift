import SwiftUI

// MARK: - ENTRENAMIENTOS 1-5
extension BM6View {
    var trainingsPart1: [BM6Training] {
        [
            // ENTRENAMIENTO 1: Maestría en Colecho Seguro
            BM6Training(
                number: 1,
                title: "Maestría en Colecho Seguro",
                whatYouTrain: "Dormir con tu bebé de forma segura, efectiva y beneficiosa para todos. Aprenderás a preparar el espacio, manejar objeciones de la pareja, responder a críticas familiares y hacer del colecho una práctica exitosa a largo plazo.",
                duration: "2-4 semanas de práctica",
                difficulty: .beginner,
                modules: [
                    TrainingModule(
                        title: "Preparación de Espacio Seguro",
                        description: "Checklist completa de seguridad según el libro: colchón firme, sin almohadas cerca del bebé, posicionamiento correcto (bebé entre madre y pared), temperatura adecuada, verificación de condiciones (sin alcohol, tabaco, drogas). Preparación física del espacio antes de la primera noche."
                    ),
                    TrainingModule(
                        title: "Primera Noche - Qué Esperar",
                        description: "Cómo será la primera noche: posiblemente el bebé se mueva mucho (normal), tú dormirás en sueño ligero (conciencia del bebé), puede haber patadas. Lactancia acostada: posiciones cómodas, evitar dormirte mientras amamantas (si es riesgo). Expectativas realistas."
                    ),
                    TrainingModule(
                        title: "Primera Semana - Ajustes Necesarios",
                        description: "Ajustes comunes: necesidad de cama más grande, reposicionar al bebé si rueda, ajustar temperatura/ropa, encontrar tu posición más cómoda. Comunicación con la pareja sobre incomodidades. Soluciones creativas (cama más grande, colchón en el suelo)."
                    ),
                    TrainingModule(
                        title: "Solución de Problemas Comunes",
                        description: "Pareja se queja de patadas → Soluciones del libro. Bebé se mueve demasiado → Opciones. Miedo de aplastar → Datos de seguridad. Familia critica → Respuestas preparadas. No descansas igual → Evaluar si es temporal o necesitas ajustes."
                    ),
                    TrainingModule(
                        title: "Colecho a Largo Plazo",
                        description: "Mantenimiento del colecho meses/años: ajustes según edad del niño, manejo de segundo hijo (todos en la cama o soluciones), intimidad de pareja (otros momentos/lugares), respuesta a 'ya es muy grande'. El colecho puede durar años (2-7) - es normal."
                    ),
                    TrainingModule(
                        title: "Transición Cuando Esté Listo",
                        description: "Señales de que está preparado para dormir solo (4-7 años generalmente): acepta quedarse en su cama, no llora desesperadamente, puede consolarse. Proceso gradual si está listo. Aceptación si NO está listo (volver al colecho sin culpa)."
                    )
                ],
                practicalExercises: [
                    "Preparar cama según checklist de seguridad del libro (verificar cada punto)",
                    "Practicar lactancia acostada durante el día (antes de hacerlo de noche)",
                    "Registro de horas dormidas: Semana ANTES de colecho vs. Semana DESPUÉS (comparar)",
                    "Escribir plan de respuesta a 5 críticas familiares comunes",
                    "Conversación con pareja: expectativas, incomodidades posibles, compromiso",
                    "Foto del espacio preparado (verificar visualmente la seguridad)"
                ],
                evaluation: [
                    "¿Descansas MÁS que antes del colecho? (incluso si no es perfecto, ¿es mejor?)",
                    "¿El bebé llora menos de noche? (comparar con noches en cuna)",
                    "¿La lactancia nocturna es más fácil? (menos veces que te levantas)",
                    "¿Tu pareja está adaptándose? (o necesitas más ajustes/conversación)",
                    "¿Te sientes segura de la seguridad del colecho? (o necesitas más info)",
                    "¿Has defendido exitosamente el colecho ante al menos una crítica?"
                ],
                bookResources: [
                    "Capítulo 'Por qué no quieren dormir solos' - Fundamento biológico del colecho",
                    "Sección 'El colecho en la práctica' - Guía detallada de implementación",
                    "Sección 'Los peligros del colecho' (desmintiendo mitos) - Datos de seguridad",
                    "Sección 'El colecho no produce insomnio' - Evidencia científica",
                    "Apartado '¿A qué edad dormirá solo?' - Expectativas realistas de independencia"
                ],
                category: .sleep
            ),
            
            // ENTRENAMIENTO 2: Lactancia a Demanda Total
            BM6Training(
                number: 2,
                title: "Lactancia a Demanda Total",
                whatYouTrain: "Amamantar completamente a demanda, eliminando horarios, conteos y restricciones. Aprenderás a confiar en las señales de tu bebé, establecer producción óptima, manejar brotes de crecimiento y defender la lactancia a demanda ante profesionales que sugieren horarios.",
                duration: "1 mes de establecimiento",
                difficulty: .beginner,
                modules: [
                    TrainingModule(
                        title: "Eliminar Reloj y Horarios Mentales",
                        description: "Primer paso crucial: Quitar relojes de donde amamantas. Desaprender hábito de mirar la hora. Eliminar horarios mentales ('ya tocaba', 'aún no toca'). Confiar en señales del bebé, no en tiempo transcurrido. Mindset: El bebé sabe cuándo necesita mamar."
                    ),
                    TrainingModule(
                        title: "Reconocer Señales de Hambre Tempranas",
                        description: "Aprender a reconocer señales ANTES del llanto: reflejo de búsqueda (busca con boca), succión de manos, movimiento de cabeza, sonidos, agitación. Responder a estas señales previene llanto. Práctica: Observar al bebé, identificar SUS señales específicas (cada bebé es ligeramente diferente)."
                    ),
                    TrainingModule(
                        title: "Lactancia en Diferentes Posiciones",
                        description: "Dominar posiciones variadas: Cuna (clásica), Acostada (para noche y descanso), Rugby (útil para gemelos o mastitis), Caballito (bebés con reflujo). Cada posición tiene ventajas. Práctica hace perfección. Comodidad crucial para lactancia prolongada exitosa."
                    ),
                    TrainingModule(
                        title: "Manejo de Brotes de Crecimiento",
                        description: "Qué son: momentos donde bebé pide CONSTANTEMENTE (semanas 3, 6, 12, 18). Duran 2-3 días. Bebé está pidiendo más producción. NO significa que te quedaste sin leche. Manejo: Amamantar sin parar esos días. NO introducir fórmula. Después el bebé espaciará de nuevo. Tu cuerpo producirá más."
                    ),
                    TrainingModule(
                        title: "Lactancia Nocturna Sin Restricciones",
                        description: "NUNCA eliminar tomas de noche (aunque 'expertos' lo sugieran tras 6 meses). Tomas nocturnas mantienen producción (prolactina más alta de noche). Bebé necesita alimento/consuelo de noche. Práctica: Colecho + amamantar acostada = ambos descansan. No es 'mal hábito', es biología."
                    ),
                    TrainingModule(
                        title: "Defensa ante Profesionales que Sugieren Horarios",
                        description: "Respuesta a pediatra/enfermera que da horarios: Opción A - Cuestionar con evidencia ('La OMS recomienda a demanda, ¿en qué se basa su recomendación?'). Opción B - Ignorar esa recomendación específica. Opción C - Buscar profesional actualizado. No todo lo que dice un médico es correcto."
                    )
                ],
                practicalExercises: [
                    "Día completo sin mirar reloj mientras amamantas (nota cómo te sientes)",
                    "Lista de señales de hambre que identificaste en TU bebé",
                    "Practicar 3 posiciones diferentes de lactancia (cuna, acostada, rugby)",
                    "Registro de frecuencia real de tomas (sin juzgar, solo observar)",
                    "Durante brote: Registro de 'maratón de lactancia' (2-3 días seguidos)",
                    "Preparar respuesta escrita para pediatra si sugiere horarios"
                ],
                evaluation: [
                    "¿El bebé está satisfecho? (no busca más después de soltar el pecho)",
                    "¿Ganancia de peso adecuada? (control médico confirma)",
                    "¿Tu producción es suficiente? (bebé orina 6+ veces al día)",
                    "¿Menos estrés que con horarios? (o más relajada)",
                    "¿Confianza en señales del bebé aumentó?",
                    "¿Lograste responder/ignorar al menos 1 comentario sobre horarios?"
                ],
                bookResources: [
                    "Sección 'Mamar por la noche' - Importancia de tomas nocturnas",
                    "Capítulo contra horarios rígidos - Crítica a 'cada 3 horas'",
                    "Apartado 'Brotes de crecimiento' (aunque no use ese término, describe el fenómeno)",
                    "Sección sobre 'usar el pecho como chupete' - Validación de succión no nutritiva",
                    "Datos sobre producción por oferta-demanda"
                ],
                category: .feeding
            ),
            
            // ENTRENAMIENTO 3: Experto en Porteo
            BM6Training(
                number: 3,
                title: "Experto en Porteo Constante",
                whatYouTrain: "Llevar a tu bebé en portabebés de forma ergonómica, segura y constante. Aprenderás a portear durante horas, hacer tareas domésticas porteando, amamantar en portabebés y responder a críticas sobre 'malcriar con brazos'.",
                duration: "2 semanas de adaptación",
                difficulty: .intermediate,
                modules: [
                    TrainingModule(
                        title: "Elegir Portabebés Correcto para Tu Bebé",
                        description: "Según edad: 0-3 meses (fular elástico), 3-6 meses (fular rígido o bandolera), 6+ meses (mochila ergonómica). Características ergonómicas: soporte de rodilla a rodilla, posición ranita, espalda respetada. EVITAR: mochilas colgantes, portabebés no ergonómicos. Inversión importante: elige calidad."
                    ),
                    TrainingModule(
                        title: "Posición Ergonómica Perfecta - Verificación",
                        description: "Checklist TICKS (en inglés pero útil): T (Tight/apretado pero cómodo), I (In view/cara visible siempre), C (Close enough to kiss/altura de beso), K (Keep chin off chest/barbilla separada del pecho), S (Supported back/espalda apoyada). Posición ranita: piernas en M. Verificar CADA vez."
                    ),
                    TrainingModule(
                        title: "Porteo Durante Tareas Domésticas",
                        description: "Actividades seguras porteando: lavar platos, doblar ropa, barrer, pasear, compras. Actividades a evitar: cocinar con fuego directo (salpicaduras), usar cuchillos grandes. Práctica: Aumentar gradualmente complejidad de tareas. Objetivo: 4-6 horas diarias porteando."
                    ),
                    TrainingModule(
                        title: "Amamantar en Portabebés",
                        description: "Técnica avanzada: Aflojar portabebés un poco, acercar bebé al pecho (puede requerir ajustar tiras), bebé mama, luego reajustar posición. Útil en exteriores, mientras caminas, en público discretamente. Requiere práctica pero es liberador cuando lo dominas."
                    ),
                    TrainingModule(
                        title: "Porteo en Exteriores y Público",
                        description: "Salir de casa con bebé en portabebés: Paseos largos (bebés aman el movimiento), compras (bebé contento, tú con manos libres), visitas (bebé tranquilo en contacto). Ignorar miradas curiosas/críticas. Portear es NORMAL en todo el mundo. Normalízalo."
                    ),
                    TrainingModule(
                        title: "Respuesta a 'Lo Vas a Malcriar con Brazos'",
                        description: "Preparar respuestas: 'Los bebés están diseñados para ser portados', 'Es biología, no malcriar', 'Todos bajan cuando están listos'. Datos del libro: primates portadores, reflejo de agarre, necesidad biológica. Establecer límites si las críticas persisten."
                    )
                ],
                practicalExercises: [
                    "Foto/video de ti porteando (verificar posición con checklist TICKS)",
                    "Objetivo: 4 horas diarias en portabebés durante semana 1",
                    "Lista de tareas domésticas que lograste hacer porteando",
                    "Practicar amamantar en portabebés (en casa primero, luego fuera)",
                    "Paseo de 1 hora mínimo porteando (observar reacción del bebé)",
                    "Usar frase del libro ante al menos 1 crítica sobre porteo"
                ],
                evaluation: [
                    "¿El bebé llora significativamente menos cuando lo porteas?",
                    "¿Lograste hacer más tareas con manos libres?",
                    "¿Te duele la espalda? (si sí, revisar ajuste/cambiar portabebés)",
                    "¿Dominaste amamantar en portabebés? (o necesitas más práctica)",
                    "¿Portear se siente natural o aún incómodo?",
                    "¿Tu confianza en portear en público aumentó?"
                ],
                bookResources: [
                    "Capítulo 'Por qué siempre quieren brazos' - Fundamento biológico",
                    "Sección sobre primates portadores y reflejo de agarre",
                    "Apartado sobre 'malcriar con brazos' (desmintiendo el mito)",
                    "Datos sobre beneficios del contacto constante",
                    "Explicación de por qué el porteo reduce llanto"
                ],
                category: .contact
            ),
            
            // ENTRENAMIENTO 4: Respuesta Inmediata al Llanto
            BM6Training(
                number: 4,
                title: "Respuesta Inmediata al Llanto",
                whatYouTrain: "Acudir siempre y rápido cuando el bebé llora, eliminando dudas sobre 'malcriar'. Aprenderás a identificar tipos de llanto, técnicas de consuelo efectivas, respuesta en diferentes contextos y manejo de tu propio agotamiento para sostener la respuesta.",
                duration: "2 semanas de práctica consciente",
                difficulty: .beginner,
                modules: [
                    TrainingModule(
                        title: "Eliminar Culpa de 'Malcriar por Responder'",
                        description: "Trabajo mental crucial: Responder al llanto NO malcría, crea apego seguro. Bebés respondidos lloran MENOS (no más) a largo plazo. Bebés no 'manipulan' (imposible neurológicamente). Releer secciones del libro que validan respuesta. Cambio de mindset: De 'lo voy a malcriar' a 'estoy creando seguridad'."
                    ),
                    TrainingModule(
                        title: "Identificar Tipos de Llanto",
                        description: "Hambre: rítmico, insistente, busca con boca. Sueño: quejumbroso, bostezos, frota ojos. Malestar: agudo, repentino, diferente. Contacto: se calma inmediatamente al cogerlo. Aburrimiento: gimoteo, se calma con cambio escenario. Práctica: Con tiempo reconocerás el llanto de TU bebé específicamente."
                    ),
                    TrainingModule(
                        title: "Técnicas de Consuelo Efectivas",
                        description: "Arsenal de técnicas: (1) Coger en brazos (siempre primero), (2) Pecho (aunque no tenga hambre, consuela), (3) Contacto piel con piel (muy poderoso), (4) Mecimiento (movimiento calma), (5) Voz suave (tu voz es consuelo), (6) Caminar con él, (7) Cantar. Practicar todas, identificar cuáles funcionan mejor con TU bebé."
                    ),
                    TrainingModule(
                        title: "Respuesta en Diferentes Contextos",
                        description: "En casa: acudir en segundos. En la calle: parar lo que hagas (compras, caminata), atender al bebé primero. De noche: responder sin demora (colecho facilita esto). Durante visitas: Priorizar bebé sobre cortesía social (si llora, sales a atenderlo). Tu bebé es prioridad en TODO contexto."
                    ),
                    TrainingModule(
                        title: "Manejo del Agotamiento Parental",
                        description: "Responder constantemente agota. Estrategias de sostenibilidad: (1) Turnos con pareja (horas/días alternos), (2) Pedir ayuda con TODO lo demás (limpieza, comida, compras), (3) Siesta cuando bebé duerme (OBLIGATORIO), (4) Red de apoyo (alguien cuide al bebé 2h mientras descansas), (5) Recordar: es etapa TEMPORAL."
                    ),
                    TrainingModule(
                        title: "Respuesta a 'Déjalo Llorar que Aprenderá'",
                        description: "Preparar respuestas firmes: 'Los bebés no aprenden, se resignan', 'El llanto es comunicación, no manipulación', 'No voy a abandonar a mi bebé llorando'. Datos del libro: Dejar llorar genera cortisol tóxico, daña apego, no enseña nada útil. Límite firme con quienes sugieren ignorar llanto."
                    )
                ],
                practicalExercises: [
                    "Cronometrar tiempo de respuesta durante un día (meta: menos de 30 segundos)",
                    "Registro de tipos de llanto: ¿Identificaste hambre/sueño/contacto correctamente?",
                    "Practicar las 7 técnicas de consuelo (probar todas, ver cuáles funcionan mejor)",
                    "Responder al llanto en contexto 'incómodo' (calle, visita) - practicar priorizar al bebé",
                    "Plan de autocuidado escrito: ¿Quién te ayudará? ¿Cuándo descansarás?",
                    "Usar frase del libro ante alguien que sugiere 'dejarlo llorar'"
                ],
                evaluation: [
                    "¿El bebé llora menos frecuentemente que antes? (paradoja: respuesta reduce llanto)",
                    "¿El bebé se calma más rápido cuando respondes?",
                    "¿Tu confianza en responder aumentó? (menos dudas sobre 'malcriar')",
                    "¿Identificas tipos de llanto más fácilmente?",
                    "¿Tienes plan de autocuidado funcionando? (o estás agotada sin solución)",
                    "¿Lograste establecer límite con al menos 1 persona que sugiere ignorar llanto?"
                ],
                bookResources: [
                    "Capítulo completo sobre el llanto como comunicación",
                    "Sección 'El llanto terapéutico' (crítica a dejar llorar)",
                    "Apartado sobre cortisol y estrés tóxico en bebés ignorados",
                    "Datos sobre bebés que aprenden vs. se resignan",
                    "Sección 'La respuesta a la separación' - Por qué lloran cuando te vas"
                ],
                category: .communication
            ),
            
            // ENTRENAMIENTO 5: Maestría en Límites sin Violencia
            BM6Training(
                number: 5,
                title: "Maestría en Límites sin Violencia",
                whatYouTrain: "Poner límites claros, firmes y consistentes sin usar castigos físicos ni emocionales. Aprenderás a detener conductas inaceptables, explicar con calma, redirigir efectivamente y mantener límites bajo presión sin recurrir a gritos, bofetadas o amenazas.",
                duration: "3 semanas de práctica intensiva",
                difficulty: .advanced,
                modules: [
                    TrainingModule(
                        title: "Diferencia Fundamental: Límite vs Castigo",
                        description: "LÍMITE = Detener conducta inaceptable ('No se pega'). CASTIGO = Añadir consecuencia punitiva ('Como pegaste, no hay parque'). Los límites son necesarios. Los castigos NO. Puedes educar perfectamente solo con límites. Entender esta diferencia es fundamental para crianza sin violencia."
                    ),
                    TrainingModule(
                        title: "Frases Efectivas para Límites Respetuosos",
                        description: "Banco de frases: 'Eso no se puede, pero puedes...', 'Entiendo que quieras X, Y no es seguro/posible', 'Veo que estás enfadado, Y no voy a permitir que...', 'No puedes pegar, pero puedes decir con palabras'. Practicar hasta que salgan naturalmente. El 'Y' valida emoción + mantiene límite."
                    ),
                    TrainingModule(
                        title: "Redirigir en Lugar de Solo Prohibir",
                        description: "Siempre ofrecer alternativa aceptable: 'No puedes tirar comida, pero puedes jugar con estos juguetes', 'No puedes correr aquí, pero puedes caminar rápido o correr afuera', 'No puedes pegar, pero puedes pegar esta almohada'. Redirigir enseña, prohibir solo frustra."
                    ),
                    TrainingModule(
                        title: "Mantener Calma Bajo Presión",
                        description: "Cuando el niño hace algo grave/peligroso, la adrenalina nos hace gritar. Técnicas: Respiración profunda ANTES de actuar (3 respiraciones), auto-recordatorio ('puedo ser firme sin gritar'), detener conducta físicamente pero con calma, explicar DESPUÉS (cuando ambos estén calmados). Práctica hace la diferencia."
                    ),
                    TrainingModule(
                        title: "Consecuencias Naturales vs Castigos Arbitrarios",
                        description: "Consecuencia NATURAL (cuando sea seguro): No abrigo → Siente frío (aprende). Rompe juguete → No tiene juguete. Consecuencia ARBITRARIA (castigo): Pegó → No hay TV (no hay relación lógica). Las naturales enseñan causa-efecto. Los arbitrarios solo enseñan 'me castigarán'. Usa naturales siempre que sea seguro."
                    ),
                    TrainingModule(
                        title: "Reparación Cuando Pierdes la Calma",
                        description: "Todos perdemos la calma a veces. Modelo de reparación: (1) Calmarte, (2) Disculparte ('Perdón por gritar'), (3) Explicar ('Estaba muy preocupada/enfadada'), (4) Modelar ('Gritar no está bien, voy a intentar hablar con calma'), (5) Reconectar (abrazo). Enseñas que los errores se reparan."
                    )
                ],
                practicalExercises: [
                    "Identificar 5 límites importantes de tu familia (escribirlos claramente)",
                    "Practicar frente al espejo: Frases de límites con voz tranquila pero firme",
                    "Registro de 1 semana: Situaciones donde pusiste límites sin violencia física/verbal",
                    "Ejercicio de respiración: 3 respiraciones profundas antes de actuar (practicar diario)",
                    "Lista de 10 alternativas de redirección para conductas comunes de tu hijo",
                    "Autoevaluación: ¿Cuántas veces gritaste esta semana? (reducir cada semana)"
                ],
                evaluation: [
                    "¿Menos gritos/amenazas que antes del entrenamiento?",
                    "¿El niño entiende mejor los límites? (menos repeticiones necesarias)",
                    "¿Vínculo intacto? (el niño sigue buscando tu afecto, no te teme)",
                    "¿Logras respirar antes de reaccionar al menos 50% de las veces?",
                    "¿Te disculpas cuando pierdes la calma? (modelar reparación)",
                    "¿Usas redirección en lugar de solo prohibir?"
                ],
                bookResources: [
                    "Capítulo 'Una bofetada a tiempo' - Crítica total al castigo físico",
                    "Sección 'El castigo' - Por qué no funciona y es dañino",
                    "Apartado 'Protegerla y no enmendarla' - Filosofía de límites respetuosos",
                    "Datos sobre efectos del castigo físico/emocional a largo plazo",
                    "Sección sobre disciplina vs. dominación"
                ],
                category: .limits
            ),
            
            // ENTRENAMIENTO 6: Gestión de Rabietas
            BM6Training(
                number: 6,
                title: "Gestión de Rabietas con Validación",
                whatYouTrain: "Acompañar rabietas intensas sin ceder ni castigar. Aprenderás el protocolo de acompañamiento paso a paso, técnicas de autorregulación para mantener TU calma, validación emocional efectiva y prevención mediante atención a necesidades básicas.",
                duration: "2-3 semanas de práctica",
                difficulty: .advanced,
                modules: [
                    TrainingModule(
                        title: "Entender Qué Son las Rabietas - Cerebro Inmaduro",
                        description: "Rabietas = corteza prefrontal inmadura (no pueden regular emociones). NORMALES 2-5 años. NO son manipulación, NO son mala educación, NO se pueden evitar completamente. Son desarrollo neurológico normal. El niño LITERALMENTE no puede controlarse. Aceptar esto elimina frustración parental."
                    ),
                    TrainingModule(
                        title: "Protocolo de Acompañamiento Paso a Paso",
                        description: "FASE 1 (inicio): Validar emoción ('Estás muy enfadado'). FASE 2 (escalada): Mantener calma, agacharte a su nivel, presencia cercana. FASE 3 (pico): Ofrecer contacto si acepta, respetar si rechaza. FASE 4 (descenso): Acercarse más, abrazo. FASE 5 (post-rabieta): Hablar cuando esté calmado. NO castigar la rabieta."
                    ),
                    TrainingModule(
                        title: "Mantener Límite Sin Castigar Emoción",
                        description: "Validación + Límite juntos: 'Entiendo que estés enfadado porque querías X (validación) Y no vamos a comprarlo (límite)'. La rabieta es respuesta emocional al límite. El límite se mantiene. La emoción se valida. No son incompatibles. Puedes ser firme Y empática simultáneamente."
                    ),
                    TrainingModule(
                        title: "Autorregulación Parental Durante Rabieta",
                        description: "Las rabietas te alterarán (gritos del niño activan tu sistema nervioso). Técnicas: Respiración profunda (4-7-8: inhala 4, sostén 7, exhala 8), auto-recordatorio ('es su cerebro inmaduro, no es contra mí'), enfoque en ser el adulto regulado (tu calma lo ayuda a calmarse). Práctica diaria."
                    ),
                    TrainingModule(
                        title: "Post-Rabieta: Reconexión Emocional",
                        description: "Cuando la rabieta pasa: No sermonear, no castigar, no decir 'ya ves'. En su lugar: 'Fue difícil, ¿verdad?', abrazo si lo acepta, volver a conectar. Luego (cuando esté totalmente calmado) ENTONCES explicar límite si es necesario. Reconexión antes que corrección."
                    ),
                    TrainingModule(
                        title: "Prevención: Necesidades Básicas Cubiertas",
                        description: "Rabietas aumentan si: Hambre (asegurar comidas frecuentes), sueño insuficiente (respetar siestas), poca atención (tiempo de calidad diario), demasiadas negativas (evaluar: ¿digo 'no' a todo?). Prevención: necesidades básicas cubiertas reduce frecuencia/intensidad de rabietas."
                    )
                ],
                practicalExercises: [
                    "Practicar respiración 4-7-8 diariamente (10 veces) hasta que sea automático",
                    "Escribir frases de validación (memorizar hasta que salgan naturalmente)",
                    "Registro de rabietas: Desencadenante, tu respuesta, duración, cómo terminó",
                    "Identificar patrones: ¿Hay hambre/sueño de fondo en las rabietas?",
                    "Grabarte en video acompañando rabieta (autoevaluación de tu calma)",
                    "Post-rabieta: Practicar reconexión antes de cualquier explicación"
                ],
                evaluation: [
                    "¿Las rabietas son menos intensas que antes? (validación reduce intensidad)",
                    "¿Son más cortas? (tu calma ayuda a que se calme más rápido)",
                    "¿Tu calma mejoró durante rabietas? (menos gritos/pérdidas de control)",
                    "¿El niño busca tu consuelo durante rabieta? (señal de apego seguro)",
                    "¿Identificaste y corregiste algún patrón? (hambre/sueño como causas)",
                    "¿Menos culpa post-rabieta? (entiendes que son normales, no fallo tuyo)"
                ],
                bookResources: [
                    "Sección sobre rabietas como parte del desarrollo normal",
                    "Apartado sobre cerebro inmaduro (corteza prefrontal en desarrollo)",
                    "Crítica a castigar rabietas (enseña represión, no regulación)",
                    "Datos sobre validación emocional efectiva",
                    "Sección sobre límites firmes con respeto"
                ],
                category: .limits
            ),
            
            // ENTRENAMIENTO 7: Defensa ante Presión Social
            BM6Training(
                number: 7,
                title: "Defensa ante Presión Social",
                whatYouTrain: "Defender tu crianza con apego ante críticas constantes de familia, profesionales y sociedad. Aprenderás a preparar respuestas basadas en el libro, establecer límites en 3 niveles de firmeza, proteger a tu hijo de etiquetas negativas y construir red de apoyo que te sostenga.",
                duration: "Continuo (siempre útil)",
                difficulty: .intermediate,
                modules: [
                    TrainingModule(
                        title: "Preparar Respuestas Según el Libro",
                        description: "Para cada crítica común, respuesta del libro: 'Lo malcrías' → 'Es imposible malcriar con amor, el libro lo explica'. 'Nunca será independiente' → 'Los niños con más apego son MÁS independientes'. 'Usa el pecho como chupete' → 'El chupete imita el pecho, no al revés'. Memorizar 10 respuestas clave."
                    ),
                    TrainingModule(
                        title: "3 Niveles de Límites con Críticos",
                        description: "NIVEL 1 (educativa, primera vez): Explicar con datos. NIVEL 2 (límite suave, segunda vez): 'Es mi decisión, no voy a discutirla'. NIVEL 3 (límite firme, tercera vez+): 'Te pedí que no comentaras. Si sigues, nos vamos'. Escalar según necesidad. Practicar los 3 niveles."
                    ),
                    TrainingModule(
                        title: "Cuándo Educar vs Cuándo Ignorar",
                        description: "NO es obligación educar a todos. Evaluar: (1) ¿Es persona cercana que verás frecuentemente? → Vale la pena educar. (2) ¿Desconocido que no volverás a ver? → Ignorar. (3) ¿Parece receptivo? → Educar. (4) ¿Totalmente cerrado? → Límite sin explicación. Conservar tu energía para batallas que importan."
                    ),
                    TrainingModule(
                        title: "Proteger a Tu Hijo de Etiquetas Negativas",
                        description: "Si critican DELANTE del niño ('ese niño está malcriado/mimado/manipulador'): Prioridad urgente es protegerlo. Respuesta inmediata y firme: 'No hables así de mi hijo'. Luego retirarse o pedir a la persona que se vaya. Los niños internalizan etiquetas. Protegerlo de esto es no negociable."
                    ),
                    TrainingModule(
                        title: "Reducir Contacto con Tóxicos Persistentes",
                        description: "Si una persona critica CONSTANTEMENTE a pesar de límites claros: Es válido distanciarte (aunque sea familia). Visitas más cortas, menos frecuentes, lugares neutrales, o dejar de visitarlos temporalmente. No es grosería, es proteger tu salud mental y tu crianza. Relaciones sanas respetan límites."
                    ),
                    TrainingModule(
                        title: "Fortalecer Red de Apoyo Pro-Apego",
                        description: "Buscar activamente: Grupos de crianza con apego (local/online), La Liga de la Leche, foros/redes de lactancia prolongada, amigas con filosofía similar. Rodearte de validación positiva es crucial cuando hay presión externa. No estar sola contra todos."
                    )
                ],
                practicalExercises: [
                    "Escribir 10 respuestas preparadas (memorizar las más útiles)",
                    "Practicar frente al espejo los 3 niveles de límites (tono, postura, palabras)",
                    "Identificar personas en tu vida: Educables / Tóxicas / Ignorables",
                    "Buscar y unirte a AL MENOS 1 grupo de apoyo (online es válido)",
                    "Role-play con pareja: Ella critica, tú practicas respuestas",
                    "Plan de acción para familiar más tóxico: ¿Límites? ¿Distancia? ¿Qué harás?"
                ],
                evaluation: [
                    "¿Las críticas te afectan menos emocionalmente?",
                    "¿Lograste establecer límite firme con al menos 1 persona?",
                    "¿Usaste los 3 niveles apropiadamente? (escalar cuando fue necesario)",
                    "¿Protegiste a tu hijo de alguna etiqueta negativa?",
                    "¿Encontraste al menos 1 fuente de apoyo pro-apego?",
                    "¿Tu confianza en tu crianza aumentó a pesar de críticas?"
                ],
                bookResources: [
                    "Secciones sobre presión social y familiar",
                    "Apartado sobre 'el último tabú' - Crianza con apego en sociedad occidental",
                    "Datos de OMS y evidencia científica (para argumentar)",
                    "Sección sobre confiar en tu instinto vs. consejos externos",
                    "Epílogo del libro sobre recordar que lo importante son tus hijos, no las críticas"
                ],
                category: .externalPressure
            ),
            
            // ENTRENAMIENTO 8: Control de Esfínteres Respetuoso
            BM6Training(
                number: 8,
                title: "Control de Esfínteres Respetuoso",
                whatYouTrain: "Acompañar el proceso de control de esfínteres sin presión, fuerza ni estrés. Aprenderás a observar señales de madurez, ofrecer sin obligar, manejar accidentes con neutralidad, resistir presión de colegios/familia y mantener paciencia durante meses de proceso.",
                duration: "3-6 meses (proceso largo)",
                difficulty: .intermediate,
                modules: [
                    TrainingModule(
                        title: "Observar Señales de Madurez sin Presionar",
                        description: "Señales que SÍ está listo: (1) Permanece seco 2+ horas, (2) Avisa cuando está mojado, (3) Muestra interés en el baño, (4) Puede subir/bajar pantalones, (5) Entiende instrucciones. Si NO tiene TODAS → NO está listo. Observación sin presión durante meses si es necesario."
                    ),
                    TrainingModule(
                        title: "Ofrecer sin Obligar - Respeto Total",
                        description: "Poner orinal accesible. Ofrecer en momentos clave ('¿Quieres intentar en el orinal?'). Si dice NO → Respetar sin insistir. Si dice SÍ → Genial, pero sin presión de que 'ahora siempre'. Proceso irregular (a veces sí, a veces no). TODO es normal."
                    ),
                    TrainingModule(
                        title: "Aceptar Accidentes Sin Drama",
                        description: "Habrá MUCHOS accidentes (durante meses). Respuesta SIEMPRE: Tono neutral, 'Te hiciste pipí, te cambio', limpiar sin drama, sin regaños, sin 'te dije que...'. El niño YA se siente mal por el accidente. Añadir vergüenza empeora. Neutralidad total enseña que los accidentes son parte del aprendizaje."
                    ),
                    TrainingModule(
                        title: "Resistir Presión Externa (Colegio/Familia)",
                        description: "Colegio exige control → Opciones: Pedir excepción, buscar otro colegio, esperar un año. Familia compara ('el primo ya...') → Respuesta: 'Cada niño tiene su tiempo'. Pediatra presiona → '¿Muestra señales de madurez?' Si no, no forzar. Tu hijo es prioridad sobre instituciones/opiniones."
                    ),
                    TrainingModule(
                        title: "Paciencia con Regresiones",
                        description: "Regresiones (volver a accidentes después de semanas controlando) son NORMALES. Causas: Hermano nuevo, mudanza, colegio, enfermedad, estrés. Respuesta: NO presionar más, DAR más apoyo emocional, quizá volver al pañal temporalmente. Regresión pasará cuando estrés pase."
                    ),
                    TrainingModule(
                        title: "Celebrar Sin Presionar",
                        description: "Cuando usa el orinal: Celebrar sin exagerar ('¡Lo hiciste! ¿Viste?') pero sin presión ('Ahora siempre aquí'). Balance entre reconocer logro Y permitir proceso irregular. No crear expectativa de que 'ya está' después de un solo éxito."
                    )
                ],
                practicalExercises: [
                    "Checklist de señales de madurez (observar diariamente, no presionar)",
                    "Comprar orinal (que el niño elija - le da control) y ponerlo accesible",
                    "Practicar tono neutral ante accidentes (aunque tengas que limpiar por 5ta vez)",
                    "Escribir respuesta preparada para colegio que presiona",
                    "Registro de 2 semanas: Accidentes (cuántos), ofrecimientos (cuántos), usos exitosos (cuántos)",
                    "Plan si hay regresión: ¿Qué harás? (volver al pañal sin drama)"
                ],
                evaluation: [
                    "¿El proceso es sin estrés para el niño? (no llora, no ansiedad visible)",
                    "¿Sin estrés para ti? (o estás ansiosa/presionando sin darte cuenta)",
                    "¿Logras mantener tono neutral ante accidentes?",
                    "¿Has resistido al menos 1 presión externa? (colegio/familia)",
                    "¿Aceptas que puede llevar MESES? (o esperas resultados rápidos)",
                    "¿Celebras logros sin crear presión de repetición?"
                ],
                bookResources: [
                    "Capítulo completo 'El control de esfínteres'",
                    "Sección 'Cuándo y cómo quitar los pañales'",
                    "Datos sobre madurez neurológica (no se puede acelerar)",
                    "Crítica a métodos de 'entrenamiento en 3 días'",
                    "Apartado sobre problemas causados por forzar (infecciones, estreñimiento)"
                ],
                category: .limits
            )
        ]
    }
}

