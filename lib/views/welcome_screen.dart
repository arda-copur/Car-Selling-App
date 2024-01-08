import 'package:db_example/constants/project_colors.dart';
import 'package:db_example/views/login_screen.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  final String baslik1 = "Güven içinde";
  final String baslik2 = "Kolay ve hızlıca sat.";
  final String buttonText1 = "Geç";
  final String buttonText2 = "Başlayalım";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.bottomCenter,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('images/background.jpg'), fit: BoxFit.cover)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Spacer(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Text(baslik1,
                  style: TextStyle(
                      color: ProjectColors.projectWhiteColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w800)),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Text(baslik2,
                  style: TextStyle(
                      color: ProjectColors.projectWhiteColor,
                      fontSize: 30,
                      fontWeight: FontWeight.w900)),
            ),
            SizedBox(height: 120),
            Container(
              height: 100,
              padding: EdgeInsets.symmetric(horizontal: 24),
              decoration: BoxDecoration(
                  color: ProjectColors.projectPrimaryColor,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(45),
                      topRight: Radius.circular(45))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                      style: TextButton.styleFrom(
                          backgroundColor: ProjectColors.projectWhiteColor),
                      onPressed: () {},
                      child: Text(
                        buttonText1,
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: ProjectColors.projectPrimaryColor,fontWeight: FontWeight.w900)
                      )),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const LoginScreen()));
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: ProjectColors.projectWhiteColor),
                      child: Text(
                        buttonText2,
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: ProjectColors.projectPrimaryColor,fontWeight: FontWeight.w900)
                      ))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
