import 'dart:ffi';

import 'package:demoapp/Screens/HomeScreen.dart';
import 'package:demoapp/Screens/SignUpScreen.dart';
import 'package:demoapp/Utils/FireBaseServices..dart';
import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';

import '../TrapiiziumContainer.dart';
import '../Utils/Validators.dart';
import '../Constants/AppConstants.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  static const routename = 'LoginScreen';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _passwordController = TextEditingController();

  final TextEditingController _emailController = TextEditingController();
  bool _visibility = false;

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: SingleChildScrollView(
          child: Form(
            canPop: false,
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    top: 10.h,
                  ),
                  child: Image.asset(
                    'Assets/klipartz.com.png',
                    height: 16.h,
                  ),
                ),
                SizedBox(
                  height: 65.h,
                  child: Stack(
                    children: [
                      TrapeziumContainer(),
                      Positioned(
                        top: 6.h,
                        left: 40.w,
                        child: Container(
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                  blurRadius: 10,
                                  color: Colors.white70,
                                  spreadRadius: 5)
                            ],
                          ),
                          child: CircleAvatar(
                            radius: 10.w,
                            backgroundColor: kprimaryColor[200],
                            child: const Center(
                              child: Icon(
                                Icons.person,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 25.h,
                        left: 15.w,
                        child: Column(
                          children: [
                            SizedBox(
                              width: 70.w,
                              child: TextFormField(
                                controller: _emailController,
                                validator: (value) {
                                  return isValidEmail(value);
                                },
                                keyboardType: TextInputType.emailAddress,
                                style: const TextStyle(color: kprimaryColor),
                                cursorColor: kprimaryColor,
                                decoration: const InputDecoration().copyWith(
                                  prefixIcon: Icon(
                                    Icons.email,
                                    color: kprimaryColor[200],
                                  ),
                                  labelText: 'Email',
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 2.h,
                            ),
                            SizedBox(
                              width: 70.w,
                              child: TextFormField(
                                controller: _passwordController,
                                validator: (value) {
                                  return validatePassword(value);
                                },
                                keyboardType: TextInputType.visiblePassword,
                                style: const TextStyle(color: kprimaryColor),
                                cursorColor: kprimaryColor,
                                decoration: const InputDecoration().copyWith(
                                  prefixIcon: IconButton(
                                    icon: Icon(
                                      _visibility
                                          ? Icons.visibility
                                          : Icons.visibility_off,
                                      color: kprimaryColor[200],
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        _visibility = !_visibility;
                                      });
                                    },
                                  ),
                                  labelText: 'Password',
                                ),
                                obscureText: !_visibility,
                              ),
                            ),
                            SizedBox(
                              height: 2.h,
                            ),
                            // const Align(
                            //     alignment: Alignment.bottomRight,
                            //     child: Text(
                            //       'ForgotPassword',
                            //     ))
                          ],
                        ),
                      ),
                      Positioned(
                          bottom: 0,
                          left: 36.w,
                          child: Container(
                            height: 5.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.w),
                              color: Colors.white,
                              shape: BoxShape.rectangle,
                              boxShadow: [
                                BoxShadow(
                                    blurRadius: 10,
                                    color: Colors.white,
                                    spreadRadius: 5)
                              ],
                            ),
                            child: ElevatedButton(
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  FirebaseAuthService()
                                      .signInWithEmailAndPassword(
                                          _emailController.text.trim(),
                                          _passwordController.text.trim(),
                                          context);
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: kprimaryColor[200],
                                foregroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                              ),
                              child: Text('Login In'),
                            ),
                          )),
                    ],
                  ),
                ),
                SizedBox(
                  height: 1.h,
                ),
                TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, SignupScreen.routename);
                    },
                    child: const Text(
                      'Sign Up',
                      style: TextStyle(color: kprimaryColor),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
