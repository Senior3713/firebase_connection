import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

sealed class AuthService {
  static FirebaseAuth get auth  => FirebaseAuth.instance;


  static Future<bool> signUp(String email, String password) async {
    try {
      final credential = await auth.createUserWithEmailAndPassword(email: email, password: password);
      return credential.user != null;
    } catch(e) {
      debugPrint("Error: $e");
      return false;
    }
  }

  static Future<User?> signIn(String email, String password) async{
    try {
      final credential = await auth.signInWithEmailAndPassword(email: email, password: password);
      return credential.user;
    } catch (e) {
      debugPrint("Error: $e");
    }
    return null;
  }
}
