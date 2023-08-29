import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyBNEH79xbjaksXp8JbeBL9qo-sQyZ-vWrU",
            authDomain: "rightorwrongp2.firebaseapp.com",
            projectId: "rightorwrongp2",
            storageBucket: "rightorwrongp2.appspot.com",
            messagingSenderId: "205290426477",
            appId: "1:205290426477:web:87bb035e4bb61e165fef64"));
  } else {
    await Firebase.initializeApp();
  }
}
