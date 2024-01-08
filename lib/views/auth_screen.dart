import 'package:db_example/auth/userdata.dart';
import 'package:db_example/constants/auth_screen_colors.dart';
import 'package:db_example/constants/project_colors.dart';
import 'package:db_example/constants/project_paddings.dart';
import 'package:db_example/widgets/auth_widgets/rounded_button.dart';
import 'package:db_example/widgets/auth_widgets/simple_check_box.dart';
import 'package:db_example/widgets/auth_widgets/skinny_text_form_field.dart';
import 'package:db_example/widgets/auth_widgets/social_row.dart';
import 'package:delightful_toast/delight_toast.dart';
import 'package:delightful_toast/toast/components/toast_card.dart';
import 'package:flutter/material.dart';
import "package:provider/provider.dart";

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final String helloText = "Merhaba";
  final String infoText =
      "Lütfen e-mail ve şifrenizi girerek hesap oluşturunuz.";
  final String emailText = "Email";
  final String infoEmail = "Mail adresinizi giriniz";
  final String passwordText = "Şifre";
  final String infoPassword = "Şifrenizi giriniz";
  final String agreementText = "Şartlar ve gizlilik sözleşmesini ";
  final String approveText = "kabul ediyorum.";
  final String accountText = "Zaten hesabınız var mı?";
  final String inputText = "Giriş Yap";
  final String orText = "veya";
  final String infoMessage =
      "Başarıyla hesap oluşturuldu.Artık giriş yapabilirsiniz.";
  final String labelText = "Hesap oluştur";

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ProjectColors.projectWhiteColor,
      body: Form(
        child: Padding(
          padding: EdgeInsets.only(
              left: 24, right: 24, top: MediaQuery.of(context).padding.top),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.arrow_back_ios,
                      size: 22, color: ProjectColors.projectBlackColor),
                  padding: const ProjectPaddings.ultraNormalPadding(),
                ),
                heightSizedBox(),
                Text(
                  '$helloText 👋',
                  style: const TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.w700,
                    height: 1.2,
                  ).copyWith(
                    color: AuthScreenColors.kGreyScale900,
                  ),
                ),
                Text(
                  infoText,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    height: 1.6,
                    letterSpacing: 0.2,
                  ).copyWith(
                    color: AuthScreenColors.kGreyScale900,
                  ),
                ),
                heightSizedBox(),
                Text(
                  emailText,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    height: 1.6,
                    letterSpacing: 0.2,
                  ).copyWith(
                    color: AuthScreenColors.kGreyScale900,
                  ),
                ),
                SkinnyTextFormField(
                  controller: emailController,
                  hintText: infoEmail,
                  prefixIcon: const Icon(
                    Icons.mail,
                    size: 28,
                    color: AuthScreenColors.kGreyScale900,
                  ),
                ),
                heightSizedBox(),
                Text(
                  passwordText,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    height: 1.6,
                    letterSpacing: 0.2,
                  ).copyWith(
                    color: AuthScreenColors.kGreyScale900,
                  ),
                ),
                SkinnyTextFormField(
                    controller: passwordController,
                    hintText: infoPassword,
                    isPassword: true,
                    prefixIcon: const Icon(Icons.visibility,
                        color: ProjectColors.projectBlackColor)),
                const SizedBox(height: 20),
                Row(
                  children: [
                    SimpleCheckBox(
                      checked: true,
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: agreementText,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                height: 1.6,
                                letterSpacing: 0.2,
                              ).copyWith(
                                color: AuthScreenColors.kGreyScale900,
                              ),
                            ),
                            TextSpan(
                              text: approveText,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                height: 1.6,
                                letterSpacing: 0.2,
                              ).copyWith(
                                color: AuthScreenColors.kPrimary,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                heightSizedBox(),
                const Divider(color: AuthScreenColors.kGreyScale200),
                heightSizedBox(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      accountText,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        height: 1.6,
                        letterSpacing: 0.2,
                      ).copyWith(
                        color: AuthScreenColors.kGreyScale900,
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    InkWell(
                      onTap: () {},
                      child: Text(
                        inputText,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          height: 1.6,
                          letterSpacing: 0.2,
                        ).copyWith(
                          color: AuthScreenColors.kPrimary,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  children: [
                    const Expanded(
                      child: Divider(
                        color: AuthScreenColors.kGreyScale200,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Text(
                        orText,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          height: 1.6,
                        ).copyWith(
                          color: AuthScreenColors.kGreyScale700,
                        ),
                      ),
                    ),
                    const Expanded(
                      child: Divider(
                        color: AuthScreenColors.kGreyScale200,
                      ),
                    ),
                  ],
                ),
                heightSizedBox(),
                const SocialRow(),
                heightSizedBox(),
                RoundedButton(
                  onTap: () {
                    var email = emailController.text;
                    var password = passwordController.text;
                    var userProvider =
                        Provider.of<UserProvider>(context, listen: false);
                    userProvider
                        .addUser(UserData(email: email, password: password));
                    authToastBar().show(context);
                  },
                  label: labelText,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  DelightToastBar authToastBar() {
    return DelightToastBar(
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
          infoMessage,
          style: const TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 14,
            color: ProjectColors.projectBlackColor,
          ),
        ),
      ),
    );
  }

  SizedBox heightSizedBox() {
    return const SizedBox(
      height: 20,
    );
  }
}

class User {
  late String email;
  late String password;
  User({
    required this.email,
    required this.password,
  });
}

class Images {
  static const googleLogo = 'images/google_icon.png';
  static const facebookLogo = 'images/facebook_icon.png';
  static const appleLogo = 'images/apple_icon.png';
  static const twitterLogo = 'images/twitter_icon.png';
}
