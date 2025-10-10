import SwiftUI

// MARK: - SITUACIONES 13-15 extras para completar
extension BM5View {
    var situationsPart4: [BM5Situation] {
        [
            // SITUACIÓN EXTRA 1: Destete Respetuoso en Práctica
            BM5Situation(
                number: 13,
                title: "Destete Respetuoso Natural (Guía Práctica)",
                context: "Tú y tu hijo habéis decidido que es momento de destetar (o uno de los dos lo siente). Necesitas guía para hacerlo gradual y respetuosamente según el libro.",
                preparation: [
                    "VERIFICAR QUE AMBOS ESTÉIS PREPARADOS: Señales del niño: Pide menos frecuentemente, acepta otras formas de consuelo, come bien sólidos, puede expresarse verbalmente. Señales tuyas: Embarazo, medicación necesaria, o simplemente sientes que es momento. Si SOLO uno está listo, esperar es mejor.",
                    "SIN FECHA LÍMITE: No pongas fecha fija ('al cumplir 2 años lo dejo'). El destete es proceso, no evento. Puede llevar semanas o meses.",
                    "PREPARAR ALTERNATIVAS DE CONSUELO: Más abrazos, más tiempo de juego, más canciones, más cuentos. El niño necesitará otras formas de consuelo.",
                    "APOYO DE PAREJA: Explicar el plan. Pedir ayuda (la pareja puede ofrecer consuelo cuando el niño pida pecho)."
                ],
                implementationSteps: [
                    "SEMANAS 1-2: ELIMINAR UNA TOMA (la menos importante para el niño): Identifica cuál toma le importa menos (usualmente alguna de mediodía). Cuando llegue esa hora, ofrece alternativa (snack, juego, salir a pasear). Si insiste mucho, dale pecho (aún no está listo de eliminar esa). Si acepta alternativa, esa toma se eliminó.",
                    "SEMANAS 3-4: ELIMINAR SEGUNDA TOMA: Espera que la primera esté bien establecida (no pide esa toma hace días). Luego elimina otra (la siguiente menos importante). Mismo proceso. Gradual, sin prisa.",
                    "MANTENER TOMAS DE CONSUELO HASTA EL FINAL: Antes de dormir, al despertar, cuando se hace daño. Estas son las últimas en eliminarse porque son las más emocionales (no solo nutritivas).",
                    "SI HAY REGRESIÓN (pide más después de haber reducido): Puede ser enfermedad, cambio estresante, necesidad emocional. RESPONDE. Dale pecho. No es fracaso. Cuando el estrés pase, vuelve a reducir. El destete NO es lineal.",
                    "ÚLTIMAS TOMAS (las más difíciles): La de antes de dormir suele ser la última. Puede que haya semanas con solo esa toma. Está bien. Cuando el niño esté preparado (puede dormirse con canción/cuento en lugar de pecho), esa también se irá.",
                    "FINAL DEL DESTETE: Un día simplemente no pedirá más. O pedirá muy ocasionalmente. Celebra este hito con ambivalencia (alegría por su independencia, nostalgia por etapa que termina). Es NORMAL sentir ambas emociones."
                ],
                commonObstacles: [
                    Obstacle(
                        obstacle: "Tengo mastitis/dolor por reducir tomas",
                        solution: "Vas demasiado rápido. SOLUCIÓN: (1) Ralentiza el destete (elimina una toma cada 2 semanas, no cada semana), (2) Extrae un poco de leche si hay dolor intenso (solo aliviar, no vaciar), (3) Aplica frío después de amamantar (reduce producción), (4) Si mastitis seria, consulta médico + temporalmente aumenta tomas (se resuelve con vaciamiento)."
                    ),
                    Obstacle(
                        obstacle: "El niño llora mucho pidiendo pecho, me siento culpable",
                        solution: "Si llora MUCHO (inconsolable, desesperado), es que NO está preparado. La solución es PAUSAR el destete. Volver a dar más frecuentemente. Esperar 1-2 meses más. El destete debe ser gradual y sin trauma. Si el niño sufre intensamente, es señal de ir más despacio o esperar."
                    ),
                    Obstacle(
                        obstacle: "Después de semanas sin pedir, de repente vuelve a pedir constantemente",
                        solution: "NORMAL ante estrés (enfermedad, viaje, cambio). Se llama regresión temporal. RESPONDE. Dale pecho sin cuestionarte. Es su forma de buscar seguridad ante algo difícil. Cuando el estrés pase, volverá a pedir menos. Las regresiones son parte del destete natural."
                    )
                ],
                bookQuotes: [
                    "El destete debe ser cuando AMBOS estéis preparados. Ni antes ni después. Es decisión de la díada madre-hijo, no de la familia, pediatra o sociedad.",
                    "El destete forzado (por presión externa) es violento e innecesario. Puede causar trauma emocional en el niño y mastitis en la madre.",
                    "El destete gradual puede llevar meses. No es proceso de 3 días. Es reducción paulatina que respeta emociones de ambos.",
                    "Algunos niños se destetan naturalmente a los 2 años, otros a los 4, otros a los 7. TODO ese rango es normal y saludable."
                ],
                ageRange: "2-4 años",
                category: .feeding
            ),
            
            // SITUACIÓN EXTRA 2: Validación Emocional Diaria
            BM5Situation(
                number: 14,
                title: "Validación Emocional: Aplicación Diaria",
                context: "Quieres aplicar validación emocional consistentemente pero no sabes cómo en el día a día real. Necesitas protocolo concreto para diferentes emociones.",
                preparation: [
                    "VOCABULARIO EMOCIONAL: Aprende palabras de emociones (más allá de feliz/triste): frustrado, decepcionado, enfadado, asustado, nervioso, emocionado, orgulloso, avergonzado. Cuanto más rico tu vocabulario, mejor puedes ayudar al niño a nombrar.",
                    "ELIMINAR FRASES INVALIDANTES: Identificar y borrar de tu lenguaje: 'No llores', 'No pasa nada', 'No es para tanto', 'Los niños grandes no...', 'Deja de llorar'. Todas invalidan.",
                    "PRACTICAR EMPATÍA: Ejercicio mental: Cuando el niño está muy enfadado por algo que TE parece insignificante, recuerda que para ÉL es enorme. Tu galleta rota puede ser su tragedia. Valida su experiencia, no tu perspectiva adulta.",
                    "MODELAR TUS EMOCIONES: Nombra tus propias emociones frente al niño: 'Mamá está cansada', 'Papá se siente frustrado'. Le enseñas vocabulario emocional y que las emociones son normales."
                ],
                implementationSteps: [
                    "ANTE LLANTO/TRISTEZA: (1) Agacharte a su nivel, (2) 'Veo que estás triste' (nombrar), (3) 'Es ok estar triste' (validar), (4) '¿Quieres un abrazo?' (ofrecer consuelo), (5) Acompañar sin intentar 'alegrar' inmediatamente. El niño tiene derecho a estar triste. Permitir el desahogo.",
                    "ANTE ENFADO/RABIETA: (1) 'Estás muy enfadado' (nombrar), (2) 'Entiendo, es frustrante cuando...' (empatía), (3) 'Puedes estar enfadado' (permiso), (4) 'Estoy aquí contigo' (acompañamiento), (5) NO buscar solución mientras está en pico emocional. Primero calma, luego conversación.",
                    "ANTE MIEDO: (1) 'Te asustaste' (nombrar), (2) 'Los miedos son normales' (normalizar), (3) 'Estás seguro conmigo' (reasegurar), (4) Abrazar si lo permite, (5) NO minimizar el miedo ('eso no da miedo'). Para él SÍ da miedo. Respeta su experiencia.",
                    "ANTE CELOS/ENVIDIA: (1) 'Quisieras tener lo que tiene X' (nombrar deseo), (2) 'Es difícil cuando otros tienen cosas que tú quieres' (validar), (3) 'Te entiendo' (empatía), (4) NO dar inmediatamente lo que quiere (si no es apropiado), pero SÍ validar el deseo ('Sí, sería bonito tener eso').",
                    "ANTE FRUSTRACIÓN: (1) 'No te sale como quieres' (identificar), (2) 'Frustra cuando no podemos hacer algo' (empatía), (3) '¿Quieres que te ayude o quieres intentarlo de nuevo?' (ofrecer apoyo), (4) Permitir frustración (aprende a tolerar emociones difíciles), NO hacer todo por él.",
                    "DESPUÉS DE LA EMOCIÓN: Cuando esté calmado: '¿Cómo te sientes ahora?', 'Fue difícil, ¿verdad?'. Ayúdale a reflexionar. Enseñas que las emociones vienen y van, que sobrevivir emociones intensas es posible."
                ],
                commonObstacles: [
                    Obstacle(
                        obstacle: "Se enfada por cosas insignificantes (galleta partida, vaso equivocado)",
                        solution: "Para TI es insignificante. Para ÉL es real. Los niños pequeños viven el presente intensamente. Una galleta rota puede arruinar su momento. NO minimices ('es solo una galleta'). Valida ('Querías la galleta entera, te entiendo. Es decepcionante'). Puede sonar exagerado pero NO lo es para él. Validar no significa dar otra galleta, significa reconocer su emoción."
                    ),
                    Obstacle(
                        obstacle: "Llora por todo, todo el día. ¿Es normal?",
                        solution: "2-4 años lloran mucho (regulación emocional inmadura). Si llora POR TODO: (1) Evaluar: ¿Duerme suficiente? ¿Come bien? ¿Tiene suficiente atención tuya? (2) Causas comunes: sueño insuficiente, hambre, necesidad de más conexión. (3) Validar cada llanto (aunque sean 20 al día). (4) Si es excesivo y no mejora, consultar (puede haber problema: oído, reflujo, ansiedad)."
                    ),
                    Obstacle(
                        obstacle: "Me cuesta validar cuando yo causé la emoción (le negué algo)",
                        solution: "Puedes validar emoción Y mantener límite. 'Entiendo que estés enfadado porque no te dejé X (validación) Y no voy a cambiar mi decisión (límite)'. No son incompatibles. El niño puede estar enfadado contigo Y tú puedes acompañar su enfado. No necesitas ceder para validar."
                    )
                ],
                bookQuotes: [
                    "Todas las emociones del niño son válidas, incluso las que nos incomodan. No hay emociones buenas y malas, solo emociones.",
                    "Decir 'no llores' es como decir 'no sientas'. Es imposible y es invalidante.",
                    "Los niños cuyas emociones son validadas desarrollan inteligencia emocional. Los que son invalidados aprenden a reprimir (nocivo).",
                    "Validar una emoción no significa ceder a la demanda. Significa reconocer que la emoción es real y aceptable."
                ],
                ageRange: "2-6 años",
                category: .limits
            ),
            
            // SITUACIÓN EXTRA 3: Defender Tu Crianza en Acción
            BM5Situation(
                number: 15,
                title: "Defender Tu Crianza: Casos Prácticos",
                context: "Te enfrentas a críticas en diferentes contextos (familia, médicos, extraños). Necesitas respuestas específicas para cada tipo de crítico según el libro.",
                preparation: [
                    "CONOCER TUS DATOS: OMS recomienda lactancia 2+ años. Apego seguro tiene respaldo científico total. Colecho seguro reduce muerte súbita. Control esfínteres: 2-4 años es rango normal. Tener claros tus datos.",
                    "DECIDIR TU NIVEL DE ENERGÍA: No tienes que educar a TODOS. A veces ignorar es válido. A veces límite firme es necesario. Depende del contexto y tu energía del día.",
                    "PREPARAR A LA PAREJA: Presentar frente unido. Si la pareja no respalda, resolver eso primero (es prioritario).",
                    "IDENTIFICAR BATALLAS QUE VALEN LA PENA: Crítica del pediatra → Vale la pena educar o cambiar de médico. Crítica de desconocido en parque → Probablemente no vale tu energía."
                ],
                implementationSteps: [
                    "CRÍTICA DEL PEDIATRA: 'Quitale el pecho ya', 'Déjalo llorar para que aprenda': OPCIÓN A - Cuestionar: '¿En qué evidencia científica se basa esa recomendación? Porque la OMS dice lo contrario'. OPCIÓN B - Buscar otro pediatra actualizado. OPCIÓN C - Ignorar esa recomendación específica, seguir tus instintos. No todo lo que dice un médico es correcto.",
                    "CRÍTICA DE ABUELOS: 'Lo estás malcriando': PRIMERA VEZ - Educativa: 'Los estudios actuales muestran que...' (compartes info). SEGUNDA VEZ - Límite suave: 'Respeto tu opinión pero es mi decisión'. TERCERA VEZ - Límite firme: 'Te pedí que no comentaras esto. Si sigues, nos vamos'. CUARTA VEZ - Reducir visitas. Tu salud mental es prioridad.",
                    "CRÍTICA EN PÚBLICO (desconocidos): 'Ese niño necesita nalgadas', 'Qué malcriado': MEJOR OPCIÓN - Ignorar completamente (no debes nada a extraños). OPCIÓN 2 - Respuesta breve: 'Gracias por tu opinión' (sarcasmo suave) y seguir. OPCIÓN 3 - Pregunta retórica: '¿Tú le pegas a tus hijos?' (pone incómodo al crítico). Elige según tu paciencia del momento.",
                    "CRÍTICA DE 'EXPERTOS' (maestros, enfermeras): 'Su hijo debería ya...': Respuesta: 'Cada niño tiene su ritmo. Mi hijo está bien. Gracias por tu preocupación'. Si insisten: 'Es decisión médica con nuestro pediatra' (aunque sea mentira, corta la conversación). No debes explicaciones a cada 'experto' que opina.",
                    "CUANDO LA CRÍTICA ES DELANTE DEL NIÑO: Prioridad es proteger al niño de etiquetas ('malcriado', 'mimado', 'manipulador'). Respuesta firme inmediata: 'No hables así de mi hijo'. Luego retirarse o pedir a la persona que se vaya. El niño internaliza lo que oye. Protegerlo es urgente.",
                    "AUTOCUIDADO POST-CRÍTICA: Las críticas duelen aunque sepas que estás bien. Después: (1) Desahogarte con pareja/amigas pro-apego, (2) Releer Bésame Mucho (reafirmar), (3) Observar a tu hijo feliz (confirmación visual de que estás bien), (4) Recordar: Estás del lado correcto de la ciencia."
                ],
                commonObstacles: [
                    Obstacle(
                        obstacle: "Me afectan emocionalmente, aunque sepa que están equivocados",
                        solution: "NORMAL. Las críticas duelen, especialmente de familia. NO significa que seas débil. Significa que eres humana. SOLUCIONES: (1) Límitar contacto con críticos persistentes, (2) Rodearte de apoyos (grupos de apego), (3) Terapia si las críticas te generan ansiedad/depresión, (4) Recordar: Proteger tu paz mental es proteger a tu hijo."
                    ),
                    Obstacle(
                        obstacle: "Cada reunión familiar es batalla campal sobre mi crianza",
                        solution: "OPCIONES: (1) Dejar de asistir temporalmente ('Volveremos cuando respeten nuestras decisiones'), (2) Visitas más cortas (1 hora, no 4 horas de críticas), (3) Lugares neutrales (restaurante, no casa familiar donde se sienten dueños), (4) Límite previo: 'Vamos con condición de que no se hable de crianza. Si se habla, nos vamos'. Y cumplir."
                    ),
                    Obstacle(
                        obstacle: "Empiezo a ceder a las críticas (cambiar mi crianza) aunque no quiero",
                        solution: "SEÑAL DE ALERTA. Necesitas MÁS apoyo urgentemente. (1) Grupo de apego (validación semanal), (2) Pareja que te respalde ACTIVAMENTE, (3) Releer libro completo (reconexión con convicción), (4) Terapia si es necesario. Cambiar una crianza que funciona por presión social es renunciar a tus valores. Es importante no llegar ahí."
                    )
                ],
                bookQuotes: [
                    "No necesitas convencer a tu familia de que tu crianza es correcta. Solo necesitas que respeten que es TU decisión.",
                    "Proteger tu crianza de críticas constantes no es ser grosero, es proteger la salud emocional de tu hijo.",
                    "Si rodearte de tu familia te hace dudar de una crianza que está funcionando, el problema no es tu crianza, es tu familia.",
                    "Es preferible distancia de familia tóxica que proximidad que daña tu confianza y tu crianza."
                ],
                ageRange: "0-6 años",
                category: .limits
            )
        ]
    }
}

