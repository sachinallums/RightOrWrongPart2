import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/backend/schema/structs/index.dart';

double? getTimeDifference(
  DateTime? questionStart,
  DateTime? questionFinish,
) {
  // return the difference between two inputted date times
  if (questionStart == null || questionFinish == null) {
    return null;
  }
  return questionFinish.difference(questionStart).inMilliseconds.toDouble();
}

DocumentReference? getReferenceFromString(String? problemID) {
  DocumentReference reference = problemID as DocumentReference;
  return reference;
}

String? generateIncorrectFeedbackText(bool correctAnswer) {
  String returntext = "";
  if (correctAnswer) {
    returntext = "'It's Right'";
  } else {
    returntext = "'It's Wrong'";
  }
  return "Oops! Not quite. The correct answer is " +
      returntext +
      ". Click anywhere to continue.";
}

double getAccuracy(
  int numCorrect,
  int numQuestions,
) {
  return numCorrect / numQuestions;
}

int subtractOne(int num) {
  return num - 1;
}
