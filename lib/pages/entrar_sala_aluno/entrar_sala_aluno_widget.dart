import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'entrar_sala_aluno_model.dart';
export 'entrar_sala_aluno_model.dart';

class EntrarSalaAlunoWidget extends StatefulWidget {
  const EntrarSalaAlunoWidget({super.key});

  @override
  State<EntrarSalaAlunoWidget> createState() => _EntrarSalaAlunoWidgetState();
}

class _EntrarSalaAlunoWidgetState extends State<EntrarSalaAlunoWidget> {
  late EntrarSalaAlunoModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EntrarSalaAlunoModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'entrarSalaAluno'});
    _model.codigoSalaTextController ??= TextEditingController();
    _model.codigoSalaFocusNode ??= FocusNode();
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<SalasRecord>>(
      stream: querySalasRecord(
        queryBuilder: (salasRecord) => salasRecord.where(
          'codigo_sala',
          isEqualTo: _model.codigoSalaTextController.text,
        ),
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
            body: Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    FlutterFlowTheme.of(context).primary,
                  ),
                ),
              ),
            ),
          );
        }
        List<SalasRecord> entrarSalaAlunoSalasRecordList = snapshot.data!;

        return GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
            appBar: AppBar(
              backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
              automaticallyImplyLeading: false,
              leading: FlutterFlowIconButton(
                borderColor: Colors.transparent,
                borderRadius: 30.0,
                borderWidth: 1.0,
                buttonSize: 60.0,
                icon: Icon(
                  Icons.arrow_back_rounded,
                  color: FlutterFlowTheme.of(context).primaryText,
                  size: 30.0,
                ),
                onPressed: () async {
                  logFirebaseEvent('ENTRAR_SALA_ALUNO_arrow_back_rounded_ICN');
                  logFirebaseEvent('IconButton_navigate_back');
                  context.pop();
                },
              ),
              title: Text(
                'Entrar na sala',
                style: FlutterFlowTheme.of(context).titleLarge.override(
                      fontFamily: 'Inter Tight',
                      letterSpacing: 0.0,
                    ),
              ),
              actions: [],
              centerTitle: false,
              elevation: 0.0,
            ),
            body: SafeArea(
              top: true,
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16.0, 12.0, 16.0, 0.0),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                        child: Text(
                          'Insira o código da sala',
                          style: FlutterFlowTheme.of(context)
                              .headlineMedium
                              .override(
                                fontFamily: 'Inter Tight',
                                letterSpacing: 0.0,
                              ),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            TextFormField(
                              controller: _model.codigoSalaTextController,
                              focusNode: _model.codigoSalaFocusNode,
                              onChanged: (_) => EasyDebounce.debounce(
                                '_model.codigoSalaTextController',
                                Duration(milliseconds: 2000),
                                () async {
                                  logFirebaseEvent(
                                      'ENTRAR_SALA_ALUNO_codigoSala_ON_TEXTFIEL');
                                  logFirebaseEvent(
                                      'codigoSala_update_page_state');
                                  _model.codigoState =
                                      _model.codigoSalaTextController.text;
                                },
                              ),
                              autofocus: true,
                              obscureText: false,
                              decoration: InputDecoration(
                                labelText: 'Código',
                                labelStyle: FlutterFlowTheme.of(context)
                                    .labelMedium
                                    .override(
                                      fontFamily: 'Inter',
                                      letterSpacing: 0.0,
                                    ),
                                hintStyle: FlutterFlowTheme.of(context)
                                    .labelMedium
                                    .override(
                                      fontFamily: 'Inter',
                                      letterSpacing: 0.0,
                                    ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color:
                                        FlutterFlowTheme.of(context).alternate,
                                    width: 2.0,
                                  ),
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).primary,
                                    width: 2.0,
                                  ),
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).error,
                                    width: 2.0,
                                  ),
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).error,
                                    width: 2.0,
                                  ),
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                                contentPadding: EdgeInsetsDirectional.fromSTEB(
                                    16.0, 12.0, 16.0, 12.0),
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Inter',
                                    letterSpacing: 0.0,
                                  ),
                              cursorColor: FlutterFlowTheme.of(context).primary,
                              validator: _model
                                  .codigoSalaTextControllerValidator
                                  .asValidator(context),
                            ),
                          ].divide(SizedBox(height: 12.0)),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            0.0, 24.0, 0.0, 12.0),
                        child: StreamBuilder<List<SalasRecord>>(
                          stream: querySalasRecord(
                            queryBuilder: (salasRecord) => salasRecord.where(
                              'codigo_sala',
                              isEqualTo: _model.codigoState,
                            ),
                          ),
                          builder: (context, snapshot) {
                            // Customize what your widget looks like when it's loading.
                            if (!snapshot.hasData) {
                              return Center(
                                child: SizedBox(
                                  width: 50.0,
                                  height: 50.0,
                                  child: CircularProgressIndicator(
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                      FlutterFlowTheme.of(context).primary,
                                    ),
                                  ),
                                ),
                              );
                            }
                            List<SalasRecord> buttonSalasRecordList =
                                snapshot.data!;

                            return FFButtonWidget(
                              onPressed: () async {
                                logFirebaseEvent(
                                    'ENTRAR_SALA_ALUNO_ENTRAR_NA_SALA_BTN_ON_');
                                logFirebaseEvent('Button_firestore_query');
                                _model.codeQuery = await querySalasRecordOnce(
                                  queryBuilder: (salasRecord) =>
                                      salasRecord.where(
                                    'codigo_sala',
                                    isEqualTo: valueOrDefault<String>(
                                      _model.codigoSalaTextController.text,
                                      '-',
                                    ),
                                  ),
                                  singleRecord: true,
                                ).then((s) => s.firstOrNull);
                                if (_model.codigoSalaTextController.text ==
                                    _model.codeQuery?.codigoSala) {
                                  logFirebaseEvent('Button_backend_call');

                                  await SalasAlunosProfessoresRecord.collection
                                      .doc()
                                      .set({
                                    ...createSalasAlunosProfessoresRecordData(
                                      codigoSala: _model.codeQuery?.codigoSala,
                                      nomeDisciplina:
                                          _model.codeQuery?.nomeDisciplina,
                                      nomeInstituicao:
                                          _model.codeQuery?.nomeInstituicao,
                                      emailAluno: currentUserEmail,
                                      nomeAluno: valueOrDefault(
                                          currentUserDocument?.nome, ''),
                                      nomeProfessor:
                                          _model.codeQuery?.nomeProfessor,
                                      userId: currentUserUid,
                                    ),
                                    ...mapToFirestore(
                                      {
                                        'created_time':
                                            FieldValue.serverTimestamp(),
                                      },
                                    ),
                                  });
                                  logFirebaseEvent('Button_show_snack_bar');
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        'Código de sala inserido corretamente',
                                        style: TextStyle(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                        ),
                                      ),
                                      duration: Duration(milliseconds: 4000),
                                      backgroundColor:
                                          FlutterFlowTheme.of(context)
                                              .secondary,
                                    ),
                                  );
                                } else {
                                  logFirebaseEvent('Button_show_snack_bar');
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        'Código errado! Insira um código válido.',
                                        style: TextStyle(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                        ),
                                      ),
                                      duration: Duration(milliseconds: 4000),
                                      backgroundColor:
                                          FlutterFlowTheme.of(context).error,
                                    ),
                                  );
                                }

                                safeSetState(() {});
                              },
                              text: 'Entrar na sala',
                              icon: Icon(
                                Icons.receipt_long,
                                size: 15.0,
                              ),
                              options: FFButtonOptions(
                                width: double.infinity,
                                height: 48.0,
                                padding: EdgeInsets.all(0.0),
                                iconPadding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: FlutterFlowTheme.of(context).primary,
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      fontFamily: 'Inter Tight',
                                      color: Colors.white,
                                      letterSpacing: 0.0,
                                    ),
                                elevation: 4.0,
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(60.0),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
