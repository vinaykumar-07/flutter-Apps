import 'dart:io';
import 'package:brand_assignment/ChargingApp/controller/image_picker_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class ImagePicker extends StatelessWidget {
  ImagePicker({super.key});

  ImagePickerController controller = Get.put(ImagePickerController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Imager Picker"),
          centerTitle: true,
        ),
        body: Obx(
          () => Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 80,
                backgroundImage: controller.imagePath.isNotEmpty
                    ? FileImage(File(controller.imagePath.toString()))
                    : null,
                child: IconButton(
                    onPressed: () {
                      controller.getImage();
                    },
                    icon: const Icon(Icons.camera_alt)),
              ),
            ],
          ),
        ));
  }
}
