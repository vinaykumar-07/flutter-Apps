import 'dart:convert';

import 'package:brand_assignment/ChargingApp/New%20folder/charging_station_details.dart';
import 'package:brand_assignment/ChargingApp/model/charging_model.dart';
import 'package:brand_assignment/widgets/big_text.dart';
import 'package:brand_assignment/widgets/small_text.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ChargingStationList extends StatefulWidget {
  const ChargingStationList({Key? key}) : super(key: key);

  @override
  State<ChargingStationList> createState() => _ChargingStationState();
}

class _ChargingStationState extends State<ChargingStationList> {
  List<ChargingModel> chargingModel = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  // API for fetching  charging Station data
  Future<List<ChargingModel>> fetchData() async {
    String baseUrl = 'https://mocki.io/v1/d86221e4-6755-4666-96ba-bf88b61a3cdc';
    final response = await http.get(Uri.parse(baseUrl));
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      for (Map<String, dynamic> indix in data) {
        chargingModel.add(ChargingModel.fromJson(indix));
      }
      return chargingModel;
    } else {
      throw Exception('faild to load Charging Station');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        margin: const EdgeInsets.only(top: 30, left: 10, right: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 30),
            Material(
              borderRadius: BorderRadius.circular(20),
              borderOnForeground: true,
              elevation: 1,
              child: Container(
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(width: 1, color: Colors.grey),
                ),
                child: const Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Icon(Icons.search),
                    ),
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'location Charging Station',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10),
            BigText(text: "Nearby Charger (24)"),
            const SizedBox(height: 10),
            Expanded(
              child: FutureBuilder(
                  future: fetchData(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(child: const CircularProgressIndicator());
                    } else if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}');
                    } else {
                      return ListView.builder(
                          itemCount: chargingModel.length,
                          itemBuilder: (context, Index) {
                            final status = chargingModel[Index].status;
                            final avilability = status == 'AVAILABLE';
                            return Container(
                              height: 150,
                              width: double.infinity,
                              margin: const EdgeInsets.only(
                                  top: 0, bottom: 10, left: 10, right: 10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                    spreadRadius: 2.0,
                                    blurRadius: 1,
                                    color: Colors.grey.shade200,
                                  )
                                ],
                                color: Colors.white,
                              ), // Adjust the spacing
                              child: Row(children: [
                                Expanded(
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const ChargingStationDetails()),
                                      );
                                    },
                                    child: Container(
                                      width: 50,
                                      height:
                                          MediaQuery.of(context).size.height,
                                      margin: const EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                          border: Border.all(width: 1),
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          image: const DecorationImage(
                                              fit: BoxFit.cover,
                                              image: AssetImage(
                                                "assets/images/img.jpg",
                                              ))),
                                    ),
                                  ),
                                ),
                                Container(
                                  margin:
                                      const EdgeInsets.only(top: 10, right: 10),
                                  width:
                                      MediaQuery.of(context).size.width * .45,
                                  decoration:
                                      const BoxDecoration(boxShadow: []),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SmallText(
                                        text: chargingModel[Index].evseId,
                                        color: Colors.black87,
                                      ),
                                      const SizedBox(height: 10),
                                      BigText(text: "Novotel Hotel"),
                                      const SizedBox(height: 10),
                                      SmallText(text: 'Newpymonth 4310 .1.4mi'),
                                      const SizedBox(height: 10),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          SmallText(text: "Type 2 . 100KW"),
                                          ElevatedButton(
                                              onPressed: () {},
                                              style: ButtonStyle(
                                                  backgroundColor: avilability
                                                      ? const MaterialStatePropertyAll(
                                                          Colors.amberAccent)
                                                      : const MaterialStatePropertyAll(
                                                          Colors.blue)),
                                              child: SmallText(
                                                  text: chargingModel[Index]
                                                      .status))
                                        ],
                                      )
                                    ],
                                  ),
                                )
                              ]),
                            );
                          });
                    }
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
