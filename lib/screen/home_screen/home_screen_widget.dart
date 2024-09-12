import '/backend/api_requests/api_calls.dart';
import '/components/image_slider_component/image_slider_component_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'dart:async';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'home_screen_model.dart';
export 'home_screen_model.dart';

class HomeScreenWidget extends StatefulWidget {
  const HomeScreenWidget({super.key});

  @override
  State<HomeScreenWidget> createState() => _HomeScreenWidgetState();
}

class _HomeScreenWidgetState extends State<HomeScreenWidget> {
  late HomeScreenModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomeScreenModel());

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        drawer: Drawer(
          elevation: 16.0,
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(15.0, 15.0, 15.0, 15.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 20.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Align(
                        alignment: const AlignmentDirectional(-1.0, 0.0),
                        child: Text(
                          'Filter',
                          style: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                fontFamily: 'Roboto',
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                fontSize: 20.0,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.w600,
                              ),
                        ),
                      ),
                      Align(
                        alignment: const AlignmentDirectional(-1.0, 0.0),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            _model.proprtyTypeList = [];
                            _model.bhkList = [];
                            _model.areaList = [];
                            safeSetState(() {
                              _model.typeValueController?.reset();
                              _model.bhkValueController?.reset();
                              _model.possesionValueController?.reset();
                            });
                          },
                          child: Text(
                            'Clear',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Roboto',
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  fontSize: 16.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w600,
                                ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
                  child: FlutterFlowDropDown<String>(
                    multiSelectController: _model.typeValueController ??=
                        FormListFieldController<String>(
                            _model.typeValue ??= List<String>.from(
                      _model.proprtyTypeList ?? [],
                    )),
                    options: const [
                      'All',
                      'Residential',
                      'Residential Apartment',
                      'Residential Villa',
                      'Residential Plot',
                      'Commercial Showroom',
                      'Commercial Office',
                      'Industrial Plot'
                    ],
                    width: 300.0,
                    height: 56.0,
                    maxHeight: 300.0,
                    searchHintTextStyle:
                        FlutterFlowTheme.of(context).labelMedium.override(
                              fontFamily: 'Roboto',
                              letterSpacing: 0.0,
                            ),
                    searchTextStyle:
                        FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Roboto',
                              letterSpacing: 0.0,
                            ),
                    textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Roboto',
                          letterSpacing: 0.0,
                        ),
                    hintText: 'Select Property Type',
                    searchHintText: 'Search for an property...',
                    icon: Icon(
                      Icons.keyboard_arrow_down_rounded,
                      color: FlutterFlowTheme.of(context).secondaryText,
                      size: 24.0,
                    ),
                    fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                    elevation: 2.0,
                    borderColor: FlutterFlowTheme.of(context).alternate,
                    borderWidth: 2.0,
                    borderRadius: 8.0,
                    margin:
                        const EdgeInsetsDirectional.fromSTEB(16.0, 4.0, 16.0, 4.0),
                    hidesUnderline: true,
                    isOverButton: true,
                    isSearchable: true,
                    isMultiSelect: true,
                    onMultiSelectChanged: (val) async {
                      safeSetState(() => _model.typeValue = val);
                      _model.proprtyTypeList =
                          _model.typeValue!.toList().cast<String>();
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
                  child: FlutterFlowDropDown<String>(
                    multiSelectController: _model.bhkValueController ??=
                        FormListFieldController<String>(
                            _model.bhkValue ??= List<String>.from(
                      _model.bhkList ?? [],
                    )),
                    options: const [
                      'All',
                      '1 RK',
                      '1 BHK',
                      '1.5 BHK',
                      '2 BHK',
                      '2.5 BHK',
                      '3 BHK',
                      '3.5 BHK',
                      '4.0 BHK',
                      '4.5 BHK',
                      '5 BHK',
                      '5.5 BHK',
                      '6 BHK',
                      '6.5 BHK',
                      '7 BHK',
                      '7.5 BHK',
                      '8 BHK',
                      '8.5 BHK',
                      '9 BHK',
                      '9.5 BHK',
                      '10 BHK'
                    ],
                    width: 300.0,
                    height: 56.0,
                    maxHeight: 300.0,
                    searchHintTextStyle:
                        FlutterFlowTheme.of(context).labelMedium.override(
                              fontFamily: 'Roboto',
                              letterSpacing: 0.0,
                            ),
                    searchTextStyle:
                        FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Roboto',
                              letterSpacing: 0.0,
                            ),
                    textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Roboto',
                          letterSpacing: 0.0,
                        ),
                    hintText: 'Select BHK',
                    searchHintText: 'Search for an BHK...',
                    icon: Icon(
                      Icons.keyboard_arrow_down_rounded,
                      color: FlutterFlowTheme.of(context).secondaryText,
                      size: 24.0,
                    ),
                    fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                    elevation: 2.0,
                    borderColor: FlutterFlowTheme.of(context).alternate,
                    borderWidth: 2.0,
                    borderRadius: 8.0,
                    margin:
                        const EdgeInsetsDirectional.fromSTEB(16.0, 4.0, 16.0, 4.0),
                    hidesUnderline: true,
                    isOverButton: true,
                    isSearchable: true,
                    isMultiSelect: true,
                    onMultiSelectChanged: (val) async {
                      safeSetState(() => _model.bhkValue = val);
                      _model.bhkList = _model.bhkValue!.toList().cast<String>();
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
                  child: FlutterFlowDropDown<String>(
                    multiSelectController: _model.possesionValueController ??=
                        FormListFieldController<String>(
                            _model.possesionValue ??= List<String>.from(
                      _model.possesionList ?? [],
                    )),
                    options: const [
                      'All',
                      'Immediately',
                      'Ready To Move',
                      'Under Construction'
                    ],
                    width: 300.0,
                    height: 56.0,
                    maxHeight: 300.0,
                    searchHintTextStyle:
                        FlutterFlowTheme.of(context).labelMedium.override(
                              fontFamily: 'Roboto',
                              letterSpacing: 0.0,
                            ),
                    searchTextStyle:
                        FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Roboto',
                              letterSpacing: 0.0,
                            ),
                    textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Roboto',
                          letterSpacing: 0.0,
                        ),
                    hintText: 'Select Possesion',
                    searchHintText: 'Search for an Possesion...',
                    icon: Icon(
                      Icons.keyboard_arrow_down_rounded,
                      color: FlutterFlowTheme.of(context).secondaryText,
                      size: 24.0,
                    ),
                    fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                    elevation: 2.0,
                    borderColor: FlutterFlowTheme.of(context).alternate,
                    borderWidth: 2.0,
                    borderRadius: 8.0,
                    margin:
                        const EdgeInsetsDirectional.fromSTEB(16.0, 4.0, 16.0, 4.0),
                    hidesUnderline: true,
                    isOverButton: true,
                    isSearchable: true,
                    isMultiSelect: true,
                    onMultiSelectChanged: (val) async {
                      safeSetState(() => _model.possesionValue = val);
                      _model.possesionList =
                          _model.possesionValue!.toList().cast<String>();
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
                  child: FlutterFlowDropDown<String>(
                    multiSelectController: _model.priceRangeValueController ??=
                        FormListFieldController<String>(
                            _model.priceRangeValue ??= List<String>.from(
                      _model.possesionList ?? [],
                    )),
                    options: List<String>.from([
                      '0-25L',
                      '25L-75L',
                      '75L-1Cr',
                      '1Cr-1.5Cr',
                      '1.5Cr-3Cr',
                      '3Cr-5Cr',
                      '5Cr-7Cr',
                      '7Cr-10Cr',
                      '10Cr+'
                    ]),
                    optionLabels: const [
                      '0 - 25 L',
                      '25 L - 75 L',
                      '75 L - 1 Cr',
                      '1 Cr - 1.5 Cr',
                      '1.5 Cr - 3 Cr',
                      '3 Cr - 5 Cr',
                      '5 Cr - 7 Cr',
                      '7 Cr - 10 Cr',
                      '10 Cr +'
                    ],
                    width: 300.0,
                    height: 56.0,
                    maxHeight: 300.0,
                    searchHintTextStyle:
                        FlutterFlowTheme.of(context).labelMedium.override(
                              fontFamily: 'Roboto',
                              letterSpacing: 0.0,
                            ),
                    searchTextStyle:
                        FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Roboto',
                              letterSpacing: 0.0,
                            ),
                    textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Roboto',
                          letterSpacing: 0.0,
                        ),
                    hintText: 'Select Price Range',
                    searchHintText: 'Search for an Price...',
                    icon: Icon(
                      Icons.keyboard_arrow_down_rounded,
                      color: FlutterFlowTheme.of(context).secondaryText,
                      size: 24.0,
                    ),
                    fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                    elevation: 2.0,
                    borderColor: FlutterFlowTheme.of(context).alternate,
                    borderWidth: 2.0,
                    borderRadius: 8.0,
                    margin:
                        const EdgeInsetsDirectional.fromSTEB(16.0, 4.0, 16.0, 4.0),
                    hidesUnderline: true,
                    isOverButton: true,
                    isSearchable: true,
                    isMultiSelect: true,
                    onMultiSelectChanged: (val) async {
                      safeSetState(() => _model.priceRangeValue = val);
                      _model.priceRangesList =
                          _model.priceRangeValue!.toList().cast<String>();
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
                  child: FutureBuilder<ApiCallResponse>(
                    future: EmpireGroup.getAreaCall.call(
                      token: FFAppState().loginToken,
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
                      final areaGetAreaResponse = snapshot.data!;

                      return FlutterFlowDropDown<String>(
                        multiSelectController: _model.areaValueController ??=
                            FormListFieldController<String>(
                                _model.areaValue ??= List<String>.from(
                          _model.areaList ?? [],
                        )),
                        options:
                            List<String>.from(EmpireGroup.getAreaCall.areaId(
                          areaGetAreaResponse.jsonBody,
                        )!),
                        optionLabels: EmpireGroup.getAreaCall.areaName(
                          areaGetAreaResponse.jsonBody,
                        )!,
                        width: 300.0,
                        height: 56.0,
                        maxHeight: 300.0,
                        searchHintTextStyle:
                            FlutterFlowTheme.of(context).labelMedium.override(
                                  fontFamily: 'Roboto',
                                  letterSpacing: 0.0,
                                ),
                        searchTextStyle:
                            FlutterFlowTheme.of(context).bodyMedium.override(
                                  fontFamily: 'Roboto',
                                  letterSpacing: 0.0,
                                ),
                        textStyle:
                            FlutterFlowTheme.of(context).bodyMedium.override(
                                  fontFamily: 'Roboto',
                                  letterSpacing: 0.0,
                                ),
                        hintText: 'Select Area',
                        searchHintText: 'Search for an area...',
                        icon: Icon(
                          Icons.keyboard_arrow_down_rounded,
                          color: FlutterFlowTheme.of(context).secondaryText,
                          size: 24.0,
                        ),
                        fillColor:
                            FlutterFlowTheme.of(context).secondaryBackground,
                        elevation: 2.0,
                        borderColor: FlutterFlowTheme.of(context).alternate,
                        borderWidth: 2.0,
                        borderRadius: 8.0,
                        margin: const EdgeInsetsDirectional.fromSTEB(
                            16.0, 4.0, 16.0, 4.0),
                        hidesUnderline: true,
                        disabled: !(EmpireGroup.getAreaCall.areaId(
                                  areaGetAreaResponse.jsonBody,
                                ) !=
                                null &&
                            (EmpireGroup.getAreaCall.areaId(
                              areaGetAreaResponse.jsonBody,
                            ))!
                                .isNotEmpty),
                        isOverButton: true,
                        isSearchable: true,
                        isMultiSelect: true,
                        onMultiSelectChanged: (val) async {
                          safeSetState(() => _model.areaValue = val);
                          _model.areaList =
                              _model.areaValue!.toList().cast<String>();
                        },
                      );
                    },
                  ),
                ),
                const Spacer(),
                FFButtonWidget(
                  onPressed: () async {
                    if (scaffoldKey.currentState!.isDrawerOpen ||
                        scaffoldKey.currentState!.isEndDrawerOpen) {
                      Navigator.pop(context);
                    }

                    safeSetState(() => _model.apiRequestCompleter = null);
                    await _model.waitForApiRequestCompleted();
                  },
                  text: 'Submit',
                  options: FFButtonOptions(
                    width: double.infinity,
                    height: 40.0,
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                    iconPadding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: FlutterFlowTheme.of(context).primary,
                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                          fontFamily: 'Roboto',
                          color: Colors.white,
                          letterSpacing: 0.0,
                        ),
                    elevation: 3.0,
                    borderSide: const BorderSide(
                      color: Colors.transparent,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ],
            ),
          ),
        ),
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
          automaticallyImplyLeading: false,
          title: Text(
            functions.greetingForTime(),
            style: FlutterFlowTheme.of(context).headlineSmall.override(
                  fontFamily: 'Roboto',
                  letterSpacing: 0.0,
                ),
          ),
          actions: const [],
          centerTitle: false,
          elevation: 0.0,
        ),
        body: SafeArea(
          top: true,
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 65.0, 0.0, 0.0),
                child: FutureBuilder<ApiCallResponse>(
                  future: (_model.apiRequestCompleter ??=
                          Completer<ApiCallResponse>()
                            ..complete(EmpireGroup
                                .getAllPropertyWithSearchAndFilterCall
                                .call(
                              token: FFAppState().loginToken,
                              search: _model.textController.text,
                              properyTypeList: _model.proprtyTypeList,
                              bhkList: _model.bhkList,
                              areaList: _model.areaList,
                              possesionList: _model.possesionList,
                              priceRangeList: _model.priceRangesList,
                            )))
                      .future,
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
                    final searchDataGetAllPropertyWithSearchAndFilterResponse =
                        snapshot.data!;

                    return Builder(
                      builder: (context) {
                        if (EmpireGroup.getAllPropertyWithSearchAndFilterCall
                                    .projectId(
                                  searchDataGetAllPropertyWithSearchAndFilterResponse
                                      .jsonBody,
                                ) !=
                                null &&
                            (EmpireGroup.getAllPropertyWithSearchAndFilterCall
                                    .projectId(
                              searchDataGetAllPropertyWithSearchAndFilterResponse
                                  .jsonBody,
                            ))!
                                .isNotEmpty) {
                          return Builder(
                            builder: (context) {
                              final propertyList = EmpireGroup
                                      .getAllPropertyWithSearchAndFilterCall
                                      .projectId(
                                        searchDataGetAllPropertyWithSearchAndFilterResponse
                                            .jsonBody,
                                      )
                                      ?.toList() ??
                                  [];

                              return ListView.separated(
                                padding: EdgeInsets.zero,
                                primary: false,
                                scrollDirection: Axis.vertical,
                                itemCount: propertyList.length,
                                separatorBuilder: (_, __) =>
                                    const SizedBox(height: 10.0),
                                itemBuilder: (context, propertyListIndex) {
                                  final propertyListItem =
                                      propertyList[propertyListIndex];
                                  return Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        16.0, 0.0, 16.0, 0.0),
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        context.pushNamed(
                                          'Property_Details_New',
                                          queryParameters: {
                                            'propertyId': serializeParam(
                                              EmpireGroup
                                                  .getAllPropertyWithSearchAndFilterCall
                                                  .projectId(
                                                searchDataGetAllPropertyWithSearchAndFilterResponse
                                                    .jsonBody,
                                              )?[propertyListIndex],
                                              ParamType.String,
                                            ),
                                          }.withoutNulls,
                                        );
                                      },
                                      child: Container(
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          boxShadow: const [
                                            BoxShadow(
                                              blurRadius: 2.0,
                                              color: Color(0x33000000),
                                              offset: Offset(
                                                0.0,
                                                0.0,
                                              ),
                                            )
                                          ],
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                          border: Border.all(
                                            color: FlutterFlowTheme.of(context)
                                                .alternate,
                                            width: 1.0,
                                          ),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(5.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 5.0, 0.0),
                                                child: Container(
                                                  width: 100.0,
                                                  height: 100.0,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                  ),
                                                  child:
                                                      ImageSliderComponentWidget(
                                                    key: Key(
                                                        'Keyc3m_${propertyListIndex}_of_${propertyList.length}'),
                                                    imageList:
                                                        functions.getImageUrls(
                                                            EmpireGroup
                                                                .getAllPropertyWithSearchAndFilterCall
                                                                .allData(
                                                                  searchDataGetAllPropertyWithSearchAndFilterResponse
                                                                      .jsonBody,
                                                                )!
                                                                .toList(),
                                                            propertyListIndex),
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  0.0,
                                                                  5.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Expanded(
                                                            child: Container(
                                                              decoration:
                                                                  const BoxDecoration(),
                                                              child: Text(
                                                                valueOrDefault<
                                                                    String>(
                                                                  EmpireGroup
                                                                      .getAllPropertyWithSearchAndFilterCall
                                                                      .projectName(
                                                                    searchDataGetAllPropertyWithSearchAndFilterResponse
                                                                        .jsonBody,
                                                                  )?[propertyListIndex],
                                                                  'Project Name',
                                                                ),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Roboto',
                                                                      fontSize:
                                                                          12.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                    ),
                                                              ),
                                                            ),
                                                          ),
                                                          Container(
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primary,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          3.0),
                                                            ),
                                                            child: Align(
                                                              alignment:
                                                                  const AlignmentDirectional(
                                                                      0.0, 0.0),
                                                              child: Padding(
                                                                padding:
                                                                    const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            5.0,
                                                                            2.0,
                                                                            5.0,
                                                                            2.0),
                                                                child: Text(
                                                                  valueOrDefault<
                                                                      String>(
                                                                    EmpireGroup
                                                                        .getAllPropertyWithSearchAndFilterCall
                                                                        .possesion(
                                                                      searchDataGetAllPropertyWithSearchAndFilterResponse
                                                                          .jsonBody,
                                                                    )?[propertyListIndex],
                                                                    'Possesion',
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Roboto',
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryBackground,
                                                                        fontSize:
                                                                            10.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  0.0,
                                                                  5.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        5.0,
                                                                        0.0),
                                                            child: Icon(
                                                              Icons
                                                                  .location_on_rounded,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryText,
                                                              size: 12.0,
                                                            ),
                                                          ),
                                                          Expanded(
                                                            child: Container(
                                                              decoration:
                                                                  const BoxDecoration(),
                                                              child: Text(
                                                                valueOrDefault<
                                                                    String>(
                                                                  EmpireGroup
                                                                      .getAllPropertyWithSearchAndFilterCall
                                                                      .address(
                                                                    searchDataGetAllPropertyWithSearchAndFilterResponse
                                                                        .jsonBody,
                                                                  )?[propertyListIndex],
                                                                  'Address',
                                                                ),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Roboto',
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryText,
                                                                      fontSize:
                                                                          10.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                    ),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  0.0,
                                                                  5.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        5.0,
                                                                        0.0),
                                                            child: Icon(
                                                              Icons.device_hub,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryText,
                                                              size: 12.0,
                                                            ),
                                                          ),
                                                          Text(
                                                            'Project Area - ',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Roboto',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryText,
                                                                  fontSize:
                                                                      10.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                          ),
                                                          Expanded(
                                                            child: Container(
                                                              decoration:
                                                                  const BoxDecoration(),
                                                              child: Text(
                                                                valueOrDefault<
                                                                    String>(
                                                                  (EmpireGroup
                                                                          .getAllPropertyWithSearchAndFilterCall
                                                                          .projectArea(
                                                                    searchDataGetAllPropertyWithSearchAndFilterResponse
                                                                        .jsonBody,
                                                                  )?[propertyListIndex])
                                                                      ?.toString(),
                                                                  'Area',
                                                                ),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Roboto',
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryText,
                                                                      fontSize:
                                                                          10.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                    ),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  0.0,
                                                                  5.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        5.0,
                                                                        0.0),
                                                            child: Icon(
                                                              Icons.apartment,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryText,
                                                              size: 12.0,
                                                            ),
                                                          ),
                                                          Text(
                                                            'Unit of Size - ',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Roboto',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryText,
                                                                  fontSize:
                                                                      10.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                          ),
                                                          Expanded(
                                                            child: Container(
                                                              decoration:
                                                                  const BoxDecoration(),
                                                              child: Text(
                                                                valueOrDefault<
                                                                    String>(
                                                                  (EmpireGroup
                                                                          .getAllPropertyWithSearchAndFilterCall
                                                                          .unitofSize(
                                                                    searchDataGetAllPropertyWithSearchAndFilterResponse
                                                                        .jsonBody,
                                                                  )?[propertyListIndex])
                                                                      ?.toString(),
                                                                  'Unit',
                                                                ),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Roboto',
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryText,
                                                                      fontSize:
                                                                          10.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                    ),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  0.0,
                                                                  5.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Flexible(
                                                            child: Padding(
                                                              padding:
                                                                  const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          5.0,
                                                                          0.0),
                                                              child: Container(
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .alternate,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              2.0),
                                                                ),
                                                                child: Padding(
                                                                  padding: const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          2.0,
                                                                          2.0,
                                                                          2.0,
                                                                          2.0),
                                                                  child:
                                                                      RichText(
                                                                    textScaler:
                                                                        MediaQuery.of(context)
                                                                            .textScaler,
                                                                    text:
                                                                        TextSpan(
                                                                      children: [
                                                                        TextSpan(
                                                                          text:
                                                                              'Possession:',
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'Roboto',
                                                                                color: FlutterFlowTheme.of(context).secondaryText,
                                                                                fontSize: 8.0,
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FontWeight.bold,
                                                                              ),
                                                                        ),
                                                                        TextSpan(
                                                                          text:
                                                                              valueOrDefault<String>(
                                                                            functions.splitDate(EmpireGroup.getAllPropertyWithSearchAndFilterCall.lunchDate(
                                                                              searchDataGetAllPropertyWithSearchAndFilterResponse.jsonBody,
                                                                            )![propertyListIndex]),
                                                                            'Date',
                                                                          ),
                                                                          style:
                                                                              TextStyle(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primaryText,
                                                                            fontSize:
                                                                                8.0,
                                                                          ),
                                                                        )
                                                                      ],
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Roboto',
                                                                            letterSpacing:
                                                                                0.0,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Flexible(
                                                          flex: 2,
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        5.0,
                                                                        0.0),
                                                            child: Container(
                                                              decoration:
                                                                  BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            2.0),
                                                              ),
                                                              child: Padding(
                                                                padding:
                                                                    const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            2.0,
                                                                            2.0,
                                                                            2.0,
                                                                            2.0),
                                                                child: RichText(
                                                                  textScaler: MediaQuery.of(
                                                                          context)
                                                                      .textScaler,
                                                                  text:
                                                                      TextSpan(
                                                                    children: [
                                                                      TextSpan(
                                                                        text:
                                                                            'Developed By:',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'Roboto',
                                                                              color: FlutterFlowTheme.of(context).secondaryText,
                                                                              fontSize: 8.0,
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.bold,
                                                                            ),
                                                                      ),
                                                                      TextSpan(
                                                                        text: valueOrDefault<
                                                                            String>(
                                                                          EmpireGroup
                                                                              .getAllPropertyWithSearchAndFilterCall
                                                                              .developerName(
                                                                            searchDataGetAllPropertyWithSearchAndFilterResponse.jsonBody,
                                                                          )?[propertyListIndex],
                                                                          'Name',
                                                                        ),
                                                                        style:
                                                                            TextStyle(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryText,
                                                                          fontSize:
                                                                              8.0,
                                                                        ),
                                                                      )
                                                                    ],
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Roboto',
                                                                          letterSpacing:
                                                                              0.0,
                                                                        ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Flexible(
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        5.0,
                                                                        0.0),
                                                            child: Container(
                                                              decoration:
                                                                  BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            2.0),
                                                              ),
                                                              child: Padding(
                                                                padding:
                                                                    const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            2.0,
                                                                            2.0,
                                                                            2.0,
                                                                            2.0),
                                                                child: RichText(
                                                                  textScaler: MediaQuery.of(
                                                                          context)
                                                                      .textScaler,
                                                                  text:
                                                                      TextSpan(
                                                                    children: [
                                                                      TextSpan(
                                                                        text:
                                                                            'Approved By: ',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'Roboto',
                                                                              color: FlutterFlowTheme.of(context).secondaryText,
                                                                              fontSize: 8.0,
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.bold,
                                                                            ),
                                                                      ),
                                                                      TextSpan(
                                                                        text: valueOrDefault<
                                                                            String>(
                                                                          EmpireGroup
                                                                              .getAllPropertyWithSearchAndFilterCall
                                                                              .approveBy(
                                                                            searchDataGetAllPropertyWithSearchAndFilterResponse.jsonBody,
                                                                          )?[propertyListIndex],
                                                                          'Name',
                                                                        ),
                                                                        style:
                                                                            TextStyle(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryText,
                                                                          fontSize:
                                                                              8.0,
                                                                        ),
                                                                      )
                                                                    ],
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Roboto',
                                                                          letterSpacing:
                                                                              0.0,
                                                                        ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    if (valueOrDefault<bool>(
                                                      EmpireGroup
                                                          .getAllPropertyWithSearchAndFilterCall
                                                          .isSampleHouse(
                                                        searchDataGetAllPropertyWithSearchAndFilterResponse
                                                            .jsonBody,
                                                      )?[propertyListIndex],
                                                      false,
                                                    ))
                                                      Container(
                                                        decoration:
                                                            BoxDecoration(
                                                          color:
                                                              const Color(0xFF5A7C8D),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      3.0),
                                                        ),
                                                        child: Align(
                                                          alignment:
                                                              const AlignmentDirectional(
                                                                  0.0, 0.0),
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        5.0,
                                                                        3.0,
                                                                        5.0,
                                                                        3.0),
                                                            child: Text(
                                                              'Sample House Ready',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Roboto',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryBackground,
                                                                    fontSize:
                                                                        10.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                  ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
                          );
                        } else {
                          return Align(
                            alignment: const AlignmentDirectional(0.0, 0.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child: Image.asset(
                                'assets/images/2808307.jpg',
                                width: 300.0,
                                height: 300.0,
                                fit: BoxFit.contain,
                              ),
                            ),
                          );
                        }
                      },
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: _model.textController,
                        focusNode: _model.textFieldFocusNode,
                        onChanged: (_) => EasyDebounce.debounce(
                          '_model.textController',
                          const Duration(milliseconds: 2000),
                          () async {
                            _model.searchValue = _model.textController.text;
                            await Future.delayed(
                                const Duration(milliseconds: 200));
                            safeSetState(
                                () => _model.apiRequestCompleter = null);
                            await _model.waitForApiRequestCompleted();
                          },
                        ),
                        autofocus: true,
                        obscureText: false,
                        decoration: InputDecoration(
                          isDense: false,
                          labelStyle:
                              FlutterFlowTheme.of(context).labelMedium.override(
                                    fontFamily: 'Roboto',
                                    letterSpacing: 0.0,
                                  ),
                          hintText: 'Search Property',
                          hintStyle: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                fontFamily: 'Roboto',
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                letterSpacing: 0.0,
                              ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).primary,
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).error,
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).error,
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          filled: true,
                          fillColor: const Color(0xFFE8E7EB),
                          prefixIcon: Icon(
                            Icons.search_outlined,
                            color: FlutterFlowTheme.of(context).secondaryText,
                          ),
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Roboto',
                              letterSpacing: 0.0,
                            ),
                        maxLines: null,
                        validator:
                            _model.textControllerValidator.asValidator(context),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                      child: Container(
                        width: 45.0,
                        height: 45.0,
                        decoration: BoxDecoration(
                          color: const Color(0xFFE8E7EB),
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            scaffoldKey.currentState!.openDrawer();
                          },
                          child: Icon(
                            Icons.filter_list_alt,
                            color: FlutterFlowTheme.of(context).primary,
                            size: 24.0,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
