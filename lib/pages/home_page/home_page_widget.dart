import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'home_page_model.dart';
import 'package:csv/csv.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:async' show Future;
export 'home_page_model.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({Key? key}) : super(key: key);

  @override
  _HomePageWidgetState createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  late HomePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomePageModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return StreamBuilder<List<GameSessionDataRecord>>(
      stream: queryGameSessionDataRecord(
        singleRecord: true,
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
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
        List<GameSessionDataRecord> homePageGameSessionDataRecordList =
            snapshot.data!;
        // Return an empty Container when the item does not exist.
        if (snapshot.data!.isEmpty) {
          return Container();
        }
        final homePageGameSessionDataRecord =
            homePageGameSessionDataRecordList.isNotEmpty
                ? homePageGameSessionDataRecordList.first
                : null;
        return GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(_model.unfocusNode),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
            body: SafeArea(
              top: true,
              child: Container(
                width: double.infinity,
                height: double.infinity,
                decoration: BoxDecoration(),
                child: Align(
                  alignment: AlignmentDirectional(-1.0, -1.0),
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(0.0),
                        child: Image.asset(
                          'assets/images/homepageAsset.png',
                          width: double.infinity,
                          height: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(0.66, 0.75),
                        child: Container(
                          width: 504.0,
                          height: 100.0,
                          decoration: BoxDecoration(),
                          child: Align(
                            alignment: AlignmentDirectional(0.0, 0.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                FFButtonWidget(
                                  onPressed: () async {
                                    context.pushNamed('demo_1');
                                  },
                                  text: 'Demo',
                                  options: FFButtonOptions(
                                    height: 55.0,
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        24.0, 0.0, 24.0, 0.0),
                                    iconPadding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    color: Color(0xFFF0A573),
                                    textStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .override(
                                          fontFamily: 'Montserrat',
                                          color: Colors.white,
                                          fontSize: 30.0,
                                          letterSpacing: 1.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                    elevation: 3.0,
                                    borderSide: BorderSide(
                                      color: Colors.transparent,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(134.0),
                                  ),
                                ),
                                StreamBuilder<List<ProblemsRecord>>(
                                  stream: queryProblemsRecord(
                                    queryBuilder: (problemsRecord) =>
                                        problemsRecord
                                            .where('problemLevel',
                                                isEqualTo:
                                                    FFAppState().curLevel)
                                            .where('problemCycle',
                                                isEqualTo:
                                                    FFAppState().curCycle)
                                            .orderBy('referenceID'),
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
                                    List<ProblemsRecord>
                                        buttonProblemsRecordList =
                                        snapshot.data!;
                                    return FFButtonWidget(
                                      onPressed: () async {
                                        setState(() {
                                          FFAppState().sessionQuestions =
                                              buttonProblemsRecordList
                                                  .map((e) => e.reference)
                                                  .toList()
                                                  .cast<DocumentReference>();
                                        });

                                        var gameSessionDataRecordReference =
                                            GameSessionDataRecord.collection
                                                .doc();
                                        await gameSessionDataRecordReference
                                            .set(
                                                createGameSessionDataRecordData(
                                          accuracy: 0.0,
                                          numCorrect: 0,
                                          numQuestionsAnswered: 0,
                                          sessionResponseTime: 0.0,
                                          startTime: getCurrentTimestamp,
                                        ));
                                        _model.sessionDocumentReference =
                                            GameSessionDataRecord.getDocumentFromData(
                                                createGameSessionDataRecordData(
                                                  accuracy: 0.0,
                                                  numCorrect: 0,
                                                  numQuestionsAnswered: 0,
                                                  sessionResponseTime: 0.0,
                                                  startTime:
                                                      getCurrentTimestamp,
                                                ),
                                                gameSessionDataRecordReference);
                                        setState(() {
                                          FFAppState().sessionParentReference =
                                              _model.sessionDocumentReference
                                                  ?.reference;
                                          FFAppState().numInitialQuestions =
                                              FFAppState()
                                                  .sessionQuestions
                                                  .length;
                                          FFAppState().curProblemIndex = 0;
                                        });

                                        context.pushNamed(
                                          'play_1',
                                          extra: <String, dynamic>{
                                            kTransitionInfoKey: TransitionInfo(
                                              hasTransition: true,
                                              transitionType:
                                                  PageTransitionType.fade,
                                              duration:
                                                  Duration(milliseconds: 0),
                                            ),
                                          },
                                        );

                                        setState(() {});
                                      },
                                      text: 'Play',
                                      options: FFButtonOptions(
                                        height: 55.0,
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            24.0, 0.0, 24.0, 0.0),
                                        iconPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 0.0, 0.0),
                                        color: Color(0xFFF0A573),
                                        textStyle: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .override(
                                              fontFamily: 'Montserrat',
                                              color: Colors.white,
                                              fontSize: 30.0,
                                              letterSpacing: 1.0,
                                              fontWeight: FontWeight.bold,
                                            ),
                                        elevation: 3.0,
                                        borderSide: BorderSide(
                                          color: Colors.transparent,
                                          width: 0.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(134.0),
                                      ),
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),

                      // // code to export csv data
                      // ElevatedButton(
                      //   onPressed: exportData,
                      //   child: Text("Export CSV"),
                      // ),

                      Align(
                        alignment: AlignmentDirectional(-0.75, 0.0),
                        child: Container(
                          width: 350.0,
                          height: 450.0,
                          decoration: BoxDecoration(),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: Image.asset(
                              'assets/images/${FFAppState().curAnimal1}.png',
                              width: 300.0,
                              height: 200.0,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

void exportData() async {
  final CollectionReference problems =
      FirebaseFirestore.instance.collection("problems");
  final myData = await rootBundle
      .loadString("assets/iSNS_right_or_wrong_p2_lv7-6 - Sheet1.csv");

  List<List<dynamic>> csvTable = CsvToListConverter().convert(myData);
  List<List<dynamic>> data = [];
  data = csvTable;

  for (var i = 0; i < data.length; i++) {
    var record = {
      "problemID": data[i][0],
      "referenceID": data[i][1],
      "num1": data[i][2],
      "num2": data[i][3],
      "num3": data[i][4],
      "num4": data[i][5],
      "num5": data[i][6],
      "isRight": convertStringToBool(data[i][7]),
      "problemLevel": data[i][9],
      "problemCycle": data[i][10],
      "problemOptions": data[i][12],
    };
    problems.add(record);
  }
}

bool convertStringToBool(String input) {
  if (input == "TRUE") {
    return true;
  } else {
    return false;
  }
}
