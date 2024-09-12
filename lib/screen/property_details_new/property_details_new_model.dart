import '/components/image_slider_component/image_slider_component_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'property_details_new_widget.dart' show PropertyDetailsNewWidget;
import 'package:flutter/material.dart';

class PropertyDetailsNewModel
    extends FlutterFlowModel<PropertyDetailsNewWidget> {
  ///  Local state fields for this page.

  int towerIndex = 0;

  int chargeIndex = 0;

  int unitplanListIndex = 0;

  ///  State fields for stateful widgets in this page.

  // Model for Image_Slider_Component component.
  late ImageSliderComponentModel imageSliderComponentModel;

  @override
  void initState(BuildContext context) {
    imageSliderComponentModel =
        createModel(context, () => ImageSliderComponentModel());
  }

  @override
  void dispose() {
    imageSliderComponentModel.dispose();
  }
}
