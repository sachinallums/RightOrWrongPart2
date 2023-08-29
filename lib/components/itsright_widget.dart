import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'itsright_model.dart';
export 'itsright_model.dart';

class ItsrightWidget extends StatefulWidget {
  const ItsrightWidget({Key? key}) : super(key: key);

  @override
  _ItsrightWidgetState createState() => _ItsrightWidgetState();
}

class _ItsrightWidgetState extends State<ItsrightWidget> {
  late ItsrightModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ItsrightModel());
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
              'assets/images/itsrightwhite.png',
              height: 104.0,
              fit: BoxFit.contain,
            ),
          ),
        ),
      ],
    );
  }
}
