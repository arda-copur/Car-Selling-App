import 'package:db_example/constants/project_colors.dart';
import 'package:db_example/views/auth_screen.dart';
import 'package:db_example/widgets/login_widgets/background_image_container.dart';
import 'package:db_example/widgets/login_widgets/custom_rich_text.dart';
import 'package:db_example/widgets/login_widgets/divider_row.dart';
import 'package:db_example/widgets/login_widgets/login_button.dart';
import 'package:db_example/widgets/login_widgets/primary_text_button.dart';
import 'package:db_example/widgets/login_widgets/primary_text_form_field.dart';
import 'package:db_example/widgets/login_widgets/secondary_button.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({
    super.key,
  });

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final String inputText = "Giriş yap";
  final String hintEmailText = "Email";
  final String hintPasswordText = "Şifre";
  final String successText = "Başarıyla giriş yapıldı.";
  final String errorText = "Kullanıcı adı veya şifreniz yanlış.";
  final String inputTextTwo = "Giriş";
  final String passwordText = "Şifreni mi unuttun?";
  final String facebookText = "Facebook ile giriş";
  final String googleText = "Google ile giriş";
  final String appleText = "Apple ile giriş";
  final String registryText = " Kayıt ol ";
  final String accountText = "Hesabınız yok mu?";

  TextEditingController myEmailController = TextEditingController();
  TextEditingController myPasswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BackgroundImageContainer(
        child: Scaffold(
      backgroundColor: ProjectColors.projectTransparentColor,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.only(
                top: 140, right: 263, bottom: 15, left: 32),
            child: Center(
              child: Text(
                inputText,
                style: const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w900,
                    color: Colors.white),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Container(
              width: 358,
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 24),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: ProjectColors.projectPrimaryColor.withOpacity(0.4),
                boxShadow: [
                  BoxShadow(
                    color: ProjectColors.projectBlackColor.withOpacity(0.5),
                    blurRadius: 10,
                  ),
                ],
              ),
              child: Container(
                color: Colors.transparent,
                child: Column(
                  children: [
                    PrimaryTextFormField(
                        hintText: hintEmailText,
                        controller: myEmailController,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8)),
                        width: 326,
                        height: 48,
                        fillColor: ProjectColors.projectWhiteColor),
                    const SizedBox(
                      height: 16,
                    ),
                    PrimaryTextFormField(
                        hintText: hintPasswordText,
                        controller: myPasswordController,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8)),
                        width: 326,
                        height: 48,
                        fillColor: ProjectColors.projectWhiteColor),
                    minHeightSizedBox(),
                    LoginButton(
                        myEmailController: myEmailController,
                        myPasswordController: myPasswordController,
                        basariText: successText,
                        hataText: errorText,
                        giris2Text: inputTextTwo),
                    minHeightSizedBox(),
                    PrimaryTextButton(
                      title: passwordText,
                      fontSize: 16,
                      onPressed: () {},
                      textColor: ProjectColors.projectWhiteColor,
                    ),
                    heightSizedBox(),
                    const DividerRow(),
                    heightSizedBox(),
                    SecondaryButton(
                        onTap: () {},
                        borderRadius: 8,
                        fontSize: 14,
                        height: 48,
                        width: 326,
                        text: facebookText,
                        bgColor: ProjectColors.projectWhiteColor,
                        textColor: ProjectColors.projectBlackColor,
                        icons: AppImagePath.logoFacebook),
                    minHeightSizedBox(),
                    SecondaryButton(
                        onTap: () {},
                        borderRadius: 8,
                        fontSize: 14,
                        height: 48,
                        width: 326,
                        text: googleText,
                        textColor: ProjectColors.projectBlackColor,
                        bgColor: ProjectColors.projectWhiteColor,
                        icons: AppImagePath.googleLogo),
                    minHeightSizedBox(),
                    SecondaryButton(
                        onTap: () {},
                        borderRadius: 8,
                        fontSize: 14,
                        height: 48,
                        width: 326,
                        text: appleText,
                        textColor: ProjectColors.projectBlackColor,
                        bgColor: ProjectColors.projectWhiteColor,
                        icons: AppImagePath.appleLogo),
                    heightSizedBox(),
                    CustomRichText(
                      subtitle: registryText,
                      title: accountText,
                      subtitleTextStyle: const TextStyle(
                        color: ProjectColors.projectWhiteColor,
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                      ),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const AuthScreen()));
                      },
                    )
                  ],
                ),
              ),
            ),
          )
        ]),
      ),
    ));
  }

  SizedBox minHeightSizedBox() => const SizedBox(height: 16);
  SizedBox heightSizedBox() => const SizedBox(height: 32);
}
