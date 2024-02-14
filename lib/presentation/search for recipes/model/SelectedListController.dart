import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class SelectedListController extends GetxController{

var dishList = List<String>.empty(growable: true).obs;

var cuisineList = List<String>.empty(growable: true).obs;

var difficultyList = List<String>.empty(growable: true).obs;

var preparationList = List<String>.empty(growable: true).obs;
}