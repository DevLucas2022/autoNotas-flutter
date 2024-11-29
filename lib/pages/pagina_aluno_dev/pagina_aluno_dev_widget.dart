import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'pagina_aluno_dev_model.dart';
export 'pagina_aluno_dev_model.dart';

class PaginaAlunoDevWidget extends StatefulWidget {
  const PaginaAlunoDevWidget({
    super.key,
    String? codigoSala,
  }) : this.codigoSala = codigoSala ?? '-';

  final String codigoSala;

  @override
  State<PaginaAlunoDevWidget> createState() => _PaginaAlunoDevWidgetState();
}

class _PaginaAlunoDevWidgetState extends State<PaginaAlunoDevWidget> {
  late PaginaAlunoDevModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PaginaAlunoDevModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'PaginaAluno_dev'});
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
            logFirebaseEvent('PAGINA_ALUNO_DEV_FloatingActionButton_hn');
            logFirebaseEvent('FloatingActionButton_navigate_to');

            context.pushNamed('entrarSalaAluno');
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
                          'assets/images/student.png',
                          width: 75.0,
                          height: 502.0,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Text(
                        ' ALUNOS',
                        textAlign: TextAlign.center,
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Inter Tight',
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
                      'Disciplinas',
                      textAlign: TextAlign.center,
                      style: FlutterFlowTheme.of(context).bodyLarge.override(
                            fontFamily: 'PT Sans',
                            fontSize: 18.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.w500,
                          ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(5.0),
                child: StreamBuilder<List<SalasAlunosProfessoresRecord>>(
                  stream: querySalasAlunosProfessoresRecord(
                    queryBuilder: (salasAlunosProfessoresRecord) =>
                        salasAlunosProfessoresRecord.where(
                      'user_id',
                      isEqualTo: valueOrDefault<String>(
                        currentUserReference?.id,
                        '-',
                      ),
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
                    List<SalasAlunosProfessoresRecord>
                        columnSalasAlunosProfessoresRecordList = snapshot.data!;

                    return Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: List.generate(
                          columnSalasAlunosProfessoresRecordList.length,
                          (columnIndex) {
                        final columnSalasAlunosProfessoresRecord =
                            columnSalasAlunosProfessoresRecordList[columnIndex];
                        return InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            logFirebaseEvent(
                                'PAGINA_ALUNO_DEV_Card_a64brqzn_ON_TAP');
                            logFirebaseEvent('Card_navigate_to');

                            context.pushNamed(
                              'visualizarSalaAluno',
                              queryParameters: {
                                'nomeInstituicao': serializeParam(
                                  columnSalasAlunosProfessoresRecord
                                      .nomeInstituicao,
                                  ParamType.String,
                                ),
                                'nomeDisciplina': serializeParam(
                                  columnSalasAlunosProfessoresRecord
                                      .nomeDisciplina,
                                  ParamType.String,
                                ),
                                'codigoSala': serializeParam(
                                  columnSalasAlunosProfessoresRecord.codigoSala,
                                  ParamType.String,
                                ),
                                'nota1': serializeParam(
                                  columnSalasAlunosProfessoresRecord.prova1,
                                  ParamType.double,
                                ),
                                'nota2': serializeParam(
                                  columnSalasAlunosProfessoresRecord.prova2,
                                  ParamType.double,
                                ),
                                'nota3': serializeParam(
                                  columnSalasAlunosProfessoresRecord
                                      .recuperacao,
                                  ParamType.double,
                                ),
                                'notaAtividade': serializeParam(
                                  columnSalasAlunosProfessoresRecord.atividade,
                                  ParamType.double,
                                ),
                              }.withoutNulls,
                            );
                          },
                          onLongPress: () async {
                            logFirebaseEvent(
                                'PAGINA_ALUNO_DEV_Card_a64brqzn_ON_LONG_P');
                            logFirebaseEvent('Card_alert_dialog');
                            var confirmDialogResponse = await showDialog<bool>(
                                  context: context,
                                  builder: (alertDialogContext) {
                                    return AlertDialog(
                                      title: Text('Excluir sala'),
                                      content: Text('Deseja continuar?'),
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
                            await columnSalasAlunosProfessoresRecord.reference
                                .delete();
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
                                    icon: FaIcon(
                                      FontAwesomeIcons.book,
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
                                          columnSalasAlunosProfessoresRecord
                                              .nomeDisciplina,
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
                                          columnSalasAlunosProfessoresRecord
                                              .nomeInstituicao,
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
                          'PAGINA_ALUNO_DEV_SAIR_DO_APLICATIVO_BTN_');
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
