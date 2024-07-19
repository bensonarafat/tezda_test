import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:tezda_test/firebase_options.dart';

abstract class BaseService {
  static const dbRefUsers = "users";

  static bool _hasInitialized =
      false; // whether the firebase connection has been initialized
  static late final FirebaseFirestore fireStore;
  static late final FirebaseAuth auth;

  /// initialized - This function initializes the following Firebase services: FirebaseFirestore - database,
  /// FirebaseStorage - static file storage, FirebaseForEmulator (if required), and FirebaseAuth.
  static initialized() async {
    if (!_hasInitialized) {
      await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      );
      fireStore = FirebaseFirestore.instance;
      auth = FirebaseAuth.instance;
      _hasInitialized = true;
    }
  }
}
