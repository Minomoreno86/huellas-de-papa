import SwiftUI

// MARK: - SITUACIONES 4-7 (Parte 2)
extension BM5View {
    var situationsPart2: [BM5Situation] {
        [
            // SITUACIÓN 4: Lactancia a Demanda Total
            BM5Situation(
                number: 4,
                title: "Establecimiento de Lactancia a Demanda Total",
                context: "Decides practicar lactancia a demanda completa, ignorando horarios y relojes. No sabes bien cómo empezar ni qué esperar. Necesitas una guía completa de implementación.",
                preparation: [
                    "ELIMINAR EL RELOJ: Quita relojes de la habitación donde amamantas. No cuentes horas ni minutos. La lactancia a demanda significa: cuando el bebé quiere, el tiempo que quiere, sin límites.",
                    "APRENDER SEÑALES DE HAMBRE (antes del llanto): Busca con la boca (reflejo de búsqueda), chupa sus manos, mueve cabeza lado a lado, hace ruiditos, se agita. El LLANTO es la última señal, responde ANTES.",
                    "PREPARAR TU ENTORNO: Rincón cómodo para amamantar, cojín de lactancia, agua cerca (vas a tener sed), snacks saludables cerca, algo para entretenerte (libro, serie) si las tomas son largas.",
                    "CONVERSAR CON LA PAREJA: Explicar que el bebé puede pedir cada hora o más frecuentemente (es normal). Pedir apoyo: que traiga agua, comida, que cuide al bebé mientras tú descansas entre tomas."
                ],
                implementationSteps: [
                    "SEMANA 1-2: ESTABLECIMIENTO INICIAL - Ofrece pecho ante CUALQUIER señal de hambre. No esperes a que llore. Puede pedir cada 1-2 horas (o menos). Es NORMAL. Especialmente los primeros días (establece producción). Tomas pueden durar 10, 20, 40 minutos... lo que el bebé necesite. NO cuentes minutos. Cuando suelte un pecho, ofrece el otro. Si no quiere, ok.",
                    "SEMANA 3-4: PRODUCCIÓN ESTABLECIDA - Tu cuerpo ya sabe cuánta leche producir (responde a la demanda). Notarás que tus pechos se llenan cuando 'toca' mamar. El bebé puede empezar a espaciar tomas (o no). Sigue respondiendo a demanda. Tomas nocturnas son CRUCIALES para mantener producción (la prolactina es más alta de noche).",
                    "MES 2-3: PATRÓN CONSOLIDADO - Ya conoces las señales de tu bebé. Ya sabes sus 'horarios naturales' (no impuestos, emergentes). Cada bebé tiene su patrón. Algunos maman cada 2 horas como reloj. Otros son irregulares. Ambos son normales si el bebé gana peso.",
                    "BROTES DE CRECIMIENTO (semanas 3, 6, 12, 18...): El bebé mamará casi CONSTANTEMENTE durante 2-3 días. Es NORMAL. No es que se quede sin leche. Es que el bebé pide más y tu cuerpo produce más. NO introduzcas fórmula. Simplemente amamanta sin parar esos días. Luego volverá a espaciar.",
                    "LACTANCIA NOCTURNA: NUNCA elimines tomas de noche (algunos 'expertos' dicen que después de 6 meses no necesitan comer de noche - FALSO). Las tomas nocturnas mantienen la producción y satisfacen sed/hambre/consuelo del bebé. Practica colecho y amamanta acostada.",
                    "IGNORAR COMPARACIONES: 'Mi bebé mama cada 4 horas' → Irrelevante. 'Mi bebé toma solo 10 minutos' → Cada bebé es diferente. 'Ya le quitamos tomas de noche' → No es objetivo a imitar. TU bebé sabe lo que necesita."
                ],
                commonObstacles: [
                    Obstacle(
                        obstacle: "Toma cada hora, no puedo hacer nada más",
                        solution: "ES NORMAL en recién nacidos y durante brotes. SOLUCIONES: (1) Portabebés ergonómico (amamanta y tienes manos libres), (2) Aprende a amamantar en diferentes posiciones (acostada, de pie, en portabebés), (3) Acepta que esta etapa es TEMPORAL (después de 3 meses suelen espaciar), (4) Pide ayuda con TODO lo demás, tú solo amamantas."
                    ),
                    Obstacle(
                        obstacle: "Tarda 40+ minutos en cada toma, el pediatra dice que es mucho",
                        solution: "NO es demasiado. Algunos bebés son 'mamadores rápidos' (10-15 min), otros son 'gourmet' (30-60 min). AMBOS son normales. La leche del final (la más grasa) sale después de 20+ minutos. Si lo limitas a 10 minutos, nunca la toma. Ignora al pediatra. Tu bebé sabe cuánto necesita mamar."
                    ),
                    Obstacle(
                        obstacle: "Familia dice que está usando el pecho como chupete",
                        solution: "EL CHUPETE IMITA EL PECHO, NO AL REVÉS. La succión no nutritiva es VÁLIDA y NECESARIA. Mamar es: (1) Alimento, (2) Consuelo, (3) Sueño, (4) Calmar dolor, (5) Aburrimiento, (6) Cercanía. TODO es válido. No existe 'usar como chupete'. Existe MAMAR, punto. El pecho es para TODO eso, no solo para alimentar."
                    ),
                    Obstacle(
                        obstacle: "Me siento atada, no tengo libertad",
                        solution: "Es etapa intensa pero TEMPORAL. SOLUCIONES: (1) Portabebés (das pecho y te mueves), (2) Aprender lactancia en diferentes lugares (parque, cafetería, auto), (3) Pareja que cuide al bebé 1-2 horas (tú sales, te duchas larga, descansas), (4) Recordar: es inversión en salud de tu bebé, no prisión. Mejorará."
                    )
                ],
                bookQuotes: [
                    "La lactancia a demanda significa: cuando el bebé quiere, las veces que quiere, el tiempo que quiere. Sin excepciones, sin horarios, sin límites.",
                    "Los horarios rígidos (cada 3 horas, 10 minutos por pecho) son la causa principal de fracaso de lactancia. Son arbitrarios, sin base científica y contraproducentes.",
                    "La producción de leche se regula por oferta y demanda. Cuanto más mama el bebé, más leche produces. Los horarios reducen la demanda y por tanto la producción.",
                    "No existe 'demasiadas veces' ni 'demasiado tiempo'. El bebé regula perfectamente su ingesta. Confía en él."
                ],
                ageRange: "0-2 años",
                category: .feeding
            ),
            
            // SITUACIÓN 5: Manejo de Críticas sobre Lactancia Prolongada
            BM5Situation(
                number: 5,
                title: "Lactancia Prolongada: Sostenerla ante Críticas",
                context: "Tu hijo tiene 2+ años y aún toma pecho. Hay presión constante para destetar. Cada reunión familiar incluye comentarios. Necesitas estrategias para proteger tu lactancia y tu salud mental.",
                preparation: [
                    "DATOS DE LA OMS: La Organización Mundial de la Salud recomienda lactancia mínimo 2 años. A los 2-3 años es NORMAL y SALUDABLE seguir amamantando. No es 'demasiado', es lo recomendado.",
                    "BENEFICIOS A ESTA EDAD: Inmunológicos (sigue protegiendo de enfermedades), nutricionales (sigue siendo nutritiva), emocionales (vínculo, consuelo), desarrollo maxilofacial (succión desarrolla mandíbula). La leche NO 'pierde propiedades'.",
                    "PREPARAR RESPUESTAS: Tener claras 2-3 respuestas según el libro para comentarios típicos. No necesitas defender constantemente, pero tener respuestas te empodera.",
                    "DECISIÓN FIRME: Destetar solo cuando AMBOS (tú y tu hijo) estéis preparados. La presión externa NO es razón válida. Reafirmar tu decisión antes de cada reunión familiar."
                ],
                implementationSteps: [
                    "ESTABLECER LÍMITES CON FAMILIA: Primera vez que critican: Respuesta educativa ('La OMS recomienda 2 años mínimo, estamos dentro de lo normal'). Segunda vez: Respuesta más directa ('Esta es nuestra decisión, no voy a discutirla'). Tercera vez: Límite firme ('Si sigues comentando, nos vamos / no venimos'). NO es grosería, es protección.",
                    "NO AMAMANTAR A ESCONDIDAS: No envía buen mensaje a tu hijo (que es algo vergonzoso). Normaliza frente a él. Si la familia critica, responde o retírate, pero no escondas. La lactancia es normal y hermosa.",
                    "CONEXIÓN CON GRUPOS DE APOYO: La Liga de la Leche, grupos de lactancia prolongada, foros pro-apego. Rodearte de madres que también amamantan a 2-3+ años valida tu decisión. No estás sola. Es más común de lo que parece.",
                    "MANEJO DE COMENTARIOS EN PÚBLICO: Si alguien comenta en la calle/parque: Opciones: (A) Ignorar completamente, (B) Respuesta breve: 'Es recomendado por la OMS', (C) Pregunta retórica: '¿Por qué te importa?'. Elige según tu energía del día.",
                    "RESPUESTA A '¿HASTA CUÁNDO VAS A DARLE?': 'Hasta que ambos estemos preparados para dejarlo' o 'Hasta que él quiera' o 'No lo he decidido aún'. NUNCA digas fecha concreta para complacer.",
                    "AUTOCUIDADO: Las críticas constantes desgastan. Limita contacto con personas muy críticas. Prioriza tu salud mental. Un ambiente tóxico afecta tu lactancia (el estrés puede reducir producción)."
                ],
                commonObstacles: [
                    Obstacle(
                        obstacle: "'Ya es muy grande, se va a quedar pegado para siempre'",
                        solution: "TODOS se destetan eventualmente. No existe un solo caso de adulto amamantándose. El destete natural ocurre entre 2-7 años generalmente. Tu hijo NO será la excepción. La independencia llegará, ten paciencia. Carlos González: 'Es más probable que tu hijo vaya a la universidad que que se lleve tu pecho a la universidad'."
                    ),
                    Obstacle(
                        obstacle: "'Le estás quitando nutrientes a tu cuerpo, te vas a enfermar'",
                        solution: "FALSO. La lactancia NO enferma a la madre (si come adecuadamente). De hecho, PROTEGE contra cáncer de mama, ovario, osteoporosis. Amamantar es saludable para la madre también. Si te sientes cansada: come más, duerme más. No es la lactancia, es la crianza intensiva en general."
                    ),
                    Obstacle(
                        obstacle: "'Eso es casi incesto / es inapropiado a esta edad'",
                        solution: "Comentario que refleja ignorancia total. La lactancia NO tiene nada sexual. Es alimentación, consuelo, vínculo. La sexualización es del que comenta, no de la realidad. Respuesta: 'Eso es una proyección tuya muy inapropiada' o simplemente ignorar. No merece más respuesta."
                    ),
                    Obstacle(
                        obstacle: "Empiezo a sentir presión social, me da vergüenza amamantar fuera de casa",
                        solution: "La vergüenza viene de críticas externas, no de la acción. Reafirma: Estás haciendo lo mejor para tu hijo. La OMS lo respalda. Miles de madres en el mundo amamantan a 2-3+ años. Si necesitas, busca espacios amigables (parques naturales, grupos de apego). Pero idealmente: normaliza. Amamanta donde necesites. Es tu derecho."
                    )
                ],
                bookQuotes: [
                    "La lactancia prolongada no existe. Lo NORMAL es amamantar años. La lactancia corta (meses) es lo antinatural desde perspectiva evolutiva.",
                    "La leche materna no pierde propiedades con el tiempo. A los 2 años sigue siendo igual de nutritiva e inmunológica que al mes.",
                    "El destete debe ser decisión de la díada madre-hijo, no de abuelas, pediatras, vecinas o desconocidos.",
                    "Presión social no es razón médica. No destetes para complacer a otros. Solo desteta cuando AMBOS estéis preparados."
                ],
                ageRange: "2-4 años",
                category: .feeding
            ),
            
            // SITUACIÓN 6: Implementar Porteo Constante
            BM5Situation(
                number: 6,
                title: "Implementar Porteo Constante en Casa",
                context: "Decides llevar a tu bebé en portabebés la mayor parte del día. No sabes qué portabebés elegir ni cómo usarlo correctamente. Necesitas guía práctica completa.",
                preparation: [
                    "ELEGIR PORTABEBÉS APROPIADO: 0-3 meses: Fular elástico (muy adaptable, abraza al recién nacido). 3-6 meses: Fular rígido o bandolera. 6+ meses: Mochila ergonómica (más soporte para bebé más pesado). Evitar: mochilas colgantes (dañan cadera), portabebés que no sean ergonómicos.",
                    "APRENDER POSICIÓN CORRECTA: Posición 'ranita' (piernas en M, rodillas más altas que culo), espalda en C ligeramente curvada, cara SIEMPRE visible (poder verla), vías respiratorias libres (barbilla separada del pecho, nariz despejada), a 'altura de beso' (puedes besarle la cabeza).",
                    "VER TUTORIALES O TALLER: Algunos grupos ofrecen talleres de porteo gratuitos. O videos online. Asegurarte de que la posición es correcta (seguridad + comodidad).",
                    "PREPARAR RESPUESTAS: Para los que digan 'lo vas a malcriar', 'nunca bajará', etc. Tener clara tu respuesta basada en el libro."
                ],
                implementationSteps: [
                    "PRIMER DÍA: Coloca el portabebés según instrucciones. Verifica posición (ranita, cara visible, vías libres). Empieza con 30 minutos mientras haces algo tranquilo (lavar platos, doblar ropa). Observa cómo reacciona el bebé. La mayoría se calman inmediatamente.",
                    "PRIMEROS DÍAS: Aumenta tiempo gradualmente. 30 min, luego 1 hora, luego 2 horas. Haz actividades normales: cocinar (cuidado con fuego/salpicaduras), limpiar, pasear, comprar. Habla con el bebé mientras trabajas. Muchos bebés se duermen en el portabebés (perfecto).",
                    "PRIMERA SEMANA: Para el día 7, portear es natural. El bebé está acostumbrado. Tú has ganado movilidad. Puedes hacer prácticamente todo porteando (excepto actividades peligrosas con fuego). El bebé llora mucho menos (tiene el contacto que necesita).",
                    "PORTEO Y LACTANCIA: Aprende a amamantar en portabebés (hay tutoriales). Afloja un poco, acercas al bebé al pecho, él mama, luego lo reacomodas. Útil especialmente fuera de casa.",
                    "CUÁNTO TIEMPO AL DÍA: TODO el que quieras y puedas. Algunos bebés están 6-8 horas en portabebés. Otros prefieren más tiempo en brazos libres o en cama. Sigue señales del bebé. Si llora en el portabebés, quizá necesita cambio de posición, pecho, o brazos libres.",
                    "RESPONDER A CRÍTICAS: 'Lo vas a mal acostumbrar' → 'Los bebés están diseñados para ser portados, es su naturaleza'. 'Nunca bajará' → 'Bajará cuando esté listo, como todos'. 'Le hará daño a la espalda' → 'La posición ergonómica es beneficiosa para su desarrollo'."
                ],
                commonObstacles: [
                    Obstacle(
                        obstacle: "Me duele la espalda de portear tanto",
                        solution: "Verifica que el portabebés esté bien ajustado. El peso debe distribuirse, no cargar solo en hombros. Considera cambiar de portabebés (algunos son más ergonómicos que otros). Ejercicios de fortalecimiento de espalda. Alternar entre portear y brazos libres. El dolor no debería ser intenso si la posición es correcta."
                    ),
                    Obstacle(
                        obstacle: "El bebé llora EN el portabebés a veces",
                        solution: "Razones posibles: (1) Necesita pecho (ofrécelo), (2) Tiene calor (quita capa de ropa), (3) Posición incómoda (reajusta), (4) Necesita cambio de pañal, (5) Simplemente quiere brazos libres en ese momento (es válido). No todos los momentos requieren portabebés. Sigue señales del bebé."
                    ),
                    Obstacle(
                        obstacle: "Me da vergüenza portear en público, la gente mira",
                        solution: "Portear es NORMAL en todo el mundo. Si en tu cultura no es común, puedes ser de las primeras. Las miradas son curiosidad, no siempre crítica. Con el tiempo te acostumbras. Portabebés bonitos ayudan (la gente aprecia el estilo). Recuerda: Estás satisfaciendo necesidad biológica de tu bebé, no hay vergüenza en eso."
                    )
                ],
                bookQuotes: [
                    "Los bebés humanos somos primates portadores. Nuestros bebés nacen esperando ser llevados en brazos 24/7, como los simios.",
                    "El reflejo de agarre (las manos cerradas del recién nacido) es herencia de cuando nos agarrábamos del pelo materno.",
                    "Portear no es malcriar. Es satisfacer una necesidad biológica. Es criar.",
                    "Los bebés en contacto constante (porteo) lloran menos, desarrollan mejor, y tienen madres más felices (manos libres)."
                ],
                ageRange: "0-2 años",
                category: .contact
            ),
            
            // SITUACIÓN 7: Protocolo Respuesta Rápida al Llanto
            BM5Situation(
                number: 7,
                title: "Protocolo de Respuesta Rápida al Llanto",
                context: "Te has comprometido a responder SIEMPRE al llanto de tu bebé. Necesitas un protocolo claro para diferentes contextos y tipos de llanto.",
                preparation: [
                    "ELIMINAR CULPA: Releer capítulo del libro sobre por qué responder es correcto. Responder NO malcría. Crear apego seguro. Bebés respondidos lloran MENOS a largo plazo.",
                    "APRENDER TIPOS DE LLANTO: Hambre (rítmico, insistente), sueño (quejumbroso, con bostezos), malestar (agudo, repentino), contacto (se calma al cogerlo), aburrimiento (gimoteo). Con tiempo reconocerás cada uno.",
                    "PREPARAR ENTORNO: Tener siempre cerca lo necesario (pañales, pecho accesible, agua, lugar cómodo para amamantar). Respuesta rápida requiere acceso rápido a soluciones.",
                    "CONVERSACIÓN CON PAREJA/FAMILIA: Explicar tu compromiso. Pedir que no cuestionen tu respuesta al llanto. Pedir apoyo ('tráeme agua mientras calmo al bebé') no críticas."
                ],
                implementationSteps: [
                    "EN CASA - RESPUESTA INMEDIATA: Cuando el bebé llora, acude EN SEGUNDOS. No esperes 'a ver si se calma'. No cuentes minutos. Ve. Cógelo. Tu presencia YA es consuelo. Mientras vas hacia él, habla ('Ya voy cariño, estoy aquí').",
                    "IDENTIFICAR NECESIDAD: (1) ¿Tiene hambre? → Ofrece pecho/comida. (2) ¿Tiene sueño? → Ayúdale a dormir (brazos, pecho, mecimiento). (3) ¿Pañal sucio? → Cámbialo. (4) ¿Dolor/malestar? → Revisar (gases, temperatura, ropa incómoda). (5) ¿Solo quiere contacto? → Dáselo sin dudar.",
                    "CONSOLAR: Coger en brazos, hablar con voz suave y tranquila, contacto piel con piel (es muy poderoso), mecerlo si le gusta, caminar con él, ofrecer pecho (aunque acabes de darle, consuela), cantar suavemente. TODO es válido.",
                    "EN LA CALLE: Parar lo que estés haciendo. Si estás comprando, dejar el carrito. Si estás caminando, parar. El bebé es prioridad. Cogerlo, consolarlo. La gente puede mirar, no importa. Cuando se calme, continúas.",
                    "DE NOCHE: Responder sin demora. Si practicas colecho, simplemente ofrece pecho o presencia (mano en su pecho, voz). Ni siquiera tienes que despertarte del todo. Bebé vuelve a dormir rápido. Si NO haces colecho, levántate y acude. Sí, es cansado. Pero es correcto y es TEMPORAL.",
                    "SI NO SE CALMA RÁPIDO: Algunos días el bebé llora inconsolablemente (cólicos, dolor, días difíciles). NO significa que estés fallando. Simplemente acompaña. A veces solo necesitan LLORAR (desahogo) pero acompañados. Tu presencia sigue siendo crucial aunque no pare el llanto inmediatamente."
                ],
                commonObstacles: [
                    Obstacle(
                        obstacle: "Llora TODO el día, respondo siempre pero no para",
                        solution: "Razones posibles: (1) Cólicos del lactante (0-3 meses, se pasan solos), (2) Crisis de lactancia (pide más, tu producción se ajusta), (3) Día difícil (estimulación excesiva, cambios), (4) Dolor real (gases, reflujo, dientes) → Consultar pediatra si es persistente. Carlos González: A veces los bebés lloran mucho a pesar de respuesta correcta. NO significa que responder esté mal. Significa que el bebé está pasando algo difícil y NECESITA tu presencia. Sigue respondiendo."
                    ),
                    Obstacle(
                        obstacle: "Me dicen que si siempre respondo, llorará más para manipularme",
                        solution: "FALSO según toda la evidencia. Los bebés respondidos lloran MENOS (confían en que serán atendidos, no necesitan escalar el llanto). Los bebés ignorados lloran MÁS (deben gritar más fuerte para obtener respuesta). Además, bebés pequeños NO tienen capacidad cognitiva para manipular. Es imposible neurológicamente."
                    ),
                    Obstacle(
                        obstacle: "Estoy agotada de responder constantemente, necesito un descanso",
                        solution: "VÁLIDO. Pide a tu pareja que tome turnos (unas horas tú, unas horas pareja). Pide ayuda con TODO lo demás (limpieza, cocina, compras). Prioriza descanso (siesta cuando bebé duerme). Si estás al límite, pide ayuda profesional o familiar (alguien que cuide al bebé 2 horas mientras tú duermes). Tu agotamiento es real y necesita solución, pero la solución NO es dejar llorar al bebé."
                    )
                ],
                bookQuotes: [
                    "El llanto es la única forma de comunicación del bebé. No es manipulación, es necesidad.",
                    "Los bebés que obtienen respuesta rápida y consistente lloran MENOS a largo plazo, no más.",
                    "Responder al llanto crea apego seguro. Ignorarlo crea inseguridad y ansiedad.",
                    "Los bebés no lloran para fastidiar. Lloran porque sufren. Los bebés ignorados no dejan de sufrir, solo dejan de pedir ayuda."
                ],
                ageRange: "0-3 años",
                category: .contact
            ),
            
            ]
    }
}
