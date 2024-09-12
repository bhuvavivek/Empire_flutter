import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'no_image_component_model.dart';
export 'no_image_component_model.dart';

class NoImageComponentWidget extends StatefulWidget {
  const NoImageComponentWidget({super.key});

  @override
  State<NoImageComponentWidget> createState() => _NoImageComponentWidgetState();
}

class _NoImageComponentWidgetState extends State<NoImageComponentWidget> {
  late NoImageComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NoImageComponentModel());

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
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
      ),
      child: Align(
        alignment: const AlignmentDirectional(0.0, 0.0),
        child: FaIcon(
          FontAwesomeIcons.city,
          color: FlutterFlowTheme.of(context).secondaryText,
          size: 100.0,
        ),
      ),
    );
  }
}
