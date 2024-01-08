import 'package:db_example/utils/dbhelper.dart';

class Car {
  int? id;
  String? name;
  int? miles;
  int? price;
  String? imagePath;
  

  Car(this.id,this.name,this.miles,this.price,this.imagePath);


  Car.fromMap(Map<String,dynamic> map) {
    id = map["id"];
    name = map["name"];
    miles = map["miles"];
    price = map["price"];
    imagePath = map["imagePath"];
  
  }

  Map<String,dynamic> toMap() {
    return {
    DatabaseHelper.columnId : id,
    DatabaseHelper.columnName : name,
    DatabaseHelper.columnMiles : miles,
    DatabaseHelper.columnPrice : price,
    DatabaseHelper.columnImagePath : imagePath,
    
    };
  }
}