// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import '/app_state.dart';
import '/custom_code/actions/index.dart';

import '/index.dart';
import '/flutter_flow/nav/nav.dart';

Future handleListeningContinue(BuildContext context) async {
  final s = FFAppState();
  final isExam = s.currentSession.mode == 'exam';

  // Incrementar contador de rondas (1 ronda = 5 preguntas)
  s.mcqPlayed = s.mcqPlayed + 1;

  // Máximo de rondas según modo
  final maxRounds = isExam ? (s.exerciseCount == 0 ? 1 : s.exerciseCount) : 5;

  // ============ TODAS LAS RONDAS COMPLETADAS ============
  if (s.mcqPlayed >= maxRounds) {
    await playAudio('');

    if (!isExam) {
      // Modo práctica: volver a BlockSelection
      context.pushNamed(BlockSelectionScreenWidget.routeName);
      return;
    }

    // Modo examen: guardar listening como ejercicio de inglés + recalcular total
    s.exerciseIngles = s.listeningScore;

    final mcqCount = s.mcqCount == 0 ? 10 : s.mcqCount;
    final exerciseCount = s.exerciseCount == 0 ? 1 : s.exerciseCount;

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
    if (s.examType == 'subject') {
      final b = s.examSubject;
      final mcqRaw = mcqScores[b] ?? 0;
      final excRaw = exerciseScores[b] ?? 0;
      total = (mcqRaw / mcqCount) * 60 + (excRaw / (exerciseCount * 5)) * 40;
    } else {
      for (final b in mcqScores.keys) {
        final mcqRaw = mcqScores[b] ?? 0;
        final excRaw = exerciseScores[b] ?? 0;
        // Para Inglés el max de ejercicios es exerciseCount * 5 (por las preguntas)
        final excMax = (b == 'ingles') ? (exerciseCount * 5) : exerciseCount;
        total += (mcqRaw / mcqCount) * 10.0 + (excRaw / excMax) * 6.667;
      }
    }
    s.totalExamScore = total.round();

    // Navegar según examType
    if (s.examType == 'subject') {
      context.pushNamed(ResultsScreenWidget.routeName);
      return;
    }

    final nextBlock = getNextBlock('ingles');
    if (nextBlock == 'DONE') {
      context.pushNamed(ResultsScreenWidget.routeName);
    } else {
      s.currentBlock = nextBlock;
      context.pushNamed(ExamQuestionScreenWidget.routeName);
    }
    return;
  }

  // ============ AVANZAR A SIGUIENTE RONDA ============
  final randomIndex = 1 + (DateTime.now().millisecondsSinceEpoch % 20);
  final filtered = await filterByHistory(
    s.allListeningQuestions.toList(),
    randomIndex,
  );
  if (filtered.isNotEmpty) {
    s.currentListeningQ = filtered[0];
    await playAudio(s.currentListeningQ.audioURL);
  }
}
