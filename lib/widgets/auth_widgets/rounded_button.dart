
import 'package:db_example/constants/auth_screen_colors.dart';
import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  const RoundedButton({
    required this.onTap,
    required this.label,
    this.color,
    this.width,
    this.height,
    this.style,
    super.key,
  });
  final void Function() onTap;
  final String label;
  final Color? color;
  final double? width;
  final double? height;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(100),
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: (height ?? 58),
        decoration: BoxDecoration(
          color: color ?? AuthScreenColors.kPrimary,
          borderRadius: BorderRadius.circular(100),
        ),
        alignment: Alignment.center,
        child: Text(
          label,
          style: style ??
              const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                height: 1.6,
                letterSpacing: 0.2,
              ).copyWith(
                color: AuthScreenColors.kWhite,
              ),
        ),
      ),
    );
  }
}