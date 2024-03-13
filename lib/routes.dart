import 'package:demoapp/Screens/LoginScreen.dart';
import 'package:demoapp/Screens/SignUpScreen.dart';
import 'package:flutter/material.dart';

import 'Screens/HomeScreen.dart';

Map<String, WidgetBuilder> namedRoutes = {

  LoginScreen.routename: (context) => LoginScreen(),
  SignupScreen.routename: (context) => SignupScreen(),
  HomeScreen.routename: (context) => HomeScreen(),

};