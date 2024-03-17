// import 'dart:convert';
// import 'package:assignment/model/charging_model.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;

// class ExplorePage extends StatefulWidget {
//   const ExplorePage({super.key});

//   @override
//   State<ExplorePage> createState() => _ExplorePageState();
// }

// class _ExplorePageState extends State<ExplorePage> {
//   List<ChargingModel> chargingModel = [];

//   @override
//   void initState() {
//     super.initState();
//     fetchDat();
//   }

//   Future<List<ChargingModel>> fetchDat() async {
//     final response = await http.get(
//         Uri.parse('https://mocki.io/v1/d86221e4-6755-4666-96ba-bf88b61a3cdc'));
//     if (response.statusCode == 200) {
//       var data = json.decode(response.body);
//       for (Map<String, dynamic> index in data) {
//         chargingModel.add(ChargingModel.fromJson(index));
//       }
//       return chargingModel;
//     } else {
//       throw Exception(
//           'Failed to load data. Status code: ${response.statusCode}');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       child: Center(
//         // child: Text("chargingModel[Index].evseName"),
//         child: chargingModel != null
//             ? ListView.builder(
//                 itemCount: 1,
//                 itemBuilder: (context, index) {
//                   return Container(
//                     child: Text(chargingModel[index].uid),
//                   );
//                 },
//               )
//             : CircularProgressIndicator(), // Show a loading indicator while fetching data
//       ),
//     );
//   }
// }

import 'package:brand_assignment/ChargingApp/controller/counter_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart'; 

class ExplorePage extends StatelessWidget {
   
  final Counter controller = Get.put(Counter());

   ExplorePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("counter app"),
        centerTitle: true,
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,

        // child: Obx(() => Text("The counter value is ${controller.conter.toString()}"))

        child: GetBuilder<Counter>(builder: (controller) {
          return Text("the counter item is ${controller.conter.toString()} ");
        }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          controller.increment();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
