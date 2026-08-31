// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:convert';
import 'package:http/http.dart' as http;

Future<List<dynamic>> fetchQuestionsFromURL(String block) async {
  const Map<String, String> jsonUrls = {
    'matematicas':
        'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/triviade-secundaria-wa3d9w/assets/r9b66ij4befr/Matematicas_FINAL.json',
    'lengua_literatura':
        'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/triviade-secundaria-wa3d9w/assets/wklskmdyiyzk/Lengua_and_Literatura_FINAL.json',
    'geografia_historia':
        'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/triviade-secundaria-wa3d9w/assets/1eaq3augld24/Geografia_e_Historia_FINAL.json',
    'fisica_quimica':
        'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/triviade-secundaria-wa3d9w/assets/3tns1do455pc/Fisica_y_Quimica_FINAL.json',
    'ingles':
        'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/triviade-secundaria-wa3d9w/assets/4awnualosx73/Ingles.json',
    'biologia_geologia':
        'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/triviade-secundaria-wa3d9w/assets/qlh5zx8k6q26/Biologia_y_Geologia_FINAL.json',
  };

  final url = jsonUrls[block];
  if (url == null) {
    return [];
  }

  try {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode != 200) {
      return [];
    }

    final decoded = jsonDecode(response.body);
    final List<dynamic> rawList = decoded is List
        ? decoded
        : (decoded['questions'] ?? decoded['exercises'] ?? []);

    return rawList.map((e) {
      return {
        'id': e['id'],
        'subject': e['Subject'] ?? e['subject'] ?? '',
        'question': e['question'] ?? '',
        'optionA': e['optionA'] ?? '',
        'optionB': e['optionB'] ?? '',
        'optionC': e['optionC'] ?? '',
        'optionD': e['optionD'] ?? '',
        'correctAnswer': e['correctAnswer'] ?? '',
        'front': e['front'] ?? 'subjects',
        'block': e['block'] ?? block,
      };
    }).toList();
  } catch (e) {
    return [];
  }
}
