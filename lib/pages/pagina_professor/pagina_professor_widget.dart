import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'pagina_professor_model.dart';
export 'pagina_professor_model.dart';

class PaginaProfessorWidget extends StatefulWidget {
  const PaginaProfessorWidget({super.key});

  @override
  State<PaginaProfessorWidget> createState() => _PaginaProfessorWidgetState();
}

class _PaginaProfessorWidgetState extends State<PaginaProfessorWidget> {
  late PaginaProfessorModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PaginaProfessorModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'PaginaProfessor'});
    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            logFirebaseEvent('PAGINA_PROFESSOR_FloatingActionButton_qk');
            logFirebaseEvent('FloatingActionButton_navigate_to');

            context.pushNamed('criarSala_professor');
          },
          backgroundColor: FlutterFlowTheme.of(context).success,
          elevation: 8.0,
          child: Icon(
            Icons.add_rounded,
            color: FlutterFlowTheme.of(context).info,
            size: 24.0,
          ),
        ),
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                child: Container(
                  width: MediaQuery.sizeOf(context).width * 1.0,
                  height: 100.0,
                  decoration: BoxDecoration(),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.asset(
                          'assets/images/teacher-.png',
                          width: 103.0,
                          height: 525.0,
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                      Text(
                        ' PROFESSORES',
                        textAlign: TextAlign.start,
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Inter',
                              fontSize: 20.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 10.0),
                child: Container(
                  width: double.infinity,
                  height: 50.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                  ),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 0.0, 0.0),
                    child: Text(
                      'Disciplinas ministradas',
                      textAlign: TextAlign.center,
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'PT Sans',
                            fontSize: 20.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.w500,
                          ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(5.0),
                child: StreamBuilder<List<SalasRecord>>(
                  stream: querySalasRecord(
                    queryBuilder: (salasRecord) => salasRecord.where(
                      'user_id',
                      isEqualTo: currentUserReference,
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
                    List<SalasRecord> columnSalasRecordList = snapshot.data!;

                    return Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: List.generate(columnSalasRecordList.length,
                          (columnIndex) {
                        final columnSalasRecord =
                            columnSalasRecordList[columnIndex];
                        return InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            logFirebaseEvent(
                                'PAGINA_PROFESSOR_Card_zlf001gx_ON_TAP');
                            logFirebaseEvent('Card_navigate_to');

                            context.pushNamed(
                              'visualizarSalaProfessor',
                              queryParameters: {
                                'nomeInstituicao': serializeParam(
                                  columnSalasRecord.nomeInstituicao,
                                  ParamType.String,
                                ),
                                'nomeDisciplina': serializeParam(
                                  columnSalasRecord.nomeDisciplina,
                                  ParamType.String,
                                ),
                                'codigoSala': serializeParam(
                                  columnSalasRecord.codigoSala,
                                  ParamType.String,
                                ),
                                'categoriaDisciplina': serializeParam(
                                  columnSalasRecord.categoriaDisciplina,
                                  ParamType.String,
                                ),
                                'nivelSala': serializeParam(
                                  columnSalasRecord.nivelSala,
                                  ParamType.String,
                                ),
                              }.withoutNulls,
                            );
                          },
                          onLongPress: () async {
                            logFirebaseEvent(
                                'PAGINA_PROFESSOR_Card_zlf001gx_ON_LONG_P');
                            logFirebaseEvent('Card_alert_dialog');
                            var confirmDialogResponse = await showDialog<bool>(
                                  context: context,
                                  builder: (alertDialogContext) {
                                    return AlertDialog(
                                      title: Text('Excluir disciplina'),
                                      content: Text('Deseja Continuar?'),
                                      actions: [
                                        TextButton(
                                          onPressed: () => Navigator.pop(
                                              alertDialogContext, false),
                                          child: Text('Cancelar'),
                                        ),
                                        TextButton(
                                          onPressed: () => Navigator.pop(
                                              alertDialogContext, true),
                                          child: Text('Confirmar'),
                                        ),
                                      ],
                                    );
                                  },
                                ) ??
                                false;
                            logFirebaseEvent('Card_backend_call');
                            await columnSalasRecord.reference.delete();
                          },
                          child: Card(
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            color: FlutterFlowTheme.of(context).alternate,
                            elevation: 10.0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      10.0, 0.0, 0.0, 0.0),
                                  child: FlutterFlowIconButton(
                                    borderRadius: 8.0,
                                    buttonSize: 40.0,
                                    icon: Icon(
                                      Icons.class_outlined,
                                      color: FlutterFlowTheme.of(context).info,
                                      size: 24.0,
                                    ),
                                    onPressed: () {
                                      print('IconButton pressed ...');
                                    },
                                  ),
                                ),
                                Expanded(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            10.0, 10.0, 0.0, 10.0),
                                        child: Text(
                                          columnSalasRecord.nomeDisciplina,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Inter',
                                                fontSize: 16.0,
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            10.0, 0.0, 0.0, 10.0),
                                        child: Text(
                                          columnSalasRecord.nomeInstituicao,
                                          style: FlutterFlowTheme.of(context)
                                              .bodySmall
                                              .override(
                                                fontFamily: 'Inter',
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Icon(
                                  Icons.chevron_right,
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  size: 48.0,
                                ),
                              ],
                            ),
                          ),
                        );
                      }),
                    );
                  },
                ),
              ),
              Align(
                alignment: AlignmentDirectional(0.0, 0.0),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                  child: FFButtonWidget(
                    onPressed: () async {
                      logFirebaseEvent(
                          'PAGINA_PROFESSOR_SAIR_DO_APLICATIVO_BTN_');
                      logFirebaseEvent('Button_auth');
                      GoRouter.of(context).prepareAuthEvent();
                      await authManager.signOut();
                      GoRouter.of(context).clearRedirectLocation();

                      context.goNamedAuth('Onboarding', context.mounted);
                    },
                    text: 'Sair do aplicativo',
                    icon: Icon(
                      Icons.subdirectory_arrow_left_rounded,
                      size: 18.0,
                    ),
                    options: FFButtonOptions(
                      width: 300.0,
                      height: 52.0,
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      iconPadding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: FlutterFlowTheme.of(context).primary,
                      textStyle:
                          FlutterFlowTheme.of(context).titleSmall.override(
                                fontFamily: 'Inter Tight',
                                color: Colors.white,
                                letterSpacing: 0.0,
                              ),
                      elevation: 3.0,
                      borderSide: BorderSide(
                        color: Colors.transparent,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(40.0),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
