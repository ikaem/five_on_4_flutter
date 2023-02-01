import 'package:firebase_core/firebase_core.dart';
import 'package:five_on_4_flutter/src/libraries/firebase/firebase_core/firebase_options.dart';

class FirebaseCoreWrapper {
  const FirebaseCoreWrapper();

  Future<void> initializeFirebase() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  }
}
