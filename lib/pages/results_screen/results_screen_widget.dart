import '/backend/schema/structs/index.dart';
import '/components/breakdown_card_widget.dart';
import '/components/decorative_sparkle_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';
import 'results_screen_model.dart';
export 'results_screen_model.dart';

/// Create a PREMIUM, visually stunning results screen for an English learning
/// app called "Aprende Inglés con Lucía", optimized for iPad.
///
/// Think Duolingo-quality polish and delight.
///
/// DESIGN LANGUAGE:
/// - Modern, premium mobile game aesthetic
/// - Sky-blue to soft-pink gradient background with subtle floating
/// decorative elements (stars, sparkles, small clouds)
/// - Glassmorphism cards (frosted glass effect with blur, semi-transparent
/// white, subtle borders)
/// - Vibrant but tasteful color palette: coral pink (#FF6B9D), sky blue
/// (#4A9EFF), mint green (#3EDBB0), sunny yellow (#FFD93D)
/// - Poppins font family throughout
/// - Generous whitespace, everything breathes
/// - Rounded corners everywhere (20-28px radius)
/// - Soft layered shadows for depth
///
/// LAYOUT (top to bottom):
///
/// 1. Celebration header:
///    - Animated-looking trophy or medal illustration/emoji at top center,
/// large
///    - "¡Felicidades!" in bold gradient text, size 36
///    - User's name in a decorative pill badge below (bound to UserName)
///
/// 2. Hero score circle (the centerpiece):
///    - A large circular progress ring showing the percentage
///    - The percentage number huge in the center (size 56, bold)
///    - The ring should be a gradient stroke
///    - Small "Puntuación total" label below the number
///    - Surround with subtle glow effect
///
/// 3. Total correct answers card (glassmorphism):
///    - "Respuestas correctas" label
///    - Large fraction display "23 / 30" with the 23 emphasized in accent
/// color
///
/// 4. Breakdown cards (three separate glassmorphic cards in a column, each
/// distinct):
///    - Card 1 "Examen" — with a document/pencil icon, blue accent, score on
/// the right in a colored badge
///    - Card 2 "Listening MCQ" — with a headphones icon, green accent, score
/// badge
///    - Card 3 "Fill Words" — with a pencil/edit icon, pink accent, score
/// badge
///    - Each card has icon on left, label in middle, score badge on right
///    - Subtle hover/press states
///
/// 5. Motivational message banner:
///    - A small pill or banner with an encouraging message like "¡Sigue así!
/// 🌟"
///
/// 6. Premium CTA button:
///    - Large "Volver al Inicio" button
///    - Gradient fill (coral to pink), full width with side margins
///    - White bold text, size 20
///    - Rounded 24px, prominent drop shadow
///    - Small home icon on the left of the text
///
/// DETAILS THAT MATTER:
/// - Add depth with layered shadows
/// - Use gradients on key elements, not flat colors
/// - Consistent 16-24px spacing rhythm
/// - Make the percentage circle the clear focal point
/// - Decorative sparkle/star elements scattered subtly in the background
/// - Everything should feel celebratory, rewarding, and high-quality
///
/// Use placeholder values for now (name: "Carlos", percentage: 85%, correct:
/// 23/30, exam: 8/10, listening: 45/100, fill: 30/50). No logic or actions
/// needed, just the premium visual layout.
class ResultsScreenWidget extends StatefulWidget {
  const ResultsScreenWidget({super.key});

  static String routeName = 'ResultsScreen';
  static String routePath = '/resultsScreen';

  @override
  State<ResultsScreenWidget> createState() => _ResultsScreenWidgetState();
}

