import 'package:db_example/constants/auth_screen_colors.dart';
import 'package:flutter/material.dart';

class SimpleCheckBox extends StatefulWidget {
  SimpleCheckBox({required this.checked, super.key});
  bool checked;

  @override
  State<SimpleCheckBox> createState() => _SimpleCheckBoxState();
}

class _SimpleCheckBoxState extends State<SimpleCheckBox> {
  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: 1.3,
      child: Checkbox.adaptive(
        activeColor: AuthScreenColors.kPrimary,
        checkColor: AuthScreenColors.kWhite,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
        side: const BorderSide(color: AuthScreenColors.kPrimary, width: 2.75),
        value: widget.checked,
        onChanged: (checked) {
          setState(() {
            widget.checked = checked ?? false;
          });
        },
      ),
    );
  }
}
