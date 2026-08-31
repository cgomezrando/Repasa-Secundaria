import '/backend/schema/structs/index.dart';
import '/components/menu_button/menu_button_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'home_screen_model.dart';
export 'home_screen_model.dart';

class HomeScreenWidget extends StatefulWidget {
  const HomeScreenWidget({super.key});

  static String routeName = 'HomeScreen';
  static String routePath = '/homeScreen';

  @override
  State<HomeScreenWidget> createState() => _HomeScreenWidgetState();
}

class _HomeScreenWidgetState extends State<HomeScreenWidget> {
  late HomeScreenModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomeScreenModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      FFAppState().examenCorrect = 0;
      FFAppState().totalExamScore = 0;
      FFAppState().allAnswers = [];
      FFAppState().scoreMatematicas = 0;
      FFAppState().scoreLengua = 0;
      FFAppState().scoreGeografia = 0;
      FFAppState().scoreFisica = 0;
      FFAppState().scoreIngles = 0;
      FFAppState().scoreBiologia = 0;
      safeSetState(() {});
    });

    _model.inputJugador1TextController ??= TextEditingController();
    _model.inputJugador1FocusNode ??= FocusNode();
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
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: Image.asset(
                'assets/images/Designer_(23).png',
              ).image,
            ),
          ),
          child: Stack(
            alignment: AlignmentDirectional(-1.0, -1.0),
            children: [
              Align(
                alignment: AlignmentDirectional(0.0, 0.0),
                child: Padding(
                  padding: EdgeInsets.all(32.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Flexible(
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 50.0),
                          child: GradientText(
                            'TRIVIA DE \nEDUCACIÓN SECUNDARIA',
                            textAlign: TextAlign.center,
                            style: FlutterFlowTheme.of(context)
                                .headlineLarge
                                .override(
                                  font: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w900,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .headlineLarge
                                        .fontStyle,
                                  ),
                                  color: FlutterFlowTheme.of(context).secondary,
                                  fontSize: 64.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w900,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .headlineLarge
                                      .fontStyle,
                                  lineHeight: 1.0,
                                ),
                            colors: [
                              FlutterFlowTheme.of(context).primary,
                              FlutterFlowTheme.of(context).secondary
                            ],
                            gradientDirection: GradientDirection.ltr,
                            gradientType: GradientType.linear,
                          ),
                        ),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Flexible(
                            child: Icon(
                              Icons.person,
                              color: Color(0xFF3CD415),
                              size: 42.0,
                            ),
                          ),
                          Align(
                            alignment: AlignmentDirectional(-1.0, 0.0),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  10.0, 0.0, 0.0, 0.0),
                              child: Container(
                                width: 450.0,
                                height: 40.0,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10.0),
                                    topRight: Radius.circular(10.0),
                                    bottomLeft: Radius.circular(10.0),
                                    bottomRight: Radius.circular(10.0),
                                  ),
                                ),
                                alignment: AlignmentDirectional(-1.0, 0.0),
                                child: Align(
                                  alignment: AlignmentDirectional(-1.0, 0.0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10.0, 0.0, 0.0, 0.0),
                                    child: TextFormField(
                                      controller:
                                          _model.inputJugador1TextController,
                                      focusNode: _model.inputJugador1FocusNode,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        isDense: true,
                                        hintText: 'Introduce tu nombre..',
                                        hintStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              font: GoogleFonts.poppins(
                                                fontWeight:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontStyle,
                                              ),
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .accent3,
                                              letterSpacing: 0.0,
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                              lineHeight: 1.5,
                                            ),
                                        enabledBorder: InputBorder.none,
                                        focusedBorder: InputBorder.none,
                                        errorBorder: InputBorder.none,
                                        focusedErrorBorder: InputBorder.none,
                                        hoverColor: FlutterFlowTheme.of(context)
                                            .primary,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            font: GoogleFonts.poppins(
                                              fontWeight: FontWeight.w600,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            fontSize: 16.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w600,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                            lineHeight: 1.5,
                                          ),
                                      validator: _model
                                          .inputJugador1TextControllerValidator
                                          .asValidator(context),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            0.0, 25.0, 0.0, 200.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  150.0, 0.0, 150.0, 50.0),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  FFAppState().UserName =
                                      _model.inputJugador1TextController.text;
                                  safeSetState(() {});
                                  if (FFAppState().UserName == '') {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          'Por favor, ingresa tu nombre',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyLarge
                                              .override(
                                                font: GoogleFonts.poppins(
                                                  fontWeight:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyLarge
                                                          .fontWeight,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyLarge
                                                          .fontStyle,
                                                ),
                                                color: Colors.black,
                                                fontSize: 24.0,
                                                letterSpacing: 0.0,
                                                fontWeight:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyLarge
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyLarge
                                                        .fontStyle,
                                              ),
                                        ),
                                        duration: Duration(milliseconds: 4000),
                                        backgroundColor:
                                            FlutterFlowTheme.of(context)
                                                .secondary,
                                      ),
                                    );
                                  } else {
                                    FFAppState().examenCorrect = 0;
                                    FFAppState().totalExamScore = 0;
                                    FFAppState().allAnswers = [];
                                    FFAppState().scoreMatematicas = 0;
                                    FFAppState().scoreLengua = 0;
                                    FFAppState().scoreGeografia = 0;
                                    FFAppState().scoreFisica = 0;
                                    FFAppState().scoreIngles = 0;
                                    FFAppState().scoreBiologia = 0;
                                    FFAppState().currentSession =
                                        ExamSessionStruct(
                                      mode: 'exam',
                                      currentFront: 'subjects',
                                      currentBlock: 'matematicas',
                                      currentQIndex: 0,
                                      score: 0,
                                      totalAnswered: 0,
                                      sessionId: 'session1',
                                    );
                                    FFAppState().listeningScore = 0;
                                    FFAppState().mcqPlayed = 0;
                                    safeSetState(() {});

                                    context.pushNamed(
                                        ExamSelectionScreenWidget.routeName);
                                  }
                                },
                                child: wrapWithModel(
                                  model: _model.menuButtonModel1,
                                  updateCallback: () => safeSetState(() {}),
                                  child: MenuButtonWidget(
                                    action: 'navigate:PlayerSetup',
                                    bg: 'primary',
                                    icon: Icon(
                                      Icons.play_arrow_rounded,
                                      size: 28.0,
                                    ),
                                    subtitle:
                                        'Realiza un examen con 10 preguntas por asignatura y un ejercicio de comprensión auditiva',
                                    textColor: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    title: 'HAZ UN EXAMEN',
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  150.0, 0.0, 150.0, 0.0),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  FFAppState().UserName =
                                      _model.inputJugador1TextController.text;
                                  safeSetState(() {});
                                  if (FFAppState().UserName == null ||
                                      FFAppState().UserName == '') {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          'Por favor, ingresa tu nombre',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyLarge
                                              .override(
                                                font: GoogleFonts.poppins(
                                                  fontWeight:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyLarge
                                                          .fontWeight,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyLarge
                                                          .fontStyle,
                                                ),
                                                color: Colors.black,
                                                fontSize: 24.0,
                                                letterSpacing: 0.0,
                                                fontWeight:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyLarge
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyLarge
                                                        .fontStyle,
                                              ),
                                        ),
                                        duration: Duration(milliseconds: 4000),
                                        backgroundColor:
                                            FlutterFlowTheme.of(context)
                                                .secondary,
                                      ),
                                    );
                                  } else {
                                    FFAppState().allAnswers = [];
                                    safeSetState(() {});

                                    context.pushNamed(
                                        BlockSelectionScreenWidget.routeName);
                                  }
                                },
                                child: wrapWithModel(
                                  model: _model.menuButtonModel2,
                                  updateCallback: () => safeSetState(() {}),
                                  child: MenuButtonWidget(
                                    action: 'navigate:RulesModal',
                                    bg: 'surface',
                                    icon: Icon(
                                      Icons.menu_book_rounded,
                                      color: FlutterFlowTheme.of(context)
                                          .fullContrast,
                                      size: 28.0,
                                    ),
                                    subtitle:
                                        'Preguntas por asignatura o ejercicios detallados',
                                    textColor: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    title: 'APRENDE PRACTICANDO',
                                  ),
                                ),
                              ),
                            ),
                          ].divide(SizedBox(height: 24.0)),
                        ),
                      ),
                    ].divide(SizedBox(height: 32.0)),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
