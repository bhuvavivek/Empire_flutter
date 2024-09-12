import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'p_d_f_list_component_model.dart';
export 'p_d_f_list_component_model.dart';

class PDFListComponentWidget extends StatefulWidget {
  const PDFListComponentWidget({
    super.key,
    required this.propertyName,
    required this.propertyId,
  });

  final String? propertyName;
  final String? propertyId;

  @override
  State<PDFListComponentWidget> createState() => _PDFListComponentWidgetState();
}

class _PDFListComponentWidgetState extends State<PDFListComponentWidget> {
  late PDFListComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PDFListComponentModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Align(
      alignment: const AlignmentDirectional(0.0, 0.0),
      child: Material(
        color: Colors.transparent,
        elevation: 5.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Container(
          width: MediaQuery.sizeOf(context).width * 0.9,
          constraints: const BoxConstraints(
            maxHeight: 500.0,
          ),
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondaryBackground,
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: FutureBuilder<ApiCallResponse>(
            future: EmpireGroup.getPropertyPDFByPropertyIdCall.call(
              token: FFAppState().loginToken,
              propId: widget.propertyId,
            ),
            builder: (context, snapshot) {
              // Customize what your widget looks like when it's loading.
              if (!snapshot.hasData) {
                return Center(
                  child: SizedBox(
                    width: 50.0,
                    height: 50.0,
                    child: SpinKitRipple(
                      color: FlutterFlowTheme.of(context).primary,
                      size: 50.0,
                    ),
                  ),
                );
              }
              final conditionalBuilderGetPropertyPDFByPropertyIdResponse =
                  snapshot.data!;

              return Builder(
                builder: (context) {
                  if (EmpireGroup.getPropertyPDFByPropertyIdCall.pdfIdList(
                            conditionalBuilderGetPropertyPDFByPropertyIdResponse
                                .jsonBody,
                          ) !=
                          null &&
                      (EmpireGroup.getPropertyPDFByPropertyIdCall.pdfIdList(
                        conditionalBuilderGetPropertyPDFByPropertyIdResponse
                            .jsonBody,
                      ))!
                          .isNotEmpty) {
                    return Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: SingleChildScrollView(
                        primary: false,
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Align(
                              alignment: const AlignmentDirectional(-1.0, 0.0),
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 20.0),
                                child: Text(
                                  valueOrDefault<String>(
                                    widget.propertyName,
                                    'Property Name',
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .headlineSmall
                                      .override(
                                        fontFamily: 'Roboto',
                                        letterSpacing: 0.0,
                                      ),
                                ),
                              ),
                            ),
                            Builder(
                              builder: (context) {
                                final pdfList =
                                    EmpireGroup.getPropertyPDFByPropertyIdCall
                                            .pdfIdList(
                                              conditionalBuilderGetPropertyPDFByPropertyIdResponse
                                                  .jsonBody,
                                            )
                                            ?.toList() ??
                                        [];

                                return ListView.separated(
                                  padding: EdgeInsets.zero,
                                  primary: false,
                                  shrinkWrap: true,
                                  scrollDirection: Axis.vertical,
                                  itemCount: pdfList.length,
                                  separatorBuilder: (_, __) =>
                                      const SizedBox(height: 5.0),
                                  itemBuilder: (context, pdfListIndex) {
                                    final pdfListItem = pdfList[pdfListIndex];
                                    return Container(
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        border: Border.all(
                                          color: FlutterFlowTheme.of(context)
                                              .alternate,
                                          width: 2.0,
                                        ),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            16.0, 12.0, 8.0, 12.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Expanded(
                                              child: Text(
                                                valueOrDefault<String>(
                                                  EmpireGroup
                                                      .getPropertyPDFByPropertyIdCall
                                                      .pdfNameList(
                                                    conditionalBuilderGetPropertyPDFByPropertyIdResponse
                                                        .jsonBody,
                                                  )?[pdfListIndex],
                                                  'PDF Name',
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyLarge
                                                        .override(
                                                          fontFamily: 'Roboto',
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                            ),
                                            InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                await launchURL(functions
                                                    .pdfurlmodify(EmpireGroup
                                                        .getPropertyPDFByPropertyIdCall
                                                        .pdfUrlList(
                                                  conditionalBuilderGetPropertyPDFByPropertyIdResponse
                                                      .jsonBody,
                                                )![pdfListIndex]));
                                              },
                                              child: FaIcon(
                                                FontAwesomeIcons.fileDownload,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                size: 24.0,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    );
                  } else {
                    return Align(
                      alignment: const AlignmentDirectional(0.0, 0.0),
                      child: Text(
                        'No PDF Found',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Roboto',
                              color: FlutterFlowTheme.of(context).secondaryText,
                              fontSize: 20.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    );
                  }
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
