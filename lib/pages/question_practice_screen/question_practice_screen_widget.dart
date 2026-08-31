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
import 'question_practice_screen_model.dart';
export 'question_practice_screen_model.dart';

class QuestionPracticeScreenWidget extends StatefulWidget {
  const QuestionPracticeScreenWidget({super.key});

  static String routeName = 'QuestionPracticeScreen';
  static String routePath = '/questionPracticeScreen';

  @override
  State<QuestionPracticeScreenWidget> createState() =>
      _QuestionPracticeScreenWidgetState();
}

class _QuestionPracticeScreenWidgetState
    extends State<QuestionPracticeScreenWidget> {
  late QuestionPracticeScreenModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => QuestionPracticeScreenModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.loadedQuestions = await actions.fetchQuestionsAsStruct(
        FFAppState().currentBlock,
      );
      _model.practiceQuestions =
          _model.loadedQuestions!.toList().cast<QuestionItemStruct>();
      _model.practiceIndex = 0;
      _model.localSelected = null;
      safeSetState(() {});
      _model.blockName = await actions.getBlockDisplayName(
        FFAppState().currentBlock,
      );
      _model.displayBlockName = _model.blockName;
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
                                      10.0, 0.0, 0.0, 0.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.start,
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
                                              lineHeight: 1.3,
                                            ),
                                      ),
                                      Text(
                                        valueOrDefault<String>(
                                          _model.displayBlockName,
                                          'Asignatura',
                                        ),
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
                                              lineHeight: 1.3,
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
                                          15.0, 0.0, 0.0, 0.0),
                                      child: InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
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
                                          15.0, 0.0, 0.0, 0.0),
                                      child: InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          _model.localShowFeedback = false;
                                          _model.localSelected = '';
                                          _model.practiceIndex = 0;
                                          safeSetState(() {});
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
                                      15.0, 10.0, 15.0, 10.0),
                                  child: AutoSizeText(
                                    valueOrDefault<String>(
                                      _model.practiceQuestions
                                          .elementAtOrNull(_model.practiceIndex)
                                          ?.question,
                                      'Question',
                                    ),
                                    maxLines: 2,
                                    style: FlutterFlowTheme.of(context)
                                        .headlineSmall
                                        .override(
                                          font: GoogleFonts.inter(
                                            fontWeight: FontWeight.w500,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .headlineSmall
                                                    .fontStyle,
                                          ),
                                          color: Colors.white,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w500,
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
                            _model.localSelected = 'A';
                            safeSetState(() {});
                            _model.isCorrectResultA =
                                await actions.evaluateAnswer(
                              'A',
                              _model.practiceQuestions
                                  .elementAtOrNull(_model.practiceIndex)!
                                  .correctAnswer,
                            );
                            FFAppState().addToAllAnswers(UserAnswerStruct(
                              questionId: _model.practiceQuestions
                                  .elementAtOrNull(_model.practiceIndex)
                                  ?.id,
                              selectedAnswer: 'A',
                              correctAnswer: _model.practiceQuestions
                                  .elementAtOrNull(_model.practiceIndex)
                                  ?.correctAnswer,
                              isCorrect: _model.isCorrectResultA,
                              front: 'subjects',
                              block: FFAppState().currentBlock,
                            ));
                            await actions.showAnswerFeedback(
                              context,
                              _model.isCorrectResultA!,
                            );
                            _model.practiceIndex = _model.practiceIndex + 1;
                            safeSetState(() {});
                            if (_model.practiceIndex >=
                                _model.practiceQuestions.length) {
                              context.pushNamed(
                                  BlockSelectionScreenWidget.routeName);
                            } else {
                              _model.localSelected = null;
                              safeSetState(() {});
                            }

                            safeSetState(() {});
                          },
                          child: Container(
                            width: double.infinity,
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
                            child: Padding(
                              padding: EdgeInsets.all(24.0),
                              child: Container(
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      width: 60.0,
                                      height: 60.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        shape: BoxShape.circle,
                                      ),
                                      alignment: AlignmentDirectional(0.0, 0.0),
                                      child: Text(
                                        'A',
                                        style: FlutterFlowTheme.of(context)
                                            .titleMedium
                                            .override(
                                              font: GoogleFonts.poppins(
                                                fontWeight: FontWeight.bold,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleMedium
                                                        .fontStyle,
                                              ),
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .onPrimary,
                                              fontSize: 30.0,
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
                                        valueOrDefault<String>(
                                          _model.practiceQuestions
                                              .elementAtOrNull(
                                                  _model.practiceIndex)
                                              ?.optionA,
                                          '...',
                                        ),
                                        maxLines: 2,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyLarge
                                            .override(
                                              font: GoogleFonts.inter(
                                                fontWeight: FontWeight.bold,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyLarge
                                                        .fontStyle,
                                              ),
                                              color: Colors.white,
                                              fontSize: 20.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.bold,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
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
                            _model.localSelected = 'B';
                            safeSetState(() {});
                            _model.isCorrectResultB =
                                await actions.evaluateAnswer(
                              'B',
                              _model.practiceQuestions
                                  .elementAtOrNull(_model.practiceIndex)!
                                  .correctAnswer,
                            );
                            FFAppState().addToAllAnswers(UserAnswerStruct(
                              questionId: _model.practiceQuestions
                                  .elementAtOrNull(_model.practiceIndex)
                                  ?.id,
                              selectedAnswer: 'B',
                              correctAnswer: _model.practiceQuestions
                                  .elementAtOrNull(_model.practiceIndex)
                                  ?.correctAnswer,
                              isCorrect: _model.isCorrectResultB,
                              front: 'subjects',
                              block: FFAppState().currentBlock,
                            ));
                            await actions.showAnswerFeedback(
                              context,
                              _model.isCorrectResultB!,
                            );
                            _model.practiceIndex = _model.practiceIndex + 1;
                            safeSetState(() {});
                            if (_model.practiceIndex >=
                                _model.practiceQuestions.length) {
                              context.pushNamed(
                                  BlockSelectionScreenWidget.routeName);
                            } else {
                              _model.localSelected = null;
                              safeSetState(() {});
                            }

                            safeSetState(() {});
                          },
                          child: Container(
                            width: double.infinity,
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
                            child: Padding(
                              padding: EdgeInsets.all(24.0),
                              child: Container(
                                decoration: BoxDecoration(),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      width: 60.0,
                                      height: 60.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        shape: BoxShape.circle,
                                      ),
                                      alignment: AlignmentDirectional(0.0, 0.0),
                                      child: Text(
                                        'B',
                                        style: FlutterFlowTheme.of(context)
                                            .titleMedium
                                            .override(
                                              font: GoogleFonts.poppins(
                                                fontWeight: FontWeight.bold,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleMedium
                                                        .fontStyle,
                                              ),
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .onPrimary,
                                              fontSize: 30.0,
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
                                        valueOrDefault<String>(
                                          _model.practiceQuestions
                                              .elementAtOrNull(
                                                  _model.practiceIndex)
                                              ?.optionB,
                                          '...',
                                        ),
                                        maxLines: 2,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyLarge
                                            .override(
                                              font: GoogleFonts.inter(
                                                fontWeight: FontWeight.bold,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyLarge
                                                        .fontStyle,
                                              ),
                                              color: Colors.white,
                                              fontSize: 20.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.bold,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
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
                            _model.localSelected = 'C';
                            safeSetState(() {});
                            _model.isCorrectResultC =
                                await actions.evaluateAnswer(
                              'C',
                              _model.practiceQuestions
                                  .elementAtOrNull(_model.practiceIndex)!
                                  .correctAnswer,
                            );
                            FFAppState().addToAllAnswers(UserAnswerStruct(
                              questionId: _model.practiceQuestions
                                  .elementAtOrNull(_model.practiceIndex)
                                  ?.id,
                              selectedAnswer: 'C',
                              correctAnswer: _model.practiceQuestions
                                  .elementAtOrNull(_model.practiceIndex)
                                  ?.correctAnswer,
                              isCorrect: _model.isCorrectResultC,
                              front: 'subjects',
                              block: FFAppState().currentBlock,
                            ));
                            await actions.showAnswerFeedback(
                              context,
                              _model.isCorrectResultC!,
                            );
                            _model.practiceIndex = _model.practiceIndex + 1;
                            safeSetState(() {});
                            if (_model.practiceIndex >=
                                _model.practiceQuestions.length) {
                              context.pushNamed(
                                  BlockSelectionScreenWidget.routeName);
                            } else {
                              _model.localSelected = null;
                              safeSetState(() {});
                            }

                            safeSetState(() {});
                          },
                          child: Container(
                            width: double.infinity,
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
                            child: Padding(
                              padding: EdgeInsets.all(24.0),
                              child: Container(
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      width: 60.0,
                                      height: 60.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        shape: BoxShape.circle,
                                      ),
                                      alignment: AlignmentDirectional(0.0, 0.0),
                                      child: Text(
                                        'C',
                                        style: FlutterFlowTheme.of(context)
                                            .titleMedium
                                            .override(
                                              font: GoogleFonts.poppins(
                                                fontWeight: FontWeight.bold,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleMedium
                                                        .fontStyle,
                                              ),
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .onPrimary,
                                              fontSize: 30.0,
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
                                        valueOrDefault<String>(
                                          _model.practiceQuestions
                                              .elementAtOrNull(
                                                  _model.practiceIndex)
                                              ?.optionC,
                                          '...',
                                        ),
                                        maxLines: 2,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyLarge
                                            .override(
                                              font: GoogleFonts.inter(
                                                fontWeight: FontWeight.bold,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyLarge
                                                        .fontStyle,
                                              ),
                                              color: Colors.white,
                                              fontSize: 20.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.bold,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
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
                            _model.localSelected = 'D';
                            safeSetState(() {});
                            _model.isCorrectResultD =
                                await actions.evaluateAnswer(
                              'D',
                              _model.practiceQuestions
                                  .elementAtOrNull(_model.practiceIndex)!
                                  .correctAnswer,
                            );
                            FFAppState().addToAllAnswers(UserAnswerStruct(
                              questionId: _model.practiceQuestions
                                  .elementAtOrNull(_model.practiceIndex)
                                  ?.id,
                              selectedAnswer: 'D',
                              correctAnswer: _model.practiceQuestions
                                  .elementAtOrNull(_model.practiceIndex)
                                  ?.correctAnswer,
                              isCorrect: _model.isCorrectResultD,
                              front: 'subjects',
                              block: FFAppState().currentBlock,
                            ));
                            await actions.showAnswerFeedback(
                              context,
                              _model.isCorrectResultD!,
                            );
                            _model.practiceIndex = _model.practiceIndex + 1;
                            safeSetState(() {});
                            if (_model.practiceIndex >=
                                _model.practiceQuestions.length) {
                              context.pushNamed(
                                  BlockSelectionScreenWidget.routeName);
                            } else {
                              _model.localSelected = null;
                              safeSetState(() {});
                            }

                            safeSetState(() {});
                          },
                          child: Container(
                            width: double.infinity,
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
                            child: Padding(
                              padding: EdgeInsets.all(24.0),
                              child: Container(
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      width: 60.0,
                                      height: 60.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        shape: BoxShape.circle,
                                      ),
                                      alignment: AlignmentDirectional(0.0, 0.0),
                                      child: Text(
                                        'D',
                                        style: FlutterFlowTheme.of(context)
                                            .titleMedium
                                            .override(
                                              font: GoogleFonts.poppins(
                                                fontWeight: FontWeight.bold,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleMedium
                                                        .fontStyle,
                                              ),
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .onPrimary,
                                              fontSize: 30.0,
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
                                        valueOrDefault<String>(
                                          _model.practiceQuestions
                                              .elementAtOrNull(
                                                  _model.practiceIndex)
                                              ?.optionD,
                                          '...',
                                        ),
                                        maxLines: 2,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyLarge
                                            .override(
                                              font: GoogleFonts.inter(
                                                fontWeight: FontWeight.bold,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyLarge
                                                        .fontStyle,
                                              ),
                                              color: Colors.white,
                                              fontSize: 20.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.bold,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
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
