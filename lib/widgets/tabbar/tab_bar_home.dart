import 'package:db_example/constants/project_colors.dart';
import 'package:flutter/material.dart';

class TabBarHome extends StatelessWidget {
  const TabBarHome({super.key});

   

  @override
  Widget build(BuildContext context) {
    return   Scaffold(
        backgroundColor:  ProjectColors.projectCustomWhiteColor,
        body: SafeArea(
          child: SingleChildScrollView(
            padding:  const EdgeInsets.all(20),
            child: Column(
              children: [
                  TopBar(),
                  const SearchInput(),
                  const PromoCard(),
                  const Headline(),
                  const CardListView(),
                  SHeadline(),
                  const CustomMyList()
              ],
            ),
          ),
        ));
  }
}

class CustomMyList extends StatelessWidget {
  const CustomMyList({
    super.key,
  });
  
  final String ilanBirBaslik = "Nissan GTR R-34";
  final String ilanBirFiyat = "65.000 £";
  final String ilanIkiBaslik = "BMW M4";
  final String ilanIkiFiyat = "35.000 £";
  final String ilanUcBaslik = "Huracan";
  final String ilanUcFiyat = "75.000 £";
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  const EdgeInsets.only(top:18.0),
      child: SizedBox(
        height: 240,
        width:  MediaQuery.of(context).size.width,
        child: ListView(     
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          children: [
              Card(
              color: ProjectColors.projectWhiteColor,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20),),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [            
                  Text(ilanBirBaslik,style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.black,fontSize: 15,fontWeight: FontWeight.w400),),
                  Image.network("https://www.mydiecastcars.com/wp-content/uploads/2023/01/nissan-skyline-gtr-white-4.jpg",height: 120,width: 180,fit: BoxFit.fill,),
                  Text(ilanBirFiyat,style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Colors.black,fontSize: 14,fontWeight: FontWeight.w800),),   
                  
                ],
              ),
              ),
              const Padding(padding: EdgeInsets.all(8)),
                Card(
              color: ProjectColors.projectWhiteColor,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20),),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [            
                  Text(ilanIkiBaslik,style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.black,fontSize: 15,fontWeight: FontWeight.w400),),
                  Image.network("https://img.freepik.com/premium-photo/car-white-bmw-with-black-wheels-isolated-white-background_725455-216.jpg?w=2000",height: 120,width: 180,fit: BoxFit.fill,),
                  Text(ilanIkiFiyat,style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Colors.black,fontSize: 14,fontWeight: FontWeight.w800),),
                  
                ],
              ),
              ),
              const Padding(padding: EdgeInsets.all(8)),
                Card(
              color: ProjectColors.projectWhiteColor,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20),),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [         
                  Text(ilanUcBaslik,style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.black,fontSize: 15,fontWeight: FontWeight.w400),),
                  Image.network("https://thumbs.dreamstime.com/b/lamborghini-huracan-car-show-isolated-white-background-thailand-march-bangkok-international-motor-148424577.jpg",height: 120,width: 180,fit: BoxFit.fill,),
                  Text(ilanUcFiyat,style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Colors.black,fontSize: 14,fontWeight: FontWeight.w800),),
                  
                ],
              ),
              ),
          ],
        ),
      ),
    );
  }
}

class TopBar extends StatelessWidget {
   TopBar({Key? key}) : super(key: key);
  final String baslikText = "Hayalindeki arabayı bul";
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
         Text(
          baslikText,
          style: const TextStyle(
              color: ProjectColors.projectBlackColor, fontSize: 30, fontWeight: FontWeight.bold),
        ),
        Container(
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(
                offset: const Offset(12, 26),
                blurRadius: 50,
                spreadRadius: 0,
                color: ProjectColors.projectGreyColor.withOpacity(.25)),
          ]),
          child:  CircleAvatar(
            radius: 25,
            backgroundColor: Colors.white,
            child: Image.asset("images/car_icon.png",height: 25,width: 25,),
          ),
        )
      ],
    );
  }
}

class SearchInput extends StatelessWidget {
   const SearchInput({Key? key}) : super(key: key);
  
  final String hintSearchText = "Arama yap";
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:   EdgeInsets.only(top: 8.0),
      child: Container(
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
              offset:  Offset(12, 26),
              blurRadius: 50,
              spreadRadius: 0,
              color: Colors.grey.withOpacity(.1)),
        ]),
        child: TextField(
          onChanged: (value) {},
          decoration:   InputDecoration(
            prefixIcon: Icon(Icons.search, color: ProjectColors.projectBlackColor),
            filled: true,
            fillColor: ProjectColors.projectWhiteColor,
            hintText: hintSearchText,
            hintStyle: TextStyle(color: ProjectColors.projectBlackColor),
            contentPadding:
                EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(15.0)),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: ProjectColors.projectWhiteColor, width: 1.0),
              borderRadius: BorderRadius.all(Radius.circular(15.0)),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: ProjectColors.projectWhiteColor, width: 2.0),
              borderRadius: BorderRadius.all(Radius.circular(15.0)),
            ),
          ),
        ),
      ),
    );
  }
}

