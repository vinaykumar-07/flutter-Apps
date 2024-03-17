
import 'package:brand_assignment/ChargingApp/controller/slider_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SliderScreen extends StatelessWidget {
  SliderScreen({super.key});
  final SliderController controller = Get.put(SliderController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.green[100],
        appBar: AppBar(
          title: Text("Slider Screen with Opacity"),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
                Text(
                  "Hay, geek play with switch button",
                  style: TextStyle(fontSize: 20),
                ),
                Obx(
                  () => Switch(
                      value: controller.notification.value,
                      onChanged: (value) {
                        controller.onChange(value);
                      }),
                ),
              ]),
              Obx(
                () => Container(
                  height: 200,
                  width: 200,
                  color: Colors.redAccent
                      .withOpacity(controller.slider.toDouble()),
                ),
              ),
              Obx(
                () => Slider(
                    value: controller.slider.value,
                    onChanged: ((value) {
                      controller.increment(value);
                    })),
              ),
              GetBuilder<SliderController>(builder: (controller) {
                return ListView.builder(
                  itemCount: controller.fruits.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Card(
                        elevation: 1,
                        margin: EdgeInsets.all(5),
                        child: ListTile(
                          onTap: () {
                            if (controller.favlist
                                .contains(controller.fruits[index])) {
                              controller.onremove(controller.fruits[index]);
                            } else {
                              controller.onadd(controller.fruits[index]);
                            }
                          },
                          title: Text(controller.fruits[index].toString()),
                          trailing: Icon(
                            Icons.favorite,
                            color: controller.favlist
                                    .contains(controller.fruits[index])
                                ? Colors.red
                                : Colors.grey[300],
                          ),
                        ));
                  },
                );
              }),
            ],
          ),
        ));
  }
}
