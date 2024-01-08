
import 'package:db_example/constants/project_colors.dart';
import 'package:flutter/material.dart';

class SocialMediaTile extends StatelessWidget {
  const SocialMediaTile({required this.onTap, required this.icon, super.key});
  final Widget icon;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(100),
      onTap: onTap,
      child: Container(
        width: 84,
        height: 56,
        decoration: BoxDecoration(
          color: ProjectColors.projectWhiteColor,
          borderRadius: BorderRadius.circular(100),
          border: Border.all(
            color: ProjectColors.projectWhiteColor,
          ),
        ),
        alignment: Alignment.center,
        child: icon,
      ),
    );
  }
}
