import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CategoriasNotasRecord extends FirestoreRecord {
  CategoriasNotasRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "notas" field.
  double? _notas;
  double get notas => _notas ?? 0.0;
  bool hasNotas() => _notas != null;

  // "nivel_sala" field.
  String? _nivelSala;
  String get nivelSala => _nivelSala ?? '';
  bool hasNivelSala() => _nivelSala != null;

  // "categoria_disciplina" field.
  String? _categoriaDisciplina;
  String get categoriaDisciplina => _categoriaDisciplina ?? '';
  bool hasCategoriaDisciplina() => _categoriaDisciplina != null;

  void _initializeFields() {
    _notas = castToType<double>(snapshotData['notas']);
    _nivelSala = snapshotData['nivel_sala'] as String?;
    _categoriaDisciplina = snapshotData['categoria_disciplina'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('categorias_notas');

  static Stream<CategoriasNotasRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CategoriasNotasRecord.fromSnapshot(s));

  static Future<CategoriasNotasRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CategoriasNotasRecord.fromSnapshot(s));

  static CategoriasNotasRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CategoriasNotasRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CategoriasNotasRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CategoriasNotasRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CategoriasNotasRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CategoriasNotasRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCategoriasNotasRecordData({
  double? notas,
  String? nivelSala,
  String? categoriaDisciplina,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'notas': notas,
      'nivel_sala': nivelSala,
      'categoria_disciplina': categoriaDisciplina,
    }.withoutNulls,
  );

  return firestoreData;
}

class CategoriasNotasRecordDocumentEquality
    implements Equality<CategoriasNotasRecord> {
  const CategoriasNotasRecordDocumentEquality();

  @override
  bool equals(CategoriasNotasRecord? e1, CategoriasNotasRecord? e2) {
    return e1?.notas == e2?.notas &&
        e1?.nivelSala == e2?.nivelSala &&
        e1?.categoriaDisciplina == e2?.categoriaDisciplina;
  }

  @override
  int hash(CategoriasNotasRecord? e) => const ListEquality()
      .hash([e?.notas, e?.nivelSala, e?.categoriaDisciplina]);

  @override
  bool isValidKey(Object? o) => o is CategoriasNotasRecord;
}
