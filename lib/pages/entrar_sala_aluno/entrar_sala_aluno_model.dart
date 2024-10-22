import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'entrar_sala_aluno_widget.dart' show EntrarSalaAlunoWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class EntrarSalaAlunoModel extends FlutterFlowModel<EntrarSalaAlunoWidget> {
  ///  Local state fields for this page.

  String codigoState = '-';

  ///  State fields for stateful widgets in this page.

  // State field(s) for codigoSala widget.
  FocusNode? codigoSalaFocusNode;
  TextEditingController? codigoSalaTextController;
  String? Function(BuildContext, String?)? codigoSalaTextControllerValidator;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  SalasRecord? codeQuery;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    codigoSalaFocusNode?.dispose();
    codigoSalaTextController?.dispose();
  }
}
