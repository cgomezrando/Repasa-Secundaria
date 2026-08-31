// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

String getBlockDisplayName(String block) {
  switch (block) {
    case 'matematicas':
      return 'Matemáticas';
    case 'lengua_literatura':
      return 'Lengua y Literatura';
    case 'geografia_historia':
      return 'Geografía e Historia';
    case 'fisica_quimica':
      return 'Física y Química';
    case 'ingles':
      return 'Inglés';
    case 'biologia_geologia':
      return 'Biología y Geología';
    case 'listening':
      return 'Comprensión Auditiva';
    default:
      return block;
  }
}
