import 'dart:async';

import 'package:demoapp/Constants/AppConstants.dart';
import 'package:demoapp/Screens/LoginScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late bool _isAnimate = false;
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(microseconds: 500), () {
      setState(() => _isAnimate = true);
    });

    Future.delayed(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const LoginScreen()));
    });

    //   if (FirebaseServices.auth.currentUser != null) {
    //     Navigator.pushReplacement(
    //         context, MaterialPageRoute(builder: (_) => const HomeScreen()));
    //   } else {
    //     Navigator.pushReplacement(
    //         context, MaterialPageRoute(builder: (_) => const LoginScreen()));
    //   }
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kprimaryColor[200],
      body: Stack(children: [
        AnimatedPositioned(
            duration: const Duration(seconds: 2),
            left: 12.w,
            top: _isAnimate ? 25.h : -40.h,
            width: 80.w,
            child: Image.asset('Assets/klipartz.com.png')),
        AnimatedPositioned(
            duration: const Duration(seconds: 2),
            right: 15.w,
            bottom: _isAnimate ? 25.h : -40.h,
            // width: 80.w,
            child: Text(
              'Welcome',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 25.dp,
                  fontWeight: FontWeight.bold),
            )),
      ]),
    );
  }
}
