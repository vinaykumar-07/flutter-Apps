
 
import 'package:brand_assignment/widgets/big_text.dart';
import 'package:brand_assignment/widgets/small_text.dart';
import 'package:flutter/material.dart';

class ChargingStationDetails extends StatefulWidget {
  const ChargingStationDetails({super.key});

  @override
  State<ChargingStationDetails> createState() => _ChargingStationDetailsState();
}

class _ChargingStationDetailsState extends State<ChargingStationDetails> {
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Scaffold(
          body: SingleChildScrollView(
            // child: FutureBuilder(
            //   future:List<ChargingModel>? ,
              // builder: (context,snapsot) {
                child: Container(
                  alignment: Alignment.topLeft,
                  margin: const EdgeInsets.only(left: 25, right: 25, top: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 20),
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () => Navigator.pop(context),
                            child: CircleAvatar(
                                radius: 20,
                                backgroundColor: Colors.grey[350],
                                child: Icon(
                                  Icons.arrow_back,
                                  size: 30,
                                  color: Colors.black,
                                )),
                          ),
                          const SizedBox(width: 30),
                          SmallText(
                            text: "najret",
                            color: Colors.black,
                            size: 18,
                          ),
                          const SizedBox(width: 145),
                          ElevatedButton(
                            onPressed: () => null,
                            child: const Text("help"),
                            style: ElevatedButton.styleFrom(
                                primary: const Color(0xFF0488F5),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20))),
                          )
                        ],
                      ),
                      SizedBox(height: 10),
                      Container(
                        height: MediaQuery.of(context).size.height * .3,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: const Color(0xFFA87975),
                            image: const DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage("assets/images/img1.jpg"))),
                      ),
                      const SizedBox(height: 20),
                      Row(
                        children: [
                          const Icon(Icons.oil_barrel_sharp),
                          SmallText(text: "EVEE - 001"),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          BigText(text: "Novotel Hotel"),
                          const Icon(Icons.favorite, color: Colors.red),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          const Icon(Icons.location_on),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.8,
                            child: SmallText(
                                text:
                                    "16 Dawson Streat, New Plymouth Central, New  Plymounth 4310, USA  1.4mi"),
                          )
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          const Icon(Icons.watch_later_rounded),
                          SmallText(text: "Open . 24 hours"),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Icon(Icons.bolt_rounded),
                          SmallText(text: "Type 2 . 100KW"),
                          ElevatedButton(
                            onPressed: () => null,
                            style: ElevatedButton.styleFrom(
                                primary: Color(0xFFEBE52B),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20))),
                            child: BigText(
                              text: "Charging",
                              size: 20,
                            ),
                          ),
                          const Icon(Icons.star),
                          SmallText(text: "4.5 (20)")
                        ],
                      ),
                      const SizedBox(height: 10),
                      BigText(text: "\$4.50/KW"),
                      const SizedBox(height: 30),
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                                padding: EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                    border: Border.all(width: 1),
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.white),
                                child: Row(
                                  children: [
                                    const Icon(Icons.navigation),
                                    SmallText(
                                      text: "Navigation",
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ],
                                )),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: Container(
                                padding: EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                    border: Border.all(width: 1),
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.white),
                                child: Row(
                                  children: [
                                    const Icon(Icons.share),
                                    SmallText(
                                      text: "Share",
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ],
                                )),
                          ),
                          const SizedBox(
                            width: 120,
                          )
                        ],
                      ),
                      const SizedBox(height: 10),
                      BigText(text: "About"),
                      const SizedBox(height: 30),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.8,
                        child: SmallText(
                            text:
                                "A 7-minute walk from the wind wand kinetic sculpture, this modest."),
                      ),
                      const SizedBox(height: 120),
                    ],
                  ),
                )
            //   }
            // ),
          ),
        ),
        bottomSheet: Container(
          margin:
              const EdgeInsets.only(left: 10, right: 10, top: 20, bottom: 20),
          height: 60,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: Colors.blue,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: const Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          child: Center(
            child: BigText(
              text: "Charging here",
              color: Colors.white,
            ),
          ),
        )

        // ElevatedButton(
        // onPressed: () => null, child: SmallText(text: "Charge here")),
        );
  }
}
