import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class GameSessionDataRecord extends FirestoreRecord {
  GameSessionDataRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "accuracy" field.
  double? _accuracy;
  double get accuracy => _accuracy ?? 0.0;
  bool hasAccuracy() => _accuracy != null;

  // "numCorrect" field.
  int? _numCorrect;
  int get numCorrect => _numCorrect ?? 0;
  bool hasNumCorrect() => _numCorrect != null;

  // "numQuestionsAnswered" field.
  int? _numQuestionsAnswered;
  int get numQuestionsAnswered => _numQuestionsAnswered ?? 0;
  bool hasNumQuestionsAnswered() => _numQuestionsAnswered != null;

  // "sessionResponseTime" field.
  double? _sessionResponseTime;
  double get sessionResponseTime => _sessionResponseTime ?? 0.0;
  bool hasSessionResponseTime() => _sessionResponseTime != null;

  // "startTime" field.
  DateTime? _startTime;
  DateTime? get startTime => _startTime;
  bool hasStartTime() => _startTime != null;

  void _initializeFields() {
    _accuracy = castToType<double>(snapshotData['accuracy']);
    _numCorrect = castToType<int>(snapshotData['numCorrect']);
    _numQuestionsAnswered =
        castToType<int>(snapshotData['numQuestionsAnswered']);
    _sessionResponseTime =
        castToType<double>(snapshotData['sessionResponseTime']);
    _startTime = snapshotData['startTime'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('gameSessionData');

  static Stream<GameSessionDataRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => GameSessionDataRecord.fromSnapshot(s));

  static Future<GameSessionDataRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => GameSessionDataRecord.fromSnapshot(s));

  static GameSessionDataRecord fromSnapshot(DocumentSnapshot snapshot) =>
      GameSessionDataRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static GameSessionDataRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      GameSessionDataRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'GameSessionDataRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is GameSessionDataRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createGameSessionDataRecordData({
  double? accuracy,
  int? numCorrect,
  int? numQuestionsAnswered,
  double? sessionResponseTime,
  DateTime? startTime,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'accuracy': accuracy,
      'numCorrect': numCorrect,
      'numQuestionsAnswered': numQuestionsAnswered,
      'sessionResponseTime': sessionResponseTime,
      'startTime': startTime,
    }.withoutNulls,
  );

  return firestoreData;
}

class GameSessionDataRecordDocumentEquality
    implements Equality<GameSessionDataRecord> {
  const GameSessionDataRecordDocumentEquality();

  @override
  bool equals(GameSessionDataRecord? e1, GameSessionDataRecord? e2) {
    return e1?.accuracy == e2?.accuracy &&
        e1?.numCorrect == e2?.numCorrect &&
        e1?.numQuestionsAnswered == e2?.numQuestionsAnswered &&
        e1?.sessionResponseTime == e2?.sessionResponseTime &&
        e1?.startTime == e2?.startTime;
  }

  @override
  int hash(GameSessionDataRecord? e) => const ListEquality().hash([
        e?.accuracy,
        e?.numCorrect,
        e?.numQuestionsAnswered,
        e?.sessionResponseTime,
        e?.startTime
      ]);

  @override
  bool isValidKey(Object? o) => o is GameSessionDataRecord;
}
