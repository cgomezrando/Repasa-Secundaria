import '/components/guide_section_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'instructions_page_model.dart';
export 'instructions_page_model.dart';

/// PROMPT PARA FLUTTERFLOW AI - PÁGINA DE GUÍA INTERACTIVA
///
/// ===== OBJETIVO =====
/// Crear una página de guía de usuario (HelpScreen o GuideScreen) para la app
/// "Aprende Inglés con Lucía" que sea completamente desplegable verticalmente
/// (scroll).
///
/// Cada sección debe ser un widget collapsible (expandible/contraíble).
///
/// ===== ESTRUCTURA GENERAL =====
/// La página debe tener:
/// 1. Header fijo con título y logo
/// 2. Scroll vertical con múltiples secciones desplegables
/// 3. Cada sección tiene un título + icono + contenido que se expande/contrae
/// 4. Footer con botón para volver atrás
///
/// ===== SECCIONES PRINCIPALES =====
///
/// SECCIÓN 1: "Pantalla Principal"
/// - Icono: 🏠
/// - Contenido expandido: Explica que hay 3 actividades (Examen, Listening
/// MCQ, Fill Words)
/// - Estado inicial: COLAPSADO
///
/// SECCIÓN 2: "¿Cómo usar Listening MCQ?"
/// - Icono: 🎧
/// - Contenido expandido: Pasos numerados (1-6):
///   1. Toca "Listening MCQ"
///   2. Lee la pregunta y escucha el audio
///   3. Elige tu respuesta (A, B, C, D)
///   4. Recibe retroalimentación (✅ o ❌)
///   5. Continúa con las siguientes preguntas
///   6. Ve tus resultados
/// - Incluir: "Puedes reproducir el audio tantas veces como necesites"
/// - Estado inicial: COLAPSADO
///
/// SECCIÓN 3: "¿Cómo usar Fill Words?"
/// - Icono: ✏️
/// - Contenido expandido: Pasos numerados (1-8):
///   1. Toca "Fill Words"
///   2. Lee el texto con huecos [1] [2] [3]
///   3. Escucha el audio (botón 🔊)
///   4. Elige palabras del banco de 8 palabras
///   5. Coloca la palabra en el hueco correcto
///   6. Toca el botón CHECK
///   7. Ve qué respondiste correctamente (✅ o ❌)
///   8. Continúa con el siguiente ejercicio
/// - Incluir nota: "Los huecos están marcados con números"
/// - Estado inicial: COLAPSADO
///
/// SECCIÓN 4: "Entender mis Resultados"
/// - Icono: 🏆
/// - Contenido expandido:
///   - Explicar que después de cada actividad ves puntuación
///   - Listening MCQ: máximo 100 puntos
///   - Fill Words: máximo 50 puntos
///   - Porcentaje total de aciertos
///   - Botón para volver al inicio
/// - Estado inicial: COLAPSADO
///
/// SECCIÓN 5: "Consejos para Aprender Mejor"
/// - Icono: 💡
/// - Contenido expandido: 6 consejos:
///   1. Escucha el audio varias veces
///   2. Lee cuidadosamente
///   3. Usa el contexto para adivinar
///   4. Aprende de tus errores
///   5. Practica regularmente (15-30 min/día)
///   6. No tengas miedo de equivocarte
/// - Estado inicial: COLAPSADO
///
/// SECCIÓN 6: "Preguntas Frecuentes"
/// - Icono: ❓
/// - Contenido expandido: Sub-secciones collapsibles con Q&A:
///   Q1: "¿Qué hago si no entiendo el audio?"
///   R1: "Toca el botón 🔊 para reproducirlo de nuevo tantas veces como
/// quieras..."
///
///   Q2: "¿Cuánto tiempo debería practicar cada día?"
///   R2: "Lo ideal es 15-30 minutos al día..."
///
///   Q3: "¿Qué significan los números en los resultados?"
///   R3: "Los números muestran cuántas respuestas correctas tuviste..."
///
///   Q4: "¿Puedo hacer las actividades en cualquier orden?"
///   R4: "Sí, puedes elegir. La pantalla principal te muestra tres
/// opciones..."
///
///   Q5: "¿Qué pasa si cometo un error en Fill Words?"
///   R5: "Cuando toques CHECK, verás de qué color está cada respuesta..."
///
///   Q6: "¿Hay límite de intentos?"
///   R6: "No, puedes intentar tantas veces como quieras..."
///
/// - Estado inicial: COLAPSADO
///
/// ===== ESTILO VISUAL =====
/// - Color principal: Gradiente púrpura/rosa (#667eea a #764ba2)
/// - Fondo: Blanco con secciones de fondo gris claro (#f9f9f9)
/// - Texto de títulos: Oscuro (#333) y bold
/// - Texto de contenido: Gris (#666) con tamaño 15-16px
/// - Iconos: 32-40px, con círculo de fondo semi-transparente
/// - Borde izquierdo en cada sección: 5px de color según tipo (púrpura por
/// defecto)
/// - Espaciado: 15-20px entre secciones
/// - Esquinas redondeadas: 12-15px en cards
///
/// ===== COMPORTAMIENTO INTERACTIVO =====
/// - Al tocar el título de una sección, se expande/contrae
/// - Transición suave (animación 300ms)
/// - Icono de chevron (▼ / ▶) que rota cuando se expande
/// - Solo una sección puede estar abierta a la vez (opcional: permitir
/// múltiples)
/// - El contenido se expande hacia abajo sin empujar el header
///
/// ===== HEADER =====
/// - Título: "📚 Aprende Inglés con Lucía - Guía de Ayuda"
/// - Tamaño: 24-28px, bold, color blanco
/// - Fondo: Gradiente púrpura (#667eea a #764ba2)
/// - Padding: 20px vertical, 15px horizontal
/// - Icono de volver atrás: esquina superior izquierda
/// - Altura total: 80-100px
/// - Estado: FIJO (no se mueve al hacer scroll)
///
/// ===== FOOTER =====
/// - Botón: "← Volver" o "Ir al Inicio"
/// - Tamaño: Full width con márgenes 15px
/// - Color: Gradiente púrpura
/// - Padding: 15px vertical, 20px horizontal
/// - Función: navegar a HomeScreen
///
/// ===== COMPORTAMIENTO DE SCROLL =====
/// - ScrollDirection: vertical
/// - Scroll controllers habilitados
/// - Padding entre secciones: 15px
/// - Safe area respetada
/// - En móvil: máximo 100% del ancho
/// - En tablet: máximo 900px de ancho, centrado
///
/// ===== CONTENIDO ESPECÍFICO A INCLUIR =====
/// - Todo el texto debe estar en español
/// - Emojis para cada icono (no usar iconos Material Design solos)
/// - Incluir ejemplos visuales donde sea posible (ej: "Elige entre A, B, C,
/// D")
/// - Las palabras clave en negrilla: "CHECK", "audio", "retroalimentación",
/// "resultados"
/// - Incluir notas destacadas (tip boxes) en Fill Words y Listening MCQ
///
/// ===== VARIABLES Y COMPONENTES FLUTTERFLOW =====
/// - Usar SingleChildScrollView para el scroll vertical
/// - Usar Column para la estructura principal
/// - Usar ExpansionTile o CustomCode para los collapsibles
/// - AppState: guardar cuál sección está abierta (lastOpenSection)
/// - Navigation: botón volver debe usar context.safePop()
/// - No usar PopupMenuButton, usar ExpansionTile nativo
///
/// ===== PARÁMETROS DE ENTRADA =====
/// Sin parámetros de entrada requeridos. La página se abre desde HomeScreen.
///
/// ===== PARÁMETROS DE SALIDA =====
/// Al tocar "Volver": navega a HomeScreen
///
/// ===== REQUISITOS TÉCNICOS =====
/// - Crear página llamada: HelpAndGuideScreen (o GuideScreen)
/// - Crear archivo modelo correspondiente
/// - Sin Custom Code si es posible (usar widgets nativos)
/// - Compatible con iPad y móvil (responsive)
/// - Debe funcionar en Test Mode sin errores
///
/// ===== NOTAS ADICIONALES =====
/// - El contenido NO debe cambiar según usuario (es estático)
/// - Incluir animación suave al expandir/contraer
/// - El scroll debe ser fluido sin lag
/// - Los emojis deben ser legibles en todos los tamaños de pantalla
/// - Hacer que sea accesible desde Hom
class InstructionsPageWidget extends StatefulWidget {
  const InstructionsPageWidget({super.key});

