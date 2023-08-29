// ignore_for_file: unnecessary_getters_setters
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ProblemStruct extends FFFirebaseStruct {
  ProblemStruct({
    int? problemOptions,
    int? problemLevel,
    double? problemID,
    int? problemCycle,
    String? referenceID,
    bool? isRight,
    bool? firstAttempt,
    int? num1,
    int? num2,
    int? num3,
    int? num4,
    int? num5,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _problemOptions = problemOptions,
        _problemLevel = problemLevel,
        _problemID = problemID,
        _problemCycle = problemCycle,
        _referenceID = referenceID,
        _isRight = isRight,
        _firstAttempt = firstAttempt,
        _num1 = num1,
        _num2 = num2,
        _num3 = num3,
        _num4 = num4,
        _num5 = num5,
        super(firestoreUtilData);

  // "problemOptions" field.
  int? _problemOptions;
  int get problemOptions => _problemOptions ?? 0;
  set problemOptions(int? val) => _problemOptions = val;
  void incrementProblemOptions(int amount) =>
      _problemOptions = problemOptions + amount;
  bool hasProblemOptions() => _problemOptions != null;

  // "problemLevel" field.
  int? _problemLevel;
  int get problemLevel => _problemLevel ?? 0;
  set problemLevel(int? val) => _problemLevel = val;
  void incrementProblemLevel(int amount) =>
      _problemLevel = problemLevel + amount;
  bool hasProblemLevel() => _problemLevel != null;

  // "problemID" field.
  double? _problemID;
  double get problemID => _problemID ?? 0.0;
  set problemID(double? val) => _problemID = val;
  void incrementProblemID(double amount) => _problemID = problemID + amount;
  bool hasProblemID() => _problemID != null;

  // "problemCycle" field.
  int? _problemCycle;
  int get problemCycle => _problemCycle ?? 0;
  set problemCycle(int? val) => _problemCycle = val;
  void incrementProblemCycle(int amount) =>
      _problemCycle = problemCycle + amount;
  bool hasProblemCycle() => _problemCycle != null;

  // "referenceID" field.
  String? _referenceID;
  String get referenceID => _referenceID ?? '';
  set referenceID(String? val) => _referenceID = val;
  bool hasReferenceID() => _referenceID != null;

  // "isRight" field.
  bool? _isRight;
  bool get isRight => _isRight ?? false;
  set isRight(bool? val) => _isRight = val;
  bool hasIsRight() => _isRight != null;

  // "firstAttempt" field.
  bool? _firstAttempt;
  bool get firstAttempt => _firstAttempt ?? false;
  set firstAttempt(bool? val) => _firstAttempt = val;
  bool hasFirstAttempt() => _firstAttempt != null;

  // "num1" field.
  int? _num1;
  int get num1 => _num1 ?? 0;
  set num1(int? val) => _num1 = val;
  void incrementNum1(int amount) => _num1 = num1 + amount;
  bool hasNum1() => _num1 != null;

  // "num2" field.
  int? _num2;
  int get num2 => _num2 ?? 0;
  set num2(int? val) => _num2 = val;
  void incrementNum2(int amount) => _num2 = num2 + amount;
  bool hasNum2() => _num2 != null;

  // "num3" field.
  int? _num3;
  int get num3 => _num3 ?? 0;
  set num3(int? val) => _num3 = val;
  void incrementNum3(int amount) => _num3 = num3 + amount;
  bool hasNum3() => _num3 != null;

  // "num4" field.
  int? _num4;
  int get num4 => _num4 ?? 0;
  set num4(int? val) => _num4 = val;
  void incrementNum4(int amount) => _num4 = num4 + amount;
  bool hasNum4() => _num4 != null;

  // "num5" field.
  int? _num5;
  int get num5 => _num5 ?? 0;
  set num5(int? val) => _num5 = val;
  void incrementNum5(int amount) => _num5 = num5 + amount;
  bool hasNum5() => _num5 != null;

  static ProblemStruct fromMap(Map<String, dynamic> data) => ProblemStruct(
        problemOptions: castToType<int>(data['problemOptions']),
        problemLevel: castToType<int>(data['problemLevel']),
        problemID: castToType<double>(data['problemID']),
        problemCycle: castToType<int>(data['problemCycle']),
        referenceID: data['referenceID'] as String?,
        isRight: data['isRight'] as bool?,
        firstAttempt: data['firstAttempt'] as bool?,
        num1: castToType<int>(data['num1']),
        num2: castToType<int>(data['num2']),
        num3: castToType<int>(data['num3']),
        num4: castToType<int>(data['num4']),
        num5: castToType<int>(data['num5']),
      );

  static ProblemStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? ProblemStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'problemOptions': _problemOptions,
        'problemLevel': _problemLevel,
        'problemID': _problemID,
        'problemCycle': _problemCycle,
        'referenceID': _referenceID,
        'isRight': _isRight,
        'firstAttempt': _firstAttempt,
        'num1': _num1,
        'num2': _num2,
        'num3': _num3,
        'num4': _num4,
        'num5': _num5,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'problemOptions': serializeParam(
          _problemOptions,
          ParamType.int,
        ),
        'problemLevel': serializeParam(
          _problemLevel,
          ParamType.int,
        ),
        'problemID': serializeParam(
          _problemID,
          ParamType.double,
        ),
        'problemCycle': serializeParam(
          _problemCycle,
          ParamType.int,
        ),
        'referenceID': serializeParam(
          _referenceID,
          ParamType.String,
        ),
        'isRight': serializeParam(
          _isRight,
          ParamType.bool,
        ),
        'firstAttempt': serializeParam(
          _firstAttempt,
          ParamType.bool,
        ),
        'num1': serializeParam(
          _num1,
          ParamType.int,
        ),
        'num2': serializeParam(
          _num2,
          ParamType.int,
        ),
        'num3': serializeParam(
          _num3,
          ParamType.int,
        ),
        'num4': serializeParam(
          _num4,
          ParamType.int,
        ),
        'num5': serializeParam(
          _num5,
          ParamType.int,
        ),
      }.withoutNulls;

  static ProblemStruct fromSerializableMap(Map<String, dynamic> data) =>
      ProblemStruct(
        problemOptions: deserializeParam(
          data['problemOptions'],
          ParamType.int,
          false,
        ),
        problemLevel: deserializeParam(
          data['problemLevel'],
          ParamType.int,
          false,
        ),
        problemID: deserializeParam(
          data['problemID'],
          ParamType.double,
          false,
        ),
        problemCycle: deserializeParam(
          data['problemCycle'],
          ParamType.int,
          false,
        ),
        referenceID: deserializeParam(
          data['referenceID'],
          ParamType.String,
          false,
        ),
        isRight: deserializeParam(
          data['isRight'],
          ParamType.bool,
          false,
        ),
        firstAttempt: deserializeParam(
          data['firstAttempt'],
          ParamType.bool,
          false,
        ),
        num1: deserializeParam(
          data['num1'],
          ParamType.int,
          false,
        ),
        num2: deserializeParam(
          data['num2'],
          ParamType.int,
          false,
        ),
        num3: deserializeParam(
          data['num3'],
          ParamType.int,
          false,
        ),
        num4: deserializeParam(
          data['num4'],
          ParamType.int,
          false,
        ),
        num5: deserializeParam(
          data['num5'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'ProblemStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ProblemStruct &&
        problemOptions == other.problemOptions &&
        problemLevel == other.problemLevel &&
        problemID == other.problemID &&
        problemCycle == other.problemCycle &&
        referenceID == other.referenceID &&
        isRight == other.isRight &&
        firstAttempt == other.firstAttempt &&
        num1 == other.num1 &&
        num2 == other.num2 &&
        num3 == other.num3 &&
        num4 == other.num4 &&
        num5 == other.num5;
  }

  @override
  int get hashCode => const ListEquality().hash([
        problemOptions,
        problemLevel,
        problemID,
        problemCycle,
        referenceID,
        isRight,
        firstAttempt,
        num1,
        num2,
        num3,
        num4,
        num5
      ]);
}

ProblemStruct createProblemStruct({
  int? problemOptions,
  int? problemLevel,
  double? problemID,
  int? problemCycle,
  String? referenceID,
  bool? isRight,
  bool? firstAttempt,
  int? num1,
  int? num2,
  int? num3,
  int? num4,
  int? num5,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ProblemStruct(
      problemOptions: problemOptions,
      problemLevel: problemLevel,
      problemID: problemID,
      problemCycle: problemCycle,
      referenceID: referenceID,
      isRight: isRight,
      firstAttempt: firstAttempt,
      num1: num1,
      num2: num2,
      num3: num3,
      num4: num4,
      num5: num5,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ProblemStruct? updateProblemStruct(
  ProblemStruct? problem, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    problem
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addProblemStructData(
  Map<String, dynamic> firestoreData,
  ProblemStruct? problem,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (problem == null) {
    return;
  }
  if (problem.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && problem.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final problemData = getProblemFirestoreData(problem, forFieldValue);
  final nestedData = problemData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = problem.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getProblemFirestoreData(
  ProblemStruct? problem, [
  bool forFieldValue = false,
]) {
  if (problem == null) {
    return {};
  }
  final firestoreData = mapToFirestore(problem.toMap());

  // Add any Firestore field values
  problem.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getProblemListFirestoreData(
  List<ProblemStruct>? problems,
) =>
    problems?.map((e) => getProblemFirestoreData(e, true)).toList() ?? [];
