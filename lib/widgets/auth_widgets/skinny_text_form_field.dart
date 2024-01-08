

import 'package:db_example/constants/auth_screen_colors.dart';
import 'package:flutter/material.dart';

class SkinnyTextFormField extends StatelessWidget {
  const SkinnyTextFormField({
    required this.controller,
    required this.hintText,
    this.isPassword = false,
    this.enabled = true,
    this.borderRadius = 12,
    this.focusNode,
    this.prefixIcon,
    this.suffixIcon,
    this.maxLines = 1,
    this.validator,
    this.width,
    super.key,
  });
  final TextEditingController controller;
  final FocusNode? focusNode;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool isPassword;
  final bool enabled;
  final String hintText;
  final double borderRadius;
  final int maxLines;
  final String? Function(String?)? validator;
  final double? width;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: AuthScreenColors.kPrimary,
      validator: validator,
      controller: controller,
      focusNode: focusNode,
      obscureText: isPassword,
      enabled: enabled,
      style: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w700,
        height: 1.6,
      ).copyWith(
        color: AuthScreenColors.kGreyScale900,
      ),
      decoration: InputDecoration(
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        suffixIconConstraints: const BoxConstraints(maxHeight: 40),
        enabled: enabled,
        alignLabelWithHint: true,
        contentPadding: const EdgeInsets.symmetric(vertical: 18),
        constraints: BoxConstraints(
          maxWidth: width ?? 400,
        ),
        border: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: AuthScreenColors.kGreyScale500,
            width: 1,
          ),
        ),
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: AuthScreenColors.kGreyScale500,
            width: 1,
          ),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: AuthScreenColors.kPrimary,
            width: 3,
          ),
        ),
        errorBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: AuthScreenColors.kPrimary,
            width: 2,
          ),
        ),
        hintText: hintText,
        errorStyle: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          height: 1.6,
          letterSpacing: 0.2,
        ).copyWith(
          color: AuthScreenColors.kAlertError,
        ),
        hintStyle: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w700,
          height: 1.6,
        ).copyWith(
          color: AuthScreenColors.kGreyScale400,
        ),
        errorMaxLines: 1,
        disabledBorder: UnderlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: const BorderSide(
            color: AuthScreenColors.kDarkDisabled,
          ),
        ),
        hintMaxLines: 1,
      ),
    );
  }
}