class _ResultsScreenWidgetState extends State<ResultsScreenWidget> {
  late ResultsScreenModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ResultsScreenModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.correctCount = FFAppState().totalExamScore;
      _model.totalCount = 100;
      _model.percentageText = (int total) {
        return '${total ?? 0}%';
      }(FFAppState().totalExamScore);
      safeSetState(() {});
    });
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: Stack(
          alignment: AlignmentDirectional(-1.0, -1.0),
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: Image.asset(
                    'assets/images/Designer_(23).png',
                  ).image,
                ),
                gradient: LinearGradient(
                  colors: [Color(0xFF4A9EFF), Color(0xFFFF6B9D)],
                  stops: [0.0, 1.0],
                  begin: AlignmentDirectional(1.0, 1.0),
                  end: AlignmentDirectional(-1.0, -1.0),
                ),
                shape: BoxShape.rectangle,
              ),
            ),
            wrapWithModel(
              model: _model.decorativeSparkleModel1,
              updateCallback: () => safeSetState(() {}),
              child: DecorativeSparkleWidget(
                top: 120.0,
                left: 80.0,
                size: 24.0,
              ),
            ),
            wrapWithModel(
              model: _model.decorativeSparkleModel2,
              updateCallback: () => safeSetState(() {}),
              child: DecorativeSparkleWidget(
                top: 400.0,
                left: 50.0,
                size: 16.0,
              ),
            ),
            wrapWithModel(
              model: _model.decorativeSparkleModel3,
              updateCallback: () => safeSetState(() {}),
              child: DecorativeSparkleWidget(
                top: 150.0,
                left: 700.0,
                size: 32.0,
              ),
            ),
            wrapWithModel(
              model: _model.decorativeSparkleModel4,
              updateCallback: () => safeSetState(() {}),
              child: DecorativeSparkleWidget(
                top: 600.0,
                left: 800.0,
                size: 20.0,
              ),
            ),
            SingleChildScrollView(
              primary: false,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(25.0, 40.0, 25.0, 40.0),
                    child: Container(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Align(
                            alignment: AlignmentDirectional(-1.0, -1.0),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  25.0, 25.0, 0.0, 0.0),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  FFAppState().allAnswers = [];
                                  FFAppState().allListeningQuestions = [];
                                  FFAppState().listeningScore = 0;
                                  FFAppState().currentFillExerciseIndex = 0;
                                  FFAppState().mcqPlayed = 0;
                                  safeSetState(() {});

                                  context.pushNamed(HomeScreenWidget.routeName);
                                },
                                child: Container(
                                  width: 100.0,
                                  height: 100.0,
                                  decoration: BoxDecoration(
                                    color: Color(0xFF3CD415),
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: Colors.white,
                                      width: 2.0,
                                    ),
                                  ),
                                  child: Icon(
                                    Icons.home,
                                    color: Color(0xFF216F0E),
                                    size: 90.0,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Lottie.network(
                                'https://dimg.dreamflow.cloud/v1/lottie/animated+gold+trophy',
                                width: 180.0,
                                height: 180.0,
                                fit: BoxFit.contain,
                                animate: true,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 8.0,
                                      color: Color(0x20000000),
                                      offset: Offset(
                                        0.0,
                                        4.0,
                                      ),
                                      spreadRadius: 0.0,
                                    )
                                  ],
                                  shape: BoxShape.rectangle,
                                ),
                                child: Text(
                                  '¡Felicidades!',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        font: GoogleFonts.poppins(
                                          fontWeight: FontWeight.w900,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                        color: Colors.black,
                                        fontSize: 42.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w900,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                        lineHeight: 1.4,
                                      ),
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100.0),
                                  shape: BoxShape.rectangle,
                                  border: Border.all(
                                    color: Colors.transparent,
                                    width: 1.0,
                                  ),
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      24.0, 8.0, 24.0, 8.0),
                                  child: Container(
                                    child: Text(
                                      FFAppState().UserName,
                                      style: FlutterFlowTheme.of(context)
                                          .titleMedium
                                          .override(
                                            font: GoogleFonts.poppins(
                                              fontWeight: FontWeight.w600,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .titleMedium
                                                      .fontStyle,
                                            ),
                                            color: Colors.black,
                                            fontSize: 24.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w600,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleMedium
                                                    .fontStyle,
                                            lineHeight: 1.4,
                                          ),
                                    ),
                                  ),
                                ),
                              ),
                            ].divide(SizedBox(height: 16.0)),
                          ),
                          Container(
                            height: 40.0,
                          ),
                          Stack(
                            alignment: AlignmentDirectional(0.0, 0.0),
                            children: [
                              ClipRect(
                                child: ImageFiltered(
                                  imageFilter: ImageFilter.blur(
                                    sigmaX: 40.0,
                                    sigmaY: 40.0,
                                  ),
                                  child: Container(
                                    width: 240.0,
                                    height: 240.0,
                                    decoration: BoxDecoration(
                                      color: Color(0x4DFFD93D),
                                      borderRadius:
                                          BorderRadius.circular(9999.0),
                                      shape: BoxShape.rectangle,
                                    ),
                                  ),
                                ),
                              ),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(9999.0),
                                child: BackdropFilter(
                                  filter: ImageFilter.blur(
                                    sigmaX: 10.0,
                                    sigmaY: 10.0,
                                  ),
                                  child: Container(
                                    width: 220.0,
                                    height: 220.0,
                                    decoration: BoxDecoration(
                                      color: Color(0x4DFFFFFF),
                                      borderRadius:
                                          BorderRadius.circular(9999.0),
                                      shape: BoxShape.rectangle,
                                      border: Border.all(
                                        color: Colors.transparent,
                                        width: 2.0,
                                      ),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.all(12.0),
                                      child: Container(
                                        child: Stack(
                                          alignment:
                                              AlignmentDirectional(0.0, 0.0),
                                          children: [
                                            CircularPercentIndicator(
                                              percent: (FFAppState()
                                                          .totalExamScore ??
                                                      0) /
                                                  100.0,
                                              radius: 100.0,
                                              lineWidth: 16.0,
                                              animation: true,
                                              animateFromLastPercent: true,
                                              progressColor: Color(0xFF3CD415),
                                              backgroundColor: Colors.white,
                                            ),
                                            Column(
                                              mainAxisSize: MainAxisSize.min,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Text(
                                                  (int total) {
                                                    return '${total ?? 0}%';
                                                  }(FFAppState()
                                                      .totalExamScore),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        font:
                                                            GoogleFonts.poppins(
                                                          fontWeight:
                                                              FontWeight.w900,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                        ),
                                                        color: Colors.black,
                                                        fontSize: 45.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w900,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontStyle,
                                                        lineHeight: 1.4,
                                                      ),
                                                ),
                                                Text(
                                                  'Puntuación total',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .labelSmall
                                                      .override(
                                                        font:
                                                            GoogleFonts.poppins(
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelSmall
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelSmall
                                                                  .fontStyle,
                                                        ),
                                                        color: Colors.black,
                                                        fontSize: 15.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelSmall
                                                                .fontWeight,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelSmall
                                                                .fontStyle,
                                                        lineHeight: 1.4,
                                                      ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Container(
                            height: 40.0,
                          ),
                          Container(
                            constraints: BoxConstraints(
                              maxWidth: 600.0,
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      200.0, 0.0, 200.0, 0.0),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(28.0),
                                    child: BackdropFilter(
                                      filter: ImageFilter.blur(
                                        sigmaX: 25.0,
                                        sigmaY: 25.0,
                                      ),
                                      child: Align(
                                        alignment:
                                            AlignmentDirectional(0.0, 0.0),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            boxShadow: [
                                              BoxShadow(
                                                blurRadius: 25.0,
                                                color: Color(0x15000000),
                                                offset: Offset(
                                                  0.0,
                                                  10.0,
                                                ),
                                                spreadRadius: 0.0,
                                              )
                                            ],
                                            borderRadius:
                                                BorderRadius.circular(28.0),
                                            shape: BoxShape.rectangle,
                                            border: Border.all(
                                              color: Color(0xFF3CD415),
                                              width: 5.0,
                                            ),
                                          ),
                                          child: Padding(
                                            padding: EdgeInsets.all(32.0),
                                            child: Container(
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Column(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        (String examType,
                                                                String
                                                                    examSubject) {
                                                          return () {
                                                            const names = {
                                                              'matematicas':
                                                                  'Matemáticas',
                                                              'lengua_literatura':
                                                                  'Lengua y Literatura',
                                                              'geografia_historia':
                                                                  'Geografía e Historia',
                                                              'fisica_quimica':
                                                                  'Física y Química',
                                                              'ingles':
                                                                  'Inglés',
                                                              'biologia_geologia':
                                                                  'Biología y Geología',
                                                            };
                                                            if (examType ==
                                                                'subject') {
                                                              return 'Examen de ${names[examSubject] ?? examSubject}';
                                                            }
                                                            return 'Examen Global';
                                                          }();
                                                        }(
                                                            FFAppState()
                                                                .examType,
                                                            FFAppState()
                                                                .examSubject),
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .titleLarge
                                                            .override(
                                                              font: GoogleFonts
                                                                  .poppins(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleLarge
                                                                    .fontStyle,
                                                              ),
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 36.0,
                                                              letterSpacing:
                                                                  0.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              fontStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleLarge
                                                                      .fontStyle,
                                                              lineHeight: 1.4,
                                                            ),
                                                      ),
                                                      Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                0.0, 0.0),
                                                        child: Text(
                                                          '¡Excelente progreso hoy!',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                font: GoogleFonts
                                                                    .poppins(
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                                ),
                                                                color: Colors
                                                                    .black,
                                                                fontSize: 18.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontWeight,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                                lineHeight: 1.4,
                                                              ),
                                                        ),
                                                      ),
                                                    ].divide(
                                                        SizedBox(height: 4.0)),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        if ((String examType,
                                                String examSubject) {
                                          return examType == 'global' ||
                                              (examType == 'subject' &&
                                                  examSubject == 'matematicas');
                                        }(FFAppState().examType,
                                            FFAppState().examSubject))
                                          Flexible(
                                            child: Align(
                                              alignment: AlignmentDirectional(
                                                  0.0, 0.0),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 10.0, 0.0),
                                                child: wrapWithModel(
                                                  model: _model
                                                      .breakdownCardModel1,
                                                  updateCallback: () =>
                                                      safeSetState(() {}),
                                                  child: BreakdownCardWidget(
                                                    tone: Color(0xFF00ACC1),
                                                    icon: Icon(
                                                      Icons.calculate_rounded,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                      size: 36.0,
                                                    ),
                                                    title: 'Matemáticas',
                                                    score: (int scoreMCQ,
                                                            int scoreExc,
                                                            int mcqCount,
                                                            int exerciseCount) {
                                                      return '${scoreMCQ ?? 0}/${mcqCount ?? 10} · ${scoreExc ?? 0}/${exerciseCount ?? 2}';
                                                    }(
                                                        FFAppState()
                                                            .scoreMatematicas,
                                                        FFAppState()
                                                            .exerciseMatematicas,
                                                        FFAppState().mcqCount,
                                                        FFAppState()
                                                            .exerciseCount),
                                                    total: '',
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        if ((String examType,
                                                String examSubject) {
                                          return examType == 'global' ||
                                              (examType == 'subject' &&
                                                  examSubject ==
                                                      'lengua_literatura');
                                        }(FFAppState().examType,
                                            FFAppState().examSubject))
                                          Flexible(
                                            child: Align(
                                              alignment: AlignmentDirectional(
                                                  0.0, 0.0),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        10.0, 0.0, 0.0, 0.0),
                                                child: wrapWithModel(
                                                  model: _model
                                                      .breakdownCardModel2,
                                                  updateCallback: () =>
                                                      safeSetState(() {}),
                                                  child: BreakdownCardWidget(
                                                    tone: Color(0xFF8E24AA),
                                                    icon: Icon(
                                                      Icons.menu_book_sharp,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                      size: 30.0,
                                                    ),
                                                    title:
                                                        'Lengua y Literatura',
                                                    score: (int scoreMCQ,
                                                            int scoreExc,
                                                            int mcqCount,
                                                            int exerciseCount) {
                                                      return '${scoreMCQ ?? 0}/${mcqCount ?? 10} · ${scoreExc ?? 0}/${exerciseCount ?? 2}';
                                                    }(
                                                        FFAppState()
                                                            .scoreLengua,
                                                        FFAppState()
                                                            .exerciseLengua,
                                                        FFAppState().mcqCount,
                                                        FFAppState()
                                                            .exerciseCount),
                                                    total: '',
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        if ((String examType,
                                                String examSubject) {
                                          return examType == 'global' ||
                                              (examType == 'subject' &&
                                                  examSubject ==
                                                      'geografia_historia');
                                        }(FFAppState().examType,
                                            FFAppState().examSubject))
                                          Flexible(
                                            child: Align(
                                              alignment: AlignmentDirectional(
                                                  0.0, 0.0),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 10.0, 0.0),
                                                child: wrapWithModel(
                                                  model: _model
                                                      .breakdownCardModel3,
                                                  updateCallback: () =>
                                                      safeSetState(() {}),
                                                  child: BreakdownCardWidget(
                                                    tone: Color(0xFF43A047),
                                                    icon: Icon(
                                                      Icons.travel_explore,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                      size: 30.0,
                                                    ),
                                                    title:
                                                        'Geografía e Historia',
                                                    score: (int scoreMCQ,
                                                            int scoreExc,
                                                            int mcqCount,
                                                            int exerciseCount) {
                                                      return '${scoreMCQ ?? 0}/${mcqCount ?? 10} · ${scoreExc ?? 0}/${exerciseCount ?? 2}';
                                                    }(
                                                        FFAppState()
                                                            .scoreGeografia,
                                                        FFAppState()
                                                            .exerciseGeografia,
                                                        FFAppState().mcqCount,
                                                        FFAppState()
                                                            .exerciseCount),
                                                    total: '',
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        if ((String examType,
                                                String examSubject) {
                                          return examType == 'global' ||
                                              (examType == 'subject' &&
                                                  examSubject ==
                                                      'fisica_quimica');
                                        }(FFAppState().examType,
                                            FFAppState().examSubject))
                                          Flexible(
                                            child: Align(
                                              alignment: AlignmentDirectional(
                                                  0.0, 0.0),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        10.0, 0.0, 0.0, 0.0),
                                                child: wrapWithModel(
                                                  model: _model
                                                      .breakdownCardModel4,
                                                  updateCallback: () =>
                                                      safeSetState(() {}),
                                                  child: BreakdownCardWidget(
                                                    tone: Color(0xFFFB8C00),
                                                    icon: Icon(
                                                      Icons.science,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                      size: 30.0,
                                                    ),
                                                    title: 'Física y Química',
                                                    score: (int scoreMCQ,
                                                            int scoreExc,
                                                            int mcqCount,
                                                            int exerciseCount) {
                                                      return '${scoreMCQ ?? 0}/${mcqCount ?? 10} · ${scoreExc ?? 0}/${exerciseCount ?? 2}';
                                                    }(
                                                        FFAppState()
                                                            .scoreFisica,
                                                        FFAppState()
                                                            .exerciseFisica,
                                                        FFAppState().mcqCount,
                                                        FFAppState()
                                                            .exerciseCount),
                                                    total: '',
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        if ((String examType,
                                                String examSubject) {
                                          return examType == 'global' ||
                                              (examType == 'subject' &&
                                                  examSubject == 'ingles');
                                        }(FFAppState().examType,
                                            FFAppState().examSubject))
                                          Flexible(
                                            child: Align(
                                              alignment: AlignmentDirectional(
                                                  0.0, 0.0),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 10.0, 0.0),
                                                child: wrapWithModel(
                                                  model: _model
                                                      .breakdownCardModel5,
                                                  updateCallback: () =>
                                                      safeSetState(() {}),
                                                  child: BreakdownCardWidget(
                                                    tone: Color(0xFFD81B60),
                                                    icon: Icon(
                                                      Icons.translate_sharp,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                      size: 30.0,
                                                    ),
                                                    title: 'Inglés',
                                                    score: (int scoreMCQ,
                                                            int scoreExc,
                                                            int mcqCount,
                                                            int exerciseCount) {
                                                      return '${scoreMCQ ?? 0}/${mcqCount ?? 10}';
                                                    }(
                                                        FFAppState()
                                                            .scoreIngles,
                                                        FFAppState()
                                                            .exerciseIngles,
                                                        FFAppState().mcqCount,
                                                        FFAppState()
                                                            .exerciseCount),
                                                    total: '',
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        if ((String examType,
                                                String examSubject) {
                                          return examType == 'global' ||
                                              (examType == 'subject' &&
                                                  examSubject ==
                                                      'biologia_geologia');
                                        }(FFAppState().examType,
                                            FFAppState().examSubject))
                                          Flexible(
                                            child: Align(
                                              alignment: AlignmentDirectional(
                                                  0.0, 0.0),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        10.0, 0.0, 0.0, 0.0),
                                                child: wrapWithModel(
                                                  model: _model
                                                      .breakdownCardModel6,
                                                  updateCallback: () =>
                                                      safeSetState(() {}),
                                                  child: BreakdownCardWidget(
                                                    tone: Color(0xFF00ACC1),
                                                    icon: Icon(
                                                      Icons.biotech,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                      size: 30.0,
                                                    ),
                                                    title:
                                                        'Biología y Geología',
                                                    score: (int scoreMCQ,
                                                            int scoreExc,
                                                            int mcqCount,
                                                            int exerciseCount) {
                                                      return '${scoreMCQ ?? 0}/${mcqCount ?? 10} · ${scoreExc ?? 0}/${exerciseCount ?? 2}';
                                                    }(
                                                        FFAppState()
                                                            .scoreBiologia,
                                                        FFAppState()
                                                            .exerciseBiologia,
                                                        FFAppState().mcqCount,
                                                        FFAppState()
                                                            .exerciseCount),
                                                    total: '',
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        if ((String examType,
                                                String examSubject) {
                                          return examType == 'global' ||
                                              (examType == 'subject' &&
                                                  examSubject == 'ingles');
                                        }(FFAppState().examType,
                                            FFAppState().examSubject))
                                          Flexible(
                                            child: Align(
                                              alignment: AlignmentDirectional(
                                                  0.0, 0.0),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 10.0, 0.0),
                                                child: wrapWithModel(
                                                  model: _model
                                                      .breakdownCardModel7,
                                                  updateCallback: () =>
                                                      safeSetState(() {}),
                                                  child: BreakdownCardWidget(
                                                    tone: Color(0xFFD2DB3E),
                                                    icon: Icon(
                                                      Icons.headphones_rounded,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                      size: 24.0,
                                                    ),
                                                    title:
                                                        'Comprensión Auditiva',
                                                    score: (int listeningScore,
                                                            int exerciseCount) {
                                                      return '${listeningScore ?? 0}/${(exerciseCount ?? 1) * 5}';
                                                    }(
                                                        FFAppState()
                                                            .listeningScore,
                                                        FFAppState()
                                                            .exerciseCount),
                                                    total: '',
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                      ],
                                    ),
                                  ].divide(SizedBox(height: 16.0)),
                                ),
                                Container(
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                        blurRadius: 20.0,
                                        color: Color(0x60FF6B9D),
                                        offset: Offset(
                                          0.0,
                                          8.0,
                                        ),
                                        spreadRadius: 0.0,
                                      )
                                    ],
                                    shape: BoxShape.rectangle,
                                  ),
                                  child: Container(
                                    width: 0.0,
                                    height: 0.0,
                                  ),
                                ),
                              ].divide(SizedBox(height: 24.0)),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
