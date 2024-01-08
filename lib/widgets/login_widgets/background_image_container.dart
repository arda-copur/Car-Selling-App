

import 'package:flutter/material.dart';

class BackgroundImageContainer extends StatelessWidget {
  const BackgroundImageContainer({
    super.key,
    required this.child,
  });
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                AppImagePath.background,
              ),
              fit: BoxFit.cover)),
      child: child,
    );
  }
}

class AppImagePath {
  static String background = 'images/keyboard_gif2.gif';
  static String logoFacebook = 'images/facebook_icon.png';
  static String googleLogo = 'images/google_icon.png';
  static String appleLogo = 'images/apple_icon.png';
}