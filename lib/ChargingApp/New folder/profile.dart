 
import 'package:brand_assignment/widgets/appIcon.dart';
import 'package:brand_assignment/widgets/big_text.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                CircleAvatar(radius: 50, child: Image.asset("name")),
                Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(15)),
                ),
                const SizedBox(height: 20),
                TextField(
                  decoration: InputDecoration(
                    prefixIcon: const AppIcon(
                      backgroundColor: Colors.white,
                      icon: Icons.person,
                      iconColor: Colors.blue,
                    ),
                    //Hint text
                    hintText: "Name",
                    //focus Border
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide:
                            const BorderSide(width: 1.0, color: Colors.white)),
                    //enabled border
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: const BorderSide(
                        width: 1.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                TextField(
                  decoration: InputDecoration(
                    prefixIcon: const AppIcon(
                      backgroundColor: Colors.white,
                      icon: Icons.phone,
                      iconColor: Colors.blue,
                    ),
                    //Hint text
                    hintText: "Phone Number",
                    //focus Border
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide:
                            const BorderSide(width: 1.0, color: Colors.white)),
                    //enabled border
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: const BorderSide(
                        width: 1.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                TextField(
                  decoration: InputDecoration(
                    prefixIcon: const AppIcon(
                      backgroundColor: Colors.white,
                      icon: Icons.email_outlined,
                      iconColor: Colors.blue,
                    ),
                    //Hint text
                    hintText: "Email",
                    //focus Border
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide:
                            const BorderSide(width: 1.0, color: Colors.white)),
                    //enabled border
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: const BorderSide(
                        width: 1.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                TextField(
                  decoration: InputDecoration(
                    prefixIcon: const AppIcon(
                      backgroundColor: Colors.white,
                      icon: Icons.home_outlined,
                      iconColor: Colors.blue,
                    ),
                    //Hint text
                    hintText: "Bio",
                    //focus Border
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide:
                            const BorderSide(width: 1.0, color: Colors.white)),
                    //enabled border
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: const BorderSide(
                        width: 1.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(onPressed: () {}, child: BigText(text: "LogOut"))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
