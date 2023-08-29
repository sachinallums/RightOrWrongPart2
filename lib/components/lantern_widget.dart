import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'lantern_model.dart';
export 'lantern_model.dart';

class LanternWidget extends StatefulWidget {
  const LanternWidget({
    Key? key,
    this.lanternValue,
  }) : super(key: key);

  final int? lanternValue;

  @override
  _LanternWidgetState createState() => _LanternWidgetState();
}

class _LanternWidgetState extends State<LanternWidget> {
  late LanternModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LanternModel());
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
      alignment: AlignmentDirectional(-0.6, -0.44),
      child: Container(
        width: 200.0,
        height: 200.0,
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
        ),
        child: Container(
          width: double.infinity,
          child: Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.asset(
                  'assets/images/Group_6927.png',
                  width: 300.0,
                  height: 200.0,
                  fit: BoxFit.cover,
                ),
              ),
              Align(
                alignment: AlignmentDirectional(0.0, 0.4),
                child: Text(
                  valueOrDefault<String>(
                    widget.lanternValue?.toString(),
                    '100',
                  ),
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Montserrat',
                        fontSize: 86.0,
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
