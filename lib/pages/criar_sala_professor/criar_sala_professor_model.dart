import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'criar_sala_professor_widget.dart' show CriarSalaProfessorWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CriarSalaProfessorModel
    extends FlutterFlowModel<CriarSalaProfessorWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField_instituicao widget.
  FocusNode? textFieldInstituicaoFocusNode;
  TextEditingController? textFieldInstituicaoTextController;
  String? Function(BuildContext, String?)?
      textFieldInstituicaoTextControllerValidator;
  // State field(s) for TextField_disciplina widget.
  FocusNode? textFieldDisciplinaFocusNode;
  TextEditingController? textFieldDisciplinaTextController;
  String? Function(BuildContext, String?)?
      textFieldDisciplinaTextControllerValidator;
  // State field(s) for nivel_sala widget.
  String? nivelSalaValue;
  FormFieldController<String>? nivelSalaValueController;
  // State field(s) for categoria_disciplina widget.
  String? categoriaDisciplinaValue;
  FormFieldController<String>? categoriaDisciplinaValueController;
  // State field(s) for TextField_descricao widget.
  FocusNode? textFieldDescricaoFocusNode;
  TextEditingController? textFieldDescricaoTextController;
  String? Function(BuildContext, String?)?
      textFieldDescricaoTextControllerValidator;
  // State field(s) for random_code widget.
  FocusNode? randomCodeFocusNode;
  TextEditingController? randomCodeTextController;
  String? Function(BuildContext, String?)? randomCodeTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldInstituicaoFocusNode?.dispose();
    textFieldInstituicaoTextController?.dispose();

    textFieldDisciplinaFocusNode?.dispose();
    textFieldDisciplinaTextController?.dispose();

    textFieldDescricaoFocusNode?.dispose();
    textFieldDescricaoTextController?.dispose();

    randomCodeFocusNode?.dispose();
    randomCodeTextController?.dispose();
  }
}
