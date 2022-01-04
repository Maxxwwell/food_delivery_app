// ignore_for_file: prefer_const_constructors, file_names

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:food_delivery_app/constants/colors.dart';
import 'package:food_delivery_app/screens/auth/Signup.dart';
import 'package:food_delivery_app/widgets/BottomTabs.dart';
import 'package:page_transition/page_transition.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // @override
  // void initState() {
  //   super.initState();
  //   // Colored status bar
  //   SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
  //     statusBarColor: AppColors.orange,
  //   ));
  // }

  void submit() {
    final isValid = _formKey.currentState!.validate();

    if (isValid) {
      _formKey.currentState!.save();
    }
  }

  String? email;
  String? password;
  bool isPressed = false;
  bool viewPassword = false;

  final _formKey = GlobalKey<FormState>();

  void toHomeScreen() {
    Future.delayed(
      const Duration(seconds: 2),
      () {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (_) => const BottomTabs()),
            (route) => false);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: AppColors.lightgrey,
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 25),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: AnimationLimiter(
            child: Column(
              children: AnimationConfiguration.toStaggeredList(
                childAnimationBuilder: (widget) => SlideAnimation(
                  horizontalOffset: 60,
                  child: FadeInAnimation(
                    child: widget,
                  ),
                ),
                children: [
                  Container(
                    margin: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.12,
                    ),
                    child: Column(
                      children: const [
                        Text(
                          'Hello Again!',
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          "Welcome back you've ",
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          "been missed!",
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),

                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        SizedBox(
                            height: MediaQuery.of(context).size.height * 0.03),
                        TextFormField(
                          key: const ValueKey('login email address'),
                          onSaved: (value) {
                            email = value;
                          },
                          validator: (value) {
                            if (value!.isEmpty ||
                                !value.contains("@") ||
                                !value.contains(".") ||
                                value.length < 7) {
                              return 'Please enter a valid email address.';
                            }
                            return null;
                          },
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                            hintText: 'Email address',
                            filled: true,
                            fillColor: AppColors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide:
                                  const BorderSide(color: AppColors.white),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide:
                                  const BorderSide(color: AppColors.white),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide:
                                  const BorderSide(color: AppColors.white),
                            ),
                          ),
                        ),
                        const SizedBox(height: 15),
                        TextFormField(
                          key: const ValueKey('loggin password'),
                          onSaved: (value) {
                            password = value;
                          },
                          validator: (value) {
                            if (value!.isEmpty || value.length < 7) {
                              return 'Password must be at least 7 characters';
                            }
                            return null;
                          },
                          obscureText: viewPassword,
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                            hintText: 'Password',
                            filled: true,
                            fillColor: AppColors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide:
                                  const BorderSide(color: AppColors.white),
                            ),
                            suffixIcon: GestureDetector(
                              onTap: () {
                                setState(() {
                                  viewPassword = !viewPassword;
                                });
                              },
                              child: Icon(
                                  viewPassword == true
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                  color: AppColors.orange),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide:
                                  const BorderSide(color: AppColors.white),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide:
                                  const BorderSide(color: AppColors.white),
                            ),
                          ),
                        ),
                        ListTile(
                          trailing: MaterialButton(
                              splashColor: AppColors.lightgrey,
                              onPressed: () {},
                              child: Text("Forgot Password?")),
                        )
                      ],
                    ),
                  ),
                  //<____________________________________________________>
                  Container(
                    margin: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.03),
                    child: MaterialButton(
                      splashColor: AppColors.lightOrange,
                      height: MediaQuery.of(context).size.height * 0.08,
                      minWidth: double.infinity,
                      color: AppColors.orange,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: isPressed
                          ? const SpinKitFadingCircle(
                              color: Colors.white,
                              size: 28.0,
                            )
                          : const Text(
                              "Sign in",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: AppColors.white,
                              ),
                            ),
                      onPressed: () {
                        // toHomeScreen();
                        // setState(() {
                        //   isPressed = !isPressed;
                        // });
                      },
                    ),
                  ),

                  ListTile(
                    contentPadding: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width * 0.2),
                    title: Row(
                      children: [
                        Text(
                          "___  ",
                          style: TextStyle(
                            color: AppColors.grey,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 10),
                          child: Text("or continue with"),
                        ),
                        Text(
                          "  ___",
                          style: TextStyle(
                            color: AppColors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width * 0.16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        MaterialButton(
                          height: MediaQuery.of(context).size.height * 0.08,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                            side: BorderSide(
                              color: AppColors.white,
                              width: 2.5,
                            ),
                          ),
                          minWidth: 70,
                          onPressed: () {},
                          child: Image.asset(
                            "assets/icons/google.png",
                            height: 40,
                          ),
                        ),
                        MaterialButton(
                          height: MediaQuery.of(context).size.height * 0.08,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                            side: BorderSide(
                              color: AppColors.white,
                              width: 2.5,
                            ),
                          ),
                          minWidth: 70,
                          onPressed: () {},
                          child: Image.asset(
                            "assets/icons/facebook.png",
                            height: 40,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 50),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Don't have an account? ",
                          style: TextStyle(
                            color: AppColors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              PageTransition(
                                duration: const Duration(milliseconds: 150),
                                reverseDuration:
                                    const Duration(milliseconds: 1),
                                type: PageTransitionType.rightToLeft,
                                child: const SignupPage(),
                              ),
                            );
                          },
                          child: const Text(
                            "Signup",
                            style: TextStyle(
                              color: AppColors.blue,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
