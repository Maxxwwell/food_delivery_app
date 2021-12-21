import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:food_delivery_app/constants/colors.dart';

import 'Home.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool isPressed = false;

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
          padding: const EdgeInsets.symmetric(horizontal: 20),
          margin: EdgeInsets.only(
            top: MediaQuery.of(context).size.height - 250,
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
                  toHomeScreen();

                  setState(() {
                    isPressed = !isPressed;
                  });
                },
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
                        "Login",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: AppColors.white,
                        ),
                      ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
              Row(
                children: [
                  const Text(
                    "Don't have an account? ",
                    style: TextStyle(
                      color: AppColors.white,
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      print("signup pressed");
                    },
                    child: const Text(
                      "Signup",
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                        color: AppColors.white,
                        fontSize: 17,
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
