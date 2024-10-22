import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SalasAlunosProfessoresRecord extends FirestoreRecord {
  SalasAlunosProfessoresRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "codigo_sala" field.
  String? _codigoSala;
  String get codigoSala => _codigoSala ?? '';
  bool hasCodigoSala() => _codigoSala != null;

  // "nome_disciplina" field.
  String? _nomeDisciplina;
  String get nomeDisciplina => _nomeDisciplina ?? '';
  bool hasNomeDisciplina() => _nomeDisciplina != null;

  // "nome_instituicao" field.
  String? _nomeInstituicao;
  String get nomeInstituicao => _nomeInstituicao ?? '';
  bool hasNomeInstituicao() => _nomeInstituicao != null;

  // "email_aluno" field.
  String? _emailAluno;
  String get emailAluno => _emailAluno ?? '';
  bool hasEmailAluno() => _emailAluno != null;

  // "nome_aluno" field.
  String? _nomeAluno;
  String get nomeAluno => _nomeAluno ?? '';
  bool hasNomeAluno() => _nomeAluno != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "nome_professor" field.
  String? _nomeProfessor;
  String get nomeProfessor => _nomeProfessor ?? '';
  bool hasNomeProfessor() => _nomeProfessor != null;

  // "user_id" field.
  String? _userId;
  String get userId => _userId ?? '';
  bool hasUserId() => _userId != null;

  void _initializeFields() {
    _codigoSala = snapshotData['codigo_sala'] as String?;
    _nomeDisciplina = snapshotData['nome_disciplina'] as String?;
    _nomeInstituicao = snapshotData['nome_instituicao'] as String?;
    _emailAluno = snapshotData['email_aluno'] as String?;
    _nomeAluno = snapshotData['nome_aluno'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _nomeProfessor = snapshotData['nome_professor'] as String?;
    _userId = snapshotData['user_id'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('salasAlunosProfessores');

  static Stream<SalasAlunosProfessoresRecord> getDocument(
          DocumentReference ref) =>
      ref.snapshots().map((s) => SalasAlunosProfessoresRecord.fromSnapshot(s));

  static Future<SalasAlunosProfessoresRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => SalasAlunosProfessoresRecord.fromSnapshot(s));

  static SalasAlunosProfessoresRecord fromSnapshot(DocumentSnapshot snapshot) =>
      SalasAlunosProfessoresRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static SalasAlunosProfessoresRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      SalasAlunosProfessoresRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'SalasAlunosProfessoresRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is SalasAlunosProfessoresRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createSalasAlunosProfessoresRecordData({
  String? codigoSala,
  String? nomeDisciplina,
  String? nomeInstituicao,
  String? emailAluno,
  String? nomeAluno,
  DateTime? createdTime,
  String? nomeProfessor,
  String? userId,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'codigo_sala': codigoSala,
      'nome_disciplina': nomeDisciplina,
      'nome_instituicao': nomeInstituicao,
      'email_aluno': emailAluno,
      'nome_aluno': nomeAluno,
      'created_time': createdTime,
      'nome_professor': nomeProfessor,
      'user_id': userId,
    }.withoutNulls,
  );

  return firestoreData;
}

class SalasAlunosProfessoresRecordDocumentEquality
    implements Equality<SalasAlunosProfessoresRecord> {
  const SalasAlunosProfessoresRecordDocumentEquality();

  @override
  bool equals(
      SalasAlunosProfessoresRecord? e1, SalasAlunosProfessoresRecord? e2) {
    return e1?.codigoSala == e2?.codigoSala &&
        e1?.nomeDisciplina == e2?.nomeDisciplina &&
        e1?.nomeInstituicao == e2?.nomeInstituicao &&
        e1?.emailAluno == e2?.emailAluno &&
        e1?.nomeAluno == e2?.nomeAluno &&
        e1?.createdTime == e2?.createdTime &&
        e1?.nomeProfessor == e2?.nomeProfessor &&
        e1?.userId == e2?.userId;
  }

  @override
  int hash(SalasAlunosProfessoresRecord? e) => const ListEquality().hash([
        e?.codigoSala,
        e?.nomeDisciplina,
        e?.nomeInstituicao,
        e?.emailAluno,
        e?.nomeAluno,
        e?.createdTime,
        e?.nomeProfessor,
        e?.userId
      ]);

  @override
  bool isValidKey(Object? o) => o is SalasAlunosProfessoresRecord;
}
