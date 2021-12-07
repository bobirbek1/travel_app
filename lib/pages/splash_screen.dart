import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:travel_app/data/colors/colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  var shouldAnimate = false;
  Timer? _timer;

  void animationState(bool shouldAnimate, Timer timer) {
    setState(() {
      this.shouldAnimate = shouldAnimate;
      timer.cancel();
    });
  }

  @override
  Widget build(BuildContext context) {
    if (!shouldAnimate) setTimer();
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
              width: shouldAnimate ? 310 : 0,
              child: getDivider(),
              onEnd: () {},
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
              child: getButton(),
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

  Widget getDivider() {
    return Row(
      children: [
        Expanded(
          flex: 15,
          child: Container(
            width: 213,
            height: 1,
            color: const Color(
              AppColors.dividerColor,
            ),
          ),
        ),
        Expanded(
          flex: 5,
          child: Container(
            width: 44,
            height: 1,
            margin: const EdgeInsets.only(
              left: 12,
            ),
            color: const Color(
              AppColors.dividerColor,
            ),
          ),
        ),
        Expanded(
          flex: 3,
          child: Container(
            width: 25,
            height: 1,
            margin: const EdgeInsets.only(
              left: 12,
            ),
            color: const Color(
              AppColors.dividerColor,
            ),
          ),
        ),
      ],
    );
  }

  Widget getButton() {
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
      onTap: () => {},
    );
  }

  void setTimer() {
    var counter = 0;
    _timer = Timer.periodic(
      const Duration(milliseconds: 500,),
      (Timer timer) {
        if (counter == 1) {
          animationState(true, timer);
        }
        counter++;
      },
    );
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}
