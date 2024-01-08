import 'package:another_flutter_splash_screen/another_flutter_splash_screen.dart';
import 'package:db_example/constants/project_durations.dart';
import 'package:db_example/constants/project_colors.dart';
import 'package:db_example/utils/lottie_items.dart';
import 'package:db_example/views/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class MySplashScreen extends StatelessWidget {
  const MySplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  FlutterSplashScreen(backgroundColor: ProjectColors.projectPrimaryColor,
      splashScreenBody: SizedBox(
        height: MediaQuery.of(context).size.height,
         width: MediaQuery.of(context).size.width,
         child: Center(child: 
          Lottie.asset(LottieItems.splash.lottiePath,fit: BoxFit.cover,filterQuality: FilterQuality.high,)
          ),
      ), nextScreen: const WelcomeScreen(),
       duration: DurationItems.durationExtra());
  }
}