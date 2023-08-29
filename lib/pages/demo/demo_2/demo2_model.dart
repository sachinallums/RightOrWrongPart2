import '/components/itsright_widget.dart';
import '/components/itswrong_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class Demo2Model extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for itsright component.
  late ItsrightModel itsrightModel;
  // Model for itswrong component.
  late ItswrongModel itswrongModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    itsrightModel = createModel(context, () => ItsrightModel());
    itswrongModel = createModel(context, () => ItswrongModel());
  }

  void dispose() {
    unfocusNode.dispose();
    itsrightModel.dispose();
    itswrongModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
