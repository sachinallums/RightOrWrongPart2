import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'feedback_text_model.dart';
export 'feedback_text_model.dart';

class FeedbackTextWidget extends StatefulWidget {
  const FeedbackTextWidget({Key? key}) : super(key: key);

  @override
  _FeedbackTextWidgetState createState() => _FeedbackTextWidgetState();
}

class _FeedbackTextWidgetState extends State<FeedbackTextWidget> {
  late FeedbackTextModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FeedbackTextModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Container(
      width: double.infinity,
      height: 140.0,
      decoration: BoxDecoration(),
      child: Align(
        alignment: AlignmentDirectional(-1.0, -1.0),
        child: Stack(
          children: [
            Align(
              alignment: AlignmentDirectional(0.0, 0.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.asset(
                  'assets/images/Group_6094.png',
                  width: double.infinity,
                  height: double.infinity,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            if (FFAppState().gotQuestionCorrect)
              Align(
                alignment: AlignmentDirectional(0.0, 0.0),
                child: Text(
                  'Nice Job! Click anywhere to continue.',
                  textAlign: TextAlign.center,
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Comic Sans',
                        color: Color(0xFF4D4D4D),
                        fontSize: 34.0,
                        fontWeight: FontWeight.bold,
                        useGoogleFonts: false,
                      ),
                ),
              ),
            Align(
              alignment: AlignmentDirectional(0.0, 0.0),
              child: Container(
                width: 100.0,
                height: 100.0,
                constraints: BoxConstraints(
                  minWidth: 800.0,
                  minHeight: 140.0,
                  maxWidth: 800.0,
                  maxHeight: 140.0,
                ),
                decoration: BoxDecoration(),
                child: Visibility(
                  visible: !FFAppState().gotQuestionCorrect,
                  child: Align(
                    alignment: AlignmentDirectional(0.0, 0.0),
                    child: Text(
                      valueOrDefault<String>(
                        functions.generateIncorrectFeedbackText(
                            FFAppState().problemInfo.isRight),
                        '\"\"',
                      ),
                      textAlign: TextAlign.center,
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Comic Sans',
                            color: Color(0xFF4D4D4D),
                            fontSize: 34.0,
                            fontWeight: FontWeight.bold,
                            useGoogleFonts: false,
                          ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
