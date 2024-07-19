import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // State change Listener - stream of user objects - changes depending on auth state changes (user logs in / out)
  // E.g. Emits a user object whenever the user logs in / out
  Stream<User?> get onAuthStateChanged => _auth.authStateChanges();

  // Sign in with email and password.
  Future<UserCredential> authenticateWithFireAuth(
      String email, String password) async {
    try {
      UserCredential userCred = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      return Future(() => userCred);
    } catch (_) {
      throw Exception("Error Login");
    }
  }

  // Sending email verification.
  Future sendMail() async {
    if (_auth.currentUser != null) {
      return _auth.currentUser!.sendEmailVerification();
    } else {
      return Future.error("You are not logged in. Please login again.");
    }
  }

  Future<User?> currentFirebaseUser() async {
    try {
      await _auth.currentUser?.reload();
    } catch (err) {
      return null;
    }
    return _auth.currentUser;
  }

  // Sign out.
  Future signOut() async {
    try {
      await _auth.signOut();
      return true;
    } catch (e) {
      log(e.toString());
      return false;
    }
  }

  Future<User?> register(String email, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      await result.user?.sendEmailVerification();
      return result.user;
    } on FirebaseAuthException catch (e) {
      throw Exception(e.message ?? "");
    }
  }
}
