import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UserdetailsRecord extends FirestoreRecord {
  UserdetailsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "nome" field.
  String? _nome;
  String get nome => _nome ?? '';
  bool hasNome() => _nome != null;

  // "password" field.
  String? _password;
  String get password => _password ?? '';
  bool hasPassword() => _password != null;

  // "role" field.
  String? _role;
  String get role => _role ?? '';
  bool hasRole() => _role != null;

  // "imaiges" field.
  List<String>? _imaiges;
  List<String> get imaiges => _imaiges ?? const [];
  bool hasImaiges() => _imaiges != null;

  void _initializeFields() {
    _email = snapshotData['email'] as String?;
    _displayName = snapshotData['display_name'] as String?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _uid = snapshotData['uid'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _nome = snapshotData['nome'] as String?;
    _password = snapshotData['password'] as String?;
    _role = snapshotData['role'] as String?;
    _imaiges = getDataList(snapshotData['imaiges']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('userdetails');

  static Stream<UserdetailsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UserdetailsRecord.fromSnapshot(s));

  static Future<UserdetailsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UserdetailsRecord.fromSnapshot(s));

  static UserdetailsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      UserdetailsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UserdetailsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UserdetailsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UserdetailsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UserdetailsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUserdetailsRecordData({
  String? email,
  String? displayName,
  String? photoUrl,
  String? uid,
  DateTime? createdTime,
  String? phoneNumber,
  String? nome,
  String? password,
  String? role,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'email': email,
      'display_name': displayName,
      'photo_url': photoUrl,
      'uid': uid,
      'created_time': createdTime,
      'phone_number': phoneNumber,
      'nome': nome,
      'password': password,
      'role': role,
    }.withoutNulls,
  );

  return firestoreData;
}

class UserdetailsRecordDocumentEquality implements Equality<UserdetailsRecord> {
  const UserdetailsRecordDocumentEquality();

  @override
  bool equals(UserdetailsRecord? e1, UserdetailsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.email == e2?.email &&
        e1?.displayName == e2?.displayName &&
        e1?.photoUrl == e2?.photoUrl &&
        e1?.uid == e2?.uid &&
        e1?.createdTime == e2?.createdTime &&
        e1?.phoneNumber == e2?.phoneNumber &&
        e1?.nome == e2?.nome &&
        e1?.password == e2?.password &&
        e1?.role == e2?.role &&
        listEquality.equals(e1?.imaiges, e2?.imaiges);
  }

  @override
  int hash(UserdetailsRecord? e) => const ListEquality().hash([
        e?.email,
        e?.displayName,
        e?.photoUrl,
        e?.uid,
        e?.createdTime,
        e?.phoneNumber,
        e?.nome,
        e?.password,
        e?.role,
        e?.imaiges
      ]);

  @override
  bool isValidKey(Object? o) => o is UserdetailsRecord;
}
