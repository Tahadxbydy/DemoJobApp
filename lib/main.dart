import 'package:demoapp/Screens/LoginScreen.dart';
import 'package:demoapp/Constants/AppConstants.dart';
import 'package:demoapp/Screens/SplashScreen.dart';
import 'package:demoapp/providers/ListProvider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:provider/provider.dart';

import 'firebase_options.dart';
import 'routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  await _initializeFirebase();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return FlutterSizer(builder: (context, orientation, screenType) {
      return ChangeNotifierProvider(
          create: (context) => ListProvider(),
          child: MaterialApp(
            title: 'Flutter Demo',
            theme: ThemeData(
              scaffoldBackgroundColor: Colors.blue[100],
              inputDecorationTheme: InputDecorationTheme(
                  labelStyle: TextStyle(color: kprimaryColor[200]),
                  filled: true,
                  fillColor: Colors.transparent, // Background color
                  border: const UnderlineInputBorder(
                    borderSide:
                        BorderSide(color: kprimaryColor), // Border color
                    // Border radius
                  ),
                  enabledBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue), // Border color
                    // Border radius
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue),
                  )),
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
              useMaterial3: true,
            ),
            routes: namedRoutes,
            home: SplashScreen(),
          ));
    });
  }
}

_initializeFirebase() async {
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
}
