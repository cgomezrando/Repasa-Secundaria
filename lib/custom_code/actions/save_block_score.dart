// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future saveBlockScore(
  String block,
  int score,
) async {
  final appState = FFAppState();
  switch (block) {
    case 'matematicas':
      appState.scoreMatematicas = score;
      break;
    case 'lengua_literatura':
      appState.scoreLengua = score;
      break;
    case 'geografia_historia':
      appState.scoreGeografia = score;
      break;
    case 'fisica_quimica':
      appState.scoreFisica = score;
      break;
    case 'ingles':
      appState.scoreIngles = score;
      break;
    case 'biologia_geologia':
      appState.scoreBiologia = score;
      break;
  }
  _recalculateTotal();
}

void _recalculateTotal() {
  final s = FFAppState();
  final examType = s.examType;
  final mcqCount = s.mcqCount == 0 ? 10 : s.mcqCount;
  final exerciseCount = s.exerciseCount == 0 ? 2 : s.exerciseCount;

  // MCQ raw scores by subject
  final mcqScores = {
    'matematicas': s.scoreMatematicas,
    'lengua_literatura': s.scoreLengua,
    'geografia_historia': s.scoreGeografia,
    'fisica_quimica': s.scoreFisica,
    'ingles': s.scoreIngles,
    'biologia_geologia': s.scoreBiologia,
  };

  // Exercise raw scores by subject
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
    // Por Asignatura: 1 subject → 10 MCQ (60 pts) + 2 exercises (40 pts) = 100
    final block = s.examSubject;
    final mcqRaw = mcqScores[block] ?? 0;
    final excRaw = exerciseScores[block] ?? 0;
    final mcqPoints = (mcqRaw / mcqCount) * 60;
    final excPoints = (excRaw / exerciseCount) * 40;
    total = mcqPoints + excPoints;
  } else {
    // Global: 6 subjects → each subject worth 100/6 = 16.67 pts
    // Per subject: MCQ 60% × (16.67) = 10 pts, Exercise 40% × (16.67) = 6.67 pts
    for (final block in mcqScores.keys) {
      final mcqRaw = mcqScores[block] ?? 0;
      final excRaw = exerciseScores[block] ?? 0;
      final mcqPoints = (mcqRaw / mcqCount) * 10.0; // 10 pts per subject max
      // Para Inglés el máximo de ejercicio es exerciseCount * 5 (5 preguntas por ronda de listening)
      final excMax = (block == 'ingles') ? (exerciseCount * 5) : exerciseCount;
      final excPoints = (excRaw / excMax) * 6.667; // 6.67 pts per subject max
      total += mcqPoints + excPoints;
    }
  }

  s.totalExamScore = total.round();
}
