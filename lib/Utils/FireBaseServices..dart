import 'package:demoapp/Utils/SnackBars.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class FirebaseAuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<String?> registerWithEmailAndPassword(
      String email, String password, BuildContext context) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return result.user!.uid;
    } catch (error) {
      print("Error registering user: $error");
      errorSnackbar(context, "Error registering user: $error");
      return null;
    }
  }

  Future<String?> signInWithEmailAndPassword(
      String email, String password, BuildContext context) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return result.user!.uid;
    } catch (error) {
      print("Error signing in: $error");
      errorSnackbar(context, "Error registering user: $error");
      return null;
    }
  }
}
