// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<List<QuestionItemStruct>> pickRandomQuestions(
  List<dynamic> allQuestions,
  int count,
) async {
  final structs = allQuestions
      .map((e) => QuestionItemStruct.maybeFromMap(e))
      .whereType<QuestionItemStruct>()
      .toList();
  structs.shuffle();
  return structs.take(count).toList();
}
