import 'dart:math';
import 'package:get/get.dart';

class SliderController extends GetxController {
// controller for switch button
  final notification = false.obs;
  onChange(value) {
    notification.value = value;
    if (value == true)
      print("on");
    else
      print("off");
  }

// controller for slider container box
  RxDouble slider = 0.9.obs;
  increment(double value) {
    slider.value = value;
    if (value == 0)
      print("Light color");
    else if (value == 1) print("Bright color");
  }

  //controller for fruites lists
  List<String> fruits =
      ["mango", "bananna", "apple", "pineaple", "gavava", "orange"].obs;
  List<dynamic> favlist = [].obs;

  onadd(String value) {
    favlist.add(value);
    update();
    print("add, ${value}");
  }

  onremove(String value) {
    favlist.remove(value);
    update();
    print("Remove ${value}");
  }
}

//controller for Dice roll

var dice = 2.obs;

void diceroll() {
  dice.value = (Random().nextInt(6) + 1);
  print(dice.toString());
}
