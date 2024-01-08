
import 'package:db_example/views/auth_screen.dart';
import 'package:db_example/widgets/auth_widgets/social_media_tile.dart';
import 'package:flutter/material.dart';

class SocialRow extends StatelessWidget {
  const SocialRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SocialMediaTile(
          onTap: () {},
          icon: Image.asset(Images.googleLogo),
        ),
        SocialMediaTile(
          onTap: () {},
          icon: Image.asset(Images.appleLogo),
        ),
        SocialMediaTile(
          onTap: () {},
          icon: Image.asset(Images.facebookLogo),
        ),
        SocialMediaTile(
          onTap: () {},
          icon: Image.asset(Images.twitterLogo),
        ),
      ],
    );
  }
}