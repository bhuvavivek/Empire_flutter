import '/flutter_flow/flutter_flow_util.dart';
import 'image_slider_component_widget.dart' show ImageSliderComponentWidget;
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class ImageSliderComponentModel
    extends FlutterFlowModel<ImageSliderComponentWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for Carousel widget.
  CarouselController? carouselController;
  int carouselCurrentIndex = 1;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
