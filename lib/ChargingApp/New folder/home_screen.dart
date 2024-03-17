
 
import 'package:brand_assignment/ChargingApp/New%20folder/charging_station_list.dart';
import 'package:brand_assignment/ChargingApp/New%20folder/explore.dart';
import 'package:brand_assignment/ChargingApp/New%20folder/slider.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 2;
  List pages = [
    ExplorePage(),
    SliderScreen(),
    ChargingStationList(),
    // Signup(),
    // Profile(),
  ];
  void onTapNav(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: selectedIndex,
          fixedColor: Colors.green,
          showUnselectedLabels: true,
          backgroundColor: Colors.green,
          // selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.black,
          onTap: onTapNav,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.menu_book_rounded), label: "Explore"),
            BottomNavigationBarItem(
                icon: Icon(Icons.payment), label: "Payment"),
            BottomNavigationBarItem(
                icon: Icon(Icons.qr_code_scanner_rounded), label: "Scan"),
            BottomNavigationBarItem(
                icon: Icon(Icons.notifications), label: "Notification"),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
          ]),
    );
  }
}
