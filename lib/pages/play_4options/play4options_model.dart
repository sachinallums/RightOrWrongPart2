import '/backend/backend.dart';
import '/components/feedback_text_widget.dart';
import '/components/itsright_widget.dart';
import '/components/itswrong_widget.dart';
import '/components/lantern_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class Play4optionsModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - Create Document] action in play_4options widget.
  ProblemLogsRecord? newLog;
  // Model for itsright component.
  late ItsrightModel itsrightModel;
  // Model for itswrong component.
  late ItswrongModel itswrongModel;
  // Model for lantern component.
  late LanternModel lanternModel1;
  // Model for lantern component.
  late LanternModel lanternModel2;
  // Model for lantern component.
  late LanternModel lanternModel3;
  // Model for lantern component.
  late LanternModel lanternModel4;
  // Model for feedbackText component.
  late FeedbackTextModel feedbackTextModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    itsrightModel = createModel(context, () => ItsrightModel());
    itswrongModel = createModel(context, () => ItswrongModel());
    lanternModel1 = createModel(context, () => LanternModel());
    lanternModel2 = createModel(context, () => LanternModel());
    lanternModel3 = createModel(context, () => LanternModel());
    lanternModel4 = createModel(context, () => LanternModel());
    feedbackTextModel = createModel(context, () => FeedbackTextModel());
  }

  void dispose() {
    unfocusNode.dispose();
    itsrightModel.dispose();
    itswrongModel.dispose();
    lanternModel1.dispose();
    lanternModel2.dispose();
    lanternModel3.dispose();
    lanternModel4.dispose();
    feedbackTextModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
