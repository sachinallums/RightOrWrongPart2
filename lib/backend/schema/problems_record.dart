import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ProblemsRecord extends FirestoreRecord {
  ProblemsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "isRight" field.
  bool? _isRight;
  bool get isRight => _isRight ?? false;
  bool hasIsRight() => _isRight != null;

  // "problemLevel" field.
  int? _problemLevel;
  int get problemLevel => _problemLevel ?? 0;
  bool hasProblemLevel() => _problemLevel != null;

  // "problemOptions" field.
  int? _problemOptions;
  int get problemOptions => _problemOptions ?? 0;
  bool hasProblemOptions() => _problemOptions != null;

  // "num1" field.
  int? _num1;
  int get num1 => _num1 ?? 0;
  bool hasNum1() => _num1 != null;

  // "num2" field.
  int? _num2;
  int get num2 => _num2 ?? 0;
  bool hasNum2() => _num2 != null;

  // "num3" field.
  int? _num3;
  int get num3 => _num3 ?? 0;
  bool hasNum3() => _num3 != null;

  // "num4" field.
  int? _num4;
  int get num4 => _num4 ?? 0;
  bool hasNum4() => _num4 != null;

  // "num5" field.
  int? _num5;
  int get num5 => _num5 ?? 0;
  bool hasNum5() => _num5 != null;

  // "problemID" field.
  double? _problemID;
  double get problemID => _problemID ?? 0.0;
  bool hasProblemID() => _problemID != null;

  // "referenceID" field.
  String? _referenceID;
  String get referenceID => _referenceID ?? '';
  bool hasReferenceID() => _referenceID != null;

  // "problemCycle" field.
  int? _problemCycle;
  int get problemCycle => _problemCycle ?? 0;
  bool hasProblemCycle() => _problemCycle != null;

  void _initializeFields() {
    _isRight = snapshotData['isRight'] as bool?;
    _problemLevel = castToType<int>(snapshotData['problemLevel']);
    _problemOptions = castToType<int>(snapshotData['problemOptions']);
    _num1 = castToType<int>(snapshotData['num1']);
    _num2 = castToType<int>(snapshotData['num2']);
    _num3 = castToType<int>(snapshotData['num3']);
    _num4 = castToType<int>(snapshotData['num4']);
    _num5 = castToType<int>(snapshotData['num5']);
    _problemID = castToType<double>(snapshotData['problemID']);
    _referenceID = snapshotData['referenceID'] as String?;
    _problemCycle = castToType<int>(snapshotData['problemCycle']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('problems');

  static Stream<ProblemsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ProblemsRecord.fromSnapshot(s));

  static Future<ProblemsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ProblemsRecord.fromSnapshot(s));

  static ProblemsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ProblemsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ProblemsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ProblemsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ProblemsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ProblemsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createProblemsRecordData({
  bool? isRight,
  int? problemLevel,
  int? problemOptions,
  int? num1,
  int? num2,
  int? num3,
  int? num4,
  int? num5,
  double? problemID,
  String? referenceID,
  int? problemCycle,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'isRight': isRight,
      'problemLevel': problemLevel,
      'problemOptions': problemOptions,
      'num1': num1,
      'num2': num2,
      'num3': num3,
      'num4': num4,
      'num5': num5,
      'problemID': problemID,
      'referenceID': referenceID,
      'problemCycle': problemCycle,
    }.withoutNulls,
  );

  return firestoreData;
}

class ProblemsRecordDocumentEquality implements Equality<ProblemsRecord> {
  const ProblemsRecordDocumentEquality();

  @override
  bool equals(ProblemsRecord? e1, ProblemsRecord? e2) {
    return e1?.isRight == e2?.isRight &&
        e1?.problemLevel == e2?.problemLevel &&
        e1?.problemOptions == e2?.problemOptions &&
        e1?.num1 == e2?.num1 &&
        e1?.num2 == e2?.num2 &&
        e1?.num3 == e2?.num3 &&
        e1?.num4 == e2?.num4 &&
        e1?.num5 == e2?.num5 &&
        e1?.problemID == e2?.problemID &&
        e1?.referenceID == e2?.referenceID &&
        e1?.problemCycle == e2?.problemCycle;
  }

  @override
  int hash(ProblemsRecord? e) => const ListEquality().hash([
        e?.isRight,
        e?.problemLevel,
        e?.problemOptions,
        e?.num1,
        e?.num2,
        e?.num3,
        e?.num4,
        e?.num5,
        e?.problemID,
        e?.referenceID,
        e?.problemCycle
      ]);

  @override
  bool isValidKey(Object? o) => o is ProblemsRecord;
}
