import 'package:db_example/constants/project_colors.dart';
import 'package:db_example/models/car.dart';
import 'package:db_example/views/myhomepage.dart';
import 'package:db_example/utils/dbhelper.dart';
import 'package:flutter/material.dart';
import 'dart:io';

class TabBarList extends StatefulWidget {
  const TabBarList({super.key});

  @override
  State<TabBarList> createState() => _TabBarListState();
}

class _TabBarListState extends State<TabBarList> {
  List<Car> cars = [];
  final String guncelleText = "Güncelle";
  final String fiyatText = "Fiyat";
  final String milText = "Mil";
  final String buttonText = "Satıcıyla iletişime geç";

  final dbHelper = DatabaseHelper.instance;

  _showMessageInScaffold(String message) {
    return SnackBar(content: Text(message));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ProjectColors.projectCustomWhiteColor,
      child: ListView.builder(
        padding: Paddings.allPadding,
        itemCount: cars.length + 1,
        itemBuilder: (context, index) {
          if (index == cars.length) {
            return ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(150, 30),
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  backgroundColor: ProjectColors.projectPrimaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () {
                  setState(() {
                    _queryAll();
                  });
                },
                child: Text(
                  guncelleText,
                  style:
                      const TextStyle(color: ProjectColors.projectWhiteColor),
                ));
          }
          return Padding(
            padding: const EdgeInsets.only(top: 12.0),
            child: Container(
              //başlangıç
              width: double.infinity,
              height: 260,
              decoration: BoxDecoration(
                color: ProjectColors.projectPrimaryColor,
                borderRadius: BorderRadius.circular(22),
              ),
              margin: const EdgeInsets.all(5),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(0),
                      bottomRight: Radius.circular(0),
                      topLeft: Radius.circular(12),
                      topRight: Radius.circular(12),
                    ),
                    child: Image.file(
                      File(cars[index].imagePath!),
                      width: double.infinity,
                      height: 160,
                      fit: BoxFit.cover,
                      filterQuality: FilterQuality.high,
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(16, 12, 16, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          flex: 7,
                          child: Text(
                            "${cars[index].name}",
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium
                                ?.copyWith(
                                    fontSize: 16, fontWeight: FontWeight.w800),
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: Text(
                            "$fiyatText : ${cars[index].price} £",
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium
                                ?.copyWith(
                                    fontSize: 14, fontWeight: FontWeight.w800),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(16, 4, 0, 12),
                    child: Row(
                      children: [
                        Text(
                          "$milText : ${cars[index].miles}",
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium
                              ?.copyWith(
                                  fontSize: 14, fontWeight: FontWeight.w700),
                        ),
                        const Spacer(),
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    ProjectColors.projectCustomWhiteColor,
                                elevation: 5,
                                padding: const EdgeInsets.only(
                                    top: 4, bottom: 4, right: 10, left: 10)),
                            onPressed: () {},
                            child: Text(
                              buttonText,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(
                                      fontWeight: FontWeight.w800,
                                      color: ProjectColors.projectPrimaryColor),
                            ))
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  void _queryAll() async {
    final allRows = await dbHelper.queryAllRows();
    cars.clear();
    allRows.forEach((row) => cars.add(Car.fromMap(row)));
    _showMessageInScaffold("Başarılı");
    setState(() {});
  }
}
