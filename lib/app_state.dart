import 'package:flutter/material.dart';
import '/backend/schema/structs/index.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _UserName = prefs.getString('ff_UserName') ?? _UserName;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  ExamSessionStruct _currentSession = ExamSessionStruct();
  ExamSessionStruct get currentSession => _currentSession;
  set currentSession(ExamSessionStruct value) {
    _currentSession = value;
  }

  void updateCurrentSessionStruct(Function(ExamSessionStruct) updateFn) {
    updateFn(_currentSession);
  }

  List<UserAnswerStruct> _allAnswers = [];
  List<UserAnswerStruct> get allAnswers => _allAnswers;
  set allAnswers(List<UserAnswerStruct> value) {
    _allAnswers = value;
  }

  void addToAllAnswers(UserAnswerStruct value) {
    allAnswers.add(value);
  }

  void removeFromAllAnswers(UserAnswerStruct value) {
    allAnswers.remove(value);
  }

  void removeAtIndexFromAllAnswers(int index) {
    allAnswers.removeAt(index);
  }

  void updateAllAnswersAtIndex(
    int index,
    UserAnswerStruct Function(UserAnswerStruct) updateFn,
  ) {
    allAnswers[index] = updateFn(_allAnswers[index]);
  }

  void insertAtIndexInAllAnswers(int index, UserAnswerStruct value) {
    allAnswers.insert(index, value);
  }

  int _listeningScore = 0;
  int get listeningScore => _listeningScore;
  set listeningScore(int value) {
    _listeningScore = value;
  }

  List<HistoryQuestionsStruct> _listeningQuestions = [];
  List<HistoryQuestionsStruct> get listeningQuestions => _listeningQuestions;
  set listeningQuestions(List<HistoryQuestionsStruct> value) {
    _listeningQuestions = value;
  }

  void addToListeningQuestions(HistoryQuestionsStruct value) {
    listeningQuestions.add(value);
  }

  void removeFromListeningQuestions(HistoryQuestionsStruct value) {
    listeningQuestions.remove(value);
  }

  void removeAtIndexFromListeningQuestions(int index) {
    listeningQuestions.removeAt(index);
  }

  void updateListeningQuestionsAtIndex(
    int index,
    HistoryQuestionsStruct Function(HistoryQuestionsStruct) updateFn,
  ) {
    listeningQuestions[index] = updateFn(_listeningQuestions[index]);
  }

  void insertAtIndexInListeningQuestions(
      int index, HistoryQuestionsStruct value) {
    listeningQuestions.insert(index, value);
  }

  HistoryQuestionsStruct _currentListeningQ = HistoryQuestionsStruct();
  HistoryQuestionsStruct get currentListeningQ => _currentListeningQ;
  set currentListeningQ(HistoryQuestionsStruct value) {
    _currentListeningQ = value;
  }

  void updateCurrentListeningQStruct(
      Function(HistoryQuestionsStruct) updateFn) {
    updateFn(_currentListeningQ);
  }

  List<QuestionItemStruct> _practiceQuestions = [];
  List<QuestionItemStruct> get practiceQuestions => _practiceQuestions;
  set practiceQuestions(List<QuestionItemStruct> value) {
    _practiceQuestions = value;
  }

  void addToPracticeQuestions(QuestionItemStruct value) {
    practiceQuestions.add(value);
  }

  void removeFromPracticeQuestions(QuestionItemStruct value) {
    practiceQuestions.remove(value);
  }

  void removeAtIndexFromPracticeQuestions(int index) {
    practiceQuestions.removeAt(index);
  }

  void updatePracticeQuestionsAtIndex(
    int index,
    QuestionItemStruct Function(QuestionItemStruct) updateFn,
  ) {
    practiceQuestions[index] = updateFn(_practiceQuestions[index]);
  }

  void insertAtIndexInPracticeQuestions(int index, QuestionItemStruct value) {
    practiceQuestions.insert(index, value);
  }

  int _practiceIndex = 0;
  int get practiceIndex => _practiceIndex;
  set practiceIndex(int value) {
    _practiceIndex = value;
  }

  String _localSelected = '';
  String get localSelected => _localSelected;
  set localSelected(String value) {
    _localSelected = value;
  }

  bool _localShowFeedback = false;
  bool get localShowFeedback => _localShowFeedback;
  set localShowFeedback(bool value) {
    _localShowFeedback = value;
  }

  String _UserName = '';
  String get UserName => _UserName;
  set UserName(String value) {
    _UserName = value;
    prefs.setString('ff_UserName', value);
  }

  int _currentFillExerciseIndex = 0;
  int get currentFillExerciseIndex => _currentFillExerciseIndex;
  set currentFillExerciseIndex(int value) {
    _currentFillExerciseIndex = value;
  }

  List<HistoryQuestionsStruct> _allListeningQuestions = [];
  List<HistoryQuestionsStruct> get allListeningQuestions =>
      _allListeningQuestions;
  set allListeningQuestions(List<HistoryQuestionsStruct> value) {
    _allListeningQuestions = value;
  }

  void addToAllListeningQuestions(HistoryQuestionsStruct value) {
    allListeningQuestions.add(value);
  }

  void removeFromAllListeningQuestions(HistoryQuestionsStruct value) {
    allListeningQuestions.remove(value);
  }

  void removeAtIndexFromAllListeningQuestions(int index) {
    allListeningQuestions.removeAt(index);
  }

  void updateAllListeningQuestionsAtIndex(
    int index,
    HistoryQuestionsStruct Function(HistoryQuestionsStruct) updateFn,
  ) {
    allListeningQuestions[index] = updateFn(_allListeningQuestions[index]);
  }

  void insertAtIndexInAllListeningQuestions(
      int index, HistoryQuestionsStruct value) {
    allListeningQuestions.insert(index, value);
  }

  int _mcqPlayed = 0;
  int get mcqPlayed => _mcqPlayed;
  set mcqPlayed(int value) {
    _mcqPlayed = value;
  }

  int _totalExamScore = 0;
  int get totalExamScore => _totalExamScore;
  set totalExamScore(int value) {
    _totalExamScore = value;
  }

  int _examenCorrect = 0;
  int get examenCorrect => _examenCorrect;
  set examenCorrect(int value) {
    _examenCorrect = value;
  }

  String _currentBlock = 'matematicas';
  String get currentBlock => _currentBlock;
  set currentBlock(String value) {
    _currentBlock = value;
  }

  int _scoreMatematicas = 0;
  int get scoreMatematicas => _scoreMatematicas;
  set scoreMatematicas(int value) {
    _scoreMatematicas = value;
  }

  int _scoreLengua = 0;
  int get scoreLengua => _scoreLengua;
  set scoreLengua(int value) {
    _scoreLengua = value;
  }

  int _scoreGeografia = 0;
  int get scoreGeografia => _scoreGeografia;
  set scoreGeografia(int value) {
    _scoreGeografia = value;
  }

  int _scoreFisica = 0;
  int get scoreFisica => _scoreFisica;
  set scoreFisica(int value) {
    _scoreFisica = value;
  }

  int _scoreIngles = 0;
  int get scoreIngles => _scoreIngles;
  set scoreIngles(int value) {
    _scoreIngles = value;
  }

  int _scoreBiologia = 0;
  int get scoreBiologia => _scoreBiologia;
  set scoreBiologia(int value) {
    _scoreBiologia = value;
  }

  String _examType = '';
  String get examType => _examType;
  set examType(String value) {
    _examType = value;
  }

  int _mcqCount = 0;
  int get mcqCount => _mcqCount;
  set mcqCount(int value) {
    _mcqCount = value;
  }

  int _exerciseCount = 0;
  int get exerciseCount => _exerciseCount;
  set exerciseCount(int value) {
    _exerciseCount = value;
  }

  int _exerciseMatematicas = 0;
  int get exerciseMatematicas => _exerciseMatematicas;
  set exerciseMatematicas(int value) {
    _exerciseMatematicas = value;
  }

  int _exerciseLengua = 0;
  int get exerciseLengua => _exerciseLengua;
  set exerciseLengua(int value) {
    _exerciseLengua = value;
  }

  int _exerciseGeografia = 0;
  int get exerciseGeografia => _exerciseGeografia;
  set exerciseGeografia(int value) {
    _exerciseGeografia = value;
  }

  int _exerciseFisica = 0;
  int get exerciseFisica => _exerciseFisica;
  set exerciseFisica(int value) {
    _exerciseFisica = value;
  }

  int _exerciseIngles = 0;
  int get exerciseIngles => _exerciseIngles;
  set exerciseIngles(int value) {
    _exerciseIngles = value;
  }

  int _exerciseBiologia = 0;
  int get exerciseBiologia => _exerciseBiologia;
  set exerciseBiologia(int value) {
    _exerciseBiologia = value;
  }

  String _examSubject = '';
  String get examSubject => _examSubject;
  set examSubject(String value) {
    _examSubject = value;
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
