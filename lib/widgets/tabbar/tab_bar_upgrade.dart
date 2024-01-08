import 'package:db_example/constants/project_colors.dart';
import 'package:db_example/models/car.dart';
import 'package:db_example/utils/dbhelper.dart';
import 'package:db_example/utils/lottie_items.dart';
import 'package:delightful_toast/delight_toast.dart';
import 'package:delightful_toast/toast/components/toast_card.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lottie/lottie.dart';

class TabBarUpgrade extends StatefulWidget {
  const TabBarUpgrade({super.key});

  @override
  State<TabBarUpgrade> createState() => _TabBarUpgradeState();
}

class _TabBarUpgradeState extends State<TabBarUpgrade>  {
 

  TextEditingController idUpdateController = TextEditingController();
  TextEditingController nameUpdateController = TextEditingController();
  TextEditingController milesUpdateController = TextEditingController();
  TextEditingController priceUpdateController = TextEditingController();
  
  final String infoText = "İlan numarası ile ilanınızın tüm özelliklerini kolayca değiştirebilirsiniz.";
  final String infoTextTwo = "İlan başarıyla güncellendi";
  final String labelText1 = "İlan Numarası";
  final String labelText2 = "İlanın yeni adı";
  final String labelText3 = "İlanın yeni mili";
  final String labelText4 = "İlanın yeni fiyatı";
  final String imageButtonText = "Yeni Fotoğraf";
  final String buttonText = "İlanı Güncelle";
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: ProjectColors.projectPrimaryColor,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children : 
            [ 
              Padding(
                padding: const EdgeInsets.only(top:12,right: 8,left: 8),
                child: Text(infoText,style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize: 20,fontWeight: FontWeight.w900),),
              ),
              Lottie.asset(LottieItems.lottieImage.lottiePath,height: 180,width: 300),
               Container(
                      height: 90,
                      width: 350,
                      padding: const EdgeInsets.all(20),
                      child: TextField(
                        controller: idUpdateController,
                        decoration:  InputDecoration(
                            border: const OutlineInputBorder(), labelText: labelText1),
                      ),
                    ),
                    Container(
                      height: 90,
                      width: 350,
                      padding: const EdgeInsets.all(20),
                      child: TextField(
                        controller: nameUpdateController,
                        decoration:  InputDecoration(
                            border: const OutlineInputBorder(), labelText: labelText2),
                      ),
                    ),
                    Container(
                      height: 90,
                      width: 350,
                      padding: const EdgeInsets.all(20),
                      child: TextField(
                        controller: milesUpdateController,
                        decoration:  InputDecoration(
                            border: const OutlineInputBorder(), labelText: labelText3),
                      ),
                    ),
                    Container(
                      height: 90,
                      width: 350,
                      padding: const EdgeInsets.all(20),
                      child: TextField(
                        controller: priceUpdateController,
                        decoration:  InputDecoration(
                            border: const OutlineInputBorder(), labelText: labelText4),
                      ),
                    ),
                    ElevatedButton(
                       style: ElevatedButton.styleFrom(
                    minimumSize: const Size(150, 30),
                              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                              backgroundColor:ProjectColors.projectCustomBlackColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                      onPressed: () async{
                      await _selectImage();
                    }, child: Text(imageButtonText,style: const TextStyle(color: ProjectColors.projectWhiteColor),),),
                     ElevatedButton(
                       style: ElevatedButton.styleFrom(
                    minimumSize: const Size(150, 30),
                              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                              backgroundColor:ProjectColors.projectCustomBlackColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                    onPressed: () async {
                 
                      int id = int.parse(idUpdateController.text);
                      String name = nameUpdateController.text;
                      int miles = int.parse(milesUpdateController.text);
                      int price = int.parse(priceUpdateController.text);
                      _update(
                        id,
                        name,
                        miles,
                        price,
                        _selectedImagePath
                        
                      );
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
                        infoTextTwo,
                        style: const TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 14,color: ProjectColors.projectBlackColor),
                      ),
                    )).show(context);
                    },
                    child:  Text(buttonText,style: const TextStyle(color: ProjectColors.projectWhiteColor),),
                  ),
              ]
            ),
        ),
      ),
    );
  }


    void _update(int id, String name, int miles, int price,String imagePath) async {
    Car car = Car(
      id,
      name,
      miles,
      price,
      imagePath
    );
    if (imagePath != null) {
      car.imagePath = imagePath;
    }
    final rowsAffected = await dbHelper.update(car);
    _showMessageInScaffold("Updated $rowsAffected row(s)");
  }
  late String _selectedImagePath;
  Future <void> _selectImage() async {
   final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
   if (pickedFile != null) 
   {
    setState(() {
      _selectedImagePath = pickedFile.path;
    });
   }
  }


   final dbHelper = DatabaseHelper.instance;

       _showMessageInScaffold(String message) {
    return SnackBar(content: Text(message));
  }
  

}

