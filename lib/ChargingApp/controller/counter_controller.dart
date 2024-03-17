import 'package:get/get.dart';

class Counter extends GetxController {
  RxInt conter = 1.obs;
  increment() {
    conter.value++;
    print(conter.value);
  }
}
