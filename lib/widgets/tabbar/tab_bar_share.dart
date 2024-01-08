import 'dart:ui';
import 'package:db_example/constants/project_colors.dart';
import 'package:delightful_toast/delight_toast.dart';
import 'package:db_example/models/car.dart';
import 'package:db_example/utils/dbhelper.dart';
import 'package:delightful_toast/toast/components/toast_card.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class TabBarShare extends StatefulWidget {
  const TabBarShare({super.key});

  @override
  State<TabBarShare> createState() => _TabBarShareState();
}

class _TabBarShareState extends State<TabBarShare> {
  final String bilgiText1 = "İLANINI";
  final String bilgiText2 = "PAYLAŞ";
  final String bilgiText3 = "Saniyeler içinde binlerce müşteriye ulaşsın!";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height / 1.3,
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.vertical(
                  top: Radius.zero,
                  bottom: Radius.circular(40),
                ),
                image: DecorationImage(
                    image: NetworkImage(
                        "https://img.freepik.com/free-vector/flat-hand-holding-car-key-background_23-2147743315.jpg"),
                    fit: BoxFit.cover)),
            child: Column(
              children: [
                const SizedBox(height: 100),
                Text(
                  bilgiText1,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: ProjectColors.projectWhiteColor,
                      fontWeight: FontWeight.w800,
                      fontSize: 42),
                ),
                Text(
                  bilgiText2,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: ProjectColors.projectWhiteColor,
                      fontWeight: FontWeight.w700,
                      fontSize: 22),
                ),
                const SizedBox(height: 30),
                Text(
                  bilgiText3,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: ProjectColors.projectWhiteColor,
                      fontWeight: FontWeight.w700,
                      fontSize: 14),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          const MyMainContainer(),
        ],
      ),
    );
  }
}

class MyMainContainer extends StatefulWidget {
  const MyMainContainer({super.key});

  @override
  State<MyMainContainer> createState() => _MyMainContainerState();
}

class _MyMainContainerState extends State<MyMainContainer> {
  final String ekleText = """ Şimdi
 arabanı 
  ekle
                     """;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          left: 0,
          right: 0,
          bottom: 50,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 40),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      blurRadius: 20, color: Colors.grey.withOpacity(0.7)),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    ekleText,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                        height: 1),
                  ),
                  const SizedBox(height: 30),
                  const RoundButton(
                    title: "İlan ekle",
                  ),
                ],
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 140,
          right: 10,
          child: ClipRRect(
            child: Image.network(
              "https://cdn3d.iconscout.com/3d/premium/thumb/car-4741990-3945475.png",
              fit: BoxFit.cover,
              height: 110,
            ),
          ),
        ),
      ],
    );
  }
}

class RoundButton extends StatefulWidget {
  final String title;

  const RoundButton({
    super.key,
    required this.title,
  });

  @override
  State<RoundButton> createState() => _RoundButtonState();
}

