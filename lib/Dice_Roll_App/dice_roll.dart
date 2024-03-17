import 'dart:math';
import 'package:brand_assignment/ChargingApp/controller/slider_controller.dart';
import 'package:brand_assignment/widgets/small_text.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

final random = Random();

class DiceRoll extends StatelessWidget {
  DiceRoll({super.key});
  final SliderController controller = Get.put(SliderController());
  // var controller = 2;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 134, 122, 135),
        appBar: AppBar(
          title: const Text("Dice Roller"),
          backgroundColor: Color.fromARGB(255, 88, 94, 97),
          foregroundColor: Colors.white,
          centerTitle: true,
        ),
        body: Obx(
          () => Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: GestureDetector(
                    onTap: () {},
                    child: Image.asset(
                      "assets/images/dice-images/dice-$dice.png",
                      height: 200,
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                InkWell(
                  customBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30)),
                  highlightColor: Color.fromRGBO(155, 39, 176, 0.229),
                  autofocus: true,
                  splashColor: Colors.blue,
                  onTap: () => diceroll(),
                  child: SmallText(
                    text: "Flip dice",
                    // txtcolor: Colors.blue,
                    size: 24,
                  ),
                ),
              ]),
        ));
  }
}
