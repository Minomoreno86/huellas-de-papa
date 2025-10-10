import SwiftUI

// MARK: - SITUACIONES 1-6 (Parte 1)
extension BM5View {
    var situationsPart1: [BM5Situation] {
        [
            // SITUACIÓN 1: Implementar Colecho por Primera Vez
            BM5Situation(
                number: 1,
                title: "Cómo Implementar el Colecho por Primera Vez",
                context: "Has decidido empezar a dormir con tu bebé después de leer Bésame Mucho. No sabes por dónde empezar y tienes dudas sobre seguridad. Tu familia te ha dicho que es peligroso. Necesitas una guía práctica paso a paso.",
                preparation: [
                    "INFORMARTE SOBRE SEGURIDAD: Lee el capítulo del libro sobre colecho seguro. Conoce las condiciones que lo hacen seguro vs. peligroso.",
                    "PREPARAR LA CAMA: Colchón firme (no blando ni de agua), quitar almohadas grandes cerca de donde dormirá el bebé, quitar edredones pesados (usar mantas livianas), asegurar que no hay espacios donde pueda caer (entre cama y pared).",
                    "CONVERSACIÓN CON LA PAREJA: Explicar por qué quieres intentarlo, leer juntos el capítulo del libro, acordar condiciones de seguridad, hablar sobre expectativas (patadas, menos espacio).",
                    "PREPARAR RESPUESTAS PARA LA FAMILIA: Si preguntan, tener clara tu respuesta basada en el libro. No necesitas justificarte pero puedes educar si quieres.",
                    "VERIFICAR CONDICIONES DE SEGURIDAD: Ninguno fuma, ninguno ha bebido alcohol, ninguno toma medicamentos que den sueño, la habitación no está sobrecalentada."
                ],
                implementationSteps: [
                    "PRIMERA NOCHE - POSICIONAMIENTO: Coloca al bebé entre tú y la pared (NO entre ambos padres inicialmente). Bebé boca arriba siempre. A la altura de tu pecho (altura de beso). Sin almohada cerca de su cabeza. Tu almohada lejos de él. Mantener temperatura adecuada (ni frío ni calor excesivo).",
                    "PRIMERA NOCHE - LACTANCIA: Si el bebé se despierta, amamanta acostada (posición relajada, de lado). No te levantes. Ambos vuelven a dormir. Puede mamar varias veces (es normal). La comodidad mejorará con la práctica.",
                    "PRIMEROS DÍAS - OBSERVACIÓN: Observa cómo duerme el bebé. ¿Está cómodo? ¿Respira bien? ¿La temperatura es adecuada? Ajusta lo necesario. Algunos bebés se mueven mucho (normal), otros duermen quietos.",
                    "PRIMERA SEMANA - AJUSTES: Puede que necesites cama más grande, o colchón en el suelo (si el bebé rueda). Puede que la pareja prefiera dormir en otra cama temporalmente (es válido). Encuentra lo que funcione para TU familia.",
                    "PRIMER MES - ESTABLECIMIENTO: Para el primer mes, el colecho está establecido. Todos duermen mejor (o al menos tú te levantas menos). La lactancia nocturna es más fácil. El bebé llora menos de noche. Has encontrado vuestro ritmo.",
                    "MANEJO DE DESPERTAR del bebé: Cuando se mueve o hace ruiditos, ofrece pecho antes de que llore completamente. Prevenir el llanto es más fácil que calmarlo. Muchos bebés en colecho no lloran de noche (simplemente maman y siguen durmiendo)."
                ],
                commonObstacles: [
                    Obstacle(
                        obstacle: "Mi pareja se queja de las patadas del bebé y de no tener espacio",
                        solution: "SOLUCIÓN SEGÚN EL LIBRO: Es temporal. Buscar cama más grande si es posible. O la pareja puede dormir en otra cama/habitación temporalmente (no es ideal pero es una solución). Hablar: '¿Prefieres que me levante 8 veces por noche?'. El colecho facilita la vida a TODOS, no solo al bebé. Buscar soluciones creativas, no abandonar el colecho por incomodidad."
                    ),
                    Obstacle(
                        obstacle: "Tengo miedo de aplastar al bebé mientras duermo",
                        solution: "SOLUCIÓN SEGÚN EL LIBRO: Las madres que amamantan tienen sueño ligero y conciencia del bebé incluso dormidas (a menos que hayan bebido/drogado). Ponlo entre tú y la pared (no entre ambos padres). Si el miedo es paralizante, practica siestas diurnas primero para ganar confianza. Los datos muestran que el colecho SEGURO (sin alcohol, drogas, tabaco, en cama apropiada) NO aumenta riesgo, lo REDUCE."
                    ),
                    Obstacle(
                        obstacle: "Mi familia dice que es peligroso y lo voy a matar",
                        solution: "SOLUCIÓN SEGÚN EL LIBRO: Explica las condiciones de seguridad. El colecho peligroso es en sofás, con alcohol, con fumadores. El colecho seguro en cama apropiada es MÁS seguro que la cuna. Comparte datos del libro. Si no respetan, establece límite: 'Es nuestra decisión informada'. No necesitas aprobación familiar para criar como consideres mejor."
                    ),
                    Obstacle(
                        obstacle: "El bebé se mueve tanto que nadie descansa",
                        solution: "SOLUCIÓN SEGÚN EL LIBRO: Algunos bebés se mueven mucho (normal). Opciones: Cama más grande, colchón en el suelo (para que no caiga si rueda), o cuna sidecar (pegada a tu cama sin barrotes en medio). El objetivo es que TODOS descansen. Si el colecho no funciona a pesar de ajustes, no es obligatorio. Lo importante es la cercanía y la respuesta, no específicamente estar en la misma superficie."
                    )
                ],
                bookQuotes: [
                    "El colecho es la práctica más común en la humanidad. Las cunas en habitaciones separadas son un invento reciente de los últimos 100 años en países ricos occidentales.",
                    "Los bebés que duermen con sus madres lloran menos de noche porque no se despiertan completamente al sentir la presencia materna cerca.",
                    "El colecho practicado con seguridad (sin alcohol, drogas, tabaco, en cama firme) REDUCE el riesgo de muerte súbita, no lo aumenta.",
                    "Todos los niños eventualmente duermen solos. TODOS. No existe un solo caso de adolescente que duerma con sus padres porque 'nunca salió de la cama'. Es un miedo infundado."
                ],
                ageRange: "0-5 años",
                category: .sleep
            ),
            
            // SITUACIÓN 2: No Quiere Dormir en Su Cama
            BM5Situation(
                number: 2,
                title: "Qué Hacer Cuando No Quiere Dormir en Su Cama",
                context: "Has intentado pasarlo a su propia cama pero cada noche vuelve llorando a la tuya. Te preguntas si estás haciendo algo mal, si deberías ser más firme, o si simplemente aún no está listo.",
                preparation: [
                    "EVALUAR SI ESTÁ REALMENTE LISTO: Señales de que SÍ está preparado: (1) Acepta quedarse en su cama al principio, (2) No llora desesperadamente, (3) Puede consolarse solo, (4) Tiene 4+ años generalmente. Si llora intensamente CADA noche, NO está listo.",
                    "DISTINGUIR PRESIÓN EXTERNA DE NECESIDAD REAL: ¿Quieres que duerma solo porque TÚ sientes que es momento? ¿O porque te presionan? La presión externa NO es razón válida.",
                    "REVISAR TUS EXPECTATIVAS: ¿Por qué quieres que duerma solo? ¿Es necesidad del niño o tuya? ¿Estás dispuesta a respetar si no está listo?",
                    "LEER CAPÍTULO DEL LIBRO: Revisar sección sobre independencia natural y edades esperadas."
                ],
                implementationSteps: [
                    "SEÑALES DE QUE NO ESTÁ LISTO (aceptar y volver al colecho): Si vuelve a tu cama CADA noche, llora intensamente al quedarse solo, tiene pesadillas frecuentes, está pasando cambio difícil (hermano nuevo, mudanza, colegio nuevo) → NO está preparado. La solución es TIEMPO, no firmeza. Volver al colecho sin culpa. Intentar de nuevo en 3-6 meses.",
                    "SI ESTÁ LISTO - TRANSICIÓN GRADUAL: Semana 1-2: Acompáñalo en SU cama hasta que se duerma profundamente. Luego vete. Si se despierta y viene, ACÉPTALO (no lo devuelvas). Semana 3-4: Acompáñalo hasta que esté somnoliento, no profundamente dormido. Si viene de noche, acéptalo. Mes 2-3: Va reduciendo veces que viene. Eventualmente duerme toda la noche solo.",
                    "MANEJAR 'REGRESIONES': Algunos días dormirá solo, otros vendrá a tu cama. Es normal. No es fracaso. Es proceso irregular. Puede haber regresiones durante semanas enteras (enfermedad, cambios). Acéptalo. Volverá al progreso.",
                    "NUNCA CERRAR LA PUERTA O RECHAZARLO: Si viene a tu cama de noche, SIEMPRE acéptalo con amor. 'Bienvenido, ven aquí'. Nunca digas 'Vete a tu cama'. Nunca cierres con llave. Nunca lo hagas sentir rechazado. Si viene cada noche durante meses, es que aún necesita cercanía nocturna.",
                    "PACIENCIA Y CONFIANZA: El proceso puede llevar meses o años. Cada niño es diferente. Algunos duermen solos a los 3 años, otros a los 7. Ambos son NORMALES. No hay prisa. La independencia llegará cuando esté preparado, forzarla la retrasa."
                ],
                commonObstacles: [
                    Obstacle(
                        obstacle: "Lleva 3 meses 'en transición' y sigue viniendo cada noche",
                        solution: "AÚN NO ESTÁ LISTO. No es fracaso tuyo ni suyo. Es que necesita más tiempo. Acepta que volverá a venir y disfruta el colecho unos meses más. Volverás a intentar cuando sea mayor. Carlos González: 'La independencia no se enseña, se consigue. Y se consigue cuando el niño está preparado, no cuando nosotros queremos'."
                    ),
                    Obstacle(
                        obstacle: "Mi pareja dice que ya es muy grande (3 años) para dormir con nosotros",
                        solution: "3 años NO es 'muy grande'. Es edad normal para seguir necesitando cercanía nocturna. Explica a tu pareja: Opción A - Acompañas la transición gradual SI el niño está listo. Opción B - Continúas colecho si el niño NO está listo. NO es opción: Forzarlo o rechazarlo. Si la pareja no entiende, es problema de pareja a resolver, no problema del niño."
                    ),
                    Obstacle(
                        obstacle: "Tiene pesadillas/terrores cada vez que intentamos que duerma solo",
                        solution: "SEÑAL CLARA de que NO está preparado. Las pesadillas son ansiedad manifestada. Vuelve al colecho inmediatamente. El niño te está diciendo (con su síntoma) que aún necesita cercanía nocturna. Respeta el mensaje. Intentar de nuevo en 6 meses o 1 año. No hay prisa. Su salud emocional es más importante que dormir solo a cierta edad."
                    )
                ],
                bookQuotes: [
                    "La independencia se consigue, no se enseña. Y se consigue dando TODO el apego que el niño necesita, no forzando separaciones para las que no está preparado.",
                    "Si tu hijo vuelve cada noche a tu cama, te está diciendo claramente que aún te necesita de noche. Escucha el mensaje.",
                    "Todos los niños eventualmente duermen solos. Ningún adolescente duerme con sus padres. La independencia llegará. Ten paciencia.",
                    "Forzar la independencia no solo no la acelera, sino que la RETRASA. Los niños forzados se vuelven más inseguros y dependientes, no menos."
                ],
                ageRange: "3-7 años",
                category: .sleep
            ),
            
            // SITUACIÓN 3: Despertares Nocturnos Frecuentes
            BM5Situation(
                number: 3,
                title: "Manejo de Despertares Nocturnos Frecuentes",
                context: "Tu hijo se despierta 5-8 veces cada noche. Estás agotada. Te preguntas si es normal, si tiene un problema, o si estás haciendo algo mal. Necesitas validación y estrategias para sobrevivir esta etapa.",
                preparation: [
                    "ACEPTAR QUE ES NORMAL: Los despertares nocturnos son NORMALES hasta los 3-5 años. No es que tu hijo tenga un problema. No es que estés haciendo algo mal. Es biología.",
                    "ELIMINAR EXPECTATIVAS IRREALES: Tu bebé NO debería 'dormir toda la noche' (8-12 horas). Los que lo hacen son minoría. Las amigas que dicen 'mi bebé duerme 12 horas desde los 2 meses' o están mintiendo, o tienen la excepción, o dejaron llorar (trauma).",
                    "PREPARAR TU MENTALIDAD: Vas a estar cansada. Es una etapa dura. Pero es TEMPORAL (aunque parezca eterna). Mejorará con el tiempo, no con métodos. La solución es PACIENCIA, no conductismo.",
                    "ARREGLAR SOPORTE: Necesitarás ayuda diurna. Pareja que ayude con otras tareas. Dormir siesta cuando el bebé duerma (de día). Pedir ayuda con limpieza/comida, no con responder al bebé."
                ],
                implementationSteps: [
                    "PRACTICAR COLECHO SI NO LO HACES: Es LA estrategia que más ayuda. Amamanta acostada. No te levantas. Respondes al bebé en segundos (antes de que llore completamente). Ambos vuelven a dormir más rápido. Transformará tus noches. Si ya haces colecho y aún hay despertares, es simplemente que tu bebé necesita cercanía frecuente (algunos necesitan más que otros).",
                    "RESPUESTA RÁPIDA: Cuando el bebé se mueva/haga ruiditos, responde ANTES de que llore. Ofrece pecho. O simple presencia (mano en su pecho, voz suave 'estoy aquí'). La respuesta rápida previene despertares completos. El bebé vuelve a dormir sin despertar del todo.",
                    "SI NO HAY LACTANCIA - TURNOS CON PAREJA: Una noche tú, una noche pareja. O dividir la noche (tú hasta las 2 AM, pareja después). El bebé puede necesitar agua, abrazo, presencia. Compartan la carga. Ambos descansan más.",
                    "AUTOCUIDADO DIURNO: Duerme cuando el bebé duerme (aunque sea de día). No aproveches su siesta para limpiar/cocinar. DUERME. Tu descanso es prioritario. Pide ayuda con tareas domésticas.",
                    "NO BUSCAR 'SOLUCIONES' CONDUCTISTAS: NO método Duérmete Niño. NO dejar llorar. NO 'enseñar a dormir'. Estas 'soluciones' generan trauma, no resuelven el problema. Los despertares disminuirán NATURALMENTE con edad y madurez cerebral.",
                    "MANTENER PERSPECTIVA: A los 4-5 años la mayoría duerme mejor. Es TEMPORAL. Cada despertar nocturno es una oportunidad de fortalecer vínculo ('estoy aquí cuando me necesitas'). Cuando sea adolescente, recordará que SIEMPRE estuviste ahí."
                ],
                commonObstacles: [
                    Obstacle(
                        obstacle: "Llevo 18 meses sin dormir más de 2 horas seguidas, no puedo más",
                        solution: "Es comprensible sentirse agotada. SOLUCIONES: (1) Colecho si no lo practicas (cambiará todo), (2) Pareja que tome turnos, (3) Ayuda con TODAS las otras tareas (limpieza, comida, todo), (4) Siesta diurna OBLIGATORIA cuando bebé duerme, (5) Grupo de apoyo con otras madres en misma situación (no estás sola). Carlos González valida el agotamiento pero insiste: Los métodos conductistas NO son la solución. Son trauma disfrazado de solución."
                    ),
                    Obstacle(
                        obstacle: "Me dicen que si no lo 'entreno' nunca dormirá bien",
                        solution: "FALSO según el libro. TODOS los niños eventualmente duermen bien. El 'entrenamiento' (dejar llorar) no acelera el proceso, genera trauma. Los despertares disminuyen por MADURACIÓN CEREBRAL, no por entrenamiento. Niños 'entrenados' (dejados llorar) pueden tener problemas de sueño en adolescencia. Niños respondidos eventualmente duermen bien sin traumas."
                    ),
                    Obstacle(
                        obstacle: "Se despierta más desde que empezó guardería/colegio",
                        solution: "NORMAL. El estrés de la separación diurna se manifiesta en mayor necesidad de cercanía nocturna. No es retroceso, es COMPENSACIÓN. El niño necesita 'rellenar' de cercanía de noche lo que perdió de día. La solución NO es menos respuesta, es MÁS cercanía nocturna. Cuando se adapte a la guardería, mejorará (puede llevar meses)."
                    )
                ],
                bookQuotes: [
                    "Los despertares nocturnos son normales hasta los 3-5 años. Los bebés de 4 meses que 'duermen toda la noche' son la excepción, no la norma.",
                    "El sueño no se enseña, es un proceso biológico que madura con el tiempo. Los métodos que prometen 'enseñar a dormir' en realidad enseñan resignación, no sueño.",
                    "Responder a los despertares nocturnos no crea 'malos hábitos'. Crea confianza básica y apego seguro.",
                    "El colecho es la estrategia más efectiva para sobrevivir los despertares nocturnos. Madres en culturas donde se practica reportan que sus bebés 'duermen bien' (porque no lloran, simplemente maman y siguen durmiendo)."
                ],
                ageRange: "0-4 años",
                category: .sleep
            )
        ]
    }
}