class _RoundButtonState extends State<RoundButton> {
  TextEditingController nameController = TextEditingController();
  TextEditingController milesController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  final String label1 = "Marka, model";
  final String label2 = "Mil";
  final String label3 = "Fiyat (£)";
  final String buttonText = "Fotoğraf Ekle";
  final String buttonText2 = "İlanı Paylaş";
  final String bilgiText = "İlan başarıyla paylaşıldı";
  final String uyariText = "Lütfen tüm alanları doldurunuz.";
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            backgroundColor: ProjectColors.projectPrimaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          onPressed: () {
            showModalBottomSheet(
                backgroundColor: ProjectColors.projectTransparentColor,
                context: context,
                builder: (BuildContext context) {
                  return SizedBox(
                    height: 800,
                    width: double.infinity,
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                      child: Container(
                        decoration: BoxDecoration(
                          color:
                              ProjectColors.projectWhiteColor.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(22),
                        ),
                        child: Center(
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                NameContainer(
                                    nameController: nameController,
                                    label1: label1),
                                MileContainer(
                                    milesController: milesController,
                                    label2: label2),
                                PriceContainer(
                                    priceController: priceController,
                                    label3: label3),
                                ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      minimumSize: const Size(150, 30),
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 10, horizontal: 10),
                                      backgroundColor:
                                          ProjectColors.projectPrimaryColor,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                    onPressed: () async {
                                      await _selectImage(); // Fotoğraf seçme işlemini bekleyin
                                      setState(() {});
                                    },
                                    child: Text(
                                      buttonText,
                                      style: const TextStyle(
                                          color:
                                              ProjectColors.projectWhiteColor),
                                    )),
                                const Padding(padding: EdgeInsets.all(8)),
                                ShareButton(
                                    nameController: nameController,
                                    milesController: milesController,
                                    priceController: priceController,
                                    uyariText: uyariText,
                                    bilgiText: bilgiText,
                                    buttonText2: buttonText2),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                });
          },
          child: Center(
            child: Text(
              widget.title,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: ProjectColors.projectWhiteColor,
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                  ),
            ),
          )),
    );
  }

  Future<void> _selectImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      String imagePath = pickedFile.path;
      String name = nameController.text;
      int miles = int.parse(milesController.text);
      int price = int.parse(priceController.text);

      _insert(name, miles, price, imagePath);
    }
  }

  void _insert(String name, int miles, int price, String imagePath) async {
    Map<String, dynamic> row = {
      DatabaseHelper.columnName: name,
      DatabaseHelper.columnMiles: miles,
      DatabaseHelper.columnPrice: price,
      DatabaseHelper.columnImagePath: imagePath,
    };

    Car car = Car.fromMap(row);
    final id = await dbHelper.insert(car);
    _showMessageInScaffold("inserted row id : $id");
  }

  _showMessageInScaffold(String message) {
    return SnackBar(content: Text(message));
  }

  final dbHelper = DatabaseHelper.instance;
}

class ShareButton extends StatelessWidget {
  const ShareButton({
    super.key,
    required this.nameController,
    required this.milesController,
    required this.priceController,
    required this.uyariText,
    required this.bilgiText,
    required this.buttonText2,
  });

  final TextEditingController nameController;
  final TextEditingController milesController;
  final TextEditingController priceController;
  final String uyariText;
  final String bilgiText;
  final String buttonText2;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          minimumSize: const Size(150, 30),
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          backgroundColor: ProjectColors.projectPrimaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        onPressed: () {
          if (nameController.text.isEmpty ||
              milesController.text.isEmpty ||
              priceController.text.isEmpty) {
            DelightToastBar(
                autoDismiss: true,
                builder: (context) => ToastCard(
                      color: ProjectColors.projectPrimaryColor,
                      shadowColor: ProjectColors.projectWhiteColor,
                      leading: const Icon(
                        Icons.error,
                        color: ProjectColors.projectWhiteColor,
                        size: 28,
                      ),
                      title: Text(
                        uyariText,
                        style: const TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 14),
                      ),
                    )).show(context);
          } else {
            Navigator.pop(context);
            DelightToastBar(
                autoDismiss: true,
                builder: (context) => ToastCard(
                      color: ProjectColors.projectPrimaryColor,
                      shadowColor: ProjectColors.projectWhiteColor,
                      leading: const Icon(
                        Icons.check,
                        color: ProjectColors.projectWhiteColor,
                        size: 28,
                      ),
                      title: Text(
                        bilgiText,
                        style: const TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 14),
                      ),
                    )).show(context);
          }
        },
        child: Text(
          buttonText2,
          style: const TextStyle(color: ProjectColors.projectWhiteColor),
        ));
  }
}

class PriceContainer extends StatelessWidget {
  const PriceContainer({
    super.key,
    required this.priceController,
    required this.label3,
  });

  final TextEditingController priceController;
  final String label3;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: TextField(
        controller: priceController,
        decoration: InputDecoration(
            border: const OutlineInputBorder(), labelText: label3),
      ),
    );
  }
}

class MileContainer extends StatelessWidget {
  const MileContainer({
    super.key,
    required this.milesController,
    required this.label2,
  });

  final TextEditingController milesController;
  final String label2;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: TextField(
        controller: milesController,
        decoration: InputDecoration(
            border: const OutlineInputBorder(), labelText: label2),
      ),
    );
  }
}

class NameContainer extends StatelessWidget {
  const NameContainer({
    super.key,
    required this.nameController,
    required this.label1,
  });

  final TextEditingController nameController;
  final String label1;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: TextField(
        controller: nameController,
        decoration: InputDecoration(
            border: const OutlineInputBorder(), labelText: label1),
      ),
    );
  }
}
