import 'package:demoapp/Utils/FireBaseServices..dart';
import 'package:demoapp/Utils/Validators.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';

import '../TrapiiziumContainer.dart';
import '../Constants/AppConstants.dart';
import 'HomeScreen.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});
  static const routename = 'SignupScreen';

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _passwordConirmController =
      TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  bool _visibility = false;
  bool _visibility2 = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: SingleChildScrollView(
          child: Form(
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
                        child: CircleAvatar(
                          radius: 10.w,
                          backgroundColor: kprimaryColor[200],
                          child: Center(
                            child: Icon(
                              Icons.person,
                              color: Colors.white,
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

                                style: const TextStyle(
                                    color: kprimaryColor), // Text color
                                cursorColor: kprimaryColor, // Cursor color
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
                            SizedBox(
                              width: 70.w,
                              child: TextFormField(
                                controller: _passwordConirmController,
                                validator: (value) {
                                  return conirmPassword(
                                      _passwordConirmController.text.trim(),
                                      _passwordController.text.trim());
                                },
                                keyboardType: TextInputType.visiblePassword,
                                style: const TextStyle(color: kprimaryColor),
                                cursorColor: kprimaryColor,
                                decoration: const InputDecoration().copyWith(
                                  prefixIcon: IconButton(
                                    icon: Icon(
                                      _visibility2
                                          ? Icons.visibility
                                          : Icons.visibility_off,
                                      color: kprimaryColor[200],
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        _visibility2 = !_visibility2;
                                      });
                                    },
                                  ),
                                  labelText: 'Confirm Password',
                                ),
                                obscureText: !_visibility2,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                          bottom: 0,
                          left: 40.w,
                          child: ElevatedButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                FirebaseAuthService()
                                    .registerWithEmailAndPassword(
                                        _emailController.text.trim(),
                                        _passwordController.text.trim(),
                                        context);
                              }
                            },
                            child: Text('Sign In'),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: kprimaryColor[200],
                              foregroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    20.0), // Adjust the value to control the corner radius
                              ),
                            ),
                          )),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      ),
    );
  }
}
