import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/index.dart';
import 'detail_exercise_screen_widget.dart' show DetailExerciseScreenWidget;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class DetailExerciseScreenModel
    extends FlutterFlowModel<DetailExerciseScreenWidget> {
  ///  Local state fields for this page.

  int? currentIndex = 0;

  String? selectedAnswer;

  List<dynamic> detailQuestions = [];
  void addToDetailQuestions(dynamic item) => detailQuestions.add(item);
  void removeFromDetailQuestions(dynamic item) => detailQuestions.remove(item);
  void removeAtIndexFromDetailQuestions(int index) =>
      detailQuestions.removeAt(index);
  void insertAtIndexInDetailQuestions(int index, dynamic item) =>
      detailQuestions.insert(index, item);
  void updateDetailQuestionsAtIndex(int index, Function(dynamic) updateFn) =>
      detailQuestions[index] = updateFn(detailQuestions[index]);

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - fetchDetailExercisesFromURL] action in DetailExerciseScreen widget.
  List<dynamic>? loadedExercises;
  // Stores action output result for [Custom Action - pickRandomExercises] action in DetailExerciseScreen widget.
  List<dynamic>? randomExercises;
  // Stores action output result for [Custom Action - evaluateAnswer] action in Container widget.
  bool? isCorrectResultA;
  // Stores action output result for [Custom Action - calculateExerciseScore] action in Container widget.
  int? exerciseScoreResult;
  // Stores action output result for [Custom Action - getNextBlock] action in Container widget.
  String? nextBlock;
  // Stores action output result for [Custom Action - evaluateAnswer] action in Container widget.
  bool? isCorrectResultB;
  // Stores action output result for [Custom Action - calculateExerciseScore] action in Container widget.
  int? exerciseScoreResultB;
  // Stores action output result for [Custom Action - getNextBlock] action in Container widget.
  String? nextBlockB;
  // Stores action output result for [Custom Action - evaluateAnswer] action in Container widget.
  bool? isCorrectResultC;
  // Stores action output result for [Custom Action - calculateExerciseScore] action in Container widget.
  int? exerciseScoreResultC;
  // Stores action output result for [Custom Action - getNextBlock] action in Container widget.
  String? nextBlockC;
  // Stores action output result for [Custom Action - evaluateAnswer] action in Container widget.
  bool? isCorrectResultD;
  // Stores action output result for [Custom Action - calculateExerciseScore] action in Container widget.
  int? exerciseScoreResultD;
  // Stores action output result for [Custom Action - getNextBlock] action in Container widget.
  String? nextBlockD;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
