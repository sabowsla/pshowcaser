import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pshowcaser/firebase_options.dart';

class Providers {
  static final firebaseInitializer = FutureProvider<FirebaseApp>((ref) async {
    return await Firebase.initializeApp(options: DefaultFirebaseOptions.web);
  });
}
