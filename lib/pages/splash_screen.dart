import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:travel_app/data/app_routes/app_routes.dart';
import 'package:travel_app/data/resourses/colors.dart';
import 'package:travel_app/widgets/divider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  var shouldAnimate = false;
  void animationState(bool shouldAnimate) {
    setState(() {
      this.shouldAnimate = shouldAnimate;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (!shouldAnimate) startAnimation();
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          clipBehavior: Clip.hardEdge,
          children: [
            Positioned(
              top: 0,
              bottom: 0,
              left: 0,
              right: 0,
              child: Image.asset(
                "assets/images/splash_image.png",
                fit: BoxFit.fill,
              ),
            ),
            AnimatedPositioned(
              duration: const Duration(
                milliseconds: 1000,
              ),
              left: 29,
              top: shouldAnimate ? 46 : -20,
              child: const Text(
                "Let's GO!",
                style: TextStyle(
                  color: Color(
                    AppColors.splashText1,
                  ),
                  fontFamily: "Roboto",
                  letterSpacing: 1.2,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
              curve: Curves.ease,
            ),
            AnimatedPositioned(
              duration: const Duration(
                milliseconds: 1000,
              ),
              top: 76,
              left: shouldAnimate ? 0 : -230,
              child: const AppDivider(
                Color(AppColors.dividerColor),
              ),
              curve: Curves.easeInExpo,
            ),
            AnimatedPositioned(
              duration: const Duration(
                milliseconds: 1000,
              ),
              left: 27,
              top: shouldAnimate ? 94 : -120,
              right: 100,
              child: RichText(
                text: const TextSpan(
                  text: "Hello,\n",
                  style: TextStyle(
                    color: Color(AppColors.splashText2),
                    fontSize: 45,
                    fontFamily: "PlayfairDisplay",
                  ),
                  children: [
                    TextSpan(
                      text: "Leonard!",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 45,
                        fontFamily: "PlayfairDisplay",
                      ),
                    ),
                  ],
                ),
              ),
              curve: Curves.ease,
            ),
            AnimatedPositioned(
              duration: const Duration(
                milliseconds: 1000,
              ),
              child: getButton(context),
              bottom: shouldAnimate ? 37 : -74,
              left: 18,
              right: 18,
              curve: Curves.ease,
            )
          ],
        ),
      ),
    );
  }

  Widget getButton(BuildContext context) {
    return InkWell(
      child: Container(
        width: double.infinity,
        height: 74,
        alignment: Alignment.center,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                "assets/images/splash_button.png",
              ),
              fit: BoxFit.fill),
        ),
        child: const Text(
          "EXPLORE",
          style: TextStyle(
            fontSize: 18,
            color: Colors.white,
            letterSpacing: 1.2,
            fontFamily: "Roboto",
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      onTap: () {
        Navigator.pushNamed(
          context,
          AppRoutes.EntranceScreen,
        );
      },
    );
  }

  void startAnimation() async {
    await Future.delayed(
      const Duration(milliseconds: 100),
    );
    animationState(true);
  }
}
