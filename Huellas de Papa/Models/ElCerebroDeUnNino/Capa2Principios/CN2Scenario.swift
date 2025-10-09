import Foundation

/// Escenario clínico que ilustra un principio en acción
struct CN2Scenario: Codable, Identifiable {
    let id: UUID
    let title: String
    let age: String
    let situation: String
    let parentReactionWrong: String      // Reacción que NO integra
    let parentReactionRight: String      // Reacción que SÍ integra
    let brainExplanation: String         // Qué pasa en el cerebro
    let outcome: String                  // Resultado a largo plazo
    let principleApplied: String         // Qué principio se aplicó
    
    init(title: String, age: String, situation: String, parentReactionWrong: String, parentReactionRight: String, brainExplanation: String, outcome: String, principleApplied: String) {
        self.id = UUID()
        self.title = title
        self.age = age
        self.situation = situation
        self.parentReactionWrong = parentReactionWrong
        self.parentReactionRight = parentReactionRight
        self.brainExplanation = brainExplanation
        self.outcome = outcome
        self.principleApplied = principleApplied
    }
}

/// Escenarios clínicos basados en el libro
let cn2Scenarios: [CN2Scenario] = [
    CN2Scenario(
        title: "Batalla nocturna por la hora de dormir",
        age: "5 años",
        situation: "Son las 8:30 PM. Tu hija de 5 años debe irse a dormir pero está llorando y gritando '¡No quiero! ¡Quiero quedarme contigo!' Se aferra a ti y parece aterrorizada. Ha estado así toda la semana.",
        parentReactionWrong: "❌ 'Ya basta de drama. Todos los niños duermen a esta hora. Vete a tu cama ahora o mañana no hay iPad.' (Solo usa lógica/hemisferio izquierdo ignorando el pánico emocional del hemisferio derecho)",
        parentReactionRight: "✅ La abrazas y dices con voz suave: 'No quieres ir a dormir. Algo te da miedo.' (Hemisferio derecho a derecho: tono calmado, contacto, validación). Esperas. Una vez más calmada: 'Cuéntame qué pasa cuando vas a tu cuarto' (Ahora activas hemisferio izquierdo para dar palabras a la emoción).",
        brainExplanation: "El miedo activa el hemisferio derecho emocional. Los niños pequeños no pueden acceder a lógica cuando están en modo emocional. La estrategia 'Connect and Redirect' requiere primero sintonizar con el hemisferio derecho (validación emocional) antes de involucrar el izquierdo (solución lógica). La secuencia importa: derecho primero, izquierdo después.",
        outcome: "Descubres que tiene miedo de sombras en su cuarto. Al nombrar el miedo, reduces su intensidad. Con práctica de conectar antes de redirigir, tu hija aprende a confiar en ti con sus emociones y desarrolla la capacidad de poner palabras a sus sentimientos (integración hemisférica).",
        principleApplied: "Integración Horizontal (Conectar con emoción antes que lógica)"
    ),
    CN2Scenario(
        title: "Mordida en el jardín de niños",
        age: "3 años",
        situation: "La maestra te llama: tu hijo de 3 años mordió a otro niño hoy. Al llegar a casa, quieres hablar con él sobre lo que pasó, pero apenas puede mantenerse quieto. Está corriendo, trepando, inquieto.",
        parentReactionWrong: "❌ '¡Siéntate ahora mismo! Vamos a hablar de por qué morder está MAL.' (Intenta involucrar cerebro superior cuando el cerebro inferior está activado por exceso de energía y posible ansiedad sobre el incidente)",
        parentReactionRight: "✅ 'Veo que tienes mucha energía. Vamos a jugar 10 minutos al parque.' Juegan, corren, saltan. DESPUÉS, cuando está más calmado: 'Cuéntame qué pasó hoy con tu amigo. La maestra dijo que hubo una mordida.' Ahora puede procesar y reflexionar.",
        brainExplanation: "Cuando el cerebro inferior está dominando (inquietud, ansiedad, exceso de energía), el cerebro superior no está disponible para razonamiento o regulación. La estrategia 'Move It or Lose It' enseña que el movimiento físico puede cambiar el estado cerebral. Primero mueve para calmar el cerebro inferior, LUEGO involucra el cerebro superior para reflexión y aprendizaje.",
        outcome: "Después del movimiento, su cerebro superior está online. Puede hablar sobre lo que pasó, considerar cómo se sintió el otro niño, y pensar en alternativas. Aprende que el movimiento es una herramienta de regulación. A largo plazo, fortalece conexiones entre cerebro inferior y superior.",
        principleApplied: "Integración Vertical (Calmar cerebro inferior primero con movimiento)"
    ),
    CN2Scenario(
        title: "La cicatriz del accidente en bicicleta",
        age: "8 años",
        situation: "Hace 6 meses tu hijo de 8 años tuvo un accidente en bicicleta (se cayó, sangró mucho, fue al hospital). Ahora se niega a andar en bicicleta. Cada vez que ve su bici, se pone ansioso. Dice 'No sé por qué, solo no quiero'.",
        parentReactionWrong: "❌ 'Ya pasó hace meses. Te curaste perfectamente. No seas miedoso, súbete a la bici.' (Ignora que la memoria implícita del trauma está activando respuestas corporales sin que el niño entienda por qué)",
        parentReactionRight: "✅ 'Tu cuerpo recuerda el accidente aunque tu mente no esté pensando en ello. Cuéntame TODO lo que recuerdas del día del accidente, desde el principio.' Ayudas a construir la narrativa completa: antes del accidente, durante, el hospital, la curación. Tal vez dibujan o escriben la historia juntos.",
        brainExplanation: "El hipocampo (memoria explícita) no estaba completamente online durante el trauma porque la amígdala se activó. Quedó memoria implícita: sensaciones corporales de miedo sin contexto narrativo. La estrategia 'Remember to Remember' ayuda a convertir memorias implícitas en explícitas. Al crear una narrativa completa con palabras, reduces el poder emocional de la memoria.",
        outcome: "Al contar la historia varias veces, la memoria se integra. El miedo disminuye porque ahora tiene contexto: 'Fue un accidente, me lastimé, me curé, ahora estoy bien'. La memoria implícita se convierte en explícita. Eventualmente puede volver a andar en bici con confianza. Desarrolla resiliencia ante experiencias difíciles.",
        principleApplied: "Memoria e Identidad (Convertir memoria implícita en explícita narrativa)"
    ),
    CN2Scenario(
        title: "Frustración con videojuego",
        age: "10 años",
        situation: "Tu hijo de 10 años está jugando videojuegos. Pierde un nivel difícil por quinta vez. Avienta el control, grita '¡Es imposible! ¡Odio este juego estúpido!', se tira al sofá llorando de frustración. Está completamente inundado.",
        parentReactionWrong: "❌ 'Si no puedes manejar perder, no juegas más. Contrólate.' (Exige regulación emocional que su cerebro aún no puede hacer en ese momento. No enseña herramientas de autoconocimiento)",
        parentReactionRight: "✅ Te sientas con él: 'Estás muy frustrado. Este nivel es súper difícil.' (Validación). Esperas que se calme un poco. Luego: 'Hagamos SIFT. ¿Qué Sientes en tu cuerpo ahora?' ('Mi pecho está apretado'). '¿Qué Imágenes ves?' ('Perder otra vez'). '¿Qué Sentimientos tienes?' ('Frustración, enojo'). '¿Qué Pensamientos?' ('Nunca lo voy a lograr').",
        brainExplanation: "SIFT (Sensaciones, Imágenes, Sentimientos, Pensamientos) activa la corteza prefrontal medial y la ínsula, áreas de autoconocimiento y conciencia corporal. Al nombrar cada elemento de su experiencia interna, ayudas a tu hijo a OBSERVAR sus emociones en lugar de ser arrastrado por ellas. Esta es la base del mindfulness y la autorregulación.",
        outcome: "Al practicar SIFT, tu hijo desarrolla 'visión de la mente' (mindsight): puede observar sus estados internos con cierta distancia. Las emociones se vuelven como 'nubes que pasan' en lugar de inundar completamente. A largo plazo: mejor regulación emocional, menor impulsividad, mayor resiliencia ante frustración.",
        principleApplied: "Mindfulness y Autoconocimiento (SIFT para observar experiencia interna)"
    ),
    CN2Scenario(
        title: "La pelea por el último trozo de pastel",
        age: "6 y 4 años",
        situation: "Hay un último trozo de pastel. Tu hijo de 6 años lo toma sin preguntar. Tu hija de 4 años grita '¡Yo lo quería!' y golpea a su hermano. Él le grita de vuelta. Escalada total. Ambos llorando y furiosos.",
        parentReactionWrong: "❌ 'Se acabó. Nadie come pastel. ¡Los dos a sus cuartos!' (Castigo sin enseñanza. No desarrolla habilidades de resolución de conflictos, empatía ni reparación relacional)",
        parentReactionRight: "✅ Primero calmas (respiraciones profundas con ambos). A ella: 'Golpear duele. Veo que estás enojada.' A él: 'Tomaste sin preguntar.' Luego a ambos: 'Miren la cara del otro. ¿Cómo crees que se siente tu hermano/a?' (Ejercitar empatía). '¿Qué podemos hacer para que AMBOS estén bien? ¿Ideas?' Facilitas solución conjunta (partir el trozo, alternar, otro postre).",
        brainExplanation: "La estrategia 'Connect Through Conflict' enseña que los conflictos son oportunidades de oro para desarrollar habilidades sociales. Preguntar '¿Cómo crees que se siente?' activa neuronas espejo y corteza prefrontal medial (empatía). Involucrarlos en la solución ejercita el cerebro superior. El conflicto no se evita; se usa para enseñar regulación, perspectiva del otro y reparación.",
        outcome: "Ambos aprenden que las emociones intensas pasan, que pueden comunicar necesidades con palabras, que considerar al otro es importante, y que los conflictos tienen soluciones donde ambos ganan. Con práctica repetida: fortalecimiento de neuronas espejo, mejor regulación emocional, más empatía genuina, habilidades de negociación.",
        principleApplied: "Mindfulness y Autoconocimiento (Extendido a empatía y conflicto como enseñanza)"
    )
]

