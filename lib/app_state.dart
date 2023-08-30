import 'package:flutter/material.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static final FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _curProblemIndex = prefs.getInt('ff_curProblemIndex') ?? _curProblemIndex;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  DateTime? _QuestionStart = DateTime.fromMillisecondsSinceEpoch(1690234740000);
  DateTime? get QuestionStart => _QuestionStart;
  set QuestionStart(DateTime? _value) {
    _QuestionStart = _value;
  }

  DateTime? _QuestionFinish =
      DateTime.fromMillisecondsSinceEpoch(1690234740000);
  DateTime? get QuestionFinish => _QuestionFinish;
  set QuestionFinish(DateTime? _value) {
    _QuestionFinish = _value;
  }

  ProblemStruct _problemInfo = ProblemStruct.fromSerializableMap(jsonDecode(
      '{\"problemID\":\"\\\"\\\"\",\"problemOptions\":\"3\",\"problemLevel\":\"1\",\"hasSymbolicNums\":\"true\",\"isRight\":\"true\",\"problemSet\":\"[]\",\"num1\":\"-1\",\"num2\":\"-1\",\"num3\":\"-1\",\"num4\":\"-1\",\"num5\":\"-1\"}'));
  ProblemStruct get problemInfo => _problemInfo;
  set problemInfo(ProblemStruct _value) {
    _problemInfo = _value;
  }

  void updateProblemInfoStruct(Function(ProblemStruct) updateFn) {
    updateFn(_problemInfo);
  }

  DateTime? _QuestionFirstResponse =
      DateTime.fromMillisecondsSinceEpoch(1690231860000);
  DateTime? get QuestionFirstResponse => _QuestionFirstResponse;
  set QuestionFirstResponse(DateTime? _value) {
    _QuestionFirstResponse = _value;
  }

  List<DocumentReference> _sessionQuestions = [];
  List<DocumentReference> get sessionQuestions => _sessionQuestions;
  set sessionQuestions(List<DocumentReference> _value) {
    _sessionQuestions = _value;
  }

  void addToSessionQuestions(DocumentReference _value) {
    _sessionQuestions.add(_value);
  }

  void removeFromSessionQuestions(DocumentReference _value) {
    _sessionQuestions.remove(_value);
  }

  void removeAtIndexFromSessionQuestions(int _index) {
    _sessionQuestions.removeAt(_index);
  }

  void updateSessionQuestionsAtIndex(
    int _index,
    DocumentReference Function(DocumentReference) updateFn,
  ) {
    _sessionQuestions[_index] = updateFn(_sessionQuestions[_index]);
  }

  int _numInitialQuestions = 0;
  int get numInitialQuestions => _numInitialQuestions;
  set numInitialQuestions(int _value) {
    _numInitialQuestions = _value;
  }

  DocumentReference? _sessionParentReference;
  DocumentReference? get sessionParentReference => _sessionParentReference;
  set sessionParentReference(DocumentReference? _value) {
    _sessionParentReference = _value;
  }

  bool _gotQuestionCorrect = false;
  bool get gotQuestionCorrect => _gotQuestionCorrect;
  set gotQuestionCorrect(bool _value) {
    _gotQuestionCorrect = _value;
  }

  bool _answeredQuestion = false;
  bool get answeredQuestion => _answeredQuestion;
  set answeredQuestion(bool _value) {
    _answeredQuestion = _value;
  }

  int _curLevel = 1;
  int get curLevel => _curLevel;
  set curLevel(int _value) {
    _curLevel = _value;
  }

  int _totalSessionQuestionsAnswered = 0;
  int get totalSessionQuestionsAnswered => _totalSessionQuestionsAnswered;
  set totalSessionQuestionsAnswered(int _value) {
    _totalSessionQuestionsAnswered = _value;
  }

  int _totalSessionNumCorrect = 0;
  int get totalSessionNumCorrect => _totalSessionNumCorrect;
  set totalSessionNumCorrect(int _value) {
    _totalSessionNumCorrect = _value;
  }

  int _curCycle = 1;
  int get curCycle => _curCycle;
  set curCycle(int _value) {
    _curCycle = _value;
  }

  int _numCorrect = 0;
  int get numCorrect => _numCorrect;
  set numCorrect(int _value) {
    _numCorrect = _value;
  }

  int _numTrialsDone = 0;
  int get numTrialsDone => _numTrialsDone;
  set numTrialsDone(int _value) {
    _numTrialsDone = _value;
  }

  int _curProblemIndex = 0;
  int get curProblemIndex => _curProblemIndex;
  set curProblemIndex(int _value) {
    _curProblemIndex = _value;
    prefs.setInt('ff_curProblemIndex', _value);
  }

  int _desiredTrialNum = 8;
  int get desiredTrialNum => _desiredTrialNum;
  set desiredTrialNum(int _value) {
    _desiredTrialNum = _value;
  }

  String _curAnimal1 = 'Asset 1';
  String get curAnimal1 => _curAnimal1;
  set curAnimal1(String _value) {
    _curAnimal1 = _value;
  }

  String _curAnimal2 = 'Asset 2';
  String get curAnimal2 => _curAnimal2;
  set curAnimal2(String _value) {
    _curAnimal2 = _value;
  }
}

LatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
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
