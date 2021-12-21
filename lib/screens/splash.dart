import 'package:flutter/material.dart';
import 'package:food_delivery_app/constants/colors.dart';
import 'package:food_delivery_app/screens/auth/Login.dart';
import 'package:food_delivery_app/screens/auth/Signup.dart';
import 'package:page_transition/page_transition.dart';

import 'Home.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  void toHomeScreen() {
    Future.delayed(
      const Duration(seconds: 2),
      () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (_) => const HomePage(),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fitHeight,
            image: AssetImage(
              'assets/images/sp.JPG',
            ),
          ),
        ),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          margin: EdgeInsets.only(
            top: MediaQuery.of(context).size.height - 230,
          ),
          child: Column(
            children: [
              const Text(
                'Enjoy delicious meals right now 😋',
                style: TextStyle(
                    color: AppColors.white,
                    fontSize: 35,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.05),
              MaterialButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    PageTransition(
                      duration: const Duration(milliseconds: 150),
                      reverseDuration: const Duration(milliseconds: 1),
                      type: PageTransitionType.rightToLeft,
                      child: const LoginPage(),
                    ),
                  );
                },
                splashColor: AppColors.lightOrange,
                height: MediaQuery.of(context).size.height * 0.08,
                minWidth: double.infinity,
                color: AppColors.orange,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child:  const Text(
                        "Login",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: AppColors.white,
                        ),
                      ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.03),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Don't have an account? ",
                    style: TextStyle(
                      color: AppColors.white,
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        PageTransition(
                          duration: const Duration(milliseconds: 120),
                          reverseDuration: const Duration(milliseconds: 1),
                          type: PageTransitionType.bottomToTop,
                          child: const SignupPage(),
                        ),
                      );
                    },
                    child: const Text(
                      "Signup",
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                        color: AppColors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
