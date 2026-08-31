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
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'detail_exercise_screen_model.dart';
export 'detail_exercise_screen_model.dart';

class DetailExerciseScreenWidget extends StatefulWidget {
  const DetailExerciseScreenWidget({super.key});

  static String routeName = 'DetailExerciseScreen';
  static String routePath = '/detailExerciseScreen';

  @override
  State<DetailExerciseScreenWidget> createState() =>
      _DetailExerciseScreenWidgetState();
}

class _DetailExerciseScreenWidgetState
    extends State<DetailExerciseScreenWidget> {
  late DetailExerciseScreenModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DetailExerciseScreenModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.loadedExercises = await actions.fetchDetailExercisesFromURL(
        FFAppState().currentBlock,
      );
      _model.randomExercises = await actions.pickRandomExercises(
        _model.loadedExercises!.toList(),
        FFAppState().exerciseCount,
      );
      _model.detailQuestions = _model.randomExercises!.toList().cast<dynamic>();
      safeSetState(() {});
      _model.currentIndex = 0;
      _model.selectedAnswer = null;
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
        body: Align(
          alignment: AlignmentDirectional(0.0, -1.0),
          child: Container(
            decoration: BoxDecoration(
              color: Color(0xFF050816),
            ),
            child: Align(
              alignment: AlignmentDirectional(0.0, -1.0),
              child: SingleChildScrollView(
                primary: false,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          20.0, 0.0, 0.0, 0.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            FFAppState().UserName,
                                            style: FlutterFlowTheme.of(context)
                                                .titleLarge
                                                .override(
                                                  font: GoogleFonts.inter(
                                                    fontWeight: FontWeight.w600,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .titleLarge
                                                            .fontStyle,
                                                  ),
                                                  color: Colors.white,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w600,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleLarge
                                                          .fontStyle,
                                                  lineHeight: 0.0,
                                                ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 10.0, 0.0),
                                            child: AutoSizeText(
                                              getJsonField(
                                                _model.detailQuestions
                                                    .elementAtOrNull(
                                                        _model.currentIndex!),
                                                r'''$.subject''',
                                              ).toString(),
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .headlineSmall
                                                  .override(
                                                    font: GoogleFonts.inter(
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .headlineSmall
                                                              .fontStyle,
                                                    ),
                                                    color: Color(0xFF3CD415),
                                                    fontSize: 22.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w600,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .headlineSmall
                                                            .fontStyle,
                                                    lineHeight: 1.4,
                                                  ),
                                            ),
                                          ),
                                        ].divide(SizedBox(height: 4.0)),
                                      ),
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  15.0, 0.0, 0.0, 0.0),
                                          child: InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              await actions.playAudio(
                                                '',
                                              );
                                              FFAppState().allAnswers = [];
                                              FFAppState()
                                                  .allListeningQuestions = [];
                                              FFAppState().listeningScore = 0;
                                              FFAppState()
                                                  .currentFillExerciseIndex = 0;
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
                                                  topLeft:
                                                      Radius.circular(12.0),
                                                  topRight:
                                                      Radius.circular(12.0),
                                                  bottomLeft:
                                                      Radius.circular(12.0),
                                                  bottomRight:
                                                      Radius.circular(12.0),
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
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  15.0, 0.0, 0.0, 0.0),
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
                                                  topLeft:
                                                      Radius.circular(12.0),
                                                  topRight:
                                                      Radius.circular(12.0),
                                                  bottomLeft:
                                                      Radius.circular(12.0),
                                                  bottomRight:
                                                      Radius.circular(12.0),
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
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 10.0, 0.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Flexible(
                                child: Align(
                                  alignment: AlignmentDirectional(0.0, 0.0),
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
                                      child: Align(
                                        alignment:
                                            AlignmentDirectional(0.0, 0.0),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  10.0, 10.0, 10.0, 10.0),
                                          child: Container(
                                            decoration: BoxDecoration(),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Flexible(
                                                  child: Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            -1.0, -1.0),
                                                    child:
                                                        SingleChildScrollView(
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .stretch,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        10.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: AutoSizeText(
                                                              'Ejercicio',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .headlineSmall
                                                                  .override(
                                                                    font: GoogleFonts
                                                                        .inter(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .headlineSmall
                                                                          .fontStyle,
                                                                    ),
                                                                    color: Color(
                                                                        0xFF3CD415),
                                                                    fontSize:
                                                                        22.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .headlineSmall
                                                                        .fontStyle,
                                                                    lineHeight:
                                                                        1.4,
                                                                  ),
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        10.0,
                                                                        0.0,
                                                                        10.0,
                                                                        10.0),
                                                            child: AutoSizeText(
                                                              getJsonField(
                                                                _model
                                                                    .detailQuestions
                                                                    .elementAtOrNull(
                                                                        _model
                                                                            .currentIndex!),
                                                                r'''$.question''',
                                                              ).toString(),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .headlineSmall
                                                                  .override(
                                                                    font: GoogleFonts
                                                                        .inter(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .normal,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .headlineSmall
                                                                          .fontStyle,
                                                                    ),
                                                                    color: Colors
                                                                        .white,
                                                                    fontSize:
                                                                        18.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .normal,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .headlineSmall
                                                                        .fontStyle,
                                                                    lineHeight:
                                                                        1.4,
                                                                  ),
                                                              overflow:
                                                                  TextOverflow
                                                                      .visible,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Flexible(
                                                  child: Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            1.0, -1.0),
                                                    child: Container(
                                                      width: 200.0,
                                                      height: 200.0,
                                                      decoration:
                                                          BoxDecoration(),
                                                      child: Text(
                                                        getJsonField(
                                                          _model.detailQuestions
                                                              .elementAtOrNull(
                                                                  _model
                                                                      .currentIndex!),
                                                          r'''$.emoji''',
                                                        ).toString(),
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
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 160.0,
                                                              letterSpacing:
                                                                  0.0,
                                                              fontWeight:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontWeight,
                                                              fontStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                            ),
                                                        overflow: TextOverflow
                                                            .visible,
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
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
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
                                          mainAxisSize: MainAxisSize.min,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      10.0, 0.0, 0.0, 0.0),
                                              child: AutoSizeText(
                                                'Contexto',
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .headlineSmall
                                                    .override(
                                                      font: GoogleFonts.inter(
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .headlineSmall
                                                                .fontStyle,
                                                      ),
                                                      color: Color(0xFF3CD415),
                                                      fontSize: 22.0,
                                                      letterSpacing: 0.0,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .headlineSmall
                                                              .fontStyle,
                                                      lineHeight: 1.4,
                                                    ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      10.0, 0.0, 10.0, 0.0),
                                              child: AutoSizeText(
                                                getJsonField(
                                                  _model.detailQuestions
                                                      .elementAtOrNull(
                                                          _model.currentIndex!),
                                                  r'''$.context''',
                                                ).toString(),
                                                style: FlutterFlowTheme.of(
                                                        context)
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
                                                      fontSize: 18.0,
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
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Flexible(
                              child: Align(
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
                                        getJsonField(
                                          _model.detailQuestions
                                              .elementAtOrNull(
                                                  _model.currentIndex!),
                                          r'''$.correctAnswer''',
                                        ).toString(),
                                      );
                                      FFAppState()
                                          .addToAllAnswers(UserAnswerStruct(
                                        questionId: getJsonField(
                                          _model.detailQuestions
                                              .elementAtOrNull(
                                                  _model.currentIndex!),
                                          r'''$.id''',
                                        ),
                                        selectedAnswer: _model.selectedAnswer,
                                        correctAnswer: getJsonField(
                                          _model.detailQuestions
                                              .elementAtOrNull(
                                                  _model.currentIndex!),
                                          r'''$.correctAnswer''',
                                        ).toString(),
                                        isCorrect: _model.isCorrectResultA,
                                        front: 'exercises',
                                        block: FFAppState().currentBlock,
                                      ));
                                      safeSetState(() {});
                                      await actions.showAnswerFeedback(
                                        context,
                                        _model.isCorrectResultA!,
                                      );
                                      if (_model.currentIndex! >=
                                          ((FFAppState().exerciseCount ?? 2) -
                                              1)) {
                                        if (FFAppState().examType == '') {
                                          context.pushNamed(
                                              BlockSelectionScreenWidget
                                                  .routeName);
                                        } else {
                                          _model.exerciseScoreResult =
                                              await actions
                                                  .calculateExerciseScore(
                                            FFAppState().currentBlock,
                                            FFAppState().allAnswers.toList(),
                                          );
                                          await actions.saveExerciseScore(
                                            FFAppState().currentBlock,
                                            _model.exerciseScoreResult!,
                                          );
                                          if (FFAppState().examType ==
                                              'subject') {
                                            context.pushNamed(
                                                ResultsScreenWidget.routeName);
                                          } else {
                                            _model.nextBlock =
                                                await actions.getNextBlock(
                                              FFAppState().currentBlock,
                                            );
                                            if (_model.nextBlock == 'DONE') {
                                              context.pushNamed(
                                                  ResultsScreenWidget
                                                      .routeName);
                                            } else {
                                              FFAppState().currentBlock =
                                                  _model.nextBlock!;
                                              safeSetState(() {});

                                              context.pushNamed(
                                                  ExamQuestionScreenWidget
                                                      .routeName);
                                            }
                                          }
                                        }
                                      } else {
                                        _model.currentIndex =
                                            _model.currentIndex! + 1;
                                        _model.selectedAnswer = null;
                                        safeSetState(() {});
                                        FFAppState().localSelected = '';
                                        safeSetState(() {});
                                      }

                                      safeSetState(() {});
                                    },
                                    child: Container(
                                      width: double.infinity,
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
                                        padding: EdgeInsets.all(24.0),
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
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                  shape: BoxShape.circle,
                                                ),
                                                alignment: AlignmentDirectional(
                                                    0.0, 0.0),
                                                child: Text(
                                                  'A',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .titleMedium
                                                      .override(
                                                        font:
                                                            GoogleFonts.poppins(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleMedium
                                                                  .fontStyle,
                                                        ),
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .onPrimary,
                                                        fontSize: 30.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.bold,
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
                                                  getJsonField(
                                                    _model.detailQuestions
                                                        .elementAtOrNull(_model
                                                            .currentIndex!),
                                                    r'''$.optionA''',
                                                  ).toString(),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyLarge
                                                      .override(
                                                        font: GoogleFonts.inter(
                                                          fontWeight:
                                                              FontWeight.normal,
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
                                                        fontSize: 18.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyLarge
                                                                .fontStyle,
                                                        lineHeight: 1.5,
                                                      ),
                                                  overflow:
                                                      TextOverflow.visible,
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
                            ),
                            Flexible(
                              child: Align(
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
                                        getJsonField(
                                          _model.detailQuestions
                                              .elementAtOrNull(
                                                  _model.currentIndex!),
                                          r'''$.correctAnswer''',
                                        ).toString(),
                                      );
                                      FFAppState()
                                          .addToAllAnswers(UserAnswerStruct(
                                        questionId: getJsonField(
                                          _model.detailQuestions
                                              .elementAtOrNull(
                                                  _model.currentIndex!),
                                          r'''$.id''',
                                        ),
                                        selectedAnswer: _model.selectedAnswer,
                                        correctAnswer: getJsonField(
                                          _model.detailQuestions
                                              .elementAtOrNull(
                                                  _model.currentIndex!),
                                          r'''$.correctAnswer''',
                                        ).toString(),
                                        isCorrect: _model.isCorrectResultB,
                                        front: 'exercises',
                                        block: FFAppState().currentBlock,
                                      ));
                                      safeSetState(() {});
                                      await actions.showAnswerFeedback(
                                        context,
                                        _model.isCorrectResultB!,
                                      );
                                      if (_model.currentIndex! >=
                                          ((FFAppState().exerciseCount ?? 2) -
                                              1)) {
                                        if (FFAppState().examType == '') {
                                          context.pushNamed(
                                              BlockSelectionScreenWidget
                                                  .routeName);
                                        } else {
                                          _model.exerciseScoreResultB =
                                              await actions
                                                  .calculateExerciseScore(
                                            FFAppState().currentBlock,
                                            FFAppState().allAnswers.toList(),
                                          );
                                          await actions.saveExerciseScore(
                                            FFAppState().currentBlock,
                                            _model.exerciseScoreResultB!,
                                          );
                                          if (FFAppState().examType ==
                                              'subject') {
                                            context.pushNamed(
                                                ResultsScreenWidget.routeName);
                                          } else {
                                            _model.nextBlockB =
                                                await actions.getNextBlock(
                                              FFAppState().currentBlock,
                                            );
                                            if (_model.nextBlockB == 'DONE') {
                                              context.pushNamed(
                                                  ResultsScreenWidget
                                                      .routeName);
                                            } else {
                                              FFAppState().currentBlock =
                                                  _model.nextBlockB!;
                                              safeSetState(() {});

                                              context.pushNamed(
                                                  ExamQuestionScreenWidget
                                                      .routeName);
                                            }
                                          }
                                        }
                                      } else {
                                        _model.currentIndex =
                                            _model.currentIndex! + 1;
                                        _model.selectedAnswer = null;
                                        safeSetState(() {});
                                        FFAppState().localSelected = '';
                                        safeSetState(() {});
                                      }

                                      safeSetState(() {});
                                    },
                                    child: Container(
                                      width: double.infinity,
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
                                        padding: EdgeInsets.all(24.0),
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
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                  shape: BoxShape.circle,
                                                ),
                                                alignment: AlignmentDirectional(
                                                    0.0, 0.0),
                                                child: Text(
                                                  'B',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .titleMedium
                                                      .override(
                                                        font:
                                                            GoogleFonts.poppins(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleMedium
                                                                  .fontStyle,
                                                        ),
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .onPrimary,
                                                        fontSize: 30.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.bold,
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
                                                  getJsonField(
                                                    _model.detailQuestions
                                                        .elementAtOrNull(_model
                                                            .currentIndex!),
                                                    r'''$.optionB''',
                                                  ).toString(),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyLarge
                                                      .override(
                                                        font: GoogleFonts.inter(
                                                          fontWeight:
                                                              FontWeight.normal,
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
                                                        fontSize: 18.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyLarge
                                                                .fontStyle,
                                                        lineHeight: 1.5,
                                                      ),
                                                  overflow:
                                                      TextOverflow.visible,
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
                            ),
                          ],
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Flexible(
                              child: Align(
                                alignment: AlignmentDirectional(-1.0, -1.0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      20.0, 0.0, 20.0, 20.0),
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
                                        getJsonField(
                                          _model.detailQuestions
                                              .elementAtOrNull(
                                                  _model.currentIndex!),
                                          r'''$.correctAnswer''',
                                        ).toString(),
                                      );
                                      FFAppState()
                                          .addToAllAnswers(UserAnswerStruct(
                                        questionId: getJsonField(
                                          _model.detailQuestions
                                              .elementAtOrNull(
                                                  _model.currentIndex!),
                                          r'''$.id''',
                                        ),
                                        selectedAnswer: _model.selectedAnswer,
                                        correctAnswer: getJsonField(
                                          _model.detailQuestions
                                              .elementAtOrNull(
                                                  _model.currentIndex!),
                                          r'''$.correctAnswer''',
                                        ).toString(),
                                        isCorrect: _model.isCorrectResultC,
                                        front: 'exercises',
                                        block: FFAppState().currentBlock,
                                      ));
                                      safeSetState(() {});
                                      await actions.showAnswerFeedback(
                                        context,
                                        _model.isCorrectResultC!,
                                      );
                                      if (_model.currentIndex! >=
                                          ((FFAppState().exerciseCount ?? 2) -
                                              1)) {
                                        if (FFAppState().examType == '') {
                                          context.pushNamed(
                                              BlockSelectionScreenWidget
                                                  .routeName);
                                        } else {
                                          _model.exerciseScoreResultC =
                                              await actions
                                                  .calculateExerciseScore(
                                            FFAppState().currentBlock,
                                            FFAppState().allAnswers.toList(),
                                          );
                                          await actions.saveExerciseScore(
                                            FFAppState().currentBlock,
                                            _model.exerciseScoreResultC!,
                                          );
                                          if (FFAppState().examType ==
                                              'subject') {
                                            context.pushNamed(
                                                ResultsScreenWidget.routeName);
                                          } else {
                                            _model.nextBlockC =
                                                await actions.getNextBlock(
                                              FFAppState().currentBlock,
                                            );
                                            if (_model.nextBlockC == 'DONE') {
                                              context.pushNamed(
                                                  ResultsScreenWidget
                                                      .routeName);
                                            } else {
                                              FFAppState().currentBlock =
                                                  _model.nextBlockC!;
                                              safeSetState(() {});

                                              context.pushNamed(
                                                  ExamQuestionScreenWidget
                                                      .routeName);
                                            }
                                          }
                                        }
                                      } else {
                                        _model.currentIndex =
                                            _model.currentIndex! + 1;
                                        _model.selectedAnswer = null;
                                        safeSetState(() {});
                                        FFAppState().localSelected = '';
                                        safeSetState(() {});
                                      }

                                      safeSetState(() {});
                                    },
                                    child: Container(
                                      width: double.infinity,
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
                                        padding: EdgeInsets.all(24.0),
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
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                  shape: BoxShape.circle,
                                                ),
                                                alignment: AlignmentDirectional(
                                                    0.0, 0.0),
                                                child: Text(
                                                  'C',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .titleMedium
                                                      .override(
                                                        font:
                                                            GoogleFonts.poppins(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleMedium
                                                                  .fontStyle,
                                                        ),
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .onPrimary,
                                                        fontSize: 30.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.bold,
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
                                                  getJsonField(
                                                    _model.detailQuestions
                                                        .elementAtOrNull(_model
                                                            .currentIndex!),
                                                    r'''$.optionC''',
                                                  ).toString(),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyLarge
                                                      .override(
                                                        font: GoogleFonts.inter(
                                                          fontWeight:
                                                              FontWeight.normal,
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
                                                        fontSize: 18.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyLarge
                                                                .fontStyle,
                                                        lineHeight: 1.5,
                                                      ),
                                                  overflow:
                                                      TextOverflow.visible,
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
                            ),
                            Flexible(
                              child: Align(
                                alignment: AlignmentDirectional(-1.0, -1.0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      20.0, 0.0, 20.0, 20.0),
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
                                        getJsonField(
                                          _model.detailQuestions
                                              .elementAtOrNull(
                                                  _model.currentIndex!),
                                          r'''$.correctAnswer''',
                                        ).toString(),
                                      );
                                      FFAppState()
                                          .addToAllAnswers(UserAnswerStruct(
                                        questionId: getJsonField(
                                          _model.detailQuestions
                                              .elementAtOrNull(
                                                  _model.currentIndex!),
                                          r'''$.id''',
                                        ),
                                        selectedAnswer: _model.selectedAnswer,
                                        correctAnswer: getJsonField(
                                          _model.detailQuestions
                                              .elementAtOrNull(
                                                  _model.currentIndex!),
                                          r'''$.correctAnswer''',
                                        ).toString(),
                                        isCorrect: _model.isCorrectResultD,
                                        front: 'exercises',
                                        block: FFAppState().currentBlock,
                                      ));
                                      safeSetState(() {});
                                      await actions.showAnswerFeedback(
                                        context,
                                        _model.isCorrectResultD!,
                                      );
                                      if (_model.currentIndex! >=
                                          ((FFAppState().exerciseCount ?? 2) -
                                              1)) {
                                        if (FFAppState().examType == '') {
                                          context.pushNamed(
                                              BlockSelectionScreenWidget
                                                  .routeName);
                                        } else {
                                          _model.exerciseScoreResultD =
                                              await actions
                                                  .calculateExerciseScore(
                                            FFAppState().currentBlock,
                                            FFAppState().allAnswers.toList(),
                                          );
                                          await actions.saveExerciseScore(
                                            FFAppState().currentBlock,
                                            _model.exerciseScoreResultD!,
                                          );
                                          if (FFAppState().examType ==
                                              'subject') {
                                            context.pushNamed(
                                                ResultsScreenWidget.routeName);
                                          } else {
                                            _model.nextBlockD =
                                                await actions.getNextBlock(
                                              FFAppState().currentBlock,
                                            );
                                            if (_model.nextBlockD == 'DONE') {
                                              context.pushNamed(
                                                  ResultsScreenWidget
                                                      .routeName);
                                            } else {
                                              FFAppState().currentBlock =
                                                  _model.nextBlockD!;
                                              safeSetState(() {});

                                              context.pushNamed(
                                                  ExamQuestionScreenWidget
                                                      .routeName);
                                            }
                                          }
                                        }
                                      } else {
                                        _model.currentIndex =
                                            _model.currentIndex! + 1;
                                        _model.selectedAnswer = null;
                                        safeSetState(() {});
                                        FFAppState().localSelected = '';
                                        safeSetState(() {});
                                      }

                                      safeSetState(() {});
                                    },
                                    child: Container(
                                      width: double.infinity,
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
                                        padding: EdgeInsets.all(24.0),
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
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                  shape: BoxShape.circle,
                                                ),
                                                alignment: AlignmentDirectional(
                                                    0.0, 0.0),
                                                child: Text(
                                                  'D',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .titleMedium
                                                      .override(
                                                        font:
                                                            GoogleFonts.poppins(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleMedium
                                                                  .fontStyle,
                                                        ),
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .onPrimary,
                                                        fontSize: 30.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.bold,
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
                                                  getJsonField(
                                                    _model.detailQuestions
                                                        .elementAtOrNull(_model
                                                            .currentIndex!),
                                                    r'''$.optionD''',
                                                  ).toString(),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyLarge
                                                      .override(
                                                        font: GoogleFonts.inter(
                                                          fontWeight:
                                                              FontWeight.normal,
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
                                                        fontSize: 18.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyLarge
                                                                .fontStyle,
                                                        lineHeight: 1.5,
                                                      ),
                                                  overflow:
                                                      TextOverflow.visible,
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
                            ),
                          ],
                        ),
                      ].divide(SizedBox(height: 24.0)),
                    ),
                    Align(
                      alignment: AlignmentDirectional(-1.0, -1.0),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            20.0, 0.0, 20.0, 5.0),
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
                            padding: EdgeInsets.all(24.0),
                            child: Container(
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 10.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        FaIcon(
                                          FontAwesomeIcons.lightbulb,
                                          color: Color(0xFF3CD415),
                                          size: 24.0,
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  10.0, 0.0, 0.0, 0.0),
                                          child: AutoSizeText(
                                            'Pistas',
                                            style: FlutterFlowTheme.of(context)
                                                .headlineSmall
                                                .override(
                                                  font: GoogleFonts.inter(
                                                    fontWeight: FontWeight.w600,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .headlineSmall
                                                            .fontStyle,
                                                  ),
                                                  color: Color(0xFF3CD415),
                                                  fontSize: 22.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w600,
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
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        width: 40.0,
                                        height: 40.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          shape: BoxShape.circle,
                                        ),
                                        alignment:
                                            AlignmentDirectional(0.0, 0.0),
                                        child: Text(
                                          '1',
                                          style: FlutterFlowTheme.of(context)
                                              .titleMedium
                                              .override(
                                                font: GoogleFonts.poppins(
                                                  fontWeight: FontWeight.bold,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleMedium
                                                          .fontStyle,
                                                ),
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .onPrimary,
                                                fontSize: 26.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.bold,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleMedium
                                                        .fontStyle,
                                                lineHeight: 1.4,
                                              ),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 1,
                                        child: Text(
                                          getJsonField(
                                            _model.detailQuestions
                                                .elementAtOrNull(
                                                    _model.currentIndex!),
                                            r'''$.paso1''',
                                          ).toString(),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyLarge
                                              .override(
                                                font: GoogleFonts.inter(
                                                  fontWeight: FontWeight.normal,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyLarge
                                                          .fontStyle,
                                                ),
                                                color: Colors.white,
                                                fontSize: 18.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.normal,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyLarge
                                                        .fontStyle,
                                                lineHeight: 1.5,
                                              ),
                                          overflow: TextOverflow.visible,
                                        ),
                                      ),
                                    ].divide(SizedBox(width: 16.0)),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 10.0, 0.0, 0.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          width: 40.0,
                                          height: 40.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            shape: BoxShape.circle,
                                          ),
                                          alignment:
                                              AlignmentDirectional(0.0, 0.0),
                                          child: Text(
                                            '2',
                                            style: FlutterFlowTheme.of(context)
                                                .titleMedium
                                                .override(
                                                  font: GoogleFonts.poppins(
                                                    fontWeight: FontWeight.bold,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .titleMedium
                                                            .fontStyle,
                                                  ),
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .onPrimary,
                                                  fontSize: 26.0,
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
                                            getJsonField(
                                              _model.detailQuestions
                                                  .elementAtOrNull(
                                                      _model.currentIndex!),
                                              r'''$.paso2''',
                                            ).toString(),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyLarge
                                                .override(
                                                  font: GoogleFonts.inter(
                                                    fontWeight:
                                                        FontWeight.normal,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyLarge
                                                            .fontStyle,
                                                  ),
                                                  color: Colors.white,
                                                  fontSize: 18.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.normal,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyLarge
                                                          .fontStyle,
                                                  lineHeight: 1.5,
                                                ),
                                            overflow: TextOverflow.visible,
                                          ),
                                        ),
                                      ].divide(SizedBox(width: 16.0)),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 10.0, 0.0, 0.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          width: 40.0,
                                          height: 40.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            shape: BoxShape.circle,
                                          ),
                                          alignment:
                                              AlignmentDirectional(0.0, 0.0),
                                          child: Text(
                                            '3',
                                            style: FlutterFlowTheme.of(context)
                                                .titleMedium
                                                .override(
                                                  font: GoogleFonts.poppins(
                                                    fontWeight: FontWeight.bold,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .titleMedium
                                                            .fontStyle,
                                                  ),
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .onPrimary,
                                                  fontSize: 26.0,
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
                                            getJsonField(
                                              _model.detailQuestions
                                                  .elementAtOrNull(
                                                      _model.currentIndex!),
                                              r'''$.paso3''',
                                            ).toString(),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyLarge
                                                .override(
                                                  font: GoogleFonts.inter(
                                                    fontWeight:
                                                        FontWeight.normal,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyLarge
                                                            .fontStyle,
                                                  ),
                                                  color: Colors.white,
                                                  fontSize: 18.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.normal,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyLarge
                                                          .fontStyle,
                                                  lineHeight: 1.5,
                                                ),
                                            overflow: TextOverflow.visible,
                                          ),
                                        ),
                                      ].divide(SizedBox(width: 16.0)),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 10.0, 0.0, 0.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          width: 40.0,
                                          height: 40.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            shape: BoxShape.circle,
                                          ),
                                          alignment:
                                              AlignmentDirectional(0.0, 0.0),
                                          child: Text(
                                            '4',
                                            style: FlutterFlowTheme.of(context)
                                                .titleMedium
                                                .override(
                                                  font: GoogleFonts.poppins(
                                                    fontWeight: FontWeight.bold,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .titleMedium
                                                            .fontStyle,
                                                  ),
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .onPrimary,
                                                  fontSize: 26.0,
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
                                            getJsonField(
                                              _model.detailQuestions
                                                  .elementAtOrNull(
                                                      _model.currentIndex!),
                                              r'''$.paso4''',
                                            ).toString(),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyLarge
                                                .override(
                                                  font: GoogleFonts.inter(
                                                    fontWeight:
                                                        FontWeight.normal,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyLarge
                                                            .fontStyle,
                                                  ),
                                                  color: Colors.white,
                                                  fontSize: 18.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.normal,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyLarge
                                                          .fontStyle,
                                                  lineHeight: 1.5,
                                                ),
                                            overflow: TextOverflow.visible,
                                          ),
                                        ),
                                      ].divide(SizedBox(width: 16.0)),
                                    ),
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
              ),
            ),
          ),
        ),
      ),
    );
  }
}
