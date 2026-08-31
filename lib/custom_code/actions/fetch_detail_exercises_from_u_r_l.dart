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

Future<List<dynamic>> fetchDetailExercisesFromURL(String detailBlock) async {
  const Map<String, String> detailJsonUrls = {
    'matematicas':
        'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/triviade-secundaria-wa3d9w/assets/50dnc3zn599v/matematicas_ejercicios_detallados.json',
    'lengua_literatura':
        'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/triviade-secundaria-wa3d9w/assets/v34f1jfuio0z/lengua_literatura_20_ejercicios_completos.json',
    'geografia_historia':
        'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/triviade-secundaria-wa3d9w/assets/fotgkn9qmdvh/geografia_historia_20_ejercicios_completos.json',
    'fisica_quimica':
        'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/triviade-secundaria-wa3d9w/assets/n1lgx3qzlenr/fisica_quimica_20_ejercicios_completos.json',
    'biologia_geologia':
        'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/triviade-secundaria-wa3d9w/assets/a7mzsmmkos10/biologia_geologia_20_ejercicios_completos.json',
  };

  final url = detailJsonUrls[detailBlock];
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
        'subject': e['subject'] ?? e['Subject'] ?? '',
        'level': e['level'] ?? '',
        'emoji': e['emoji'] ?? '📚',
        'question': e['question'] ?? '',
        'context': e['context'] ?? '',
        'hint': e['hint'] ?? '',
        'paso1': e['paso1'] ?? '',
        'paso2': e['paso2'] ?? '',
        'paso3': e['paso3'] ?? '',
        'paso4': e['paso4'] ?? '',
        'optionA': e['optionA'] ?? '',
        'optionB': e['optionB'] ?? '',
        'optionC': e['optionC'] ?? '',
        'optionD': e['optionD'] ?? '',
        'correctAnswer': e['correctAnswer'] ?? '',
        'explanation': e['explanation'] ?? '',
        'front': e['front'] ?? 'subjects',
        'block': e['block'] ?? detailBlock,
      };
    }).toList();
  } catch (e) {
    return [];
  }
}
