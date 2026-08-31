import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/index.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'exam_question_screen_model.dart';
export 'exam_question_screen_model.dart';

class ExamQuestionScreenWidget extends StatefulWidget {
  const ExamQuestionScreenWidget({super.key});

  static String routeName = 'ExamQuestionScreen';
  static String routePath = '/examQuestionScreen';

  @override
  State<ExamQuestionScreenWidget> createState() =>
      _ExamQuestionScreenWidgetState();
}

class _ExamQuestionScreenWidgetState extends State<ExamQuestionScreenWidget> {
  late ExamQuestionScreenModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ExamQuestionScreenModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.loadedQuestions = await actions.fetchQuestionsFromURL(
        FFAppState().currentBlock,
      );
      _model.randomQuestions = await actions.pickRandomQuestions(
        _model.loadedQuestions!.toList(),
        FFAppState().mcqCount,
      );
      _model.examQuestions =
          _model.randomQuestions!.toList().cast<QuestionItemStruct>();
      _model.examIndex = 0;
      _model.localSelected = null;
      safeSetState(() {});
      FFAppState().localSelected = '';
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
        body: Container(
          decoration: BoxDecoration(
            color: Color(0xFF050816),
          ),
          child: Align(
            alignment: AlignmentDirectional(0.0, 0.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Flexible(
                      child: Align(
                        alignment: AlignmentDirectional(-1.0, -1.0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              20.0, 20.0, 20.0, 20.0),
                          child: Container(
                            height: 120.0,
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
                                  padding: EdgeInsets.all(10.0),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .transparent,
                                      border: Border.all(
                                        color: FlutterFlowTheme.of(context)
                                            .transparent,
                                      ),
                                    ),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  10.0, 0.0, 0.0, 0.0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                FFAppState().UserName,
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .titleLarge
                                                    .override(
                                                      font: GoogleFonts.inter(
                                                        fontWeight:
                                                            FontWeight.w800,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleLarge
                                                                .fontStyle,
                                                      ),
                                                      color: Color(0xFF3CD415),
                                                      letterSpacing: 0.0,
                                                      fontWeight:
                                                          FontWeight.w800,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleLarge
                                                              .fontStyle,
                                                      lineHeight: 1.3,
                                                    ),
                                              ),
                                              Text(
                                                'Pregunta ${(int idx, int var2) {
                                                  return '${idx + 1} de $var2';
                                                }(_model.examIndex, FFAppState().mcqCount)}',
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .titleLarge
                                                    .override(
                                                      font: GoogleFonts.inter(
                                                        fontWeight:
                                                            FontWeight.w800,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleLarge
                                                                .fontStyle,
                                                      ),
                                                      color: Color(0xFF3CD415),
                                                      letterSpacing: 0.0,
                                                      fontWeight:
                                                          FontWeight.w800,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleLarge
                                                              .fontStyle,
                                                      lineHeight: 1.3,
                                                    ),
                                              ),
                                              Text(
                                                (String block) {
                                                  return {
                                                        'matematicas':
                                                            'Matemáticas',
                                                        'lengua_literatura':
                                                            'Lengua y Literatura',
                                                        'geografia_historia':
                                                            'Geografía e Historia',
                                                        'fisica_quimica':
                                                            'Física y Química',
                                                        'ingles': 'Inglés',
                                                        'biologia_geologia':
                                                            'Biología y Geología',
                                                        'listening':
                                                            'Comprensión Auditiva',
                                                      }[block] ??
                                                      block;
                                                }(FFAppState().currentBlock),
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .titleLarge
                                                    .override(
                                                      font: GoogleFonts.inter(
                                                        fontWeight:
                                                            FontWeight.w800,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleLarge
                                                                .fontStyle,
                                                      ),
                                                      color: Color(0xFF3CD415),
                                                      letterSpacing: 0.0,
                                                      fontWeight:
                                                          FontWeight.w800,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleLarge
                                                              .fontStyle,
                                                      lineHeight: 1.3,
                                                    ),
                                              ),
                                            ].divide(SizedBox(height: 4.0)),
                                          ),
                                        ),
                                      ],
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
                                      FFAppState().currentFillExerciseIndex = 0;
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
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Flexible(
                            child: Align(
                              alignment: AlignmentDirectional(-1.0, -1.0),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    20.0, 0.0, 20.0, 0.0),
                                child: Container(
                                  width: double.infinity,
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
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10.0, 10.0, 10.0, 10.0),
                                    child: Container(
                                      decoration: BoxDecoration(),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    10.0, 0.0, 10.0, 10.0),
                                            child: AutoSizeText(
                                              valueOrDefault<String>(
                                                _model.examQuestions
                                                    .elementAtOrNull(
                                                        _model.examIndex)
                                                    ?.question,
                                                'Question',
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .headlineSmall
                                                      .override(
                                                        font: GoogleFonts.inter(
                                                          fontWeight:
                                                              FontWeight.normal,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .headlineSmall
                                                                  .fontStyle,
                                                        ),
                                                        color: Colors.white,
                                                        fontSize: 20.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .headlineSmall
                                                                .fontStyle,
                                                        lineHeight: 1.4,
                                                      ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Align(
                            alignment: AlignmentDirectional(-1.0, -1.0),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  20.0, 0.0, 20.0, 0.0),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  FFAppState().localSelected = 'A';
                                  safeSetState(() {});
                                  await Future.delayed(
                                    Duration(
                                      milliseconds: 500,
                                    ),
                                  );
                                  _model.isCorrectResultA =
                                      await actions.evaluateAnswer(
                                    'A',
                                    valueOrDefault<String>(
                                      _model.examQuestions
                                          .elementAtOrNull(_model.examIndex)
                                          ?.correctAnswer,
                                      ',,',
                                    ),
                                  );
                                  FFAppState().addToAllAnswers(UserAnswerStruct(
                                    questionId: _model.examQuestions
                                        .elementAtOrNull(_model.examIndex)
                                        ?.id,
                                    selectedAnswer: 'A',
                                    correctAnswer: _model.examQuestions
                                        .elementAtOrNull(_model.examIndex)
                                        ?.correctAnswer,
                                    isCorrect: _model.isCorrectResultA,
                                    front: 'subjects',
                                    block: FFAppState().currentBlock,
                                  ));
                                  await actions.showAnswerFeedback(
                                    context,
                                    _model.isCorrectResultA!,
                                  );
                                  if (_model.examIndex >=
                                      ((FFAppState().mcqCount ?? 10) - 1)) {
                                    _model.subjectScoreA =
                                        await actions.calculateSubjectScore(
                                      FFAppState().currentBlock,
                                      FFAppState().allAnswers.toList(),
                                    );
                                    await actions.saveBlockScore(
                                      FFAppState().currentBlock,
                                      _model.subjectScoreA!,
                                    );
                                    if (FFAppState().currentBlock == 'ingles') {
                                      context.pushNamed(
                                          ListeningMCQScreenWidget.routeName);
                                    } else {
                                      context.pushNamed(
                                          DetailExerciseScreenWidget.routeName);
                                    }
                                  } else {
                                    _model.examIndex = _model.examIndex + 1;
                                    safeSetState(() {});
                                    FFAppState().localSelected = '';
                                    safeSetState(() {});
                                  }

                                  safeSetState(() {});
                                },
                                child: Container(
                                  width: 400.0,
                                  height: 75.0,
                                  constraints: BoxConstraints(
                                    minWidth: 300.0,
                                  ),
                                  decoration: BoxDecoration(
                                    color: FFAppState().localSelected == 'A'
                                        ? Color(0xFF3CD415)
                                        : Color(0xFF0B1220),
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
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10.0, 10.0, 10.0, 10.0),
                                    child: Container(
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Container(
                                            width: 60.0,
                                            height: 60.0,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              shape: BoxShape.circle,
                                            ),
                                            alignment:
                                                AlignmentDirectional(0.0, 0.0),
                                            child: Text(
                                              'A',
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .titleMedium
                                                  .override(
                                                    font: GoogleFonts.poppins(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleMedium
                                                              .fontStyle,
                                                    ),
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .onPrimary,
                                                    fontSize: 30.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.bold,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .titleMedium
                                                            .fontStyle,
                                                    lineHeight: 1.4,
                                                  ),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 1,
                                            child: Text(
                                              valueOrDefault<String>(
                                                _model.examQuestions
                                                    .elementAtOrNull(
                                                        _model.examIndex)
                                                    ?.optionA,
                                                '...',
                                              ),
                                              maxLines: 2,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyLarge
                                                      .override(
                                                        font: GoogleFonts.inter(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyLarge
                                                                  .fontStyle,
                                                        ),
                                                        color: FFAppState()
                                                                    .localSelected ==
                                                                'A'
                                                            ? Colors.black
                                                            : Colors.white,
                                                        fontSize: 20.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyLarge
                                                                .fontStyle,
                                                        lineHeight: 1.5,
                                                      ),
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                        ].divide(SizedBox(width: 16.0)),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: AlignmentDirectional(-1.0, -1.0),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  20.0, 0.0, 20.0, 0.0),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  FFAppState().localSelected = 'B';
                                  safeSetState(() {});
                                  await Future.delayed(
                                    Duration(
                                      milliseconds: 500,
                                    ),
                                  );
                                  _model.isCorrectResultB =
                                      await actions.evaluateAnswer(
                                    'B',
                                    valueOrDefault<String>(
                                      _model.examQuestions
                                          .elementAtOrNull(_model.examIndex)
                                          ?.correctAnswer,
                                      ',,',
                                    ),
                                  );
                                  FFAppState().addToAllAnswers(UserAnswerStruct(
                                    questionId: _model.examQuestions
                                        .elementAtOrNull(_model.examIndex)
                                        ?.id,
                                    selectedAnswer: 'B',
                                    correctAnswer: _model.examQuestions
                                        .elementAtOrNull(_model.examIndex)
                                        ?.correctAnswer,
                                    isCorrect: _model.isCorrectResultB,
                                    front: 'subjects',
                                    block: FFAppState().currentBlock,
                                  ));
                                  await actions.showAnswerFeedback(
                                    context,
                                    _model.isCorrectResultB!,
                                  );
                                  if (_model.examIndex >=
                                      ((FFAppState().mcqCount ?? 10) - 1)) {
                                    _model.subjectScoreB =
                                        await actions.calculateSubjectScore(
                                      FFAppState().currentBlock,
                                      FFAppState().allAnswers.toList(),
                                    );
                                    await actions.saveBlockScore(
                                      FFAppState().currentBlock,
                                      _model.subjectScoreB!,
                                    );
                                    if (FFAppState().currentBlock == 'ingles') {
                                      context.pushNamed(
                                          ListeningMCQScreenWidget.routeName);
                                    } else {
                                      context.pushNamed(
                                          DetailExerciseScreenWidget.routeName);
                                    }
                                  } else {
                                    _model.examIndex = _model.examIndex + 1;
                                    safeSetState(() {});
                                    FFAppState().localSelected = '';
                                    safeSetState(() {});
                                  }

                                  safeSetState(() {});
                                },
                                child: Container(
                                  width: 400.0,
                                  height: 75.0,
                                  constraints: BoxConstraints(
                                    minWidth: 300.0,
                                  ),
                                  decoration: BoxDecoration(
                                    color: FFAppState().localSelected == 'B'
                                        ? Color(0xFF3CD415)
                                        : Color(0xFF0B1220),
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
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10.0, 10.0, 10.0, 10.0),
                                    child: Container(
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Container(
                                            width: 60.0,
                                            height: 60.0,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              shape: BoxShape.circle,
                                            ),
                                            alignment:
                                                AlignmentDirectional(0.0, 0.0),
                                            child: Text(
                                              'B',
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .titleMedium
                                                  .override(
                                                    font: GoogleFonts.poppins(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleMedium
                                                              .fontStyle,
                                                    ),
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .onPrimary,
                                                    fontSize: 30.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.bold,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .titleMedium
                                                            .fontStyle,
                                                    lineHeight: 1.4,
                                                  ),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 1,
                                            child: Text(
                                              valueOrDefault<String>(
                                                _model.examQuestions
                                                    .elementAtOrNull(
                                                        _model.examIndex)
                                                    ?.optionB,
                                                '...',
                                              ),
                                              maxLines: 2,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyLarge
                                                      .override(
                                                        font: GoogleFonts.inter(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyLarge
                                                                  .fontStyle,
                                                        ),
                                                        color: FFAppState()
                                                                    .localSelected ==
                                                                'B'
                                                            ? Colors.black
                                                            : Colors.white,
                                                        fontSize: 20.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyLarge
                                                                .fontStyle,
                                                        lineHeight: 1.5,
                                                      ),
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                        ].divide(SizedBox(width: 16.0)),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Align(
                            alignment: AlignmentDirectional(-1.0, -1.0),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  20.0, 0.0, 20.0, 0.0),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  FFAppState().localSelected = 'C';
                                  safeSetState(() {});
                                  await Future.delayed(
                                    Duration(
                                      milliseconds: 500,
                                    ),
                                  );
                                  _model.isCorrectResultC =
                                      await actions.evaluateAnswer(
                                    'C',
                                    valueOrDefault<String>(
                                      _model.examQuestions
                                          .elementAtOrNull(_model.examIndex)
                                          ?.correctAnswer,
                                      ',,',
                                    ),
                                  );
                                  FFAppState().addToAllAnswers(UserAnswerStruct(
                                    questionId: _model.examQuestions
                                        .elementAtOrNull(_model.examIndex)
                                        ?.id,
                                    selectedAnswer: 'C',
                                    correctAnswer: _model.examQuestions
                                        .elementAtOrNull(_model.examIndex)
                                        ?.correctAnswer,
                                    isCorrect: _model.isCorrectResultC,
                                    front: 'subjects',
                                    block: FFAppState().currentBlock,
                                  ));
                                  await actions.showAnswerFeedback(
                                    context,
                                    _model.isCorrectResultC!,
                                  );
                                  if (_model.examIndex >=
                                      ((FFAppState().mcqCount ?? 10) - 1)) {
                                    _model.subjectScoreC =
                                        await actions.calculateSubjectScore(
                                      FFAppState().currentBlock,
                                      FFAppState().allAnswers.toList(),
                                    );
                                    await actions.saveBlockScore(
                                      FFAppState().currentBlock,
                                      _model.subjectScoreC!,
                                    );
                                    if (FFAppState().currentBlock == 'ingles') {
                                      context.pushNamed(
                                          ListeningMCQScreenWidget.routeName);
                                    } else {
                                      context.pushNamed(
                                          DetailExerciseScreenWidget.routeName);
                                    }
                                  } else {
                                    _model.examIndex = _model.examIndex + 1;
                                    safeSetState(() {});
                                    FFAppState().localSelected = '';
                                    safeSetState(() {});
                                  }

                                  safeSetState(() {});
                                },
                                child: Container(
                                  width: 400.0,
                                  height: 75.0,
                                  constraints: BoxConstraints(
                                    minWidth: 300.0,
                                  ),
                                  decoration: BoxDecoration(
                                    color: FFAppState().localSelected == 'C'
                                        ? Color(0xFF3CD415)
                                        : Color(0xFF0B1220),
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
                                  child: Padding(
                                    padding: EdgeInsets.all(10.0),
                                    child: Container(
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Container(
                                            width: 60.0,
                                            height: 60.0,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              shape: BoxShape.circle,
                                            ),
                                            alignment:
                                                AlignmentDirectional(0.0, 0.0),
                                            child: Text(
                                              'C',
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .titleMedium
                                                  .override(
                                                    font: GoogleFonts.poppins(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleMedium
                                                              .fontStyle,
                                                    ),
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .onPrimary,
                                                    fontSize: 30.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.bold,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .titleMedium
                                                            .fontStyle,
                                                    lineHeight: 1.4,
                                                  ),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 1,
                                            child: Text(
                                              valueOrDefault<String>(
                                                _model.examQuestions
                                                    .elementAtOrNull(
                                                        _model.examIndex)
                                                    ?.optionC,
                                                '...',
                                              ),
                                              maxLines: 2,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyLarge
                                                      .override(
                                                        font: GoogleFonts.inter(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyLarge
                                                                  .fontStyle,
                                                        ),
                                                        color: FFAppState()
                                                                    .localSelected ==
                                                                'C'
                                                            ? Colors.black
                                                            : Colors.white,
                                                        fontSize: 20.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyLarge
                                                                .fontStyle,
                                                        lineHeight: 1.5,
                                                      ),
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                        ].divide(SizedBox(width: 16.0)),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: AlignmentDirectional(-1.0, -1.0),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  20.0, 0.0, 20.0, 0.0),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  FFAppState().localSelected = 'D';
                                  safeSetState(() {});
                                  await Future.delayed(
                                    Duration(
                                      milliseconds: 500,
                                    ),
                                  );
                                  _model.isCorrectResultD =
                                      await actions.evaluateAnswer(
                                    'D',
                                    valueOrDefault<String>(
                                      _model.examQuestions
                                          .elementAtOrNull(_model.examIndex)
                                          ?.correctAnswer,
                                      ',,',
                                    ),
                                  );
                                  FFAppState().addToAllAnswers(UserAnswerStruct(
                                    questionId: _model.examQuestions
                                        .elementAtOrNull(_model.examIndex)
                                        ?.id,
                                    selectedAnswer: 'D',
                                    correctAnswer: _model.examQuestions
                                        .elementAtOrNull(_model.examIndex)
                                        ?.correctAnswer,
                                    isCorrect: _model.isCorrectResultD,
                                    front: 'subjects',
                                    block: FFAppState().currentBlock,
                                  ));
                                  await actions.showAnswerFeedback(
                                    context,
                                    _model.isCorrectResultD!,
                                  );
                                  if (_model.examIndex >=
                                      ((FFAppState().mcqCount ?? 10) - 1)) {
                                    _model.subjectScoreD =
                                        await actions.calculateSubjectScore(
                                      FFAppState().currentBlock,
                                      FFAppState().allAnswers.toList(),
                                    );
                                    await actions.saveBlockScore(
                                      FFAppState().currentBlock,
                                      _model.subjectScoreD!,
                                    );
                                    if (FFAppState().currentBlock == 'ingles') {
                                      context.pushNamed(
                                          ListeningMCQScreenWidget.routeName);
                                    } else {
                                      context.pushNamed(
                                          DetailExerciseScreenWidget.routeName);
                                    }
                                  } else {
                                    _model.examIndex = _model.examIndex + 1;
                                    safeSetState(() {});
                                    FFAppState().localSelected = '';
                                    safeSetState(() {});
                                  }

                                  safeSetState(() {});
                                },
                                child: Container(
                                  width: 400.0,
                                  height: 75.0,
                                  constraints: BoxConstraints(
                                    minWidth: 300.0,
                                  ),
                                  decoration: BoxDecoration(
                                    color: FFAppState().localSelected == 'D'
                                        ? Color(0xFF3CD415)
                                        : Color(0xFF0B1220),
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
                                  child: Padding(
                                    padding: EdgeInsets.all(10.0),
                                    child: Container(
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Container(
                                            width: 60.0,
                                            height: 60.0,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              shape: BoxShape.circle,
                                            ),
                                            alignment:
                                                AlignmentDirectional(0.0, 0.0),
                                            child: Text(
                                              'D',
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .titleMedium
                                                  .override(
                                                    font: GoogleFonts.poppins(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleMedium
                                                              .fontStyle,
                                                    ),
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .onPrimary,
                                                    fontSize: 30.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.bold,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .titleMedium
                                                            .fontStyle,
                                                    lineHeight: 1.4,
                                                  ),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 1,
                                            child: Text(
                                              valueOrDefault<String>(
                                                _model.examQuestions
                                                    .elementAtOrNull(
                                                        _model.examIndex)
                                                    ?.optionD,
                                                '...',
                                              ),
                                              maxLines: 2,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyLarge
                                                      .override(
                                                        font: GoogleFonts.inter(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyLarge
                                                                  .fontStyle,
                                                        ),
                                                        color: FFAppState()
                                                                    .localSelected ==
                                                                'D'
                                                            ? Colors.black
                                                            : Colors.white,
                                                        fontSize: 20.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyLarge
                                                                .fontStyle,
                                                        lineHeight: 1.5,
                                                      ),
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                        ].divide(SizedBox(width: 16.0)),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ].divide(SizedBox(height: 24.0)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
