import 'package:flutter/material.dart';

class BMIScreen extends StatelessWidget {
  BMIScreen({super.key});
  var wtController = TextEditingController();
  var htController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: wtController,
          decoration: InputDecoration(
              hintText: "Enter your weight...",
              prefixIcon: const Icon(Icons.line_weight),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(20))),
        ),
        const SizedBox(height: 15),
        TextField(
          controller: htController,
          decoration: InputDecoration(
              hintText: "Enter your height...",
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
              prefixIcon: Icon(Icons.height)),
        ),
        SizedBox(height: 15),
        ElevatedButton(onPressed:() {
          
        }, child: Text("Save"))

      ],
    );
  }
}