class PromoCard extends StatelessWidget {
  const PromoCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 25.0),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 170,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            gradient: const LinearGradient(
                colors: [ProjectColors.projectBlackColor, ProjectColors.projectPrimaryColor])),
        child: Stack(
          children: [
            Opacity(
              opacity: .6,
              child: Image.network(
                  "https://i.ytimg.com/vi/kSIgf9JjQKc/maxresdefault.jpg",
                  fit: BoxFit.cover),
            ),
          ],
        ),
      ),
    );
  }
}

class Headline extends StatelessWidget {
  
  const  Headline({Key? key}) : super(key: key);
   final String baslikText = "Çalıştığımız Markalar";
  final String baslikText2 = "Hız, konfor ya da güvenlik...";
  final String baslikText3 = "Hepsini gör";



  @override
  Widget build(BuildContext context) {
    return    Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
       children: [
         Padding(
          padding:  EdgeInsets.only(top: 30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                baslikText,
                style:  TextStyle(
                    color: ProjectColors.projectBlackColor,
                    fontSize: 18,
                    fontWeight: FontWeight.w500),
              ),
              Text(
                baslikText2,
                style:  TextStyle(
                    color: ProjectColors.projectGreyColor,
                    fontSize: 12,
                    fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ),
        Text(
          baslikText3,
          style:  TextStyle(
              color: ProjectColors.projectPrimaryColor,
              fontWeight: FontWeight.normal),
        ),
      ],
    );
  }
}

class SHeadline extends StatelessWidget {
   SHeadline({Key? key}) : super(key: key);

    final String ilanBilgiText = "En son ilanlar";
    final String ilanBilgiText2 = "Şimdi satışta";
    final String ilanBilgiText3 = "Hepsini gör";

  @override
  Widget build(BuildContext context) {
    return    Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
                ilanBilgiText,
              style: const TextStyle(
                  color: ProjectColors.projectBlackColor,
                  fontSize: 18,
                  fontWeight: FontWeight.w500),
            ),
            Text(
              ilanBilgiText2,
              style: const TextStyle(
                  color: ProjectColors.projectGreyColor,
                  fontSize: 12,
                  fontWeight: FontWeight.w600),
            ),
          ],
        ),
        Text(
          ilanBilgiText3,
          style: const TextStyle(
              color: ProjectColors.projectPrimaryColor,
              fontWeight: FontWeight.normal),
        ),
      ],
    );
  }
}

class CardListView extends StatelessWidget {
  const CardListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 25.0, bottom: 15.0),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: 175,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: const [
            MyCard(
                "Mercedes",
                "https://upload.wikimedia.org/wikipedia/commons/thumb/9/90/Mercedes-Logo.svg/1200px-Mercedes-Logo.svg.png",
                "8 model"),
            MyCard(
                "BMW",
                "https://seeklogo.com/images/B/bmw-logo-248C3D90E6-seeklogo.com.png",
                "12 model"),
            MyCard(
                "Tesla",
                "https://upload.wikimedia.org/wikipedia/commons/e/e8/Tesla_logo.png",
                "3 model"),
          ],
        ),
      ),
    );
  }
}

class MyCard extends StatelessWidget {
  final String text;
  final String imageUrl;
  final String subtitle;

  const MyCard(this.text, this.imageUrl, this.subtitle, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15, right: 15),
      child: Container(
        width: 150,
        height: 150,
        padding: const EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          color: ProjectColors.projectWhiteColor,
          borderRadius: BorderRadius.circular(12.5),
          boxShadow: [
            BoxShadow(
                offset: const Offset(10, 20),
                blurRadius: 10,
                spreadRadius: 0,
                color: ProjectColors.projectGreyColor.withOpacity(.05)),
          ],
        ),
        child: Column(
          children: [
            Image.network(imageUrl, height: 70, fit: BoxFit.cover),
            const Spacer(),
            Text(text,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: ProjectColors.projectBlackColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                )),
            const SizedBox(
              height: 5,
            ),
            Text(
              subtitle,
              textAlign: TextAlign.center,
              style: const TextStyle(
                  color: ProjectColors.projectGreyColor,
                  fontWeight: FontWeight.normal,
                  fontSize: 12),
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}

