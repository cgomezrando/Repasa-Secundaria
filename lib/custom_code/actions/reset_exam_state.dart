// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future resetExamState() async {
  final s = FFAppState();

  // Scores MCQ por asignatura
  s.scoreMatematicas = 0;
  s.scoreLengua = 0;
  s.scoreGeografia = 0;
  s.scoreFisica = 0;
  s.scoreIngles = 0;
  s.scoreBiologia = 0;

  // Scores Ejercicios por asignatura
  s.exerciseMatematicas = 0;
  s.exerciseLengua = 0;
  s.exerciseGeografia = 0;
  s.exerciseFisica = 0;
  s.exerciseIngles = 0;
  s.exerciseBiologia = 0;

  // Totales generales
  s.totalExamScore = 0;
  s.examenCorrect = 0;

  // Respuestas y listening
  s.allAnswers = [];
  s.listeningScore = 0;
  s.mcqPlayed = 0;
}
