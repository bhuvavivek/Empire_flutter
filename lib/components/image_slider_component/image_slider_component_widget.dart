import '/components/no_image_component/no_image_component_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'image_slider_component_model.dart';
export 'image_slider_component_model.dart';

class ImageSliderComponentWidget extends StatefulWidget {
  const ImageSliderComponentWidget({
    super.key,
    required this.imageList,
  });

  final List<String>? imageList;

  @override
  State<ImageSliderComponentWidget> createState() =>
      _ImageSliderComponentWidgetState();
}

class _ImageSliderComponentWidgetState
    extends State<ImageSliderComponentWidget> {
  late ImageSliderComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ImageSliderComponentModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(),
      child: Builder(
        builder: (context) {
          final imageList = widget.imageList!.toList();
          if (imageList.isEmpty) {
            return const NoImageComponentWidget();
          }

          return SizedBox(
            width: double.infinity,
            height: 180.0,
            child: CarouselSlider.builder(
              itemCount: imageList.length,
              itemBuilder: (context, imageListIndex, _) {
                final imageListItem = imageList[imageListIndex];
                return ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: CachedNetworkImage(
                    fadeInDuration: const Duration(milliseconds: 500),
                    fadeOutDuration: const Duration(milliseconds: 500),
                    imageUrl: functions
                        .modifyUrlForImage(widget.imageList![imageListIndex]),
                    width: double.infinity,
                    height: double.infinity,
                    fit: BoxFit.cover,
                  ),
                );
              },
              carouselController: _model.carouselController ??=
                  CarouselController(),
              options: CarouselOptions(
                initialPage: max(0, min(1, imageList.length - 1)),
                viewportFraction: 1.0,
                disableCenter: true,
                enlargeCenterPage: true,
                enlargeFactor: 0.25,
                enableInfiniteScroll: true,
                scrollDirection: Axis.horizontal,
                autoPlay: false,
                onPageChanged: (index, _) =>
                    _model.carouselCurrentIndex = index,
              ),
            ),
          );
        },
      ),
    );
  }
}
