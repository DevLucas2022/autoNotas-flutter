import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'detail_aluno_widget.dart' show DetailAlunoWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class DetailAlunoModel extends FlutterFlowModel<DetailAlunoWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for prova1 widget.
  FocusNode? prova1FocusNode;
  TextEditingController? prova1TextController;
  String? Function(BuildContext, String?)? prova1TextControllerValidator;
  // State field(s) for prova2 widget.
  FocusNode? prova2FocusNode;
  TextEditingController? prova2TextController;
  String? Function(BuildContext, String?)? prova2TextControllerValidator;
  // State field(s) for atividade widget.
  FocusNode? atividadeFocusNode;
  TextEditingController? atividadeTextController;
  String? Function(BuildContext, String?)? atividadeTextControllerValidator;
  // State field(s) for recuperacao widget.
  FocusNode? recuperacaoFocusNode;
  TextEditingController? recuperacaoTextController;
  String? Function(BuildContext, String?)? recuperacaoTextControllerValidator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController5;
  String? Function(BuildContext, String?)? textController5Validator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    prova1FocusNode?.dispose();
    prova1TextController?.dispose();

    prova2FocusNode?.dispose();
    prova2TextController?.dispose();

    atividadeFocusNode?.dispose();
    atividadeTextController?.dispose();

    recuperacaoFocusNode?.dispose();
    recuperacaoTextController?.dispose();

    textFieldFocusNode?.dispose();
    textController5?.dispose();
  }
}
