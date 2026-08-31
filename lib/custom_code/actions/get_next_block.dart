// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

String getNextBlock(String currentBlock) {
  switch (currentBlock) {
    case 'matematicas':
      return 'lengua_literatura';
    case 'lengua_literatura':
      return 'geografia_historia';
    case 'geografia_historia':
      return 'fisica_quimica';
    case 'fisica_quimica':
      return 'ingles';
    case 'ingles':
      return 'biologia_geologia';
    case 'biologia_geologia':
      return 'DONE';
    default:
      return 'DONE';
  }
}