  static String routeName = 'InstructionsPage';
  static String routePath = '/instructionsPage';

  @override
  State<InstructionsPageWidget> createState() => _InstructionsPageWidgetState();
}

class _InstructionsPageWidgetState extends State<InstructionsPageWidget> {
  late InstructionsPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => InstructionsPageModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Colors.white,
        body: Stack(
          alignment: AlignmentDirectional(-1.0, -1.0),
          children: [
            Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  height: 120.0,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Color(0xFF667EEA), Color(0xFF4BA263)],
                      stops: [0.0, 1.0],
                      begin: AlignmentDirectional(1.0, 0.0),
                      end: AlignmentDirectional(-1.0, 0),
                    ),
                    shape: BoxShape.rectangle,
                  ),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 24.0),
                    child: Container(
                      child: Container(
                        height: 76.0,
                        alignment: AlignmentDirectional(0.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      10.0, 10.0, 0.0, 0.0),
                                  child: Text(
                                    'Trivia de Secundaria',
                                    style: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .override(
                                          font: GoogleFonts.poppins(
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium
                                                    .fontStyle,
                                          ),
                                          color: Color(0xCCFFFFFF),
                                          fontSize: 20.0,
                                          letterSpacing: 0.0,
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium
                                                  .fontStyle,
                                          lineHeight: 1.4,
                                        ),
                                  ),
                                ),
                                Text(
                                  '📚 Guía de Ayuda',
                                  style: FlutterFlowTheme.of(context)
                                      .titleLarge
                                      .override(
                                        font: GoogleFonts.poppins(
                                          fontWeight: FontWeight.bold,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .titleLarge
                                                  .fontStyle,
                                        ),
                                        color: Colors.white,
                                        fontSize: 32.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.bold,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .titleLarge
                                            .fontStyle,
                                      ),
                                ),
                              ].divide(SizedBox(height: 4.0)),
                            ),
                          ].divide(SizedBox(width: 16.0)),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color(0xFF050816),
                    ),
                    child: SingleChildScrollView(
                      primary: false,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Padding(
                            padding: EdgeInsets.all(24.0),
                            child: Container(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  wrapWithModel(
                                    model: _model.guideSectionModel1,
                                    updateCallback: () => safeSetState(() {}),
                                    child: GuideSectionWidget(
                                      borderColor: Color(0x00000000),
                                      emoji: '🏠',
                                      title: 'Pantalla Principal',
                                      isOpen: true,
                                      content:
                                          'En la pantalla de inicio, escribe tu nombre y elige una de las dos opciones:\n\n- HAZ UN EXAMEN: pon a prueba lo que sabes. Podrás elegir entre un examen de una sola asignatura o un examen global con las 6 asignaturas. Al final obtendrás una nota sobre 100.\n\n- APRENDE PRACTICANDO: repasa libremente por asignatura, sin nota y sin límite de intentos, con test rápidos y ejercicios detallados.',
                                    ),
                                  ),
                                  wrapWithModel(
                                    model: _model.guideSectionModel2,
                                    updateCallback: () => safeSetState(() {}),
                                    child: GuideSectionWidget(
                                      emoji: '✏️',
                                      title: '¿Cómo hacer el Examen?',
                                      isOpen: true,
                                      content:
                                          'Al pulsar HAZ UN EXAMEN eliges el tipo de examen:\n\nEXAMEN POR ASIGNATURA\nTe centras en una sola asignatura: 10 preguntas tipo test + 2 ejercicios. En Inglés, los ejercicios son de comprensión auditiva.\n\nEXAMEN GLOBAL\nRepasas las 6 asignaturas seguidas. En cada una: 6 preguntas tipo test + 1 ejercicio (en Inglés, comprensión auditiva).\n\nEn cada pregunta eliges una opción entre A, B, C o D. Al responder pasas automáticamente a la siguiente; no puedes volver atrás. Al terminar verás tu nota final sobre 100.',
                                    ),
                                  ),
                                  wrapWithModel(
                                    model: _model.guideSectionModel3,
                                    updateCallback: () => safeSetState(() {}),
                                    child: GuideSectionWidget(
                                      emoji: '🎯',
                                      title: 'Modo Práctica',
                                      isOpen: true,
                                      content:
                                          'En APRENDE PRACTICANDO eliges una asignatura y practicas sin nota, todas las veces que quieras:\n\nTEST RÁPIDO\nPreguntas tipo test con 4 opciones para repasar los conceptos básicos.\n\nEJERCICIOS DETALLADOS\nEjercicios con contexto y pistas paso a paso para entender el razonamiento de cada respuesta.\n\nLa práctica no genera nota: es solo para aprender y repasar.',
                                    ),
                                  ),
                                  wrapWithModel(
                                    model: _model.guideSectionModel4,
                                    updateCallback: () => safeSetState(() {}),
                                    child: GuideSectionWidget(
                                      emoji: '🎧',
                                      title: 'Comprensión Auditiva (Inglés)',
                                      isOpen: true,
                                      content:
                                          'El ejercicio de Inglés es de escucha. Funciona por rondas de 5 preguntas:\n\n1. Escucha el audio con atención (puedes repetirlo).\n2. Lee la pregunta.\n3. Elige la respuesta correcta entre A, B, C o D.\n4. Recibes retroalimentación al instante.\n\nEn el examen por asignatura de Inglés harás 2 rondas (10 preguntas en total). En el examen global harás 1 ronda (5 preguntas).\n\nConsejo: escucha cada audio al menos 2 veces antes de responder.',
                                    ),
                                  ),
                                  wrapWithModel(
                                    model: _model.guideSectionModel5,
                                    updateCallback: () => safeSetState(() {}),
                                    child: GuideSectionWidget(
                                      emoji: '🏆',
                                      title: 'Cómo se calcula la Nota',
                                      isOpen: true,
                                      content:
                                          'Tu nota siempre es sobre 100 puntos.\n\nEn cada asignatura, la nota se reparte así:\n- Preguntas tipo test: 60%\n- Ejercicios: 40%\n\nEXAMEN POR ASIGNATURA\nLos 100 puntos salen de esa única asignatura: 60 puntos de las 10 preguntas tipo test y 40 puntos de los 2 ejercicios (en Inglés, de la comprensión auditiva).\n\nEXAMEN GLOBAL\nLas 6 asignaturas se reparten los 100 puntos a partes iguales. En cada una, las preguntas tipo test valen el 60% y el ejercicio el 40%.\n\nEn la pantalla de resultados verás tu puntuación de cada asignatura y tu nota total sobre 100.',
                                    ),
                                  ),
                                  wrapWithModel(
                                    model: _model.guideSectionModel6,
                                    updateCallback: () => safeSetState(() {}),
                                    child: GuideSectionWidget(
                                      emoji: '💡',
                                      title: 'Consejos y Preguntas Frecuentes',
                                      isOpen: true,
                                      content:
                                          'CONSEJOS PARA APROBAR\n\n- Lee cada pregunta con calma antes de responder.\n- En el examen no puedes volver atrás, tómate tu tiempo.\n- Practica cada asignatura por separado antes de examinarte.\n- Repasa las asignaturas que peor se te dan.\n- Escucha los audios de inglés varias veces.\n\nPREGUNTAS FRECUENTES\n\nP: ¿Qué diferencia hay entre el examen por asignatura y el global?\nR: El de asignatura se centra en una sola materia (10 test + 2 ejercicios). El global recorre las 6 asignaturas (6 test + 1 ejercicio cada una). Los dos dan una nota sobre 100.\n\nP: ¿Puedo saltarme preguntas?\nR: No, debes responder cada pregunta para avanzar.\n\nP: ¿Puedo repetir el examen?\nR: Sí, las veces que quieras. Cada intento trae preguntas aleatorias.\n\nP: ¿Cuál es la nota mínima para aprobar?\nR: Se considera aprobado a partir de 50 puntos sobre 100.\n\nP: ¿La práctica cuenta para la nota?\nR: No. La práctica es solo para aprender; solo el examen genera nota.',
                                    ),
                                  ),
                                  Container(
                                    height: 80.0,
                                  ),
                                ].divide(SizedBox(height: 24.0)),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Align(
              alignment: AlignmentDirectional(1.0, -1.0),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20.0, 10.0, 10.0, 0.0),
                child: InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    context.safePop();
                  },
                  child: Container(
                    width: 75.0,
                    height: 75.0,
                    decoration: BoxDecoration(
                      color: Color(0xFF3CD415),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(12.0),
                        topRight: Radius.circular(12.0),
                        bottomLeft: Radius.circular(12.0),
                        bottomRight: Radius.circular(12.0),
                      ),
                      shape: BoxShape.rectangle,
                      border: Border.all(
                        color: Colors.white,
                        width: 2.0,
                      ),
                    ),
                    child: Icon(
                      Icons.arrow_back,
                      color: Color(0xFF216F0E),
                      size: 65.0,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
