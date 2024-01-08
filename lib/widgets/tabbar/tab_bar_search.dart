import 'dart:io';

import 'package:db_example/constants/project_colors.dart';
import 'package:db_example/models/car.dart';
import 'package:db_example/utils/dbhelper.dart';
import 'package:db_example/utils/lottie_items.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class TabBarSearch extends StatefulWidget {
  const TabBarSearch({super.key});

  @override
  State<TabBarSearch> createState() => _TabBarSearchState();
}

class _TabBarSearchState extends State<TabBarSearch> {
   List<Car> carsByName = [];
    TextEditingController queryController = TextEditingController();
     final dbHelper = DatabaseHelper.instance;

    
  void _query(name) async {
    final allRows = await dbHelper.queryRows(name);
    carsByName.clear();
    allRows.forEach((row) => carsByName.add(Car.fromMap(row)));
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: ProjectColors.projectPrimaryColor,
      body: Center(
              child: Column(
                children: [
                  Row(children: [
                   Lottie.asset(LottieItems.search.lottiePath,width: 80,height: 80),
                   Padding(
                     padding: const EdgeInsets.only(top : 16.0),
                     child: Text(""" İstediğiniz ilanı aratın,saniyeler içinde 
                     önünüze getirelim!
                    """,style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontSize: 16,fontWeight: FontWeight.w800),),
                   ),
                  ],),
                  Container(
                    padding:  const EdgeInsets.all(20),
                    height: 100,
                    child: TextField(
                      controller: queryController,
                      decoration:  const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "İlanı aratın",
                        prefixIcon: Icon(Icons.search),
                      ),
                      onChanged: (text) {
                        if (text.length >= 2) {
                          setState(() {
                            _query(text);
                          });
                        } else {
                          setState(() {
                            carsByName.clear();
                          });
                        }
                      },
                    ),
                  ),
                  Expanded(
                    child: SizedBox(
                      height: 300,
                      child: ListView.builder(
                        padding: const EdgeInsets.all(6),
                        itemCount: carsByName.length,
                        itemBuilder: (context, index) {
                          return Container(
                            height: 80,
                            margin: const EdgeInsets.all(4),
                            child: Center(
                              child: Row(
                                children: [
                                  Image.file(
                                    File(carsByName[index].imagePath!),height: 100,width: 100,fit: BoxFit.contain,
                                  ),
                                  const SizedBox(width:5),
                                  Text(
                                    "${carsByName[index].name} - ${carsByName[index].miles} miles - ${carsByName[index].price} £",
                                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w700)
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}