import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:lms_appf/pages/splash/view.dart';
import 'package:lottie/lottie.dart';

class AnimatedSplash extends StatelessWidget {
  const AnimatedSplash({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(splash: Column(
      children: [
        Center(
          child: LottieBuilder.asset('assets/car.gif'),
        )
      ],
    ), nextScreen: SplashPage(),
    splashIconSize: 100,
    );
  }
}
