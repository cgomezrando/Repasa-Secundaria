// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future saveExerciseScore(
  String block,
  int score,
) async {
  final appState = FFAppState();
  switch (block) {
    case 'matematicas':
      appState.exerciseMatematicas = score;
      break;
    case 'lengua_literatura':
      appState.exerciseLengua = score;
      break;
    case 'geografia_historia':
      appState.exerciseGeografia = score;
      break;
    case 'fisica_quimica':
      appState.exerciseFisica = score;
      break;
    case 'ingles':
      appState.exerciseIngles = score;
      break;
    case 'biologia_geologia':
      appState.exerciseBiologia = score;
      break;
  }
  // Recalculate total (same logic as in saveBlockScore)
  final s = FFAppState();
  final examType = s.examType;
  final mcqCount = s.mcqCount == 0 ? 10 : s.mcqCount;
  final exerciseCount = s.exerciseCount == 0 ? 2 : s.exerciseCount;

  final mcqScores = {
    'matematicas': s.scoreMatematicas,
    'lengua_literatura': s.scoreLengua,
    'geografia_historia': s.scoreGeografia,
    'fisica_quimica': s.scoreFisica,
    'ingles': s.scoreIngles,
    'biologia_geologia': s.scoreBiologia,
  };

  final exerciseScores = {
    'matematicas': s.exerciseMatematicas,
    'lengua_literatura': s.exerciseLengua,
    'geografia_historia': s.exerciseGeografia,
    'fisica_quimica': s.exerciseFisica,
    'ingles': s.exerciseIngles,
    'biologia_geologia': s.exerciseBiologia,
  };

  double total = 0;

  if (examType == 'subject') {
    final b = s.examSubject;
    final mcqRaw = mcqScores[b] ?? 0;
    final excRaw = exerciseScores[b] ?? 0;
    total = (mcqRaw / mcqCount) * 60 + (excRaw / exerciseCount) * 40;
  } else {
    for (final b in mcqScores.keys) {
      final mcqRaw = mcqScores[b] ?? 0;
      final excRaw = exerciseScores[b] ?? 0;
      // Para Inglés el máximo de ejercicio es exerciseCount * 5 (5 preguntas por ronda de listening)
      final excMax = (b == 'ingles') ? (exerciseCount * 5) : exerciseCount;
      total += (mcqRaw / mcqCount) * 10.0 + (excRaw / excMax) * 6.667;
    }
  }

  s.totalExamScore = total.round();
}
