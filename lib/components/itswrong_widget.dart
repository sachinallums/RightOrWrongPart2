import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'itswrong_model.dart';
export 'itswrong_model.dart';

class ItswrongWidget extends StatefulWidget {
  const ItswrongWidget({Key? key}) : super(key: key);

  @override
  _ItswrongWidgetState createState() => _ItswrongWidgetState();
}

class _ItswrongWidgetState extends State<ItswrongWidget> {
  late ItswrongModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ItswrongModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Stack(
      children: [
        Align(
          alignment: AlignmentDirectional(0.0, 0.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.asset(
              'assets/images/itswrongwhite.png',
              height: 104.0,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ],
    );
  }
}
