import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:async';
import 'home_screen_widget.dart' show HomeScreenWidget;
import 'package:flutter/material.dart';

class HomeScreenModel extends FlutterFlowModel<HomeScreenWidget> {
  ///  Local state fields for this page.

  String searchValue = '  ';

  List<String> proprtyTypeList = [];
  void addToProprtyTypeList(String item) => proprtyTypeList.add(item);
  void removeFromProprtyTypeList(String item) => proprtyTypeList.remove(item);
  void removeAtIndexFromProprtyTypeList(int index) =>
      proprtyTypeList.removeAt(index);
  void insertAtIndexInProprtyTypeList(int index, String item) =>
      proprtyTypeList.insert(index, item);
  void updateProprtyTypeListAtIndex(int index, Function(String) updateFn) =>
      proprtyTypeList[index] = updateFn(proprtyTypeList[index]);

  List<String> bhkList = [];
  void addToBhkList(String item) => bhkList.add(item);
  void removeFromBhkList(String item) => bhkList.remove(item);
  void removeAtIndexFromBhkList(int index) => bhkList.removeAt(index);
  void insertAtIndexInBhkList(int index, String item) =>
      bhkList.insert(index, item);
  void updateBhkListAtIndex(int index, Function(String) updateFn) =>
      bhkList[index] = updateFn(bhkList[index]);

  List<String> areaList = [];
  void addToAreaList(String item) => areaList.add(item);
  void removeFromAreaList(String item) => areaList.remove(item);
  void removeAtIndexFromAreaList(int index) => areaList.removeAt(index);
  void insertAtIndexInAreaList(int index, String item) =>
      areaList.insert(index, item);
  void updateAreaListAtIndex(int index, Function(String) updateFn) =>
      areaList[index] = updateFn(areaList[index]);

  List<String> possesionList = [];
  void addToPossesionList(String item) => possesionList.add(item);
  void removeFromPossesionList(String item) => possesionList.remove(item);
  void removeAtIndexFromPossesionList(int index) =>
      possesionList.removeAt(index);
  void insertAtIndexInPossesionList(int index, String item) =>
      possesionList.insert(index, item);
  void updatePossesionListAtIndex(int index, Function(String) updateFn) =>
      possesionList[index] = updateFn(possesionList[index]);

  List<String> priceRangesList = [];
  void addToPriceRangesList(String item) => priceRangesList.add(item);
  void removeFromPriceRangesList(String item) => priceRangesList.remove(item);
  void removeAtIndexFromPriceRangesList(int index) =>
      priceRangesList.removeAt(index);
  void insertAtIndexInPriceRangesList(int index, String item) =>
      priceRangesList.insert(index, item);
  void updatePriceRangesListAtIndex(int index, Function(String) updateFn) =>
      priceRangesList[index] = updateFn(priceRangesList[index]);

  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  Completer<ApiCallResponse>? apiRequestCompleter;
  // State field(s) for type widget.
  List<String>? typeValue;
  FormFieldController<List<String>>? typeValueController;
  // State field(s) for bhk widget.
  List<String>? bhkValue;
  FormFieldController<List<String>>? bhkValueController;
  // State field(s) for possesion widget.
  List<String>? possesionValue;
  FormFieldController<List<String>>? possesionValueController;
  // State field(s) for priceRange widget.
  List<String>? priceRangeValue;
  FormFieldController<List<String>>? priceRangeValueController;
  // State field(s) for area widget.
  List<String>? areaValue;
  FormFieldController<List<String>>? areaValueController;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }

  /// Additional helper methods.
  Future waitForApiRequestCompleted({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(const Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = apiRequestCompleter?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }
}
