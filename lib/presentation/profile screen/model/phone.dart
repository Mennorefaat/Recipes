import 'package:flutter/foundation.dart';

class Phone {
  // Encapsulation => variables private + functions public
  String name = '';
  String _os = '';
  int _price = 0;

  Phone.android({
    required this.name,
    required int price,
  }) : _price = price {
    _os = "Android";
  }

  Phone.iOS({
    required this.name,
    required int price,
  }) {
    _os = "iOS";
    _price = price;
  }

  String getOperatingSystem(){
    return _os;
  }

  int getPrice(){
    return _price;
  }

  void setPrice(int price){
    if (price < 1) {
      return;
    }
    _price = price;
  }

// setters and getters
  int get price => _price;

  set price(int value) {
    if (price < 1) {
      return;
    }
    _price = value;
  }

  void printData(){
    if (kDebugMode) {
      print('---------------------');
    }
    if (kDebugMode) {
      print('Name : $name');
    }
    if (kDebugMode) {
      print('OS : $_os');
    }
    if (kDebugMode) {
      print('Price : $_price');
    }
    if (kDebugMode) {
      print('---------------------');
    }
  }

  @override
  String toString() {
    return 'Phone{name: $name, _os: $_os, _price: $_price}';
  }
}

