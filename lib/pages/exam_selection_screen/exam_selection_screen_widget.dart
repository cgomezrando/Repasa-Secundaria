import '/backend/schema/structs/index.dart';
import '/components/category_card2_widget.dart';
import '/components/section_header_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'exam_selection_screen_model.dart';
export 'exam_selection_screen_model.dart';

class ExamSelectionScreenWidget extends StatefulWidget {
  const ExamSelectionScreenWidget({super.key});

  static String routeName = 'ExamSelectionScreen';
  static String routePath = '/examSelectionScreen';

  @override
  State<ExamSelectionScreenWidget> createState() =>
      _ExamSelectionScreenWidgetState();
}

class _ExamSelectionScreenWidgetState extends State<ExamSelectionScreenWidget> {
  late ExamSelectionScreenModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ExamSelectionScreenModel());
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
        body: Stack(
          alignment: AlignmentDirectional(-1.0, -1.0),
          children: [
            Container(
              decoration: BoxDecoration(
                color: Color(0xFF050816),
                shape: BoxShape.rectangle,
              ),
            ),
            SingleChildScrollView(
              primary: false,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Flexible(
                    child: Align(
                      alignment: AlignmentDirectional(-1.0, -1.0),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            20.0, 20.0, 20.0, 20.0),
                        child: Container(
                          height: 100.0,
                          constraints: BoxConstraints(
                            minWidth: 300.0,
                          ),
                          decoration: BoxDecoration(
                            color: Color(0xFF0B1220),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(32.0),
                              topRight: Radius.circular(32.0),
                              bottomLeft: Radius.circular(32.0),
                              bottomRight: Radius.circular(32.0),
                            ),
                            shape: BoxShape.rectangle,
                            border: Border.all(
                              color: Color(0xFF1E3A8A),
                              width: 1.0,
                            ),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    20.0, 0.0, 0.0, 0.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Hola ${FFAppState().UserName}!! 👋',
                                      style: FlutterFlowTheme.of(context)
                                          .headlineLarge
                                          .override(
                                            font: GoogleFonts.poppins(
                                              fontWeight: FontWeight.w800,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .headlineLarge
                                                      .fontStyle,
                                            ),
                                            color: Color(0xFF3CD415),
                                            fontSize: 26.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w800,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .headlineLarge
                                                    .fontStyle,
                                            lineHeight: 1.4,
                                          ),
                                    ),
                                    Text(
                                      '¿Qué tipo de examen te gustaría realizar hoy?',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyLarge
                                          .override(
                                            font: GoogleFonts.poppins(
                                              fontWeight: FontWeight.w600,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyLarge
                                                      .fontStyle,
                                            ),
                                            color: Color(0xFF3CD415),
                                            fontSize: 26.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w600,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyLarge
                                                    .fontStyle,
                                            lineHeight: 1.4,
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        20.0, 0.0, 0.0, 0.0),
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        context.pushNamed(
                                            InstructionsPageWidget.routeName);
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
                                          border: Border.all(
                                            color: Colors.white,
                                            width: 2.0,
                                          ),
                                        ),
                                        child: Icon(
                                          Icons.help_outline,
                                          color: Color(0xFF216F0E),
                                          size: 65.0,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        15.0, 0.0, 10.0, 0.0),
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        FFAppState().allAnswers = [];
                                        FFAppState().allListeningQuestions = [];
                                        FFAppState().listeningScore = 0;
                                        FFAppState().currentFillExerciseIndex =
                                            0;
                                        FFAppState().mcqPlayed = 0;
                                        safeSetState(() {});

                                        context.pushNamed(
                                            HomeScreenWidget.routeName);
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
                                          Icons.home,
                                          color: Color(0xFF216F0E),
                                          size: 65.0,
                                        ),
                                      ),
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
                  Align(
                    alignment: AlignmentDirectional(-1.0, -1.0),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(
                          20.0, 20.0, 20.0, 20.0),
                      child: Container(
                        width: 335.0,
                        height: 75.0,
                        constraints: BoxConstraints(
                          minWidth: 300.0,
                        ),
                        decoration: BoxDecoration(
                          color: Color(0xFF0B1220),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(32.0),
                            topRight: Radius.circular(32.0),
                            bottomLeft: Radius.circular(32.0),
                            bottomRight: Radius.circular(32.0),
                          ),
                          shape: BoxShape.rectangle,
                          border: Border.all(
                            color: Color(0xFF1E3A8A),
                            width: 1.0,
                          ),
                        ),
                        child: Align(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                20.0, 0.0, 0.0, 0.0),
                            child: wrapWithModel(
                              model: _model.sectionHeaderModel1,
                              updateCallback: () => safeSetState(() {}),
                              child: SectionHeaderWidget(
                                title: 'Examen por asignatura',
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(24.0),
                    child: Container(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Expanded(
                                        flex: 1,
                                        child: InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            FFAppState().examType = 'subject';
                                            FFAppState().mcqCount = 10;
                                            FFAppState().exerciseCount = 2;
                                            safeSetState(() {});
                                            FFAppState().examSubject =
                                                'matematicas';
                                            FFAppState().currentBlock =
                                                'matematicas';
                                            safeSetState(() {});
                                            await actions.resetExamState();
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
                                            safeSetState(() {});

                                            context.pushNamed(
                                                ExamQuestionScreenWidget
                                                    .routeName);
                                          },
                                          child: wrapWithModel(
                                            model: _model.categoryCardModel1,
                                            updateCallback: () =>
                                                safeSetState(() {}),
                                            child: CategoryCard2Widget(
                                              bgColor: Color(0xFFE3F2FD),
                                              icon: Icon(
                                                Icons.calculate,
                                                color: Color(0xFF1E88E5),
                                                size: 28.0,
                                              ),
                                              iconColor: Color(0xFF1E88E5),
                                              title: 'Matemáticas',
                                            ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 1,
                                        child: InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            FFAppState().examType = 'subject';
                                            FFAppState().mcqCount = 10;
                                            FFAppState().exerciseCount = 2;
                                            safeSetState(() {});
                                            FFAppState().examSubject =
                                                'lengua_literatura';
                                            FFAppState().currentBlock =
                                                'lengua_literatura';
                                            safeSetState(() {});
                                            await actions.resetExamState();
                                            FFAppState().currentSession =
                                                ExamSessionStruct(
                                              mode: 'exam',
                                              currentFront: 'subjects',
                                              currentBlock: 'lengua_literatura',
                                              currentQIndex: 0,
                                              score: 0,
                                              totalAnswered: 0,
                                              sessionId: 'session1',
                                            );
                                            safeSetState(() {});

                                            context.pushNamed(
                                                ExamQuestionScreenWidget
                                                    .routeName);
                                          },
                                          child: wrapWithModel(
                                            model: _model.categoryCardModel2,
                                            updateCallback: () =>
                                                safeSetState(() {}),
                                            child: CategoryCard2Widget(
                                              bgColor: Color(0xFFF3E5F5),
                                              icon: Icon(
                                                Icons.menu_book,
                                                color: Color(0xFF8E24AA),
                                                size: 28.0,
                                              ),
                                              iconColor: Color(0xFF8E24AA),
                                              title: 'Lengua y Literatura\n',
                                            ),
                                          ),
                                        ),
                                      ),
                                    ].divide(SizedBox(width: 16.0)),
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Expanded(
                                        flex: 1,
                                        child: InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            FFAppState().examType = 'subject';
                                            FFAppState().mcqCount = 10;
                                            FFAppState().exerciseCount = 2;
                                            safeSetState(() {});
                                            FFAppState().examSubject =
                                                'geografia_historia';
                                            FFAppState().currentBlock =
                                                'geografia_historia';
                                            safeSetState(() {});
                                            await actions.resetExamState();
                                            FFAppState().currentSession =
                                                ExamSessionStruct(
                                              mode: 'exam',
                                              currentFront: 'subjects',
                                              currentBlock:
                                                  'geografia_historia',
                                              currentQIndex: 0,
                                              score: 0,
                                              totalAnswered: 0,
                                              sessionId: 'session1',
                                            );
                                            safeSetState(() {});

                                            context.pushNamed(
                                                ExamQuestionScreenWidget
                                                    .routeName);
                                          },
                                          child: wrapWithModel(
                                            model: _model.categoryCardModel3,
                                            updateCallback: () =>
                                                safeSetState(() {}),
                                            child: CategoryCard2Widget(
                                              bgColor: Color(0xFFE8F5E9),
                                              icon: Icon(
                                                Icons.travel_explore,
                                                color: Color(0xFF43A047),
                                                size: 28.0,
                                              ),
                                              iconColor: Color(0xFF43A047),
                                              title: 'Geografía e Historia',
                                            ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 1,
                                        child: InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            FFAppState().examType = 'subject';
                                            FFAppState().mcqCount = 10;
                                            FFAppState().exerciseCount = 2;
                                            safeSetState(() {});
                                            FFAppState().examSubject =
                                                'fisica_quimica';
                                            FFAppState().currentBlock =
                                                'fisica_quimica';
                                            safeSetState(() {});
                                            await actions.resetExamState();
                                            FFAppState().currentSession =
                                                ExamSessionStruct(
                                              mode: 'exam',
                                              currentFront: 'subjects',
                                              currentBlock: 'fisica_quimica',
                                              currentQIndex: 0,
                                              score: 0,
                                              totalAnswered: 0,
                                              sessionId: 'session1',
                                            );
                                            safeSetState(() {});

                                            context.pushNamed(
                                                ExamQuestionScreenWidget
                                                    .routeName);
                                          },
                                          child: wrapWithModel(
                                            model: _model.categoryCardModel4,
                                            updateCallback: () =>
                                                safeSetState(() {}),
                                            child: CategoryCard2Widget(
                                              bgColor: Color(0xFFFFF3E0),
                                              icon: Icon(
                                                Icons.science_rounded,
                                                color: Color(0xFFFB8C00),
                                                size: 28.0,
                                              ),
                                              iconColor: Color(0xFFFB8C00),
                                              title: 'Física y Química',
                                            ),
                                          ),
                                        ),
                                      ),
                                    ].divide(SizedBox(width: 16.0)),
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Expanded(
                                        flex: 1,
                                        child: InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            FFAppState().examType = 'subject';
                                            FFAppState().mcqCount = 10;
                                            FFAppState().exerciseCount = 2;
                                            safeSetState(() {});
                                            FFAppState().examSubject = 'ingles';
                                            FFAppState().currentBlock =
                                                'ingles';
                                            safeSetState(() {});
                                            await actions.resetExamState();
                                            FFAppState().currentSession =
                                                ExamSessionStruct(
                                              mode: 'exam',
                                              currentFront: 'subjects',
                                              currentBlock: 'ingles',
                                              currentQIndex: 0,
                                              score: 0,
                                              totalAnswered: 0,
                                              sessionId: 'session1',
                                            );
                                            safeSetState(() {});

                                            context.pushNamed(
                                                ExamQuestionScreenWidget
                                                    .routeName);
                                          },
                                          child: wrapWithModel(
                                            model: _model.categoryCardModel5,
                                            updateCallback: () =>
                                                safeSetState(() {}),
                                            child: CategoryCard2Widget(
                                              bgColor: Color(0xFFFCE4EC),
                                              icon: Icon(
                                                Icons.translate,
                                                color: Color(0xFFD81B60),
                                                size: 28.0,
                                              ),
                                              iconColor: Color(0xFFD81B60),
                                              title: 'Inglés',
                                            ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 1,
                                        child: InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            FFAppState().examType = 'subject';
                                            FFAppState().mcqCount = 10;
                                            FFAppState().exerciseCount = 2;
                                            safeSetState(() {});
                                            FFAppState().examSubject =
                                                'biologia_geologia';
                                            FFAppState().currentBlock =
                                                'biologia_geologia';
                                            safeSetState(() {});
                                            await actions.resetExamState();
                                            FFAppState().currentSession =
                                                ExamSessionStruct(
                                              mode: 'exam',
                                              currentFront: 'subjects',
                                              currentBlock: 'biologia_geologia',
                                              currentQIndex: 0,
                                              score: 0,
                                              totalAnswered: 0,
                                              sessionId: 'session1',
                                            );
                                            safeSetState(() {});

                                            context.pushNamed(
                                                ExamQuestionScreenWidget
                                                    .routeName);
                                          },
                                          child: wrapWithModel(
                                            model: _model.categoryCardModel6,
                                            updateCallback: () =>
                                                safeSetState(() {}),
                                            child: CategoryCard2Widget(
                                              bgColor: Color(0xFFFCE4EC),
                                              icon: Icon(
                                                Icons.biotech,
                                                color: Color(0xFF00ACC1),
                                                size: 28.0,
                                              ),
                                              iconColor: Color(0xFF00ACC1),
                                              title: 'Biología y Geología',
                                            ),
                                          ),
                                        ),
                                      ),
                                    ].divide(SizedBox(width: 16.0)),
                                  ),
                                ].divide(SizedBox(height: 16.0)),
                              ),
                            ].divide(SizedBox(height: 16.0)),
                          ),
                          Align(
                            alignment: AlignmentDirectional(-1.0, 0.0),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  20.0, 20.0, 20.0, 20.0),
                              child: Container(
                                width: 100.0,
                                height: 75.0,
                                constraints: BoxConstraints(
                                  minWidth: 300.0,
                                ),
                                decoration: BoxDecoration(
                                  color: Color(0xFF0B1220),
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(32.0),
                                    topRight: Radius.circular(32.0),
                                    bottomLeft: Radius.circular(32.0),
                                    bottomRight: Radius.circular(32.0),
                                  ),
                                  shape: BoxShape.rectangle,
                                  border: Border.all(
                                    color: Color(0xFF1E3A8A),
                                    width: 1.0,
                                  ),
                                ),
                                child: Align(
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        20.0, 0.0, 0.0, 0.0),
                                    child: wrapWithModel(
                                      model: _model.sectionHeaderModel2,
                                      updateCallback: () => safeSetState(() {}),
                                      child: SectionHeaderWidget(
                                        title: 'Prueba global',
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Expanded(
                                    flex: 1,
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        FFAppState().examType = 'global';
                                        FFAppState().mcqCount = 6;
                                        FFAppState().exerciseCount = 1;
                                        FFAppState().currentBlock =
                                            'matematicas';
                                        FFAppState().examSubject = '';
                                        safeSetState(() {});
                                        await actions.resetExamState();
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
                                        safeSetState(() {});

                                        context.pushNamed(
                                            ExamQuestionScreenWidget.routeName);
                                      },
                                      child: wrapWithModel(
                                        model: _model.categoryCardModel7,
                                        updateCallback: () =>
                                            safeSetState(() {}),
                                        child: CategoryCard2Widget(
                                          bgColor: Color(0xFFF9FBE7),
                                          icon: FaIcon(
                                            FontAwesomeIcons.penAlt,
                                            color: Color(0xFF1E88E5),
                                            size: 28.0,
                                          ),
                                          iconColor: Color(0xFF1E88E5),
                                          title:
                                              'Prueba Global de Educación Secundaria\nReta tu conocimiento a realizar una prueba con todas asignaturas',
                                        ),
                                      ),
                                    ),
                                  ),
                                ].divide(SizedBox(width: 16.0)),
                              ),
                            ],
                          ),
                          Container(
                            height: 32.0,
                          ),
                        ].divide(SizedBox(height: 24.0)),
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
