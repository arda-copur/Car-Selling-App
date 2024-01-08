import 'package:db_example/constants/project_colors.dart';
import 'package:db_example/utils/dbhelper.dart';
import 'package:db_example/utils/lottie_items.dart';
import 'package:delightful_toast/delight_toast.dart';
import 'package:delightful_toast/toast/components/toast_card.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class TabBarDelete extends StatefulWidget {
  const TabBarDelete({super.key});

  @override
  State<TabBarDelete> createState() => _TabBarDeleteState();
}

class _TabBarDeleteState extends State<TabBarDelete> {
  final dbHelper = DatabaseHelper.instance;
  final String labelIdText = "İlan ID";
  final String deleteText = "İlanı Sil";
  final infoText = "Uyarı : Bu işlem geri döndürelemez. Silinen ilan kalıcı olarak kaybolur.";
  final deleteInfoText = "İlan başarıyla silindi";

  TextEditingController idDeleteController = TextEditingController();

  _showMessageInScaffold(String message) {
    return SnackBar(content: Text(message));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ProjectColors.projectPrimaryColor,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Lottie.asset(LottieItems.lottieRepair.lottiePath,
                  width: double.infinity, height: 250),
              Container(
                padding: const EdgeInsets.all(20),
                child: TextField(
                  controller: idDeleteController,
                  decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      labelText: labelIdText),
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(150, 30),
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  backgroundColor: ProjectColors.projectCustomBlackColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () {
                  int id = int.parse(idDeleteController.text);
                  _delete(id);
                   DelightToastBar(
                autoDismiss: true,
                builder: (context) => ToastCard(
                      color: ProjectColors.projectWhiteColor,
                      leading: const Icon(
                        Icons.check,
                        color: ProjectColors.projectBlackColor,
                        size: 28,
                      ),
                      title: Text(
                        deleteInfoText,
                        style: const TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 14,color: ProjectColors.projectBlackColor),
                      ),
                    )).show(context);
                },
                child: Text(
                  deleteText,
                  style:
                      const TextStyle(color: ProjectColors.projectWhiteColor),
                ),
              ),
              SizedBox(
                height: 200,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  infoText,
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(fontWeight: FontWeight.w700, fontSize: 16),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void _delete(int id) async {
    final rowsDeleted = await dbHelper.delete(id);
    _showMessageInScaffold("deleted $rowsDeleted row(s) : rows $id");
  }
}
