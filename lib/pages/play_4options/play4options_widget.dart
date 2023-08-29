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
import 'play4options_model.dart';
export 'play4options_model.dart';

class Play4optionsWidget extends StatefulWidget {
  const Play4optionsWidget({
    Key? key,
    String? curanimal,
  })  : this.curanimal = curanimal ?? '1',
        super(key: key);

  final String curanimal;

  @override
  _Play4optionsWidgetState createState() => _Play4optionsWidgetState();
}

class _Play4optionsWidgetState extends State<Play4optionsWidget>
    with TickerProviderStateMixin {
  late Play4optionsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = {
    'itsrightOnActionTriggerAnimation': AnimationInfo(
      trigger: AnimationTrigger.onActionTrigger,
      applyInitialState: true,
      effects: [
        ScaleEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 1500.ms,
          begin: Offset(1.0, 1.0),
          end: Offset(1.2, 1.2),
        ),
      ],
    ),
    'itswrongOnActionTriggerAnimation': AnimationInfo(
      trigger: AnimationTrigger.onActionTrigger,
      applyInitialState: true,
      effects: [
        ScaleEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 1500.ms,
          begin: Offset(1.0, 1.0),
          end: Offset(1.2, 1.2),
        ),
      ],
    ),
  };

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => Play4optionsModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      setState(() {
        FFAppState().QuestionStart = getCurrentTimestamp;
      });

      var problemLogsRecordReference =
          ProblemLogsRecord.createDoc(FFAppState().sessionParentReference!);
      await problemLogsRecordReference.set(createProblemLogsRecordData(
        dateTime: FFAppState().QuestionStart,
        problemID: FFAppState().problemInfo.problemID,
        problemLevel: FFAppState().problemInfo.problemLevel,
        problemOptions: FFAppState().problemInfo.problemOptions,
        num1: FFAppState().problemInfo.num1,
        num2: FFAppState().problemInfo.num2,
        num3: FFAppState().problemInfo.num3,
        num4: FFAppState().problemInfo.num4,
        num5: FFAppState().problemInfo.num5,
        firstAttempt: FFAppState().problemInfo.firstAttempt,
        referenceID: FFAppState().problemInfo.referenceID,
        problemCycle: FFAppState().problemInfo.problemCycle,
        isRight: FFAppState().problemInfo.isRight,
      ));
      _model.newLog = ProblemLogsRecord.getDocumentFromData(
          createProblemLogsRecordData(
            dateTime: FFAppState().QuestionStart,
            problemID: FFAppState().problemInfo.problemID,
            problemLevel: FFAppState().problemInfo.problemLevel,
            problemOptions: FFAppState().problemInfo.problemOptions,
            num1: FFAppState().problemInfo.num1,
            num2: FFAppState().problemInfo.num2,
            num3: FFAppState().problemInfo.num3,
            num4: FFAppState().problemInfo.num4,
            num5: FFAppState().problemInfo.num5,
            firstAttempt: FFAppState().problemInfo.firstAttempt,
            referenceID: FFAppState().problemInfo.referenceID,
            problemCycle: FFAppState().problemInfo.problemCycle,
            isRight: FFAppState().problemInfo.isRight,
          ),
          problemLogsRecordReference);
    });

    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return StreamBuilder<List<ProblemLogsRecord>>(
      stream: queryProblemLogsRecord(
        singleRecord: true,
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    FlutterFlowTheme.of(context).primary,
                  ),
                ),
              ),
            ),
          );
        }
        List<ProblemLogsRecord> play4optionsProblemLogsRecordList =
            snapshot.data!;
        // Return an empty Container when the item does not exist.
        if (snapshot.data!.isEmpty) {
          return Container();
        }
        final play4optionsProblemLogsRecord =
            play4optionsProblemLogsRecordList.isNotEmpty
                ? play4optionsProblemLogsRecordList.first
                : null;
        return GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(_model.unfocusNode),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: SafeArea(
              top: true,
              child: InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  if (FFAppState().answeredQuestion) {
                    context.pushNamed(
                      'play_1',
                      extra: <String, dynamic>{
                        kTransitionInfoKey: TransitionInfo(
                          hasTransition: true,
                          transitionType: PageTransitionType.fade,
                          duration: Duration(milliseconds: 0),
                        ),
                      },
                    );
                  }
                },
                child: Stack(
                  children: [
                    Container(
                      width: double.infinity,
                      height: double.infinity,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(0.0),
                        child: Image.asset(
                          'assets/images/iPad_Pro_12.9in__92.png',
                          width: 300.0,
                          height: 200.0,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(0.0, 1.0),
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 80.0),
                        child: Container(
                          width: 750.0,
                          height: 100.0,
                          decoration: BoxDecoration(),
                          child: Align(
                            alignment: AlignmentDirectional(0.0, 1.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                StreamBuilder<List<GameSessionDataRecord>>(
                                  stream: queryGameSessionDataRecord(
                                    singleRecord: true,
                                  ),
                                  builder: (context, snapshot) {
                                    // Customize what your widget looks like when it's loading.
                                    if (!snapshot.hasData) {
                                      return Center(
                                        child: SizedBox(
                                          width: 50.0,
                                          height: 50.0,
                                          child: CircularProgressIndicator(
                                            valueColor:
                                                AlwaysStoppedAnimation<Color>(
                                              FlutterFlowTheme.of(context)
                                                  .primary,
                                            ),
                                          ),
                                        ),
                                      );
                                    }
                                    List<GameSessionDataRecord>
                                        itsrightGameSessionDataRecordList =
                                        snapshot.data!;
                                    // Return an empty Container when the item does not exist.
                                    if (snapshot.data!.isEmpty) {
                                      return Container();
                                    }
                                    final itsrightGameSessionDataRecord =
                                        itsrightGameSessionDataRecordList
                                                .isNotEmpty
                                            ? itsrightGameSessionDataRecordList
                                                .first
                                            : null;
                                    return InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        if (FFAppState().answeredQuestion) {
                                          context.pushNamed(
                                            'play_1',
                                            extra: <String, dynamic>{
                                              kTransitionInfoKey:
                                                  TransitionInfo(
                                                hasTransition: true,
                                                transitionType:
                                                    PageTransitionType.fade,
                                                duration:
                                                    Duration(milliseconds: 0),
                                              ),
                                            },
                                          );
                                        } else {
                                          setState(() {
                                            FFAppState().answeredQuestion =
                                                true;
                                            FFAppState().numTrialsDone =
                                                FFAppState().numTrialsDone + 1;
                                          });
                                          if (FFAppState().curProblemIndex >
                                              FFAppState().desiredTrialNum) {
                                            FFAppState().numTrialsDone =
                                                FFAppState().numTrialsDone - 1;
                                          }
                                          if (FFAppState()
                                              .problemInfo
                                              .isRight) {
                                            setState(() {
                                              FFAppState().QuestionFinish =
                                                  getCurrentTimestamp;
                                              FFAppState()
                                                      .QuestionFirstResponse =
                                                  getCurrentTimestamp;
                                              FFAppState().curProblemIndex =
                                                  FFAppState().curProblemIndex +
                                                      1;
                                              FFAppState().gotQuestionCorrect =
                                                  true;
                                              FFAppState().numCorrect =
                                                  FFAppState().numCorrect + 1;
                                            });

                                            await _model.newLog!.reference
                                                .update(
                                                    createProblemLogsRecordData(
                                              correct: 1,
                                              firstResponseTime:
                                                  functions.getTimeDifference(
                                                      FFAppState()
                                                          .QuestionStart,
                                                      FFAppState()
                                                          .QuestionFirstResponse),
                                            ));

                                            await _model.newLog!.parentReference
                                                .update({
                                              'numCorrect':
                                                  FieldValue.increment(1),
                                              'numQuestionsAnswered':
                                                  FieldValue.increment(1),
                                              'sessionResponseTime':
                                                  FieldValue.increment(functions
                                                      .getTimeDifference(
                                                          FFAppState()
                                                              .QuestionStart,
                                                          FFAppState()
                                                              .QuestionFinish)!),
                                            });
                                          } else {
                                            if (FFAppState().curProblemIndex <
                                                FFAppState()
                                                    .numInitialQuestions) {
                                              setState(() {
                                                FFAppState().addToSessionQuestions(
                                                    FFAppState()
                                                            .sessionQuestions[
                                                        FFAppState()
                                                            .curProblemIndex]);
                                              });
                                            }
                                            setState(() {
                                              FFAppState()
                                                      .QuestionFirstResponse =
                                                  getCurrentTimestamp;
                                              FFAppState().curProblemIndex =
                                                  FFAppState().curProblemIndex +
                                                      1;
                                              FFAppState().gotQuestionCorrect =
                                                  false;
                                            });
                                            if (animationsMap[
                                                    'itswrongOnActionTriggerAnimation'] !=
                                                null) {
                                              await animationsMap[
                                                      'itswrongOnActionTriggerAnimation']!
                                                  .controller
                                                ..reset()
                                                ..repeat(reverse: true);
                                            }

                                            await _model.newLog!.reference
                                                .update(
                                                    createProblemLogsRecordData(
                                              correct: 0,
                                              firstResponseTime:
                                                  functions.getTimeDifference(
                                                      FFAppState()
                                                          .QuestionStart,
                                                      FFAppState()
                                                          .QuestionFirstResponse),
                                            ));

                                            await _model.newLog!.parentReference
                                                .update({
                                              'numQuestionsAnswered':
                                                  FieldValue.increment(1),
                                              'sessionResponseTime':
                                                  FieldValue.increment(functions
                                                      .getTimeDifference(
                                                          FFAppState()
                                                              .QuestionStart,
                                                          FFAppState()
                                                              .QuestionFirstResponse)!),
                                            });
                                          }
                                        }
                                      },
                                      child: wrapWithModel(
                                        model: _model.itsrightModel,
                                        updateCallback: () => setState(() {}),
                                        child: ItsrightWidget(),
                                      ),
                                    ).animateOnActionTrigger(
                                      animationsMap[
                                          'itsrightOnActionTriggerAnimation']!,
                                    );
                                  },
                                ),
                                StreamBuilder<List<GameSessionDataRecord>>(
                                  stream: queryGameSessionDataRecord(
                                    singleRecord: true,
                                  ),
                                  builder: (context, snapshot) {
                                    // Customize what your widget looks like when it's loading.
                                    if (!snapshot.hasData) {
                                      return Center(
                                        child: SizedBox(
                                          width: 50.0,
                                          height: 50.0,
                                          child: CircularProgressIndicator(
                                            valueColor:
                                                AlwaysStoppedAnimation<Color>(
                                              FlutterFlowTheme.of(context)
                                                  .primary,
                                            ),
                                          ),
                                        ),
                                      );
                                    }
                                    List<GameSessionDataRecord>
                                        itswrongGameSessionDataRecordList =
                                        snapshot.data!;
                                    // Return an empty Container when the item does not exist.
                                    if (snapshot.data!.isEmpty) {
                                      return Container();
                                    }
                                    final itswrongGameSessionDataRecord =
                                        itswrongGameSessionDataRecordList
                                                .isNotEmpty
                                            ? itswrongGameSessionDataRecordList
                                                .first
                                            : null;
                                    return InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        if (FFAppState().answeredQuestion) {
                                          context.pushNamed(
                                            'play_1',
                                            extra: <String, dynamic>{
                                              kTransitionInfoKey:
                                                  TransitionInfo(
                                                hasTransition: true,
                                                transitionType:
                                                    PageTransitionType.fade,
                                                duration:
                                                    Duration(milliseconds: 0),
                                              ),
                                            },
                                          );
                                        } else {
                                          setState(() {
                                            FFAppState().answeredQuestion =
                                                true;
                                            FFAppState().numTrialsDone =
                                                FFAppState().numTrialsDone + 1;
                                          });
                                          if (FFAppState().curProblemIndex >
                                              FFAppState().desiredTrialNum) {
                                            FFAppState().numTrialsDone =
                                                FFAppState().numTrialsDone - 1;
                                          }
                                          if (!FFAppState()
                                              .problemInfo
                                              .isRight) {
                                            setState(() {
                                              FFAppState().QuestionFinish =
                                                  getCurrentTimestamp;
                                              FFAppState()
                                                      .QuestionFirstResponse =
                                                  getCurrentTimestamp;
                                              FFAppState().curProblemIndex =
                                                  FFAppState().curProblemIndex +
                                                      1;
                                              FFAppState().gotQuestionCorrect =
                                                  true;
                                              FFAppState().numCorrect =
                                                  FFAppState().numCorrect + 1;
                                            });

                                            await _model.newLog!.reference
                                                .update(
                                                    createProblemLogsRecordData(
                                              correct: 1,
                                              firstResponseTime:
                                                  functions.getTimeDifference(
                                                      FFAppState()
                                                          .QuestionStart,
                                                      FFAppState()
                                                          .QuestionFirstResponse),
                                            ));

                                            await _model.newLog!.parentReference
                                                .update({
                                              'numCorrect':
                                                  FieldValue.increment(1),
                                              'numQuestionsAnswered':
                                                  FieldValue.increment(1),
                                              'sessionResponseTime':
                                                  FieldValue.increment(functions
                                                      .getTimeDifference(
                                                          FFAppState()
                                                              .QuestionStart,
                                                          FFAppState()
                                                              .QuestionFinish)!),
                                            });
                                          } else {
                                            if (FFAppState().curProblemIndex <
                                                FFAppState()
                                                    .numInitialQuestions) {
                                              setState(() {
                                                FFAppState().addToSessionQuestions(
                                                    FFAppState()
                                                            .sessionQuestions[
                                                        FFAppState()
                                                            .curProblemIndex]);
                                              });
                                            }
                                            setState(() {
                                              FFAppState()
                                                      .QuestionFirstResponse =
                                                  getCurrentTimestamp;
                                              FFAppState().curProblemIndex =
                                                  FFAppState().curProblemIndex +
                                                      1;
                                              FFAppState().gotQuestionCorrect =
                                                  false;
                                            });
                                            if (animationsMap[
                                                    'itsrightOnActionTriggerAnimation'] !=
                                                null) {
                                              await animationsMap[
                                                      'itsrightOnActionTriggerAnimation']!
                                                  .controller
                                                ..reset()
                                                ..repeat(reverse: true);
                                            }

                                            await _model.newLog!.reference
                                                .update(
                                                    createProblemLogsRecordData(
                                              correct: 0,
                                              firstResponseTime:
                                                  functions.getTimeDifference(
                                                      FFAppState()
                                                          .QuestionStart,
                                                      FFAppState()
                                                          .QuestionFirstResponse),
                                            ));

                                            await _model.newLog!.parentReference
                                                .update({
                                              'numQuestionsAnswered':
                                                  FieldValue.increment(1),
                                              'sessionResponseTime':
                                                  FieldValue.increment(functions
                                                      .getTimeDifference(
                                                          FFAppState()
                                                              .QuestionStart,
                                                          FFAppState()
                                                              .QuestionFirstResponse)!),
                                            });
                                          }
                                        }
                                      },
                                      child: wrapWithModel(
                                        model: _model.itswrongModel,
                                        updateCallback: () => setState(() {}),
                                        child: ItswrongWidget(),
                                      ),
                                    ).animateOnActionTrigger(
                                      animationsMap[
                                          'itswrongOnActionTriggerAnimation']!,
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(1.11, 1.21),
                      child: Container(
                        width: 225.0,
                        height: 300.0,
                        decoration: BoxDecoration(),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.asset(
                            'assets/images/${FFAppState().curAnimal2}.png',
                            width: 300.0,
                            height: 200.0,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(-1.11, 1.21),
                      child: Container(
                        width: 225.0,
                        height: 300.0,
                        decoration: BoxDecoration(),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.asset(
                            'assets/images/${FFAppState().curAnimal1}.png',
                            width: 300.0,
                            height: 300.0,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      height: 250.0,
                      decoration: BoxDecoration(),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.asset(
                          'assets/images/Line.png',
                          width: double.infinity,
                          height: 200.0,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(-0.25, -0.38),
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
                              Transform.rotate(
                                angle: 0.0698,
                                child: wrapWithModel(
                                  model: _model.lanternModel1,
                                  updateCallback: () => setState(() {}),
                                  child: LanternWidget(
                                    lanternValue: FFAppState().problemInfo.num2,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(-0.75, -0.49),
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
                              Transform.rotate(
                                angle: 0.2269,
                                child: wrapWithModel(
                                  model: _model.lanternModel2,
                                  updateCallback: () => setState(() {}),
                                  child: LanternWidget(
                                    lanternValue: FFAppState().problemInfo.num1,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(0.75, -0.55),
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
                              Transform.rotate(
                                angle: 6.0214,
                                child: wrapWithModel(
                                  model: _model.lanternModel3,
                                  updateCallback: () => setState(() {}),
                                  child: LanternWidget(
                                    lanternValue: FFAppState().problemInfo.num4,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(0.25, -0.41),
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
                              Transform.rotate(
                                angle: 6.161,
                                child: wrapWithModel(
                                  model: _model.lanternModel4,
                                  updateCallback: () => setState(() {}),
                                  child: LanternWidget(
                                    lanternValue: FFAppState().problemInfo.num3,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Align(
                        alignment: AlignmentDirectional(0.0, -1.0),
                        child: Padding(
                          padding:
                              EdgeInsetsDirectional.fromSTEB(0.0, 30, 0.0, 0.0),
                          child: Container(
                            width: double.infinity,
                            height: 105,
                            decoration: BoxDecoration(),
                            child: Stack(children: [
                              Align(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: ClipRRect(
                                    borderRadius: BorderRadius.circular(8.0),
                                    child: Image.asset(
                                      'assets/images/Group_6094.png',
                                      width: double.infinity,
                                      height: double.infinity,
                                      fit: BoxFit.contain,
                                    )),
                              ),
                              // Right or Wrong Question widget and alignment
                              Align(
                                alignment: AlignmentDirectional(0, 0),
                                child: Text(
                                  'Is the order right or wrong?',
                                  textAlign: TextAlign.center,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Comic Sans',
                                        color: Color(0xFF4D4D4D),
                                        fontSize: 34.0,
                                        fontWeight: FontWeight.bold,
                                        useGoogleFonts: false,
                                      ),
                                ),
                              ),
                            ]),
                          ),
                        )),
                    if (FFAppState().answeredQuestion)
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                        child: wrapWithModel(
                          model: _model.feedbackTextModel,
                          updateCallback: () => setState(() {}),
                          child: FeedbackTextWidget(),
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
