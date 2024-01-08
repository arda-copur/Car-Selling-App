import 'package:db_example/auth/userdata.dart';
import 'package:db_example/constants/auth_screen_colors.dart';
import 'package:db_example/constants/project_colors.dart';

import 'package:db_example/views/myhomepage.dart';
import 'package:db_example/widgets/login_widgets/primary_button.dart';
import 'package:delightful_toast/delight_toast.dart';
import 'package:delightful_toast/toast/components/toast_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({
    super.key,
    required this.myEmailController,
    required this.myPasswordController,
    required this.basariText,
    required this.hataText,
    required this.giris2Text,
  });

  final TextEditingController myEmailController;
  final TextEditingController myPasswordController;
  final String basariText;
  final String hataText;
  final String giris2Text;

  @override
  Widget build(BuildContext context) {
    return PrimaryButton(
      onTap: () {
        var email = myEmailController.text;
        var password = myPasswordController.text;

        var userProvider = Provider.of<UserProvider>(context, listen: false);
        var isLoginSuccesfull = userProvider.loginUser(email, password);

        if (isLoginSuccesfull) {
          DelightToastBar(
            autoDismiss: true,
            builder: (context) => ToastCard(
              trailing: const Icon(
                Icons.account_circle_outlined,
                color: ProjectColors.projectBlackColor,
              ),
              color: AuthScreenColors.kWhite,
              leading: const Icon(
                Icons.check,
                color: ProjectColors.projectBlackColor,
                size: 28,
              ),
              title: Text(
                basariText,
                style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                    color: ProjectColors.projectBlackColor),
              ),
            ),
          ).show(context);
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => const MyPage()));
          const Duration(milliseconds: 5000);
        } else {
          DelightToastBar(
              autoDismiss: true,
              builder: (context) => ToastCard(
                    trailing: const Icon(
                      Icons.account_circle_outlined,
                      color: ProjectColors.projectBlackColor,
                    ),
                    color: AuthScreenColors.kWhite,
                    leading: const Icon(
                      Icons.check,
                      color: ProjectColors.projectBlackColor,
                      size: 28,
                    ),
                    title: Text(
                      hataText,
                      style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                          color: ProjectColors.projectBlackColor),
                    ),
                  )).show(context);
        }
      },
      borderRadius: 8,
      fontSize: 16,
      height: 48,
      width: 326,
      text: giris2Text,
      textColor: ProjectColors.projectWhiteColor,
      bgColor: ProjectColors.projectRedColor,
    );
  }
}
