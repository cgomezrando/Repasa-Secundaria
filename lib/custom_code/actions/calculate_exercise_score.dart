// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<int> calculateExerciseScore(
  String block,
  List<UserAnswerStruct> allAnswers,
) async {
  return allAnswers
      .where((a) => a.block == block && a.front == 'exercises' && a.isCorrect)
      .length;
}
