import 'package:db_example/constants/project_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PrimaryTextFormField extends StatelessWidget {
  PrimaryTextFormField(
      {super.key,
      required this.hintText,
      this.border,
      this.enabledBorder,
      this.focusedBorder,
      this.errorBorder,
      this.keyboardType,
      this.focusedErrorBorder,
      required this.controller,
      required this.width,
      required this.height,
      this.hintTextColor,
      this.fillColor,
      this.onChanged,
      this.onTapOutside,
      this.prefixIcon,
      this.prefixIconColor,
      this.inputFormatters,
      this.borderRadius = 8});
  final double? borderRadius;
  final Color? fillColor;
  final String hintText;
  final OutlineInputBorder? border,
      enabledBorder,
      focusedBorder,
      errorBorder,
      focusedErrorBorder;
  final List<TextInputFormatter>? inputFormatters;
  Widget? prefixIcon;
  Function(PointerDownEvent)? onTapOutside;
  final Function(String)? onChanged;
  final double width, height;
  TextEditingController controller;
  final Color? hintTextColor, prefixIconColor;
  final TextInputType? keyboardType;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: ProjectColors.projectWhiteColor,
        borderRadius: BorderRadius.circular(borderRadius!),
      ),
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: Colors.grey,
        ),
        decoration: InputDecoration(
          fillColor: fillColor ?? ProjectColors.projectWhiteColor,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 16, vertical: 15),
          filled: true,
          hintText: hintText,
          hintStyle: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: hintTextColor ?? ProjectColors.projectGreyColor,
          ),
          prefixIcon: prefixIcon,
          prefixIconColor: prefixIconColor,
          border: border,
          enabledBorder: enabledBorder,
          focusedBorder: focusedBorder,
          errorBorder: errorBorder,
          focusedErrorBorder: focusedErrorBorder,
        ),
        onChanged: onChanged,
        inputFormatters: inputFormatters,
        onTapOutside: onTapOutside,
      ),
    );
  }
}