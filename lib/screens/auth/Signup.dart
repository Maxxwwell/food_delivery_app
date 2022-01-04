// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:food_delivery_app/constants/colors.dart';
import 'package:food_delivery_app/screens/auth/Login.dart';
import 'package:food_delivery_app/widgets/BottomTabs.dart';
import 'package:page_transition/page_transition.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
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

  String? fullName;
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
        backgroundColor: AppColors.lightgrey,
        resizeToAvoidBottomInset: false,
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 25),
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
                      top: MediaQuery.of(context).size.height * 0.09,
                    ),
                    child: Column(
                      children: const [
                        Text(
                          'Hello!',
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          "Signup to get started",
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
                          key: const ValueKey('full name'),
                          onSaved: (value) {
                            fullName = value;
                          },
                          validator: (value) {
                            if (value!.isEmpty ||
                                !value.contains(" ") ||
                                value.length < 6) {
                              return 'Please enter your full name.';
                            }
                            return null;
                          },
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                            hintText: 'Full name',
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
                          key: const ValueKey('email'),
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
                          key: const ValueKey('password'),
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
                              "Sing up",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: AppColors.white,
                              ),
                            ),
                      onPressed: () {
                        print(fullName);
                        print(email);
                        print(password);
                        // toHomeScreen();
                        submit();
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
                        const Text(
                          "___  ",
                          style: TextStyle(
                            color: AppColors.grey,
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 10),
                          child: const Text("or continue with"),
                        ),
                        const Text(
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
                            side: const BorderSide(
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
                            side: const BorderSide(
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
                    padding: const EdgeInsets.only(top: 50),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Already have an account? ",
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
                                child: const LoginPage(),
                              ),
                            );
                          },
                          child: const Text(
                            "Sign in",
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
