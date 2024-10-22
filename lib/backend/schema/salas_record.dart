import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SalasRecord extends FirestoreRecord {
  SalasRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "nome_instituicao" field.
  String? _nomeInstituicao;
  String get nomeInstituicao => _nomeInstituicao ?? '';
  bool hasNomeInstituicao() => _nomeInstituicao != null;

  // "descricao_sala" field.
  String? _descricaoSala;
  String get descricaoSala => _descricaoSala ?? '';
  bool hasDescricaoSala() => _descricaoSala != null;

  // "nome_disciplina" field.
  String? _nomeDisciplina;
  String get nomeDisciplina => _nomeDisciplina ?? '';
  bool hasNomeDisciplina() => _nomeDisciplina != null;

  // "codigo_sala" field.
  String? _codigoSala;
  String get codigoSala => _codigoSala ?? '';
  bool hasCodigoSala() => _codigoSala != null;

  // "user_id" field.
  DocumentReference? _userId;
  DocumentReference? get userId => _userId;
  bool hasUserId() => _userId != null;

  // "nome_professor" field.
  String? _nomeProfessor;
  String get nomeProfessor => _nomeProfessor ?? '';
  bool hasNomeProfessor() => _nomeProfessor != null;

  void _initializeFields() {
    _nomeInstituicao = snapshotData['nome_instituicao'] as String?;
    _descricaoSala = snapshotData['descricao_sala'] as String?;
    _nomeDisciplina = snapshotData['nome_disciplina'] as String?;
    _codigoSala = snapshotData['codigo_sala'] as String?;
    _userId = snapshotData['user_id'] as DocumentReference?;
    _nomeProfessor = snapshotData['nome_professor'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('salas');

  static Stream<SalasRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => SalasRecord.fromSnapshot(s));

  static Future<SalasRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => SalasRecord.fromSnapshot(s));

  static SalasRecord fromSnapshot(DocumentSnapshot snapshot) => SalasRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static SalasRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      SalasRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'SalasRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is SalasRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createSalasRecordData({
  String? nomeInstituicao,
  String? descricaoSala,
  String? nomeDisciplina,
  String? codigoSala,
  DocumentReference? userId,
  String? nomeProfessor,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'nome_instituicao': nomeInstituicao,
      'descricao_sala': descricaoSala,
      'nome_disciplina': nomeDisciplina,
      'codigo_sala': codigoSala,
      'user_id': userId,
      'nome_professor': nomeProfessor,
    }.withoutNulls,
  );

  return firestoreData;
}

class SalasRecordDocumentEquality implements Equality<SalasRecord> {
  const SalasRecordDocumentEquality();

  @override
  bool equals(SalasRecord? e1, SalasRecord? e2) {
    return e1?.nomeInstituicao == e2?.nomeInstituicao &&
        e1?.descricaoSala == e2?.descricaoSala &&
        e1?.nomeDisciplina == e2?.nomeDisciplina &&
        e1?.codigoSala == e2?.codigoSala &&
        e1?.userId == e2?.userId &&
        e1?.nomeProfessor == e2?.nomeProfessor;
  }

  @override
  int hash(SalasRecord? e) => const ListEquality().hash([
        e?.nomeInstituicao,
        e?.descricaoSala,
        e?.nomeDisciplina,
        e?.codigoSala,
        e?.userId,
        e?.nomeProfessor
      ]);

  @override
  bool isValidKey(Object? o) => o is SalasRecord;
}
