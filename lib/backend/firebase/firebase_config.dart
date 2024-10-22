import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyDnXnwPuL1TpnZRotQ0v6WM4H8PUyqKDms",
            authDomain: "autonotas-ec4a9.firebaseapp.com",
            projectId: "autonotas-ec4a9",
            storageBucket: "autonotas-ec4a9.appspot.com",
            messagingSenderId: "600566659484",
            appId: "1:600566659484:web:c9840f5302b45cc9377059",
            measurementId: "G-PMFD1SX4RV"));
  } else {
    await Firebase.initializeApp();
  }
}
