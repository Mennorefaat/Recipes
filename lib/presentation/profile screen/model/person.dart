import 'package:flutter/foundation.dart';

class Person {
  // Global Variable => class
  // Local Variable => function, parameter
  String name = "";
  String age = "";
  String city = "";
  String streetName = "";

  void testLocalVariables(String name3) {
    String name2 = "ALi";
    if (kDebugMode) {
      print(name2);
    }

    if (kDebugMode) {
      print(name3);
    }
  }

  void testVariables(String name){
    // this => global variables
    this.name = name;
  }


  // Constructor
  // 1 : function
  // 2 : no return type
  // 3 : ClassName
  // 4 : called when take an object
  // 5 : body is optional

  // ClassName(){}
  Person({
    required this.name,
    required this.age,
    required this.city,
    required this.streetName,
  }) {
    if (kDebugMode) {
      print('New object from Person class');
    }
    printData();
  }

  Person.male({
    required this.name,
    required this.age,
    required this.city,
    required this.streetName,
  }) {
    if (kDebugMode) {
      print('New object from Person class');
    }
    printData();
  }

  Person.female({
    required this.name,
    required this.age,
    required this.city,
    required this.streetName,
  }) {
    if (kDebugMode) {
      print('New object from Person class');
    }
    printData();
  }



  void printData() {
    if (kDebugMode) {
      print('-----------------');
    }
    if (kDebugMode) {
      print('Name : $name');
    }
    if (kDebugMode) {
      print('Age : $age');
    }
    if (kDebugMode) {
      print('City : $city');
    }
    if (kDebugMode) {
      print('Street Name : $streetName');
    }
  }
}
