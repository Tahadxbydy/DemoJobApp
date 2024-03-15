import 'package:demoapp/Screens/HomeScreen.dart';
import 'package:demoapp/Utils/SnackBars.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../Screens/SignUpScreen.dart';

class FirebaseAuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  void registerWithEmailAndPassword(
      String email, String password, BuildContext context) async {
    showProgressBar(context);
    try {
      await _auth
          .createUserWithEmailAndPassword(
        email: email,
        password: password,
      )
          .then((value) {
        if (value.user != null) {
          Navigator.of(context).pop();
          Navigator.pushNamedAndRemoveUntil(
              context, HomeScreen.routename, (route) => false);
        } else {
          Navigator.of(context).pop();
          throw Exception('could not find the user');
        }
      });
    } catch (error) {
      print("Error registering user: $error");
      errorSnackbar(context, "Error registering user: $error");
      Navigator.of(context).pop();
      return null;
    }
  }

  void signInWithEmailAndPassword(
      String email, String password, BuildContext context) async {
    showProgressBar(context);
    try {
      await _auth
          .signInWithEmailAndPassword(
        email: email,
        password: password,
      )
          .then((value) {
        if (value.user != null) {
          Navigator.of(context).pop();
          Navigator.pushReplacementNamed(context, HomeScreen.routename);
        } else {
          Navigator.of(context).pop();
          throw Exception('could not find the user');
        }
      });
    } catch (error) {
      print("Error signing in: $error");
      errorSnackbar(context, "Error registering user: $error");
      Navigator.of(context).pop();
      return null;
    }
  }
}
