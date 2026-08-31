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
import 'listening_m_c_q_screen_model.dart';
export 'listening_m_c_q_screen_model.dart';

class ListeningMCQScreenWidget extends StatefulWidget {
  const ListeningMCQScreenWidget({super.key});

  static String routeName = 'ListeningMCQScreen';
  static String routePath = '/listeningMCQScreen';

  @override
  State<ListeningMCQScreenWidget> createState() =>
      _ListeningMCQScreenWidgetState();
}

class _ListeningMCQScreenWidgetState extends State<ListeningMCQScreenWidget> {
  late ListeningMCQScreenModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ListeningMCQScreenModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      FFAppState().localSelected = '';
      safeSetState(() {});
      await actions.initListeningForExam();
      _model.listeningLoaded = await actions.fetchListeningFromURL();
      FFAppState().allListeningQuestions =
          _model.listeningLoaded!.toList().cast<HistoryQuestionsStruct>();
      safeSetState(() {});
      _model.pageQuestions =
          _model.listeningLoaded!.toList().cast<HistoryQuestionsStruct>();
      safeSetState(() {});
      FFAppState().currentListeningQ = _model.pageQuestions.elementAtOrNull(0)!;
      safeSetState(() {});
      _model.randomHistory = await actions.getRandomNumber(
        1,
        20,
      );
      _model.currentHistoryIndex = _model.randomHistory!;
      safeSetState(() {});
      _model.filtered = await actions.filterByHistory(
        FFAppState().allListeningQuestions.toList(),
        _model.randomHistory!,
      );
      _model.pageQuestions =
          _model.filtered!.toList().cast<HistoryQuestionsStruct>();
      safeSetState(() {});
      FFAppState().currentListeningQ = _model.pageQuestions.elementAtOrNull(0)!;
      safeSetState(() {});
      _model.pageIndex = 0;
      safeSetState(() {});
      await actions.playAudio(
        FFAppState().currentListeningQ.audioURL,
      );
      _model.localShowFeedback = false;
      _model.localSelected = '';
      _model.localIsAnswered = false;
      safeSetState(() {});
      FFAppState().mcqPlayed = 0;
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
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      20.0, 0.0, 0.0, 0.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        FFAppState().UserName,
                                        style: FlutterFlowTheme.of(context)
                                            .titleLarge
                                            .override(
                                              font: GoogleFonts.inter(
                                                fontWeight: FontWeight.w800,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleLarge
                                                        .fontStyle,
                                              ),
                                              color: Color(0xFF3CD415),
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w800,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .titleLarge
                                                      .fontStyle,
                                              lineHeight: 0.0,
                                            ),
                                      ),
                                      Text(
                                        'Historia: ${_model.pageQuestions.elementAtOrNull(_model.pageIndex!)?.historyTitle}',
                                        style: FlutterFlowTheme.of(context)
                                            .titleLarge
                                            .override(
                                              font: GoogleFonts.inter(
                                                fontWeight: FontWeight.w800,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleLarge
                                                        .fontStyle,
                                              ),
                                              color: Color(0xFF3CD415),
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w800,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .titleLarge
                                                      .fontStyle,
                                              lineHeight: 0.0,
                                            ),
                                      ),
                                      Text(
                                        'Pregunta ${((_model.pageIndex!) + 1).toString()} de 5',
                                        style: FlutterFlowTheme.of(context)
                                            .titleLarge
                                            .override(
                                              font: GoogleFonts.inter(
                                                fontWeight: FontWeight.w800,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleLarge
                                                        .fontStyle,
                                              ),
                                              color: Color(0xFF3CD415),
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w800,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .titleLarge
                                                      .fontStyle,
                                              lineHeight: 0.0,
                                            ),
                                      ),
                                    ].divide(SizedBox(height: 4.0)),
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
                                          await actions.playAudio(
                                            FFAppState()
                                                .currentListeningQ
                                                .audioURL,
                                          );
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
                                            Icons.play_circle_outlined,
                                            color: Color(0xFF216F0E),
                                            size: 65.0,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          15.0, 0.0, 15.0, 0.0),
                                      child: InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          await actions.playAudio(
                                            '',
                                          );
                                          _model.localShowFeedback = false;
                                          _model.localSelected = '';
                                          safeSetState(() {});
                                          FFAppState().allAnswers = [];
                                          FFAppState().allListeningQuestions =
                                              [];
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
                                              topLeft: Radius.circular(12.0),
                                              topRight: Radius.circular(12.0),
                                              bottomLeft: Radius.circular(12.0),
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
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 15.0, 0.0),
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
                                    if ((int pageIndex, bool localIsAnswered,
                                            String mode, int exerciseCount) {
                                      return localIsAnswered == true &&
                                          pageIndex >= 4;
                                    }(
                                        _model.pageIndex!,
                                        _model.localIsAnswered!,
                                        FFAppState().currentSession.mode,
                                        FFAppState().exerciseCount))
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 10.0, 0.0),
                                        child: InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            await actions
                                                .handleListeningContinue(
                                              context,
                                            );
                                            _model.pageIndex = 0;
                                            _model.localIsAnswered = false;
                                            _model.localShowFeedback = false;
                                            _model.localSelected = '';
                                            safeSetState(() {});
                                          },
                                          child: Container(
                                            width: 75.0,
                                            height: 75.0,
                                            decoration: BoxDecoration(
                                              color: Color(0xFF3CD415),
                                              borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(12.0),
                                                topRight: Radius.circular(12.0),
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
                                              Icons.arrow_forward,
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
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 20.0),
                      child: Row(
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
                                        20.0, 10.0, 10.0, 10.0),
                                    child: AutoSizeText(
                                      valueOrDefault<String>(
                                        _model.pageQuestions
                                            .elementAtOrNull(_model.pageIndex!)
                                            ?.question,
                                        '...',
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .headlineSmall
                                          .override(
                                            font: GoogleFonts.inter(
                                              fontWeight: FontWeight.bold,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .headlineSmall
                                                      .fontStyle,
                                            ),
                                            color: Colors.white,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.bold,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .headlineSmall
                                                    .fontStyle,
                                            lineHeight: 1.4,
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
                        Expanded(
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
                                  if (_model.localIsAnswered == false) {
                                    FFAppState().localSelected = 'A';
                                    safeSetState(() {});
                                    await Future.delayed(
                                      Duration(
                                        milliseconds: 500,
                                      ),
                                    );
                                    _model.isCorrectResult =
                                        await actions.evaluateAnswer(
                                      'A',
                                      _model.pageQuestions
                                          .elementAtOrNull(_model.pageIndex!)!
                                          .correctAnswer,
                                    );
                                    FFAppState()
                                        .addToAllAnswers(UserAnswerStruct(
                                      questionId: _model.pageQuestions
                                          .elementAtOrNull(_model.pageIndex!)
                                          ?.id,
                                      selectedAnswer: 'A',
                                      correctAnswer: _model.pageQuestions
                                          .elementAtOrNull(_model.pageIndex!)
                                          ?.correctAnswer,
                                      isCorrect: _model.isCorrectResult,
                                      front: 'listening_mcq',
                                      block: 'listening_mcq',
                                    ));
                                    if (_model.isCorrectResult == true) {
                                      FFAppState().listeningScore =
                                          FFAppState().listeningScore + 1;
                                      safeSetState(() {});
                                    }
                                    _model.localShowFeedback = true;
                                    safeSetState(() {});
                                    await actions.showAnswerFeedback(
                                      context,
                                      _model.isCorrectResult!,
                                    );
                                    _model.localIsAnswered = true;
                                    safeSetState(() {});
                                    if (_model.pageIndex! < 4) {
                                      _model.localShowFeedback = false;
                                      _model.localIsAnswered = false;
                                      _model.localSelected = '';
                                      safeSetState(() {});
                                      _model.pageIndex = _model.pageIndex! + 1;
                                      safeSetState(() {});
                                      FFAppState().localSelected = '';
                                      safeSetState(() {});
                                    }
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
                                      decoration: BoxDecoration(),
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
                                                _model.pageQuestions
                                                    .elementAtOrNull(
                                                        _model.pageIndex!)
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
                        ),
                        Expanded(
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
                                  if (_model.localIsAnswered == false) {
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
                                      _model.pageQuestions
                                          .elementAtOrNull(_model.pageIndex!)!
                                          .correctAnswer,
                                    );
                                    FFAppState()
                                        .addToAllAnswers(UserAnswerStruct(
                                      questionId: _model.pageQuestions
                                          .elementAtOrNull(_model.pageIndex!)
                                          ?.id,
                                      selectedAnswer: 'B',
                                      correctAnswer: _model.pageQuestions
                                          .elementAtOrNull(_model.pageIndex!)
                                          ?.correctAnswer,
                                      isCorrect: _model.isCorrectResultB,
                                      front: 'listening_mcq',
                                      block: 'listening_mcq',
                                    ));
                                    if (_model.isCorrectResultB == true) {
                                      FFAppState().listeningScore =
                                          FFAppState().listeningScore + 1;
                                      safeSetState(() {});
                                    }
                                    _model.localShowFeedback = true;
                                    safeSetState(() {});
                                    await actions.showAnswerFeedback(
                                      context,
                                      _model.isCorrectResultB!,
                                    );
                                    _model.localIsAnswered = true;
                                    safeSetState(() {});
                                    if (_model.pageIndex! < 4) {
                                      _model.localShowFeedback = false;
                                      _model.localIsAnswered = false;
                                      _model.localSelected = '';
                                      safeSetState(() {});
                                      _model.pageIndex = _model.pageIndex! + 1;
                                      safeSetState(() {});
                                      FFAppState().localSelected = '';
                                      safeSetState(() {});
                                    }
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
                                                _model.pageQuestions
                                                    .elementAtOrNull(
                                                        _model.pageIndex!)
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
                        ),
                      ],
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
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
                                  if (_model.localIsAnswered == false) {
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
                                      _model.pageQuestions
                                          .elementAtOrNull(_model.pageIndex!)!
                                          .correctAnswer,
                                    );
                                    FFAppState()
                                        .addToAllAnswers(UserAnswerStruct(
                                      questionId: _model.pageQuestions
                                          .elementAtOrNull(_model.pageIndex!)
                                          ?.id,
                                      selectedAnswer: 'C',
                                      correctAnswer: _model.pageQuestions
                                          .elementAtOrNull(_model.pageIndex!)
                                          ?.correctAnswer,
                                      isCorrect: _model.isCorrectResultC,
                                      front: 'listening_mcq',
                                      block: 'listening_mcq',
                                    ));
                                    if (_model.isCorrectResultC == true) {
                                      FFAppState().listeningScore =
                                          FFAppState().listeningScore + 1;
                                      safeSetState(() {});
                                    }
                                    _model.localShowFeedback = true;
                                    safeSetState(() {});
                                    await actions.showAnswerFeedback(
                                      context,
                                      _model.isCorrectResultC!,
                                    );
                                    _model.localIsAnswered = true;
                                    safeSetState(() {});
                                    if (_model.pageIndex! < 4) {
                                      _model.localShowFeedback = false;
                                      _model.localIsAnswered = false;
                                      _model.localSelected = '';
                                      safeSetState(() {});
                                      _model.pageIndex = _model.pageIndex! + 1;
                                      safeSetState(() {});
                                      FFAppState().localSelected = '';
                                      safeSetState(() {});
                                    }
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
                                                _model.pageQuestions
                                                    .elementAtOrNull(
                                                        _model.pageIndex!)
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
                        ),
                        Expanded(
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
                                  if (_model.localIsAnswered == false) {
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
                                      _model.pageQuestions
                                          .elementAtOrNull(_model.pageIndex!)!
                                          .correctAnswer,
                                    );
                                    FFAppState()
                                        .addToAllAnswers(UserAnswerStruct(
                                      questionId: _model.pageQuestions
                                          .elementAtOrNull(_model.pageIndex!)
                                          ?.id,
                                      selectedAnswer: 'D',
                                      correctAnswer: _model.pageQuestions
                                          .elementAtOrNull(_model.pageIndex!)
                                          ?.correctAnswer,
                                      isCorrect: _model.isCorrectResultD,
                                      front: 'listening_mcq',
                                      block: 'listening_mcq',
                                    ));
                                    if (_model.isCorrectResultD == true) {
                                      FFAppState().listeningScore =
                                          FFAppState().listeningScore + 1;
                                      safeSetState(() {});
                                    }
                                    _model.localShowFeedback = true;
                                    safeSetState(() {});
                                    await actions.showAnswerFeedback(
                                      context,
                                      _model.isCorrectResultD!,
                                    );
                                    _model.localIsAnswered = true;
                                    safeSetState(() {});
                                    if (_model.pageIndex! < 4) {
                                      _model.localShowFeedback = false;
                                      _model.localIsAnswered = false;
                                      _model.localSelected = '';
                                      safeSetState(() {});
                                      _model.pageIndex = _model.pageIndex! + 1;
                                      safeSetState(() {});
                                      FFAppState().localSelected = '';
                                      safeSetState(() {});
                                    }
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
                                                _model.pageQuestions
                                                    .elementAtOrNull(
                                                        _model.pageIndex!)
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
                        ),
                      ],
                    ),
                  ].divide(SizedBox(height: 24.0)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
