// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future showAnswerFeedback(
  BuildContext context,
  bool isCorrect,
) async {
  // En modo examen NO se muestra feedback por pregunta.
  // La nota se ve al final, en la pantalla de resultados.
  if (FFAppState().currentSession.mode == 'exam') {
    return;
  }

  // Paleta de la app (tema oscuro neón)
  final Color accent =
      isCorrect ? const Color(0xFF3CD415) : const Color(0xFFFF3D57);
  const Color cardBg = Color(0xFF0B1220);
  const Color deepBg = Color(0xFF050816);
  const Color textSecondary = Color(0xFFA0A0AB);

  await showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext dialogContext) {
      return Dialog(
        backgroundColor: Colors.transparent,
        insetPadding: const EdgeInsets.symmetric(horizontal: 40),
        child: Container(
          padding: const EdgeInsets.all(28),
          decoration: BoxDecoration(
            color: cardBg,
            borderRadius: BorderRadius.circular(24),
            border: Border.all(color: accent, width: 2),
            boxShadow: [
              BoxShadow(
                color: accent.withOpacity(0.35),
                blurRadius: 24,
                spreadRadius: 1,
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 88,
                height: 88,
                decoration: BoxDecoration(
                  color: accent.withOpacity(0.15),
                  shape: BoxShape.circle,
                  border: Border.all(color: accent, width: 2),
                ),
                child: Icon(
                  isCorrect ? Icons.check_rounded : Icons.close_rounded,
                  color: accent,
                  size: 56,
                ),
              ),
              const SizedBox(height: 22),
              Text(
                isCorrect ? '¡Correcto!' : 'Incorrecto',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w800,
                  color: accent,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                isCorrect
                    ? '¡Muy bien! Sigue así.'
                    : 'No te preocupes, sigue intentando.',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 16,
                  color: textSecondary,
                ),
              ),
              const SizedBox(height: 26),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(dialogContext).pop();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: accent,
                    foregroundColor: isCorrect ? deepBg : Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                      side: const BorderSide(color: Colors.white, width: 2),
                    ),
                    elevation: 0,
                  ),
                  child: const Text(
                    'Continuar',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}
