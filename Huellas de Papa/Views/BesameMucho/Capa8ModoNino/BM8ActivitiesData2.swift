import SwiftUI

// MARK: - ACTIVITIES DATA PART 2 (Actividades 4-8)
let activitiesData2: [BM8Activity] = [
    BM8Activity(
        number: 4,
        title: "Juego del Espejo Mágico",
        icon: "arrow.triangle.2.circlepath",
        color: "blue",
        description: "Juego de imitación y sincronización que fortalece la conexión y sintonía entre padre e hijo",
        materials: [
            "Solo tu cuerpo y espacio para moverse",
            "Opcional: espejo real para ver reflejados juntos",
            "Música suave de fondo (opcional)"
        ],
        steps: [
            ActivityStep(
                stepNumber: 1,
                instruction: "Busca un espacio amplio donde puedan moverse libremente: la sala, un cuarto sin muebles, o incluso el jardín. Quita obstáculos. Necesitan espacio",
                tip: "Si hace buen clima, hacerlo afuera es aún más divertido"
            ),
            ActivityStep(
                stepNumber: 2,
                instruction: "Explícale el juego a tu hijo: 'Vamos a jugar al espejo mágico. Yo hago movimientos y tú me copias exactamente, como si fueras mi reflejo en el espejo. ¿Listo?'",
                tip: "Demuéstrale primero qué es un reflejo mirándose juntos en un espejo real"
            ),
            ActivityStep(
                stepNumber: 3,
                instruction: "Comienza tú siendo el líder. Haz movimientos LENTOS y simples al principio: levantar un brazo, agacharte, tocar tu nariz, dar una vuelta. Deja que tu hijo te imite. Celebra cuando lo haga bien",
                tip: "Empieza lento. Movimientos lentos son más difíciles de imitar que rápidos"
            ),
            ActivityStep(
                stepNumber: 4,
                instruction: "Aumenta gradualmente la complejidad: movimientos con ambos brazos, saltar, hacer caras graciosas, bailar. Mantén contacto visual constante. Sonríe mucho",
                tip: "El contacto visual mientras se mueven juntos crea sintonía emocional"
            ),
            ActivityStep(
                stepNumber: 5,
                instruction: "Ahora viene la parte MÁS importante: cambia los roles. Dile: 'Ahora TÚ eres el líder y yo soy tu espejo. Tú mandas, yo copio. ¿Qué movimiento quieres que haga?'",
                tip: "Darle el poder de liderar es CRUCIAL. Aquí él tiene el control"
            ),
            ActivityStep(
                stepNumber: 6,
                instruction: "Copia exactamente lo que él haga, sin importar qué tan tonto te sientas. Si hace un baile loco, cópialo. Si hace ruidos raros, cópialos. Si se ríe, ríete. Sé su espejo TOTAL",
                tip: "Esto le enseña que TÚ también puedes seguir SUS reglas. Es poderoso"
            ),
            ActivityStep(
                stepNumber: 7,
                instruction: "Agreguen emociones al juego. Pídele que haga una cara feliz y tú la copias. Luego triste. Luego enojada. Luego asustada. Exageren las expresiones juntos",
                tip: "Esto enseña reconocimiento facial de emociones jugando"
            ),
            ActivityStep(
                stepNumber: 8,
                instruction: "Terminen el juego con un 'abrazo espejo': dense un abrazo al mismo tiempo, con los mismos movimientos. Cuenten juntos: 1, 2, 3, ¡ABRAZO! Y abrácense fuerte",
                tip: "Este final ritual hace que quieran jugar de nuevo mañana"
            ),
            ActivityStep(
                stepNumber: 9,
                instruction: "Jueguen a esto 2-3 veces por semana. Es simple, no necesita materiales, y crea MUCHA conexión. Tu hijo se sentirá visto, imitado, importante",
                tip: "Años después, recordará este juego con nostalgia y amor"
            )
        ],
        ageRange: "2-7 años",
        duration: "10-15 minutos",
        category: .games
    ),
    
    BM8Activity(
        number: 5,
        title: "Caja de la Calma Personalizada",
        icon: "shippingbox.fill",
        color: "green",
        description: "Crear juntos una herramienta de autorregulación emocional que tu hijo puede usar cuando se sienta abrumado",
        materials: [
            "Una caja de zapatos o recipiente con tapa (tamaño mediano)",
            "Materiales para decorar: pinturas, stickers, papel de colores",
            "Objetos sensoriales calmantes (lee los pasos para saber cuáles)",
            "Pegamento y tijeras",
            "Foto familiar pequeña"
        ],
        steps: [
            ActivityStep(
                stepNumber: 1,
                instruction: "Explícale a tu hijo el concepto: 'Vamos a hacer una caja mágica especial. Cuando estés muy enojado, muy triste o muy nervioso, puedes usar esta caja para calmarte. Pero la vamos a hacer JUNTOS'",
                tip: "Usa lenguaje apropiado a su edad. Para niños más pequeños: 'caja para cuando estés alterado'"
            ),
            ActivityStep(
                stepNumber: 2,
                instruction: "Decoren la caja juntos. Que él elija los colores, los stickers, los dibujos. Puede pintar, pegar, decorar como quiera. Tú ayudas técnicamente pero él dirige creativamente",
                tip: "Mientras decoran, habla sobre emociones: '¿Cuándo te has sentido muy enojado?'"
            ),
            ActivityStep(
                stepNumber: 3,
                instruction: "Ahora viene lo importante: elegir QUÉ poner dentro. Busquen juntos objetos que lo calmen. Ejemplos: pelota anti-estrés, botella con agua y brillantina (para agitar y ver caer), plastilina, libro favorito, juguete suave",
                tip: "Deja que él elija. Lo que te parece tonto a ti puede calmarlo a él"
            ),
            ActivityStep(
                stepNumber: 4,
                instruction: "Incluyan también objetos de CONEXIÓN: foto de la familia abrazados, una prenda tuya que huela a ti, una nota que diga 'Te amo' con tu letra",
                tip: "Cuando esté solo con la caja, estos objetos le recordarán que no está solo"
            ),
            ActivityStep(
                stepNumber: 5,
                instruction: "Agreguen tarjetas con ESTRATEGIAS de calma. En cada tarjeta dibujen/escriban: 'Respira profundo 3 veces', 'Aprieta la pelota', 'Mira la brillantina caer', 'Pide un abrazo'",
                tip: "Con dibujos simples incluso niños que no leen pueden usarlas"
            ),
            ActivityStep(
                stepNumber: 6,
                instruction: "Guarda la caja en un lugar MUY accesible para tu hijo: un estante bajo, debajo de su cama, en un rincón de la sala. Debe poder tomarla sin pedir permiso",
                tip: "Si está muy alta o escondida, no la usará cuando la necesite"
            ),
            ActivityStep(
                stepNumber: 7,
                instruction: "PRACTIQUEN usar la caja en un momento tranquilo primero. Saca los objetos juntos. Pruébenlos. Respiren juntos. Esto se llama 'práctica en frío' - usar la herramienta ANTES de necesitarla urgentemente",
                tip: "Si la primera vez que la usa es en crisis, no sabrá cómo"
            ),
            ActivityStep(
                stepNumber: 8,
                instruction: "Explícale: 'Cuando estés muy alterado, puedes usar tu caja. PERO mamá/papá va a estar contigo. No es para dejarte solo. Es para calmarnos JUNTOS'. La caja es herramienta, NO aislamiento",
                tip: "Nunca uses la caja como castigo ('ve a calmarte con tu caja'). Es apoyo, no destierro"
            ),
            ActivityStep(
                stepNumber: 9,
                instruction: "La próxima vez que tenga una rabieta, después de validar su emoción, ofrece: '¿Quieres que saquemos tu caja de la calma?'. Si dice sí, úsenla juntos. Si dice no, respeta",
                tip: "Con el tiempo, él mismo la buscará cuando la necesite"
            )
        ],
        ageRange: "3-8 años",
        duration: "40-50 minutos creación",
        category: .crafts
    ),
    
    BM8Activity(
        number: 6,
        title: "Teatro de Emociones",
        icon: "theatermasks.fill",
        color: "purple",
        description: "Role-play de situaciones emocionales para practicar empatía y reconocimiento de sentimientos",
        materials: [
            "Solo su imaginación y disposición a actuar (¡sí, vas a actuar!)",
            "Opcional: disfraces simples, sombreros, bufandas para caracterizarse",
            "Opcional: muñecos o peluches como 'actores'"
        ],
        steps: [
            ActivityStep(
                stepNumber: 1,
                instruction: "Explícale el juego: 'Vamos a ser actores. Vamos a actuar situaciones con diferentes emociones. A veces yo seré el niño y tú el papá. A veces al revés. ¿Te parece divertido?'",
                tip: "Cambiar roles les permite a ambos ver desde otra perspectiva"
            ),
            ActivityStep(
                stepNumber: 2,
                instruction: "Empiecen con una situación simple. Tú propones: 'Yo soy un niño que se cayó y se raspó la rodilla. Estoy llorando. ¿Qué haces tú?'. Deja que tu hijo actúe su respuesta",
                tip: "Observa QUÉ hace. ¿Consuela? ¿Ignora? ¿Se burla? Esto revela lo que ha aprendido"
            ),
            ActivityStep(
                stepNumber: 3,
                instruction: "Si tu hijo no sabe qué hacer, MODELA tú primero. Cambia roles: tú eres el papá, él es el niño que se cayó. Muestra una respuesta empática: 'Ay, mi amor, te caíste. ¿Te duele? Ven, déjame ver. Te voy a curar con un beso mágico'",
                tip: "Los niños aprenden MUCHO más viendo que escuchando"
            ),
            ActivityStep(
                stepNumber: 4,
                instruction: "Practiquen diferentes escenarios emocionales: 'Un niño está triste porque se rompió su juguete', 'Un niño tiene miedo de los truenos', 'Un niño está MUY enojado porque no le dan lo que quiere'",
                tip: "Usa situaciones REALES que él ha vivido. Eso lo hace más significativo"
            ),
            ActivityStep(
                stepNumber: 5,
                instruction: "En cada escenario, modela respuestas empáticas: validación ('Veo que estás muy triste'), presencia física (abrazo), palabras de consuelo ('Estoy aquí contigo'). No minimices ('no es nada') ni castigues",
                tip: "Esto le enseña inteligencia emocional de forma práctica y divertida"
            ),
            ActivityStep(
                stepNumber: 6,
                instruction: "Ahora actúen situaciones donde TÚ (el adulto) te equivocas. Ejemplo: 'Soy un papá que gritó a su hijo. ¿Qué debería hacer?' Deja que tu hijo te diga. Luego modela: 'Perdón, hijo. Me equivoqué'",
                tip: "Esto normaliza que los adultos también se equivocan y piden perdón"
            ),
            ActivityStep(
                stepNumber: 7,
                instruction: "Incluyan situaciones de presión social: 'La abuela dice que el niño está muy acostumbrado a los brazos. ¿Qué responde el papá?' Modela cómo defender la crianza con respeto pero firmeza",
                tip: "Esto lo prepara para cuando otras personas critiquen tu crianza"
            ),
            ActivityStep(
                stepNumber: 8,
                instruction: "Termina cada sesión de teatro preguntando: '¿Cómo te sentiste siendo el niño? ¿Y siendo el papá?' Esta reflexión desarrolla empatía y perspectiva",
                tip: "Jueguen a esto 1-2 veces por semana. Es educación emocional disfrazada de juego"
            )
        ],
        ageRange: "4-8 años",
        duration: "20-30 minutos",
        category: .games
    ),
    
    BM8Activity(
        number: 7,
        title: "Mapa del Tesoro del Apego",
        icon: "map.fill",
        color: "orange",
        description: "Crear un mapa visual de todos los momentos y lugares de conexión familiar",
        materials: [
            "Cartulina grande o papel kraft",
            "Marcadores de colores",
            "Stickers de corazones, estrellas",
            "Fotos pequeñas (opcional)",
            "Recortes de revistas (opcional)"
        ],
        steps: [
            ActivityStep(
                stepNumber: 1,
                instruction: "Dibuja un mapa (puede ser de tu casa, tu barrio, o imaginario). En el centro, dibuja un corazón grande y escribe: 'Nuestra Familia'. Este es el tesoro principal",
                tip: "No necesita ser un mapa perfecto. Puede ser muy simbólico"
            ),
            ActivityStep(
                stepNumber: 2,
                instruction: "Pregúntale a tu hijo: '¿Cuáles son los lugares donde nos sentimos más conectados?' Pueden ser: la cama grande, el sofá donde leen cuentos, la cocina donde desayunan, el parque donde juegan",
                tip: "Los lugares físicos están asociados a memorias emocionales"
            ),
            ActivityStep(
                stepNumber: 3,
                instruction: "Dibujen cada uno de esos lugares en el mapa. Por ejemplo: una cama grande arriba, un sofá a la izquierda, un parque abajo. Conéctenlos con caminos o flechas al corazón central",
                tip: "Deja que tu hijo dibuje. No importa si es 'malo'"
            ),
            ActivityStep(
                stepNumber: 4,
                instruction: "En cada lugar, peguen una foto de ustedes ahí O dibujen lo que hacen. Ejemplo: en la cama, dibujen personas durmiendo juntas. En el sofá, personas leyendo",
                tip: "Si usan fotos reales, es aún más significativo"
            ),
            ActivityStep(
                stepNumber: 5,
                instruction: "Agreguen 'tesoros escondidos' por el mapa: abrazos, besos, risas, canciones. Representen estos tesoros con símbolos: corazones, estrellas, notas musicales. Sean creativos",
                tip: "Estos 'tesoros' son los momentos de apego que coleccionan juntos"
            ),
            ActivityStep(
                stepNumber: 6,
                instruction: "Escriban o dibujen una 'leyenda' del mapa. Ejemplo: ❤️ = Abrazos, ⭐ = Risas, 🎵 = Canciones. Esto hace el mapa más interactivo",
                tip: "La leyenda ayuda a 'leer' el mapa después"
            ),
            ActivityStep(
                stepNumber: 7,
                instruction: "Cuelguen el mapa en su cuarto o en la sala. De vez en cuando, señala el mapa y di: 'Mira todos los tesoros de amor que tenemos en nuestra familia. ¡Somos muy ricos!'",
                tip: "Esto refuerza visualmente que su familia está llena de amor"
            ),
            ActivityStep(
                stepNumber: 8,
                instruction: "Pueden ir agregando más lugares y tesoros con el tiempo. El mapa puede crecer y evolucionar como evoluciona su relación",
                tip: "En 5 años, ese mapa será un recuerdo precioso"
            )
        ],
        ageRange: "4-8 años",
        duration: "35-45 minutos",
        category: .crafts
    ),
    
    BM8Activity(
        number: 8,
        title: "Ritual del Agradecimiento Nocturno",
        icon: "star.fill",
        color: "yellow",
        description: "Crear un ritual de gratitud antes de dormir que fortalece el vínculo y la perspectiva positiva",
        materials: [
            "Solo necesitan estar juntos, sin distracciones",
            "La cama o lugar donde duermen",
            "Opcional: diario pequeño para anotar los agradecimientos"
        ],
        steps: [
            ActivityStep(
                stepNumber: 1,
                instruction: "Establece este ritual CADA noche, justo antes de dormir. Después de la canción de buenas noches, después del cuento, antes de apagar la luz. La consistencia es clave",
                tip: "Los rituales predecibles dan seguridad a los niños"
            ),
            ActivityStep(
                stepNumber: 2,
                instruction: "Acuéstense juntos cómodos. Luz tenue. Ambiente tranquilo. Mírense a los ojos y di: 'Amor, vamos a decir 3 cosas por las que estamos agradecidos hoy. Yo empiezo'",
                tip: "Tú empiezas para modelar. Enseñas cómo se hace"
            ),
            ActivityStep(
                stepNumber: 3,
                instruction: "Di tus 3 agradecimientos. INCLUYE siempre algo sobre él/ella. Ejemplo: '1-Agradezco que hoy jugamos juntos en el parque. 2-Agradezco ese abrazo que me diste cuando llegué del trabajo. 3-Agradezco que eres mi hijo/hija'",
                tip: "Que él escuche que TÚ estás agradecido por ÉL es poderoso"
            ),
            ActivityStep(
                stepNumber: 4,
                instruction: "Ahora su turno: 'Ahora tú. ¿Por qué 3 cosas estás agradecido hoy?'. Si es muy pequeño para 3, puede ser solo 1. Si dice 'no sé', ayúdale: '¿Hubo algo divertido? ¿Rico? ¿Que te hizo feliz?'",
                tip: "Al inicio puede costar. Con práctica diaria, fluye natural"
            ),
            ActivityStep(
                stepNumber: 5,
                instruction: "Escucha sus agradecimientos sin juzgar. Si dice 'agradezco las galletas', no digas 'deberías agradecer cosas más importantes'. TODO es válido. Asiente y valida: 'Sí, las galletas estaban deliciosas'",
                tip: "No hay agradecimientos 'correctos' o 'incorrectos'. Todo cuenta"
            ),
            ActivityStep(
                stepNumber: 6,
                instruction: "Cuando ambos terminen, dense un abrazo especial de agradecimiento. Di: 'Gracias por compartir esto conmigo. Te amo'",
                tip: "El abrazo final cierra el ritual con conexión física"
            ),
            ActivityStep(
                stepNumber: 7,
                instruction: "Si quieres, lleva un diario pequeño donde anotes los agradecimientos de cada noche. En un año tendrás 1,095 cosas por las que estuvieron agradecidos juntos. ¡Imagina ese tesoro!",
                tip: "Releer ese diario en el futuro será emotivo para ambos"
            ),
            ActivityStep(
                stepNumber: 8,
                instruction: "En días muy difíciles, cuando todo salió mal, este ritual es AÚN más importante. Encontrar 3 cosas buenas en un día malo enseña resiliencia y perspectiva",
                tip: "Algunos días dirá 'agradezco que el día terminó'. Y está bien. Es honesto"
            )
        ],
        ageRange: "3-10 años",
        duration: "5-10 minutos diarios",
        category: .stories
    ),
    
    BM8Activity(
        number: 7,
        title: "Frasco de los Momentos Felices",
        icon: "sparkles",
        color: "pink",
        description: "Coleccionar y guardar los momentos especiales de cada día para revisarlos cuando los necesiten",
        materials: [
            "Frasco de vidrio transparente grande (o recipiente similar)",
            "Papelitos de colores cortados en tiras",
            "Marcadores o plumas de colores",
            "Decoraciones para el frasco: cintas, stickers, pinturas",
            "Etiqueta para el frasco"
        ],
        steps: [
            ActivityStep(
                stepNumber: 1,
                instruction: "Decoren juntos el frasco. Píntenlo, péguenle stickers, átenle un listón. Háganlo hermoso y especial. En una etiqueta escriban: 'Nuestros Momentos Mágicos' o 'Frasco de la Felicidad Familiar'",
                tip: "Mientras decoran, explícale para qué será el frasco"
            ),
            ActivityStep(
                stepNumber: 2,
                instruction: "Explícale el concepto: 'Cada día, vamos a escribir en un papelito algo lindo que pasó hoy. Puede ser un abrazo especial, una risa juntos, un juego divertido. Y lo vamos a guardar aquí'",
                tip: "Para niños pequeños: tú escribes lo que él dicte"
            ),
            ActivityStep(
                stepNumber: 3,
                instruction: "Hagan el primer papelito juntos AHORA. Pregunta: '¿Qué momento feliz tuvimos hoy?'. Puede ser simple: 'Hoy jugamos a las escondidas' o 'Papá me llevó en sus hombros'. Escríbelo en un papelito",
                tip: "Usa colores diferentes para diferentes tipos de momentos si quieres"
            ),
            ActivityStep(
                stepNumber: 4,
                instruction: "Dobla el papelito juntos, pídele que lo bese (sí, que lo bese), y que lo meta al frasco. Di: 'Ahí guardamos ese recuerdo feliz. Cuando lo necesitemos, lo sacamos'",
                tip: "El acto de 'guardar' el recuerdo es simbólicamente poderoso"
            ),
            ActivityStep(
                stepNumber: 5,
                instruction: "Establece una rutina diaria: antes de dormir, después de cenar, o cuando mejor funcione. Pregunten: '¿Qué momento feliz guardamos hoy?'. Escribe, dobla, guarda. Todos los días",
                tip: "La consistencia hace que se vuelva hábito automático"
            ),
            ActivityStep(
                stepNumber: 6,
                instruction: "En días difíciles, cuando todo salió mal, cuando tuviste que poner muchos límites, cuando tu hijo tuvo rabietas... ESE día es AÚN más importante hacer el ritual. Busquen UN momento bueno. Siempre hay al menos uno",
                tip: "Esto entrena al cerebro a buscar lo positivo incluso en días malos"
            ),
            ActivityStep(
                stepNumber: 7,
                instruction: "Una vez al mes (puede ser el último día del mes), vacíen el frasco juntos. Lean todos los papelitos. Revivan esos momentos. Ríanse. Recuerden. Celebren",
                tip: "Este momento de 'vaciar el frasco' es mágico. Verán cuánta felicidad acumularon"
            ),
            ActivityStep(
                stepNumber: 8,
                instruction: "Guarden los papelitos de cada mes en un sobre con la fecha. En un año tendrán 12 sobres llenos de momentos felices. En 5 años, 60 sobres. Imagina ese tesoro cuando tu hijo sea adulto",
                tip: "Este es un legado de amor tangible que tu hijo guardará para siempre"
            )
        ],
        ageRange: "3-10 años",
        duration: "5 minutos diarios + 30 min mensuales",
        category: .crafts
    ),
    
    BM8Activity(
        number: 8,
        title: "Sesión de Fotos del Apego",
        icon: "camera.fill",
        color: "mint",
        description: "Crear intencionalmente fotos que documenten y celebren los momentos de apego y conexión",
        materials: [
            "Celular o cámara",
            "Trípode o alguien que tome las fotos (o usen temporizador)",
            "Ropa cómoda (pijamas perfectas)",
            "Opcional: props simples (peluches, mantas, libros)"
        ],
        steps: [
            ActivityStep(
                stepNumber: 1,
                instruction: "Elige un día especial para su sesión de fotos. Puede ser fin de semana o cualquier tarde tranquila. Dile a tu hijo: 'Hoy vamos a tomar fotos especiales de nuestra familia. Fotos que muestren cuánto nos amamos'",
                tip: "La clave es que NO sean fotos posadas y falsas, sino momentos REALES"
            ),
            ActivityStep(
                stepNumber: 2,
                instruction: "No se arreglen demasiado. Pueden estar en pijamas, despeinados, sin maquillaje. De hecho, ESO es más auténtico. La belleza está en la conexión, no en la 'perfección'",
                tip: "Las mejores fotos de apego son las naturales y espontáneas"
            ),
            ActivityStep(
                stepNumber: 3,
                instruction: "Tomen fotos de MOMENTOS REALES de apego: Colecho (todos en la cama juntos), Lactancia (si aplica), Abrazos (cercanos, genuinos), Porteo (si usas), Jugando juntos, Leyendo cuentos, Comiendo juntos",
                tip: "Usen temporizador o pidan a alguien que tome las fotos"
            ),
            ActivityStep(
                stepNumber: 4,
                instruction: "Específicamente, tomen estas fotos: 1-Abrazados en la cama (colecho), 2-Leyendo un cuento muy juntos, 3-Riéndose a carcajadas, 4-Mirándose a los ojos, 5-Haciendo algo cotidiano juntos (cocinar, bañarse)",
                tip: "Estas fotos documentan PRÁCTICAS del libro, no solo 'poses bonitas'"
            ),
            ActivityStep(
                stepNumber: 5,
                instruction: "Tomen fotos de DETALLES: sus manos entrelazadas, su cabecita en tu pecho, sus piecitos al lado de los tuyos, sus bracitos alrededor de tu cuello. Los detalles cuentan historias enormes",
                tip: "Estas fotos close-up son las más emotivas años después"
            ),
            ActivityStep(
                stepNumber: 6,
                instruction: "Déjalo a él tomar fotos también. Dale tu celular y pídele: 'Ahora tú toma fotos de lo que quieras'. Observa QUÉ fotografía. Eso te dirá qué es importante para él",
                tip: "Las fotos desde su perspectiva (literal y emocional) son tesoros"
            ),
            ActivityStep(
                stepNumber: 7,
                instruction: "Después de la sesión, siéntense juntos a ver las fotos. Pregúntale: '¿Cuál es tu favorita? ¿Por qué?' Escucha sus respuestas. Puede sorprenderte qué elige",
                tip: "No borres las que salieron 'feas'. A veces esas son sus favoritas"
            ),
            ActivityStep(
                stepNumber: 8,
                instruction: "Seleccionen juntos 5-10 fotos favoritas. Puedes: imprimirlas y hacer un cuadrito, ponerlas de fondo de pantalla del celular, mandarlas a imprimir en canvas, o simplemente guardarlas en un álbum digital especial llamado 'Nuestro Apego'",
                tip: "Ver estas fotos regularmente refuerza: 'Mi familia se ama con contacto físico'"
            ),
            ActivityStep(
                stepNumber: 9,
                instruction: "Repite esta sesión cada 3-6 meses. Compara las fotos. Verás cómo crecen juntos. Cómo el amor permanece aunque cambien físicamente. Es documentar su historia de apego",
                tip: "En 10 años, esas fotos serán tu tesoro más preciado. Créeme"
            )
        ],
        ageRange: "0-10 años",
        duration: "30-45 minutos por sesión",
        category: .crafts
    )
]


